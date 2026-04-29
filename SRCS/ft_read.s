section .text
	global ft_read
	extern __errno_location
	extern error_call

ft_read:
	mov rax, 0
	syscall
	cmp rax, 0
	jl error_call
	ret