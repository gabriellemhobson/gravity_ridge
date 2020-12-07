% HW 7 Coding

% Gravity anomaly of a sediment covered ridge

clear all; close all;

% lambda_f1 = 5*1000; % flexural wavelength (m)
% lambda_f2 = 30*1000; % flexural wavelength (m)
%D1 = 1.8e21; % flexural rigidity (N m)
%D2 = 3.2e23; % flexural rigidity (N m)

E = 6.5e10; % N m^-2
he1 = 5*1000; % m
he2 = 30*1000; % m
% he1 = 5*1000;
%he2 = 100*1000;
sigma = 0.25;
D1 = E*he1^3/(12*(1-sigma^2));
D2 = E*he2^3/(12*(1-sigma^2));


% cStart = [0.6745 0.8627 0.9882];
% cEnd = uisetcolor([0.8 0.0 0],'Select an end color');
% c = interp1([1;500],[cStart;cEnd],(1:500)');

% rho_s = 2300; % kg m^-3
rho_s = 2300; 
[X,gr] = computing_ridge_grav(D1,D2,rho_s);

% %%%%%%%%
% videoname = 'varying_D1';
% v = VideoWriter(videoname);
% v.FrameRate = 10;
% v.Quality = 100;
% open(v)
% %%%%%%%%
% 
% figure(1)
% D1 = [1.0e20:0.4e21:2.0e23];
% for i = 1:length(D1)
%     close(figure(2))
%     close(figure(3))
%     [X,gr] = computing_ridge_grav(D1(i),D2,rho_s);
%     figure(1)
%     xlabel('x','Interpreter','latex','FontSize',18)
%     ylabel('y','Interpreter','latex','FontSize',18)
%     title('Gravity anomaly as D1 increases from 1.0 x $10^{20}$ to 1.0 x $10^{23}$','Interpreter','latex','FontSize',18)
%     hold on
%     plot(X(length(X)/2,:),gr(length(gr)/2,:),'Color',c(i,:))
%     ylim([-2e18 2e18])
%     view(2)
%     %%%%%%%%
%     F=getframe(gcf);
%     writeVideo(v,F)
% end
% 
% figure(1)
% 
% close(v)

% % 
% %%%%%%%%
% videoname = 'varying_D2';
% v = VideoWriter(videoname);
% v.FrameRate = 10;
% v.Quality = 100;
% open(v)
% %%%%%%%%
% 
% cStart = [0.6745 0.8627 0.9882];
% cEnd = uisetcolor([0.8 0.0 0],'Select an end color');
% c = interp1([1;1000],[cStart;cEnd],(1:1000)');
% 
% 
% figure(1)
% D2 = [1.0e22:1e22:1.0e25];
% for i = 1:length(D2)
%     close(figure(2))
%     close(figure(3))
%     [X,gr] = computing_ridge_grav(D1,D2(i),rho_s);
%     figure(1)
%     hold on
%     plot(X(length(X)/2,:),gr(length(gr)/2,:),'Color',c(i,:))
%     view(2)
%     xlabel('x','Interpreter','latex','FontSize',18)
%     ylabel('y','Interpreter','latex','FontSize',18)
%     title('Gravity anomaly as D2 increases from 1.0 x $10^{22}$ to 1.0 x $10^{25}$','Interpreter','latex','FontSize',18)
%     ylim([-5.5e18 2.5e18])
%     %%%%%%%%
%     F=getframe(gcf);
%     writeVideo(v,F)
% end
% 
% close(v)

% 
% 
