n=-3:3
xn=[0,0,0,1/2,0,0,0]
hn=[0,1,2,3,2,1,0]
yn=conv(xn,hn)
figure, subplot(3,1,1)
stem(n,xn), title('x[n]'), xlabel('n')
subplot(3,1,2)
stem(n,hn), title('h[n]'), xlabel('n')
subplot(3,1,3)
stem(-6:6,yn), title('y[n]'), xlabel('n')
