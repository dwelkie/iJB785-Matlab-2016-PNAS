load('Model_iJB785.mat');
% This loads the model
model = iJB785;
% This assignes the model to the variable 'model'

% To solve:
solution = optimizeCbModel(model)
% Solution contains the 2 info:
% x= fluxes of each reaction 
% f = value of the objective reaction "e.g. biomass = growth rate"
% y/w = ignore
% stat is feasibility, 1 is feasible

% to change objecive
%%%% This is a problem v
 model2 = changeObjective(model, model.rxnNames, 'ATPS');

% Knockout, set rxn bounds to 0
%%%% This is a problem v
genes = {'Synpcc7942_0567'};
[ratio,muKO,muWT,~,~]=singleGeneDeletion(model,'FBA',genes)

% Manual deletion = change rxn bounds to 0
% 'b' sets upper and lower bounds to 0
%%% This works v
rxn_list = {'CYOOum'};
model3 = changeRxnBounds(model,rxn_list,0,'b');

