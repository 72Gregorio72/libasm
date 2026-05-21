section .text
    global ft_list_remove_if

ft_list_remove_if:
    push rbp
    mov rbp, rsp

    push r12
    push r13
    push r14
    push r15
    push rbx

    cmp rdi, 0
    je .end
    mov rax, [rdi]
    cmp rax, 0
    je .end

    mov r12, rdi
    mov r13, rsi
    mov r14, rdx
    mov r15, rcx

.I_loop:
    mov rbx, [r12]
    cmp rbx, 0
    je .end

    mov rdi, [rbx]
    mov rsi, r13
    call r14

    cmp eax, 0
    jne .next_node

    mov rcx, [rbx + 8]
    mov [r12], rcx

    mov rdi, rbx
    call r15

    jmp .I_loop

.next_node:
    lea r12, [rbx + 8]
    jmp .I_loop

.end:
    pop rbx
    pop r15
    pop r14
    pop r13
    pop r12
    pop rbp
    ret