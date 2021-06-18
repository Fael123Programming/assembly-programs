.data
	msgAskAge: .asciiz "Digite sua idade:"
	msgUnderAge: .asciiz "Voçe é menor de idade!"
	msgOverAge: .asciiz "Voçe é maior de idade!"
.text 
	#Showing msgAskAge to user
	li $v0,4
	la $a0,msgAskAge
	syscall
	
	#Getting age from user
	li $v0,5 #$v0 has the typed age
	syscall
	
	move $t1,$v0 #Discharging $v0 to $t0
	
	li $t0,18 #Reference to compare age
	
	#Branch if less than
	blt $t1,$t0,underAge #if $t1<$t0 goto underAge escope
	#Branch if greater or equal
	bge $t1,$t0,overAge #if $t1>=$t0 goto overAge escope
	
	underAge:#here
		li $v0,4
		la $a0,msgUnderAge
		syscall
		
		li $v0,10
		syscall
		
	overAge:
		li $v0,4
		la $a0,msgOverAge
		syscall
		
		li $v0,10
		syscall
	
