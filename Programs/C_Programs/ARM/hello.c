#include <stdio.h>
#include <stdlib.h>

int main(){
	int numDiceRolls;
	char choice;
	int numGuesses = 1;
	
		printf("I plan to roll some dice.");
	printf("Does that sound like a good idea? (y/n) ");
	scanf("%c", &choice);

	if(choice !='y' && choice !='Y'){
		printf("Fine, be that way :-(\n");
		return 1;
	}
	printf("Enter # of dice rolls: ");
	scanf("%d", &numDiceRolls);
	for(int i=0; i<numDiceRolls; i++){
		printf("%d\n", rand() % 6 + 1);
	}
	return 0;
}
