clear all; close all; clc

[y,fs]=audioread('Mal.wav');

y=y(12302:13307);       % wycięta litera 'a'
dl=length(y);

figure(1);
plot(y);

figure(2);
x=[1:1:dl]/fs;
plot(x,y);
xlabel('Czas');

%% fft
Y=fft(y);              % transformata Fouriera
Yabs= abs(Y);
f = fs*(1:(dl/2))/dl;       % liczenie czestotliwości dla każdej próbki

figure(3);
plot(f,Yabs(1:dl/2));
grid on;
xlabel('f (Hz)');

figure(4)
% phs = unwrap(angle(Y));    
phs = angle(Y);             % wyliczenie fazy 
plot(f,phs(1:dl/2));
% plot(f,(phs(1:dl/2)*180/pi));
grid on;

%%
    
fo=115.5;                     % ton krtaniowy
multipleFo=(1:fo:fs);       % odczytanie wielokrotnosci fo
FoHop=round(length(Yabs)/length(multipleFo)); % wyliczenie co ile probek bedziemy odczytywac amplitude i faze

A=zeros(1,length(multipleFo));  %uwtorzenie zerowego wektora amplitud
j=0;
for i=1:FoHop:length(Yabs)
    j=j+1;
    A(j)=Yabs(i);                 %przypisanie wartosci amplitud
end

fi=zeros(1,length(multipleFo));  %uwtorzenie zerowego wektora amplitud
j=0;
for i=1:FoHop:length(phs)
    j=j+1;
    fi(j)=phs(i); %przypisanie wartosci fazy
end


n=(1:fo)/fs;

x=zeros(1,dl);   %wektor wartosci nowego sygnalu
j=1;
for k=1:FoHop:dl
  x(k)=A(j)*sin(2*pi*fo*n(j)+fi(j));
  j=j+1; 
end

Xabs= abs(x);
figure(5)
plot(f,Xabs(1:dl/2));
xlabel('f (Hz)');
grid on;


z=ifft(x);
figure(6);
t=[1:1:dl]/fs;
plot(t,z);

%%

% Yslice = splice(Yabs);
