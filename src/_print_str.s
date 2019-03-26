# File: _print_str.s
#==============================
# Contains:
# function _print_str
#
# 	@param char* str	pointer to string
# 	@param int size		size of string
	
	.section .text
	.global _print_str
	#extern _print_str
	
# function _print_str
# given a string and size it will all the write syscall and output it	
# @param dword addr string
# @param dword int size
_print_str:
	#save base pointer and set up function frame
	push %ebp
	movl %esp, %ebp

	#save ebx (ebi and esi not used in function)
	push %ebx

	# load registers for write syscall
	movl $4, %eax
	movl $1, %ebx
	movl 8(%ebp), %ecx	# load string address
	movl 12(%ebp), %edx	# load int size

	# call write syscall
	int $0x80

	#restore ebx (ebi and esi not used)
	pop %ebx

	#set return value
	movl $0, %eax

	pop %ebp
	ret
