#!/bin/bash

# Create or clear the stats.txt file
> stats.txt

# Loop through all .exe files in the current directory and run "perf <filename>"
for filename in *.exe; do
    if [ -f "$filename" ]; then
        file="${filename%.exe}"
        echo "Running perf for file: $filename"
        echo "Running perf for file : $filename" >> stats.txt
        perf stat -o "$file".txt --r=70  ./"$filename" >> stats.txt
        
        echo "perf for file $filename completed."
    fi
done

echo "All perf commands completed. Results are stored in stats.txt."
