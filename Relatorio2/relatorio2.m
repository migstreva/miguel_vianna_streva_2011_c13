%% Exercício 1 - Sistemas massa-atrito e comparação gráfica (Caixa Branca)
M1 = 2; B1 = 3;
M2 = 4; B2 = 6;

G1 = tf(1, [M1 B1])
G2 = tf(1, [M2 B2])

t = 0:0.05:20;
y1 = step(G1, t);
y2 = step(G2, t);

figure;
plot(t, y1, t, y2, t, ones(size(t)), '--');
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Resposta ao degrau - dois sistemas massa-atrito');
legend('Sistema 1', 'Sistema 2', 'Força unitária', 'Location', 'northwest');
grid on;

sel = t <= 5;
axes('Position', [0.5 0.55 0.35 0.3]);
box on;
plot(t(sel), y1(sel), t(sel), y2(sel));
title('Primeiros 5 s');
grid on;

figure;
subplot(2,1,1);
plot(t, y1);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Sistema 1');
grid on;

subplot(2,1,2);
plot(t, y2);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Sistema 2');
grid on;

%% Exercício 2 - Circuito RC e comparação de escalas (Caixa Cinza)
R = 2000;
tau = 2.5;
C = tau/R

G = tf(1, [R*C 1])

figure;
step(G, 15);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Resposta ao degrau - circuito RC');
grid on;

Rteste = 100:100:10000;
tau_teste = Rteste * C;

figure;
subplot(2,2,1);
plot(Rteste, tau_teste);
xlabel('Resistência (\Omega)');
ylabel('Constante de tempo (s)');
title('Escala linear');
grid on;

subplot(2,2,2);
semilogy(Rteste, tau_teste);
xlabel('Resistência (\Omega)');
ylabel('Constante de tempo (s)');
title('Log no eixo Y');
grid on;

subplot(2,2,3);
semilogx(Rteste, tau_teste);
xlabel('Resistência (\Omega)');
ylabel('Constante de tempo (s)');
title('Log no eixo X');
grid on;

subplot(2,2,4);
loglog(Rteste, tau_teste);
xlabel('Resistência (\Omega)');
ylabel('Constante de tempo (s)');
title('Log nos dois eixos');
grid on;

%% Exercício 3 - Identificação e visualização de dados experimentais (Caixa Preta)
t = (0:25)';
u = [0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
y = [0.008 0.012 0.006 0.010 0.020 0.382 0.671 0.903 1.082 1.226 1.335 1.425 ...
     1.492 1.547 1.587 1.618 1.642 1.660 1.674 1.684 1.692 1.698 1.702 1.706 1.709 1.711];

u = u(:);
y = y(:);

figure;
subplot(2,1,1);
plot(t, u);
xlabel('Tempo (s)');
ylabel('Entrada u');
title('Entrada');
grid on;

subplot(2,1,2);
plot(t, y);
xlabel('Tempo (s)');
ylabel('Saída y');
title('Saída');
grid on;

figure;
plot3(t, u, y);
xlabel('Tempo (s)');
ylabel('Entrada u');
zlabel('Saída y');
title('Entrada e saída no tempo');
grid on;

Ts = 1;
dados = iddata(y, u, Ts);
G = tfest(dados, 1, 0)

figure;
compare(dados, G);

figure;
step(G, 25);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Resposta ao degrau do modelo identificado');
grid on;

%% Exercício 4 - Análise de diferentes circuitos RC (Caixa Cinza)
R1 = 1000; tau1 = 1.2;
R2 = 2000; tau2 = 2.8;
R3 = 3000; tau3 = 3.9;
R4 = 5000; tau4 = 7.0;

C1 = tau1/R1
C2 = tau2/R2
C3 = tau3/R3
C4 = tau4/R4

R = [R1 R2 R3 R4];
tau = [tau1 tau2 tau3 tau4];
C = [C1 C2 C3 C4];

figure;
plot3(R, tau, C, '-o');
xlabel('Resistência (\Omega)');
ylabel('Constante de tempo (s)');
zlabel('Capacitância (F)');
title('Quatro experimentos RC');
grid on;

G3 = tf(1, [R3*C3 1])

t = 0:0.05:20;
y3 = step(G3, t);

figure;
plot(t, y3);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Resposta ao degrau - Experimento 3');
grid on;

sel = t <= 5;
axes('Position', [0.5 0.2 0.35 0.35]);
box on;
plot(t(sel), y3(sel));
title('Primeiros 5 s');
grid on;

%% Exercício 5 - Análise completa de três tipos de modelagem
% Sistema A - Caixa Branca
MA = 3; BA = 5;
GA = tf(1, [MA BA])

% Sistema B - Caixa Cinza
RB = 1500; tauB = 3;
CB = tauB/RB
GB = tf(1, [RB*CB 1])

% Sistema C - Caixa Preta
tC = (0:20)';
uC = [0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
yC = [0.010 0.006 0.012 0.018 0.408 0.706 0.934 1.103 1.229 1.322 1.391 1.441 ...
      1.479 1.505 1.526 1.540 1.551 1.558 1.564 1.568 1.571];
uC = uC(:);
yC = yC(:);

Ts = 1;
dadosC = iddata(yC, uC, Ts);
GC = tfest(dadosC, 1, 0)

figure;
subplot(3,1,1);
step(GA, 20);
title('Sistema A - degrau');
grid on;

subplot(3,1,2);
step(GB, 20);
title('Sistema B - degrau');
grid on;

subplot(3,1,3);
step(GC, 20);
title('Sistema C - degrau');
grid on;

figure;
subplot(2,1,1);
plot(tC, uC);
xlabel('Tempo (s)');
ylabel('Entrada u');
title('Sistema C - entrada');
grid on;

subplot(2,1,2);
plot(tC, yC);
xlabel('Tempo (s)');
ylabel('Saída y');
title('Sistema C - saída');
grid on;

figure;
compare(dadosC, GC);

% Sistema A é caixa branca: o modelo vem das leis físicas do sistema massa-atrito,
% com todos os parâmetros (M e B) conhecidos previamente.
% Sistema B é caixa cinza: a estrutura do modelo (RC de 1a ordem) é conhecida, mas a
% capacitância C teve que ser determinada a partir de um dado medido (no caso, a constante de tempo).
% Sistema C é caixa preta: não se conhece a estrutura interna, ou seja, o modelo foi obtido
% apenas a partir dos dados de entrada e saída, por identificação (tfest).