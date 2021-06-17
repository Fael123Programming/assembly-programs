#Programa que calcula o quadrado de um numero
.data
	msgPedirNumero: .asciiz "Digite um número (inteiro ou real): "
	msgMostrarResultado: .asciiz "Elevando este numero ao quadrado tem-se: "
	ZERO: .float 0.0
.text 
	#Mostrando msgPedirNumero na tela do usuário
	li $v0,4
	la $a0,msgPedirNumero
	syscall
	#Lendo o numero digitado pelo usuario (ele ficará armazenado em $f0,por definiçao)
	li $v0,6
	syscall
	#Realizando a operacao de potencia por 2 com o valor digitado e guardando o resultado no registrador $f1 
	mul.s $f1,$f0,$f0 #mul.s permite multiplicaçao de valores com ponto flutuante
	#Passando o resultado contido em $f1 para $f12 (que é usado,por definiçao, para se imprimir números de ponto flutuante no console) 
	lwc1 $f2,ZERO #Esse comando é apenas para permitir o uso da intruçao add.s (que requer 3 argumentos)
	add.s $f12,$f2,$f1 #Assim, teremos $f12=0.0+resultadoPotencia
	#Mostrando msgMostrarResultado na tela do usuario
	li $v0,4
	la $a0,msgMostrarResultado
	syscall
	#Mostrando o valor contido em $f12
	li $v0,2
	syscall
	#Finalizando o programa
	li $v0,10
	syscall
	