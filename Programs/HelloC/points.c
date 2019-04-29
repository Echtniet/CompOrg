#include <stdio.h>
#include <math.h>
#include "points.h"

extern int quadrant(Point pt){
	if(pt.x == 0 || pt.y == 0){
		return -1;
	}
	if(pt.x < 0 && pt.y > 0){
		return 1;
	}
	if(pt.x < 0 && pt.y < 0){
		return 2;
	}
	if(pt.x > 0 && pt.y > 0){
		return 0;
	}
	return 3;
}

extern double distance(Point pt0, Point pt1){
	return sqrt(pow(pt1.x - pt0.x, 2) + pow(pt1.y - pt0.y, 2));
}

extern int inCircle(Point center, int radius, Point pt){
	if(distance(center, pt) <= radius){
		return 1;
	}
	return 0;
}
