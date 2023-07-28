#include "arm_neon.h"

int z_table[15];

void cordic_V_fixed_point(int *x, int *y, int *z)
{
    int i;

    int32_t x_temp_1 = *x;
    int32_t y_temp_1 = *y;
    int32_t sign = 0;

    int32_t z_temp = 0;

    for (i = 0; i < 15; i++)
    {
        /* 15 iterations are needed */
        sign = y_temp_1 > 0 ? 1 : -1;

        x_temp_1 = vmla_n_s32(x_temp1, vshr_n_s32(y_temp_1,i), sign);
        y_temp_1 = vmls_n_s32(x_temp1, vshr_n_s32(x_temp_1,i), sign);
        z_temp   = vmla_n_s32(z_temp, z_table[i], sign);
    }
    *x = x_temp_1;
    *y = y_temp_1;
    *z = z_temp;
}