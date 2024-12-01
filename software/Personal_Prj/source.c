/*
 * source.c
 *
 *  Created on: 25-11-2024
 *      Author: PeterPhan
 */

#include <stdio.h>
#include "io.h"
#include "system.h"
#include "sys/alt_irq.h"

void Sine_Wave_IRQ_Handler(void* isr_context){
	IOWR(SINE_WAVE_GENERATOR_0_BASE, 2, 0);
//	IORD(SINE_WAVE_GENERATOR_0_BASE, 3);
}

int main(){
	alt_ic_isr_register(0, SINE_WAVE_GENERATOR_0_IRQ, Sine_Wave_IRQ_Handler, (void*)0, (void*)0);
	volatile int* sine_ptr = (int*)SINE_WAVE_GENERATOR_0_BASE;
	*sine_ptr = 128;
	*(sine_ptr + 1) = 3;
	while(1){

	}

	return 1;
}

