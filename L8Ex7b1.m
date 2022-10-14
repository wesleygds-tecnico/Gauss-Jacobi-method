function [] = L8Ex7b2()
A = [4 1 2;1 3 1;1 2 5]
B = [12;10;20]
x = [1.01;2.01;3.01]
it = 10;
n =  length(A);
betha = zeros(n,1);
betha(1,1) = 1;
for i = 1:n
    soma = 0;
    for j = 1:(i-1)
        soma = soma + abs(A(i,j))*betha(j);
    end
    for j = i+1:n
        soma = soma + abs(A(i,j));
    end
    betha(i,1) = soma/A(i,i);
    if betha(1:n,1) < 1 
        a = 1;
    else
        fprintf('Não converge \n')
            a = 0;
        break
    end
end
if a == 1
    fprintf('Converge \n')
    q = 0;
    for k = 1:100
        for i = 1:n
            y=x;
            soma = 0;
            for j = 1:(i-1)
                soma = soma + A(i,j)*x(j);
            end
            for j = i+1:n
                soma = soma + A(i,j)*x(j);
            end
            x(i,1) = (B(i,1) - soma)/A(i,i)
        end
        q = q + 1;
        if max(abs(x-y))<10^-it
            break
        end
    end
    fprintf('Número de iterações \n')
    disp(q)
    fprintf('Solução \n')
    disp(x)
    fprintf('Verificação \n')
    a = A*x;
    disp(a)
end
end