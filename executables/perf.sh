#!/bin/bash

# Create or clear the stats.txt file
> stats.txt

# Loop through all .exe files in the current directory and run "perf <filename>"
for filename in *.exe; do
    if [ -f "$filename" ]; then
        echo "Running perf for file: $filename"
        perf stat "$filename" >> stats.txt
        echo "perf for file $filename completed."
    fi
done

echo "All perf commands completed. Results are stored in stats.txt."