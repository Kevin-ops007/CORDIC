
int z_table[15];

void cordic_V_fixed_point(int *x, int *y, int *z)
{
    register int x_temp_1, y_temp_1, z_temp;
    register int x_temp_2, y_temp_2;
    register int i;
    x_temp_1 = *x;
    y_temp_1 = *y;
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
    *x = x_temp_1;
    *y = y_temp_1;
    *z = z_temp;
}