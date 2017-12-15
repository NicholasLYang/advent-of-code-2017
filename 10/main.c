#include <stdio.h>
#include <stdlib.h>

const int ARRAY_SIZE = 256;

void initArray(int * array) {
    for (int i = 0; i < ARRAY_SIZE; i++) {
        array[i] = i;
    }
}

void printArray(int* array) {
    printf("[");
    for (int i = 0; i < ARRAY_SIZE; i++) {
        printf("%i, ", array[i]);
    }
    printf("]\n");
}
void swap(int* array, int i, int j) {
    // Neat way of swapping variables
    array[i] = array[i] ^ array[j];
    array[j] = array[i] ^ array[j];
    array[i] = array[i] ^ array[j];
}

void rotate(int* array, int range, int start) {
    int length = range - 1;
    for (int i = 0; i < length/2; i++) {
        int firstIndex = (start + i) % ARRAY_SIZE;
        int secondIndex = (start + length - i) % ARRAY_SIZE;
        swap(array, firstIndex, secondIndex);
    }
}

int hashRound(int* array, int inputLength, char* input, int skipLength, int index) {
    int endLengths[] = {17, 31, 73, 47, 23};
    for (int i = 0; i < inputLength; i++) {
        rotate(array, input[i], index);
        index = (index + input[i] + skipLength) % ARRAY_SIZE;
        skipLength++;
    }

    for (int i = 0; i < 5; i++) {
        rotate(array, endLengths[i], index);
        index = (index + endLengths[i] + skipLength) % ARRAY_SIZE;
        skipLength++;
    }
    return index;
}

int* makeDenseHash(int* array) {
    int* denseHash = malloc(16 * sizeof(int));
    for (int i = 0; i < 16; i++) {
        int acc = 0;
        for (int j = 0; j < 16; j++) {
            acc = acc ^ array[i * 16 + j];
        }
        printf("%i ", acc);
        denseHash[i] = acc;
    }
    return denseHash;
}

int main() {
    char input[] = "192,69,168,160,78,1,166,28,0,83,198,2,254,255,41,12";
    int* array = malloc(ARRAY_SIZE * sizeof(int));
    initArray(array);
    int inputLength = sizeof(input)/sizeof(input[0]);
    int index = 0;
    for (int i = 0; i < 64; i++) {
        printf("%i\n", i * inputLength);
        index = hashRound(array, inputLength, input, i * inputLength, index);
    }
    int* denseHash = makeDenseHash(array);
    for (int i = 0; i < 16; i++) {
        printf("%x", denseHash[i]);
    }
    return 0;
}



