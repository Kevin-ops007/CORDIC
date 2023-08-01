#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int z_table[11] = {1608, 949, 501, 254, 127, 63, 31, 15, 7, 3, 1};

void cordic_V_fixed_point(int *xy, int *z); /* defined elsewhere*/

void verify(int x_i_init, int y_i_init, int z_i_init, int x_i, int y_i, int z_i)
{
    double x_d_init, y_d_init, z_d_init, x_d, y_d, z_d;
    x_d_init = (double)x_i_init / (1 << 11); /* float image of x_*/
    y_d_init = (double)y_i_init / (1 << 11); /* float image of y_*/
    z_d_init = (double)z_i_init / (1 << 11); /* float image of z_*/
    x_d = (double)x_i / (1 << 11);           /* float image of x_i*/
    y_d = (double)y_i / (1 << 11);           /* float image of y_i*/
    z_d = (double)z_i / (1 << 11);           /* float image of z_i*/


    double mag = sqrt(x_d_init * x_d_init + y_d_init * y_d_init);
}

void main(void)
{
    int x_i_init, y_i_init, z_i_init; /* initial values*/
    int x_i, y_i, z_i, xy;            /* integer (fixed-point) variables*/
    x_i = (x_i_init = 1740);
    y_i = (y_i_init = 1556);
    z_i_init = 1494;

    xy = y_i_init << 16 | x_i_init;
    cordic_V_fixed_point(&xy, &z_i);
    x_i = xy & 0xfff;
    y_i = (xy >> 16) & 0xfff;
    verify(x_i_init, y_i_init, z_i_init, x_i, y_i, z_i);
}