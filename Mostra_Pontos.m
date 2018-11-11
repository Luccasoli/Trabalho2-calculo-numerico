function Mostra_Pontos(vetorx,vetory,a)
    disp('-----------------------------');
    disp('PONTO             |   PRESSÃO');
    for i=1:a
        disp(['X', num2str(i), ' = ' num2str(vetorx(1, i)),'                ', num2str(vetory(1, i))]);
    end 
    disp(' ');
end