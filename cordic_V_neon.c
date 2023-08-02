#include "arm_neon.h"

int z_table[11];

void cordic_V_fixed_point(int *x, int *y, int *z)
{
    int i;

    // int16_t are 16 bit integers
    int16x4_t xy = {*x, *y};
    xy = vshl_n_s16(xy, 2);

    int16_t sign = 0;
    int16_t z_temp = 0;

    // 2 element vector to hold x and y
    int16x4_t yx;

    for (i = 0; i < 11; i++)
    {
        yx = vrev64_s16(xy);
        /* 11 iterations are needed */
        sign = vget_lane_s16(xy, 1) > 0 ? 1 : -1;
        int16x4_t sign_vec = {sign, -sign};

        // right shift by i
        int16x4_t shift = {-i, -i};
        yx = vshl_s16(yx, shift);

        // multiply and accumulate
        // x = x + (sign[0] * y);
        // y = y + (sign[1] * x);
        xy = vmla_s16(xy, sign_vec, yx);
        z_temp += sign * z_table[i];
    }

    int result[2];
    xy = vshr_n_s16(xy, 2);
    vst1_s16(result, xy);
    result[0] *= 1244;
    result[0] = (result[0] + 1) >> 11; // scale factor back to 2^11
    *x = result[0];
    *y = result[1];
    *z = z_temp;
}