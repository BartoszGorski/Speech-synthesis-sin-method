clear all; close all; clc

[y,fs]=audioread('mw1.wav');

y=y(34807:35181);       % wycięta litera 'a'
dl=length(y);

figure(1);
plot(y);

% figure(2);
% x=[1:1:dl]/fs;
% plot(x,y);
% xlabel('Czas');

%% fft
Y=fft(y);               % transformata Fouriera
P2=abs(Y);              % dwustronne spektrum
P1=P2(1:dl/2+1);        % wyznaczenie połowy spektrum
f = fs*(0:(dl/2))/dl;   % liczenie czestotliwości dla każdej próbki

figure(3);
plot(f,P1)
grid on;
xlabel('f (Hz)');

%%
    
fo=160;            % pierwszy peak period
A=(0:fo:(fs/2));   % odczytanie amplitud dla wielokrotności fo
fi2=zeros(1,length(A));

n=(1:fo)/fs;

x=zeros(1,length(A));

for k=1:length(A)
    
    x(k)=A(k)*sin(2*pi*fo*k*n(k));
    
end

figure(5)
plot(x);
