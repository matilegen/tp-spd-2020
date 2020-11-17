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

testi db "PERO LA PUTA MADRE", 0dh, 0ah, 24h

.CODE
;================================
extrn impbienv:proc
extrn impmenu:proc
extrn impinst:proc
extrn imppregunta1:proc
extrn imppregunta2:proc
extrn imppregunta3:proc
extrn imppregunta4:proc
extrn imppregunta5:proc
extrn imppregunta6:proc
extrn imppregunta7:proc
extrn respMessi1:proc
extrn respMessi2:proc
extrn respMessi3:proc
extrn respMessi4:proc
extrn respMessi5:proc
extrn respMessi6:proc
extrn respMessi7:proc
extrn respLebron1:proc
extrn respLebron2:proc
extrn respLebron3:proc
extrn respLebron4:proc
extrn respLebron5:proc
extrn respLebron6:proc
extrn respLebron7:proc
extrn llenador_:proc
extrn mostrarbmp:proc
extrn ReadHeader:proc
extrn ReadPalette:proc
extrn CopyPal:proc
extrn CopyBitmap:proc
extrn randGen:proc
;================================
proc main 
mov ax, @data
mov ds, ax
;================================
    ; Graphic mode
    mov ax, 13h
    int 10h
;=================================


         ;LLENO EL DUP DE RESPUESTAS

call impbienv           ;IMPRIMO BIENVENIDA
imprimenu:
call impmenu            ;IMPRIMO MENU
mov ah,8
int 21h

cmp al,"1"              ;COMPARO OPCIONES DEL MENU
je jugar
cmp al,"2"
je intrucciones
cmp al,"3"
je exit00
jmp impmenu

intrucciones:       
call impinst            ;IMPRIMO INTRUCCIONES
jmp imprimenu

jugar:                  ;COMIENZO JUEGO
call llenador_ 
call randGen            ;LLAMO RANDOM NUMBER GENERATOR
cmp dx, 0               ;SI TRAE 0 JUEGO LEBRON
je juegoLebron
cmp dx, 1               ;SI TRAE 1 JUEGO MESSI
je juegoMessi
jmp jugar

juegoMessi:
int 69h
xor bx,bx
;Pregunta 1
call imppregunta1       ;LLAMO PREGUNTA 1
mov ah,8
int 21h
call respMessi1         ;COMPARO RESPUESTAS
;Pregunta 2
call imppregunta2       ;LLAMO PREGUNTA 2
mov ah,8
int 21h
call respMessi2         ;COMPARO RESPUESTAS
;Pregunta3
call imppregunta3       ;LLAMO PREGUNTA 3
mov ah,8
int 21h
call respMessi3         ;COMPARO RESPUESTAS
;Pregunta 4
call imppregunta4       ;LLAMO PREGUNTA 4
mov ah,8
int 21h
call respMessi4         ;COMPARO RESPUESTAS
;Pregunta 5
call imppregunta5       ;LLAMO PREGUNTA 5
mov ah,8
int 21h
call respMessi5         ;COMPARO RESPUESTAS
;Pregutna 6
call imppregunta6       ;LLAMO PREGUNTA 6
mov ah,8
int 21h
call respMessi6         ;COMPARO RESPUESTAS
;Pregunta 7
call imppregunta7       ;LLAMO PREGUNTA 7
mov ah,8
int 21h
call respMessi7         ;COMPARO RESPUESTAS
jmp finMessi

exit00:
jmp exit

juegoLebron:
int 69h
xor bx,bx
;Pregunta 1
call imppregunta1       ;LLAMO PREGUNTA 1
mov ah,8
int 21h
call respLebron1         ;COMPARO RESPUESTAS
;Pregunta 2
call imppregunta2       ;LLAMO PREGUNTA 2
mov ah,8
int 21h
call respLebron2         ;COMPARO RESPUESTAS
;Pregunta3
call imppregunta3       ;LLAMO PREGUNTA 3
mov ah,8
int 21h
call respLebron3         ;COMPARO RESPUESTAS
;Pregunta 4
call imppregunta4       ;LLAMO PREGUNTA 4
mov ah,8
int 21h
call respLebron4         ;COMPARO RESPUESTAS
;Pregunta 5
call imppregunta5       ;LLAMO PREGUNTA 5
mov ah,8
int 21h
call respLebron5         ;COMPARO RESPUESTAS
;Pregutna 6
call imppregunta6       ;LLAMO PREGUNTA 6
mov ah,8
int 21h
call respLebron6         ;COMPARO RESPUESTAS
;Pregunta 7
call imppregunta7       ;LLAMO PREGUNTA 7
mov ah,8
int 21h
call respLebron7         ;COMPARO RESPUESTAS
mov ah,9
lea dx, testi
int 21h
jmp finLebron

finLebron:
mov dx, offset janespre
jmp opcion1

finMessi:
mov dx, offset messipre
jmp opcion1

;==========================
;aca esta lo necesario para imprimir las imagenes
    ; Process BMP file
	
opcion1:
    int 69h

    call mostrarbmp
    call ReadHeader
    call ReadPalette
    call CopyPal
    call CopyBitmap

    ; Wait for key press
    mov ah,1
    int 21h

    ;Vuelvo al menu
    jmp imprimenu

;aca termina el main
exit:
    mov ax, 4c00h
    int 21h
main endp 

end main
