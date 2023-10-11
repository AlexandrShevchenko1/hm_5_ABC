.global get_size, get_input, get_sum, finish_with_code_0

.macro print_prompt (%prompt)	# generic prompt printer
.data
	prompt: .asciz %prompt
.text
	la a0, prompt
	li a7, 4
	ecall
.end_macro


.macro get_int
.text
	li a7 5
	ecall
.end_macro


.macro print_int (%x)
.text
	mv a0 %x
	li a7 1
	ecall
.end_macro


.text
	get_size:
		addi sp sp -4
		sw ra (sp) # для маштабируемости кода 
		
		numberOfElements:		
		print_prompt("Number of Elements in your array = " )
		get_int
		bge a0 a1 numberOfElements
		blez a0 numberOfElements
		
		lw ra (sp)
		addi sp sp 4
		ret



	get_input: 
		addi sp sp -4
		sw ra (sp)
		
		inputElements:
		print_prompt("Number = ")
	       	get_int
	        sw a0 (a1)
	        addi a1 a1 4 
	        addi a2 a2 1
	        blt a2 s0 inputElements
		
		lw ra (sp)
		addi sp sp 4
		ret
	
	
	get_sum:
		addi sp sp -4
		sw ra (sp)
		
		sum:	
			lw t0 (a0)
		        blez t0 else1
		        sub t6 a4 t0 
		        bgt a3 t6 stop
		        beq x0 x0 exit1
		else1:	
			sub t6 a5 t0
			bgt t6 a3 stop
		exit1:  
		        add a3 a3 t0
		        addi a0 a0 4 
		        addi a1 a1 1
		        blt a1 s0 sum
		stop:
			print_prompt("Sum = ")
			print_int(a3)
	
		lw ra (sp)
		addi sp sp 4
		ret
			
			
			
	finish_with_code_0:
		li a7 10
		ecall