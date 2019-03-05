%% Suggested constraints for growth in continuous light
% Jared Broddrick 09/29/16
% 1) couple flux between transketolase and phophoketolase to make PDH
% essential
model.S(end+1,:) = 0;
model.b(end+1) = 0;
model.mets{end+1} = 'pkcc';
model.metNames{end+1} = 'Transketolase/Phosphoketolase coupling constraint';
model.csense(end+1) = 'G'; % such that 0.01*vTKT2 - vPKETF(or PKETX) >= 0
tkt2 = findRxnIDs(model,'TKT2');
pkf = findRxnIDs(model,'PKETF');
pkx = findRxnIDs(model,'PKETX');
model.S(end,pkf) = -1;
model.S(end,pkx) = -1;
model.S(end,tkt2) = -0.01;
model = addDemandReaction(model,'pkcc');
% 2) make VPAMTr irreversible towards alanine, forces use of GLUSfx
vpamt = findRxnIDs(model,'VPAMTr');
model.lb(vpamt)=-1000;
model.ub(vpamt)=0;
%3) transhydrogenase carries no flux
model = changeRxnBounds(model,'NADTRHD',0,'b');
%4) set transaldolase as irreversible towards e4p/f6p
model = changeRxnBounds(model,'TALA',0,'l');
%5) ornitine transaminase carries no flux; based on essentiality of proline and asparagine biosynthetic pathways
model = changeRxnBounds(model,'ORNTA',0,'b');
%6) CYOOum carries no flux
model = changeRxnBounds(model,'CYOOum',0,'b');
%7) LDH_D irrev way from pyruvate
model = changeRxnBounds(model,'LDH_D',0,'u');