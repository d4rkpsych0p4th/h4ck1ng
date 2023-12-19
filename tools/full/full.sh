#!/bin/bash

echo "______ _____ _____ _____  ___________ "
echo "|  _  \_   _|  __ \  __ \|  ___| ___ \\"
echo "| | | | | | | |  \/ |  \/| |__ | |_/ /"
echo "| | | | | | | | __| | __ |  __||    / "
echo "| |/ / _| |_| |_\ \ |_\ \| |___| |\ \ "
echo "|___/  \___/ \____/\____/\____/\_| \_|"
echo "                                       "

# Simulate loading for 3 seconds
echo -n "Loading ["
for i in {1..20}; do
    echo -n "+"
    sleep 0.15
done

# Check if the input file is provided as a command-line argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <input_file> with cidr list"
    exit 1
fi

input_file="$1"

# Execute the first command and save the output to RESULTADO.txt
# Execute the first command and save the output to RESULTADO.txt
echo "Running ./cidrtoip -b $input_file | tee RESULTADO.txt"
./cidrtoip -b "$input_file" | tee RESULTADO.txt

echo "IP RANGES CONVERTED Done!"

# Execute the second command using the output file RESULTADO.txt
echo "Running ./didi RESULTADO.txt"
./didi.sh RESULTADO.txt



