#!/usr/bin/ruby -w

# Useful standard sort makes this one ultra-compact and easy to read.

def getLength(i)
	if i == 1 then
		return 0
	elsif i % 2 == 1 then
		return getLength(3*i+1)+1
	else
		return getLength(i >> 1)+1
	end
end

$biggest = Array.new(10) { Array.new(2, 0) }
$tenth = 0
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
	if length >= $tenth then
		$biggest[0] = [n, length]
		$biggest = $biggest.sort_by(&:last)
		#puts "Number = %d, Length = %d"%[n, length]
		$tenth = $biggest[0][1]
	end
end

puts "Largest elements:\n\nBy Length:"

for x in $biggest do
	puts "Number = %d, Length = %d"%[x[0], x[1]]
end
$biggest = $biggest.sort_by(&:first)
puts "\nBy Size:"
for x in $biggest do
	puts "Number = %d, Length = %d"%[x[0], x[1]]
end
