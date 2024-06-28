import matplotlib.pyplot as plt
import numpy as np

from matplotlib.ticker import FormatStrFormatter

x = []
y = []

with open('data.txt', 'r') as file:
    
    lines = file.readlines()
    for i in range(0, len(lines)):
        xx, yy = map(float, lines[i].split())
        x.append(xx)
        y.append(yy*13605)

plt.xticks(fontsize=12)
plt.yticks(fontsize=12)
plt.grid(False)

y = np.array(y)
y = y + 135021210

plt.scatter(x, y)
plt.plot(x, y)

ax = plt.gca()

# Set the formatter for the x-axis and y-axis to show 10 decimal places
formatter = FormatStrFormatter('%.2f')
ax.yaxis.set_major_formatter(formatter)
import numpy as np
plt.xlabel('ecutrho (Ry)', fontsize=20)
plt.ylabel('Total energy + 135021210 (meV)', fontsize=20)
#plt.yticks(np.linspace(0, 210, 15))
plt.title(r'Kinetic energy cutoff convergence test for cubic zinc-blende ZnS', fontsize=20)
plt.show()