%% Simulate growth of S. elongatus to recreate Figure 2 in the main text
% Jared Broddrick 09/29/16

close all
clear all

initCobraToolbox

% load model
load('Model_iJB785.mat');

model = iJB785; 

%% Model preparation

% Suggested non-network constraints from supplemental material
C1_non_network_constraints
% Set media
% BG-11 at 100mL total volume
C2_media_BG11
% Set photon uptake constraints
C3_photon_constraints
%% Additional initializing values
% 2% of the culture volume in each ring
vol = [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2];
% initial mgDW of inoculation in a 100mL flask
iDW = 7.1; 
%area used for photon delivery
xsec = 54.3;
% relative volume
rv = vol./100;

results = []; %initialize the results variable
%% Execute the simulation of self-shading
S1_self_shading
self = results;
%% Execute the simulation of no-shading
results = [];
S2_no_shading
%% Plot self-shading
plot_results
