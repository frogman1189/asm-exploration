	#Assembly File
	#
	# Contains function __print_str
	#
	# @param char* str	pointer to string
	# @param int size	size of string
	
	.section .text
	.global main
	.global _print_str
	# .global __print_str	
	# extern __print_str	

main:
	push %ebp
	movl %esp, %ebp

	sub $4, %esp

	#movl $65, 0(%esp)
	#movl $66, 1(%esp)
	#movl $67, 2(%esp)
	#movl $10, 3(%esp)
	movl $0x0a434241, -4(%ebp)
	
	push $4
	push -4(%ebp)

	call _print_str

	add $8, %esp
		
	movl $1, %eax
	movl $0, %ebx

	int $0x80


_print_str:
	#save base pointer and set up function frame
	push %ebp
	movl %esp, %ebp

	#save 
	
	movl 12(%ebp), %edx
	lea 8(%ebp), %ecx
	movl $1, %ebx
	movl $4, %eax

	int $0x80

	movl $0, %eax
	pop %ebp
	ret
