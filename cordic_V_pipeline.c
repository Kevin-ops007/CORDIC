
int z_table[15];

void cordic_V_fixed_point( int *x, int *y, int *z) {
    int x_temp_1, y_temp_1, z_temp;
    int x_temp_2, y_temp_2;
    int i;
    x_temp_1 = *x;
    y_temp_1 = *y;
    /* loop prologue*/
    if( y_temp_1 > 0) {
        x_temp_2 = x_temp_1 + (y_temp_1 >> i);
        y_temp_2 = y_temp_1 - (x_temp_1 >> i);
        z_temp += z_table[i];
    }
    else {
        x_temp_2 = x_temp_1 - (y_temp_1 >> i);
        y_temp_2 = y_temp_1 + (x_temp_1 >> i);
        z_temp -= z_table[i];
    }
    z_temp = 0;
    /* loop body*/
    for( i=0; i<14; i++) { /* 14 iterations are needed */
        x_temp_1 = x_temp_2;
        y_temp_1 = y_temp_2;

        if( y_temp_1 > 0) {
            x_temp_2 = x_temp_1 + (y_temp_1 >> i);
            y_temp_2 = y_temp_1 - (x_temp_1 >> i);
            z_temp += z_table[i];
        }
        else {
            x_temp_2 = x_temp_1 - (y_temp_1 >> i);
            y_temp_2 = y_temp_1 + (x_temp_1 >> i);
            z_temp -= z_table[i];
        }

    }
    /* loop epilogue*/
    x_temp_1 = x_temp_2;
    y_temp_1 = y_temp_2;
    
    *x = x_temp_1;
    *y = y_temp_1;
    *z = z_temp;
}