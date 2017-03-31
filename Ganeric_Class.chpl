class GenericClass {
	type t;
	var classDomain: domain(1);
	var classArray: [classDomain] t;

	proc GenericClass(type t,elements : int)
	{
		this.classDomain = {1..#elements};
	}

	proc this( i : int ) ref : t{
		return this.classArray[i];
	}
}

var myList= new GenericClass(int,5);
forall i in myList.classDomain do myList[i] = i+5;

writeln(myList.classArray);