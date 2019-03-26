# File: _print_c_str.s
#==============================
# Contains:
# function _print_str
#
# 	@param char* str	pointer to string
	
	.section .text
	.global _print_c_str
	
# function _print_c_str
# given a null terminated string print it
# @param dword addr string
_print_c_str:
	#save base pointer and set up function frame
	push %ebp
	movl %esp, %ebp

	#save Callee registers
	push %ebx
	#push %esi
	#push %edi

	# Find str length
	# load string location into %ecx
	movl 8(%ebp), %ecx
	# use %edx as counter and set to 0
	and $0, %edx
str_length_loop:
	mov (%ecx,%edx,1), %bl
	inc %edx
	and %bl, %bl
	jne str_length_loop

	#otherwise

	# load registers for write syscall
	movl $4, %eax
	movl $1, %ebx
	#movl 8(%ebp), %ecx	# load string address
	#movl %edx, %edx

	# call write syscall
	int $0x80

	#restore ebx (edi and esi not used)
	pop %ebx
	#pop %esi
	#pop %edi
	
	#set return value
	movl $0, %eax

	pop %ebp
	ret
