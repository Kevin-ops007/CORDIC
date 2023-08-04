#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
int z_table[11] = {1608, 949, 501, 254, 127, 63, 31, 15, 7, 3, 1};

void cordic_V_fixed_point(int *xy, int *z); /* defined elsewhere*/

int main(void)
{
    int x_i_init, y_i_init, z_i_init; /* initial values*/
    int xy_i, z_i;                    /* integer (fixed-point) variables*/

    // points
    // double x[4] = {0.5, 0.87, -0.2, -0.7};
    // double y[4] = {0.5, 0.34, 0.45, 0.1};
    int x[4] = {1024, 1782, -409, -1433};
    int y[4] = {1024, 696, 922, 205};

    int i;
    clock_t begin = clock();
    for (i = 0; i < 10000000; ++i)
    {
        xy_i = y[i % 4] << 16 | x[i % 4];
        z_i = 0;

        cordic_V_fixed_point(&xy_i, &z_i);
    }
    clock_t end = clock();
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
    printf("%f time spent\n", time_spent);
    return 0;
}