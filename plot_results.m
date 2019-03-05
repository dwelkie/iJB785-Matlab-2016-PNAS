%% Plot shading and non-shading growth curves
% Jared Broddrick 09/29/16

figure('position',[50 50 400 600])
% Plot self-shading
subplot(2,1,1)
hold on
plot(0:240,self, 'k--' ,'LineWidth' ,2)
title('Self-shading','FontSize',12,'FontWeight','bold')
xlabel('time (hours)')
ylabel('biomass (mgDW)')
% Format
set(gca,'YTick',0:5:max(max(self)*1.1));
set(gca,'XTick',0:24:((length(self))));
set(gca,'FontSize',8)
set(gca,'Box','off');
set(gca,'TickDir','out');
% Plot no shading
subplot(2,1,2)
hold on
no_shade_x = linspace(0.1,240,2400);
no_shade_x = [0,no_shade_x];
plot(no_shade_x,results','b-','LineWidth',3)
title('No shading','FontSize',12,'FontWeight','bold')
xlabel('time (hours)')
ylabel('biomass (mgDW)')
% Format
set(gca,'YTick',0:5:max(max(results)*1.1));
set(gca,'XTick',0:24:((length(results)/10)));
set(gca,'FontSize',8)
set(gca,'Box','off');
set(gca,'TickDir','out');
