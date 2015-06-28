/**
 * Study the code by stepping through using debugger. Take note
 * of the stack memory, registers, variables declared in 'Main.c'
 * and 'AssemblyModule.s'.
 */

#include <stdint.h>
#include "AssemblyModule.h"
#include "SaveRegisters.h"

extern int fourBytes;						// Import from AssemblyModule.s
extern uint16_t twoBytes;				// Import from AssemblyModule.s

uint32_t variableInC = 0xdeaf;

int main() {
	initTcb();
	saveRegs();
	fourBytes = 0xdeadbeef;	
	noArgFunc();

	return 0;				// Verify that 'variableInC' now contains 0xB19FACE
}

int cFunc() {
	return 0xc00000 + twoBytes;
}

void SystemInit()	{
	// Do nothing at the moment because we are
	// not going to deal with any hardware
}
