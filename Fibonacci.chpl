iter fibonacci(n: int){
	var (current,next)=(0,1);
	for 1..n {
		yield current;
		(current,next)=(next,current+next);
	}
}
writeln("The First 8 elements of fibonacci series are: ",fibonacci(8));
