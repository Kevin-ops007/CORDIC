#include <stdio.h>
#include <math.h>

int main( void) {
    double x_d, y_d, z_d; /* 64-bit floating-point variables */
    int x_i, y_i, z_i; /* integer (fixed-point) variables */
    x_d = 0.85;
    y_d = 0.76;
    z_d = atan( y_d / x_d); /* call std-C math routines */
    x_i = (int)(x_d * (1 << 15)); /* convert the x_d, y_d, z_d */
    y_i = (int)(y_d * (1 << 15)); /* floats to integers with a */
    z_i = (int)(z_d * (1 << 15)); /* precision of 16 bits */
    printf( "x_d = %f\t\t\tx_i = %i\n", x_d, x_i);
    printf( "y_d = %f\t\t\ty_i = %i\n", y_d, y_i);
    printf( "z_d = %f\t\t\tz_i = %i\n", z_d, z_i);
    printf( "\n");
    printf( "The angle table:\n");
    for( i=0; i<15; i++) {
        printf( "z[%2i] = %i\n", i,
        (int)(atan( pow( 2.0, (double)(-i))) * (1 << 15)));
    }
}