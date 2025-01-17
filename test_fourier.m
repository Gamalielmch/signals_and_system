%clear
%%%%%%%%%%%%%Lectura de audio
[uno, fs1] = audioread('uno.wav');
[dos, fs2] = audioread('dos.wav');
uno=uno(1:2:end,1); 
fs1=fs1/2;
dos=dos(1:2:end,1); 
fs2=fs2/2;

%sound(uno,fs1)
%sound(dos,fs2)
figure, plot(uno)
figure, plot(dos)
%%%%%%%%%%%%% Iguala longitudes de audio
if length(uno)<length(dos)
  dif=length(dos)-length(uno);
  uno=[uno; zeros(dif,1)];
else
    dif=length(uno)-length(dos);
    dos=[dos; zeros(dif,1)];
end

%%%%%%%%%%%%%%%%%%%% TRANSFORMADA DE FOURIER DESPLAZADA
T = 1/fs1;             % Periodo de muestreo   
L=length(uno);         % Longitud de la señal
n = 2^nextpow2(L);     % Puntos de la tranformada 
f = fs1*(0:(n/2))/n;
t = (0:L-1)*T;
UNO = fft(uno'.*exp(2*pi*1i*5000*t),n);      % Transformada
UNO_mag = abs(UNO/L);  % Magnitud
figure, 
plot([-f(end-1:-1:1),f(1:end-1)]...
,fftshift(UNO_mag))
##
##%%%%%%%%%%%%%%%%%%%%%% MODULACIÓN EN AMPLITUD 
S = uno'.*exp(2*pi*1i*5000*t) + dos'.*exp(-2*pi*1i*5000*t);
Sf = fft(S,n); 
Sf_mag = abs(Sf/L); 
figure, 
plot(fftshift(Sf_mag))

##%%%%%%%%%%%%%%%%%%%%%% DEMODULACIÓN EN AMPLITUD 
Recuperada1=S.*exp(-2*pi*1i*5000*t) ;
Recuperada2=S.*exp(2*pi*1i*5000*t);
sound(Recuperada1,fs1)
sound(Recuperada2,fs1)