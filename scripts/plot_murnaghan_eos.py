import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit

# Read data from file
data = np.loadtxt("data.txt")

# Separate data into lattice parameter and total energy
lattice_parameters = data[:, 0]
total_energies = data[:, 1]

# Define the Murnaghan equation of state
def murnaghan(V, E0, K0, Kp, V0):
    """Murnaghan equation of state."""
    E = E0 + K0*V0*((1/(Kp*(Kp-1)))*(V/V0)**(1-Kp)+V/(Kp*V0)-(1/(Kp-1)))
    return E

# Initial guess for fitting parameters
E0_guess = np.min(total_energies)
K0_guess = 1394
Kp_guess = 5
V0_guess = lattice_parameters[np.argmin(total_energies)]

# Fit the Murnaghan equation to the data
popt, pcov = curve_fit(murnaghan, lattice_parameters, total_energies, p0=[E0_guess, K0_guess, Kp_guess, V0_guess])

# Plot the data
plt.plot(lattice_parameters, (total_energies+9924.38129213)*13605, 'bo', label='Data')

# Plot the fitted curve
fit_volumes = np.linspace(min(lattice_parameters), max(lattice_parameters), 100)
fit_energies = murnaghan(fit_volumes, *popt)
plt.plot(fit_volumes, (fit_energies+9924.38129213)*13605, 'r-', label='Murnaghan Fit')

print(lattice_parameters, total_energies, fit_energies)

# Add labels and legend
plt.xlabel('Lattice Parameter (Å)', fontsize=20)
plt.ylabel(r'Total Energy - $E_0$ (meV)', fontsize=20)
plt.title('Murnaghan EOS Fitting for cubic ZnS', fontsize=25)
plt.legend()
plt.xticks(fontsize=12)
plt.yticks(fontsize=12)
plt.grid(False)

# Show plot
plt.show()
