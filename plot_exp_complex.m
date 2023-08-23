plot3(t(1),re(1),im(1),'r.');
hold on
xlim([0,5])
ylim([-1.3,1.3])
zlim([-1.3,1.3])
view([17,15])
grid on
for i=2:length(t)
plot3(t(i),re(i),im(i),'r.');
pause(0.1)
end