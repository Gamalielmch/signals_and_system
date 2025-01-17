tau=1;
w=-100:0.1:100
to=0.1;
Xjw= (1./(1i*w*tau)) .*  exp(-1i*w*to).* ( exp(-1i.*w*(tau))  + 1 ) 
plot(abs(Xjw))
Xjw(1001)=1;