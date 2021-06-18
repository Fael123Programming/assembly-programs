.text 
	#Carregando valores inteiros para registradores temporários,realizando a soma desses valores e colocando esse valor em um registrador de salvamento de informacao
	li $t1,100
	li $t2,78
	add $s0,$t1,$t2
	#Somando o valor de $t1 (100) com -50 e passando o resultado para $s1
	addi $s1,$t1,-50
	#Nao é necessario usar comando syscall para esse tipo de operacao 