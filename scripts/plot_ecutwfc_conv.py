import matplotlib.pyplot as plt

cutoffs = []
convergence_values = []

with open('data.txt', 'r') as file:
    
    lines = file.readlines()
    for i in range(1, len(lines)):
        prev_cutoff, prev_energy = map(float, lines[i-1].split())
        cutoff, energy = map(float, lines[i].split())
        convergence = abs((energy - prev_energy)/ (cutoff - prev_cutoff)) * 13605
        print(cutoff, convergence)
        cutoffs.append(cutoff)
        convergence_values.append(convergence)

plt.plot(cutoffs, convergence_values, marker='o', markersize=10, markerfacecolor='blue', linestyle=':', linewidth=2, color='black')
plt.xlabel('ecutwfc (Ry)', fontsize=20)
plt.ylabel(r'$\Delta E = (E_2 - E_1)/5 \,$ (meV/Ry)', fontsize=20)
plt.title(r'Kinetic energy cutoff convergence test for cubic zinc-blende ZnS', fontsize=20)
plt.xticks(fontsize=12)
plt.yticks(fontsize=12)
plt.grid(False)
plt.show()
