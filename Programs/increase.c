#include <stdio.h>

void increase(int * x);

int main(){
	int exx = 15;
	int * exxPtr = &exx;
	increase(exxPtr);
	printf("Now exx is %d\n", exx);

	return 0;
}

void increase(int * x){
	*x = *x + 1;
	++*x;
}
