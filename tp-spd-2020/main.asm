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


;=============================== 

;================================
.CODE
;================================
extrn imppregunta1:proc
extrn imppregunta2:proc
extrn imppregunta3:proc
extrn imppregunta4:proc
extrn imppregunta5:proc
extrn imppregunta6:proc
extrn imppregunta7:proc
extrn llenador_:proc
extrn respondio_bien:proc
extrn respondio_mal:proc
extrn mostrarbmp:proc
extrn ReadHeader:proc
extrn ReadPalette:proc
extrn CopyPal:proc
extrn CopyBitmap:proc

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
call llenador_

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
call respondio_mal
jmp pregunta2
;respondio bien
pre1opcion1:
call respondio_bien
jmp pregunta2
;respondio mal
pre1opcion2:
call respondio_mal
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
call respondio_mal
jmp pregunta3

;respondio bien
pre2opcion1:
call respondio_bien
jmp pregunta3 

;respondio mal
pre2opcion2:
call respondio_mal
jmp pregunta3
  
;respondio mal
pre2opcion3:
call respondio_mal
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
call respondio_mal
jmp pregunta4

;respondio bien
pre3opcion1:
call respondio_bien
jmp pregunta4 

;respondio mal
pre3opcion2:
call respondio_mal
jmp pregunta4
  
;respondio mal
pre3opcion3:
call respondio_mal
jmp pregunta4

pregunta4:
;=========================
call imppregunta4

mov ah,8
int 21h
;=====================================
;comparo respuesta
mov bx,3
cmp al,65
je pre4opcion1
cmp al,97
je pre4opcion1
cmp al,66
je pre4opcion2
cmp al,98
je pre4opcion2
cmp al,67
je pre4opcion3
cmp al,99
je pre4opcion3
cmp al,68
je pre4opcion4
cmp al,100
je pre4opcion4
cmp al,69
je pre4opcion5
cmp al,101
je pre4opcion5

;respondio mal
call respondio_mal
jmp pregunta5

;respondio bien
pre4opcion1:
call respondio_bien
jmp pregunta5 

;respondio mal
pre4opcion2:
call respondio_mal
jmp pregunta5
  
;respondio mal
pre4opcion3:
call respondio_mal
jmp pregunta5

;respondio mal
pre4opcion4:
call respondio_mal
jmp pregunta5

;respondio mal
pre4opcion5:
call respondio_mal
jmp pregunta5

pregunta5:

call imppregunta5

mov ah,8
int 21h
;=====================================
;comparo respuesta
mov bx,4
cmp al,65
je pre5opcion1
cmp al,97
je pre5opcion1
cmp al,66
je pre5opcion2
cmp al,98
je pre5opcion2

;respondio mal
call respondio_mal
jmp pregunta6

;respondio mal
pre5opcion1:
call respondio_mal
jmp pregunta6

;respondio bien
pre5opcion2:
call respondio_bien
jmp pregunta6 

pregunta6:

call imppregunta6

mov ah,8
int 21h
;=====================================
;comparo respuesta
mov bx,5
cmp al,65
je pre6opcion1
cmp al,97
je pre6opcion1
cmp al,66
je pre6opcion2
cmp al,98
je pre6opcion2
cmp al,67
je pre6opcion2
cmp al,99
je pre6opcion2

;respondio mal
call respondio_mal
jmp pregunta7

;respondio mal
pre6opcion1:
call respondio_mal
jmp pregunta7 

;respondio mal
pre6opcion2:
call respondio_mal
jmp pregunta7
  
;respondio bien
pre6opcion3:
call respondio_bien
jmp pregunta7

pregunta7:

call imppregunta7

mov ah,8
int 21h
;=====================================
;comparo respuesta
mov bx,6
cmp al,65
je pre7opcion1
cmp al,97
je pre7opcion1
cmp al,66
je pre7opcion2
cmp al,98
je pre7opcion2
cmp al,67
je pre7opcion3
cmp al,99
je pre7opcion3
cmp al,68
je pre7opcion4
cmp al,100
je pre7opcion4
cmp al,69
je pre7opcion5
cmp al,101
je pre7opcion5

;respondio mal
call respondio_mal
jmp opcion2

;respondio mal
pre7opcion1:
;call respondio_mal
jmp opcion2 

;respondio mal
pre7opcion2:
;call respondio_mal
jmp opcion2
  
;respondio bien
pre7opcion3:
;call respondio_bien
jmp opcion2

;respondio mal
pre7opcion4:
;call respondio_mal
jmp opcion2

;respondio mal
pre7opcion5:
;call respondio_mal
jmp opcion2


opcion2:
mov dx, offset messipre
jmp opcion1


;==========================
;aca esta lo necesario para imprimir las imagenes
    ; Process BMP file
	
opcion1:
    call mostrarbmp
    call ReadHeader
    call ReadPalette
    call CopyPal
    call CopyBitmap

    ; Wait for key press
    mov ah,1
;
    int 21h
    ; Back to text mode
    mov ah, 0
    mov al, 2
    int 10h
;================================
;aca termina el main
exit:
    mov ax, 4c00h
    int 21h

main endp 

end main
