import java.util.*;

// Object oriented design is best suited for larger applications.
// To take advantage of this, Object-oriented languages require double the amount of code.

class ReCollatz
{
	public static void main(String args[]){
		//setup
		long i = 1;
		long length = 0;
		long tenth = 0;
		ArrayList<LongPair> biggest = new ArrayList();
		for(i = 0; i < 10; i++){
			biggest.add(new LongPair());
		}
		
		//calculation
		for(long n = 2; n <= 1000000L; n++){
			length = getLength(n);
			//longest element tracking
			if(length > tenth){
				//System.out.println(n + " -> " + length + ", \t " + tenth);
				biggest.add(new LongPair(length, n));
				Collections.sort(biggest, new LPcompar());
				biggest.remove(0);
				tenth = biggest.get(0).first;
			}
		}
		//display
		System.out.println("Largest elements:\n\nBy length:");
		for(LongPair x : biggest){
			System.out.println("Number = " + x.second + ", Length = " + x.first);
			x.swap();
		}
		System.out.println("\nBy size:");
		Collections.sort(biggest, new LPcompar());
		for(LongPair x : biggest){
			System.out.println("Number = " + x.first + ", Length = " + x.second);
		}
	}
	public static long getLength(long i){
		if(i==1){
			return 0;
		}else if(i%2==1){
			return getLength(i*3+1)+1;
		}else{
			return getLength(i>>1)+1;
		}
	}
}

//Java doesn't seem to have a standard pair class, so I'll write one up.
class LongPair{
	public long first;
	public long second;
	
	//constructors
	LongPair(){
		first = 0;
		second = 0;
	}
	LongPair(long a, long b){
		first = a;
		second = b;
	}
	
	//swap the 2 elements
	public void swap(){
		long temp = first;
		first = second;
		second = temp;
	}
}

//To use Collections.sort(), I need to write a separate comparator class for my pair.
class LPcompar implements Comparator<LongPair>{
	public int compare(LongPair left, LongPair right){
		return (int)(left.first - right.first);
	}
}
