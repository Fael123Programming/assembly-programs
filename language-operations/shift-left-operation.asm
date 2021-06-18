.text 
	li $t0,100
	#$s0 will contain 100*2^2=4 
	sll $s0,$t0,2
	#We're moving the bits of 1100100 (which is 10 though in binary notation) 2 times leftward
	#So we'll have finally, 110010000 (which is 400)