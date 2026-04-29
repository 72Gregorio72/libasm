section .text
	global ft_strdup
	extern ft_strcpy
	extern malloc

ft_strdup:
	xor rcx, rcx

.loop_strlen:
	cmp byte [rdi + rcx], 0
	je .allocate_memory
	inc rcx
	jmp .loop_strlen

.allocate_memory:
	inc rcx
	push rdi
	push rcx
	sub rsp, 8

	mov rdi, rcx
	call malloc

	add rsp, 8
	pop rcx
	pop rdi
	mov rsi, rdi
	xor rdx, rdx

.loop_strcpy:
	mov r8b, byte [rsi + rdx]
	mov byte [rax + rdx], r8b
	cmp r8b, 0
	je .end_strcpy
	inc rdx
	jmp .loop_strcpy

.end_strcpy:
	ret