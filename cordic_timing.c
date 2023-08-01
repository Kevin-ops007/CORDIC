#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
int z_table[11] = {1608, 949, 501, 254, 127, 63, 31, 15, 7, 3, 1};

void cordic_V_fixed_point(int *x, int *y, int *z); /* defined elsewhere*/

int main(void)
{
    int x_i_init, y_i_init, z_i_init; /* initial values*/
    int x_i, y_i, z_i;                /* integer (fixed-point) variables*/

    // points
    // (0.5, 0.5), (0.87, 0.34), (-0.2, 0.45), (-0.7, 0.1)
    double x[4] = {0.5, 0.87, -0.2, -0.7};
    double y[4] = {0.5, 0.34, 0.45, 0.1};

    clock_t start = clock(), diff;
    for (int i = 0; i < 1000; ++i)
    {
        x_i = (int)(x[i % 4] * (1 << 11) + 0.5);
        y_i = (int)(y[i % 4] * (1 << 11) + 0.5);
        z_i = 0;

        cordic_V_fixed_point(&x_i, &y_i, &z_i);
    }
    diff = clock() - start;
    int msec = diff * 100 / CLOCKS_PER_SEC;
    printf("Time taken %d seconds %d milliseconds\n", msec / 1000, msec % 1000);

    return 0;
}