[uno, fs1] = audioread('uno.wav');
uno=uno(1:4:end,1); 
fs1=fs1/4;
T = 1/fs1;             % Periodo de muestreo   
L=length(uno);         % Longitud de la señal
t = (0:L-1)*T;         % Vector del tiempo
n = 2^nextpow2(L);     % Puntos de la tranformada 
f = fs1*(0:(n/2))/n; 

%%%%%%%%%%%%% Tranformada de Fourier señal 
UNO = fft(uno,n);        % Tranformada
UNO_mag = abs(UNO/L); 
%%%%%%%%%%%%% Tranformada de Fourier señal desplazada
UNO_des = fft(uno'.*exp(1i*fs1*t),n);        % Tranformada
UNO_des_mag = abs(UNO_des/L); 
%%%%%%%%%%%%% Tranformada de Fourier señal desplazada
UNO_des2 = fft(uno'.*sin(fs1*t),n);        % Tranformada
UNO_des2_mag = abs(UNO_des2/L); 
figure, subplot(3,1,1)                  
plot([-f(end-1:-1:1),f(1:end-1)],fftshift(UNO_mag),'k')
subplot(3,1,2)   
plot([-f(end-1:-1:1),f(1:end-1)],UNO_des_mag,'k')
subplot(3,1,3)   
plot([-f(end-1:-1:1),f(1:end-1)],UNO_des2_mag,'k')