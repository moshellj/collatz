#include <cstdio>
#include <utility>
#include <stdint.h>
#include <deque>
#include <algorithm>


//Typedef! renames a type. shortens big ol' templated type name into something more convenient.
typedef std::pair<uint64_t, uint64_t> intpair;

int main(){
	uint64_t i = 1;
	uint64_t length = 0;
	
	//pairs are length - n
	std::deque<intpair> biggest;
	for(int i = 0; i < 10; i++){
		biggest.push_back(intpair(0, 0));
	}
	uint64_t tenth = 0;
	
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
		if(length > tenth){
			//new element for list
			//printf("n= %lu, L= %lu\n", n, length);//info; comment out later
			biggest.pop_front();
			biggest.push_back(intpair(length, n));
			std::sort(biggest.begin(), biggest.end());
			//new least member
			tenth = biggest.front().first;
		}
	}
	//print out contents
	printf("Ten highest elements:\n");
	for(std::deque<intpair>::iterator j = biggest.begin(); j != biggest.end(); j++){
		printf("n= %lu, L= %lu\n", j -> second, j-> first);
	}
}
