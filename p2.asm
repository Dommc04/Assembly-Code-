; Name: Dominic McElroy 
; Date: 2/22/2025
; Purpose: Multiplication between two single digit numbers 

section .data
    prompt1 db "Please enter a single digit number: ", 0
    prompt2 db "Please enter another single digit number: ", 0
    prompt2_space db " ", 0  ; Proper Spacing for input 
    result_msg db "The answer is: ", 0
    newline db 0xA, 0

section .bss
    num1 resb 2  
    num2 resb 2  
    result resb 1  

section .text
    global _start

_start:
    ; Print Prompt 1
    mov eax, 4        
    mov ebx, 1         
    mov ecx, prompt1 
    mov edx, 36     
    int 0x80       

    ; Read first number from the user
    mov eax, 3      
    mov ebx, 0       
    mov ecx, num1     
    mov edx, 2          
    int 0x80            

    ; Remove Newline after input
    mov al, [num1]       
    cmp al, 0xA         
    je clear_newline1   
    jmp done1          
clear_newline1:
    mov byte [num1], 0   
done1:

    ; Same line Prompt 2
    mov eax, 4       
    mov ebx, 1        
    mov ecx, prompt2     
    mov edx, 41        
    int 0x80             

    ; Proper Spacings
    mov eax, 4           
    mov ebx, 1           
    mov ecx, prompt2_space 
    mov edx, 1            
    int 0x80              

    ; Read second number from the user
    mov eax, 3        
    mov ebx, 0            
    mov ecx, num2       
    mov edx, 2            
    int 0x80             

    ; Remove Newline after input 
    mov al, [num2]        
    cmp al, 0xA           
    je clear_newline2     
    jmp done2              
clear_newline2:
    mov byte [num2], 0    
done2:

    ; Convert First Num to int 
    mov al, [num1]       
    sub al, '0'          
    mov bl, al             

    ; Convert Second Num to int 
    mov al, [num2]    
    sub al, '0'     
    mov cl, al            

    ; Multiply 
    mul cl                
    
    ; Convert result to ASCII
    add al, '0'           
    mov [result], al      

    ; Print Result
    mov eax, 4        
    mov ebx, 1           
    mov ecx, result_msg 
    mov edx, 15          
    int 0x80             

    ; Print result of multiplication
    mov eax, 4        
    mov ebx, 1          
    mov ecx, result    
    mov edx, 1         
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
