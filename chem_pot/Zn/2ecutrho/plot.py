import matplotlib.pyplot as plt

cutoffs = []
convergence_values = []

with open('Etot-vs-dual.dat', 'r') as file:
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
plt.xlabel('ecutrho (Ry)', fontsize=20)
plt.ylabel(r'$\Delta E\,$ (meV)', fontsize=20)
plt.title(r'Charge density kinetic energy cutoff convergence test for HCP Zn', fontsize=20)
plt.xticks(fontsize=12)
plt.yticks(fontsize=12)
plt.grid(False)
plt.show()