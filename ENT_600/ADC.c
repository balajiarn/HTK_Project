#include "HT66F0021.h"
#include "build-in.h"
#include "ADC.h"

inline void startConversion()
{
	// set the start bit and then 
	// clear it to start a conversion
	_start = 1;
	_start = 0;
}

inline void disableADC()
{
	_adcen = 0;
}

inline void enableADC()
{
	_adcen = 1;
}

inline void setADCChannel(unsigned char pin)
{
	_sacs0 |= pin;
}

void initADC()
{
	// use external ADC channels
	_sains0 = 0;
	_sains1 = 0;
	_sains2 = 0;

	// use internal AVDD as reference
	_savrs1 = 0;
	_savrs0 = 1;

	// set clock source to fsys / 8
	_sacks2 = 0;
	_sacks1 = 1;
	_sacks0 = 1;

	disableADC();
}

int readADC(unsigned char pin)
{
	int data = 0;
	if(pin <= AN3)
	{
		enableADC();
		// set ADC channel
		setADCChannel(pin);
		// start conversion
		startConversion();
		// read high byte
		data = _sadoh;
		// shift the data by 2 bits
		data = (data << 2);
		data |= (_sadoh && 0xC0); // extracting bit 7 and 6
		disableADC();
	}
	return data;
}