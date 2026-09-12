%% Exercício 1 - Identificação de um sistema de primeira ordem
valorFinal = 1.8;
t63 = 1.2;

K = valorFinal;
tau = t63;
G = tf(K, [tau 1])

p = pole(G);
Kdc = dcgain(G);
info = stepinfo(G);

fprintf('Ganho K: %.4f\n', K);
fprintf('Constante de tempo tau: %.4f s\n', tau);
fprintf('Polo: %.4f\n', p);
fprintf('Tempo de subida (10-90%%): %.4f s\n', info.RiseTime);
fprintf('Tempo de acomodação (2%%): %.4f s\n', info.SettlingTime);
fprintf('Ganho em regime permanente: %.4f\n', Kdc);

t = 0:0.01:8;
figure;
plot(t, step(G, t));
xlabel('Tempo (s)');
ylabel('Saída');
title('Resposta ao degrau unitário - 1a ordem');
legend('Degrau unitário');
grid on;

A2 = 2.5;
fprintf('Novo valor final (degrau de amplitude %.1f): %.4f\n', A2, K*A2);

figure;
plot(t, A2*step(G, t));
xlabel('Tempo (s)');
ylabel('Saída');
title('Resposta ao degrau de amplitude 2,5 - 1a ordem');
legend('Degrau de amplitude 2,5');
grid on;

% Quanto menor a constante de tempo, mais negativo é o polo (-1/tau) e mais rápida é a resposta ao degrau.
% Polos mais afastados da origem (mais à esquerda no eixo real) produzem acomodação mais rápida.

%% Exercício 2 - Escolha entre três sistemas de segunda ordem
GA = tf(25, [1 3 25])
GB = tf(25, [1 10 25])
GC = tf(25, [1 16 25])

analyze_system('Sistema A', GA, false);
analyze_system('Sistema B', GB, false);
analyze_system('Sistema C', GC, false);

t = 0:0.01:8;
figure;
plot(t, step(GA,t), t, step(GB,t), t, step(GC,t));
xlabel('Tempo (s)');
ylabel('Saída');
title('Resposta ao degrau - três sistemas de 2a ordem');
legend('Sistema A', 'Sistema B', 'Sistema C');
grid on;

pA = pole(GA); pB = pole(GB); pC = pole(GC);
figure;
hold on;
plot(real(pA), imag(pA), 'x', 'MarkerSize', 10, 'LineWidth', 2);
plot(real(pB), imag(pB), 'o', 'MarkerSize', 10, 'LineWidth', 2);
plot(real(pC), imag(pC), 's', 'MarkerSize', 10, 'LineWidth', 2);
hold off;
xlabel('Parte real');
ylabel('Parte imaginária');
title('Polos dos três sistemas');
legend('Sistema A', 'Sistema B', 'Sistema C');
grid on;

% Sistema B é o mais adequado: criticamente amortecido, não apresenta sobressinal e é o mais rápido entre os sem sobressinal (A oscila; C é superamortecido e mais lento).

%% Exercício 3 - Avaliação de desempenho de dois sistemas de segunda ordem
G1 = tf(16, [1 2.8 16])
G2 = tf(25, [1 6.5 25])

analyze_system('Sistema 1', G1, true);
analyze_system('Sistema 2', G2, true);

t = 0:0.001:8;
y1 = step(G1, t);
y2 = step(G2, t);

td1 = t(find(y1 >= 0.5*y1(end), 1));
td2 = t(find(y2 >= 0.5*y2(end), 1));
fprintf('Tempo de atraso (50%%) - Sistema 1: %.4f s\n', td1);
fprintf('Tempo de atraso (50%%) - Sistema 2: %.4f s\n', td2);

figure;
plot(t, y1, t, y2);
xlabel('Tempo (s)');
ylabel('Saída');
title('Resposta ao degrau - Sistema 1 e Sistema 2');
legend('Sistema 1', 'Sistema 2');
grid on;

% Sistema 1 (zeta=0,35): sobressinal alto (~31%) e acomodação lenta (~2,9 s). Sistema 2 (zeta=0,65): sobressinal pequeno (~7%) e acomodação rápida (~1,2 s).
% Escolhido o Sistema 2: único a atender Mp < 10% e ts < 1,5 s, com transitório mais bem comportado.

%% Exercício 4 - Seleção de parâmetros para um sistema de segunda ordem
zetas = [0.35 0.55 0.70 0.80];
wns   = [6 5 4 3.2];
nomes = {'Configuração A', 'Configuração B', 'Configuração C', 'Configuração D'};

sistemas = cell(1, 4);
for k = 1:4
    wn = wns(k);
    zeta = zetas(k);
    sistemas{k} = tf(wn^2, [1 2*zeta*wn wn^2]);
    analyze_system(nomes{k}, sistemas{k}, true);
end

t = 0:0.01:8;
figure;
hold on;
for k = 1:4
    plot(t, step(sistemas{k}, t));
end
hold off;
xlabel('Tempo (s)');
ylabel('Saída');
title('Resposta ao degrau - quatro configurações');
legend(nomes);
grid on;

% Aumentar zeta reduz o sobressinal, porém aumenta os tempos de subida e de acomodação.
% A e B reprovam no sobressinal (>10%) e D fica no limite da acomodação; a Configuração C atende os dois requisitos com folga e tem o menor tempo de subida entre as válidas, sendo a escolhida.

%% Exercício 5 - Comparação entre sistemas de primeira e segunda ordem
GA = tf(2, [1.2 1])
GB = tf(32, [1 5.6 16])

pA = pole(GA);
KdcA = dcgain(GA);
infoA = stepinfo(GA);
fprintf('--- Equipamento A (1a ordem) ---\n');
fprintf('Polo: %.4f\n', pA);
fprintf('Ganho em regime / valor final (degrau unitário): %.4f\n', KdcA);
fprintf('Tempo de subida (10-90%%): %.4f s\n', infoA.RiseTime);
fprintf('Tempo de acomodação (2%%): %.4f s\n', infoA.SettlingTime);
fprintf('\n');

analyze_system('Equipamento B (2a ordem)', GB, true);

t = 0:0.001:8;
figure;
plot(t, step(GA,t), t, step(GB,t));
xlabel('Tempo (s)');
ylabel('Saída');
title('Resposta ao degrau unitário - Equipamentos A e B');
legend('Equipamento A', 'Equipamento B');
grid on;

A15 = 1.5;
fprintf('Valor final Equipamento A (degrau %.1f): %.4f\n', A15, KdcA*A15);
fprintf('Valor final Equipamento B (degrau %.1f): %.4f\n', A15, dcgain(GB)*A15);

figure;
plot(t, A15*step(GA,t), t, A15*step(GB,t));
xlabel('Tempo (s)');
ylabel('Saída');
title('Resposta ao degrau de amplitude 1,5 - Equipamentos A e B');
legend('Equipamento A', 'Equipamento B');
grid on;

% Rapidez: o Equipamento B (2a ordem) sobe bem mais rápido (tr ~0,82 s) que o A (~2,64 s).
% Sobressinal: o Equipamento A (1a ordem) não tem sobressinal; o B apresenta ~4,6%.
% Regime permanente: ambos têm o mesmo ganho (2) e atingem o mesmo valor final (2 no degrau unitário; 3 no degrau de amplitude 1,5).

%% Função
function analyze_system(name, G, transient)
    [num, den] = tfdata(G, 'v');
    wn = sqrt(den(3));
    zeta = den(2)/(2*wn);
    p = roots(den);
    Kdc = num(end)/den(end);

    fprintf('--- %s ---\n', name);
    fprintf('Polos: %s\n', mat2str(round(p, 4)));
    fprintf('Frequência natural wn: %.4f rad/s\n', wn);
    fprintf('Coeficiente de amortecimento zeta: %.4f\n', zeta);
    if zeta < 1 - 1e-6
        fprintf('Tipo: subamortecido\n');
    elseif abs(zeta - 1) <= 1e-6
        fprintf('Tipo: criticamente amortecido\n');
    else
        fprintf('Tipo: superamortecido\n');
    end
    fprintf('Ganho em regime / valor final (degrau unitário): %.4f\n', Kdc);

    if transient && zeta < 1
        wd = wn*sqrt(1 - zeta^2);
        beta = acos(zeta);
        tr = (pi - beta)/wd;
        tp = pi/wd;
        Mp = exp(-zeta*pi/sqrt(1 - zeta^2));
        ts = 4/(zeta*wn);
        fprintf('Tempo de subida (0-100%%, 2a ordem): %.4f s\n', tr);
        fprintf('Tempo de pico: %.4f s\n', tp);
        fprintf('Máximo sobressinal: %.2f %%\n', Mp*100);
        fprintf('Valor do primeiro pico: %.4f\n', Kdc*(1 + Mp));
        fprintf('Tempo de acomodação (2%%): %.4f s\n', ts);
    end
    fprintf('\n');
end
