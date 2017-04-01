config const n=31;
const r= 1..n;
var a:atomic int;
coforall id in r do a.add(id*id);
var expected = n*(n+1)*(2*n+1)/6;

if a.read() != expected then
halt("Error: a=",a.read(),"should be ",expected);
else 
writeln("Atomics works good");