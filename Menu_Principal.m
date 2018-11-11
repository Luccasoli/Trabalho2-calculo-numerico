function Menu_Principal
    vetorx = 0;
    vetory = 0;
    a = 0;
    condicao = 5;
    while(condicao>4)
        disp('-----------------------------------------------');
        disp('-----------------MENU PRINCIPAL----------------');
        disp('1 - M�TODO DE GAUSS.');
        disp('2 - M�TODO DE GAUSS-JACOBI.');
        disp('3 - M�TODO DE INTERPOLA��O DE NEWTON.');
        disp('4 - FINALIZAR PROGRAMA.');
        valor = input('Digite a sua op��o: ');
        switch valor  
            case 1
                [vetorx,a] = Gauss;

            case 2
                vetory = Gauss_jacob;
                Mostra_Pontos(vetorx,vetory,a);
                Ponto_Fragil(vetorx,a);
            case 3
                x = input('Digite a vari�vel x: ');
                Interpolacao_Newton(vetorx,vetory,x);
            case 4
               disp('Fim do programa.');
               condicao = 0;
            otherwise
                disp('-----------------------------------------------');
                disp(' Valor nao registrado, favor digitar novamente.');
                disp('-----------------------------------------------');
                disp(' ');
        end
    end
end