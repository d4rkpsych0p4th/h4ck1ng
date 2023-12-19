sudo python main.py -C acerinox -f ES | grep -i ‘range’ | grep -v ‘size’ | cut -d “\”” -f4 | sort -u
