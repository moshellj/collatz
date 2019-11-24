#!/usr/bin/python3

#NEAT LANGUAGE THING: Python ints are arbitrary-precision!
i = 0
length = 0
tenth = 0;

biggest = [[0, 0] for x in range(10)]

for n in range(1, 5000000000):
	i = n
	length = 0
	while(i > 1):
		if(i % 2 == 1):#odd
			i = 3*i+1
		else:#even
			i = i >> 1
		length += 1;
	if(length > tenth):#top 10 longest sequences
		biggest[0] = [length, n]
		#print(str(n) + " -> " + str(length))
		biggest.sort()#list.sort() sorts lists of lists by their first element. that's nice.
		tenth = biggest[0][0]

print("Ten longest sequences:")
print("\nBy Length:")
for x in biggest:
	print("Number = " + str(x[1]) + ", Length = " + str(x[0]))
	#swap
	temp = x[0]
	x[0] = x[1]
	x[1] = temp

biggest.sort()
print("\nBy starting point:")
for x in biggest:
	print("Number = " + str(x[0]) + ", Length = " + str(x[1]))
