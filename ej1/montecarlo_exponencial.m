function [ samples_exp ] = montecarlo_exponencial( lambda, N )
%MONTECARLO_EXPONENCIAL Montecarlo exponencial con parametro lambda
%   Devuelve un vector de longitud N con valores con distribucion 
%   exponencial negativa de parametro lambda normalizado.
%   lambda: parametro de la distribucion exponencial
%   N: cantidad de muestras para el montecarlo

samples_exp =  log(1./(1-rand(N,1)))./lambda;


end

