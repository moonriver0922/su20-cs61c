#include <time.h>
#include <stdio.h>
#include <x86intrin.h>
#include "common.h"

long long int sum(unsigned int vals[NUM_ELEMS]) {
	clock_t start = clock();

	long long int sum = 0;
	for(unsigned int w = 0; w < OUTER_ITERATIONS; w++) {
		for(unsigned int i = 0; i < NUM_ELEMS; i++) {
			if(vals[i] >= 128) {
				sum += vals[i];
			}
		}
	}
	clock_t end = clock();
	printf("Time taken: %Lf s\n", (long double)(end - start) / CLOCKS_PER_SEC);
	return sum;
}

long long int sum_unrolled(unsigned int vals[NUM_ELEMS]) {
	clock_t start = clock();
	long long int sum = 0;

	for(unsigned int w = 0; w < OUTER_ITERATIONS; w++) {
		for(unsigned int i = 0; i < NUM_ELEMS / 4 * 4; i += 4) {
			if(vals[i] >= 128) sum += vals[i];
			if(vals[i + 1] >= 128) sum += vals[i + 1];
			if(vals[i + 2] >= 128) sum += vals[i + 2];
			if(vals[i + 3] >= 128) sum += vals[i + 3];
		}

		//This is what we call the TAIL CASE
		//For when NUM_ELEMS isn't a multiple of 4
		//NONTRIVIAL FACT: NUM_ELEMS / 4 * 4 is the largest multiple of 4 less than NUM_ELEMS
		for(unsigned int i = NUM_ELEMS / 4 * 4; i < NUM_ELEMS; i++) {
			if (vals[i] >= 128) {
				sum += vals[i];
			}
		}
	}
	clock_t end = clock();
	printf("Time taken: %Lf s\n", (long double)(end - start) / CLOCKS_PER_SEC);
	return sum;
}

long long int sum_simd(unsigned int vals[NUM_ELEMS]) {
	clock_t start = clock();
	__m128i _127 = _mm_set1_epi32(127);		// This is a vector with 127s in it... Why might you need this?
	long long int result = 0;				   // This is where you should put your final result!
	/* DO NOT DO NOT DO NOT DO NOT WRITE ANYTHING ABOVE THIS LINE. */
	int std[4];
	for(unsigned int w = 0; w < OUTER_ITERATIONS; w++) {
		/* YOUR CODE GOES HERE */
		unsigned int i;
		__m128i sums = _mm_setzero_si128();
		for(i = 0; i < NUM_ELEMS - 4; i += 4) {
			__m128i values = _mm_loadu_si128((__m128i *) (vals + i));
			__m128i masks = _mm_cmpgt_epi32(values, _127);
			values = _mm_and_si128(values, masks);
			sums = _mm_add_epi32(values, sums);
		}
		_mm_storeu_si128((__m128i *) std, sums);
		/* You'll need a tail case. */
		for(; i < NUM_ELEMS; i++) {
			if (vals[i] >= 128)
				result += *(vals + i);
		}
		for (i = 0; i < 4; i++)
		{
			result += std[i];
		}
	}		
	clock_t end = clock();
	printf("Time taken: %Lf s\n", (long double)(end - start) / CLOCKS_PER_SEC);
	return result;
}

long long int sum_simd_unrolled(unsigned int vals[NUM_ELEMS]) {
	clock_t start = clock();
	__m128i _127 = _mm_set1_epi32(127);
	long long int result = 0;
	int std[4];
	for(unsigned int w = 0; w < OUTER_ITERATIONS; w++) {
		/* COPY AND PASTE YOUR sum_simd() HERE */
		/* MODIFY IT BY UNROLLING IT */
		/* YOUR CODE GOES HERE */
		unsigned int i;
		__m128i sums = _mm_setzero_si128();
		for(i = 0; i < NUM_ELEMS - 16; i += 16) {
			__m128i values = _mm_loadu_si128((__m128i *) (vals + i));
			__m128i masks = _mm_cmpgt_epi32(values, _127);
			values = _mm_and_si128(values, masks);
			sums = _mm_add_epi32(values, sums);
			values = _mm_loadu_si128((__m128i *) (vals + i + 4));
			masks = _mm_cmpgt_epi32(values, _127);
			values = _mm_and_si128(values, masks);
			sums = _mm_add_epi32(values, sums);
			values = _mm_loadu_si128((__m128i *) (vals + i + 8));
			masks = _mm_cmpgt_epi32(values, _127);
			values = _mm_and_si128(values, masks);
			sums = _mm_add_epi32(values, sums);
			values = _mm_loadu_si128((__m128i *) (vals + i + 12));
			masks = _mm_cmpgt_epi32(values, _127);
			values = _mm_and_si128(values, masks);
			sums = _mm_add_epi32(values, sums);
		}
		_mm_storeu_si128((__m128i *) std, sums);
		/* You'll need 1 or maybe 2 tail cases here. */
		for(; i < NUM_ELEMS; i++) {
			if (vals[i] >= 128)
				result += *(vals + i);
		}
		for (i = 0; i < 4; i++)
		{
			result += std[i];
		}
	}
	clock_t end = clock();
	printf("Time taken: %Lf s\n", (long double)(end - start) / CLOCKS_PER_SEC);
	return result;
}