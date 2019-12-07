#!/usr/bin/julia
using Printf

#Useful builtin sorting functions means this one is real short and easy to read.
#Pretty fast, too.

function getLength(i)
	if(i <= 1)
		return 0
	elseif((i%2) == 0)
		return getLength(i>>1)+1
	else
		return getLength(3*i+1)+1
	end
end

biggest = zeros(Int64, 10, 2)
tenth = 0
for n = 1:1000000
	global tenth
	global biggest
	length = getLength(n)
	if length >= tenth
		#@printf("%d\t%d\n", n, length)
		biggest[1, 2] = n
		biggest[1, 1] = length
		biggest = sortslices(biggest, dims=1)
		tenth = biggest[1, 1]
	end
end

@printf("Largest elements:\n\nBy Length:\n")
for r = 1:10
	global biggest
	@printf("Number = %d, Length = %d\n", biggest[r, 2], biggest[r, 1])
	temp = biggest[r, 1]
	biggest[r, 1] = biggest[r, 2]
	biggest[r, 2] = temp
end
biggest = sortslices(biggest, dims=1)
@printf("\nBy Size:\n")
for r = 1:10
	global biggest
	@printf("Number = %d, Length = %d\n", biggest[r, 1], biggest[r, 2])
end
