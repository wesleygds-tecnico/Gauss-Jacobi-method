function[] = exercicio6_iterativo()
       x = 0.7; y = 0.5; z = 1.2; %%% chute inicial
       %%% laco iterativo com método de gauss-seidel
       for i = 1:100
           fprintf('iteração \n')
           i
           fprintf('Vetor antigo \n')
           x0 = x
           y0 = y
           z0 = z
           fprintf('Vetor novo \n')
             x  =  0.7 + 0.1*y*y - 0.05 * x * x
             y  =  0.5 - 0.3 * x * x + 0.1 * x * z
             z  =  1.2 - 0.4 * y*y - 0.1 * x*z
             
             erro = (((x-x0)^2 + (y-y0)^2 + (z-z0)^2)^(1/2))/(((x^2)+(y^2)+(z^2)))^(1/2)
             a = input('Continuar? \n')
             if(a == 1)
             else return
             end
       end
end