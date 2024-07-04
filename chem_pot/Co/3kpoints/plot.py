import matplotlib.pyplot as plt

kdims = []
kpts = []
energies = []

with open('data2', 'r') as file:
    for line in file:
        print(line.strip().split())
        kdim = int(line.strip().split(' ')[0])
        kpt = int(line.strip().split(' ')[1])
        energy = float(line.strip().split(' ')[2])

        kdims.append(kdim)
        kpts.append(kpt)
        energies.append(energy)

import numpy as np
e0 = np.min(energies)
convergence_values = []
for i in range(1, len(energies)):
    convergence = ((energies[i] - energies[i-1]) / kpts[i]) * 13605
    convergence_values.append(convergence)

plt.plot(kpts[1:], convergence_values, marker='o', markersize=10, markerfacecolor='blue', linestyle=':', linewidth=2, color='black')
plt.xlabel('K-points grid (number of k-points)', fontsize=20)
plt.ylabel(r'$\Delta E\,$ (meV)', fontsize=20)
plt.title('K-points convergence test for HCP Co', fontsize=20)
plt.xticks(fontsize=15)
#r"$12 \times 12 \times 6\, (76)$", 
labels = [r"$14 \times 14 \times 7 \, (96)$", r"$16 \times 16 \times 8 \, (150)$", r"$18 \times 18 \times 9 \, (185)$"]
plt.xticks([96, 150, 185], labels)
plt.yticks(fontsize=15)
plt.grid(False)
plt.show()