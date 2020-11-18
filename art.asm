.8086
.model small
.stack 100h
.data

techo db "  ____________________", 0dh,0ah,24h
bi00 db  0ah, 0dh
bi01 db  0ah, 0dh
bi02 db  0ah, 0dh
bi03 db  0ah, 0dh
bi04 db "    ___  _____  ____  _____  __ __ ", 0dh, 0ah
bi05 db "   | _ \|_   _||  __||  |  ||  |  |", 0dh, 0ah
bi06 db "   | _ < _| |_ |  __||     ||  |  |",0dh, 0ah
bi07 db "   |___/|_____||____||_|___| \___/ ", 0dh, 0ah
bi08 db "    ____  _____  _____  ___   ___ ",0dh,0ah
bi09 db "   | ___||  |  ||_   _||   \ |   |",0dh,0ah
bi10 db "   | ___||     | _| |_ | -- || - |",0dh,0ah
bi11 db "   |____||_|___||_____||___/ |___|",0dh,0ah,24h

inst00 db "     Instrucciones del quien soy",0dh,0ah
inst01 db 0dh, 0ah
inst02 db "El juego consta de adivinar el personajeque la computadora personifica.", 0dh, 0ah, 0ah
inst03 db "Le vamos a realizar 6 preguntas, donde  ustes eligira la opcion que crea que    corresponda.", 0dh, 0ah, 0ah
inst04 db "Se le informara si la opcion es correctao incorrecta y podra ver sus respuestas.",0dh,0ah
inst05 db "Luego de las preguntas se le daran      opciones sobre quien es el presonaje y  usted debe de adivinarlo.", 0dh, 0ah, 0ah
inst06 db "Presione una tecla para continuar", 0dh, 0ah, 24h

mnu00 db "   +------------------------------+", 0ah ,0dh
mnu01 db "   +------------------------------+", 0ah ,0dh
mnu02 db "   |    ____        _   __        |", 0ah ,0dh
mnu03 db "   |   / __ \      (_) /_/        |", 0ah ,0dh
mnu04 db "   |  | |  | |_   _ _  ___ _ __   |", 0ah, 0dh
mnu05 db "   |  | |  | | | | | |/ _ \ '_ \  |", 0ah, 0dh
mnu06 db "   |  | |__| | |_| | |  __/ | | | |", 0ah, 0dh
mnu07 db "   |   \___\_\\__,_|_|\___|_| |_| |", 0ah, 0dh
mnu08 db "   |                              |", 0ah, 0dh
mnu09 db "   |    _____            ___      |", 0ah, 0dh
mnu10 db "   |   / ____|          |__ \     |", 0ah, 0dh
mnu11 db "   |   | (___   ___  _   _  ) |   |", 0ah ,0dh
mnu12 db "   |    \___ \ / _ \| | | |/ /    |", 0ah ,0dh
mnu13 db "   |    ____) | (_) | |_| |_|     |", 0ah ,0dh
mnu14 db "   |   |_____/ \___/ \__, (_)     |", 0ah ,0dh
mnu15 db "   |                  __/ |       |", 0ah ,0dh
mnu16 db "   |                 |___/        |", 0ah ,0dh
mnu17 db "   +------------------------------+", 0ah, 0dh
mnu18 db 0ah,0ah
mnu19 db "1.   Jugar                                                                     ", 0ah, 0dh
mnu20 db "2.   Intrucciones                                                              ", 0ah, 0dh
mnu21 db "3.   Salir                                                                     ", 0ah, 0dh,24h

pr10 db "  ____________________   ___________ ",0dh,0ah
pr13 db " |      pregunta 1    | |preg.|resp.|",0dh,0ah
pr15 db " |____________________|  -----------",0dh,0ah 
re10 db "  ____________________  |_1___|__",24h
cierre db " |____________________| ",0dh,0ah,24h   

tabr1 db "__|",0dh,0ah,24h
re13 db "|_2___|__",24h
re15 db " |____________________| ",24h
tab3 db "|_3___|__",24h
re20 db "  ____________________  |_4___|__",24h
re23 db "|_5___|__",24h
re25 db "|_6___|__",24H

pr20 db "  ____________________   ___________ ",0dh,0ah
pr23 db " |      pregunta 2    | |preg.|resp.|",0dh,0ah
pr25 db " |____________________|  -----------",0dh,0ah                                     
re210 db "  ____________________  |_1___|__",24h  

pr30 db "  ____________________   ___________ ",0dh,0ah
pr33 db " |      pregunta 3    | |preg.|resp.|",0dh,0ah
pr35 db " |____________________|  -----------",0dh,0ah                                     
re310 db "  ____________________  |_1___|__",24h  

pr40 db "  ____________________   ___________ ",0dh,0ah
pr43 db " |      pregunta 4    | |preg.|resp.|",0dh,0ah
pr45 db " |____________________|  -----------",0dh,0ah                                     
re410 db "  ____________________  |_1___|__",24h  

pr50 db "  ____________________   ___________ ",0dh,0ah
pr53 db " |      pregunta 5    | |preg.|resp.|",0dh,0ah
pr55 db " |____________________|  -----------",0dh,0ah                                     
re510 db "  ____________________  |_1___|__",24h  

pr60 db "  ____________________   ___________ ",0dh,0ah
pr63 db " |      pregunta 6    | |preg.|resp.|",0dh,0ah
pr65 db " |____________________|  -----------",0dh,0ah                                     
re610 db "  ____________________  |_1___|__",24h  

pr70 db "  ____________________   ___________ ",0dh,0ah
pr73 db " |     Quien Soy?     | |preg.|resp.|",0dh,0ah
pr75 db " |____________________|  -----------",0dh,0ah                                     
re710 db "  ____________________  |_1___|__",24h  

;respuestas
p1 db " |     A) es hombre   | ",24h 
p2 db " |     B) es mujer    | ",24h
;======================================
p21 db " |   A)es deportista  | ",24h
p22 db " |   B)es actor       | ",24h
p23 db " |   C)es cantante    | ",0dh,0ah,24h
;========================================
p31 db " |   A)futbol         | ",24h
p32 db " |   B)basquet        | ",24h
p33 db " |   C)tenis          | ",0dh,0ah,24h
;========================================
p41 db " |   A)Argentino      | ",24h
p42 db " |   B)Portugues      | ",24h
p43 db " |   C)Suizo          | ",0dh,0ah,24h
p44 db " |   D)Brazilero      | ",0dh,0ah,24h
p45 db " |   E)Norteamiricano | ",0dh,0ah,24h
;========================================
p51 db " |A)Juega por su pais | ",24h
p52 db " |B)No lo hace        | ",24h
;========================================
p61 db " |A)Juega en Italia   | ",24h
p62 db " |B)Juega en USA      | ",24h
p63 db " |C)Juega en Espana   | ",0dh,0ah,24h
;========================================
p71 db " |   A)Roger Federer  | ",24h
p72 db " |   B)Lebron James   | ",24h
p73 db " |   C)Messi          | ",0dh,0ah,24h
p74 db " |   D)Maluma         | ",0dh,0ah,24h
p75 db " |   E)Ronaldo        | ",0dh,0ah,24h

respuestas db 6 dup (24h)


.code
extrn welcomeSnd:proc

 public impbienv
 public impmenu
 public impinst
 public imppregunta1
 public imppregunta2
 public imppregunta3
 public imppregunta4
 public imppregunta5
 public imppregunta6
 public imppregunta7
 public llenador_
 public respondio_bien
 public respondio_mal

impbienv proc

    mov ah,9
    mov dx,offset bi00
    int 21h
	;call welcomeSnd
	
    mov si, 13
    scroll:
    cmp si, 0
    je scroll_out
    mov cx, 02      ;WAIT del scroll
    mov dx, 41248
    mov ah, 86h
    int 15h
    call scroll_down
    dec si
    jmp scroll
    scroll_out:

    ret
impbienv endp

impmenu proc

    int 69h
    mov ah,9
    mov dx,offset mnu02
    int 21h

    ret
impmenu endp

impinst proc
	int 69h
    mov ah,9
    mov dx,offset inst00
    int 21h

    mov ah,8
    int 21h

    ret
impinst endp

imppregunta1 proc 
	push ax
	push bx
	push cx
	push dx
	push si
	push di
	int 69h
;pregunta 1
	mov ah,9
	mov dx,offset pr10
	int 21h  
	
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

	pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	ret
imppregunta1 endp

imppregunta2 proc
    push ax
	push bx
	push cx
	push dx
	push si
	push di

	int 69h
  	xor bx,bx

;pregunta 1 
    mov ah,9
	mov dx,offset pr20
	int 21h  
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
	mov dx,offset p23
	int 21h
	mov dx,offset cierre
	int 21h

	pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	ret
imppregunta2 endp

imppregunta3 proc
	push ax
	push bx
	push cx
	push dx
	push si
	push di

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

	pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	ret
imppregunta3 endp

imppregunta4 proc
	push ax
	push bx
	push cx
	push dx
	push si
	push di

    xor bx,bx  
	int 69h   
;pregunta 1 
    mov ah,9
	mov dx,offset pr40
	int 21h  
	
;respuesta de la primer pregunta
	mov ah,6
	mov dl,[bx+offset respuestas]
	int 21h 
	
;imprime el resto de la tabla
	mov ah,9
	mov dx,offset tabr1
	int 21h
	mov dx,offset p41
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
	mov dx,offset p42
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
	mov dx,offset p43
	int 21h
	mov dx,offset cierre
	int 21h
    mov dx,offset techo
    int 21h
    mov dx,offset p44
    int 21h
    mov dx,offset cierre
    int 21h
    mov dx,offset techo
    int 21h
    mov dx,offset p45
    int 21h
    mov dx,offset cierre
    int 21h

	pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	ret
imppregunta4 endp

imppregunta5 proc  
	push ax
	push bx
	push cx
	push dx
	push si
	push di

	int 69h
;pregunta 1
    xor bx,bx
	mov ah,9
	mov dx,offset pr50
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
	mov dx,offset p51
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
	mov dx,offset p52
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

	pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	ret
imppregunta5 endp

imppregunta6 proc
    push ax
	push bx
	push cx
	push dx
	push si
	push di

	int 69h
  xor bx,bx
;pregunta 1 
    mov ah,9
	mov dx,offset pr60
	int 21h  
	push bx
	;call colorear
	pop bx
;respuesta de la primer pregunta
	mov ah,6
	mov dl,[bx+offset respuestas]
	int 21h 
	
;imprime el resto de la tabla
	mov ah,9
	mov dx,offset tabr1
	int 21h
	mov dx,offset p61
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
	mov dx,offset p62
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
	mov dx,offset p63
	int 21h
	mov dx,offset cierre
	int 21h

	pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	ret
imppregunta6 endp

imppregunta7 proc
	push ax
	push bx
	push cx
	push dx
	push si
	push di

    xor bx,bx  
	int 69h   
;pregunta 1 
    mov ah,9
	mov dx,offset pr70
	int 21h  
	
;respuesta de la primer pregunta
	mov ah,6
	mov dl,[bx+offset respuestas]
	int 21h 
	
;imprime el resto de la tabla
	mov ah,9
	mov dx,offset tabr1
	int 21h
	mov dx,offset p71
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
	mov dx,offset p72
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
	mov dx,offset p73
	int 21h
	mov dx,offset cierre
	int 21h
    mov dx,offset techo
    int 21h
    mov dx,offset p74
    int 21h
    mov dx,offset cierre
    int 21h
    mov dx,offset techo
    int 21h
    mov dx,offset p75
    int 21h
    mov dx,offset cierre
    int 21h

	pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	ret
imppregunta7 endp

color_rojo proc

	push bx

	mov ah, 09
    mov al, "X"     ;AL = Código del carácter a escribir.
	mov bx, 000ch	;BH = Página BL =Color.
    mov cx, 10       ;CX = Cantidad de veces.
	int 10h

	pop bx
	ret
color_rojo endp

color_verde proc
	push ax
	push bx
	push cx
	push dx
	push si
	push di

	mov ah, 9
    mov al, "V"      ;AL = Código del carácter a escribir.
	mov bx, 000ah
    mov cx, 10       ;CX = Cantidad de veces que se debe escribir el carácter
	int 10h

	pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	ret
color_verde endp

llenador_ proc
	push ax
	push bx
	push cx
	push dx
	push si
	push di

    mov cx,8
    xor bx,bx
    cicloresp:
    mov al,95

    mov [bx+offset respuestas],al
    inc bx
    loop cicloresp

	pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
    ret
llenador_ endp

respondio_mal proc
    mov al,88
    mov [bx+offset respuestas],al

    ret
respondio_mal endp

respondio_bien proc
    mov al,86
    mov [bx+offset respuestas],al


    ret
respondio_bien endp

scroll_down proc
	push ax
	push bx
	push cx
	push dx
	push si
	push di

    mov ah, 6               ; http://www.ctyme.com/intr/rb-0097.htm
    mov al, 1               ; number of lines to scroll
    mov bh, 0               ; attribute
    mov ch, 0               ; row top
    mov cl, 0               ; col left
    mov dh, 25              ; row bottom
    mov dl, 80              ; col right
    int 10h

	pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
    ret
scroll_down endp
end