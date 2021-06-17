#Programa que calcula o saldo de uma pessoa referente a sua receita e despesas
.data 
	ZERO: .float 0.0
	.macro print(%str) #Funcao para impressao de strings no console
		.data
			msg: .asciiz %str
		.text 
			li $v0,4
			la $a0,msg
			syscall
	.end_macro
.text 
	#Imprimindo uma mensagem na tela do usu�rio
	print("Quanto � sua receita?: R$")
	#Pegando o valor digitado pelo usu�rio (por defini�ao,esse valor ficar� guardado em $f0)
	li $v0,6
	syscall
	lwc1 $f1,ZERO #Instru�ao para nos auxiliar no uso das instru�oes add.s (que requerem 3 argumentos)
	add.s $f2,$f1,$f0 #$f2=0.0+valorReceita
	#Imprimindo outra mensagem na tela do usu�rio
	print("E suas despesas?: R$")
	#Pegando o valor digitado pelo usu�rio (por defini�ao,esse valor ficar� guardado em $f0)
	li $v0,6
	syscall
	add.s $f3,$f1,$f0 #$f3=0.0+valorDespesas
	sub.s $f12,$f2,$f3 #$f12=valorReceita-valorDespesas
	#Por defini�ao,$f12 deve sempre conter o valor com ponto flutuante a ser imprimido no console
	#Imprimindo outra mensagem na tela do usu�rio
	print("Seu saldo � R$")
	#Imprimindo o valor contido em $f12
	li $v0,2
	syscall
	#Finalizando o programa
	li $v0,10
	syscall