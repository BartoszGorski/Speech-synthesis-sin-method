function [ YRabs, YRang ] = roundFFT( y, N, fs )

f = fs*(1:(N/2))/N;    % liczenie czestotliwości dla każdej próbki

% zaokraglenie fft
YR=1./fft(lpc(y,60),N);
YR=YR(1:(N/2));
YRabs=abs(YR);
YRang=angle(YR);

% figure;
% % plot(f,Yabs,f,YRabs);
% plot(f,YRabs);
% grid on;
% xlabel('f (Hz)');
% title('FFT abs(Y)');

% figure;
% % plot(f,Yang,f,YRang);
% plot(f,YRang);
% grid on;
% xlabel('f (Hz)');
% title('FFT angle(Y)');

end

