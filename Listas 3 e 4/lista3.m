%% Exercício 1 - Funções e gráficos 2D
t = 0:0.1:10;
s = 2*sin(3*t);
c = 2*cos(3*t);

figure;
plot(t, s, t, c);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Senoide e cossenoide');
legend('2 sin(3t)', '2 cos(3t)');
grid on;

fprintf('Número de elementos do vetor de tempo: %d\n', numel(t));

%% Exercício 2 - Entrada de dados, condição e gráfico
a = input('Digite o coeficiente a: ');
x = -10:0.1:10;
y = a*x + 2;

if a > 0
    disp('O coeficiente é positivo');
elseif a < 0
    disp('O coeficiente é negativo');
else
    disp('O coeficiente é igual a zero');
end

figure;
plot(x, y);
xlabel('x');
ylabel('y');
title('y = a x + 2');
grid on;

sel = (x >= -2) & (x <= 2);
axes('Position', [0.18 0.6 0.28 0.28]);
box on;
plot(x(sel), y(sel));
title('Região -2 <= x <= 2');
grid on;

%% Exercício 3 - Repetição e organização de gráficos
mult = zeros(1, 5);
for k = 1:5
    mult(k) = 3*k;
end
doubled = 2*mult;

figure;
subplot(2,1,1);
plot(mult, '-o');
xlabel('Índice');
ylabel('Valor');
title('Múltiplos de 3');
grid on;

subplot(2,1,2);
plot(doubled, '-o');
xlabel('Índice');
ylabel('Valor');
title('Dobro dos múltiplos de 3');
grid on;

%% Exercício 4 - Comparação de escalas
t = 0:1:1000;
y = 50000*exp(-0.05*t);

figure;
subplot(1,2,1);
plot(t, y);
xlabel('Tempo');
ylabel('y');
title('Escala linear');
grid on;

subplot(1,2,2);
semilogy(t, y);
xlabel('Tempo');
ylabel('y (log)');
title('Escala logarítmica no eixo Y');
grid on;

%% Exercício 5 - Gráficos 3D
x = 1:10;
y = 1:20;
[X, Y] = meshgrid(x, y);
Z = sin(X) + cos(Y);

figure;
subplot(1,2,1);
surf(X, Y, Z);
colormap(summer);
shading interp;
xlabel('x');
ylabel('y');
zlabel('z');
title('Superfície 3D');

subplot(1,2,2);
contour(X, Y, Z);
xlabel('x');
ylabel('y');
title('Curvas de nível');