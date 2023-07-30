#include <stdio.h>
#include <math.h>
int z_table[15] = {1608, 949, 501, 254, 127, 63, 31, 15, 7, 3, 1, 0, 0, 0, 0};

void cordic_V_fixed_point(int *x, int *y, int *z); /* defined elsewhere*/

void verify(int x_i_init, int y_i_init, int z_i_init, int x_i, int y_i, int z_i)
{
    double x_d_init, y_d_init, z_d_init, x_d, y_d, z_d;
    x_d_init = (double)x_i_init / (1 << 11); /* float image of x_*/
    y_d_init = (double)y_i_init / (1 << 11); /* float image of y_*/
    z_d_init = (double)z_i_init / (1 << 11); /* float image of z_*/
    x_d = (double)x_i / (1 << 22);           /* float image of x_i*/
    y_d = (double)y_i / (1 << 11);           /* float image of y_i*/
    z_d = (double)z_i / (1 << 11);           /* float image of z_i*/
    printf("x_i_init = %5i\tx_d_init = %f\n", x_i_init, x_d_init);
    printf("y_i_init = %5i\ty_d_init = %f\n", y_i_init, y_d_init);
    printf("z_i_init = %5i\tz_d_init = %f (rad)\n\n", z_i_init, z_d_init);
    printf("x_i_calc = %5i\tx_d_calc = %f\n", x_i, x_d);
    printf("y_i_calc = %5i\ty_d_calc = %f\n", y_i, y_d);
    printf("z_i_calc = %5i\tz_d_calc = %f (rad)\n\n", z_i, z_d);
    printf("Modulus = SQRT(x_d_init^2 + y_d_init^2) = %f\t(expected)\n", sqrt(x_d_init * x_d_init + y_d_init * y_d_init));
    printf("Modulus = SQRT(x_d^2 + y_d^2) = %f\t(result)\n", sqrt(x_d * x_d + y_d * y_d));
}

void main(void)
{
    int x_i_init, y_i_init, z_i_init; /* initial values*/
    int x_i, y_i, z_i;                /* integer (fixed-point) variables*/
    x_i = (x_i_init = 1740);
    y_i = (y_i_init = 1556);
    z_i_init = 1494;
    // from TB:
    // with x_i = 1740, y_i = 1556
    // we expect z_i = 1494
    printf("Vectoring CORDIC:\n\n");
    cordic_V_fixed_point(&x_i, &y_i, &z_i);
    verify(x_i_init, y_i_init, z_i_init, x_i, y_i, z_i);
}