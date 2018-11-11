function Interpolacao_Newton(x,y,p)
    % A variavel x e um vetor
    % A variavel y e um vetor, onde cada elemento representa a funcao aplicada ao valor x
    % A variavel p e o valor de x passado pelo usuario
    n = length(x); %Tamanho da matriz x
    a(1) = y(1);
    % Resultado do polinomio (c)
    for k = 1 : n - 1
        d(k, 1) = (y(k+1) - y(k))/(x(k+1) - x(k));
    end
    for j = 2 : n - 1
        for k = 1 : n - j
           d(k, j) = (d(k+1, j - 1) - d(k, j - 1))/(x(k+j) - x(k));
        end
    end
    for j = 2 : n
        a(j) = d(1, j-1);
    end
    % Cada coluna do vetor d ao ser somado gera a interpolacao
    Df(1) = 1;
    resultado(1) = a(1);
    for j = 2 : n
        Df(j)=(p - x(j-1)) .* Df(j-1);
        resultado(j) = a(j) .* Df(j);
    end
    % Processo para formar a funcao do polinio
    p=num2str(a(1,1));
    xx=x*-1;
    for j=2:n
        signo='';
        if a(1,j)>=0
            signo='+';
        end
        xt='';
        for i=1:j-1
            signo2='';
            if xx(i)>=0
                signo2='+';
            end
            xt=strcat(xt,'*(x',signo2,num2str(xx(i)),')');
        end
        p=strcat(p,signo,num2str(a(1,j)),xt);
    end
    % Resultado do polinomio
    resultado = sum(resultado);
    disp('Polinomio:');
    p
    disp(['Resultado: ', num2str(resultado)]);
end