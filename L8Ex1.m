function [] = L8Ex1(A,B,y)
it = 4;
n =  length(A);
for i = 1:n
    soma = 0;
    for j = 1:(i-1)
        soma = soma + abs(A(i,j));
    end
    for j = i+1:n
        soma = soma + abs(A(i,j));
    end
    alpha = soma/A(i,i);
    if alpha < 1 
        fprintf('Converge \n')
        a = 1;
    else 
        fprintf('Não converge \n')
        a = 0;
        break
    end
end
if (a == 1)
    x = zeros(n,1);
    q = 0;
    for k = 1:1000000
        for i = 1:n
            soma = 0;
            for j = 1:(i-1)
                soma = soma + A(i,j)*y(j);
            end
            for j = i+1:n
                soma = soma + A(i,j)*y(j);
            end
            x(i,1) = (B(i,1) - soma)/A(i,i);
        end
        q = q + 1;
        if max(abs(x-y)/norm(x))<10^-it
            break
        end
        y = x;
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