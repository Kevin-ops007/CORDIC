import subprocess
import time
import sys
import os

def main():
    argv = sys.argv
    if(len(argv) != 3):
        print(f'Must provide executable name. Usage: {argv[0]} ./executable_name num_iterations')
        exit(1)

    exe = argv[1]
    if not os.path.isfile(exe):
        print(f'file {exe} does not exist')
        exit(1)
    
    num_iterations = int(argv[2])

    f = open(os.devnull, 'w')
    sys.stdout = f

    start_perf = time.perf_counter()
    start_process = time.process_time()

    for i in range(num_iterations):
        subprocess.Popen([exe])
    end_perf = time.perf_counter()
    end_process = time.process_time()



    avg_perf_ms = (end_perf - start_perf) / num_iterations * 1000      
    avg_proces_ms = (end_process - start_process) / num_iterations * 1000

    sys.stdout = sys.__stdout__
    print(f'Average perf time: {avg_perf_ms} ms')
    print(f'Average process time: {avg_proces_ms} ms')

    f.close()


if __name__ == '__main__':
    main()