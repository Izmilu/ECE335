#include <stdio.h>
#include <stdlib.h>

typedef unsigned char *byte_pointer;

void show_bytes(byte_pointer a, int len) {
int i;
for(i=0; i<len; i++) {
printf("%.2x ", a[i]);
}
printf("\n");
}

void show_int(int a) {
show_bytes((byte_pointer)&a, sizeof(a));
}

void show_float(float a) {
show_bytes((byte_pointer)&a, sizeof(a));
}

int main(int argv, char** argc) {
int a = atoi(argc[1]);
int b = atoi(argc[2]);
float c = atof(argc[3]);
printf("show int %d\n", a);
show_int(a);
printf("show int %d\n", b);
show_int(b);
printf("show float %g\n", c);
show_float(c);
return 0;
}


