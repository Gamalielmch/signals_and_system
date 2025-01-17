ecgr = load("ecgr.txt");
n=0:length(ecgr)-1;
figure, subplot(2,1,1)
plot(n,ecgr), title('señal de electrocardiograma')
subplot(2,1,2)
plot(n(1:200),ecgr(1:200)), title('fragmento de la señal de ecgr')
ylim([-1,2])

coef = csvread("coeficientes.csv");
figure
plot(coef)

yn = conv(ecgr, coef, "same");
figure
plot(n,yn)