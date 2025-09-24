function [theta, J_historico] = descensoXGradienteMulti(X, y, theta, alpha, num_iters)
%DESCENSOXGRADIENTEMULTI ejecuta descenso por gradiente para aprender theta
%   
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) actualiza
%       theta tomando num_iters pasos con el ritmo de aprendizaje alpha

% Initializar algunos valores útiles
m = length(y); % numero de ejemplos de entrenamiento
J_historico = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== SU CÓDIGO AQUÍ ==========================
    % Instrucciones: Ejecute un único paso de descenso por gradiente
    %                en el vector de parámetros theta. 
    %
    % Pista: Mientras depure, puede que sea util desplegar los valores
    %        de la funcion de costo (calculeCostoMulti) y el gradiente.
    %


    



    % ==============================================================

    % Guarde el costo J en cada iteración    
    J_historico(iter) = calculeCostoMulti(X, y, theta);

end

end
