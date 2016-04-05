import serial
import numpy as np
from collections import deque
from matplotlib import pyplot as plt
plt.ion()
ser = serial.Serial('/dev/ttyACM2', 115200)
l = ser.readline().strip().split()
ydata = []
lines = []
for _ in range(len(l)):
    ydata.append(deque([0.0] * 1200))
    line, = plt.plot(np.arange(-1200, 0)/10.0, ydata[-1])
    lines.append(line)
plt.ylim([10, 70])
plt.grid()
plt.xlabel("Time (s)")
plt.ylabel("Temperature (C)")

while True:
    data = ser.readline().strip().split()
    for idx, d in enumerate(data):
        ydata[idx].append(float(d) / 10.0)
        ydata[idx].popleft()
        lines[idx].set_ydata(ydata[idx])
    plt.draw()
