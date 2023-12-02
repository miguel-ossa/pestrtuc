.MODEL TINY

.CODE

IF1
.NOLIST
   INCLUDE .\mac\estruc.mac
   include .\mac\macros.mac
.LIST
ENDIF
.LALL
	 ORG   0100h

Inicio:  jmp   Entrada

cr	        equ         0dh
lf	        equ         0ah
eom         equ         '$'

_1NivelIfV    db      'ifk: nivel 1 condicion VERDADERA',cr,lf,eom
_2NivelIfV    db      'ifk: nivel 2 condicion VERDADERA',cr,lf,eom
_3NivelIfV    db      'ifk: nivel 3 condicion VERDADERA',cr,lf,eom
_1NivelIfF    db      'ifk: nivel 1 condicion FALSA',cr,lf,eom
_2NivelIfF    db      'ifk: nivel 2 condicion FALSA',cr,lf,eom
_3NivelIfF    db      'ifk: nivel 3 condicion FALSA',cr,lf,eom

_rutina1      db      'Casex: rutina 1',cr,lf,eom
_rutina2      db      'Casex: rutina 2',cr,lf,eom
_rutinae      db      'Casex: rutina e',cr,lf,eom

opcion    db    0
Mensaje3 db    'dowhilek: interaci�n',CR,LF,'$'
Mensaje4 db    'repeatk: interaci�n',CR,Lf,'$'
Mensaje5 db    'fork: interaci�n',CR,Lf,'$'

rutina1   proc    near
          mov     ah,09
	        mov     dx,offset _Rutina1
          int     21h
rutina1   endp

rutina2   proc    near
          mov     ah,09
	        mov     dx,offset _Rutina2
          int     21h
rutina2   endp

rutinae   proc    near
          mov     ah,09
	        mov     dx,offset _Rutinae
          int     21h
rutinae   endp

Entrada  PROC  NEAR

	 ; Inicializaci�n valores para ifk
	 mov   ah,02h
	 cmp   ah,02h

	 Casex    ah
	    CasexOption   %1,rutina
	    CasexOption   %2,rutina
	    CasexElse     rutinae
	 CasexEnd

	 ; Testeo de la macro ifk
;	 ifk   e
;      mov   ah,09
;	    mov   dx,offset _1NivelIfV
;      int   21h
;
;      mov   ah,01h
;	    cmp   ah,01h
;	    ifk   e
;        mov   ah,09
;        mov   dx,offset _2NivelIfV
;        int   21h
;
;	      mov   ah,01h
;	      cmp   ah,01h
;	      ifk   e
;          mov   ah,09
;	        mov   dx,offset _3NivelIfV
;          int   21h
;	      ifelse
;          mov   ah,09
;	         mov   dx,offset _3NivelIfF
;          int   21h
;	      ifend
;	    ifelse
;        mov   ah,09
;	      mov   dx,offset _2NivelIfF
;        int   21h
;	    ifend
;	 ifend


	 ; Inicializacion valores para dowhilek
;	 mov   cx,0
;	 mov   bx,5
	 ; Testeo de la macro dowhilek
;	 dowhilek cx,le,bx    ; Mientras cx sea menor o igual a bx...
	    ;
;	    mov   ah,9
;	    mov   dx,offset Mensaje3
;	    int   21h		 ; Muestra mensaje
	    ;
;	    inc   cx		 ; Incrementa contador
;	 doend

	 ; Inicializaci�n valores para repeatk
;	 mov   cx,0
;	 mov   bx,4
	 ; Testeo de la macro repeatk
;	 repeatk
	    ;
;	    mov   ah,9
;	    mov   dx,offset Mensaje4
;	    int   21h
	    ;
;	    inc   cx
;	 until cx,e,bx	   ; Repetici�n hasta que cx sea igual a bx

	 ; Testeo de la macro fork
;	 fork ax,10,50,+,10   ; Desde ax = 10 hasta 50, de 10 en 10
	    ; Salva registro
;	    push  ax
	    ;
;	    mov   ah,9
;	    mov   dx,offset Mensaje5
;	    int   21h
	    ; Recupera registro
;	    pop   ax
;	 forend
	 mov   ax,4C00h    ; Funci�n: volver al DOS
	 int   21h

Entrada  ENDP

	 END   Inicio

