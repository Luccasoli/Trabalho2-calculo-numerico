function vetork = Gauss_jacob

    matrizb                                                         %importa o arquivo da primeira matriz.
    vetorb                                                          %importa o arquivo do primeiro vetor.
    M = matriz2;
    B = vetor2;
    vetork=[0 0 0 0 0];                                             %vetor de iteração k.
    vetorkk=[0 0 0 0 0];                                            %vetor de iteração k+1.
    r = 100;                                                        %variável para o critério de parada.
    e = input('Digite a precisão desejada: ');                      %variável de precisão.
    dif = 0;                                                        %variável de auxílio para a diferença.
    difr = 0;                                                       %variável resposta para a maior diferença.
    maior = 0;                                                      %variável de auxílio para do maior elemento.
    maiorr = 0;                                                     %variável resposta para o maior elemento.
    count=1;                                                        %contador de iterações.
    [linha, coluna] = size(M);
    
    if(linha == coluna)
        A = [M'; B]';
        disp(A);
        p = 0;
        q = 0;

        while(r>e)
            r = 0;
            difr = 0;
            maiorr = 0;
            for i=1:linha                                           %Calcula todos os Xis com base no vetork e adiciona o resultado no vetorkk.
               for j=i+1:linha                                      %Calcula "p" com os Xjs > em indice que Xi utilizando os valores do vetork.
                   p = p + vetork(1,j) * A(i,j);
               end
               if(i~=0)
                   for k=i-1:-1:1                                   %Calcula "q" com os Xjs < em indice que Xi utilizando os valores do vetork.
                       q = q + vetork(1,k) * A(i,k);
                   end
               end
               vetorkk(1,i) = (A(i,linha+1) - (p+q)) / A(i,i);      %Calcula o Xi utilizando-se de "p" e "q" já calculados, e o inclui no vetorkk.
               p = 0;
               q = 0;
            end
            
            for t=1:linha                                           %Calcula a maior diferença em módulo entre vetorkk e vetork no indice t.
                dif = abs(vetorkk(1,t) - vetork(1,t));
                if(difr < dif)
                    difr = dif;
                end
                maior = abs(vetorkk(1,t));                          %Calcula o maior elemento em módulo do vetorkk.
                if (maiorr < maior)
                   maiorr = maior;
                end
            end
            r = difr / maiorr;                                      %Calcula a condição de parada.
            disp(['---          ITERAÇÃO ', num2str(count), '         ---']);
            disp(['vetork = ', num2str(vetork)]);
            disp(['vetorkk = ', num2str(vetorkk)]);
            disp(['r = ', num2str(r)]);
            disp(' ');
            count=count+1;
            
            for u=1:linha                                           %Prepara a próxima iteração, passando os valores de vetorkk para vetork, e zerando o vetorkk.
               vetork(1,u) = vetorkk(1,u);
               vetorkk(1,u) = 0;
            end           
        end
    end
end