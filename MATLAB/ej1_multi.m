%% Machine Learning 
%  Ejercicio 1: Regresión Lineal con múltiples variables
%
%  Instrucciones
%  ------------
% 
%  Este archivo contiene código que le ayudará a hacer el ejercicio
%  re regresión. 
% 
%  Usted debe completar las siguientes fuciones 
%  en este ejercicio:
%
%     calentamiento.m
%     plotData.m
%     descensoXGradiente.m
%     calculeCosto.m
%     descensoXGradientMulti.m
%     calculeCostoMulti.m
%     normalizeCaracteristicas.m
%     ecuacionNormal.m
%
%  Para esta parte del ejercicio, usted necesitará cambiar algunas partes
%  del código siguiente para varios experimentos 
%  (e.g., cambiar el ritmo de aprendizaje).
%

%% Inicialización

%% ================ Parte 1: Normalización de Características ================

%% Limpie y cierre todas las figuras
clear all; close all; clc

fprintf('Cargando datos ...\n');

%% Cargar datos
data = load('ej1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

% Desplique algunos datos
fprintf('Primeros 10 ejemplos del dataset: \n');
fprintf(' x = [%.0f %.0f], y = %.0f \n', [X(1:10,:) y(1:10,:)]');

fprintf('Programa en pausa. Oprima enter para continuar.\n');
pause;

% Escale las características para que tengan media en 0
fprintf('Normalizando las Características ...\n');

[X mu sigma] = normaliceCaracteristicas(X);

% Add intercept term to X
X = [ones(m, 1) X];


%% ================ Parte 2: Descenso por Gradiente ================

% ====================== SU CÓDIGO AQUÍ ======================
% Instrucciones: Se ha proveido el código de inicialización siguiente
%                que ejecuta descenso por gradiente con un valor particular
%                de ritmo de aprendizaje (alpha). 
%
%                Su tarea es primero asegurarse que las funciones - 
%                calculeCosto y descensoXGradiente ya trabajen con este
%                código de inicialización y que permiten múltiples 
%                variables. 
%
%                Después de eso, intente correr descenso por gradiente con 
%                valores distintos de alpha para ver cual valor da los
%                mejores resultados.
%
%                Por último, debe completar el código al final para
%                predecir el valor de una casa de 1650 pies cuadrados, 
%                con 3 cuartos.
% 
% Pista: Al utilizar el comando 'hold on' command, usted puede desplegar
%        multiples graficos en la misma figura.
%
% Pista: Al predecir, asegúrese de hacer la misma normalización
%        de características
% 

fprintf('Ejecutando descenso por gradiente ...\n');

% Escoja algún valor de alpha
alpha = 0.01;
num_iters = 400;

% Inicialice Theta y corra descenso por gradiente
theta = zeros(3, 1);
[theta, J_historico] = descensoXGradienteMulti(X, y, theta, alpha, num_iters);

% Desplique el grafico de convergencia
figure;
plot(1:numel(J_historico), J_historico, '-b', 'LineWidth', 2);
xlabel('Número de iteraciones');
ylabel('Costo J');

% Despliegue los resultados del descenso por gradiente
fprintf('Theta calculado utilizando descenso por gradiente: \n');
fprintf(' %f \n', theta);
fprintf('\n');

% Estime el precio de una casa de 3 cuarto y 1650 pies cuadrados
% ====================== SU CÓDIGO AQUÍ ======================
% Recuerde que la primer columna de X es de 1's. Así que esa 
% no requiere ser normalizada.
% precio = 0; % Debe cambiar esto al valor correcto


% ============================================================

fprintf(['La predicción para el valor de una casa de 3 cuartos y 1650 pies cuadrados ' ...
         '(utilizando descenso por gradiente):\n $%f\n'], precio);

fprintf('Programa en pausa. Oprima enter para continuar.\n');
pause;

%% ================ Parte 3: Ecuación Normal ================

fprintf('Resolver con la ecuación normal ...\n');

% ====================== SU CÓDIGO AQUÍ ======================
% Instrucciones: El siguiente código calcula la solución en forma cerrada 
%                para regresión lineal utilizando la ecuación normal.
%                Debe completar el código en ecuacionNormal.m
% 
%                Después de hacerlo, debe completar el siguiente código 
%                para repetir la predicción de una casa de 3 cuartos y
%                1650 pies cuadrados

%% Cargar Datos
data = csvread('ej1data2.txt');
% X = ? 
% y = ? 
% m = ?

% Agrege término constante a X
% X = ? 

% Calcule los parámetros a partir de la ecuación normal
theta = ecuacionNormal(X, y);

% Despliegue los resultados de la ecuación normal
fprintf('Theta calculado a partir de la ecuación normal: \n');
fprintf(' %f \n', theta);
fprintf('\n');


% Estime el precio de una casa de 3 cuarto y 1650 pies cuadrados
% ====================== SU CÓDIGO AQUÍ ======================
price = 0; % Debe cambiar esto apropiadamente


% ============================================================

fprintf(['La predicción para el valor de una casa de 3 cuartos y 1650 pies cuadrados ' ...
         '(utilizando ecuación normal):\n $%f\n'], price);

