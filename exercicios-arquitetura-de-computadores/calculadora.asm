#Programa que simula uma calculadora (apenas as 4 operaçoes aritméticas básicas).
#Nao permite divisao por zero.
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
		lwc1 $f3,ZERO	
		repetition:	
			imprima("\nN1: ")
			leiaFloat
			add.s $f1,$f0,$f3	
			imprima("N2: ")
			leiaFloat
			add.s $f2,$f0,$f3
			imprima("\n----------Operaçoes Matemáticas----------\n1->(Somar) 2->(Subtrair) 3->(Multiplicar) 4->(Dividir) 0->(Sair)\nOpçao: ")
			leiaInteiro
			beq $v0,0,sair
			beq $v0,1,somar
			beq $v0,2,subtrair
			beq $v0,3,multiplicar
			beq $v0,4,dividir
			imprima("\n\n##### Escolha uma opcao válida #####\n")
			j repetition
		sair:
			imprima("\n\n##### Rotina Finalizada #####\n")
			finalize
		somar:
			add.s $f12,$f1,$f2
			imprima("\nResultado: ")
			mostre$f12
			imprima("\n")
			j repetition
		subtrair:
			sub.s $f12,$f1,$f2
			imprima("\nResultado: ")
			mostre$f12
			imprima("\n")
			j repetition
		multiplicar:
			mul.s $f12,$f1,$f2
			imprima("\nResultado: ")
			mostre$f12
			imprima("\n")
			j repetition
		dividir:
			c.eq.s $f2,$f3 #$f3 has value 0.0
			bc1t divisaoPorZero
			div.s $f12,$f1,$f2
			imprima("\nResultado: ")
			mostre$f12
			imprima("\n")
			j repetition
		divisaoPorZero:
			imprima("\n##### Impossível dividir por zero #####\n")
			j repetition