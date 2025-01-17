t=-4:0.01:4;
Tp=2;
w0=2/Tp;
tau=.5;
nc=150;
t0=.5*2*pi;
xm=zeros(1,length(t));
for k=-nc:nc
  if k==0
  coef(k+nc+1)=1/Tp;
  xm=xm+(1/Tp);
  else
  coef(k+nc+1)=(1/Tp)*sinc((w0*k*tau)/2)*exp(-1i*w0*k*(t0+tau/2)); 
  xm=xm+(abs(coef(k+nc+1))).*cos(w0*pi*k.*t+angle(coef(k+nc+1))); 
  end
  
end
plot(t,xm)
#stem(-nc:nc,unwrap(angle(coef)))
set(gca, 'xtick', -4:0.5:4);