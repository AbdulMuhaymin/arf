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
for file_name in file_names:
    x, y = read_data(file_name)

    plt.plot(x, (np.array(y)+658.53998257)*13605, marker='o', markersize=10, linestyle=':', linewidth=2, label=file_name)
    #plt.plot(x, (np.array(y)+658.5568)*13605, marker='o', markersize=10, markerfacecolor='blue', linestyle=':', linewidth=2, color='black', label=file_name)

plt.xlabel('degauss broadening (Ry)', fontsize=20)
plt.ylabel(r'$ E - E_{min}\,$ (Ry)', fontsize=20)
plt.title('Smearing convergence test', fontsize=20)
plt.xticks(fontsize=15)
plt.yticks(fontsize=15)
plt.legend()
plt.grid(False)
plt.show()
