function Ponto_Fragil(vetorx,a)
    aux = 0;
    for i=1:a
        aux = aux + vetorx(i);
    end
    aux = aux / a;
    disp('-----------------------------');
    disp(['O ponto mais fr�gil � = ', num2str(aux), ]);
    disp('Para calcular sua press�o utilize o m�todo de Newton.');
    disp(' ');
end