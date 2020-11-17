.8086
.model small
.stack 100h
.data
.code
extrn respondio_bien:proc
extrn respondio_mal:proc
extrn winSnd:proc
extrn lossSnd:proc

    public respLebron1
    public respLebron2
    public respLebron3
    public respLebron4
    public respLebron5
    public respLebron6
    public respLebron7

respLebron1 proc
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

    ret   
respLebron1 endp

respLebron2 proc
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

    pregunta3:

    ret
respLebron2 endp

respLebron3 proc
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

    ;respondio mal
    pre3opcion1:
    call respondio_mal
    jmp pregunta4 

    ;respondio bien
    pre3opcion2:
    call respondio_bien
    jmp pregunta4
  
    ;respondio mal
    pre3opcion3:
    call respondio_mal
    jmp pregunta4

    pregunta4:

    ret
respLebron3 endp

respLebron4 proc
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

    ;respondio mal
    pre4opcion1:
    call respondio_mal
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

    ;respondio bien
    pre4opcion5:
    call respondio_bien
    jmp pregunta5

    pregunta5:
    ret
respLebron4 endp

respLebron5 proc
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

    ret
respLebron5 endp

respLebron6 proc
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
    call respondio_mal
    jmp pregunta7

    ;respondio mal
    pre6opcion1:
    call respondio_mal
    jmp pregunta7 

    ;respondio bien
    pre6opcion2:
    call respondio_bien
    jmp pregunta7
  
    ;respondio mal
    pre6opcion3:
    call respondio_mal
    jmp pregunta7

    pregunta7:

    ret
respLebron6 endp

respLebron7 proc
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
    call lossSnd
    jmp final

    ;respondio mal
    pre7opcion1:
    call lossSnd
    jmp final 

    ;respondio bien
    pre7opcion2:
    call winSnd
    jmp final
  
    ;respondio mal
    pre7opcion3:
    call lossSnd
    jmp final

    ;respondio mal
    pre7opcion4:
    call lossSnd
    jmp final

    ;respondio mal
    pre7opcion5:
    call lossSnd
    jmp final

    final:
    ret
respLebron7 endp

end         