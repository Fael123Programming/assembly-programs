#Programa que calcula a media aritmetica de 4 notas (que podem assumir qualquer valor de 0 a 10)
.data	
	#Funcao para imprimir strings no terminal/console
	.macro print(%str)
		.data
			msg: .asciiz %str
		.text 
			li $v0,4
			la $a0,msg
			syscall
	.end_macro
	#Funcao para ler um n�mero de ponto flutuante (por defini�ao,ele ficar� contido em $f0)
	.macro readNumber 
		li $v0,6
		syscall
	.end_macro 
	#Funcao para finalizar o programa
	.macro exit
		li $v0,10
		syscall
	.end_macro
	ZERO: .float 0.0 #Vari�veis na mem�ria RAM para nos auxiliar nas opera�oes a serem realizadas  
	FOUR: .float 4.0 
.text 
.globl main
	main:
		#Imprimindo uma mensagem ao usu�rio
		print("<<<<< Calculadora de m�dias >>>>>\n")
		print("Nota 1 (0-10):")
		readNumber #Por defini�ao,n�meros de ponto flutuante lidos ficam armazenados em $f0
		lwc1 $f5,ZERO #$f5 conter� o valor 0.0 (apenas para nos auxiliar em algumas opera�oes)
		#Passando o valor da nota 1 digitado pelo usu�rio para um outro registrador
		add.s $f1,$f5,$f0 #$f1=0.0+valorNota1
		print("Nota 2 (0-10):")
		readNumber
		add.s $f1,$f0,$f1 #$f1=valorNota2+$f1 (incrementando $f1 com os valores das notas)
		print("Nota 3 (0-10):")
		readNumber
		add.s $f1,$f0,$f1 #$f1=valorNota3+$f1 (incrementando $f1 com os valores das notas)
		print("Nota 4 (0-10):")
		readNumber
		add.s $f12,$f0,$f1 #$f12=valorNota4+$f1 ($f1 cont�m os 3 primeiros valores de notas)
		#Assim,$f12 ter� os 4 valores das notas j� somados
		print("\nSoma das notas:")
		#Imprimindo o resultado da soma das 4 notas
		li $v0,2
		syscall
		#Calculando a m�dia aritm�tica das 4 notas
		lwc1 $f5,FOUR 
		div.s $f12,$f12,$f5 #$f12=$f12/4.0
		print("\nM�dia aritm�tica das 4 notas:")
		#Imprimindo a m�dia das notas
		li $v0,2
		syscall
		exit