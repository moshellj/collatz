with ada.text_io;
use ada.text_io;

procedure recollatz is
	--declarations
	
	--Ada's type declaration system is kind of interesting.
	type lpair is array(1..2) of long_integer;
	type length_list is array(1..10) of lpair;
	function getlen (i: in long_integer) return long_integer is
	begin
		if i = 1 then
			return 0;
		elsif i mod 2 = 1 then
			return getlen(3*i+1)+1;
		else
			return getlen(i/2)+1;
		end if;
	end getlen;
	
	--Sorts an array of arrays by the first element.
	procedure sort (list: in out length_list) is
		temp: lpair;
	begin
		for a in reverse 1..9 loop
			for b in 1..a loop
				if list(b)(1) < list(b+1)(1) then
					temp := list(b);
					list(b) := list(b+1);
					list(b+1) := temp;
				end if;
			end loop;
		end loop;
	end sort;
	
	--variables
	length, tenth, temp: long_integer;
	biggest : length_list;
	
begin
	--initialize. Not sure if it's necessary, but better safe than sorry.
	for x in 1..10 loop
		for y in 1..2 loop
			biggest(x)(y) := 0;
		end loop;
	end loop;
	tenth := 0;
	--loop
	for n in long_integer range 4990000000..5000000000 loop
		length := getlen(n);
		if length > tenth then
			--add new entry and sort
			biggest(10)(2) := n;
			biggest(10)(1) := length;
			sort(biggest);
			--put(long_integer(n)'image); put(" -> "); put_line(long_integer(length)'image);
			tenth := biggest(10)(1);
		end if;
	end loop;
	--display
	put_line("Largest sequences:");new_line(1);put_line("By length:");
	for x in 1..10 loop
		put("Number = ");put(long_integer(biggest(x)(2))'image);
		put(", Length = ");put_line(long_integer(biggest(x)(1))'image);
		--swap
		temp := biggest(x)(1);
		biggest(x)(1) := biggest(x)(2);
		biggest(x)(2) := temp;
	end loop;
	new_line(1);put_line("By size:");
	sort(biggest);
	for x in 1..10 loop
		put("Number = ");put(long_integer(biggest(x)(1))'image);
        put(", Length = ");put_line(long_integer(biggest(x)(2))'image);
	end loop;
end recollatz;
