#include <stdio.h>
int z_table[11];

void cordic_V_fixed_point(int *x, int *y, int *z)
{
    int x_temp_1, y_temp_1, z_temp;
    int x_temp_2, y_temp_2;
    int i;

    // take all variables as 12 bit samples
    // shift the samples to have 2 bit padding to left and 2 bit padding to right
    x_temp_1 = (*x) << 2; // scale factor is now 2^13
    y_temp_1 = (*y) << 2; // scale factor is now 2^13
    z_temp = 0;

    for (i = 0; i < 11; i++)
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

    // multiply by inverse of 1.646760 to remove
    // magnitude growth from algorithm
    // scale factor for x becomes 2^11 * 2^11 = 2^22
    // float x = x / 2^22
    x_temp_1 *= 1244;
    x_temp_1 = (x_temp_1 + 1) >> 13; // scale factor back to 2^11
    y_temp_1 = (y_temp_1 + 1) >> 2;  // scale factor back to 2^11

    *x = x_temp_1;
    *y = y_temp_1;
    *z = z_temp;
}