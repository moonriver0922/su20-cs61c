#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <time.h>

#ifndef DRAND48_H
#define DRAND48_H


#define m 0x100000000LL
#define c 0xB16
#define a 0x5DEECE66DLL

static unsigned long long seed = 1;

double drand48(void)
{
	seed = (a * seed + c) & 0xFFFFFFFFFFFFLL;
	unsigned int x = seed >> 16;
    return 	((double)x / (double)m);
	
}

void srand48(unsigned int i)
{
    seed  = (((long long int)i) << 16) | rand();
}

#endif

/* The naive transpose function as a reference. */
void transpose_naive(int n, int blocksize, int *dst, int *src) {
    for (int x = 0; x < n; x++) {
        for (int y = 0; y < n; y++) {
            dst[y + x * n] = src[x + y * n];
        }
    }
}

/* Implement cache blocking below. You should NOT assume that n is a
 * multiple of the block size. */
void transpose_blocking(int n, int blocksize, int *dst, int *src) {
    // YOUR CODE HERE
    /*int stepsize;
    stepsize = blocksize / 4;
    for (int x = 0; x < n; x++) {
        if (stepsize < n)
        {
            for (int y = 0; y < n / stepsize; y++) {
                for (int z = 0; z < stepsize; z++)
                {
                    dst[x + (y * stepsize + z) * n] = src[x * n + y * stepsize + z];
                }
            }
            
            for (int y = stepsize * n / stepsize; y < n; y++)
            {
                dst[x + y * n] = src[y + x * n];
            }
        }
        else 
        {
            for (int y = 0; y < n; y++) {
                dst[x + y * n] = src[x * n + y];
            }
        }
    }*/
    for (int yBase = 0; yBase < n; yBase += blocksize)
    {
        int yBound = yBase + blocksize;
        if (yBound >= n)
        {
            yBound = n;
        }
        for (int xBase = 0; xBase < n; xBase += blocksize)
        {
            int xBound = xBase + blocksize;
            if (xBound >= n)
            {
                xBound = n;
            }
            for (int y = yBase; y < yBound; y++)
            {
                for (int x = xBase; x < xBound; x++)
                {
                    dst[y + x * n] = src[x + y * n];
                }
                
            }
            
        }          
    }
}

void benchmark(int *A, int *B, int n, int blocksize,
    void (*transpose)(int, int, int*, int*), char *description) {

    int i, j;
    printf("Testing %s: ", description);

    /* initialize A,B to random integers */
    srand48( time( NULL ) );
    for( i = 0; i < n*n; i++ ) A[i] = drand48();
    for( i = 0; i < n*n; i++ ) B[i] = drand48();

    /* measure performance */
    struct timeval start, end;

    gettimeofday( &start, NULL );
    transpose( n, blocksize, B, A );
    gettimeofday( &end, NULL );

    double seconds = (end.tv_sec - start.tv_sec) +
        1.0e-6 * (end.tv_usec - start.tv_usec);
    printf( "%g milliseconds\n", seconds*1e3 );


    /* check correctness */
    for( i = 0; i < n; i++ ) {
        for( j = 0; j < n; j++ ) {
            if( B[j+i*n] != A[i+j*n] ) {
                printf("Error!!!! Transpose does not result in correct answer!!\n");
                exit( -1 );
            }
        }
    }
}

int main( int argc, char **argv ) {
    if (argc != 3) {
        printf("Usage: transpose <n> <blocksize>\nExiting.\n");
        exit(1);
    }

    int n = atoi(argv[1]);
    int blocksize = atoi(argv[2]);

    /* allocate an n*n block of integers for the matrices */
    int *A = (int*)malloc( n*n*sizeof(int) );
    int *B = (int*)malloc( n*n*sizeof(int) );

    /* run tests */
    benchmark(A, B, n, blocksize, transpose_naive, "naive transpose");
    benchmark(A, B, n, blocksize, transpose_blocking, "transpose with blocking");

    /* release resources */
    free( A );
    free( B );
    return 0;
}
