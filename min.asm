        .global main

        .text
main:
        movq    %rsp, %rbp              #for correct debugging, this is called by C library's startup code
        xor     %rax, %rax
        xor     %rbx, %rbx
        xor     %rdx, %rdx
        addb    $10, %bl
        addb    $100, %al
        # push 5 numeri nello stack (110,15,30,200,5)
        addb    %bl,%al
        push    %rax
        
        movb    $15, %dl
        push    %rdx
        movb    $30, %dl
        push    %rdx
        movb    $200, %dl
        push    %rdx
        movb    $54, %dl
        push    %rdx
        
        # r8 contine il valore minimo
        pop     %r8
        # inizializzare registro contatore a 5 - 1 (numero elementi array - 1)
        movq    $4, %rcx
loop1:
        pop     %rdx
        # r8 - rdx
        cmp     %rdx, %r8
        # se il risultato è negativo allora rdx > r8, quindi lo saltiamo
        js     no_min
        # se non è saltato, allora assegna r8 = rdx
        mov %rdx, %r8
no_min: 
        #sottrarre 1 al registro contatore e ripeti loop se diverso da 0
        sub     $1, %rcx
        jnz     loop1
        ret
        