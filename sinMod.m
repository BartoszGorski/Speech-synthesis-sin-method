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

figure(4)
phs2 = unwrap(angle(Y));    % wyliczenie fazy dwustronne spektrum
phs1 = phs2(1:dl/2+1);      % polowa spektrum
plot(f,phs1);
% plot(f,phs1*180/pi);
grid on;

%%
    
fo=100;                     % pierwszy peak period
multipleFo=(0:fo:(fs/2));   % odczytanie wielokrotnosci fo
FoHop=floor(length(P1)/length(multipleFo)); % wyliczenie co ile probek bedziemy odczytywac amplitude i faze

A=zeros(1,length(multipleFo));  %uwtorzenie zerowego wektora amplitud
j=0;
for i=2:FoHop:length(P1)
    j=j+1;
    A(j)=P1(i); %przypisanie wartosci amplitud
end

fi=zeros(1,length(multipleFo));  %uwtorzenie zerowego wektora amplitud
j=0;
for i=2:FoHop:length(phs1)
    j=j+1;
    fi(j)=phs1(i); %przypisanie wartosci fazy
end

n=(1:fo)/fs;
x=zeros(1,length(A));   %wektor wartosci nowego sygnalu

for k=1:length(A)
    
  x(k)=A(k)*sin(2*pi*fo*n(k)+fi(k));
    
end

xx=zeros(1,length(f));  % wektor dlugosci naszego sygnalu
j=1;
for i=1:ceil(length(f)/length(A)):length(f) 
    xx(i)=A(j);     % poszerzenie sygnalu aby mial dlugosc oryginalnego sygnalu
    j=j+1;
end

figure(5)
plot(f,xx);
grid on;


z=ifft(xx);
figure(6);
t=[1:1:(dl/2)+1]/fs;
plot(t,z);
