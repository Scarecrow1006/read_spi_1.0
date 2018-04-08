#include <stdio.h>

int main(){
	FILE *fp = fopen("./help", "w");
	int i;
	for (i=0; i<38; i++){
		fprintf(fp, "\t\t\tt_%d: \n", i);
	}
	fclose(fp);
	return 0;
}