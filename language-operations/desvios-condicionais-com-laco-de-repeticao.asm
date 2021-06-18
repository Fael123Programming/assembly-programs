#Programa que verifica a idade do usuário e mostra uma mensagem específica para cada caso
#Enquanto o número 0 nao for digitado,a rotina principal nao finaliza
.data
	msgAskAge: .asciiz "Digite sua idade (0 para finalizar):"
	msgUnderAge: .asciiz "Voçe é menor de idade!\n"
	msgOverAge: .asciiz "Voçe é maior de idade!\n"
.text 
.globl main
main:
	#Showing msgAskAge to user
	li $v0,4
	la $a0,msgAskAge
	syscall
	
	#Getting age from user
	li $v0,5 #$v0 has the typed age
	syscall
	
	move $t1,$v0 #Discharging $v0 to $t0
	
	li $t0,18 #Reference to compare age
	
	#Branch if equal
	beq $t1,$zero,exit #If $t1==0 go to exit escope
	#Branch if less than
	blt $t1,$t0,underAge #if $t1<$t0 go to underAge escope
	
	li $v0,4 #Branch if $t1>=18 
	la $a0,msgOverAge
	syscall
	j main
	
	exit:
		li $v0,10
		syscall
	
	underAge:#here
		li $v0,4
		la $a0,msgUnderAge
		syscall
		j main  #goto statement: j targetEscope
			#jump unconditionally