# Read data from the input file and perform multiplication
new_data = []
with open("data2", "r") as f:
    for line in f:
        a, c, energy = line.strip().split("\t")
        new_data.append((float(a) * float(c), float(energy)))

# Write the result into a new file
with open("data3", "w") as f:
    for result, energy in new_data:
        f.write(f"{result}\t{energy}\n")
