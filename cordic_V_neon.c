#include "arm_neon.h"

int z_table[11];

void cordic_V_fixed_point(int *x, int *y, int *z)
{
    int i;

    int32_t x_temp_1 = (*x) << 2;
    int32_t y_temp_1 = (*y) << 2;
    int32_t sign = 0;

    int32_t z_temp = 0;

    for (i = 0; i < 11; i++)
    {
        /* 11 iterations are needed */
        sign = y_temp_1 > 0 ? 1 : -1;

        x_temp_1 = vmla_n_s32(x_temp1, vshr_n_s32(y_temp_1, i), sign);
        y_temp_1 = vmls_n_s32(x_temp1, vshr_n_s32(x_temp_1, i), sign);
        z_temp = vmla_n_s32(z_temp, z_table[i], sign);
    }

    x_temp_1 *= 1244;
    x_temp_1 = (x_temp_1 + 1) >> 13; // scale factor back to 2^11
    y_temp_1 = (y_temp_1 + 1) >> 2;  // scale factor back to 2^11

    *x = x_temp_1;
    *y = y_temp_1;
    *z = z_temp;
}