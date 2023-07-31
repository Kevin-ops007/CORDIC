
int z_table[11];

void cordic_V_fixed_point(int *xy, int *z)
{
    int x_temp_1, y_temp_1, z_temp;
    int x_temp_2, y_temp_2;
    int i;
    // unpack x and y as 12 bit samples
    x_temp_1 = *xy & 0xfff;
    y_temp_1 = (*xy >> 16) & 0xfff;
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

    x_temp_1 *= 1244;
    x_temp_1 = (x_temp_1 + 1) >> 2; // scale factor back to 2^11
    y_temp_1 = (y_temp_1 + 1) >> 2; // scale factor back to 2^11

    *xy = y_temp_1 << 16 | x_temp_1;
    *z = z_temp;
}