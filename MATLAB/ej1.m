%% Machine Learning - Ejercicio 1: Regresión Lineal

%  Instrucciones
%  ------------
% 
%  Este archivo contiene código que le ayudará a hacer el ejercicio
%  re regresión. Usted debe completar las siguientes fuciones 
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
%  Para este ejercicio, usted no necesitará cambiar el código de este 
%  archivo, o de ningún archivo que no sea los mencioados anteriormente.
%
% x se refiere al tamaño de la población en 10,000s
% y se refiere a la ganacia in $10,000s
%

%% Initialization
clear all; close all; clc

%% ==================== Parte 1: Función Básica ====================
% Complete warmUpExercise.m 
fprintf('Corriendo ejercicio de calentamiento ... \n');
fprintf('Matriz Identidad 5x5: \n');
calentamiento()

fprintf('Programa en pausa. Oprima enter para continuar.\n');
pause;


%% ======================= Parte 2: Graficando =======================
fprintf('Graficando Datos ...\n')
data = load('ej1data1.txt');
X = data(:, 1); y = data(:, 2);
m = length(y); % numero de ejemplos de entrenamiento

% Grafique los datos
% Nota: Usted debe completar el código de plotData.m
plotData(X, y);

fprintf('Programa en pausa. Oprima enter para continuar.\n');
pause;

%% =================== Parte 3: Descenso por Gradiente ===================
fprintf('Corriendo Descenso por Gradiente ...\n')

X = [ones(m, 1), data(:,1)]; % Agregar una columna de unos a x
theta = zeros(2, 1); % inicializar los parámetros del ajuste

% Parámetros del descenso por gradiente
iteraciones = 1500;
alpha = 0.01;

% calcule y desplieque el costo inicial
calculeCosto(X, y, theta)

% corra el descenso por gradiente
theta = descensoXGradiente(X, y, theta, alpha, iteraciones);

% deslieque theta en la terminal
fprintf('Theta encontrado por descenso por gradiente: ');
fprintf('%f %f \n', theta(1), theta(2));

% Grafoqie el ajuste lineal
hold on; % mantenga visible el plot anterior
plot(X(:,2), X*theta, '-')
legend('Datos de Entrenamiento', 'Regresión Lineal')
hold off % no ponga más plots en esta figura

% Prediga los valores para poblaciones de 35,000 y 70,000
predict1 = [1, 3.5] *theta;
fprintf('Para una población = 35,000, predecimos una ganancia de %f\n',...
    predict1*10000);
predict2 = [1, 7] * theta;
fprintf('Para una población = 70,000, predecimos una ganancia de %f\n',...
    predict2*10000);

fprintf('Programa en pausa. Oprima enter para continuar.\n');
pause;

%% ============= Parte 4: Visualizando J(theta_0, theta_1) =============
fprintf('Visualizando J(theta_0, theta_1) ...\n')

% Grilla sobre los valores de J que calcularemos J
theta0_vals = linspace(-10, 10, 100);
theta1_vals = linspace(-1, 4, 100);

% initialice J_vals a una matriz de 0's
J_vals = zeros(length(theta0_vals), length(theta1_vals));

% Llene la matriz
for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
	  t = [theta0_vals(i); theta1_vals(j)];    
	  J_vals(i,j) = calculeCosto(X, y, t);
    end
end


% Por la forma en que funcionan los meshgrids en el comando surf, 
% necesitamos transponer J_vals antes de llamar surf, de lo contrario
% los ejes se van a intercambiar
J_vals = J_vals';
% Grafo de superficie
figure;
surf(theta0_vals, theta1_vals, J_vals)
xlabel('\theta_0'); ylabel('\theta_1');

% plot de contorno
figure;
% Grafoca J_vals como 15 contornos espaciados logaritmicamente
% entre 0.01 and 100
contour(theta0_vals, theta1_vals, J_vals, logspace(-2, 3, 20))
xlabel('\theta_0'); ylabel('\theta_1');
hold on;
plot(theta(1), theta(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
