clear
%%%%%%%%%%%%%Lectura de audio
[uno, fs1] = audioread('uno.wav');
[dos, fs2] = audioread('dos.wav');
uno=uno(1:4:end,1); 
fs1=fs1/4;
dos=dos(1:4:end,1); 
fs2=fs2/4;

sound(uno,fs1)
sound(dos,fs2)
figure, plot(uno)
figure,plot(dos)
%%%%%%%%%%%%%Iguala longitudes de audio
if length(uno)<length(dos)
  dif=length(dos)-length(uno);
  uno=[uno; zeros(dif,1)];
else
    dif=length(uno)-length(dos);
    dos=[dos; zeros(dif,1)];
end
%%%%%%%%%%%%%Reproducción de audio
sound(uno,fs1)

%%%%%%%%%%%%% Parametros para la transformada 
T = 1/fs1;             % Periodo de muestreo   
L=length(uno);         % Longitud de la señal
t = (0:L-1)*T;         % Vector del tiempo
n = 2^nextpow2(L);     % Puntos de la tranformada 
f = fs1*(0:(n/2))/n;    % Vector de frecuencias
%%%%%%%%%%%%% Tranformada de Fourier señal uno
UNO = fft(uno,n);        % Tranformada
UNO_mag = abs(UNO/L);          % Estandarización
%%%%%%%%%%%%% Tranformada de Fourier señal dos
DOS = fft(dos,n);        % Tranformada
DOS_mag = abs(DOS/L);          % Estandarización
%%%%%%%%%%%%% Gráficas 
figure, subplot(5,1,1)                  
plot(f,UNO_mag(1:n/2+1),'k')
subplot(5,1,2) 
plot(f,DOS_mag(1:n/2+1),'k')


%%%%%%%%%%%%% Modulación
Fs=8*fs1;
T = 1/Fs;             % Sampling period       
L=length(dos);        % Length of signal
t = (0:L-1)*T;        % Time vector
S = uno'.*sin(2*pi*12000*t) + dos'.*sin(2*pi*36000*t);

%%%%%%%%%%%% Transformada señal modulada
MOD = fft(S,n);
MOD_mag = abs(MOD/L);
f = Fs*(0:(n/2))/n;
subplot(5,1,3) 
plot(f,MOD_mag(1:n/2+1),'k')


Recuperada=S.*sin(2*pi*12000*t);
coef = csvread("coeficientes1.csv");
yn= conv(Recuperada, coef, "same");
sound(yn,fs1)

Recuperada2=S.*sin(2*pi*36000*t);
coef2 = csvread("coeficientes1.csv");
yn2= conv(Recuperada2, coef2, "same");
sound(yn2,fs2)



##%%%%%%%%%%%% Filtrado
##coef = csvread("coeficientes1.csv");
##COEF= fft(coef,n);
##COEF_mag = abs(COEF/length(coef));
##subplot(5,1,4)
##plot(f,COEF_mag(1:n/2+1),'k')
##UNO_rec=MOD.*COEF';
##subplot(5,1,5)
##UNO_rec_mag = abs(UNO_rec/length(UNO_rec));
##%plot(f,UNO_rec_mag(1:n/2+1),'k')
##
##%%%%%%%%%%%% Centrando espectro 
##UNO_rec_centrado=UNO_rec*0;
##UNO_rec_centrado(end-length(UNO_rec(1:n/8+1))+1:end)=UNO_rec(1:n/8+1);
##UNO_rec_centrado(end-length(UNO_rec(1:n/8+1))+1:end)=UNO_rec(n/8+2:n/4);
##%plot(abs(UNO_rec(1:n/8+1)),'k')
##plot(abs(UNO_rec_centrado),'k')
##uno_rec= conv(S, coef, "same");
##uno_rec=uno_rec.*sin(2*pi*12000*t)
##sound(uno_rec,fs1)
##figure
##plot(uno,'k')
##hold on
##plot(uno_rec,'r--')

##
##f = fs1*(0:(n/2))/n;
##UNO_rec = fft(uno_rec,n);
##subplot(4,1,4) 
##plot(f,UNO_rec(1:n/2+1),'k')


##P1(2:end-1) = 2*P1(2:end-1);
##f = Fs*(0:(n/2))/n;
##%figure
##%plot(f,P1,'k')
##%hold on
##coef = csvread("coeficientes1.csv");
##yn= conv(S, coef, "same");
##yn=yn;
##Y = exp(-1i*Fs*6000*t)'.*fft(yn,n);
##P2 = abs(Y/L);
##P1 = P2(1:n/2+1);
##P1(2:end-1) = 2*P1(2:end-1);
##f = Fs*(0:(n/2))/n;
##plot(f,P1,'r--')
##
##sound(yn,fs1)
##
##%figure
##%plot(yn,'k')
##%hold on
##%plot(uno,'r--')
##%Wl=0;
##%W2=0.5;
##%[b, a] = butter (n, [Wl, Wh])