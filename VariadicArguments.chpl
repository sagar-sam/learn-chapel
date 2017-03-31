proc maxOf(x ... ?k){
	var max=x[1];
	for i in 2..k do
	max= if (max<x[i]) then x[i] else max;
	return max;
}

writeln("The maximum of the given elements is ",maxOf(10,15,19,-18,1,200,-189));
