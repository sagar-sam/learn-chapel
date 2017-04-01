 use Time;

var t1:Timer;

const r=1..1000000000;
t1.start();
var sum1:int = 0;
for i in r {
sum1 += i;
}
t1.stop();

writeln(t1.elapsed()," seconds elapsed using for loop"); 

var t2:Timer;

t2.start();
var sum2: int = 0;
sum2 = + reduce r;
t2.stop();

writeln(t2.elapsed()," seconds elapsed using reduce statement");
