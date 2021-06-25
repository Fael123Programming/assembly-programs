#Programa que simula um sistema de opera��es com um saldo banc�rio: permite opera�oes de dep�sito,saque e visualiza�ao da quantia
#atual do usu�rio. Realiza tratamento de erros com os dados digitados pelo usu�rio.
.data
	ZERO: .float 0.0
	.macro imprima(%str)
		.data
			msg: .asciiz %str
		.text
			li $v0,4
			la $a0,msg
			syscall
	.end_macro
	.macro leiaFloat
		li $v0,6
		syscall
	.end_macro
	.macro leiaInteiro
		li $v0,5
		syscall
	.end_macro
	.macro mostre$f12
		li $v0,2
		syscall
	.end_macro 
	.macro finalize
		li $v0,10
		syscall
	.end_macro 
.text
	.globl main
	main:
		lwc1 $f1,ZERO
		imprima("Informe o saldo inicial: R$") #Mostra mensagem
		leiaFloat #$f0 tem o n�mero digitado
		add.s $f12,$f0,$f1 #$f12 recebe o n�mero digitado
		c.lt.s $f12,$f1 #Se o saldo digitado pelo usu�rio � menor que zero
		bc1t saldoInicialInvalido #Se sim
		repetition:
			imprima("\n\n<<<<< Gerenciamento De Saldo >>>>>\n1. Ver saldo\n2. Depositar\n3. Sacar\n0. Finalizar\n-> ")
			leiaInteiro
			move $t1,$v0 
			#$t1 has the option user choosed	
			beq $t1,0,sair #If $t1 equals to 0, go to sair
			beq $t1,1,verSaldo
			beq $t1,2,depositar
			beq $t1,3,sacar
			imprima("\n\n<<<<< Escolha uma op�ao v�lida! >>>>>")
			j repetition
		sair:
			imprima("\n<<<<< Finalizado com sucesso! >>>>>\n")
			finalize
		verSaldo:
			imprima("\nSaldo: R$")
			mostre$f12
			j repetition
		depositar:
			imprima("\nValor a depositar: R$")
			leiaFloat
			c.le.s $f0,$f1 #Se o valor a depositar � menor ou igual a zero
			bc1t valorInvalido
			add.s $f12,$f0,$f12
			imprima("\nNovo saldo: R$")
			mostre$f12
			j repetition
		sacar:
			c.eq.s $f12,$f1 #Se o saldo for zero
			bc1t saldoInsuficiente
			imprima("\nValor a sacar: R$")
			leiaFloat
			c.le.s $f0,$f1 #Se o valor a ser sacado � menor ou igual a zero
			bc1t valorInvalido
			c.lt.s $f12,$f0 #Se o valor a ser sacado � maior que o valor real que o usu�rio possui
			bc1t saldoInsuficiente
			sub.s $f12,$f12,$f0
			imprima("\nNovo saldo: R$")
			mostre$f12
			j repetition
		saldoInicialInvalido:
			imprima("\n\n<<<<< Saldo inicial inv�lido! >>>>>\n\n")
			j main
		valorInvalido:
			imprima("\n\n<<<<< Valor inv�lido >>>>>")
			j repetition
		saldoInsuficiente:
			imprima("\n\n<<<<< Saldo insuficiente >>>>>")
			j repetition