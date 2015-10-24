import sys

f = open(sys.argv[1])
name = sys.argv[1].split(".")[0]
out = []

for _ in range(40):
    out.append([])
    for _ in range(32):
        b = f.read(8)
        b = hex(int(''.join([str(ord(x)) for x in b]), base=2))
        print(b)
        out[-1].append(b)

print(out)
