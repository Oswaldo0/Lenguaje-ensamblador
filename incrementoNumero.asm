;Programa para incrementar un número
global _main
extern _printf
extern _scanf

section .data
    n1:         dd      1                           ;Guardamos el numero 1
    prompt1:    db      "Incrementando... ",10,0    ;Guardamos el mensaje 1
    prompt2:    db      "Inicia en: ",  0           ;Guardamos el mensaje 2
    prompt3:    db      "Termina en: ", 0           ;Guardamos el mensaje 3
    formatOut   db      "%d" ,10, 0                 ;Guardamos el formato de salida
    
section .text
    _main:
          push  ebx         ;Metemos el registro EBX a la pila
          
          push  prompt1     ;Pasamos el parametro a la pila
          call  _printf     ;Llamamos la función para imprimir en pantalla
          add   esp,4       ;Dirección de retorno de la pila
          
          push  prompt2     ;Pasamos el parámetro a la pila
          call  _printf     ;Llamamos la función para imprimir en pantalla
          add   esp, 4      ;Dirección de retorno de la pila
          
          push  dword[n1]   ;Metemos el valor de n1 a la Pila Double Word
          push  formatOut   ;Pasamos el parámetro con formato de salida a la pila
          call  _printf     ;Llamamos la función para imprimir en pantalla
          add   esp,8    
          
          push  n1          ;Metemos n1 a la pila
          mov   ebx, [n1]   ;Guardamos n1 en el registro EBX
          inc   ebx         ;EBX ++ (Suma iterativa)
          inc   ebx         ;EBX ++ (Segunda suma iterativa)
          inc   ebx         ;EBX ++ [Tercera Suma iterativa)
          mov   [n1], ebx   ;Guardamos el registro EBX en n1
          
          push  prompt3     ;pasamos el parametro a la pila
          call  _printf     ; Llamamos la función para imprimir en pantalla
          add   esp,4       ;Dirección de retorno de la pila
          
          push  dword[n1]   ;Metemos el valor de la suma a la pila double word
          push  formatOut   ;Pasamos el parámetro con formato de salida a la pila
          call  _printf     ;Llamamos la funcion para imprimir en pantalla
          add   esp, 8      ;Dirección de retorno de la pila
          
          pop   ebx         ;Sacamos el registro EBX de la pila
             
ret