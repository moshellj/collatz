#!/usr/bin/ruby -w

$maxlength = 0
for n in 2..1000000
	length = 0
	i = n
	while i > 1 do
		if i % 2 == 1 then
			i = 3*i+1
		else
			i = i >> 1
		end
		length += 1
	end
	if length > $maxlength then
		$maxlength = length
		print n
		print " -> "
		puts length
	end
end
