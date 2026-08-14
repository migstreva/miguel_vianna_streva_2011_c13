%% Exercício 1 - Análise de três medições
m1 = input('Digite a primeira medição: ');
m2 = input('Digite a segunda medição: ');
m3 = input('Digite a terceira medição: ');

measurements = [m1 m2 m3];

avg  = mean(measurements);
maxV = max(measurements);
minV = min(measurements);

fprintf('Média: %.2f\n', avg);
fprintf('Maior valor: %g\n', maxV);
fprintf('Menor valor: %g\n', minV);

if avg >= 8
    disp('Resultado alto');
elseif avg >= 5
    disp('Resultado intermediário');
else
    disp('Resultado baixo');
end

%% Exercício 2 - Processamento de um vetor com for
A = [3 8 2 10 5 7 1 6];
B = zeros(1, length(A));

for i = 1:length(A)
    if A(i) >= 6
        B(i) = A(i) * 2;
    else
        B(i) = A(i) + 3;
    end
end

disp('Vetor A:'); disp(A);
disp('Vetor B:'); disp(B);
fprintf('Soma de B: %g\n', sum(B));
fprintf('Média de B: %.2f\n', mean(B));
fprintf('Maior valor de B: %g\n', max(B));
fprintf('Menor valor de B: %g\n', min(B));

%% Exercício 3 - Identificação de números pares em um vetor
A = [14 7 20 9 6 11 18 5];
B = zeros(1, length(A));
counter = 0;

for i = 1:length(A)
    if rem(A(i), 2) == 0
        B(i) = A(i);
        counter = counter + 1;
    else
        B(i) = 0;
    end
end

disp('Vetor B:'); disp(B);
fprintf('Quantidade de números pares: %d\n', counter);

%% Exercício 4 - Calculadora com menu usando switch
a = input('Digite o primeiro valor: ');
b = input('Digite o segundo valor: ');

fprintf('\n1 - Soma\n2 - Subtração\n3 - Multiplicação\n4 - Divisão\n');
option = input('Escolha uma opção: ');

switch option
    case 1
        fprintf('Resultado: %g\n', a + b);
    case 2
        fprintf('Resultado: %g\n', a - b);
    case 3
        fprintf('Resultado: %g\n', a * b);
    case 4
        if b == 0
            disp('A operação não pode ser realizada (divisão por zero).');
        else
            fprintf('Resultado: %g\n', a / b);
        end
    otherwise
        disp('Opção inválida');
end

%% Exercício 5 - Acumulador com while
total   = 0;
counter = 0;

while total <= 4
    value   = rand;
    total   = total + value;
    counter = counter + 1;
    fprintf('Valor sorteado: %.4f | Soma atual: %.4f\n', value, total);
end

if counter > 8
    disp('Muitas repetições');
else
    disp('Poucas repetições');
end

fprintf('Total de repetições: %d\n', counter);

%% Exercício 6 - Processamento de uma matriz com dois laços for
A = [2 7 4 9;
     6 1 8 3];
B = zeros(size(A));

[rows, cols] = size(A);
for j = 1:rows
    for i = 1:cols
        if A(j,i) > 5
            B(j,i) = A(j,i) * 2;
        else
            B(j,i) = A(j,i) + 5;
        end
    end
end

disp('Matriz A:');             disp(A);
disp('Matriz B:');             disp(B);
disp('Transposta de B:');      disp(B');
disp('Primeira linha de B:');  disp(B(1, :));
disp('Terceira coluna de B:'); disp(B(:, 3));

%% Exercício 7 - Função com duas saídas para analisar um vetor
A = [5 12 7 3 9 14];

[total, avg] = analisa_vetor(A);

fprintf('Soma: %g\n', total);
fprintf('Média: %.2f\n', avg);

if avg >= 8
    disp('Média elevada');
else
    disp('Média abaixo de 8');
end

%% Exercício 8 - Função para transformar uma matriz
A = [1 5 3 8;
     6 2 7 4];
B = zeros(size(A));

B = transforma_matriz(A, B);

disp('Matriz resultante B:');
disp(B);

%% Exercício 9 - Entrada como texto e conversão numérica
text1 = input('Digite o primeiro valor: ', 's');
text2 = input('Digite o segundo valor: ', 's');

disp(text1);
disp(text2);

num1 = str2num(text1);
num2 = str2num(text2);

s = num1 + num2;
p = num1 * num2;

fprintf('Soma: %g\n', s);
fprintf('Multiplicação: %g\n', p);

if s > 20
    disp('Soma alta');
elseif s == 20
    disp('Soma igual a 20');
else
    disp('Soma baixa');
end

%% Exercício 10 - Desafio integrador: análise de dados e escolha de gráfico
data = [12 18 10 25 15];

fprintf('Soma: %g\n', sum(data));
fprintf('Média: %.2f\n', mean(data));
fprintf('Maior valor: %g\n', max(data));
fprintf('Menor valor: %g\n', min(data));

avg     = mean(data);
counter = 0;
for i = 1:length(data)
    if data(i) >= avg
        counter = counter + 1;
    end
end
fprintf('Valores maiores ou iguais à média: %d\n', counter);

fprintf('\n1 - Gráfico de barras\n2 - Gráfico de pizza\n');
option = input('Escolha uma opção: ');

switch option
    case 1
        bar(data);
        title('Gráfico de barras dos dados');
    case 2
        pie3(data);
        title('Gráfico de pizza dos dados');
    otherwise
        warning('Nenhum gráfico foi criado.');
end

if counter > length(data)/2
    disp('Maioria dos valores acima ou igual à média');
else
    disp('Menos da metade dos valores acima ou igual à média');
end

%% Funções locais
function [s, m] = analisa_vetor(v)
    s = sum(v);
    m = mean(v);
end

function B = transforma_matriz(A, B)
    [rows, cols] = size(A);
    for j = 1:rows
        for i = 1:cols
            if A(j,i) >= 5
                B(j,i) = A(j,i) * 2 * exp(1);
            else
                B(j,i) = A(j,i) * 2;
            end
        end
    end
end