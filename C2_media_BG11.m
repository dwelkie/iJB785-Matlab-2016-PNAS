%% Set media to BG-11
% % Jared Broddrick 09/29/16

% BG-11 at 100mL total volume
% # media BG-11
% # BG-11
% # NaNO3:   17.6 mM     MgSO4:         0.3 mM
% # K2HPO4:  0.23 mM     citrate:       0.031 mM
% # CaCl2:   0.24 mM     FeNH4 citrate: 0.024 mM citrate, 0.031 mM ammonia,
%                                       0.010 mM Fe3 (based on 9% amm, 16%
%                                       Fe and 75% citrate
% # Na2EDTA: 0.0027 mM   Na2CO3:        0.19 mM
% # Trace solution: 1000x
% # H3BO3:   46 mM       MnCl2:         9mM
% # ZnSO4:   0.77 mM     Na2MoO4:       1.6mM
% # CuSO4:   0.3 mM      Co(NO3)2:      0.17 mM
% open up all exchange reaction so that products can be released
ex_r = strmatch('EX_',model.rxns);
for i = 1:length(ex_r)
    model.lb(ex_r(i)) = 0;
    model.ub(ex_r(i)) = 1000;
end
rxns = {'EX_h2o_e';'EX_o2_e';'EX_co2_e';'EX_cobalt2_e';'EX_zn2_e';'EX_so4_e';'EX_ca2_e';'EX_nh4_e';'EX_mn2_e';'EX_hco3_e';'EX_mg2_e';'EX_cu2_e';'EX_k_e';'EX_no3_e';'EX_fe3_e';'EX_mobd_e';'EX_na1_e';'EX_h_e';'EX_pi_e'};
bound = [-1000;-1000;-1000;-1.70000000000000e-05;-7.70000000000000e-05;-0.0300000000000000;-0.0240000000000000;-0.00310000000000000;-0.000900000000000000;-0.0190000000000000;-0.0300000000000000;-3.00000000000000e-05;-0.0460000000000000;-1.76000000000000;-0.00200000000000000;-0.000160000000000000;-1.79854000000000;-1000;-0.0230000000000000];
for i = 1:length(rxns)
    index = strmatch(rxns{i},model.rxns,'exact');
    model.lb(index)=bound(i);
end