#include <stdio.h>
#include <math.h>

int main(void)
{
    double x_d, y_d, z_d; /* 64-bit floating-point variables */
    int x_i, y_i, z_i;    /* integer (fixed-point) variables */
    int i;
    x_d = 0.85;
    y_d = 0.76;
    z_d = atan(y_d / x_d); /* call std-C math routines */

    // samples in range -1 (-2^0) to 1 (2^0)
    // with 12 bit samples, have 11 bits of magnitude
    // so SF = 2^11/2^0 = 2^11
    printf("12 bit samples\n");
    x_i = (int)(x_d * (1 << 11) + 0.5); /* convert the x_d, y_d, z_d */
    y_i = (int)(y_d * (1 << 11) + 0.5); /* floats to integers with a */
    z_i = (int)(z_d * (1 << 11) + 0.5); /* precision of 12 bits */
    printf("x_d = %f\t\t\tx_i = %i\n", x_d, x_i);
    printf("y_d = %f\t\t\ty_i = %i\n", y_d, y_i);
    printf("z_d = %f\t\t\tz_i = %i\n", z_d, z_i);
    printf("\nThe angle table:\n");
    printf("12 bit samples\n");
    for (i = 0; i < 11; ++i)
    {
        printf("z[%2i] = %i\n", i, (int)(atan(pow(2.0, (double)(-i))) * (1 << 11)));
    }
    double scale = 1.0;
    for (i = 0; i < 11; ++i)
    {
        scale *= sqrt(1 + pow(2.0, -2.0 * i));
    }
    printf("scale (double): %f\n", scale);
    printf("1/scale (double): %f\n", 1.0 / scale);
    printf("(int)(1/scale) * (1 << 11): %d\n", (int)((1.0 / scale) * (1 << 11) + 0.5));
}