#!/bin/bash

# Compile main file name
main_file="cordic_timing.c"

# Get a list of all C files with the pattern cordic_V_*.c in the current directory
c_files=(cordic_V_*.c)

arm-linux-gcc -O1 -static cordic_timing.c cordic_V_standard.c -o cordic_O1.exe 
arm-linux-gcc -O2 -static cordic_timing.c cordic_V_standard.c -o cordic_O2.exe

for c_file in "${c_files[@]}"; do
    # Extract the part after "cordic_V_" from the C file name
    name=${c_file#cordic_V_}
    name=${name%.c}
    output_executable="cordic_$name.exe"
    arm_code="cordic_$name.s"

    # Skip cordic_V_32bit.c
    if [[ $c_file == "cordic_V_32bit.c" ]]; then
        # Generate the output executable name
        echo "COMPILING 32bit $c_file"
        arm-linux-gcc -O3 -static cordic_timing32.c cordic_V_32bit.c -o cordic_32bit.exe
        arm-linux-gcc -O3 -S "$c_file" -o "$arm_code"
    elif [[ $c_file == "cordic_V_neon.c" ]]; then
        arm-linux-gcc -mfloat-abi=softfp -mfpu=neon -static -o "$output_executable" "$main_file" "$c_file"
        arm-linux-gcc -mfloat-abi=softfp -mfpu=neon -static -S "$c_file" -o "$arm_code"
    elif [[ $c_file == "cordic_V_restrict.c" ]]; then
        arm-linux-gcc -static -o "$output_executable" "$main_file" "$c_file" -std=c99
        arm-linux-gcc -static -S "$c_file" -o "$arm_code" -std=c99
    elif [[ $c_file == "cordic_V_inline_arm.c" ]]; then
        echo "Skipping $c_file"
    else
        echo "COMPILING $c_file"
        # Compile the files with arm-linux-gcc
        arm-linux-gcc -O3 -static "$main_file" "$c_file" -o "$output_executable"
        arm-linux-gcc -O3 -S "$c_file" -o "$arm_code"
    fi
done

rm -f ./assembly/*.s 
rm -f ./executables/*.exe
rm -f ./executables/*.txt

mv *.s ./assembly
mv *.exe ./executables

cd executables