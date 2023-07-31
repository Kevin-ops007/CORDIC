#!/bin/bash

# Compile main file name
main_file="cordic_main16.c"

# Get a list of all C files with the pattern cordic_V_*.c in the current directory
c_files=(cordic_V_*.c)

for c_file in "${c_files[@]}"; do
    # Extract the part after "cordic_V_" from the C file name
    name=${c_file#cordic_V_}
    name=${name%.c}
    output_executable="cordic_$name.exe"
    arm_code="cordic_$name.s"
    
    echo "COMPILING $c_file"

    # Skip cordic_V_32bit.c
    if [[ $c_file != "cordic_V_32bit.c" ]]; then
        # Compile the files with GCC
        gcc -O3 "$main_file" "$c_file" -o "$output_executable" -lm
        gcc -O3 -S "$c_file" -o "$arm_code"
    elif [[ $c_file == "cordic_V_neon.c" ]]; then
        echo "SKIPPING NEON FOR NOW"
        # Do nothing until Neon is fixed
        # gcc -mfloat-abi=softfp -mfpu=neon -static -o "$output_executable" "$main_file" "$c_file" -lm   
        # gcc -mfloat-abi=softfp -mfpu=neon -static -S "$c_file" -o "arm_code"
    else
        # Generate the output executable name
        gcc -O3 cordic_main_32bit.c cordic_V_32bit.c -o cordic_32bit.exe -lm
        gcc -O3 -S "$c_file" -o "$arm_code"
        
    fi
done

rm -f ./assembly/*.s 
rm -f ./executables/*.exe
rm -f ./executables/*.txt

mv *.s ./assembly
mv *.exe ./executables

cd executables

echo "RUNNING PERF NOW"
./perf.sh