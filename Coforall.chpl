writeln("output from main thread");
coforall i in 1..10 {
	writeln("output task 1, iteration =",i);
	writeln("output task 2, iteration =",i);
}
writeln("output from main thead");
