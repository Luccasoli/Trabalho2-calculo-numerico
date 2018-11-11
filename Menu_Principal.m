function Menu_Principal
    vetorx = 0;
    vetory = 0;
    a = 0;
    condicao = 5;
    while(condicao>4)
        disp('-----------------------------------------------');
        disp('-----------------MENU PRINCIPAL----------------');
        disp('1 - MÉTODO DE GAUSS.');
        disp('2 - MÉTODO DE GAUSS-JACOBI.');
        disp('3 - MÉTODO DE INTERPOLAÇÃO DE NEWTON.');
        disp('4 - FINALIZAR PROGRAMA.');
        valor = input('Digite a sua opção: ');
        switch valor  
            case 1
                [vetorx,a] = Gauss;

            case 2
                vetory = Gauss_jacob;
                Mostra_Pontos(vetorx,vetory,a);
                Ponto_Fragil(vetorx,a);
            case 3
                x = input('Digite a variável x: ');
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