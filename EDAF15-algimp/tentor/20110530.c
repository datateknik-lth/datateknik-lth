#include <math.h>
#include <stdlib.h>
#include <stdio.h>

unsigned long x = 0;
void work(){}

static unsigned int f(unsigned int a, unsigned int b)
{
	unsigned int	c = 1;

	while (b-- > 0)
		c = c * a;
	return c;
}

static void g(unsigned int s, int r)
{
	x = 15 * x + r % s;
	x += x / s;
}

int main(int argc, char** argv)
{
	register int		i;
	register unsigned int	s;
	register unsigned int	r;
	unsigned int		n;
	register unsigned long	y;

	if (argc != 2 || 1 != sscanf(argv[1], "%u", &n))
		n = 20;

	/* original code. */

	srand(44);
	for (i = 0; i < n; ++i) {
		s = f(2, i);
		g(s, rand());
	}
	work();
	printf("x = %lu\n", x);

	/* optimized code. */
	srand(44);
	y = 0;
	s = 1; 
	for (i = 0; i < n; ++i) {
		r = rand();
		y = (y<<4)-y + (r & (s-1));
		y = y + (y >> i);
		s = s + s;
	}
	
	x = y;
	printf("y = %lu\n", y);
	return 0;
}
