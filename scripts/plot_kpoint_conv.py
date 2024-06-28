import matplotlib.pyplot as plt

kdims = []
kpts = []
energies = []

with open('data.txt', 'r') as file:
    for line in file:
        kdim = int(line.split('   ')[0])
        kpt = int(line.split('   ')[1])
        energy = float(line.split('   ')[2])

        kdims.append(kdim)
        kpts.append(kpt)
        energies.append(energy)

convergence_values = []
for i in range(1, len(energies)):
    convergence = (energies[i] - energies[i-1]) / (kpts[i]-kpts[i-1]) * 13605
    convergence_values.append(convergence)

plt.plot(kdims[1:], convergence_values, marker='o', markersize=10, markerfacecolor='blue', linestyle=':', linewidth=2, color='black')
plt.xlabel('K-points grid (number of k-points)', fontsize=20)
plt.ylabel(r"$\Delta E = (E_2 - E_1)/ \Delta$ # of k-points (meV/k-point)", fontsize=20)
plt.title('K-points convergence test for cubic ZnS', fontsize=20)
plt.xticks(fontsize=15)
labels = [r"$2 \times 2 \times 2\, (4)$",  
          r"$4 \times 4 \times 4 \, (10)$",
          r"$6 \times 6 \times 6 \, (20)$"]
plt.xticks([2, 4, 6], labels)
plt.yticks(fontsize=15)
plt.grid(False)

print(convergence_values)
plt.show()