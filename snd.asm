.8086
.model small
.stack 100h
.data

.code
    public winSnd
    public lossSnd
    public welcomeSnd

winSnd proc
    push ax
	push bx
	push cx
	push dx
	push si
	push di
    pushf
    
    mov ax, 4560
    mov cx, 02

    ;mov BX, AX          ; 1) Preserve the note value by storing it in BX.
    ;mov AL, 182         ; 2) Set up the write to the control word register.
    ;out 43h, AL         ; 2) Perform the write.
    ;mov AX, BX          ; 2) Pull back the frequency from BX.
    out 42h, AL         ; 2) Send lower byte of the frequency.
    mov AL, AH          ; 2) Load higher byte of the frequency.
    out 42h, AL         ; 2) Send the higher byte.
    in AL, 61h          ; 3) Read the current keyboard controller status.
    or AL, 03h          ; 3) Turn on 0 and 1 bit, enabling the PC speaker gate and the data transfer.
    out 61h, AL         ; 3) Save the new keyboard controller status.
    mov AH, 86h         ; 4) Load the BIOS WAIT, int15h function AH=86h.
    int 15h             ; 4) Immidiately interrupt. The delay is already in CX:DX.
    in AL, 61h          ; 5) Read the current keyboard controller status.
    and AL, 0FCh        ; 5) Zero 0 and 1 bit, simply disabling the gate.
    out 61h, AL         ; 5) Write the new keyboard controller status.

    mov ax, 3619
    
    ;mov BX, AX      
    ;mov AL, 182       
    ;out 43h, AL        
    ;mov AX, BX         
    out 42h, AL         
    mov AL, AH         
    out 42h, AL        
    in AL, 61h         
    or AL, 03h       
    out 61h, AL         
    mov AH, 86h        
    int 15h            
    in AL, 61h         
    and AL, 0FCh        
    out 61h, AL         

    mov ax, 3043

    ;mov BX, AX          
    ;mov AL, 182       
    ;out 43h, AL         
    ;mov AX, BX          
    out 42h, AL
    mov AL, AH        
    out 42h, AL       
    in AL, 61h         
    or AL, 03h        
    out 61h, AL        
    mov AH, 86h        
    int 15h            
    in AL, 61h          
    and AL, 0FCh        
    out 61h, AL        

    mov ax, 2288
    mov cx, 04

    ;mov BX, AX      
    ;mov AL, 182         
    ;out 43h, AL         
    ;mov AX, BX         
    out 42h, AL        
    mov AL, AH         
    out 42h, AL       
    in AL, 61h          
    or AL, 03h          
    out 61h, AL      
    mov AH, 86h        
    int 15h           
    in AL, 61h         
    and AL, 0FCh        
    out 61h, AL  

    popf
    pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
    ret      
winSnd endp

lossSnd proc
    push ax
	push bx
	push cx
	push dx
	push si
	push di
    pushf

    mov ax, 1809
    mov cx, 03

    ;mov BX, AX       
    ;mov AL, 182      
    ;out 43h, AL       
    ;mov AX, BX         
    out 42h, AL         
    mov AL, AH          
    out 42h, AL        
    in AL, 61h         
    or AL, 03h        
    out 61h, AL       
    mov AH, 86h        
    int 15h             
    in AL, 61h         
    and AL, 0FCh       
    out 61h, AL        

    mov ax, 2031
    
    ;mov BX, AX          
    ;mov AL, 182         
    ;out 43h, AL        
    ;mov AX, BX          
    out 42h, AL         
    mov AL, AH          
    out 42h, AL        
    in AL, 61h          
    or AL, 03h          
    out 61h, AL         
    mov AH, 86h        
    int 15h             
    in AL, 61h          
    and AL, 0FCh        
    out 61h, AL       

    mov ax, 2152
    

    ;mov BX, AX         
    ;mov AL, 182        
    ;out 43h, AL         
    ;mov AX, BX          
    out 42h, AL         
    mov AL, AH          
    out 42h, AL         
    in AL, 61h          
    or AL, 03h          
    out 61h, AL        
    mov AH, 86h         
    int 15h             
    and AL, 0FCh        
    out 61h, AL         

    mov ax, 2280
    mov cx, 05

    ;mov BX, AX      
    ;mov AL, 182             
    ;out 43h, AL        
    ;mov AX, BX          
    out 42h, AL        
    mov AL, AH          
    out 42h, AL         
    in AL, 61h          
    or AL, 03h          
    out 61h, AL         
    mov AH, 86h         
    int 15h             
    in AL, 61h          
    and AL, 0FCh        
    out 61h, AL  

    popf
    pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
    ret                 
lossSnd endp

welcomeSnd proc
    push ax
	push bx
	push cx
	push dx
	push si
	push di
    pushf
    mov ax, 2711    ;A
    mov cx, 04

    ;mov BX, AX          
    ;mov AL, 182         
    ;out 43h, AL         
    ;mov AX, BX          
    out 42h, AL         
    mov AL, AH          
    out 42h, AL         
    in AL, 61h          
    or AL, 03h          
    out 61h, AL         
    mov AH, 86h         
    int 15h             
    in AL, 61h          
    and AL, 0FCh        
    out 61h, AL 

    mov ah, 86h
    mov cx, 01
    mov dx, 86a0h
    int 15h

    mov ax, 2711    ;A
    mov cx, 03

    ;mov BX, AX          
    ;mov AL, 182         
    ;out 43h, AL         
    ;mov AX, BX          
    out 42h, AL         
    mov AL, AH          
    out 42h, AL         
    in AL, 61h          
    or AL, 03h          
    out 61h, AL         
    mov AH, 86h         
    int 15h             
    in AL, 61h          
    and AL, 0FCh        
    out 61h, AL         

    mov ax, 2280    ;C

    ;mov BX, AX          
    ;mov AL, 182         
    ;out 43h, AL         
    ;mov AX, BX          
    out 42h, AL         
    mov AL, AH          
    out 42h, AL         
    in AL, 61h          
    or AL, 03h          
    out 61h, AL         
    mov AH, 86h         
    int 15h             
    in AL, 61h          
    and AL, 0FCh        
    out 61h, AL 

    mov ax, 2415    ;B

    ;mov BX, AX          
    ;mov AL, 182         
    ;out 43h, AL         
    ;mov AX, BX          
    out 42h, AL         
    mov AL, AH          
    out 42h, AL         
    in AL, 61h          
    or AL, 03h          
    out 61h, AL         
    mov AH, 86h         
    int 15h             
    in AL, 61h          
    and AL, 0FCh        
    out 61h, AL  

    mov ax, 2711    ;A

    ;mov BX, AX          
    ;mov AL, 182         
    ;out 43h, AL         
    ;mov AX, BX          
    out 42h, AL         
    mov AL, AH          
    out 42h, AL         
    in AL, 61h          
    or AL, 03h          
    out 61h, AL         
    mov AH, 86h         
    int 15h             
    in AL, 61h          
    and AL, 0FCh        
    out 61h, AL   

    mov ax, 3043    ;G

    ;mov BX, AX          
    ;mov AL, 182         
    ;out 43h, AL         
    ;mov AX, BX          
    out 42h, AL         
    mov AL, AH          
    out 42h, AL         
    in AL, 61h          
    or AL, 03h          
    out 61h, AL         
    mov AH, 86h         
    int 15h             
    in AL, 61h          
    and AL, 0FCh        
    out 61h, AL   

    mov ah, 86h
    mov cx, 02h
    mov dx, 5120h
    int 15h

    mov ax, 2711    ;A
    mov cx, 04

    ;mov BX, AX          
    ;mov AL, 182         
    ;out 43h, AL         
    ;mov AX, BX          
    out 42h, AL         
    mov AL, AH          
    out 42h, AL         
    in AL, 61h          
    or AL, 03h          
    out 61h, AL         
    mov AH, 86h         
    int 15h             
    in AL, 61h          
    and AL, 0FCh        
    out 61h, AL
    
    mov ah, 86h
    mov cx, 05h
    mov dx, 9120h
    int 15h 

    mov ax, 3043    ;G
    mov cx, 03

    ;mov BX, AX          
    ;mov AL, 182         
    ;out 43h, AL         
    ;mov AX, BX          
    out 42h, AL         
    mov AL, AH          
    out 42h, AL         
    in AL, 61h          
    or AL, 03h          
    out 61h, AL         
    mov AH, 86h         
    int 15h             
    in AL, 61h          
    and AL, 0FCh        
    out 61h, AL

    mov ah, 86h
    mov cx, 01
    mov dx, 86a0h
    int 15h   

    mov ax, 3043    ;G
    mov cx, 03

    ;mov BX, AX          
    ;mov AL, 182         
    ;out 43h, AL         
    ;mov AX, BX          
    out 42h, AL         
    mov AL, AH          
    out 42h, AL         
    in AL, 61h          
    or AL, 03h          
    out 61h, AL         
    mov AH, 86h         
    int 15h             
    in AL, 61h          
    and AL, 0FCh        
    out 61h, AL   

    mov ax, 3416    ;F
    mov cx, 03

    ;mov BX, AX          
    ;mov AL, 182         
    ;out 43h, AL         
    ;mov AX, BX          
    out 42h, AL         
    mov AL, AH          
    out 42h, AL         
    in AL, 61h          
    or AL, 03h          
    out 61h, AL         
    mov AH, 86h         
    int 15h             
    in AL, 61h          
    and AL, 0FCh        
    out 61h, AL   

    mov ax, 3619    ;E
    mov cx, 03

    ;mov BX, AX          
    ;mov AL, 182         
    ;out 43h, AL         
    ;mov AX, BX          
    out 42h, AL         
    mov AL, AH          
    out 42h, AL         
    in AL, 61h          
    or AL, 03h          
    out 61h, AL         
    mov AH, 86h         
    int 15h             
    in AL, 61h          
    and AL, 0FCh        
    out 61h, AL   

    mov ax, 3043    ;G
    mov cx, 03

    ;mov BX, AX          
    ;mov AL, 182         
    ;out 43h, AL         
    ;mov AX, BX          
    out 42h, AL         
    mov AL, AH          
    out 42h, AL         
    in AL, 61h          
    or AL, 03h          
    out 61h, AL         
    mov AH, 86h         
    int 15h             
    in AL, 61h          
    and AL, 0FCh        
    out 61h, AL   

    mov ax, 3416    ;F
    mov cx, 04

    ;mov BX, AX          
    ;mov AL, 182         
    ;out 43h, AL         
    ;mov AX, BX          
    out 42h, AL         
    mov AL, AH          
    out 42h, AL         
    in AL, 61h          
    or AL, 03h          
    out 61h, AL         
    mov AH, 86h         
    int 15h             
    in AL, 61h          
    and AL, 0FCh        
    out 61h, AL  

    mov ah, 86h
    mov cx, 01
    mov dx, 86a0h
    int 15h 

    mov ax, 3416    ;F
    mov cx, 04

    ;mov BX, AX          
    ;mov AL, 182         
    ;out 43h, AL         
    ;mov AX, BX          
    out 42h, AL         
    mov AL, AH          
    out 42h, AL         
    in AL, 61h          
    or AL, 03h          
    out 61h, AL         
    mov AH, 86h         
    int 15h             
    in AL, 61h          
    and AL, 0FCh        
    out 61h, AL 

    mov ah, 86h
    mov cx, 02h
    mov dx, 5120h
    int 15h 

    mov ax, 3619    ;E
    mov cx, 04

    ;mov BX, AX          
    ;mov AL, 182         
    ;out 43h, AL         
    ;mov AX, BX          
    out 42h, AL         
    mov AL, AH          
    out 42h, AL         
    in AL, 61h          
    or AL, 03h          
    out 61h, AL         
    mov AH, 86h         
    int 15h             
    in AL, 61h          
    and AL, 0FCh        
    out 61h, AL  

    popf
    pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
    ret
welcomeSnd endp

end