section .text
	global ft_list_push_front
	extern malloc

ft_list_push_front:
	xor rax, rax

	push rdi
	push rsi

	sub rsp, 8

	mov rdi, 16
	call malloc

	add rsp, 8

	pop rsi
	pop rdi
	mov [rax], rsi
	
	mov rcx, [rdi]
	mov [rax + 8], rcx
	mov [rdi], rax
	ret