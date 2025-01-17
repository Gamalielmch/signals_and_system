nc=10
for k=-nc:nc
  if k==0
    coef(k+nc+1)=0;
  else
    coef(k+nc+1)=(3/(4*1i*k*pi))*...
    -exp(-1i*k*pi)+1+exp(-2*1i*k*pi)...
    -exp(-1i*k*pi);
  end
end
figure
title('Magnitud')
stem(-nc:nc,abs(coef))
figure
title('Angulo')
stem(-nc:nc,angle(coef))