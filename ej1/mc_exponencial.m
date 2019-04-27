function [ samples_exp ] = mc_exponencial( lambda, N, bin_seps, draw, filename )
%MC_EXPONENCIAL Distribucion exponencial con parametro lambda
%   Devuelve un vector de longitud N con valores con distribucion exponencial 
%   negativa creado a partir del metodo de Montecarlo. Si se pasa bin_seps, 
%   crea un histograma por cada elementos de bin_seps, cuya separacion entre 
%   bines esta indicada por dichos elementos. Superpuesto plotea la 
%   distribucion ideal.
%
%   lambda: parametro de la distribucion exponencial
%   N: cantidad de muestras para el montecarlo
%   bin_seps: (opcional) arreglo que contiene la separacion entre bines
%   para cada uno de los histogramas creados. Sin este parametro no se
%   pueden crear los histogramas.
%   draw: (opcional) si es 1, crea y mantiene abiertos el/los histogramas. 
%   Si es 0 y filename existe, se crean los graficos, se guardan, y se
%   cierran.
%   filename: (opcional) Nombre con el cual se guarda el grafico. Si no
%   tiene extension, se usa '.fig'. Si no se quiere guardar el grafico,
%   omitir. NOTA: si hay mas de un histograma, se agrega automaticamente al
%   final del nombre del archivo la separacion entre bines.

samples_exp =  log(1./(1-rand(N,1)))./lambda; %Inversa func. dist. exponencial negativa

if nargin >=4
    xmax=10;  %rango del eje x del histograma
    ymax = 2*lambda; %rango del eje y del histograma
    for sep = bin_seps  %separacion de los bines del histograma
        figure;
        bins = 0:sep:xmax;
        exp_samples = mc_exponencial(lambda, N);
        histogram(samples_exp, bins, 'Normalization', 'pdf');
        hold on;
        plot(0:0.1:10, lambda.*(2.7.^(-lambda.*(0:0.1:10))));
        title(['Muestras: ',num2str(N),' -  Distancia entre bins: ',num2str(sep)]);
        text(xmax * 0.6,ymax*0.9,['Media estimada: ',num2str(mean(exp_samples))]);
        text(xmax * 0.6,ymax*0.8,['Media teorica: ' ,num2str(1/lambda)]);
        text(xmax * 0.6,ymax*0.7,['Varianza estimada: ' ,num2str((std(exp_samples))^2)]);
        text(xmax * 0.6,ymax*0.6,['Varianza teorica: ' ,num2str(1/lambda^2)]);
        xlabel('x');
        ylabel('pdf(x)');
        ylim([0, ymax]);
        xlim([0, xmax]);
        hold off;
        if nargin >=5
            if length(bin_seps) > 1
                saveas(gca, ['binsep_', num2str(sep), '_', filename]);
            else
                saveas(gca, filename);
            end
        end
        if draw ~= 1
            close;
        end
    end
end



end

