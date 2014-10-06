push 2 ; Set up the stack with the numbers we want to multiply.
push 2 ; 1 & 2 in this case

pop EAX ; pop the top value of the stack into EAX (a general purpose register)
pop EBX ; pop the new top value of the stack into EBC (another general purpose register)
add EAX, EBX ; add the two values (store the result in EAX)

cmp EAX, 5
jg not_lesser

imul EAX, EAX, 2

not_lesser:
    ; no-op, just skip the multiplication step