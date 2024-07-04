import re

# Read the input file
with open("data1", "r") as file:
    data = file.readlines()

# Extract numerical data and write to a new file
with open("data2", "w") as file:
    for line in data:
        match = re.search(r'scf\.*+(\d+)\.out:.*?=\s+(-?\d+\.\d+)', line)
        if match:
            index = match.group(1)
            energy = match.group(2)
            file.write(f"{index} {energy}\n")
