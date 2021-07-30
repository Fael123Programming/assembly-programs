#Recursion with Assembly MIPS - Factorial
.data
	headerMsg: .asciiz "Factorial of "
	answerMessage: .asciiz "Factorial is "
	typedNumber: .word 1
.text
.globl main

	main:
		#Showing the header message
		li $v0,4 #load immediate
		la $a0,headerMsg #load address
		syscall
		
		#Reading an integer number
		li $v0,5
		syscall
		
		#defining operators to calculus
		sw $v0,typedNumber #typedNumber = $v0 (its value). sw means store word
		addi $s0,$v0,0 #$s0 will receive $v0 + 0
		addi $s1,$zero,1 #s1 will receive 0 + 1 = 1
		
		repetition:
			#Check if $s0 is greater than 0. If
			sgt $t0,$s0,$zero #set greater than. If  $s0 > $zero then $t0 receives 1 else 0
			beq $t0,$zero,stop #if $t0 == 0, go to stop escope (it means that $s0 isn't greater than 0)
			mul $s1,$s1,$s0 #$s1 = $s1 * $s0
			subi $s0,$s0,1 #$s0 = $s0 - 1
			j repetition #repete until $s0 become 0
		stop:
			li $v0,4 #prepate sistem to show a message
			la $a0,answerMessage
			syscall
			
			li $v0,1 #printing the calculation result
			move $a0,$s1
			syscall
			
			li $v0,10
			syscall
		
		
		
		