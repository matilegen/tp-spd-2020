.8086
.model small
.stack 100h
.data
.code
extrn respondio_bien:proc
extrn respondio_mal:proc
extrn winSnd:proc
extrn lossSnd:proc

    public respRonaldo1
    public respRonaldo2
    public respRonaldo3
    public respRonaldo4
    public respRonaldo5
    public respRonaldo6
    public respRonaldo7

respRonaldo1 proc
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
respRonaldo1 endp

respRonaldo2 proc
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
respRonaldo2 endp

respRonaldo3 proc
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

    ret
respRonaldo3 endp

respRonaldo4 proc
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

    ;respondio bien
    pre4opcion2:
    call respondio_bien
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
    ret
respRonaldo4 endp

respRonaldo5 proc
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

    ;respondio bien
    pre5opcion1:
    call respondio_bien
    jmp pregunta6

    ;respondio mal
    pre5opcion2:
    call respondio_mal
    jmp pregunta6 

    pregunta6:

    ret
respRonaldo5 endp

respRonaldo6 proc
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

    ;respondio bien
    pre6opcion1:
    call respondio_bien
    jmp pregunta7 

    ;respondio mal
    pre6opcion2:
    call respondio_mal
    jmp pregunta7
  
    ;respondio mal
    pre6opcion3:
    call respondio_mal
    jmp pregunta7

    pregunta7:

    ret
respRonaldo6 endp

respRonaldo7 proc
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

    ;respondio mal
    pre7opcion2:
    call lossSnd
    jmp final
  
    ;respondio mal
    pre7opcion3:
    call lossSnd
    jmp final

    ;respondio mal
    pre7opcion4:
    call lossSnd
    jmp final

    ;respondio bien
    pre7opcion5:
    call winSnd
    jmp final

    final:
    ret
respRonaldo7 endp

end         