# importing libraries
import numpy as np
import time
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

# creating initial data values
t=np.linspace(0,4,1000)
f=1
re=np.cos(2*np.pi*f *t)
im=np.sin(2*np.pi*f *t)
plt.plot(re,im,'k-')

# to run GUI event loop
plt.ion()
 
# here we are creating sub plots
figure = plt.figure(figsize=(5,5))
ax = figure.add_subplot(111, projection='3d')
ax.set_xlim(0,4)
ax.set_ylim(-1,1)
ax.set_zlim(-1,1)
# plt.zlim([-1.5, 1.5])
x=[0]
y=[1]
z=[0]
line1, =ax.plot(x,  y, z, 'k-')
# setting title
plt.title("Phasor", fontsize=20)
# setting labels
ax.set_xlabel("Time")
ax.set_ylabel("Real")
ax.set_zlabel('Imaginary')
# Loop
input()
for i in range(1,1000):
    x.append(t[i])
    y.append(re[i])
    z.append(im[i])
    # updating data values
    line1.set_xdata(x)
    line1.set_ydata(y)
    line1.set_3d_properties(z)
    # drawing updated values
    figure.canvas.draw()
 
    # This will run the GUI event
    # loop until all UI events
    # currently waiting have been processed
    figure.canvas.flush_events()
 
    # time.sleep(0.0000002)
plt.show()


