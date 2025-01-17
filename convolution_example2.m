f1 = @(t) abs(t) <= 2;
f2 = @(t) exp(-t).*(t>=0);
y2 = @(t) integral(@(tau)(f1(tau).*f2(t-tau)),-8,t);
tval=-7:0.01:7;
yval=zeros(1,length(tval));
for i=1:length(tval) 
   yval(i)= y2(tval(i));
end

figure, hold on
subplot(3,1,1)
plot(tval,f1(tval)), title('f1(t)'), xlabel('t'), ylim([0,1.3])
subplot(3,1,2)
plot(tval,f2(tval)), title('f2(t)'), xlabel('t'), ylim([0,1.3])
subplot(3,1,3)
plot(tval,yval), title('y(t)'), xlabel('t'), ylim([0,1.3])
