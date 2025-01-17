t=-4:0.01:4;
Tp=3; %periodo
w0=2/Tp; %frecuencia sin pi
tau=0.5; %duración del pulso
nc=10; %# de coeficientes 
t0=.3*2*pi; % inicio del pulso
xm=zeros(1,length(t));%incializar señall
for k=-nc:nc
  if k==0 
    coef(k+nc+1)=1/Tp;
    xm=xm+(1/Tp);
  else
    coef(k+nc+1)=(1/Tp)*...
    sinc((w0*k*tau)/2)*...
    exp(-1i*w0*k*(t0+tau/2));
    
    xm=xm+(abs(coef(k+nc+1)))...
    .*cos(w0*pi*k.*t+angle(coef(k+nc+1))); 

  end
end
figure
plot(t,xm)
set(gca, 'xtick', -4:0.5:4);
%figure
%stem(-nc:nc,abs(coef))
%figure
%stem(-nc:nc,angle(coef))