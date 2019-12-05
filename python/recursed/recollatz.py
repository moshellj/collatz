#!/usr/bin/python3

def getLength(i):
	if i == 1:
		return 0;
	elif i % 2 == 1:
		return getLength(3*i+1) + 1;
	else:
		return getLength(i >> 1) + 1;

#NEAT LANGUAGE THING: Python ints are arbitrary-precision!
i = 0
length = 0
tenth = 0;

biggest = [[0, 0] for x in range(10)]

for n in range(1, 1000000):
	length = getLength(n)
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
