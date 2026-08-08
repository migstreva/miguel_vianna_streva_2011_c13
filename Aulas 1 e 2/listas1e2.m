% Lista 1
%% 1. Operacoes basicas
a = 12;
b = 5;

soma = a + b
sub = a - b
mult = a * b
divi = a / b
pot = a ^ b

%% 2. Raiz, arredondamento e resto
raiz = sqrt(144)
arred = round(7.6)
arred_cima = ceil(4.01)
resto = mod(250, 17)

%% 3. MDC e MMC
mdc = gcd(24, 36)
mmc = lcm(12, 18)

%% 4. Exponencial e trigonometria
exp2 = exp(2)

s = sin(deg2rad(30))
c = cos(deg2rad(60))
t = tan(deg2rad(45))

%% 5. Criando vetores
v_1a10 = 1:10
v_10a1 = 10:-1:1
v_pares = 0:2:20
v_lin = linspace(0, 100, 5)

%% 6. Acessando posicoes de um vetor
v = [4 8 15 16 23 42];

primeiro = v(1)
ultimo = v(end)
faixa_2a4 = v(2:4)
selecao = v([1 3 6])

%% 7. Informacoes sobre um vetor
v = [5 10 15 20 25];

qtd = numel(v)
dims = size(v)  
total = sum(v)
media = mean(v)
maior = max(v)
menor = min(v)

%% 8. Vetor linha e vetor coluna
v = [10 20 30 40];

size_antes   = size(v)
v_coluna     = v'
size_depois  = size(v_coluna)

%% 9. Criando e acessando uma matriz
A = [3 6 9;
    2 4 8;
    1 5 7];

elem_2_3 = A(2, 3)
primeira_lin = A(1, :)
segunda_col = A(:, 2)
dims_A = size(A)

%% 10. Operacoes com matrizes
A = [1 2;
    3 4];
B = [2 0;
    1 5];

soma_AB = A + B
prod_AB = A * B
transp_A = A'

M_zeros = zeros(3)
M_uns = ones(2, 4)
M_ident = eye(4)
M_rand = rand(3)

% Lista 2

%% 1. Entrada e saida
cidade = input('Digite o nome de uma cidade: ', 's');

disp(cidade)
fprintf('Cidade escolhida: %s\n', cidade);

%% 2. if, elseif e else
x = 7;

if x > 10
    disp('Maior que 10')
elseif x == 10
    disp('Igual a 10')
else
    disp('Menor que 10')
end

%% 3. for
for i = 1:5
    resultado = i * 3;
    fprintf('%d x 3 = %d\n', i, resultado);
end

%% 4. while
x = 0;
i = 0;

while i < 5
    x = x + 1;
    i = i + 1;
    fprintf('Repeticao %d -> x = %d\n', i, x);
end

%% 5a. switch
opcao = 2;

switch opcao
    case 1
        disp('Opcao A')
    case 2
        disp('Opcao B')
    case 3
        disp('Opcao C')
    otherwise
        disp('Opcao invalida')
end

%% 5b. Chamada da funcao
valor = 8;
triplo = funcao_triplo(valor);
fprintf('O triplo de %d e %d\n', valor, triplo);