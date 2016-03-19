import serial
import numpy as np
from collections import deque
from matplotlib import pyplot as plt
ser = serial.Serial('/dev/ttyACM2', 115200)
ser.readline()

ydata = deque([0.0] * 1200)
plt.ion()
ax1 = plt.axes()
line, = plt.plot(np.arange(-1200, 0)/10.0, ydata)
plt.ylim([10, 70])
plt.grid()
plt.xlabel("Time (s)")
plt.ylabel("Temperature (C)")

while True:
    data = float(ser.readline().strip()) / 10.0
    ydata.append(data)
    ydata.popleft()
    line.set_ydata(ydata)
    plt.draw()
