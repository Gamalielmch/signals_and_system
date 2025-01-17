t=-4*pi:0.01*pi:4*pi;
Tp=2*pi; %periodo
w0=(2*pi)/Tp; %frecuencia sin pi
alpha=0.4*pi; %duración del pulso
nc=10; %# de coeficientes 
xm=zeros(1,length(t));%incializar señall
for k=-nc:nc
  if abs(k)==1 
    coef(k+nc+1)=(-1/(8*pi))*...
    (1-cos(2*alpha)+k*1i*(2*pi-2*alpha+sin(2*alpha)));
  else
    coef(k+nc+1)= (1/ (2*pi*(k^2-1)) )*...
    ((-1)^(k+1)- exp(-j*k*alpha)*(cos(alpha)+1i*k*sin(alpha)));
  end
      xm=xm+(abs(coef(k+nc+1)))...
    .*cos(w0*k.*t+angle(coef(k+nc+1))); 
end
figure
plot(t,xm)
