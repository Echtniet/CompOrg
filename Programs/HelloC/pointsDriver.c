#include <stdio.h>
#include "points.c"

extern int quadrant(Point pt);
extern double distance(Point pt0, Point pt1);
extern int inCircle(Point center, int radius, Point pt);
void checkQuadrant();
void checkDistance();
void checkInCircle();

int main(){
	checkQuadrant();
	printf("\n");
	checkDistance();
	printf("\n");
	checkInCircle();
	return 0;
}

void checkQuadrant(){
	Point pts[5] = {{1, 1}, {0, 0}, {-1, 1}, {-1, -1}, {1, -1}};
	for(int i = 0; i < 5; i++){
		int loc = quadrant(pts[i]);
		printf("x: %d, y: %d, location: %d\n", pts[i].x, pts[i].y, loc);
	}
}

void checkDistance(){
	Point pts[4][2] = {{{3, 2}, {7, 8}},
			    {{5, 3}, {9, 6}},
			    {{10, 3}, {-10, -3}},
			    {{-11, 4}, {2, -20}}};
	for(int i = 0; i < 4; i++){
		double myDist = distance(pts[i][0], pts[i][1]);
		printf("x1: %d, y1: %d, x2: %d, y2: %d, distance: %3.2f\n", pts[i][0].x, pts[i][0].y, pts[i][1].x, pts[i][1].y, myDist);
	}
}

void checkInCircle(){
	Point centers[4] = {{3, 2}, {5, 3}, {10, 3}, {-11, 4}};
	int radiuses[4] = {8, 5, 19, 27};
	Point pts[4] = {{7, 8}, {9, 6}, {-10, -3}, {2, -20}};
	for(int i = 0; i < 4; i++){
		int well = inCircle(centers[i], radiuses[i], pts[i]);
		if(well == 1){
			printf("x1: %d, y1: %d, radius: %d, x2: %d, y2: %d, in circle: true\n", centers[i].x, centers[i].y, radiuses[i], pts[i].x, pts[i].y);
		}else{
			printf("x1: %d, y1: %d, radius: %d, x2: %d, y2: %d, in circle: false\n", centers[i].x, centers[i].y, radiuses[i], pts[i].x, pts[i].y);
		}
	}
}
