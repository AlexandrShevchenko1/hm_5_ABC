.include "macros_main.s"
.global main

.data
prompt01: .asciz "Number of Elements in your array = " 
prompt02: .asciz "Number = "
prompt03: .asciz "Sum = "
.align 2
array: .space 40
main:
.text
# CODE FOR FUNCTIONS:
	li a1 11 # upper not included bound 
	jal get_size
	mv s0 a0 # s0 = number of elements
	
	la a1 array
	li a2 0		# counter
	jal get_input
        
        li a4 2147483647	# maximum 32 bit integer
	li a5 -2147483648	# minimum 32 bit integer
	li a3 0		# sum
	la a0 array
	li a1 0		# counter
	jal get_sum
	
	la a1 array
	print_arr(a1, s0)
	
	jal finish_with_code_0
	
	
	
# MACROS CODE:
	#li a1 11
	#get_size(a1)
	#mv s0 a0
	
	#la a1 array
	#li a2 0
	#get_input(a1, a2)
	
	#li a4 2147483647	
	#li a5 -2147483648
	#li a3 0
	#la a0 array
	#li a1 0	
	#get_sum(a0, a1, a3, a4, a5)
	
	#la a1 array
	#print_arr(a1, s0)
	
#	finish_with_code_0
