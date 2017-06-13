function x = sinModulation( y, fs, fo, t )

y = downSamplingAndFiltration(y,fs,8000);
fs=8000;

N=length(y);


[ Yabs, Yang ] = orgFFT( y, N, fs );
% [ Yabs, Yang ] = roundFFT( y, N, fs );


%%

[amplitude,phase] = retriveAmp_Phase(fo, fs, Yabs, Yang);


% figure;
% plot(amplitude);
% grid on;
% xlabel('probki');
% title('Odtworzone FFT');

t = t*fs;
n=(1:t)/fs;
% n=(1:N)/fs;   %sygnal dlugosci wycietego

x = recreateSignal(amplitude, phase, fo, n, N);


% figure;
% subplot(2,2,1)
% plot(y);
% title('wyciety sygnal');
% xlabel('Probki');
% ylabel('Amplituda');
% 
% subplot(2,2,2)
% ty=[1:1:N]/fs;
% plot(ty,y);
% title('wyciety sygnal');
% xlabel('Czas');
% ylabel('Amplituda');
% 
% subplot(2,2,3)
% plot(x);
% title('Odtworzony sygnal');
% xlabel('Czas');
% ylabel('Amplituda');
% 
% subplot(2,2,4)
% plot(n,x);
% title('Odtworzony sygnal');
% xlabel('Probki');
% ylabel('Amplituda');



end

