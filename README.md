# CORDIC

University of Victoria - SENG 440 - Summer 2023  
Implementation of CORDIC algorithm in C for ARM processor

## Using ssh to compile and simulate
ssh to 
```
seng440.uvic.ca
```
```
cd /tmp
```
clone repo then compile with 
```
arm-linux-gcc -mfloat-abi=softfp -mfpu=neon -static -O3
```
simulate with 
```
qemu-arm <executable>
```

## Assembly Code 

All assembly code is located in the assembly folder.

## Executables and Perf Measurements

All executable file and perf measurements are located in the executable folder.
