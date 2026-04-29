section .text
	global ft_atoi_base

ft_atoi_base:
	xor rcx, rcx

.check_base:
	mov r8b, byte[rsi + rcx]

	cmp r8b, 0
	je .base_checked

	inc rcx
	mov rdx, rcx
	dec rcx
	jmp .check_duplicate

.duplicate_checked:
	cmp r8b, 32
	je .end_err

	cmp r8b, 43
	je .end_err

	cmp r8b, 45
	je .end_err

	inc rcx
	jmp .check_base

.base_checked:
	cmp rcx, 2
	jl .end_err

.skip_spaces:
	xor rcx, rcx
	xor r8b, r8b
	xor rdx, rdx
	mov r8b, byte[rdi, rcx]

	inc rcx
	cmp r8b, 32
	je .skip_spaces

	cmp r8b, 43
	je .skip_spaces

	cmp r8b, 45
	je .increment_skip

	mov rax, rdx
	ret

.increment_skip:
	inc rdx
	jmp .skip_spaces

.end_err:
	xor rax, rax
	ret

.check_duplicate:
	mov r9b, byte[rsi + rdx]

	cmp r9b, r8b
	je .end_err

	cmp r9b, 0
	je .duplicate_checked

	inc rdx
	jmp .check_duplicate