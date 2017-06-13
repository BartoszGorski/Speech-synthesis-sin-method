function [ amplitude,phase ] = retriveAmp_Phase( fo, fs, Yabs, Yang )

%zwraca pobrane amplitudy i fazy danego sygnalu

index=round((fs/2)/fo); %obliczenie ilosci pobieranych amplitud/faz

amplitude=zeros(1,index-1);  %uwtorzenie zerowego wektora amplitud
phase=zeros(1,index-1);  %uwtorzenie zerowego wektora amplitud
j=0;
for i=1:index-1
    j=j+1;
    amplitude(j)=Yabs(round((i*fo)*length(Yabs)/(fs/2)+1));
    phase(j)=Yang(round((i*fo)*length(Yabs)/(fs/2)+1));
end

end

