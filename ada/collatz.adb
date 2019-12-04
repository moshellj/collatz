with ada.text_io;
use ada.text_io;

procedure collatz is
	--ada suuuuucks
	--declarations
	function getlen (n: in long_integer) return long_integer is
		length: long_integer := 0;
		i : long_integer := n;
	begin
		while i > 1 loop
			if i mod 2 = 1 then
				i := 3*i+1;
			else
				i := i/2;
			end if;
			length := length + 1;
		end loop;
		return length;
	end getlen;
	length, maxlen : long_integer;

begin
	maxlen := 0;
	for n in long_integer range 2..1000000 loop
		length := getlen(n);
		if length > maxlen then
			maxlen := length;
			put(integer(n)'image);
			put(" -> ");
			put_line(integer(length)'image);
		end if;
	end loop;
end collatz;
