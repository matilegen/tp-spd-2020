.8086
.model small
.stack 100h
.data

filehandle dw ?
Palette db 256*4 dup (0)
Header db 54 dup (0)
ScrLine db 320 dup (0)
ErrorMsg db 'Error', 13, 10,'$'

.code

    public mostrarbmp
    public ReadHeader
    public ReadPalette
    public CopyPal
    public CopyBitmap
    public randGen
    public winSnd
    public lossSnd
    public welcomeSnd

mostrarbmp proc
    ; Open file
    mov ah, 3Dh
    xor al, al
    int 21h

    jc openerrorc
    mov [filehandle], ax
    ret

    openerrorc:
    mov dx, offset ErrorMsg
    mov ah, 9h
    int 21h
    ret
mostrarbmp endp

ReadHeader proc
    ; Read BMP file header, 54 bytes
    mov ah,3fh
    mov bx, [filehandle]
    mov cx,54
    mov dx,offset Header
    int 21h
    ret
ReadHeader endp

ReadPalette proc
    ; Read BMP file color palette, 256 colors * 4 bytes (400h)
    mov ah,3fh
    mov cx,400h
    mov dx,offset Palette
    int 21h
    ret
ReadPalette endp

CopyPal proc
    ; Copy the colors palette to the video memory
    ; The number of the first color should be sent to port 3C8h
    ; The palette is sent to port 3C9h
    mov si,offset Palette
    mov cx,256
    mov dx,3C8h
    mov al,0

    ; Copy starting color to port 3C8h
    out dx,al

    ; Copy palette itself to port 3C9h
    inc dx
    PalLoop:

    ; Note: Colors in a BMP file are saved as BGR values rather than RGB.
    mov al,[si+2] ; Get red value.
    shr al,2 ; Max. is 255, but video palette maximal

    ; value is 63. Therefore dividing by 4.
    out dx,al ; Send it.
    mov al,[si+1] ; Get green value.
    shr al,2
    out dx,al ; Send it.
    mov al,[si] ; Get blue value.
    shr al,2
    out dx,al ; Send it.
    add si,4 ; Point to next color.

    ; (There is a null chr. after every color.)
    loop PalLoop
    ret
CopyPal endp

CopyBitmap proc
    ; BMP graphics are saved upside-down.
    ; Read the graphic line by line (200 lines in VGA format),
    ; displaying the lines from bottom to top.
    mov ax, 0A000h
    mov es, ax
    mov cx,200
    PrintBMPLoop:
    push cx

    ; di = cx*320, point to the correct screen line
    mov di,cx
    shl cx,6
    shl di,8
    add di,cx

    ; Read one line
    mov ah,3fh
    mov cx,320
    mov dx,offset ScrLine
    ;add dx,0
    int 21h

    ; Copy one line into video memory
    cld 

    ; Clear direction flag, for movsb
    mov cx,320
    mov si,offset ScrLine
    rep movsb 

    ; Copy line to the screen
    ;rep movsb is same as the following code:
    ;mov es:di, ds:si
    ;inc si
    ;inc di
    ;dec cx
    ;loop until cx=0

    pop cx
    loop PrintBMPLoop
    ret
CopyBitmap endp

;RANDOM NUMBER
;Devuelve el numero en dx
randGen proc
    xor bx, bx

    mov ah, 00h
    int 1ah

    mov ax, dx
    xor dx, dx
    mov cx, 3
    div cx

    ret 
randGen endp

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