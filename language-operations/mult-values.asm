.data
	msg: .asciiz "50*60="
.text 
	#Atribuindo valores aos registradores usados e multiplicando
	li $t1,50
	add $t2,$zero,60
	mul $s0,$t1,$t2
	#Imprimindo a string msg
	li $v0,4
	la $a0,msg
	syscall
	#Imprimindo o resultado da operacao
	li $v0,1
	la $a0,($s0)
	syscall
	#Finalizando o programa
	li $v0,10
	syscall