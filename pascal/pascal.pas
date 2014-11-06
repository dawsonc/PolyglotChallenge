program HelloPascal
uses crt;
var
  { You need your global variables defined up front }
  result: Integer

{ Functions and procedures are defined at the top }
Procedure sayHelloTo(var name: String);
  begin
    writeln("Hello, ", name);
  end
end;

Function myfunc(var input: Integer): Integer;
  var
    { You have to declare your local variables at the top of functions }
    toReturn: Integer;
  begin
    toReturn := input * input; { Square the input }
    myfunc := toReturn / 2; { Divide it by two }

{* Main program starts here *}
begin
  { If you haven't picked up on this yet, comments are enclosed in curly braces}

  { Here's a procedure (procs are like functions but without a return value) }
  sayHelloTo('Pascal');

  { Here's a function }
  result := myfunc(1);
  writeln("The result is ", result);
end.