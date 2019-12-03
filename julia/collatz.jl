#!/usr/bin/julia

using Printf

maxlength = 0
for n = 1:1000000
	global maxlength
	length = 0
	i = n
	while i > 1
		if (i % 2) == 0
			i = i >> 1
		else
			i = 3*i+1
		end
		length = length + 1
	end
	if length > maxlength
		@printf("%d\n", length)
		maxlength = length
	end
end
