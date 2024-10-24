os_get_api_version:
	mov al, NOS_API_VER
	ret

os_pause:
	pusha

	mov bx, ax

	mov cx, 1h
	mov dx, 86A0h
	mov ax, 0
	mov ah, 86h

.loop:
	int 15h
	dec bx
	jne .loop

	popa
	ret

os_fatal_error:
	mov bx, ax			

	mov dh, 0
	mov dl, 0
	call os_move_cursor

	pusha
	mov ah, 09h			
	mov bh, 0
	mov cx, 240
	mov bl, 01001111b
	mov al, ' '
	int 10h
	popa

	mov dh, 0
	mov dl, 0
	call os_move_cursor

	mov si, .msg_inform		; Inform of fatal error
	call os_print_string

	mov si, bx			; Program-supplied error message
	call os_print_string

	jmp $				; Halt execution

	
	.msg_inform		db '>>> FATAL OPERATING SYSTEM ERROR', 13, 10, 0


; ==================================================================

