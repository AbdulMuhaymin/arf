import matplotlib.pyplot as plt
import numpy as np

# Function to read data from a file
def read_data(filename):
    with open(filename, 'r') as file:
        lines = file.readlines()
        data = [[float(val) for val in line.split()] for line in lines]
    return data

# Read data from files
gauss_data = read_data('gauss.dat')
mp_data = read_data('m-p.dat')
mv_data = read_data('m-v.dat')

# Extracting x and y values for plotting
gauss_x, gauss_y = zip(*gauss_data)
mp_x, mp_y = zip(*mp_data)
mv_x, mv_y = zip(*mv_data)

# Plotting the data
plt.plot(gauss_x, np.array(gauss_y)+488, label='gauss',marker='o', markersize=10, markerfacecolor='blue', linestyle=':', linewidth=2, color='black')
plt.plot(mp_x, np.array(mp_y)+488, label='m-p', marker='o', markersize=10, markerfacecolor='blue', linestyle=':', linewidth=2, color='green')
plt.plot(mv_x, np.array(mv_y)+488, label='m-v', marker='o', markersize=10, markerfacecolor='blue', linestyle=':', linewidth=2, color='red')

# Adding labels and legend
plt.xlabel('Degauss Broadening (Ry)', fontsize=18)
plt.ylabel('Total Energy, shifted (Ry)', fontsize=18)
plt.title('Convergence of Total Energy with Smearing Broadening and Type', fontsize=22)
plt.legend()

# Display the plot
plt.grid(False)
plt.show()
