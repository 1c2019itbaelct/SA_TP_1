function [ ] = plot_exp_histograms( lambda, N_samples, bin_seps )
%PLOT_HISTOGRAMS Plotea histogramas de montecarlos de distribucion 
%exponencial negativa, y superpuesto plotea la distribucion ideal
%Recorre todas las combinaciones posibles de N_samples y bin_sep
%=> Crea length(N_samples)*length(bin_seps) graficos
%   lambda: parametro de la distribucion exponencial
%   N_samples: vector que contiene todas las cantidades de muestras de montecarlo
%   que se quieren plotear
%   bin_sep: vector que contiene todas las separaciones entre bines que se
%   quieren plotear
xmax=10;  %rango del eje x del histograma
ymax = 2*lambda; %rango del eje y del histograma

for n = N_samples       %cantidad de muestras con las que se hace el montecarlo
    for sep = bin_seps  %separacion de los bines del histograma
        figure;
        bins = 0:sep:xmax;
        exp_samples = montecarlo_exponencial(lambda, n);
        histogram(exp_samples, bins, 'Normalization', 'pdf');
        hold on;
        plot(0:0.1:10, lambda.*(2.7.^(-lambda.*(0:0.1:10))));
        title(['Muestras: ',num2str(n),' -  Distancia entre bins: ',num2str(sep)]);
        text(xmax * 0.6,ymax*0.9,['Media estimada: ',num2str(mean(exp_samples))]);
        text(xmax * 0.6,ymax*0.8,['Media teorica: ' ,num2str(1/lambda)]);
        text(xmax * 0.6,ymax*0.7,['Varianza estimada: ' ,num2str((std(exp_samples))^2)]);
        text(xmax * 0.6,ymax*0.6,['Varianza teorica: ' ,num2str(1/lambda^2)]);
        xlabel('x');
        ylabel('pdf(x)');
        ylim([0, ymax]);
        xlim([0, xmax]);
        hold off;
        saveas(gca, ['N_',num2str(n),'_binsep_',num2str(sep), '.png']);
    end
end
