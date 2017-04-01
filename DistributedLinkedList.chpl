class node {
  var data: real;
  var next: node;
}

var head    = new node(0);

var current = head;

for i in 1..numLocales-1 do
  on Locales[i] {
    current.next = new node(i);
    current      = current.next;
  }

current = head;

while current {
  on current {
    writeln("node with data = ", current.data, " on locale ", here.id);
    current = current.next;
  }
}

current = head;

while current {
  on current {
    var ptr = current;
    current = current.next;
    delete ptr;
  }
}
