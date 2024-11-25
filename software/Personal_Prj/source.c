/*
 * source.c
 *
 *  Created on: 25-11-2024
 *      Author: PeterPhan
 */

#include "stdio.h"
#include "io.h"
#include "system.h"

int main(){
	volatile int* sine_ptr = (int*)SINE_WAVE_GENERATOR_0_BASE;
	*sine_ptr = 128;
	*(sine_ptr + 1) = 1;
	for(int i=0;i<100;i++){
		IORD((int)sine_ptr, 2);
	}
	*(sine_ptr + 1) = 0;
	*sine_ptr = 16;
	*(sine_ptr + 1) = 1;
	for(int i=0;i<100;i++){
		IORD((int)sine_ptr, 2);
	}
	return 1;
}

