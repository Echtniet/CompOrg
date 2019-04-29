#include <stdio.h>

int len(char str[]){
	int i = 0;
	while(*str++){
		i++;
	}
	return i;
}

int len2(char * str){
	int i = 0;
	while(*str++){
		i++;
	}
}

int main(){
	char name[] = "Clinton";
	printf("len: %s", len(name));
	return 0;
}
