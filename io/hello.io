a := "Hello," // ':=' is used for first time assignments
b := "world!"

b = " world!\n" // '=' is used for reassignments

writeln(a, b)

greet := method( // Kind of a javascript-y way to declare functions...
  writeln("What is your name?")
  you := File.standardInput readLine
  writeln 
)

// This next bit is a bit weird...
myObj := Object clone // Creates a new object
myObj name := "Gerald" // Add an instance variable
myObj say_name := method(writeln("Hi, I'm ", self name)) // Add another instance variable that happens to be a method

// This is where it gets wierd
myClass := myObj clone
myInstance1 := myClass clone
myInstance1 name = "Howard" // Why no ':='? You'll see...
myObj say_name // =>"Hi, I'm Howard" (GASP!). This is not a class! This is the same object called by a different name!

myObj name = "Gerald" // Fix this grievous mistake
myClass init := method(self name := "Reginald") // THIS makes myClass into a class
myInstance1 = myClass clone
myInstance1 name = "Howard"
myInstance2 = myClass clone
myInstance2 name = "Cynthia"
myInstance3 = myClass clone

myObj say_name // => "Hi, I'm Gerald"
myInstance1 say_name // => "Hi, I'm Howard"
myInstance2 say_name // => "Hi, I'm Cynthia"
myInstance3 say_name // => "Hi, I'm Reginald"