#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define SIZE 2048

// Function to copy using the copyij method
void copyij(int src[SIZE][SIZE], int dst[SIZE][SIZE]) {
    int i, j;
    for (i = 0; i < SIZE; i++) {
        for (j = 0; j < SIZE; j++) {
            dst[i][j] = src[i][j];
        }
    }
}

// Function to copy using the copyji method
void copyji(int src[SIZE][SIZE], int dst[SIZE][SIZE]) {
    int i, j;
    for (j = 0; j < SIZE; j++) {
        for (i = 0; i < SIZE; i++) {
            dst[i][j] = src[i][j];
        }
    }
}

int main() {
    int (*source_matrix)[SIZE] = malloc(sizeof(int[SIZE][SIZE]));
    int (*destination_matrix)[SIZE] = malloc(sizeof(int[SIZE][SIZE]));

    if (source_matrix == NULL || destination_matrix == NULL) {
        fprintf(stderr, "Memory allocation failed.\n");
        return 1;
    }
    
    // Seed the random number generator
    srand(time(NULL));

    // Initialize the source matrix with random values between -10000 and 10000
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            source_matrix[i][j] = rand() % 20001 - 10000;
        }
    }

    // Measure the execution time of copyij
    clock_t start_time = clock();
    copyij(source_matrix, destination_matrix);
    clock_t end_time = clock();
    double execution_time_copyij = (double)(end_time - start_time) / CLOCKS_PER_SEC;

    // Measure the execution time of copyji
    start_time = clock();
    copyji(source_matrix, destination_matrix);
    end_time = clock();
    double execution_time_copyji = (double)(end_time - start_time) / CLOCKS_PER_SEC;

    printf("Execution time of copyij: %lf seconds\n", execution_time_copyij);
    printf("Execution time of copyji: %lf seconds\n", execution_time_copyji);

    free(source_matrix);
    free(destination_matrix);

    return 0;
}

