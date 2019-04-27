function [ gaussian1, gaussian2 ] = incor_gaussian( sigma, mu, N)
%INCOR_GAUSSIAN Distribuciones gaussianas incorrelacionadas con media mu 
%y desvio estandar sigma
%   Devuelve 2 vectores de longitud N con valores con distribucion normal 
%   creado a partir de vectores con distribucion uniforme y Rayleigh
%   sigma: desvio estandar de la distribucion normal
%   mu: media de la distribucion
%   N: cantidad de muestras para el montecarlo
    radius = mc_rayleigh(sigma, N);
    theta = rand(1,N)*2*pi;
    gaussian1 = radius.*cos(theta) + mu;
    gaussian2 = radius.*cos(theta) + mu;
end

