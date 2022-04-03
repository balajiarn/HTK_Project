#include "HT66F0021.h"
#include "build-in.h"
// our LED is connected to pa6
void main()
{
	while (1)
	{
		// turn on the LED
		_pa6 = 1;
		GCC_DELAY(500);
		// trun off the LED
		_pa6 = 0;
	}
}