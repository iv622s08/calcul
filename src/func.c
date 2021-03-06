#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "func.h"
#define Pi 3.1415926535

float plus(float A[], int n)
{
	int i;
	float value = 0;
	for (i = 0; i < n; i++)
		value += A[i];
	return value;
}

float minus(float A[], int n)
{
	int i;
	float value = A[0];
	for (i = 1; i < n; i++)
		value -= A[i];
	return value;
}

float multi(float A[], int n)
{
	int i;
	float value = 1;
	for (i = 0; i < n; i++)
		value *= A[i];
	return value;
}

float divis(float a, float b, float *c)
{
	if (b == 0)
		return -1;
	else
	{
		*c = a / b;
		return 0;
	}
}

int root(float a)
{
	float value;
	if (a < 0)
	{
		return -1.0;
	}
	else
	{
		value = sqrt(a);
		return value;
	}
}

int fact(int n)
{
	if (n == 1)
		return 1;
	else
		return n*fact(n-1);
}

float trig(int item, float var)
{
	switch (item) {
	case 1:
		return sin(var * M_PI/180);
	case 2:
		return cos(var * Pi/180);
	case 3:
		if (var == 90 || var == 270)
		{
			return -1;
		}
		else
		{
			return tan(var * Pi/180);
		}
	case 4:
		if (var == 0 || var == 180 || var == 360)
		{
			return -1;
		}
		else
		{
			return 1/tan(var * Pi/180);
		}
	case 5:
		return asin(var) * 180/Pi;
	case 6:
		return acos(var) * 180/Pi;
	case 7:
		return atan(var) * 180/Pi;
	case 8:
		return (Pi/2 - atan(var)) * 180/Pi;
	default:
		return 0;
	}
}


float expon(float x, float y)
{
	return pow(x, y);
}
