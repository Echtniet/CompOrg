#include <stdio.h>

typedef struct {
	int x;
	int y;
} Point;



int quadrant(Point pt);
double distance(Point pt0, Point pt1);
int inCircle(Point center, int radius, Point pt);
