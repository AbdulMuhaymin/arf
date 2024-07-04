#!/bin/bash

# Loop through all files with names like fileXXX.out
for file in Ni.*.out; do
    # Extract the numerical value using grep and awk
    value=$(grep -oP '!    total energy\s+=\s+-?\d+.\d+' "$file" | awk '{print $NF}')
    
    # Extract the number from the file name
    number=$(echo "$file" | grep -oP '\d+')

    # Append the extracted values to data.out
    echo "$number  $value" >> data.out
done
