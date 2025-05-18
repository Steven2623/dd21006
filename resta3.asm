section .data
    msg db "Resultado: ", 0xA  ; mensaje con salto de línea
    msglen equ $ - msg

    newline db 0xA

section .bss
    resultado resb 6           ; buffer para cadena ASCII

section .text
    global _start

_start:
    ; Cargar valores (16 bits)
    mov ax, 30
    sub ax, 10
    sub ax, 5                  ; AX = 15

    ; Convertir a número decimal ASCII
    movzx eax, ax             ; copiar AX a EAX (32 bits)
    mov edi, resultado        ; puntero a buffer
    call int_to_ascii

    ; Imprimir "Resultado: "
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, msglen
    int 0x80

    ; Imprimir número convertido
    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, eax              ; longitud regresada por int_to_ascii está en EAX
    int 0x80

    ; Nueva línea
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Salir del programa
    mov eax, 1
    xor ebx, ebx
    int 0x80

; -----------------------------------------------------
; Convierte número en EAX a cadena ASCII en EDI
; Devuelve longitud en EAX
int_to_ascii:
    mov ecx, 0
    mov ebx, 10
    mov esi, edi              ; guardar inicio del buffer

.reverse:
    xor edx, edx
    div ebx                   ; divide EAX por 10
    add dl, '0'               ; convierte dígito a ASCII
    push dx
    inc ecx
    test eax, eax
    jnz .reverse

.print_digits:
    pop dx
    mov [edi], dl
    inc edi
    loop .print_digits

    ; Calcular longitud final
    mov eax, edi
    sub eax, esi              ; EAX = longitud = EDI - ESI
    ret

