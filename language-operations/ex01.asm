.data
#data is used to create our variables 
msg: .asciiz "Unless you know what you're doing\nit's recommended that you stop\nlearning Assembly and go into Python!"
.text 
#text is used to contain our main program routine
#Firstly, prepare microprocessor to receive the string created above
li $v0,4 #li -> immediate reading. It prepares the microprocessor to read something
la $a0,msg #It loads memory address and puts msg value on recorder
syscall #It calls the microprocessor to execute
li $v0,10 #It Prepares the microprocessor to end 
syscall #It calls the microprocessor to execute