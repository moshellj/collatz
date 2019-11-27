class Collatz
{
	public static void main(String args[]){
		long i = 1;
		long length = 0;
		long maxlength = 0;
		
		//calculation
		for(long n = 2; n <= 1000000; n++){
			i = n;
			length = 0;
			while(i >1){
				if(i % 2 == 1){
					i = 3*i+1;
				}else{
					i = i >> 1;
				}
				length++;
			}
			if(length > maxlength){
				System.out.println(length);
				maxlength = length;
			}
		}
	}
}
