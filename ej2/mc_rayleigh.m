function [ rayleigh ] = mc_rayleigh( sigma, N )
%MC_RAYLEIGH  Distribucion Rayleigh con parametro lambda
%   Devuelve un vector de longitud N con valores con distribucion Rayleigh 
%   creado a partir del metodo de Montecarlo
%   lambda: parametro de la distribucion Rayleigh
%   N: cantidad de muestras para el montecarlo

rayleigh = sigma .* sqrt(2.*log(1./(1-rand(1,N))));  %inversa de distribucion rayleigh

end

