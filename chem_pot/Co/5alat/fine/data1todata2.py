import re

with open("data1", "r") as f:
    lines = f.readlines()

output_data = []

for line in lines:
    # Use regular expressions to extract a and c values
    match = re.match(r'Co\.a\=(\d+\.\d+)\.c\=(\d+\.\d+)\.out:!.*= *(-?\d+\.\d+) Ry', line)
    if match:
        a_value = match.group(1)
        c_value = match.group(2)
        energy_value = match.group(3)
        output_data.append((a_value, c_value, energy_value))

with open("data2", "w") as f:
    for data in output_data:
        f.write("\t".join(data) + "\n")
