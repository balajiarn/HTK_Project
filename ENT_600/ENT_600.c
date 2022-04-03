#include "HT66F0021.h"
#include "build-in.h"
#include "ADC.h"

// pin definitions
#define RELAY_1_PIN		_pa1		// pin 6
#define RELAY_2_PIN		_pa6		// pin 2
#define RELAY_3_PIN		_pa5		// pin 3
#define LED_1_PIN		_pa2		// pin 4
#define VOLTAGE_PIN		AN2			// pin 5

// IO definitions for setState
#define RELAY_1 		0
#define RELAY_2 		1
#define RELAY_3 		2 		// output relay
#define LED_1 	 		3

// relay and LED states
#define LOW				0x00
#define HIGH			0x01

// other macros
#define MAIN_LOOP_DELAY_MS	100 // millisconds
#define STARTUP_DELAY_MS 	(5 * 1000)
#define VOLTAGE_SCALING_FACTOR	97
// struct for lookup table entry
typedef struct entry
{
	int voltage;
	unsigned char relay1State;
	unsigned char relay2State;
	unsigned char relay3State;
} entry;

// look up table
#define LOOKUP_TABLE_SIZE 	8
entry lookupTable[LOOKUP_TABLE_SIZE] = {
	[0] = {.voltage = 0, .relay1State = LOW, .relay2State = LOW, .relay3State = LOW},
	[1] = {.voltage = 69, .relay1State = LOW, .relay2State = LOW, .relay3State = LOW},
	[2] = {.voltage = 136, .relay1State = LOW, .relay2State = LOW, .relay3State = LOW},
	[3] = {.voltage = 209, .relay1State = LOW, .relay2State = LOW, .relay3State = LOW},
	[4] = {.voltage = 223, .relay1State = LOW, .relay2State = LOW, .relay3State = LOW},
	[5] = {.voltage = 227, .relay1State = LOW, .relay2State = LOW, .relay3State = LOW},
	[6] = {.voltage = 286, .relay1State = LOW, .relay2State = LOW, .relay3State = LOW},
	[7] = {.voltage = 304, .relay1State = LOW, .relay2State = LOW, .relay3State = LOW}
};

unsigned char looupIndex(int voltage)
{
	unsigned char index = 0;
	for (index = 0; index < LOOKUP_TABLE_SIZE -1; ++index)
	{
		if (voltage >= lookupTable[index].voltage && voltage < lookupTable[index +1].voltage)
		{
			return index;
		}
	}
	return index;
}

void setState(unsigned char io, unsigned char state)
{
	if (state == LOW || state == HIGH)
	{
		switch (io)
		{
			case RELAY_1:
				RELAY_1_PIN = state;
				break;
			case RELAY_2:
				RELAY_2_PIN = state;
				break;
			case RELAY_3:
				RELAY_3_PIN = state;
				break;
			case LED_1:
				LED_1_PIN = state;
				break;
		}
	}
}

int readVoltage()
{
	int voltage = 0;
	// read data from ADC
	int data = readADC(VOLTAGE_PIN);
	// 1024 = 2 ^ 10, ie 10 bit ADC
	voltage = (data * VOLTAGE_SCALING_FACTOR) / 1024;
	return voltage;
}

void initIO()
{
	setState(RELAY_1, LOW);
	setState(RELAY_2, LOW);
	setState(RELAY_3, LOW);
	setState(LED_1, LOW);
}

void main()
{
	initIO();
	initADC();
	GCC_DELAY(STARTUP_DELAY_MS);

	while (1)
	{
		GCC_DELAY(MAIN_LOOP_DELAY_MS);

		// read voltage and get the lookup table index
		unsigned char index = looupIndex(readVoltage());

		// set the relay states
		setState(RELAY_1, lookupTable[index].relay1State);
		setState(RELAY_2, lookupTable[index].relay2State);
		setState(RELAY_3, lookupTable[index].relay3State);
		// LEDs state should mirror relay3's state (ie, output)
		setState(LED_1, lookupTable[index].relay3State);
	}
}