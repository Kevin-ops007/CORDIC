#include "arm_neon.h"

int z_table[11];

void cordic_V_fixed_point(int *x, int *y, int *z)
{
    int i;

    // int32_t are 32 bit integers
    int32_t x_temp_1 = (*x) << 2;
    int32_t y_temp_1 = (*y) << 2;
    int32_t sign = 0;
    int32_t z_temp = 0;

    // 2 element vector to hold x and y
    int32x2_t xy = {x_temp_1, y_temp_1};
    int32x2_t yx;

    for (i = 0; i < 11; i++)
    {
        yx = vrev64_s32(xy);
        /* 11 iterations are needed */
        sign = xy[1] > 0 ? 1 : -1;

        // generate sign vector
        int32x2_t sign_vec = {sign, -sign};

        // can hold xtemp and y temp in a vector
        // need to bit shift the old values
        // right shift values by i
        vshr_n_s32(yx, i);

        // multiply and accumulate
        // x = x + (sign[0] * y);
        // y = y + (sign[1] * x);
        xy = vmla_n_s32(xy, sign_vec, yx);
        z_temp = vmla_n_s32(z_temp, z_table[i], sign);
    }

    x_temp_1 = xy[0];
    y_temp_1 = xy[1];
    x_temp_1 *= 1244;
    x_temp_1 = (x_temp_1 + 1) >> 13; // scale factor back to 2^11
    y_temp_1 = (y_temp_1 + 1) >> 2;  // scale factor back to 2^11

    *x = x_temp_1;
    *y = y_temp_1;
    *z = z_temp;
}