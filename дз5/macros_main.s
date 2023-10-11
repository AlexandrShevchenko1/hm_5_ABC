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


.macro print_arr (%ptr, %arr_size)	# arr printer
.data
	array_elements: .asciz "\nElements of the array:\n"
	new_line: .asciz "\n"
.text
	la a0 array_elements
	li a7 4
	ecall
	li t0 1
	loop4:
		lw a0 (%ptr)
		li a7 1
		ecall
		la a0 new_line
		li a7 4
		ecall
		addi %ptr %ptr 4
		addi t0 t0 1
		ble t0 %arr_size loop4
.end_macro


.macro get_size (%ptr)
.text
	numberOfElements:		
	print_prompt("Number of Elements in your array = " )
	get_int
	bge a0 %ptr numberOfElements
	blez a0 numberOfElements
.end_macro



.macro get_input (%ptr, %cnt)
.text	
	inputElements:
	print_prompt("Number = ")
       	get_int
        sw a0 (%ptr)
        addi %ptr %ptr 4 
        addi %cnt %cnt 1
        blt %cnt s0 inputElements
.end_macro
	
	
.macro	get_sum (%ptr, %cnt, %sum, %max, %min)
.text
	sum:	
		lw t0 (%ptr)
	        blez t0 else1
	        sub t6 %max t0 
	        bgt %sum t6 stop
	        beq x0 x0 exit1
	else1:	
		sub t6 %min t0
		bgt t6 %sum stop
	exit1:  
	        add %sum %sum t0
	        addi %ptr %ptr 4 
	        addi %cnt %cnt 1
	        blt %cnt s0 sum
	stop:
		print_prompt("Sum = ")
		print_int(%sum)
.end_macro
			

.macro	finish_with_code_0
.text
	li a7 10
	ecall
.end_macro