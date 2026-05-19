section .text
    global ft_list_sort

ft_list_sort:
    push rbp
    mov rbp, rsp

    push r12
    push r13
    push r14
    push r15

    cmp rdi, 0
    je .end
    
    mov r12, [rdi]
    cmp r12, 0
    je .end

    mov r13, rsi

.I_loop:
    mov r14, 0
    mov r10, r12

.J_loop:
    mov r11, [r10 + 8]
    cmp r11, 0
    je .check_loop

    mov rdi, [r10]
    mov rsi, [r11]

    push r10
    push r11
    call r13
    pop r11
    pop r10

    cmp eax, 0
    jle .no_swap

    mov rax, [r10]
    mov rdx, [r11]
    mov [r10], rdx
    mov [r11], rax
    mov r14, 1

.no_swap:
    mov r10, r11
    jmp .J_loop

.check_loop:
    cmp r14, 1
    je .I_loop 

.end:
    pop r15
    pop r14
    pop r13
    pop r12
    pop rbp
    ret