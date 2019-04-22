function [ ] = plot_histograms( lambda, N_samples, bin_seps )
%PLOT_HISTOGRAMS Plotea histogramas de montecarlos de distribucion 
%exponencial negativa, y superpuesto plotea la distribucion ideal
%Recorre todas las combinaciones posibles de N_samples y bin_sep
%=> Crea length(N_samples)*length(bin_seps) graficos
%   lambda: parametro de la distribucion exponencial
%   N_samples: vector que contiene todas las cantidades de muestras de montecarlo
%   que se quieren plotear
%   bin_sep: vector que contiene todas las separaciones entre bines que se
%   quieren plotear
xrange=10;  %rango del eje x del histograma

for n = N_samples       %cantidad de muestras con las que se hace el montecarlo
    for sep = bin_seps  %separacion de los bines del histograma
        figure;
        bins = 0:sep:xrange;
        histogram(montecarlo_exponencial(lambda, n), bins, 'Normalization', 'pdf');
        hold on;
        plot(0:0.1:10, lambda.*(2.7.^(-lambda.*(0:0.1:10))));
        title(['Muestras: ',num2str(n),' -  Distancia entre bins: ',num2str(sep)]);
        xlabel('x');
        ylabel('pdf(x)')
        hold off;
        saveas(gca, ['N_',num2str(n),'_binsep_',num2str(sep), '.png']);
    end
end
