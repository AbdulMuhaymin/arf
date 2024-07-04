import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

# Read data from the output file
data = []
with open("data2", "r") as f:
    for line in f:
        a, c, energy = line.strip().split("\t")
        data.append((float(a), float(c), float(energy)))

# Unpack data into separate lists
a_values, c_values, energy_values = zip(*data)


import numpy as np

# Convert data to numpy arrays
a_values = np.array(a_values)
c_values = np.array(c_values)
energy_values = np.array(energy_values)

# Create a meshgrid for a and c values
A, C = np.meshgrid(np.unique(a_values), np.unique(c_values))
E = np.zeros_like(A)

# Fill in energy values in the meshgrid
for a, c, energy in zip(a_values, c_values, energy_values):
    i = np.where(np.unique(a_values) == a)[0][0]
    j = np.where(np.unique(c_values) == c)[0][0]
    E[j, i] = (energy)#+487.44699112)*13.6

# Create contour plot with smoother colorbar
plt.figure()
ax = plt.gca()
ax.tick_params(axis='both', which='major', labelsize=15)
contour = plt.contourf(A, C, E, cmap='viridis', levels=100)
plt.colorbar(contour, label='Total Energy (Ry)')
plt.xlabel('a (Bohr radius)', fontsize=20)
plt.ylabel('c (Bohr radius)', fontsize=20)
plt.xticks(fontsize=15)
plt.yticks(fontsize=15)
plt.title('Contour Plot of Energy as a Function of a and c for HCP Zn', fontsize=20)
plt.show()
