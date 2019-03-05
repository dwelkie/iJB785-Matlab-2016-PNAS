%% Calculates self-shading growth rate


for z = 1:length(irrad) % If more than one irradiance is to be simulated
    % Reset media for new simulation at new irradiance
    ex_r = strmatch('EX_',model.rxns);
    for i = 1:length(ex_r)
        model.lb(ex_r(i)) = 0;
        model.ub(ex_r(i)) = 1000000;
    end
    rxns = {'EX_h2o_e';'EX_o2_e';'EX_co2_e';'EX_cobalt2_e';'EX_zn2_e';'EX_so4_e';'EX_ca2_e';'EX_nh4_e';'EX_mn2_e';'EX_hco3_e';'EX_mg2_e';'EX_cu2_e';'EX_k_e';'EX_no3_e';'EX_fe3_e';'EX_mobd_e';'EX_na1_e';'EX_h_e';'EX_pi_e'};
    bound = [-1000;-1000;-1000;-1.70000000000000e-05;-7.70000000000000e-05;-0.0300000000000000;-0.0240000000000000;-0.00310000000000000;-0.000900000000000000;-0.0190000000000000;-0.0300000000000000;-3.00000000000000e-05;-0.0460000000000000;-1.76000000000000;-0.00200000000000000;-0.000160000000000000;-1.79854000000000;-1000;-0.0230000000000000];
    bound = bound*1000;
    for i = 1:length(model.rxns)
        model.lb(i) = model.lb(i)*1000;
        model.ub(i) = model.ub(i)*1000;
    end
    for i = 1:length(rxns)
        index = strmatch(rxns{i},model.rxns,'exact');
        model.lb(index)=bound(i);
    end

    % set interval spacing in hours
    hours = linspace(1,240,240);
    gDW = iDW; %Set the initial biomass at incoulation
    plot_me = []; %initialize variable for plotting
    plot_me = [plot_me;iDW];
    % initialize variables for output
    biomass = []; % biomass production over the simulation interval
    biomass = [biomass;iDW];

    for i = 1:length(hours)
        h = 1; %Time interval of simulation in hours
        tpbm = 0; %initialize a variable to collect the biomass from each slice
        tppi = 0; %initialize a variable to collect the phosphate uptake from each slice
        atten = zeros(1,length(xphr)); % initializes the variable to take light attenuation into account
        for s = 1:length(vol)
            sDW = rv(s)*gDW; %sets proportion of biomass in the current slice
            spha = pha.*(sDW*irrad(z)*h); %sets photon absorption rate for the slice
            sphd = pfd.*(xsec*irrad(z)*h); %sets photon delivery rate for the slice
            
            % adjust for attenuation
            for at = 1:length(sphd)
                initial = sphd(at);
                atvalue = atten(at);
                sphd(at) = sphd(at)+atten(at);
            end

            % set all negative values to 0 photon delivery
            for si = 1:length(sphd)
                in = sphd(si);
                if in < 0
                    sphd(si) = 0;
                end
            end

            %General constraints
            
            %Maintenance
            model = changeRxnBounds(model,'NGAM',(0.071*h*sDW),'l'); %non-growth associated maintenance
            %Carbon uptake
            cup = -2.0*sDW*h; %CO2 uptake, arbitrary, high value
            bicup = -2.0*sDW*h; % Bicarb uptake, arbitrary, high value
            model = changeRxnBounds(model,'EX_co2_e',cup,'l');
            model = changeRxnBounds(model,'EX_hco3_e',bicup,'l');
            %O2 evolution, P(I)=Ps(1-e^(-a*I/Ps))*e^(-BI/Ps) Platt fitting of
            %O2 evolution; Ps = 153, a = 1.42, B = 9.3E-14, I = irradiance
            o2rate =  153*(1-exp(-1.42*irrad(z)/153))*(exp(-9.3E-14*irrad(z)/153));
            o2evo = o2rate*sDW*h*(10/1000); %Chl a is 1% of biomass
            model = changeRxnBounds(model,'EX_o2_e',o2evo,'u');
            % PSII max rate = 700umol O2/(mgChlA*hr)
            psii_max = 7*sDW*h;
            model = changeRxnBounds(model,'PSIIum',psii_max,'u');
            % Set photon exchange bounds
            for r = 1:length(xphr)

                if spha(r) < (sphd(r))
                    model = changeRxnBounds(model,xphr{r},spha(r)*-0.9999,'u');
                    model = changeRxnBounds(model,xphr{r},spha(r)*-1,'l');
                else
                    model = changeRxnBounds(model,xphr{r},sphd(r)*-0.9999,'u');
                    model = changeRxnBounds(model,xphr{r},sphd(r)*-1,'l');
                end

            end
            model = changeObjective(model,'BOF'); %Set objective to max growth
            solution = optimizeCbModel(model);
            % collect biomass, update attenuated light and pi usage
            if solution.stat == 1
                tpbm = tpbm+solution.f;
                % account for phosphate fixed into biomass
                phos = strmatch('EX_pi_e',model.rxns);
                vals = solution.x(phos);
                tppi = tppi+vals;
            else
                tpbm = tpbm+0;
                % account for phosphate fixed into biomass
                tppi = tppi+0;
            end
            % Account for light attenuation for the next round
            for r = 1:length(xphr)
                rxn = findRxnIDs(model,xphr{r});
                flux = model.lb(rxn);
                atten(r)=atten(r)+flux;
            end

        end
        % update gDW with the sum of the biomass from all slices
        gDW = gDW+tpbm;
        biomass = [biomass;gDW];
        %update phosphate bounds 
        new_bound = model.lb(phos)-tppi;
        if new_bound > 0
            new_bound = 0;
        end
        plot_i = linspace(24,240,10);
        if ismember(i,plot_i)
            plot_me = [plot_me;gDW];
        end
        model = changeRxnBounds(model,'EX_pi_e',new_bound,'l');
        [i,gDW,new_bound];
        
        end
        results = [results,biomass];
end