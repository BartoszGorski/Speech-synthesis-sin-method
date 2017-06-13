function x = recreateSignal( amplitude, phase, fo, n, N)

x=zeros(size(n));   %wektor wartosci nowego sygnalu
for k=1:length(amplitude)
  x=x+amplitude(k)*sin(2*pi*k*fo*n+phase(k))/N;
end

end

