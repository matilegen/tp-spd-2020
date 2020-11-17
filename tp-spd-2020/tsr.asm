; Programa TSR que se instala en el vector de interrupciones 69h
; Limpia pantalla y posiciona cursor al inicio

.8086
.model tiny		
.code
   org 100h		

Pushreg macro
	push DS
	push AX
	push BX
	push DX
	Endm
	
Popreg macro
	pop DX
	pop BX
	pop AX
	pop DS
Endm

start:
   jmp main


Funcion PROC FAR
    Pushreg

    ;Scroll-up toda la pantalla
    mov ah, 7               
    mov al, 0               ; number of lines to scroll
    mov bh, 0               ; attribute
    mov ch, 0               ; row top
    mov cl, 0               ; col left
    mov dh, 200             ; row bottom
    mov dl, 255             ; col right
    int 10h

    ;Pocisiono cursor al inicio
    mov ah, 2           
    mov bh, 0               ;Pagina
    mov dh, 0               ;fila
    mov dl, 0               ;columna
    int 10h
    
	Popreg
    		
	iret
endp

pirulo proc

pirulo endp


DespIntXX dw 0
SegIntXX  dw 0

FinResidente LABEL BYTE	
;------------------------------------------------------------------------
; Datos a ser usados por el Instalador
;------------------------------------------------------------------------
Cartel    DB "Programa Instalado exitosamente!!!",0dh, 0ah, '$'

main:
; Se apunta todos los registros de segmentos al mismo lugar CS.
    mov ax,CS
    mov DS,ax
    mov ES,ax
	MOV SS,ax
	
	push AX
	push BX
	PUSH DX
	push ES

InstalarInt:
    mov AX,3569h        ; Obtiene la ISR que esta instalada en la interrupcion
    int 21h    
         
    mov DespIntXX,BX    
    mov SegIntXX,ES

    mov AX,2569h	; Coloca la nueva ISR en el vector de interrupciones
    mov DX,Offset Funcion 
    int 21h

MostrarCartel:
    mov dx, offset Cartel
    mov ah,9
    int 21h

DejarResidente:		
    Mov AX, (15+offset FinResidente) 	; Al sumar 15, si la ISR ocupa un solo byte, ocupar� 16 que es un par�grafo
    Shr AX, 1			; Desplazar a la drececha 4 posiciones es equivalente a dividir por 16
    Shr AX, 1
    Shr AX, 1
    Shr AX, 1			;Obtengo la cantidad de par�grafos que ocupa la ISR
    Mov DX, AX           
    Mov AX, 3100h	; AL=0 error = 0 y AH=31Aloca los par�grafos necesarios declarados en DX 
    Int 21h					; como memoria en uso para el programa residente

	pop ES
	pop DX
	pop BX
	pop AX
end start