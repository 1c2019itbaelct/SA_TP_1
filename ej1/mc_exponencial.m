function [ samples_exp ] = mc_exponencial( lambda, N )
%MONTECARLO_EXPONENCIAL Distribucion exponencial con parametro lambda
%   Devuelve un vector de longitud N con valores con distribucion exponencial 
%   negativa creado a partir del metodo de Montecarlo
%   lambda: parametro de la distribucion exponencial
%   N: cantidad de muestras para el montecarlo

samples_exp =  log(1./(1-rand(N,1)))./lambda; %Inversa func. dist. exponencial negativa

end

