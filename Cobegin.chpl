writeln("output from main thread");
cobegin{
	for i in 1..100 do
		writeln("From loop1 iteration = ",i);
	for i in 1..100 do
		writeln("From loop2 iteration = ",i);
}

writeln("output from main thread");