var fromThatArray : [1..#5] int = [1,2,3,4,5];
var toThisArray : [100..#5] int;
for (i,j) in zip(toThisArray.domain,fromThatArray.domain){
	toThisArray[i] = fromThatArray[j];
}

writeln(toThisArray);
