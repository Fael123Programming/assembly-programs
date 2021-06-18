.data
	msg: .asciiz "If you run this program, probably your runtime execution will get in problems!\n"
.text
.globl main
main:
	li $v0,4
	la $a0,msg
	syscall
	j main #jump to main unconditionally
	
