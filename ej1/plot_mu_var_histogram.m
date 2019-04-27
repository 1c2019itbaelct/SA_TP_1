function [ mu, var ] = plot_mu_var_histogram( lambda, N_samples, reps )
%PLOT_MU_VAR_HISTOGRAM Summary of this function goes here
%   Detailed explanation goes here
    hold off;
    mu = ones(1,reps);
    var = ones(1,reps);
    
    for i = 1:reps
        exp_samples = mc_exponencial(lambda, N_samples);
        mu(i) = mean(exp_samples);
        var(i) = std(exp_samples)^2;

    end
    
    subplot(2,1,1);
    histogram(mu);
    title('Valor medio');
    subplot(2,1,2);
    histogram(var);
    title('Varianza');
    suptitle({'Valores estimados',[ 'lambda = ', num2str(lambda), ', Nro. de muestras = ', num2str(N_samples), ', repeticiones = ', num2str(reps)]});
    

end

