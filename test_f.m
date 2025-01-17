%Lectura de las señales
[uno, fs1] = audioread('uno.wav');
[dos, fs2] = audioread('dos.wav');
uno=uno(:,1);
dos=dos(:,1);
%Igualar las longitudes
if length(uno)<length(dos)
  dif=length(dos)-length(uno);
  uno=[uno; zeros(dif,1)];
else
    dif=length(uno)-length(dos);
    dos=[dos; zeros(dif,1)];
end

%Transformada de Fourier
%%%%%%%%%%%%%%%%%%%%%
T = 1/fs1;             % Periodo de muestreo   
L=length(uno);         % Longitud de la señal
n = 2^nextpow2(L);     % Puntos de la tranformada 
f = fs1*(0:(n/2))/n;   % Vector frecuencia
t = (0:L-1)*T;         % Vector del tiempo 
%%%%%%%%%%%%%%%%%%%%
UNO = fft(uno'.*exp(2*pi*1i*t*15000),n);      % Transformada
UNO_mag = abs(UNO/L);  % Magnitud
figure, subplot(1,3,1) 
plot([-f(end-1:-1:1),f(1:end-1)]...
,fftshift(UNO_mag))
%%%%%%%%%%%%%%%%%%%%
fusion=uno'.*exp(2*pi*1i*t*15000)+...
dos'.*exp(-2*pi*1i*t*15000);

uno_recovery=fusion.*exp(-2*pi*1i*t*15000)
sound(uno_recovery,fs1)