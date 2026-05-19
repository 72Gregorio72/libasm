section .text
	global ft_list_size

ft_list_size:
	xor rax, rax
	xor rcx, rcx
	push rdi

.loop_list:
	test rdi, rdi
	jz .end_list

	inc rcx
	mov rdi, [rdi + 8]
	jmp .loop_list

.end_list:
	pop rdi
	mov rax, rcx
	ret