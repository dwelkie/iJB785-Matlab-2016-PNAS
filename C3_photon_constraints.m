%% Photon constraints
% This file assigns the optical absorption cross-section, the chlorophyll a
% composiiton of the biomass and the spectral irradiance.
% Jared Broddrick 09/29/16


% a is a*(bin) = optical absorption cross-section of the 20nm bin
% normalized to mg chl a; units: cm^2/mg ChlA

oabxc = [460.700000000000,598.900000000000,565.500000000000,415.200000000000,352.900000000000,277.700000000000,157.300000000000,124.300000000000,146.800000000000,193.200000000000,263.700000000000,335.800000000000,269,303.600000000000,267.700000000000];
% mean = [460.700000000000,598.900000000000,565.500000000000,415.200000000000,352.900000000000,277.700000000000,157.300000000000,124.300000000000,146.800000000000,193.200000000000,263.700000000000,335.800000000000,269,303.600000000000,267.700000000000]
% ub95 = [495.500000000000,645.300000000000,608.300000000000,446.400000000000,379.300000000000,298.600000000000,169.300000000000,133.800000000000,157.700000000000,207.900000000000,285.200000000000,364,291.200000000000,328,289.300000000000]
% lb95 = [425.900000000000,552.500000000000,522.600000000000,384,326.400000000000,256.800000000000,145.300000000000,114.900000000000,135.900000000000,178.500000000000,242.300000000000,307.600000000000,246.900000000000,279.100000000000,246]
disp('Optical absorption cross section')
disp('     nm         a*');
bins = [410;430;450;470;490;510;530;550;570;590;610;630;650;670;690];
disp([bins,oabxc']);
% Get chla composition of the biomass in mg Chla/1000 mg biomass
% Chla as a percent of pigments
r = strmatch('BM_PIGMENTS',model.rxns,'exact');
m1 = strmatch('cholphya_c',model.mets,'exact');
[~,~,chla_stoich] = find(model.S(m1,r));
chla = chla_stoich*893.4861/1000;% umol chla * umol/mg
% get pigments as a percent of biomass
r = strmatch('BOF',model.rxns,'exact');
m2 = strmatch('bm_pigm_c',model.mets,'exact');
[~,~,pigm] = find(model.S(m2,r));
a = oabxc.*(chla*pigm);

% Relative spectral distribution of Octron 741 4100K 32W light source
relArea = [0.0334,0.0931,0.0427,0.0400,0.0750,0.0238,0.0424,0.2089,0.0675,0.1089,0.1601,0.0595,0.0213,0.0141,0.0093];
conv = 60*60/10000; %converts photon flux from umol/(m2*s) to umol/(cm2*h)
irrad = [68]; %irradiance in uE
str_to_print = strcat('Irradiance: ',num2str(irrad));
disp(str_to_print);
pfd = relArea.*(conv);
% photon absorbtion rate = a*(bin) x photon flux density
pha = a.*pfd; %umol photons/(mgDW*h)
% xphr are exchange photon reactions
xphr = {'EX_photon410_e', 'EX_photon430_e', 'EX_photon450_e', 'EX_photon470_e', 'EX_photon490_e', 'EX_photon510_e', 'EX_photon530_e', 'EX_photon550_e', 'EX_photon570_e', 'EX_photon590_e', 'EX_photon610_e', 'EX_photon630_e', 'EX_photon650_e', 'EX_photon670_e', 'EX_photon690_e'};
