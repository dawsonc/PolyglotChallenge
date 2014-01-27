Encrypts a string by adding 13 to each letter (not actually ROT-13 but close)

### Read in a string ###
>                   Leave an empty cell at the beginning
+[>,]               Read in until a null is read
<[<]>>              Rewind until empty cell

### Print out the input ###
[.>]                Print each letter and step forward
<[<]>>              Rewind

### Print out a delimiter ###
[>]>                Find the end of the string (plus an empty cell)
++++++++++          Add 45 (ASCII minus sign)
++++++++++
++++++++++
++++++++++
+++++
...                 Print out 3 times
<<[<]>>             Rewind

### Encrypt the string ###
[+++++++++++++>]    Add 14 to each letter
<[<]>>              Rewind to the start of the string

### Print out the encrypted string ###
[.>]                Print each letter and step forward
<[<]>>              Rewind to the start of the string

### Print out a delimiter ###
[>]>                Find the end of the string (plus an empty cell)
                    No need to add anything since 45 is already there
...                 Print out 3 times
<<[<]>>             Rewind

### Decrypt the string ###
[------------->]    Subtract 13 from each letter
<[<]>>              Rewind to the start of the string

### Print out the decrypted string ###
[.>]                Print each letter and step forward
<[<]>>              Rewind (not really necessary)
