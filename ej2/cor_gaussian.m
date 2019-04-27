function [ gaussian1, gaussian2 ] = cor_gaussian( sigma1, sigma2, mu1, mu2, ro, N , draw, filename)
%INCOR_GAUSSIAN Distribuciones gaussianas correlacionadas con media mu1, 
%mu2 desvio estandar sigma1, sigma2, y coeficiente de correlacion ro
%   Devuelve 2 vectores de longitud N con valores con distribucion normal 
%   correlacionadas creados a partir de vectores con distribucion normal 
%   incorrelacionados mediante una transformacion lineal basada en 
%   autovalores y autovectores.
%   sigma1: desvio estandar de la distribucion normal 1
%   sigma2: desvio estandar de la distribucion normal 2
%   mu1: media de la distribucion normal 1
%   mu2: media de la distribucion normal 2
%   ro: coeficiente de correlacion
%   N: cantidad de muestras
%   plot: (opcional) si es 1 dibuja un scatter plot de las dos gaussianas y la recta
%   de ajuste lineal
%   filename: (opcional) Nombre con el cual se guarda el grafico. Si no
%   tiene extension, se usa '.fig'. Si no se quiere guardar el grafico,
%   omitir.

sigmax = [sigma1^2 ro*sigma1*sigma2; ro*sigma1*sigma2 sigma2^2]; %matriz de covarianza de las gaussianas pedidas

[ave, ava] = eig(sigmax);

Y1 = incor_gaussian(sqrt(ava(1,1)), 0, N);
Y2 = incor_gaussian(sqrt(ava(2,2)), 0, N);
Y = [Y1 ; Y2];

X = ave*Y;

gaussian1 = X(1, :);
gaussian1 = gaussian1 + ones(size(gaussian1))*mu1;
gaussian2 = X(2, : );
gaussian2 = gaussian2 + ones(size(gaussian2))*mu2;

if nargin >= 7
    figure;
    scatter(gaussian1, gaussian2);
    grid on;
    hold on;
    lin_reg = polyfit(gaussian1,gaussian2,1);
    plot(gaussian1, lin_reg(1)*gaussian1 + lin_reg(2) , 'r');
    x_limits = xlim; y_limits = ylim;
    text(x_limits(1), y_limits(2) - (y_limits(2)-y_limits(1))*0.05,['ajuste lineal: y=', num2str(lin_reg(1)), 'x+', num2str(lin_reg(1))]);
    title({'Gaussianas correlacionadas', ['mu1=',num2str(mu1),', mu2=',num2str(mu2),', sigma1=',num2str(sigma1),', sigma2=',num2str(sigma2),', ro=',num2str(ro),', ', num2str(N),' muestras']});
    hold off;
    
end
if nargin == 8 
    saveas(gca, filename);
end
if draw ~= 1
    close;
end

end

