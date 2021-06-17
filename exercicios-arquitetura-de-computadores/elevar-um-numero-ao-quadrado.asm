#Programa que calcula o quadrado de um numero
.data
	msgPedirNumero: .asciiz "Digite um n�mero (inteiro ou real): "
	msgMostrarResultado: .asciiz "Elevando este numero ao quadrado tem-se: "
	ZERO: .float 0.0
.text 
	#Mostrando msgPedirNumero na tela do usu�rio
	li $v0,4
	la $a0,msgPedirNumero
	syscall
	#Lendo o numero digitado pelo usuario (ele ficar� armazenado em $f0,por defini�ao)
	li $v0,6
	syscall
	#Realizando a operacao de potencia por 2 com o valor digitado e guardando o resultado no registrador $f1 
	mul.s $f1,$f0,$f0 #mul.s permite multiplica�ao de valores com ponto flutuante
	#Passando o resultado contido em $f1 para $f12 (que � usado,por defini�ao, para se imprimir n�meros de ponto flutuante no console) 
	lwc1 $f2,ZERO #Esse comando � apenas para permitir o uso da intru�ao add.s (que requer 3 argumentos)
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
	