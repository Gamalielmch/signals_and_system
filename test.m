ecgr = load("ecgr.txt");
n=0:length(ecgr)-1;
plot(n(1:300),ecgr(1:300))
coef = csvread("coeficientes.csv");
yn= conv(ecgr, coef, "same");
figure
plot(n(1:300),yn(1:300))