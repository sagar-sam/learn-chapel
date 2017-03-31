proc factorial(x : int) : int
{
	if x<0 then
		halt("Factorial of negative numbers not possible");
	return if x==0 then 1 else x*factorial(x-1);
}

var num : int;
writeln("Enter the number: ");
num=stdin.read(int);
writeln("Factorial of ",num," = ",factorial(num));
