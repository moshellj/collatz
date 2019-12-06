using System;
using System.Collections.Generic;

class Collatz{
	static void Main(string[] args){
		ulong length = 0;
		ulong tenth = 0;
		//c# does not have typedefs, which I would like.
		//at least it has a pair class.
		List<Tuple<ulong, ulong> > biggest = new List<Tuple<ulong, ulong> >();
		ulong i = 0;
		for(i = 0; i < 10; i++){
			biggest.Add(new Tuple<ulong, ulong>(0, 0));
		}
		//calculation
		for(ulong n = 2; n <= 10000000; n++){
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
			//largest element tracking
			if(length >= tenth){
				//Console.WriteLine("{0} -> {1}", n, length);
				biggest.RemoveAt(0);
				//COOL THING: C# compares tuples by their first element by default.
				biggest.Add(new Tuple<ulong, ulong>(length, n));
				//sort
				biggest.Sort();
				tenth = biggest[0].Item1;
			}
		}
		Console.WriteLine("Top 10 largest elements:\n\nBy Length:");
		for(int j = 0; j < 10; j++){
			//C#'s string formatting is an interesting alternative to the common prinf format.
			Console.WriteLine("Number: {0}, \tLength: {1}",
				biggest[j].Item2.ToString(), biggest[j].Item1.ToString());
			//swap
			biggest[j] = new Tuple<ulong, ulong>(biggest[j].Item2, biggest[j].Item1);
		}
		biggest.Sort();
		Console.WriteLine("\nBy Size:");
		for(int j = 0; j < 10; j++){
			Console.WriteLine("Number: {0}, \tLength: {1}",
				biggest[j].Item1.ToString(), biggest[j].Item2.ToString());
		}
	}
}
