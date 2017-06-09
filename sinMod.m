clear all; close all; clc

[y,fs]=audioread('Mal.wav');

y=y(12302:13307);       % wycięta litera 'a'
% y=y(4000:5500);
N=length(y);

figure;
plot(y);
xlabel('probki');
title('wyciety sygnal');

figure;
x=[1:1:N]/fs;
plot(x,y);
xlabel('Czas');
title('wyciety sygnal');

%% fft
Y=fft(y);              % transformata Fouriera
Y=Y(1:N/2);
Yabs= abs(Y);
f = fs*(1:(N/2))/N;    % liczenie czestotliwości dla każdej próbki

figure;
plot(f,Yabs);
grid on;
xlabel('f (Hz)');
title('FFT abs(Y)');
   
figure;
plot(f,angle(Y));
grid on;
xlabel('f (Hz)');
title('FFT angle(Y)');


%% zaokraglenie fft

YA=1./fft(lpc(y,60),N);
YA=YA(1:(N/2));
figure;
plot(f,abs(Y),f,abs(YA));
grid on;
xlabel('f (Hz)');
title('FFT abs(Y)');
figure;
plot(f,angle(Y),f,angle(YA));
grid on;
xlabel('f (Hz)');
title('FFT angle(Y)');


%%
    
x = recreateSignal(Y, fs, 2);
xa = recreateSignal(YA, fs, 2);

%%



