.8086
.MODEL small
.STACK 100h
.data
;================================ Archivos
a0 db 255 dup ("$")
janespre db 'janes.bmp',0
a1 db 255 dup ("$")
messipre db 'messi.bmp',0
a2 db 255 dup ("$")
cristianpre db 'cristian.bmp',0
a3 db 255 dup ("$")

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
extrn respRonal1:proc
extrn respRonal2:proc
extrn respRonal3:proc
extrn respRonal4:proc
extrn respRonal5:proc
extrn respRonal6:proc
extrn respRonal7:proc
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
    mov ax, 0013h
    int 10h
;=================================
call impbienv           ;IMPRIMO BIENVENIDA (en art.asm)
imprimenu:
call impmenu            ;IMPRIMO MENU (en art.asm)
mov ah,8
int 21h

cmp al,"1"              ;COMPARO OPCIONES DEL MENU
je jugar
cmp al,"2"
je intrucciones
cmp al,"3"
je exit00
jmp imprimenu

intrucciones:       
call impinst            ;IMPRIMO INTRUCCIONES (en art.asm)
jmp imprimenu

jugar:                  ;COMIENZO JUEGO
xor ax, ax
xor bx, bx
xor cx, cx
xor dx, dx
call llenador_          ;(en art.asm)
call randGen            ;LLAMO RANDOM NUMBER GENERATOR
cmp dx, 0               ;SI TRAE 0 JUEGO MESSI
je juegoMessi
cmp dx, 1               ;SI TRAE 1 JUEGO LEBRON
je juegoLebron0
cmp dx, 2
je juegoRonal        ;SI TRAE 2 JUEGO RONAL
xor dx, dx
jmp jugar

juegoMessi:
;Pregunta 1
call imppregunta1       ;LLAMO PREGUNTA 1 (en art.asm)
mov ah,8
int 21h
call respMessi1         ;COMPARO RESPUESTAS (en messiAns.asm)
;Pregunta 2
call imppregunta2       ;LLAMO PREGUNTA 2 (en art.asm)
mov ah,8
int 21h
call respMessi2         ;COMPARO RESPUESTAS (en messiAns.asm)
;Pregunta3
call imppregunta3       ;LLAMO PREGUNTA 3 (en arte.asm)
mov ah,8
int 21h
call respMessi3         ;COMPARO RESPUESTAS (en messiAns.asm)
;Pregunta 4
call imppregunta4       ;LLAMO PREGUNTA 4 (en art.asm)
mov ah,8
int 21h
call respMessi4         ;COMPARO RESPUESTAS (en messiAns.asm)
;Pregunta 5
call imppregunta5       ;LLAMO PREGUNTA 5 (en art.asm)
mov ah,8
int 21h
call respMessi5         ;COMPARO RESPUESTAS (en messiAns.asm)
;Pregutna 6
call imppregunta6       ;LLAMO PREGUNTA 6 (en art.asm)
mov ah,8
int 21h
call respMessi6         ;COMPARO RESPUESTAS (en messiAns.asm)
;Pregunta 7
call imppregunta7       ;LLAMO PREGUNTA 7 (en art.asm)
mov ah,8
int 21h
call respMessi7         ;COMPARO RESPUESTAS (en messiAns.asm)
jmp finMessi

exit00:
jmp exit

juegoLebron0:
jmp juegoLebron

juegoRonal:
;Pregunta 1
call imppregunta1       ;LLAMO PREGUNTA 1 (en art.asm)
mov ah,8
int 21h
call respRonal1         ;COMPARO RESPUESTAS (en ronalAns.asm)
;Pregunta 2
call imppregunta2       ;LLAMO PREGUNTA 2 (en art.asm)
mov ah,8
int 21h
call respRonal2         ;COMPARO RESPUESTAS (en ronalAns.asm)
;Pregunta3
call imppregunta3       ;LLAMO PREGUNTA 3 (en arte.asm)
mov ah,8
int 21h
call respRonal3         ;COMPARO RESPUESTAS (en ronalAns.asm)
;Pregunta 4
call imppregunta4       ;LLAMO PREGUNTA 4 (en art.asm)
mov ah,8
int 21h
call respRonal4         ;COMPARO RESPUESTAS (en ronalAns.asm)
;Pregunta 5
call imppregunta5       ;LLAMO PREGUNTA 5 (en art.asm)
mov ah,8
int 21h
call respRonal5         ;COMPARO RESPUESTAS (en ronalAns.asm)
;Pregutna 6
call imppregunta6       ;LLAMO PREGUNTA 6 (en art.asm)
mov ah,8
int 21h
call respRonal6         ;COMPARO RESPUESTAS (en ronalAns.asm)
;Pregunta 7
call imppregunta7       ;LLAMO PREGUNTA 7 (en art.asm)
mov ah,8
int 21h
call respRonal7         ;COMPARO RESPUESTAS (en ronalAns.asm)
jmp finRonal

juegoLebron:
;Pregunta 1
call imppregunta1       ;LLAMO PREGUNTA 1 (en art.asm)
mov ah,8
int 21h
call respLebron1         ;COMPARO RESPUESTAS (en jamesAns.asm)
;Pregunta 2
call imppregunta2       ;LLAMO PREGUNTA 2 (en art.asm)
mov ah,8
int 21h
call respLebron2         ;COMPARO RESPUESTAS (en jamesAns.asm)
;Pregunta3
call imppregunta3       ;LLAMO PREGUNTA 3 (en art.asm)
mov ah,8
int 21h
call respLebron3         ;COMPARO RESPUESTAS (en jamesAns.asm)
;Pregunta 4
call imppregunta4       ;LLAMO PREGUNTA 4 (en art.asm)
mov ah,8
int 21h
call respLebron4         ;COMPARO RESPUESTAS (en jamesAns.asm)
;Pregunta 5
call imppregunta5       ;LLAMO PREGUNTA 5 (en art.asm)
mov ah,8
int 21h
call respLebron5         ;COMPARO RESPUESTAS (en jamesAns.asm)
;Pregutna 6
call imppregunta6       ;LLAMO PREGUNTA 6 (en art.asm)
mov ah,8
int 21h
call respLebron6         ;COMPARO RESPUESTAS (en jamesAns.asm)
;Pregunta 7
call imppregunta7       ;LLAMO PREGUNTA 7 (en art.asm)
mov ah,8
int 21h
call respLebron7         ;COMPARO RESPUESTAS (en jamesAns.asm)
jmp finLebron

finMessi:
;mov ax, 13h
;int 10h
;int 80h
mov dx, offset messipre
jmp opcion1

finRonal:
;mov ax, 13h
;int 10h
int 80h
mov dx, offset cristianpre
jmp opcion1

finLebron:
;mov ax, 13h
;int 10h
;int 80h
mov dx, offset janespre
jmp opcion1



;==========================
;aca esta lo necesario para imprimir las imagenes
    ; Process BMP file
	
opcion1:
    call mostrarbmp         ;(en lib.asm)
    call ReadHeader         ;(en lib.asm)
    call ReadPalette        ;(en lib.asm)
    call CopyPal            ;(en lib.asm)
    call CopyBitmap         ;(en lib.asm)
    ; Wait for key press
    mov ah,1
    int 21h

    ;Vuelvo al menu
    mov ax, 0013h
    int 10h
    xor ax, ax
    xor bx, bx
    xor cx, cx
    xor dx, dx
    xor di, di
    xor si, si
    jmp imprimenu

;aca termina el main
exit:
    mov ax, 4c00h
    int 21h
main endp 

end main
