function x = recreateSignal2( Y, fo, fs, t )

Yabs=abs(Y);
Yang=angle(Y);
                  
frequency=(1:fo:fs);       % odczytanie wielokrotnosci fo
NHop=round(length(Y)/length(frequency)); % wyliczenie co ile probek bedziemy odczytywac amplitude i faze

amplitude=zeros(1,length(frequency));  %uwtorzenie zerowego wektora amplitud
j=0;
for i=1:NHop:length(Yabs)
    j=j+1;
    amplitude(j)=Yabs(i);                 %przypisanie wartosci amplitud
end

phase=zeros(1,length(frequency));  %uwtorzenie zerowego wektora amplitud
j=0;
for i=1:NHop:length(Yang)
    j=j+1;
    phase(j)=Yang(i); %przypisanie wartosci fazy
end

figure;
plot(amplitude);
grid on;
xlabel('f (Hz)');
title('Odtworzone FFT');

t = t*fs;
n=(1:t)/fs;
% n=(1:length(Y)*2)/fs;   %sygnal dlugosci wycietego
x=zeros(size(n));   %wektor wartosci nowego sygnalu
for k=1:length(amplitude)
  x=x+amplitude(k)*sin(2*pi*k*fo*n+phase(k))/length(Y);
end

figure;
plot(n,x);
title('Odtworzony sygnal');

end

