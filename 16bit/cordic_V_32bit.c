
int z_table[15];

void cordic_V_fixed_point(int *xy, int *z)
{
    int x_temp_1, y_temp_1, z_temp;
    int x_temp_2, y_temp_2;
    int i;
    x_temp_1 = *xy & 0xffff;;
    y_temp_1 = (*xy >> 16) & 0xffff;
    z_temp = 0;
    for (int i = 0; i < 15; i++)
    { /* 15 iterations are needed */
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
    *xy = y_temp_1 << 16 | x_temp_1;
    *z = z_temp;
}