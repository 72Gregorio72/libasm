section .text
	global ft_write
	global error_call
	extern __errno_location

ft_write:
	mov rax, 1
	syscall
	cmp rax, 0
	jl error_call
	ret 

error_call:
	neg rax
	mov rdi, rax
	push rdi
	call __errno_location
	pop rdi
	mov [rax], edi
	mov rax, -1
	ret