#Programa que implementa um algoritmo para se encontrar números da sequencia de Fibonacci através de suas posiçoes.
.data
	.macro imprima(%str)
		.data
			msg: .asciiz %str
		.text
			li $v0,4
			la $a0,msg
			syscall
	.end_macro 
.text 
.globl main
main:
	imprima("\n\nElemento (0 para sair): ") 
	li $v0,5
	syscall #Le um número inteiro
	move $t0,$v0 #Move o número digitado para o registrador $t0 
	beq $t0,$zero,finalizar
	blt  $t0,$zero,elementoInvalido #Se o valor digitado pelo usuário for zero ou menor.
	bge $t0,48,valorMuitoAlto
	li $t1,0 #Os registradores de $t1 a $t3 serao usados para se realizar operaçoes de soma.
	li $t2,1
	li $t3,0 #Registrador que conterá o resultado final.
	li $t4,1 #Registrador que será usado como "variável" contadora. 
	repetition:
		beq $t4,$t0,mostrarResultado #Ou seja,enquanto $t4<$t0 continue executando...quando nao for,vá para mostrarResultado.
		add $t3,$t1,$t2
		add $t1,$t2,$zero #$t1 recebe o valor que está em $t2.
		add $t2,$t3,$zero #$t2 recebe o valor que está em $t3.
		addi $t4,$t4,1 #Incrementando a "variável" contadora em uma unidade.
		beq $t4,3,alterarValores #Isso vai acontecer para alterarmos alguns valores usados...é o caso do terceiro elemento
		#da sequencia,que se repete... (0,1,1,...)
		j repetition
	elementoInvalido:
		imprima("\n\n##### Elemento inválido #####")
		j main
	alterarValores:
		li $t3,1
		li $t2,1
		j repetition
	mostrarResultado:
		imprima("\nPosiçao[")
		li $v0,1
		la $a0,($t0)
		syscall
		imprima("]=")
		li $v0,1
		la $a0,($t3)
		syscall
		j main
	finalizar:
		imprima("\n\n##### Rotina finalizada #####\n\n")
		li $v0,10
		syscall
	valorMuitoAlto:
		imprima("\n\n##### Valor nao suportado pela arquitetura MIPS (32 bits) #####")
		j main