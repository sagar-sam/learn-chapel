record complex
{
	var x,y : real;
}
proc +(c1: complex,c2:complex)
{
	return new complex(c1.x+c2.x,c1.y+c2.y);
}

var c1=new complex(0.5,7.5);
var c2=new complex(1.5,0.0);
writeln("c1 + c2 = ",c1+c2);
