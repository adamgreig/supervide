import sys
import numpy as np

fname = sys.argv[1]
name = fname.split(".")[0]

data = np.fromfile(fname, dtype=np.uint8).reshape(32, 40)[::-1, :]
data = np.packbits(data, axis=0)

print("static const uint8_t oled_icon_{}_data[4][40] = {{".format(name))

for y in range(4):
    print("    {" +
          ", ".join(["0x{:02x}".format(data[y][x]) for x in range(40)]) +
          "},")

print("};")
