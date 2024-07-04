import matplotlib.pyplot as plt

cutoffs = []
convergence_values = []

with open('Etot-vs-kpoint.dat', 'r') as file:
    lines = file.readlines()
    for i in range(1, len(lines)):
        prev_cutoff, prev_energy = map(float, lines[i-1].split())
        cutoff, energy = map(float, lines[i].split())
        print(prev_cutoff)
        convergence = abs((energy - prev_energy)/ (cutoff - prev_cutoff)) * 13605
        print(cutoff, convergence)
        cutoffs.append(cutoff)
        convergence_values.append(convergence)

plt.plot(cutoffs, convergence_values, marker='o', markersize=10, markerfacecolor='blue', linestyle=':', linewidth=2, color='black')


plt.xlabel('K-points grid (number of k-points)', fontsize=20)
plt.ylabel(r'$\Delta E\,$ (meV)', fontsize=20)
plt.title('K-points convergence test', fontsize=20)
labels = [r"$12 \times 12 \times 6 \, (76)$", r"$14 \times 14 \times 7 \, (96)$", r"$16 \times 16 \times 8 \, (150)$", r"$18 \times 18 \times 9 \, (185)$"]

plt.xticks([76, 96, 150, 185], labels, fontsize=15)
plt.yticks(fontsize=15)
plt.grid(False)
plt.show()