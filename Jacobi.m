function [] = Jacobi(A,B,y,it)
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
        a = 1;
    else 
        fprintf('Não converge \n')
        a = 0;
        break
    end
end

a = 1;
if (a == 1)

    fprintf('Converge \n')
    x = zeros(n,1);
    q = 0;
    for k = 1:10000000
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
        erro = norm((x-y)/norm(x));
        if (erro < 10^(-it))
            break
        end 
        y = x
    end
    fprintf('Número de iterações \n')
    disp(k)
    fprintf('Solução \n')
    disp(x)
    fprintf('Verificação \n')
    a = A*x;
    disp(a)
    fprintf('Erro \n')
    disp(erro)
end
