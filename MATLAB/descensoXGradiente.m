function [theta, J_history] = descensoXGradiente(X, y, theta, alpha, num_iters)
%DESCENSOPORGRADIENTE Ejecuta descenso por gradiente para aprender theta
%   theta = DESCENSOPORGRADIENTE(X, y, theta, alpha, num_iters) 
%   actualiza theta tomando el número de iteraciones del descenso por 
%   gradiente y el ritmo de aprendizaje alpha

% Algunos valores útiles para inizializar
m = length(y); % number de ejemplos de entrenamiento
J_historico = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== SU CÓDIGO AQUÍ ==========================
    % Instrucciones: Ejecute un uníco paso del descenso por gradiente 
    %                en el vector de parámetros theta. 
    %
    % Pista: Mientras debuggé, puede ser útil desplegar los valores de 
    %        la función de costo (calculeCosto) y el gradiente aquí
    %
    % ================================================================




    

    % Guarde el costo J en cada iteración    
    J_historico(iter) = calculeCosto(X, y, theta);

end

end
