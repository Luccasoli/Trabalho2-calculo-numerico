function [vetorx,linha] = Gauss
matriza                                                             %importa o arquivo da primeira matriz.
vetora                                                              %importa o arquivo do primeiro vetor.
M = matriz1;
B = vetor1;
vetorx = [0 0 0 0 0];
[linha, coluna] = size(M);
if(linha == coluna)
    A = [M'; B]';                                                   %gera a matriz completa.

    disp('-----------------------------------------------');
    disp('---          ELIMINAÇÃO DE GAUSS            ---');
    disp('-----------------------------------------------');

    disp('M: '),disp(M);                                            %mostra a matriza.
    disp('B: '),disp(B);                                            %mostra o vetora.
    disp('A|B: '); disp(A);                                         %mostra a matriz completa.


    %Algoritimo de escalonamento da matriz.
    for i=1:linha-1                                                 %i representa o indice da linha do pivô atual.
        for j=i+1:linha                                             %j representa o indice da linha que será escalonada.
           k = -A(j, i)/A(i, i);                                    %calculo da variavel k.
           A(j,:) = A(j,:) + k*A(i,:);                              %efetuando o escalonamento da linha.
        end
    end

    t = 0;

    %Algoritimo para o calculo dos X's.
    for i=linha:-1:1                                                %i corresponde a variável xi que será calculada.                                               
        vetorx(1,i) = (A(i, linha+1) - t) / A(i, i);                %calculo da variável xi.
        t = 0;
        if(i>1)
           for j=i:linha                                            
               t = t + (vetorx(1, j) * A(i-1, j));                  %calculo da variável t, necessária para o cálculo da variável xi.
           end
        end

    end


    disp('---            MATRIZ ESCALONADA:           ---');
    disp('-----------------------------------------------');
    disp(A);

    disp('--------            VETOR X           ---------');
    disp('-----------------------------------------------');

    for i=1:linha
        disp(['X', num2str(i), ' = ' num2str(vetorx(1, i))]);
    end
end
    if(linha ~= coluna)
       disp('O código suporta apenas matrizes quadradas'); 
    end   
end

