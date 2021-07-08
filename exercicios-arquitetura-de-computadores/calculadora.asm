#Programa que simula uma calculadora (apenas as 4 operacoes aritmeticas basicas).
#Nao permite divisao por zero.
.data #Area para declaracao de variaveis e funcoes que serao utilizadas na rotina principal do programa.
	ZERO: .float 0.0 #Variavel de ponto flutuante para auxiliar em algumas operacoes aritmeticas.
	.macro imprima(%str) #Funcao que imprime uma string passada como argumento.
		.data
			msg: .asciiz %str
		.text
			li $v0,4 #Mostrar string.
			la $a0,msg #Passando seu endereco.
			syscall #Dizendo ao sistema para executar o comando anterior passado.
	.end_macro
	.macro leiaFloat #Funcao que le um numero de ponto flutuante do terminal. Esse valor fica armazenado no coprocessador $f0.
		li $v0,6
		syscall
	.end_macro
	.macro leiaInteiro #Funcao que le um numero inteiro do terminal. Esse valor fica armazenado no registrador $v0. 
		li $v0,5
		syscall
	.end_macro
	.macro mostre$f12 #Funcao que imprime o dado contido no registrador $f12 (Ele sera usado para conter os resultados das operacoes aritmeticas da calculadora).
		li $v0,2 #Ao chamar $v0 com o codigo 2,a operacao acima eh efetuada.
		syscall
	.end_macro 
	.macro finalize #Funcao para encerrar a rotina principal do programa.
		li $v0,10
		syscall
	.end_macro
.text #Area que contera o codigo do programa a ser montado pelo assembler e executado. Manipula as variaveis e funcoes da area '.data'.
	.globl main #Diretriz global (Area principal do programa).
	main: #Declarando seu escopo.
		lwc1 $f3,ZERO #Carregando 0.0 para o coprocessador $f3 (apenas para nos auxiliar em algumas operacoes).
		repetition: #Escopo que sera executado repetidas vezes ate que o usuario decida sair do programa.
			imprima("\nN1: ")
			leiaFloat #Pegando o primeiro numero a ser usado em alguma operacao,do usuario.
			add.s $f1,$f0,$f3 #Passando esse numero para o coprocessador $f1.
			imprima("N2: ")
			leiaFloat #Pegando o segundo numero a ser usado em alguma operacao,do usuario.
			add.s $f2,$f0,$f3 #Passando esse numero para o coprocessador $f2.
			imprima("\n----------Operaçoes Matematicas----------\n1->(Somar) 2->(Subtrair) 3->(Multiplicar) 4->(Dividir) 0->(Sair)\nOpcao: ")
			leiaInteiro #Pegando a operacao que o usuario deseja ser realizada pelo programa sobre os numeros colidos anteriormente.
			beq $v0,0,sair #Se escolher 0,o programa ira para o escopo de rotulo 'sair'.
			beq $v0,1,somar #Se escolher 1,o programa ira para o escopo de rotulo 'somar'.
			beq $v0,2,subtrair #Se escolher 2,o programa ira para o escopo de rotulo 'subtrair'.
			beq $v0,3,multiplicar #Se escolher 3,o programa ira para o escopo de rotulo 'multiplicar'.
			beq $v0,4,dividir #Se escolher 4,o programa ira para o escopo de rotulo 'dividir'.
			imprima("\n\n##### Escolha uma opcao valida #####\n") #Se nenhuma das opcoes acima forem escolhidas pelo usuario, uma mensagem de erro eh mostrada.
			j repetition #Entao repetimos o escopo 'repetition' novamente.
		sair: #Finaliza o programa.
			imprima("\n\n##### Rotina Finalizada #####\n")
			finalize
		somar: #Realiza a operacao de soma com os numeros digitados pelo usuario.
			add.s $f12,$f1,$f2 #$f12 recebe $f1+$f2 (seus valores).
			imprima("\nResultado: ")
			mostre$f12
			imprima("\n")
			j repetition #Volta para o escopo 'repetition' novamente. 
		subtrair: #Realiza a operacao de subtracao com os numeros digitados pelo usuario.
			sub.s $f12,$f1,$f2 #$f12 recebe $f1-$f2 (seus valores).
			imprima("\nResultado: ")
			mostre$f12
			imprima("\n")
			j repetition
		multiplicar: #Realiza a operacao de multiplicacao com os numeros digitados pelo usuario.
			mul.s $f12,$f1,$f2 #$f12 recebe $f1*$f2 (seus valores).
			imprima("\nResultado: ")
			mostre$f12
			imprima("\n")
			j repetition
		dividir: #Realiza a operacao de divisao com os numeros digitados pelo usuario.
			c.eq.s $f2,$f3 #Se o coprocessador $f2 tem o valor zero, bclt (na linha abaixo) sera verdade e a rotina do programa ira para o escopo 'divisaoPorZero'.
			bc1t divisaoPorZero
			div.s $f12,$f1,$f2 #Se $f2 (que tera o numero divisor) nao eh zero,podemos realizar a operaçao. $f12 recebe $f1/$f2 (seus valores).
			imprima("\nResultado: ")
			mostre$f12
			imprima("\n")
			j repetition
		divisaoPorZero: #Se coprocessador $f2 tem o valor zero,esse escopo sera executado pelo programa.
			imprima("\n##### Impossível dividir por zero #####\n")
			j repetition 
