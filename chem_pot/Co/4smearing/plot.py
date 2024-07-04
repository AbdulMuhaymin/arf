import matplotlib.pyplot as plt
import numpy as np

def read_data(file_name):
    x_values = []
    y_values = []
    with open(file_name, 'r') as file:
        for line in file:
            #print(line)
            x, y = map(float, line.strip().split())
            x_values.append(x)
            y_values.append(y)
            #print(x, y, x_values, y_values)
    return x_values, y_values

file_names = ['gauss.dat', 'm-p.dat', 'm-v.dat']
colors = ['r','g','b']
for c, file_name in zip(colors, file_names):
    x, y = read_data(file_name)

    plt.plot(x, (np.array(y)+753.42276514)*13605, marker='o', markersize=10, markerfacecolor=c, linestyle=':', linewidth=2, color='black', label=file_name)

plt.xlabel('degauss broadening (Ry)', fontsize=20)
plt.ylabel(r'$ E - E_{min}\,$ (Ry)', fontsize=20)
plt.title('Smearing convergence test for HCP Co', fontsize=20)
plt.xticks(fontsize=15)
plt.yticks(fontsize=15)
plt.legend()
plt.grid(False)
plt.show()