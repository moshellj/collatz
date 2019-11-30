using System;

class Collatz{
	static void Main(string[] args){
		ulong length = 0;
		ulong maxlength = 0;
		ulong i = 0;
		//calculation
		for(ulong n = 2; n <= 1000000; n++){
			i = n;
			length = 0;
			while(i > 1){
				if((i & 1) != 0){
					i = i*3+1;
				}else{
					i = i >> 1;
				}
				length++;
			}
			if(length > maxlength){
				maxlength = length;
				Console.WriteLine("{0} -> {1}", n, length);
			}
		}
	}
}
