#include <cstdio>
#include <utility>
#include <stdint.h>

int main(){
	uint64_t i = 1;
	uint64_t length = 0;
	uint64_t maxlen = length;
	for(uint64_t n = 1; n < 5000000001; ++n){
		i = n;
		length = 0;
		while(i > 1){
			if(i & 1){
				i = i+i+i+1;
			}else{
				i = i >> 1;
			}
			++length;
		}
		if(length > maxlen){
			maxlen = length;
			printf("%lu -> %lu\n", n, length);
		}
	}
}
