import matplotlib.pyplot as plt
from matplotlib.ticker import FormatStrFormatter
import numpy as np

kdims = []
kpts = []
energies = []

# Read data from file
with open('data.txt', 'r') as file:
    for line in file:
        values = line.split()
        kdim = int(values[0])
        kpt = int(values[1])
        energy = float(values[2])

        kdims.append(kdim)
        kpts.append(kpt)
        energies.append(energy * 13605 + 135021210)

# Create figure and subplots
fig, (ax1, ax2) = plt.subplots(2, 1, sharex=True, gridspec_kw={'height_ratios': [3, 10]})
fig.subplots_adjust(hspace=0.1)  # Adjust the space between the plots

# Plot data on both subplots
ax1.plot(kdims[0], energies[0], marker='o', markersize=10, markerfacecolor='blue', linestyle=':', linewidth=2, color='black')
ax2.plot(kdims, energies, marker='o', markersize=10, markerfacecolor='blue', linestyle=':', linewidth=2, color='black')

# Set the y-limits for both subplots
ax1.set_ylim(1550, 1650)  # Upper range
ax2.set_ylim(0, 20)      # Lower range

# Hide the spines between the two plots
ax1.spines['bottom'].set_visible(False)
ax2.spines['top'].set_visible(False)

# Add diagonal lines to indicate the break
d = .005  # How big to make the diagonal lines in axes coordinates
kwargs = dict(transform=ax1.transAxes, color='k', clip_on=False)
ax1.plot((-d, +d), (-d, +d), **kwargs)  # Top-left diagonal
ax1.plot((1 - d, 1 + d), (-d, +d), **kwargs)  # Top-right diagonal

kwargs.update(transform=ax2.transAxes)  # Switch to the bottom subplot
ax2.plot((-d, +d), (1 - d, 1 + d), **kwargs)  # Bottom-left diagonal
ax2.plot((1 - d, 1 + d), (1 - d, 1 + d), **kwargs)  # Bottom-right diagonal

# Labels and title
plt.xlabel('K-points grid (number of k-points)', fontsize=20)
ax2.set_ylabel(r'Total Energy + 135021210 (meV)', fontsize=20)
plt.suptitle('K-points convergence test for cubic ZnS', fontsize=20)

# X-axis tick labels
labels = [r"$1 \times 1 \times 1\, (1)$", 
          r"$2 \times 2 \times 2\, (4)$", 
          r"$3 \times 3 \times 3 \, (4)$", 
          r"$4 \times 4 \times 4 \, (10)$",
          r"$5 \times 5 \times 5 \, (10)$", 
          r"$6 \times 6 \times 6 \, (20)$"]
plt.xticks([1, 2, 3, 4, 5, 6], labels, fontsize=15)

# Format y-axis tick labels
formatter = FormatStrFormatter('%.1f')
ax1.yaxis.set_major_formatter(formatter)
ax2.yaxis.set_major_formatter(formatter)
ax1.tick_params(axis='y', which='major', labelsize=15)
ax2.tick_params(axis='y', which='major', labelsize=15)

# Show plot
plt.show()
