function [X,gr] = computing_ridge_grav(D1,D2,rho_s)


n = 512; % grid refinement
Lx = 1e5; % length of x domain in m
Ly = 1e7; % length of y domain in m
x = linspace(-Lx/2,Lx/2,n);
y = linspace(-Ly/2,Ly/2,n);

kx = (-n/2:n/2-1)/Lx;

sigma = 10*1000; % m
g = 9.82; % gravitational acceleration (m s^-2)
G = 6.67e-11; % gravitational constant, (m^3 kg^-1 s^-2)
d = 6*1000;
rho_w = 1025;
rho_c = 2800;
rho_m = 3330;
s = 6.2*1000;

[X,Y] = meshgrid(x,y);

b = (2*1000)*exp(-(X.^2)/(2*sigma^2)); % where 2 km is the height of the ridge

figure
hold on
surf(X,Y,b)
shading flat
xlabel('x','Interpreter','latex','FontSize',18)
ylabel('y','Interpreter','latex','FontSize',18)
zlabel('z','Interpreter','latex','FontSize',18)
title('Gaussian ridge','Interpreter','latex','FontSize',18)
view(3)
colormap default

B = fftshift(fft2(fftshift(b)));

k = kx;
R1 = 1./(1 + D1*abs(k).^4./(g*(rho_m-rho_c)));
R2 = 1./(1 + D2*abs(k).^4./(g*(rho_m-rho_s)));

Q2 = 2*pi*G*exp(-abs(k)*s) .* ( (rho_c - rho_s) + exp(-abs(k)*d).*(rho_m - rho_c).*(1+R2*(rho_s-rho_w)./(rho_m-rho_s)).^(-1).*(R2.*(rho_s-rho_w)/(rho_m-rho_s) - R1.*(rho_c-rho_w)./(rho_m-rho_c)));
GR = Q2.*B;
gr = ifftshift(ifft2(fftshift(GR)));

figure
surf(X,Y,gr)
shading flat
xlabel('$x$','Interpreter','latex','FontSize',18)
ylabel('$y$','Interpreter','latex','FontSize',18)
zlabel('$g(\mathbf{x}) \ (m/s^2)$','Interpreter','latex','FontSize',18)
title(['Gravity anomaly, $D_1 =$ ' num2str(D1) ', $D_2 =$ ' num2str(D2)],'Interpreter','latex','FontSize',18)
colormap default

end