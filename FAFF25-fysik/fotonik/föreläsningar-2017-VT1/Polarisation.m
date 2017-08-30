clear all;

c=2.9979e6;         % Ljusets hastighet i vakuum
lambda = 500e-9;    % Våglängd
f = c/lambda;       % Frekvens
w = 2*pi*f;         % Vinkelfrekvens/hastighet
k = 2*pi/lambda;    % Vågtal
E0 = 1;             % Vågens amplitud

t = linspace(0, 5/f, .5e3+1);         % Tidsrymd
x = linspace(-3, 3, 1e3)*lambda;    % Longitudinel utsträckning

theta = pi/4;        % Vinkel i y-z-planet
alpha = pi/2;        % Fasskillnad mellan komposanterna   

yy = [];
zz = [];

for i = 1:length(t)
    Ey = E0*sin(w*t(i)-k*x+alpha)*cos(theta);
    Ez = E0*sin(w*t(i)-k*x)*sin(theta);

    %% Rita upp vågen!
    figure(1);
    subplot(121)
    hold off
    plot3(x*1e6, Ey, Ez, 'LineWidth', 2, 'Color', PlotColors(2));
    grid on
    axis([min(x)*1e6 max(x)*1e6 -E0*1.1 E0*1.1 -E0*1.1 E0*1.1])
    xlabel('$$x   \, \mathrm{[\mu m]} $$','Interpreter', 'latex');
    ylabel('$$E_y \, \mathrm{[arb. units]} $$','Interpreter', 'latex');
    zlabel('$$E_z \, \mathrm{[arb. units]} $$','Interpreter', 'latex');
    
    subplot(122)
    hold off
    yy = [yy Ey(find(t>0,1))];
    zz = [zz Ez(find(t>0,1))];
    plot(yy, zz, 'LineWidth', 2, 'Color', [1 1 1]*0.4);
    hold on
    plot([0 yy(end)], [0 zz(end)], '-x', 'LineWidth', 3, ...
        'MarkerSize', 2, 'Color', PlotColors(2));
    xlabel('$$E_y \, \mathrm{[arb. units]} $$','Interpreter', 'latex');
    ylabel('$$E_z \, \mathrm{[arb. units]} $$','Interpreter', 'latex');
    axis([-E0*1.1 E0*1.1 -E0*1.1 E0*1.1])
    grid on
    axis square
    pause(0.01)
    
end 