#include <stdio.h>
#include "statistics.h"

extern double mean(double data [], int size);
extern double standardDeviation(double data [], int n);
extern double std2(double data[], int n, double mean);

int main(){
	double data [100];
	int n = sizeof(data) / sizeof(double);
	for(int i = 0; i < n; i++){
		data[i] = i;
	}
	double myMean = mean(data, n);
	double myStd = standardDeviation(data, n);
	double myStd2 = std2(data, n, myMean);

	printf("mean: %3.2f\n", myMean);
	printf("standard deviation: %3.2f\n", myStd);
	printf("standard deviation 2: %3.2f\n", myStd2);
	return 0;
}

