clear all;
close all;
clc;
warning ('off','all');

% [y,fs]=audioread('sounds/SAmolot.wav');
% % [y,fs]=audioread('sounds/Motorowka.wav');
% 
% plot(y);
% title('wyciety sygnal');
% xlabel('Probki');
% ylabel('Amplituda');

%% litera A
[y,fs]=audioread('sounds/SAmolot.wav');
a=y(33155:36310);        % wycięta litera 'a'
fo = 111.607;            %czestotliwosc pelnego okresu sygnału                   
time=0.1;                   %czas trwania utworzonego dzwieku
a = sinModulation( a, fs, fo, time );

%% litera M
[y,fs]=audioread('sounds/SAmolot.wav');
m=y(37910:41680);
fo = 105.26;
time=0.085;
m = sinModulation( m, fs, fo, time );

%% litera L
[y,fs]=audioread('sounds/SAmolot.wav');
l=y(50054:53068);
fo = 101.27;
time=0.06;
l = sinModulation( l, fs, fo, time );

%% litera O
[y,fs]=audioread('sounds/Modulacje.wav');
o=y(44380:46380);
fo = 133.33;
time=0.06;
o = sinModulation( o, fs, fo, time );

%% litera T ?? - slabe
% [y,fs]=audioread('sounds/SAmolot.wav');
% t=y(64215:65840);       
% fo = 133.607;                             
% time=0.5;                
% t = sinModulation( t, fs, fo, time );

%% litera T  - slabe
% [y,fs]=audioread('sounds/Motorowka.wav');
% t=y(72400:72890);
% fo = 142;
% time=0.03;
% t = sinModulation( t, fs, fo, time );

%% litera R  - slabe
% [y,fs]=audioread('sounds/Motorowka.wav');
% r=y(80680:81850);
% fo = 112.68;
% time=0.05;
% r = sinModulation( r, fs, fo, time );

%% litera W  - slabe
% [y,fs]=audioread('sounds/Motorowka.wav');
% w=y(86220:89010);
% fo = 106.67;
% time=0.5;
% w = sinModulation( w, fs, fo, time );
%%
mama = [m,a,m,a];
ala = [a,l,a];
% amator = [a,m,a,t,o,r];

