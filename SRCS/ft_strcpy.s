section .text
	global ft_strcpy

ft_strcpy:
	xor rax, rax
	jmp .loop

.loop:
	cmp byte [rsi + rax], 0
	je .end_program
	mov cl, byte [rsi + rax]
	mov byte [rdi + rax], cl
	inc rax
	jmp .loop

.end_program:
	mov cl, byte [rsi + rax]
	mov byte [rdi + rax], cl
	mov rax, rdi
	ret