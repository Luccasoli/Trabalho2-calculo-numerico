function Ponto_Fragil(vetorx,a)
    aux = 0;
    for i=1:a
        aux = aux + vetorx(i);
    end
    aux = aux / a;
    disp('-----------------------------');
    disp(['O ponto mais frágil é = ', num2str(aux), ]);
    disp('Para calcular sua pressão utilize o método de Newton.');
    disp(' ');
end