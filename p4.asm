;Name: Dominic McElroy 
;Date: 2/22/2025
;Purpose: Swapping between two characters

section .data
    prompt db "Enter a two-character string: ", 0  
    prompt_space db " ", 0                          
    newline db 0xA, 0                               
    result_msg db "The answer is: ", 0          

section .bss
    string resb 3                          

section .text
    global _start

_start:
    ; Print prompt to ask for input
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 28         
    int 0x80

    ; Proper Spacings
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt_space
    mov edx, 1
    int 0x80

    ; Read 2 Characters
    mov eax, 3
    mov ebx, 0
    mov ecx, string  
    mov edx, 3       
    int 0x80

    ; Remove Newlines
    mov al, [string + 2] 
    cmp al, 0xA      
    je clear_newline
    jmp done
clear_newline:
    mov byte [string + 2], 0  

done:

    ; Swap 
    mov al, [string]    
    mov bl, [string + 1]
    mov [string], bl 
    mov [string + 1], al 

    ; Print result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 15
    int 0x80

    ; Print the modified string
    mov eax, 4
    mov ebx, 1
    mov ecx, string
    mov edx, 2        
    int 0x80

    ; Print newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80
