function [ Yabs, Yang ] = orgFFT( y, N, fs )

% fft
Y=fft(y);              % transformata Fouriera
Y=Y(1:N/2);
Yabs = abs(Y);
Yang = angle(Y);
f = fs*(1:(N/2))/N;    % liczenie czestotliwości dla każdej próbki

% figure;
% plot(f,Yabs);
% grid on;
% xlabel('f (Hz)');
% title('FFT abs(Y)');
   
% figure;
% plot(f,Yang);
% grid on;
% xlabel('f (Hz)');
% title('FFT angle(Y)');

end

