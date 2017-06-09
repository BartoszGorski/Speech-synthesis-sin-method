function x = recreateSignal( Y, fs, t )

N=length(Y);
N=N*2;
f = fs*(1:(N/2))/N;

s=sign(diff(abs(Y)));
k=0;
for i=1:length(s)-1
    if ((s(i)+s(i+1))==0 && s(i)~=-1)
%     if ((s(i)+s(i+1))==0 && s(i)~=-1)
        k=k+1;
        frequency(k)=f(i+1);
        amplitude(k)=abs(Y(i+1));
        phase(k)=angle(Y(i+1));
    end
end

figure;
plot(frequency,amplitude);
grid on;
xlabel('f (Hz)');
title('Odtworzone FFT');

t = t*fs;
n=(1:t)/fs;
% n=(1:N)/fs;   %sygnal dlugosci wycietego
x=zeros(size(n));
for i=1:length(frequency)
    x=x+amplitude(i)*sin(2*pi*frequency(i)*n+phase(i))/N;
end


figure;
plot(n,x);
title('Odtworzony sygnal');

end

