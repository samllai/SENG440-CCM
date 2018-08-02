#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <math.h>

//log2(1+2^-i)
int32_t lut[32] = {
	268435456, 157024676, 86416915, 45613895,
	23478128, 11916956, 6004314, 3013793,
	1509828, 755650, 378009, 189051,
	94537, 47271, 23636, 11818,
	5909, 29545, 1477, 739,
	369, 185, 92, 46,
	23, 12, 6, 3,
	2, 1, 0, 0

};

int main(int argc, char * argv[]) {
	int32_t sf = 268435456; //2^28
	int k = 32;
	
	/*testing: m1 = 0.75, m2 = 0.3, m3 = 1.4
	
	int32_t m1 = 201326592;
	int32_t m2 = 80530636;
	int32_t m3 = 375809638; 
	
	expected output: -111410784, 330482806, 426674748
	*/
	
	printf("Using Convergence Computing Method with a scale factor of 2^28\n");
	
	if (argc != 4) {
		printf("Enter 3 numbers on the command line\n");
		printf("The first between 134217728 and 268435456 to find the log base 2\n");
		printf("The second between 0 and 268435456 to find the exponential\n");
		printf("The third between 268435456 and 1073741824 to find the square root\n");
		exit(1);
	} 
	
	int32_t m1, m2, m3;
	m1 = atoi(argv[1]);
	m2 = atoi(argv[2]);
	m3 = atoi(argv[3]);
	
	if (m1<=134217728 || m1>=268435456) {
		printf("First out of bounds\n");
		exit(1);
	} else if (m2 <= 0 || m2 >= 268435456) {
		printf("Second out of bounds\n");
		exit(1);
	} else if (m3 <= 268435456 || m3 >= 1073741824) {
		printf("Third out of bounds\n");
		exit(1);
	}
	
	int32_t f1, f2, f3;
	int i;
	int32_t u;
	
	//binary logarithm
	u-=u;
	f1-=f1;
	for(i-=i; i < k; i++) {
		u = (m1 + (m1 >> i));
		if(u <= sf) {
			m1 = u;
			f1 -= lut[i];
		}
	}
	printf("The binary logarithm of %d is %d\n", (int)m1, (int)f1);
	
	//exponential
	u-=u;
	f2 = sf;
	for(i-=i; i < k; i++) {
		u = m2-lut[i];
		if(u>=0) {
			m2 = u;
			f2 = (f2 + (f2 >> i));
		}
	}
	printf("The binary exponential of %d is %d\n", (int)m2, (int)f2);
	
	//square root
	i-=i;
	u = 1073741824;
	f3 = sf;
	int32_t f_sqrt = sf;
	while(i < k){
		if(u<=m3) {
			f3 = u;
			f_sqrt = (f_sqrt + (f_sqrt >> i));
		}
		i++;
		u = (f3 + (f3 >> (1-i)) + (f3 >> (i+i)));
	}
	printf("The square root of %d is %d\n", (int)m3, (int)f_sqrt);
	
	exit(1);
}