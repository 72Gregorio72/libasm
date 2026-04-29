section .text
	global ft_strcmp

ft_strcmp:
	xor rax, rax
	xor rcx, rcx
	jmp .loop

.loop:
	mov al, [rdi + rcx]
	mov dl, [rsi + rcx]

	cmp al, dl
	jne .diff

	cmp al, 0
	je .equal

	inc rcx
	jmp .loop

.equal:
	xor rax, rax
	ret

.diff:
    setg al         ; set AL = 1 se AL > DL, altrimenti 0
    setl dl         ; set DL = 1 se AL < DL, altrimenti 0
    movzx rax, al
    movzx rdx, dl
    sub rax, rdx
    ret