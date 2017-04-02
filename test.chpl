/*
 *  Generic Stack Examples
 *
 *  This example implements a generic stack data structure using two
 *  methods: (1) via a linked list; (2) via an array.
 *
 */

// A stack class that is generic over the type of data that it
// contains.  This implementation uses a linked list implemented using
// the node class contained within it.
record ListStack {
  // A class that is used by the generic stack to implement nodes for a
  // linked-list implementation.
  class MyNode {
    type itemType;              // type of item
    var item: itemType;         // item in node
    var next: MyNode(itemType); // reference to next node (same type)
  }

  type itemType;             // type of items
  var top: MyNode(itemType); // top node on stack linked list

  // push method: add an item to the top of the stack
  proc push(item: itemType) {
    top = new MyNode(itemType, item, top);
  }

  // pop method: remove an item from the top of the stack
  // note: it is a runtime error if the stack is empty
  proc pop() {
    if isEmpty then
      halt("attempt to pop an item off an empty stack");
    var oldTop = top;
    var oldItem = top.item;
    top = top.next;
    delete oldTop;
    return oldItem;
  }

  proc count(x: itemType) {
    var result : int =0;
    var tmp = top;
    while tmp != nil {
      if tmp.item==x then
        result += 1;
      tmp = tmp.next;
    }
    return result;
  }

  // isEmpty method: true if the stack is empty; otherwise false
  proc isEmpty return top == nil;
}


// A stack class that is generic over the type of data that it
// contains.  This implementation uses an array to store the elements
// in the stack.
record ArrayStack {
  type itemType;            // type of items
  var numItems: int = 0;    // number of items in the stack
  var dataSpace: domain(1) = {1..2};
  var data: [dataSpace] itemType; // array of items

  // push method: add an item to the top of the stack
  // note: the array is doubled if it is full
  proc push(item: itemType) {
    var height = data.numElements;
    if numItems == height then
      dataSpace = {1..height*2};
    data(numItems+1) = item;
    numItems += 1;
  }

  // pop method: remove an item from the top of the stack
  // note: it is a runtime error if the stack is empty
  proc pop() {
    if isEmpty then
      halt("attempt to pop an item off an empty stack");
    numItems -= 1;
    return data(numItems+1);
  }


  proc count(x:itemType) {
    var result : int =0;
    result = + reduce ([i in 1..numItems] data[i]==x);
    return result;
  }

  // isEmpty method: true if the stack is empty; otherwise false
  proc isEmpty return numItems == 0;
}


use Time;

var s1 = new ListStack(string);
var s3 = new ArrayStack(string);

const r=1..1000000;

var t1:Timer;
t1.start();
for i in r do 
s1.push("Chapel");
t1.stop();

writeln(t1.elapsed()," seconds elapsed during push using list implementation"); 

var t2:Timer;
t2.start();
for i in r do 
s3.push("Chapel");
t2.stop();

writeln(t2.elapsed()," seconds elapsed during push using array implementation"); 


var t3: Timer;
t3.start();
s1.count("Chapel");
t3.stop();
writeln(t3.elapsed()," seconds elapsed during count using list implementation"); 


var t4: Timer;
t4.start();
s3.count("Chapel");
t4.stop();
writeln(t4.elapsed()," seconds elapsed during count using array implementation"); 
