#!/bin/bash


 #   echo "______ _____ _____ _____  ___________ "
 #  echo "|  _  \_   _|  __ \  __ \|  ___| ___ \\"
 #   echo "| | | | | | | |  \/ |  \/| |__ | |_/ /"
 #   echo "| | | | | | | | __| | __ |  __||    / "
 #   echo "| |/ / _| |_| |_\ \ |_\ \| |___| |\ \ "
 #   echo "|___/  \___/ \____/\____/\____/\_| \_|"
 #   echo ""
    echo -e "┳┓┳┏┓┏┓┏┓┳┓\n┃┃┃┃┓┃┓┣ ┣┫\n┻┛┻┗┛┗┛┗┛┛┗"

	echo "WAIT PATIENTLY...TREASURES WILL APPEAR"


# Simulate loading for 3 seconds
    echo -n "DIGGIN ["
for i in {1..50}; do
    echo -n "+"
    sleep 0.15
done
echo -n "]"
sleep 2  # Additional 2 seconds to complete 3 seconds in total
#echo " Done!"


if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi

input_file="$1"

# Crear un archivo temporal para almacenar los resultados parciales
temp_file=$(mktemp /tmp/temp_dig_output.XXXXXXXXXX)

# Loop sobre cada IP en el archivo proporcionado
while IFS= read -r ip; do
    # Loop sobre los últimos octetos (i de 1 a 255)loopi=0
    #((loopi++))
    # Ejecutar el comando dig y filtrar la salida
    dig_output=$(dig -x "$ip" | grep -i 'ptr' | grep -v ';')

    # Imprimir el resultado en la terminal[DIGGIN $loopi $ip] 
    echo "$dig_output"
    #echo "$ip"
    # Almacenar el resultado en el archivo temporal
    echo "$dig_output" >> "$temp_file"

done < "$input_file"

# Stop the background banner process
kill "$bg_pid"
wait "$bg_pid" 2>/dev/null  # Suppress error message

# Mover el contenido del archivo temporal al archivo de resultados final
mv "$temp_file" "RESULTADO.txt"
##borramos los espacios
sed -i '/^$/d' "RESULTADO.txt"

echo "Process completed. Check 'RESULTADO.txt' for the final list."
