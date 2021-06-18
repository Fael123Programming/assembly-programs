.data
	n1: .asciiz "Nota 1:"
	n2: .asciiz "Nota 2:"
	n3: .asciiz "Nota 3:"
	n4: .asciiz "Nota 4:"
	summ: .asciiz "Soma="
.text 
.globl main
	main: 
		li $v0,4 #print message
		la $a0,n1
		syscall
		
		li $v0,5 #read an integer number
		syscall
		move $t1,$v0 #move the typed number to a temporary register
		
		li $v0,4 #print message
		la $a0,n2
		syscall
		
		li $v0,5 #read an integer number
		syscall
		move $t2,$v0 #move the typed number to a temporary register
		
		li $v0,4 #print message
		la $a0,n3
		syscall
		
		li $v0,5 #read an integer number
		syscall
		move $t3,$v0 #move the typed number to a temporary register
		
		li $v0,4 #print message
		la $a0,n4
		syscall
		
		li $v0,5 #read an integer number
		syscall
		move $t4,$v0 #move the typed number to a temporary register
		
		#Calculating the summation
		add $t5,$t1,$t2
		add $t6,$t3,$t4
		add $t0,$t5,$t6 #$t0 has the result
		
		#Output
		li $v0,4
		la $a0,summ
		syscall
		li $v0,1 #print an integer number
		la $a0,($t0) #parentheses required here
		syscall
		
		li $v0,10 #End routine
		syscall
		
		
