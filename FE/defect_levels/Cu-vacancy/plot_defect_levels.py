import matplotlib.pyplot as plt

def plot_energy_levels(energies):
    for energy in energies:
        plt.hlines(y=energy, xmin=0, xmax=1, color='b')
    plt.xlabel('Arbitrary Unit')
    plt.ylabel('Energy Levels')
    plt.title('Energy Level Diagram')
    plt.show()

# Test the function with a list of energies
energies = [1, 2, 3, 4, 5]
plot_energy_levels(energies)