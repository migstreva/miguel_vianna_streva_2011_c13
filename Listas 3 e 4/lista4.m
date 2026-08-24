%% Exercício 1 - Sistema massa-mola-amortecedor (Caixa Branca)
M = 2;
B = 3;
K = 8;

G = tf(1, [M B K])

figure;
step(G, 15);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Resposta ao degrau - massa-mola-amortecedor');
grid on;

%% Exercício 2 - Circuito RC (Caixa Cinza)
R = 1000;
tau = 2;
C = tau/R

G = tf(1, [R*C 1])

figure;
step(G, 10);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Resposta ao degrau - circuito RC');
grid on;

%% Exercício 3 - Sistema massa-atrito (Caixa Cinza)
M = 4;
F = 1;
v_ss = 0.5;
B = F/v_ss

G = tf(1, [M B])

figure;
step(G, 15);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Resposta ao degrau - massa-atrito');
grid on;