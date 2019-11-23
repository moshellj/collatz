#include <cstdio>
#include <utility>
#include <stdint.h>
#include <deque>
#include <algorithm>

/* A note on the includes:
 * Utility provides pair, a nice container class.
 * stdint.h provides integer primitive types designated by size.
 * deque is a double ended queue.
 * algorithm provides std::sort.
 */

//A couple of testing limits.
#define FIVE_BIL 5000000001
#define FIVE_MIL 5000001
#define TWTY_MIL 20000001

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
	
	for(uint64_t n = 1; n < FIVE_MIL; ++n){
		i = n;
		length = 0;
		while(i > 1){
			// BRANCHLESS COLLATZ!
			// Removes the unpredictable inner branch and replaces it with arithmetic!
			// Reduces user time from 89 min to 83 min. Longer than expected, but good.
			odd = i & 1;
			i = i+((i+i+1)*odd) >> 1;
			length += 1 + odd;
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
