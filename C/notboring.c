#include "ruby.h"

VALUE not_boring_class; // VALUE is the data type for a ruby object

VALUE doSomethingInteresting(VALUE rb_self) {
  printf("Knock Knock\n");
  printf("Who's there?\n");
  printf("Boo\n");
  printf("Boo who?\n");
  printf("Don't cry\n");
  return Qnil;
}

void Init_notboring() {
  not_boring_class = rb_define_class("NotBoring", rb_cObject); // Defines a ruby class that inherits from Object
  rb_define_method(not_boring_class, "doSomethingInteresting", doSomethingInteresting, 0); // Defines a ruby method for the class NotBoring called doSomethingInteresting that will evaluate the given function with 0 arguments
}