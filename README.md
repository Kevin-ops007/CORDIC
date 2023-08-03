# CORDIC

University of Victoria - SENG 440 - Summer 2023  
Implementation of CORDIC algorithm in C for ARM processor

## Neon
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
