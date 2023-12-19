#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi

input_file="$1"
loopi=0
# Crear un archivo temporal para almacenar los resultados parciales
temp_file=$(mktemp /tmp/temp_dig_output.XXXXXXXXXX)

# Loop sobre cada IP en el archivo proporcionado
while IFS= read -r ip; do
    # Loop sobre los últimos octetos (i de 1 a 255)
    	((loopi++))
        # Ejecutar el comando dig y filtrar la salida
        dig_output=$(dig -x "$ip" | grep -i 'ptr' | grep -v ';')
        
        # Imprimir el resultado en la terminal
        echo "[DIGGIN $loopi $ip] $dig_output"
        #echo "$ip"
        # Almacenar el resultado en el archivo temporal
        echo "$dig_output" >> "$temp_file"
   
done < "$input_file"

# Mover el contenido del archivo temporal al archivo de resultados final
mv "$temp_file" "RESULTADO.txt"
##borramos los espacios
sed -i '/^$/d' "RESULTADO.txt"


echo "Process completed. Check 'RESULTADO.txt' for the final list."
