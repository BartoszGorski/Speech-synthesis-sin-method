function [ out_signal ] = downSamplingAndFiltration( in_signal, old_fs, new_fs )

% Filtracja dolnoprzepustowa sygnału w celu pozbycia się szumów i tła
fg = 4000; % czestotliwosc górna filtru FIR

N=50;               % rząd filtru
Wn=fg/(old_fs/2);    % pulsacja nominalna (graniczna)
filtrFIR=fir1(N,Wn,'low');

out_signal=filter(filtrFIR,1,in_signal);


[P,Q] = rat(new_fs/old_fs);
out_signal = resample(in_signal,P,Q);
% out_signal=out_signal(:,1);
% out_signal=downsample(out_signal,round((old_fs/new_fs)));

end

