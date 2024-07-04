import matplotlib.pyplot as plt

kdims = []
kpts = []
energies = []

with open('data.out', 'r') as file:
    for line in file:
        kdim = float(line.strip().split(' ')[0])
        kpt = float(line.strip().split(' ')[1])
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
labels = [r"$8 \times 8 \times 8 \, (35)$", r"$10 \times 10 \times 10 \, (56)$", r"$12 \times 12 \times 12 \, (84)$", r"$14 \times 14 \times 14 \, (120)$", r"$16 \times 16 \times 16 \, (165)$"]
plt.xticks([35, 56, 84, 120, 165], labels)
plt.yticks(fontsize=15)
plt.grid(False)
plt.show()