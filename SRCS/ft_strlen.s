section .text
	global ft_strlen

ft_strlen:
	xor rax, rax
	jmp .loop


.loop:
	cmp byte [rdi + rax], 0
	je .end_program
	inc rax
	jmp .loop

.end_program:
	ret