.8086
.model small
.stack 100h
.data
.code
extrn respondio_bien:proc
extrn respondio_mal:proc
extrn winSnd:proc
extrn lossSnd:proc

    public respMessi1
    public respMessi2
    public respMessi3
    public respMessi4
    public respMessi5
    public respMessi6
    public respMessi7

    public respRonal1
    public respRonal2
    public respRonal3
    public respRonal4
    public respRonal5
    public respRonal6
    public respRonal7

    public respLebron1
    public respLebron2
    public respLebron3
    public respLebron4
    public respLebron5
    public respLebron6
    public respLebron7

respMessi1 proc
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
    call respondio_mal      ;(en art.asm)
    jmp pregunta2

    ;respondio bien
    pre1opcion1:
    call respondio_bien     ;(en art.asm)
    jmp pregunta2

    ;respondio mal
    pre1opcion2:
    call respondio_mal      ;(en art.asm)
    jmp pregunta2

    pregunta2:
    ret   
respMessi1 endp

respMessi2 proc
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
    call respondio_mal      ;(en art.asm)
    jmp pregunta3

    ;respondio bien
    pre2opcion1:
    call respondio_bien     ;(en art.asm)
    jmp pregunta3 

    ;respondio mal
    pre2opcion2:
    call respondio_mal      ;(en art.asm)
    jmp pregunta3
  
    ;respondio mal
    pre2opcion3:
    call respondio_mal      ;(en art.asm)
    jmp pregunta3 

    pregunta3:
    ret
respMessi2 endp

respMessi3 proc
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
    call respondio_mal      ;(en art.asm)
    jmp pregunta4

    ;respondio bien
    pre3opcion1:
    call respondio_bien     ;(en art.asm)
    jmp pregunta4 

    ;respondio mal
    pre3opcion2:
    call respondio_mal      ;(en art.asm)
    jmp pregunta4
  
    ;respondio mal
    pre3opcion3:
    call respondio_mal      ;(en art.asm)
    jmp pregunta4

    pregunta4:

    ret
respMessi3 endp

respMessi4 proc
    push ax
	push bx
	push cx
	push dx
	push si
	push di
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
    call respondio_mal      ;(en art.asm)
    jmp pregunta5

    ;respondio bien
    pre4opcion1:
    call respondio_bien     ;(en art.asm)
    jmp pregunta5 

    ;respondio mal
    pre4opcion2:
    call respondio_mal      ;(en art.asm)
    jmp pregunta5
  
    ;respondio mal
    pre4opcion3:
    call respondio_mal      ;(en art.asm)
    jmp pregunta5

    ;respondio mal
    pre4opcion4:
    call respondio_mal      ;(en art.asm)
    jmp pregunta5

    ;respondio mal
    pre4opcion5:
    call respondio_mal      ;(en art.asm)
    jmp pregunta5

    pregunta5:
    pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
    ret
respMessi4 endp

respMessi5 proc
    push ax
	push bx
	push cx
	push dx
	push si
	push di
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
    call respondio_mal      ;(en art.asm)
    jmp pregunta6

    ;respondio mal
    pre5opcion1:
    call respondio_mal      ;(en art.asm)
    jmp pregunta6

    ;respondio bien
    pre5opcion2:
    call respondio_bien     ;(en art.asm)
    jmp pregunta6 

    pregunta6:
    pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
    ret
respMessi5 endp

respMessi6 proc
    push ax
	push bx
	push cx
	push dx
	push si
	push di
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
    je pre6opcion3
    cmp al,99
    je pre6opcion3

    ;respondio mal
    call respondio_mal      ;(en art.asm)
    jmp pregunta7

    ;respondio mal
    pre6opcion1:
    call respondio_mal      ;(en art.asm)
    jmp pregunta7 

    ;respondio mal
    pre6opcion2:
    call respondio_mal      ;(en art.asm)
    jmp pregunta7
  
    ;respondio mal
    pre6opcion3:
    call respondio_bien     ;(en art.asm)
    jmp pregunta7

    pregunta7:
    pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
    ret
respMessi6 endp

respMessi7 proc
    push ax
	push bx
	push cx
	push dx
	push si
	push di
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
    call lossSnd        ;(en lib.asm)
    jmp final

    ;respondio mal
    pre7opcion1:
    call lossSnd        ;(en lib.asm)
    jmp final 

    ;respondio mal
    pre7opcion2:
    call lossSnd        ;(en lib.asm)
    jmp final
  
    ;respondio bien
    pre7opcion3:
    call winSnd     ;(en lib.asm)
    jmp final

    ;respondio mal
    pre7opcion4:
    call lossSnd        ;(en lib.asm)
    jmp final

    ;respondio mal
    pre7opcion5:
    call lossSnd        ;(en lib.asm)
    jmp final

    final:
    pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
    ret
respMessi7 endp

respRonal1 proc
    push ax
    push bx
    push cx
    push dx
    push si
    push di
    mov bx,0
    cmp al,65
    je pre01opcion1
    cmp al,97
    je pre01opcion1
    cmp al,66
    je pre01opcion2
    cmp al,98
    je pre01opcion2

    ;respondio mal
    call respondio_mal      ;(en art.asm)
    jmp pregunta02

    ;respondio bien
    pre01opcion1:
    call respondio_bien     ;(en art.asm)
    jmp pregunta02

    ;respondio mal
    pre01opcion2:
    call respondio_mal      ;(en art.asm)
    jmp pregunta02

    pregunta02:
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret   
respRonal1 endp

respRonal2 proc
    push ax
    push bx
    push cx
    push dx
    push si
    push di
    mov bx,1
    cmp al,65
    je pre02opcion1
    cmp al,97
    je pre02opcion1
    cmp al,66
    je pre02opcion2
    cmp al,98
    je pre02opcion2
    cmp al,67
    je pre02opcion2
    cmp al,99
    je pre02opcion2

    ;respondio mal
    call respondio_mal      ;(en art.asm)
    jmp pregunta03

    ;respondio bien
    pre02opcion1:
    call respondio_bien     ;(en art.asm)
    jmp pregunta03 

    ;respondio mal
    pre02opcion2:
    call respondio_mal      ;(en art.asm)
    jmp pregunta03
  
    ;respondio mal
    pre02opcion3:
    call respondio_mal      ;(en art.asm)
    jmp pregunta03 

    pregunta03:
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
respRonal2 endp

respRonal3 proc
    push ax
    push bx
    push cx
    push dx
    push si
    push di
    mov bx,2
    cmp al,65
    je pre03opcion1
    cmp al,97
    je pre03opcion1
    cmp al,66
    je pre03opcion2
    cmp al,98
    je pre03opcion2
    cmp al,67
    je pre03opcion2
    cmp al,99
    je pre03opcion2

    ;respondio mal
    call respondio_mal      ;(en art.asm)
    jmp pregunta04

    ;respondio bien
    pre03opcion1:
    call respondio_bien     ;(en art.asm)
    jmp pregunta04 

    ;respondio mal
    pre03opcion2:
    call respondio_mal      ;(en art.asm)
    jmp pregunta04
  
    ;respondio mal
    pre03opcion3:
    call respondio_mal      ;(en art.asm)
    jmp pregunta04

    pregunta04:
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
respRonal3 endp

respRonal4 proc
    push ax
    push bx
    push cx
    push dx
    push si
    push di
    mov bx,3
    cmp al,65
    je pre04opcion1
    cmp al,97
    je pre04opcion1
    cmp al,66
    je pre04opcion2
    cmp al,98
    je pre04opcion2
    cmp al,67   
    je pre04opcion3
    cmp al,99
    je pre04opcion3
    cmp al,68
    je pre04opcion4
    cmp al,100
    je pre04opcion4
    cmp al,69
    je pre04opcion5
    cmp al,101
    je pre04opcion5

    ;respondio mal
    call respondio_mal      ;(en art.asm)
    jmp pregunta05

    ;respondio mal
    pre04opcion1:
    call respondio_mal      ;(en art.asm)
    jmp pregunta05 

    ;respondio bien
    pre04opcion2:
    call respondio_bien     ;(en art.asm)
    jmp pregunta05
  
    ;respondio mal
    pre04opcion3:
    call respondio_mal      ;(en art.asm)
    jmp pregunta05

    ;respondio mal
    pre04opcion4:
    call respondio_mal      ;(en art.asm)
    jmp pregunta05

    ;respondio mal
    pre04opcion5:
    call respondio_mal      ;(en art.asm)
    jmp pregunta05

    pregunta05:
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
respRonal4 endp

respRonal5 proc
    push ax
    push bx
    push cx
    push dx
    push si
    push di
    mov bx,4
    cmp al,65
    je pre05opcion1
    cmp al,97
    je pre05opcion1
    cmp al,66
    je pre05opcion2
    cmp al,98
    je pre05opcion2

    ;respondio mal
    call respondio_mal      ;(en art.asm)
    jmp pregunta06

    ;respondio bien
    pre05opcion1:
    call respondio_bien     ;(en art.asm)
    jmp pregunta06

    ;respondio mal
    pre05opcion2:
    call respondio_mal      ;(en art.asm)
    jmp pregunta06 

    pregunta06:
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
respRonal5 endp

respRonal6 proc
    push ax
	push bx
	push cx
	push dx
	push si
	push di

    mov bx,5
    cmp al,65
    je pre06opcion1
    cmp al,97
    je pre06opcion1
    cmp al,66
    je pre06opcion2
    cmp al,98
    je pre06opcion2
    cmp al,67
    je pre06opcion3
    cmp al,99
    je pre06opcion3

    ;respondio mal
    call respondio_mal      ;(en art.asm)
    jmp pregunta07

    ;respondio bien
    pre06opcion1:
    call respondio_bien     ;(en art.asm)
    jmp pregunta07 

    ;respondio mal
    pre06opcion2:
    call respondio_mal      ;(en art.asm)
    jmp pregunta07
  
    ;respondio mal
    pre06opcion3:
    call respondio_mal      ;(en art.asm)
    jmp pregunta07

    pregunta07:
    pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
    ret
respRonal6 endp

respRonal7 proc
    push ax
	push bx
	push cx
	push dx
	push si
	push di

    mov bx,6
    cmp al,65
    je pre07opcion1
    cmp al,97
    je pre07opcion1
    cmp al,66
    je pre07opcion2
    cmp al,98
    je pre07opcion2
    cmp al,67
    je pre07opcion3
    cmp al,99
    je pre07opcion3
    cmp al,68
    je pre07opcion4
    cmp al,100
    je pre07opcion4
    cmp al,69
    je pre07opcion5
    cmp al,101
    je pre07opcion5

    ;respondio mal
    call lossSnd        ;(en lib.asm)
    jmp final0

    ;respondio mal
    pre07opcion1:
    call lossSnd        ;(en lib.asm)
    jmp final0

    ;respondio mal
    pre07opcion2:
    call lossSnd        ;(en lib.asm)
    jmp final0
  
    ;respondio mal
    pre07opcion3:
    call lossSnd        ;(en lib.asm)
    jmp final0

    ;respondio mal
    pre07opcion4:
    call lossSnd        ;(en lib.asm)
    jmp final0

    ;respondio bien
    pre07opcion5:
    call winSnd         ;(en lib.asm)
    jmp final0

    final0:
    pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
    ret 2
respRonal7 endp

respLebron1 proc
    push ax
	push bx
	push cx
	push dx
	push si
	push di
    mov bx,0
    cmp al,65
    je pre11opcion1
    cmp al,97
    je pre11opcion1
    cmp al,66
    je pre11opcion2
    cmp al,98
    je pre11opcion2

    ;respondio mal
    call respondio_mal      ;(en art.asm)
    jmp pregunta12

    ;respondio bien
    pre11opcion1:
    call respondio_bien     ;(en art.asm)
    jmp pregunta12

    ;respondio mal
    pre11opcion2:
    call respondio_mal      ;(en art.asm)
    jmp pregunta12

    pregunta12:
    pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
    ret 
respLebron1 endp

respLebron2 proc
    push ax
	push bx
	push cx
	push dx
	push si
	push di
    mov bx,1
    cmp al,65
    je pre12opcion1
    cmp al,97
    je pre12opcion1
    cmp al,66
    je pre12opcion2
    cmp al,98
    je pre12opcion2
    cmp al,67
    je pre12opcion2
    cmp al,99
    je pre12opcion2

    ;respondio mal
    call respondio_mal      ;(en art.asm)
    jmp pregunta13

    ;respondio bien
    pre12opcion1:
    call respondio_bien     ;(en art.asm)
    jmp pregunta13 

    ;respondio mal
    pre12opcion2:
    call respondio_mal      ;(en art.asm)
    jmp pregunta13
  
    ;respondio mal
    pre12opcion3:
    call respondio_mal      ;(en art.asm)
    jmp pregunta13 

    pregunta13:
    pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
    ret 
respLebron2 endp

respLebron3 proc
    push ax
	push bx
	push cx
	push dx
	push si
	push di
    mov bx,2
    cmp al,65
    je pre13opcion1
    cmp al,97
    je pre13opcion1
    cmp al,66
    je pre13opcion2
    cmp al,98
    je pre13opcion2
    cmp al,67
    je pre13opcion2
    cmp al,99
    je pre13opcion2

    ;respondio mal
    call respondio_mal      ;(en art.asm)
    jmp pregunta14

    ;respondio mal
    pre13opcion1:
    call respondio_mal      ;(en art.asm)
    jmp pregunta14 

    ;respondio bien
    pre13opcion2:
    call respondio_bien     ;(en art.asm)
    jmp pregunta14
  
    ;respondio mal
    pre13opcion3:
    call respondio_mal      ;(en art.asm)
    jmp pregunta14

    pregunta14:
    pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
    ret 
respLebron3 endp

respLebron4 proc
    push ax
	push bx
	push cx
	push dx
	push si
	push di
    mov bx,3
    cmp al,65
    je pre14opcion1
    cmp al,97
    je pre14opcion1
    cmp al,66
    je pre14opcion2
    cmp al,98
    je pre14opcion2
    cmp al,67   
    je pre14opcion3
    cmp al,99
    je pre14opcion3
    cmp al,68
    je pre14opcion4
    cmp al,100
    je pre14opcion4
    cmp al,69
    je pre14opcion5
    cmp al,101
    je pre14opcion5

    ;respondio mal
    call respondio_mal      ;(en art.asm)
    jmp pregunta15

    ;respondio mal
    pre14opcion1:
    call respondio_mal      ;(en art.asm)
    jmp pregunta15 

    ;respondio mal
    pre14opcion2:
    call respondio_mal      ;(en art.asm)
    jmp pregunta15
  
    ;respondio mal
    pre14opcion3:
    call respondio_mal      ;(en art.asm)
    jmp pregunta15

    ;respondio mal
    pre14opcion4:
    call respondio_mal      ;(en art.asm)
    jmp pregunta15

    ;respondio bien
    pre14opcion5:
    call respondio_bien     ;(en art.asm)
    jmp pregunta15

    pregunta15:
    pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
    ret 
respLebron4 endp

respLebron5 proc
    push ax
	push bx
	push cx
	push dx
	push si
	push di
    mov bx,4
    cmp al,65
    je pre15opcion1
    cmp al,97
    je pre15opcion1
    cmp al,66
    je pre15opcion2
    cmp al,98
    je pre15opcion2

    ;respondio mal
    call respondio_mal      ;(en art.asm)
    jmp pregunta16

    ;respondio mal
    pre15opcion1:
    call respondio_mal      ;(en art.asm)
    jmp pregunta16

    ;respondio bien
    pre15opcion2:
    call respondio_bien     ;(en art.asm)
    jmp pregunta16 

    pregunta16:
    pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
    ret 
respLebron5 endp

respLebron6 proc
    push ax
	push bx
	push cx
	push dx
	push si
	push di
    mov bx,5
    cmp al,65
    je pre16opcion1
    cmp al,97
    je pre16opcion1
    cmp al,66
    je pre16opcion2
    cmp al,98
    je pre16opcion2
    cmp al,67
    je pre16opcion3
    cmp al,99
    je pre16opcion3

    ;respondio mal
    call respondio_mal      ;(en art.asm)
    jmp pregunta17

    ;respondio mal
    pre16opcion1:
    call respondio_mal      ;(en art.asm)
    jmp pregunta17 

    ;respondio bien
    pre16opcion2:
    call respondio_bien     ;(en art.asm)
    jmp pregunta17
  
    ;respondio mal
    pre16opcion3:
    call respondio_mal      ;(en art.asm)
    jmp pregunta17

    pregunta17:
    pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
    ret 
respLebron6 endp

respLebron7 proc

    mov bx,6
    cmp al,65
    je pre17opcion1
    cmp al,97
    je pre17opcion1
    cmp al,66
    je pre17opcion2
    cmp al,98
    je pre17opcion2
    cmp al,67
    je pre17opcion3
    cmp al,99
    je pre17opcion3
    cmp al,68
    je pre17opcion4
    cmp al,100
    je pre17opcion4
    cmp al,69
    je pre17opcion5
    cmp al,101
    je pre17opcion5

    ;respondio mal
    call lossSnd        ;(en lib.asm)
    jmp final1

    ;respondio mal
    pre17opcion1:
    call lossSnd        ;(en lib.asm)
    jmp final1

    ;respondio bien
    pre17opcion2:
    call winSnd     ;(en lib.asm)
    jmp final1
  
    ;respondio mal
    pre17opcion3:
    call lossSnd        ;(en lib.asm)
    jmp final1

    ;respondio mal
    pre17opcion4:
    call lossSnd        ;(en lib.asm)
    jmp final1

    ;respondio mal
    pre17opcion5:
    call lossSnd        ;(en lib.asm)
    jmp final1

    final1:
    ret 
respLebron7 endp

end         