#ifndef _ADC_H_
#define _ADC_H_

// analog pin definitions
#define AN0 	0
#define AN1 	1
#define AN2 	2
#define AN3 	3

/* initialize the ADC clock, reference
   data format */
void initADC();
/* starts a ADC conversion and 
   reads a 10bit value from ADC */
int readADC(unsigned char pin);

#endif // _ADC_H_
