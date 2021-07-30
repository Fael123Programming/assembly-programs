.include "first_part.asm" #including that file here

.text
	la $t0,music #load vector music from first_part file into register $t0
	lb $t1,($t0) #load byte from $t0 into $t1
	addi $t2,$zero,50 #first instrument to play notes
	
	repetition:
		li $v0,31 #prepare system to output sounds
		add $a0,$zero,$t1 #parameters to the sound
		addi $a1,$zero,5000 #period in milliseconds
		add $a2,$zero,$t2 #instrument	
		addi $a3,$zero,100 #volume
		syscall
		li $v0,32 #sleep for a while
		addi $a0,$zero,200 #period in milliseconds to sleep
		syscall
		li $v0,42 #prepare to generate a number
		li $a1,120 #number until 120
		syscall
		move $t2,$a2 #another random instrument
		add $t0,$t0,1 #next note
		lb $t1,($t0)
		bne $t1,-1,repetition