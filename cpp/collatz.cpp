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
	unsigned int odd = 0;
	//initialize queue of longest sequences.
	//pairs are length - n
	std::deque<intpair> biggest;
	for(int i = 0; i < 10; i++){
		biggest.push_back(intpair(0, 0));
	}
	uint64_t tenth = 0;
	
	for(uint64_t n = 1; n <= 10000000; ++n){
		i = n;
		length = 0;
		while(i > 1){
			if(i & 1){
				i = i+i+i+1;
			}else{
				i = i >> 1;//bitwise operators are good.
			}
			++length;
		}
		if(length > tenth){
			//new element for list
			//printf("n= %lu, L= %lu\n", n, length);//info; comment out later
			biggest.pop_front();
			biggest.push_back(intpair(length, n));
			std::sort(biggest.begin(), biggest.end());
			//new lowest member
			tenth = biggest.front().first;
		}
	}
	//print out contents
	printf("Ten highest elements:\n\n");
	printf("By length:\n");
	for(std::deque<intpair>::iterator j = biggest.begin(); j != biggest.end(); j++){
		printf("Number = %lu, Length = %lu\n", j -> second, j-> first);
		//reorder
		uint64_t temp = j -> first;
		j -> first = j -> second;
		j -> second = temp;
	}
	std::sort(biggest.begin(), biggest.end());//re-sort by N
	printf("\nBy size:\n");
	for(std::deque<intpair>::iterator j = biggest.begin(); j != biggest.end(); j++){
		printf("Number = %lu, Length = %lu\n", j -> first, j -> second);
	}
}
