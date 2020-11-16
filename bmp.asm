.8086
.MODEL small
.STACK 128h
.DATA
;================================ Archivos
messipre db 'messi.bmp',0
darinpre db 'darin.bmp',0
cristianpre db 'cristian.bmp',0
braddpre db 'Bradd.bmp',0
janespre db 'janes.bmp',0
malumapre db 'maluma.bmp',0
rogerfpre db 'rogerf.bmp',0
shakirapre db 'shakira.bmp',0
ursulapre db 'ursula.bmp',0
scarletpre db 'scarlet.bmp',0

filehandle dw ?

;========================================= Preguntas
;in0 db " ___________________________________",0dh,0ah
;in1 db "|                                   |",0dh,0ah
;in2 db "|   _     _            _            _  |",0dh,0ah
;in2 db "|  | ) ° |_ |\ | \  / |_ |\ | ° |\ / \ |",0dh,0ah
;in2 db "|  |_) | |_ | \|  \/  |_ | \| | |/ \_/ |",0dh,0ah
;in2 db "|                                 |",0dh,0ah
;in2 db "|                                   |",0dh,0ah
;in2 db "|                                   |",0dh,0ah
;in2 db "|                                   |",0dh,0ah
;in2 db "|                                   |",0dh,0ah
;in2 db "|                                   |",0dh,0ah
;in2 db "|                                   |",0dh,0ah
;in2 db "|                                   |",0dh,0ah
;in2 db "|                                   |",0dh,0ah
;in3 db "|    bienvenido a quien soy yo      |",0dh,0ah
;in5 db "|___________________________________|",0dh,0ah

bi0 db " ___  _____  ____  _____  __ __ ", 0dh, 0ah
bi1	db "| _ \|_   _||  __||  |  ||  |  |", 0dh, 0ah
bi2	db "| _ < _| |_ |  __||     ||  |  |",0dh, 0ah
bi3	db "|___/|_____||____||_|___| \___/ ", 0dh, 0ah
bi4	db " ____  _____  _____  ___   ___ ",0dh,0ah
bi5	db "| ___||  |  ||_   _||   \ |   |",0dh,0ah
bi6	db "| ___||     | _| |_ | -- || - |",0dh,0ah
bi7	db "|____||_|___||_____||___/ |___|",0dh,0ah,24h
pr10 db "  ____________________   ___________ ",0dh,0ah
pr13 db " |      pregunta 1    | |preg.|resp.|",0dh,0ah
pr15 db " |____________________|  -----------",0dh,0ah 
re10 db "  ____________________  |_1___|__",24h

tabr1 db "__|",0dh,0ah,24h
re13 db "|_2___|__",24h
re15 db " |____________________| ",24h
tab3 db "|_3___|__",24h
re20 db "  ____________________  |_4___|__",24h
re23 db "|_5___|__",24h
re25 db "|_6___|__",24H

;===================================
pr20 db "  ____________________   ___________ ",0dh,0ah
pr23 db " |      pregunta 2    | |preg.|resp.|",0dh,0ah
pr25 db " |____________________|  -----------",0dh,0ah                                     
re210 db "  ____________________  |_1___|__",24h  
cierre db " |____________________| ",0dh,0ah,24h                                   

;===================================
pr30 db "  ____________________   ___________ ",0dh,0ah
pr33 db " |      pregunta 3    | |preg.|resp.|",0dh,0ah
pr35 db " |____________________|  -----------",0dh,0ah                                     
re310 db "  ____________________  |_1___|__",24h  

;===================================
;respuestas
p1 db " |     A) es hombre   | ",24h 
p2 db " |     B) es mujer    | ",24h

;======================================
p21 db " |   A) es deportista | ",24h
p22 db " |   B)es actores     | ",24h
p23 db " |   C)es cantante    | ",0dh,0ah,24h
;========================================
p31 db " |   A)futbol         | ",24h
p32 db " |   B)basquet        | ",24h
p33 db " |   C)tenis          | ",0dh,0ah,24h

mpregunta4 db "pregunta 4: ",0dh,0ah
p41 db "1)argentino",0dh,0ah
p42 db "2)portugues",0dh,0ah
p43 db "3)norteamericano",0dh,0ah
p44 db "4)suizo",0dh,0ah
p45 db "5)brazilero",0dh,0ah,24h

mpregunta5 db "pregunta 5: ",0dh,0ah
p51 db "1)presenta a su pais",0dh,0ah
p52 db "2)no representa a su pais",0dh,0ah,24h

mpregunta6 db "pregunta 6: ",0dh,0ah
p61 db "1)italia",0dh,0ah
p62 db "2)españa",0dh,0ah
p63 db "3)usa",0dh,0ah,24h
;===============================
respuestas db 6 dup (24h)
;=============================== 

Header db 54 dup (0)

Palette db 256*4 dup (0)

ScrLine db 320 dup (0)

ErrorMsg db 'Error', 13, 10,'$'
;================================
.CODE
;================================

proc main 
mov ax, @data
mov ds, ax
;================================

    ; Graphic mode
    mov ax, 13h
    int 10h
;=================================
;lleno el dup de respuestas
mov cx,8
xor bx,bx
cicloresp:
mov al,95
mov [bx+offset respuestas],al
inc bx
loop cicloresp
xor bx,bx
;=================================
;Cartel inicial
	mov ah,9
	;mov dx,offset bi0
	;int 21h
;====================================
call imppregunta1
mov ah,8
int 21h
;=====================================
;comparo respuesta
mov bx,0
cmp al,65
je pre1opcion1
cmp al,97
je pre1opcion1
cmp al,66
je pre1opcion2
cmp al,98
je pre1opcion2
;respondio mal
mov al,88
mov [bx+offset respuestas],al
jmp pregunta2
;respondio bien
pre1opcion1:
mov al,86
mov [bx+offset respuestas],al
jmp pregunta2
;respondio mal
pre1opcion2:
mov al,88
mov [bx+offset respuestas],al
jmp pregunta2 

pregunta2: 

 call imppregunta2 
 
mov ah,8
int 21h
;=====================================
;comparo respuesta
mov bx,1
cmp al,65
je pre2opcion1
cmp al,97
je pre2opcion1
cmp al,66
je pre2opcion2
cmp al,98
je pre2opcion2
cmp al,67
je pre2opcion2
cmp al,99
je pre2opcion2

;respondio mal
mov al,88
mov [bx+offset respuestas],al
jmp pregunta3

;respondio bien
pre2opcion1:
mov al,86
mov [bx+offset respuestas],al
jmp pregunta3 

;respondio mal
pre2opcion2:
mov al,88
mov [bx+offset respuestas],al
jmp pregunta3
  
;respondio mal
pre2opcion3:
mov al,88
mov [bx+offset respuestas],al
jmp pregunta3 

;==================================
pregunta3:

 call imppregunta3 
 
mov ah,8
int 21h
;=====================================
;comparo respuesta
mov bx,2
cmp al,65
je pre3opcion1
cmp al,97
je pre3opcion1
cmp al,66
je pre3opcion2
cmp al,98
je pre3opcion2
cmp al,67
je pre3opcion2
cmp al,99
je pre3opcion2

;respondio mal
mov al,88
mov [bx+offset respuestas],al
jmp pregunta4

;respondio bien
pre3opcion1:
mov al,86
mov [bx+offset respuestas],al
jmp pregunta4 

;respondio mal
pre3opcion2:
mov al,88
mov [bx+offset respuestas],al
jmp pregunta4
  
;respondio mal
pre3opcion3:
mov al,88
mov [bx+offset respuestas],al
jmp pregunta4

pregunta4:
;=========================
; en esta parte se le asigna a dx la imagen que se imprimira
; mov dx, offset messipre
;jmp opcion1
opcion2:
;mov dx, offset cristianpre
;jmp opcion1


;==========================
;aca esta lo necesario para imprimir las imagenes
    ; Process BMP file
	
;opcion1:
;    call mostrarbmp
;    call ReadHeader
;    call ReadPalette
;    call CopyPal
;    call CopyBitmap

    ; Wait for key press
;    mov ah,1
;
;    int 21h
    ; Back to text mode
;    mov ah, 0
;    mov al, 2
;    int 10h
;================================
;aca termina el main
exit:
    mov ax, 4c00h
    int 21h

main endp 

proc mostrarbmp

    ; Open file
;opcion 2
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
endp mostrarbmp
proc ReadHeader

    ; Read BMP file header, 54 bytes

    mov ah,3fh
    mov bx, [filehandle]
    mov cx,54
    mov dx,offset Header
    int 21h
    ret
    endp ReadHeader
    proc ReadPalette

    ; Read BMP file color palette, 256 colors * 4 bytes (400h)

    mov ah,3fh
    mov cx,400h
    mov dx,offset Palette
    int 21h
    ret
endp ReadPalette
proc CopyPal

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
endp CopyPal

proc CopyBitmap

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
endp CopyBitmap


;=====================================

colorear proc
    mov ah, 9
    mov al, ""      ;AL = Código del carácter a escribir.
    mov bh, 0       ;BH = Página de vídeo donde escribir el carácter.
    mov bl, 0dh     ;BL = Atributo ó color que va a tener el carácter.
    mov cx, 1       ;CX = Cantidad de veces que se debe escribir el carácter, uno a continuación de otro.
	ret
colorear endp

;================================
imppregunta1 proc  
    
;pregunta 1
	mov ah,9
	mov dx,offset pr10
	int 21h  
	;call colorear
	
;respuesta de la primer pregunta
	mov ah,6
	mov dl,[bx+offset respuestas]
	int 21h 
	
;imprime el resto de la tabla
	mov ah,9
	mov dx,offset tabr1
	int 21h
	mov dx,offset p1
	int 21h
	mov dx,offset re13
	int 21h 
	
;imprimo la segunda respuesta si la ahi sino imprimira un "_"
	inc bx
	mov ah,6
	mov dl,[bx+offset respuestas]
	int 21h
	mov ah,9
	mov dx,offset tabr1
	int 21h
	mov dx,offset re15
	int 21h
	mov dx,offset tab3
	int 21h
	inc bx
	mov ah,6
	mov dl,[bx+offset respuestas]
	int 21h
	mov ah,9
	mov dx,offset tabr1
	int 21h
    mov dx,offset re20
	int 21h
	inc bx
	mov ah,6
	mov dl,[bx+offset respuestas]
	int 21h
	mov ah,9
	mov dx,offset tabr1
	int 21h
	mov dx,offset p2
	int 21h
	mov dx,offset re23
	int 21h
	inc bx
	mov ah,6
	mov dl,[bx+offset respuestas]
	int 21h
	mov ah,9
	mov dx,offset tabr1
	int 21h
	mov dx,offset re15
	int 21h
	mov dx,offset re25
	int 21h
	inc bx
	mov ah,6
	mov dl,[bx+offset respuestas]
	int 21h
	mov ah,9
	mov dx,offset tabr1
	int 21h
	
	ret
endp imppregunta1 

;================================
imppregunta2 proc
    
int 69h
  xor bx,bx
;pregunta 1 
    mov ah,9
	mov dx,offset pr20
	int 21h  
	push bx
	call colorear
	pop bx
;respuesta de la primer pregunta
	mov ah,6
	mov dl,[bx+offset respuestas]
	int 21h 
	
;imprime el resto de la tabla
	mov ah,9
	mov dx,offset tabr1
	int 21h
	mov dx,offset p21
	int 21h
	mov dx,offset re13
	int 21h 
	
;imprimo la segunda respuesta si la ahi sino imprimira un "_"
	inc bx
	mov ah,6
	mov dl,[bx+offset respuestas]
	int 21h
	mov ah,9
	mov dx,offset tabr1
	int 21h
	mov dx,offset re15
	int 21h
	mov dx,offset tab3
	int 21h

;call colorear	
	inc bx
	mov ah,6
	mov dl,[bx+offset respuestas]
	int 21h
	mov ah,9
	mov dx,offset tabr1
	int 21h
mov dx,offset re20
	int 21h
	
;call colorear
	inc bx
	mov ah,6
	mov dl,[bx+offset respuestas]
	int 21h
	mov ah,9
	mov dx,offset tabr1
	int 21h
	mov dx,offset p22
	int 21h
	mov dx,offset re23
	int 21h

;call colorear
	inc bx
	mov ah,6
	mov dl,[bx+offset respuestas]
	int 21h
	mov ah,9
	mov dx,offset tabr1
	int 21h
	mov dx,offset re15
	int 21h
	mov dx,offset re25
	int 21h

;call colorear
	inc bx
	mov ah,6
	mov dl,[bx+offset respuestas]
	int 21h
	mov ah,9
	mov dx,offset tabr1
	int 21h 
	mov dx,offset p23
	int 21h
	mov dx,offset cierre
	int 21h
	ret
endp imppregunta2

imppregunta3 proc
    xor bx,bx  
int 69h   
;pregunta 1 
    mov ah,9
	mov dx,offset pr30
	int 21h  
	
;respuesta de la primer pregunta
	mov ah,6
	mov dl,[bx+offset respuestas]
	int 21h 
	
;imprime el resto de la tabla
	mov ah,9
	mov dx,offset tabr1
	int 21h
	mov dx,offset p31
	int 21h
	mov dx,offset re13
	int 21h 
	
;imprimo la segunda respuesta si la ahi sino imprimira un "_"
	inc bx
	mov ah,6
	mov dl,[bx+offset respuestas]
	int 21h
	mov ah,9
	mov dx,offset tabr1
	int 21h
	mov dx,offset re15
	int 21h
	mov dx,offset tab3
	int 21h
	inc bx
	mov ah,6
	mov dl,[bx+offset respuestas]
	int 21h
	mov ah,9
	mov dx,offset tabr1
	int 21h
mov dx,offset re20
	int 21h
	inc bx
	mov ah,6
	mov dl,[bx+offset respuestas]
	int 21h
	mov ah,9
	mov dx,offset tabr1
	int 21h
	mov dx,offset p32
	int 21h
	mov dx,offset re23
	int 21h
	inc bx
	mov ah,6
	mov dl,[bx+offset respuestas]
	int 21h
	mov ah,9
	mov dx,offset tabr1
	int 21h
	mov dx,offset re15
	int 21h
	mov dx,offset re25
	int 21h
	inc bx
	mov ah,6
	mov dl,[bx+offset respuestas]
	int 21h
	mov ah,9
	mov dx,offset tabr1
	int 21h 
	mov dx,offset p33
	int 21h
	mov dx,offset cierre
	int 21h
	ret
	endp imppregunta3
end main
