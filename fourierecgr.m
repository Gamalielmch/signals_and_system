ecgr = load("ecgr.txt");
Fs = 200;
T = 1 / Fs
n=(0:(length(ecgr)-1))*1;
plot(n,ecgr)

figure
L=length(ecgr)
Fecgr=fft(ecgr);
plot(Fs/L*(-L/2:L/2-1),abs(fftshift(Fecgr)))


coef = csvread("coeficientes.csv");
yn= conv(ecgr, coef, "same");
figure
plot(n(1:300),yn(1:300))
