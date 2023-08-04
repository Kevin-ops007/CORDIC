int z_table[11];

void cordic_V_fixed_point(int *x, int *y, int *z)
{
    int x_temp_1, y_temp_1, z_temp;
    int x_temp_2, y_temp_2;
    int i;
    x_temp_1 = (*x) << 2;
    y_temp_1 = (*y) << 2;
    z_temp = 0;
    int sign = 0;

    for (i = 0; i < 11; i++)
    {
        /* 11 iterations are needed */
        sign = y_temp_1 > 0 ? 1 : -1;
        __asm__ __volatile__("MLA %[output_i], %[input_i], %[input_j]"
        :[output_i] "r" (x_temp_2)
        : [input_i] "r" (sign), [input_j] "r" (y_temp_1 >> i)
        );
        __asm__ __volatile__("MLS %[output_i], %[input_i], %[input_j]"
        :[output_i] "r" (y_temp_2)
        : [input_i] "r" (sign), [input_j] "r" (x_temp_1 >> i)
        );
        z_temp += sign * z_table[i];

        x_temp_1 = x_temp_2;
        y_temp_1 = y_temp_2;
    }

    x_temp_1 *= 1244;
    x_temp_1 = (x_temp_1 + 1) >> 13; // scale factor back to 2^11
    y_temp_1 = (y_temp_1 + 1) >> 2;  // scale factor back to 2^11

    *x = x_temp_1;
    *y = y_temp_1;
    *z = z_temp;
}