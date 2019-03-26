	.section .data
msg:	.asciz "Hello World\n\0"
name:	.asciz "Logan Warner\n\0"
quote:	.asciz "With power comes great responsibility. Good luck!\n\0"
	
	.section .text
	.global main

main:
	# save Caller registers
	push %eax
	push %ecx
	push %edx

	# pass params
#	push $12
	push $msg

	call _print_c_str

	#clean up stack (remove 1 param from stack)
#	add $4, %esp
	
	push $name
	call _print_c_str

	#clean up stack (remove 1 param from stack)
#	add $4, %esp

	push $quote
	call _print_c_str

	add $12, %esp
	
	#restore Caller registers
	pop %eax
	pop %ecx
	pop %edx

	movl $1, %eax
	movl $0, %ebx

	int $0x80
