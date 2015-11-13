extern mGdt

global start_os

section .text

bits 64
start_os: ;OS entrypoint in rdi
    ;jmp start_os
    lgdt [mGdt]
    
   ; jump to 32 bit segment
    mov rax, 08h
    shl rax, 32
    mov rcx, compatibility_mode
    or rax, rcx
    push rax
    retf
    
bits 32
compatibility_mode:
    mov bx, 018h
    mov ds, bx
    mov es, bx
    mov fs, bx
    mov gs, bx
    mov ss, bx

    ; Disable paging
    mov     eax, cr0
    btc     eax, 31
    mov     cr0, eax
    ;
    ; Clear EFER.LME
    ;
    mov     ecx, 0C0000080h
    rdmsr
    btc     eax, 8
    wrmsr
    
    jmp edi

