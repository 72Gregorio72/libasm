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

	mov r10, rcx
	mov rdx, 1
	xor rcx, rcx
	xor r8b, r8b

.skip_spaces:
    mov r8b, byte[rdi + rcx]

    cmp r8b, 32
    je .skip_next

    cmp r8b, 43
    je .skip_next

    cmp r8b, 45
    je .negate_flag

	mov r9, rdx

.parse_number:
	xor rax, rax

.parse_loop:
	mov r8b, byte[rdi + rcx]
	cmp r8b, 0
	je .parse_done

	xor r11, r11

.find_in_base:
	mov r12b, byte[rsi + r11]
	cmp r12b, 0
	je .char_not_found

	cmp r8b, r12b
	je .char_found

	inc r11
	jmp .find_in_base

.char_found:
	imul rax, r10
	add rax, r11

	inc rcx
	jmp .parse_loop

.char_not_found:
	jmp .parse_done

.parse_done:
	imul rax, r9
	ret

.skip_next:
    inc rcx
    jmp .skip_spaces

.negate_flag:
    neg rdx
    inc rcx
    jmp .skip_spaces

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