#include <stdio.h>

int summer(int data[], int size);

int main(){

	int data[3] = {10, 20, 30};
	int data2[] = {30, 40, 50, 60};
	int data3[100] = {25};

	int chess[8][8];

	int grid[4][5];
	int grid2[2][3] = {{10, 20, 30}, {40, 50, 60}};

	int total = sizeof(chess[1]) / sizeof(int);//summer(data, sizeof(data)/sizeof(int));
	printf("the total is %d\n", total);
	return 0;
}

void makeMove(int chess[][8], int numRows){}

void makeMove2(int numRows, int numCols, int chess[numRows][numCols]){}

int summer(int data[], int size){
	int total = 0;
	for(int i = 0; i < size; i++){
		total += data[i];
	}
	return total;
}

int find(int key, int numRows, int numCols, data[numRows][numCols]){
	for(int i = 0; i < numRows; i++){
		for(int j = 0; j < numCols; j++){
			if(data[i][j] == key){
				return 1;
			}
		}
	}
	return 0;
}
