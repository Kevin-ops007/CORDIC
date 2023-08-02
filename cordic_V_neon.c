#include "arm_neon.h"

int z_table[11];

void cordic_V_fixed_point(int *x, int *y, int *z)
{
    int i;

    // int32_t are 32 bit integers
    int32x2_t xy = {*x, *y};
    xy = vshl_n_s32(xy, 2); // left shift by 2

    int32_t sign = 0;
    int32_t z_temp = 0;

    int32x2_t yx;

    for (i = 0; i < 11; i++)
    {
        /* 11 iterations are needed */
        yx = vrev64_s32(xy); // reverse vector
        sign = vget_lane_s32(xy, 1) > 0 ? 1 : -1;
        int32x2_t sign_vec = {sign, -sign};

        // right shift by i
        int32x2_t shift = {-i, -i};
        yx = vshl_s32(yx, shift);

        // multiply and accumulate
        // x = x + (sign[0] * y);
        // y = y + (sign[1] * x);
        xy = vmla_s32(xy, sign_vec, yx);
        z_temp += sign * z_table[i];
    }

    int32_t result[2];
    xy = vshr_n_s32(xy, 2);
    vst1_s32(result, xy);
    // result[0] *= 1244;
    result[0] = (result[0] + 1) >> 11; // scale factor back to 2^11
    *x = result[0];
    *y = result[1];
    *z = z_temp;
}