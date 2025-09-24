function [X_norm, mu, sigma] = normaliceCaracteristicas(X)
%NORMALICECARACTERISTICAS Normaliza las características en X 
%   NORMALICECARACTERISTICAS(X) returna una versión normalizada de X 
%   donde la media del valor de cada característica es 0 y su desviación
%   estandar es 1. Esto usualmente es un buen paso de preprocesamiento
%   cuando se trabaja con algoritmos de aprendizaje.

% Usted debe asignar los valore correctos
X_norm = X;
mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));

% ====================== SU CÓDIGO AQUÍ =================================
% Instrucciones: Primero, para cada dimensión de característica, 
%                calcule la media de la característica y réstela al
%                conjunto de datos, guardando el valor de la media en mu.
%                Desués, calcula la desviación estandar de cada 
%                característica y divida cada característica por su
%                desviación, guardando la desviación estandard en sigma.
%
%                Note que X es una matriz donde cada columna es una 
%                característica y cada fila un ejemplo. Usted requiere 
%                calcular la normalización de manera separada para cada
%                característica. 
%
% Pista: PUede que encuentre util las funciones 'mean' y 'std'.
%       






% =======================================================================

end
