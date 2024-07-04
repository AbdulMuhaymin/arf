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
e0 = np.min(energy_values)
print(e0)

# Create a meshgrid for a and c values
A, C = np.meshgrid(np.unique(a_values), np.unique(c_values))
E = np.zeros_like(A)

# Fill in energy values in the meshgrid
for a, c, energy in zip(a_values, c_values, energy_values):
    i = np.where(np.unique(a_values) == a)[0][0]
    j = np.where(np.unique(c_values) == c)[0][0]
    E[j, i] = (energy-e0)*13605

# Create contour plot with smoother colorbar
plt.figure()
ax = plt.gca()
ax.tick_params(axis='both', which='major', labelsize=15)
contour = plt.contourf(A, C, E, cmap='viridis', levels=200)
plt.colorbar(contour, label='Total Energy - E0 (meV)')
plt.xlabel('a (Angstrom)', fontsize=20)
plt.ylabel('c (Angstrom)', fontsize=20)
plt.xlim(2.48,2.5)
#plt.ylim(3.96)
plt.title('Contour Plot of Energy as a Function of a and c for HCP Co', fontsize=20)
plt.show()
