#include <stdio.h>
#include <math.h>

double mean(double data[], int size){
	double total = 0;
	for(int i = 0; i < size; i++){
		total += data[i];
	}
	return total / size;
}

double standardDeviation(double data[], int n){
	double std = 0;
	double toSub = 0;
	double subFrom = 0;
	for(int i = 0; i < n; i++){
		toSub += data[i];
		subFrom += pow(data[i], 2);
	}
	toSub = pow(toSub, 2) / n;
	std = sqrt((subFrom - toSub) / (n - 1));
	return std;
}

double std2(double data[], int n, double mean){
	double std = 0;
	double current = 0;
	for(int i = 0; i < n; i++){
		current += pow(data[i] - mean, 2);
	}
	return sqrt(current / (n - 1));
}
