function [ gaussian1, gaussian2 ] = cor_gaussian( sigma1, sigma2, mu1, mu2, ro, N )
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

end

