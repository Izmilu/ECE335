#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

#define LENGTH 5000
#define k 10000
#define IDENT 1
#define OP *

void combine3(double *A, double *dest, int length)
{
	int i;
	*dest = IDENT;
	for(i=0; i<length; i++){
		*dest = *dest OP A[i];
	}
}

void combine5(double *A, double *dest, int length)
{
	int i;
	int limit = length - 1;
	double x = IDENT;
	//Combine 2 elements at once
	for(i=0; i<limit; i+=2){
		x = (x OP A[i]) OP A[i+1];
	}
	//Finish any remaining elements
	for(; i<length; i++){
		x = x OP A[i];
	}
	*dest = x;
}

void combine7(double *A, double *dest, int length){
	int i;
	int limit = length - 1;
	double x = IDENT;
	//Combine 2 elements at a time
	for(i=0; i<limit; i+=2){
		x = x OP (A[i] OP A[i+1]);
	}
	//Finish any remaining elements
	for(; i<length; i++){
		x = x OP A[i];
	}
	*dest = x;
}

int main(){
	int i, j;
	clock_t start_time, end_time;
	double run_time, average_time, total_time = 0;
	time_t seconds;
	time(&seconds);

	double A[LENGTH];
	double dest_in[1];
	
	for(i=0; i<LENGTH; i++){
		A[i] = 0.90 + (double)(rand() % k) / 50000;
	}

	for(j=0; j<1000; j++){
		start_time = clock();
		combine3(A, dest_in, LENGTH);
		end_time = clock();
		run_time = (double)(end_time - start_time) / CLOCKS_PER_SEC;
		total_time += run_time;
	}

	average_time = total_time / 1000;
	printf("\n");
	printf("Average time taken over 1000 iterations for combine3: %f seconds\n", average_time);

	total_time = 0;

	for(j=0; j<1000; j++){
		start_time = clock();
		combine5(A, dest_in, LENGTH);
		end_time = clock();
		run_time = (double)(end_time - start_time) / CLOCKS_PER_SEC;
		total_time += run_time;
	}

	average_time = total_time / 1000;
	printf("\n");
	printf("Average time taken over 1000 iterations for combine5: %f seconds\n", average_time);

	total_time = 0;

	for(j=0; j<1000; j++){
		start_time = clock();
		combine7(A, dest_in, LENGTH);
		end_time = clock();
		run_time = (double)(end_time - start_time) / CLOCKS_PER_SEC;
		total_time += run_time;
	}

	average_time = total_time / 1000;
	printf("\n");
	printf("Average time taken over 1000 iterations for combine7: %f seconds\n", average_time);

	return 0;
}
