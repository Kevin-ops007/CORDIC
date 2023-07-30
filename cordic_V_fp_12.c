#include <stdio.h>
int z_table[15];

void cordic_V_fixed_point(int *x, int *y, int *z)
{
    int x_temp_1, y_temp_1, z_temp;
    int x_temp_2, y_temp_2;
    int i;

    // take all variables as 12 bit samples
    // shift the samples to have 2 bit padding to left and 2 bit padding to right
    // shifting by 4 just in case
    x_temp_1 = *x;
    y_temp_1 = *y;
    z_temp = 0;

    for (int i = 0; i < 11; i++)
    { /* 11 iterations are needed */
        if (y_temp_1 > 0)
        {
            x_temp_2 = x_temp_1 + (y_temp_1 >> i);
            y_temp_2 = y_temp_1 - (x_temp_1 >> i);
            z_temp += z_table[i];
        }
        else
        {
            x_temp_2 = x_temp_1 - (y_temp_1 >> i);
            y_temp_2 = y_temp_1 + (x_temp_1 >> i);
            z_temp -= z_table[i];
        }
        x_temp_1 = x_temp_2;
        y_temp_1 = y_temp_2;
    }

    // multiply by the inverse of 1.6...... to get correct magnitude
    printf("before multiplying: %d\n", x_temp_1);
    x_temp_1 *= 1243;

    *x = x_temp_1;
    *y = y_temp_1;
    *z = z_temp;
}