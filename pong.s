	.file	"pong.c"
	.intel_syntax noprefix
	.text
.globl cbool
	.type	cbool, @function
cbool:
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	mov	eax, DWORD PTR [ebp+8]
	mov	BYTE PTR [ebp-4], al
	cmp	BYTE PTR [ebp-4], 0
	je	.L2
	mov	eax, 0
	jmp	.L3
.L2:
	mov	eax, 1
.L3:
	mov	BYTE PTR [ebp-4], al
	movzx	eax, BYTE PTR [ebp-4]
	leave
	ret
	.size	cbool, .-cbool
	.section	.rodata
	.align 4
.LC0:
	.string	"          oooooooooo                                   "
	.align 4
.LC1:
	.string	"          888    888  ooooooo  oo oooooo     oooooooo8 "
	.align 4
.LC2:
	.string	"          888oooo88 888     888 888   888  888    88o  "
	.align 4
.LC3:
	.string	"          888       888     888 888   888   888oo888o  "
	.align 4
.LC4:
	.string	"         o888o        88ooo88  o888o o888o 888     888 "
	.align 4
.LC5:
	.string	"                                            888ooo888  "
	.align 4
.LC6:
	.string	"Hecho por Tito ,cualquier sugerencia vicente.bolea@gmail.com"
	.align 4
.LC7:
	.string	"Jugador1 tus controles son 'a' y 'q'"
	.align 4
.LC8:
	.string	"Jugador2 tus controles son las flechas del teclado"
.LC9:
	.string	"Pulse ENTER para empezar"
.LC10:
	.string	"sleep 0.001"
	.align 4
.LC11:
	.string	"El Juego esta en pausa, pulse ENTER para renaudar"
.LC12:
	.string	"|"
.LC13:
	.string	"o"
.LC14:
	.string	"Jugador1 : %i"
.LC15:
	.string	"%i : Jugador2"
.LC16:
	.string	"tiempo: %i"
.LC17:
	.string	"PINGPONG"
.LC18:
	.string	"Byee!!!"
.LC19:
	.string	"sleep 1"
	.text
.globl main
	.type	main, @function
main:
	push	ebp
	mov	ebp, esp
	and	esp, -16
	push	ebx
	sub	esp, 124
	mov	DWORD PTR [esp+100], 0
	mov	BYTE PTR [esp+111], 0
	mov	BYTE PTR [esp+110], 1
	mov	BYTE PTR [esp+109], 1
	call	initscr
	call	start_color
	mov	eax, DWORD PTR stdscr
	mov	DWORD PTR [esp+4], 1
	mov	DWORD PTR [esp], eax
	call	keypad
	call	noecho
	mov	DWORD PTR [esp], 0
	call	curs_set
	mov	eax, DWORD PTR stdscr
	mov	DWORD PTR [esp+4], 0
	mov	DWORD PTR [esp], eax
	call	nodelay
	mov	eax, DWORD PTR stdscr
	test	eax, eax
	je	.L6
	mov	eax, DWORD PTR stdscr
	movzx	eax, WORD PTR [eax+4]
	cwde
	add	eax, 1
	jmp	.L7
.L6:
	mov	eax, -1
.L7:
	mov	DWORD PTR [esp+56], eax
	mov	eax, DWORD PTR stdscr
	test	eax, eax
	je	.L8
	mov	eax, DWORD PTR stdscr
	movzx	eax, WORD PTR [eax+6]
	cwde
	add	eax, 1
	jmp	.L9
.L8:
	mov	eax, -1
.L9:
	mov	DWORD PTR [esp+52], eax
	mov	eax, DWORD PTR [esp+52]
	sub	eax, 2
	mov	DWORD PTR [esp+88], eax
	mov	DWORD PTR [esp+76], 1
	mov	eax, DWORD PTR [esp+56]
	mov	edx, eax
	shr	edx, 31
	lea	eax, [edx+eax]
	sar	eax
	mov	DWORD PTR [esp+92], eax
	mov	eax, DWORD PTR [esp+56]
	mov	edx, eax
	shr	edx, 31
	lea	eax, [edx+eax]
	sar	eax
	mov	DWORD PTR [esp+80], eax
	mov	DWORD PTR [esp+96], 0
	mov	DWORD PTR [esp+84], 0
	mov	DWORD PTR [esp+8], OFFSET FLAT:.LC0
	mov	DWORD PTR [esp+4], 5
	mov	DWORD PTR [esp], 4
	call	mvprintw
	mov	DWORD PTR [esp+8], OFFSET FLAT:.LC1
	mov	DWORD PTR [esp+4], 5
	mov	DWORD PTR [esp], 5
	call	mvprintw
	mov	DWORD PTR [esp+8], OFFSET FLAT:.LC2
	mov	DWORD PTR [esp+4], 5
	mov	DWORD PTR [esp], 6
	call	mvprintw
	mov	DWORD PTR [esp+8], OFFSET FLAT:.LC3
	mov	DWORD PTR [esp+4], 5
	mov	DWORD PTR [esp], 7
	call	mvprintw
	mov	DWORD PTR [esp+8], OFFSET FLAT:.LC4
	mov	DWORD PTR [esp+4], 5
	mov	DWORD PTR [esp], 8
	call	mvprintw
	mov	DWORD PTR [esp+8], OFFSET FLAT:.LC5
	mov	DWORD PTR [esp+4], 5
	mov	DWORD PTR [esp], 9
	call	mvprintw
	mov	DWORD PTR [esp+8], OFFSET FLAT:.LC6
	mov	DWORD PTR [esp+4], 5
	mov	DWORD PTR [esp], 11
	call	mvprintw
	mov	eax, DWORD PTR stdscr
	mov	DWORD PTR [esp], eax
	call	wgetch
	mov	eax, DWORD PTR stdscr
	mov	DWORD PTR [esp], eax
	call	werase
	mov	ecx, DWORD PTR [esp+52]
	mov	edx, 1431655766
	mov	eax, ecx
	imul	edx
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	eax, DWORD PTR [esp+56]
	mov	ecx, eax
	shr	ecx, 31
	lea	eax, [ecx+eax]
	sar	eax
	mov	DWORD PTR [esp+8], OFFSET FLAT:.LC7
	mov	DWORD PTR [esp+4], edx
	mov	DWORD PTR [esp], eax
	call	mvprintw
	mov	ecx, DWORD PTR [esp+52]
	mov	edx, 1431655766
	mov	eax, ecx
	imul	edx
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	eax, DWORD PTR [esp+56]
	mov	ecx, eax
	shr	ecx, 31
	lea	eax, [ecx+eax]
	sar	eax
	add	eax, 1
	mov	DWORD PTR [esp+8], OFFSET FLAT:.LC8
	mov	DWORD PTR [esp+4], edx
	mov	DWORD PTR [esp], eax
	call	mvprintw
	mov	ecx, DWORD PTR [esp+52]
	mov	edx, 1431655766
	mov	eax, ecx
	imul	edx
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	eax, DWORD PTR [esp+56]
	mov	ecx, eax
	shr	ecx, 31
	lea	eax, [ecx+eax]
	sar	eax
	add	eax, 2
	mov	DWORD PTR [esp+8], OFFSET FLAT:.LC9
	mov	DWORD PTR [esp+4], edx
	mov	DWORD PTR [esp], eax
	call	mvprintw
	mov	eax, DWORD PTR stdscr
	mov	DWORD PTR [esp], eax
	call	wgetch
	mov	eax, DWORD PTR stdscr
	mov	DWORD PTR [esp+4], 1
	mov	DWORD PTR [esp], eax
	call	nodelay
	mov	DWORD PTR [esp+8], 0
	mov	DWORD PTR [esp+4], 1
	mov	DWORD PTR [esp], 1
	call	init_pair
	mov	DWORD PTR [esp+8], 0
	mov	DWORD PTR [esp+4], 4
	mov	DWORD PTR [esp], 2
	call	init_pair
	mov	DWORD PTR [esp+8], 0
	mov	DWORD PTR [esp+4], 7
	mov	DWORD PTR [esp], 3
	call	init_pair
	jmp	.L10
.L40:
	add	DWORD PTR [esp+100], 1
	mov	DWORD PTR [esp], OFFSET FLAT:.LC10
	call	system
	mov	eax, DWORD PTR [esp+100]
	and	eax, 15
	test	eax, eax
	jne	.L11
	mov	eax, DWORD PTR [esp+68]
	mov	edx, DWORD PTR [esp+56]
	sub	edx, 1
	cmp	eax, edx
	je	.L12
	mov	eax, DWORD PTR [esp+68]
	cmp	eax, 1
	jne	.L13
.L12:
	movzx	eax, BYTE PTR [esp+109]
	mov	DWORD PTR [esp], eax
	call	cbool
	mov	BYTE PTR [esp+109], al
.L13:
	mov	eax, DWORD PTR [esp+64]
	mov	edx, DWORD PTR [esp+52]
	sub	edx, 2
	cmp	eax, edx
	je	.L14
	mov	eax, DWORD PTR [esp+64]
	cmp	eax, 2
	jne	.L15
.L14:
	mov	edx, DWORD PTR [esp+68]
	mov	eax, DWORD PTR [esp+92]
	cmp	edx, eax
	je	.L16
	mov	eax, DWORD PTR [esp+68]
	mov	edx, DWORD PTR [esp+92]
	add	edx, 1
	cmp	eax, edx
	je	.L16
	mov	eax, DWORD PTR [esp+68]
	mov	edx, DWORD PTR [esp+92]
	sub	edx, 1
	cmp	eax, edx
	je	.L16
	mov	edx, DWORD PTR [esp+68]
	mov	eax, DWORD PTR [esp+80]
	cmp	edx, eax
	je	.L16
	mov	eax, DWORD PTR [esp+68]
	mov	edx, DWORD PTR [esp+80]
	sub	edx, 1
	cmp	eax, edx
	je	.L16
	mov	eax, DWORD PTR [esp+68]
	mov	edx, DWORD PTR [esp+80]
	add	edx, 1
	cmp	eax, edx
	jne	.L15
.L16:
	movzx	eax, BYTE PTR [esp+110]
	mov	DWORD PTR [esp], eax
	call	cbool
	mov	BYTE PTR [esp+110], al
	mov	eax, DWORD PTR [esp+68]
	mov	edx, DWORD PTR [esp+92]
	sub	edx, 1
	cmp	eax, edx
	je	.L17
	mov	eax, DWORD PTR [esp+68]
	mov	edx, DWORD PTR [esp+80]
	sub	edx, 1
	cmp	eax, edx
	jne	.L18
.L17:
	mov	BYTE PTR [esp+109], 0
.L18:
	mov	eax, DWORD PTR [esp+68]
	mov	edx, DWORD PTR [esp+92]
	add	edx, 1
	cmp	eax, edx
	je	.L19
	mov	eax, DWORD PTR [esp+68]
	mov	edx, DWORD PTR [esp+80]
	add	edx, 1
	cmp	eax, edx
	jne	.L15
.L19:
	mov	BYTE PTR [esp+109], 1
.L15:
	mov	edx, DWORD PTR [esp+64]
	mov	eax, DWORD PTR [esp+52]
	cmp	edx, eax
	je	.L10
	mov	eax, DWORD PTR [esp+64]
	cmp	eax, 1
	jg	.L20
.L10:
	mov	eax, DWORD PTR [esp+64]
	cmp	eax, 1
	jg	.L21
	mov	eax, DWORD PTR [esp+96]
	add	eax, 1
	jmp	.L22
.L21:
	mov	eax, DWORD PTR [esp+96]
.L22:
	mov	DWORD PTR [esp+96], eax
	mov	edx, DWORD PTR [esp+64]
	mov	eax, DWORD PTR [esp+52]
	cmp	edx, eax
	jl	.L23
	mov	eax, DWORD PTR [esp+84]
	add	eax, 1
	jmp	.L24
.L23:
	mov	eax, DWORD PTR [esp+84]
.L24:
	mov	DWORD PTR [esp+84], eax
	mov	eax, DWORD PTR [esp+56]
	mov	edx, eax
	shr	edx, 31
	lea	eax, [edx+eax]
	sar	eax
	mov	DWORD PTR [esp+68], eax
	mov	eax, DWORD PTR [esp+52]
	mov	edx, eax
	shr	edx, 31
	lea	eax, [edx+eax]
	sar	eax
	mov	DWORD PTR [esp+64], eax
	movzx	eax, BYTE PTR [esp+109]
	mov	DWORD PTR [esp], eax
	call	cbool
	mov	BYTE PTR [esp+109], al
	movzx	eax, BYTE PTR [esp+110]
	mov	DWORD PTR [esp], eax
	call	cbool
	mov	BYTE PTR [esp+110], al
.L20:
	cmp	BYTE PTR [esp+110], 0
	je	.L25
	mov	eax, DWORD PTR [esp+64]
	add	eax, 1
	jmp	.L26
.L25:
	mov	eax, DWORD PTR [esp+64]
	sub	eax, 1
.L26:
	mov	DWORD PTR [esp+64], eax
	cmp	BYTE PTR [esp+109], 0
	je	.L27
	mov	eax, DWORD PTR [esp+68]
	add	eax, 1
	jmp	.L28
.L27:
	mov	eax, DWORD PTR [esp+68]
	sub	eax, 1
.L28:
	mov	DWORD PTR [esp+68], eax
	mov	eax, DWORD PTR [esp+92]
	cmp	eax, 1
	jg	.L29
	mov	eax, DWORD PTR [esp+56]
	sub	eax, 2
	mov	DWORD PTR [esp+92], eax
.L29:
	mov	eax, DWORD PTR [esp+92]
	mov	edx, DWORD PTR [esp+56]
	sub	edx, 1
	cmp	eax, edx
	jl	.L30
	mov	DWORD PTR [esp+92], 2
.L30:
	mov	eax, DWORD PTR [esp+80]
	cmp	eax, 1
	jg	.L31
	mov	eax, DWORD PTR [esp+56]
	sub	eax, 2
	mov	DWORD PTR [esp+80], eax
.L31:
	mov	eax, DWORD PTR [esp+80]
	mov	edx, DWORD PTR [esp+56]
	sub	edx, 1
	cmp	eax, edx
	jl	.L11
	mov	DWORD PTR [esp+80], 2
.L11:
	mov	eax, DWORD PTR stdin
	mov	DWORD PTR [esp], eax
	call	fflush
	mov	eax, DWORD PTR stdscr
	mov	DWORD PTR [esp], eax
	call	wgetch
	mov	DWORD PTR [esp+104], eax
	mov	eax, DWORD PTR [esp+104]
	cmp	eax, 112
	je	.L35
	cmp	eax, 112
	jg	.L39
	cmp	eax, 27
	je	.L33
	cmp	eax, 97
	je	.L34
	jmp	.L32
.L39:
	cmp	eax, 258
	je	.L37
	cmp	eax, 259
	je	.L38
	cmp	eax, 113
	je	.L36
	jmp	.L32
.L37:
	mov	eax, DWORD PTR [esp+92]
	add	eax, 1
	mov	DWORD PTR [esp+92], eax
	jmp	.L32
.L38:
	mov	eax, DWORD PTR [esp+92]
	sub	eax, 1
	mov	DWORD PTR [esp+92], eax
	jmp	.L32
.L36:
	mov	eax, DWORD PTR [esp+80]
	sub	eax, 1
	mov	DWORD PTR [esp+80], eax
	jmp	.L32
.L34:
	mov	eax, DWORD PTR [esp+80]
	add	eax, 1
	mov	DWORD PTR [esp+80], eax
	jmp	.L32
.L35:
	mov	eax, DWORD PTR stdscr
	mov	DWORD PTR [esp+4], 0
	mov	DWORD PTR [esp], eax
	call	nodelay
	mov	eax, DWORD PTR [esp+52]
	mov	edx, eax
	sar	edx, 31
	shr	edx, 30
	lea	eax, [edx+eax]
	sar	eax, 2
	mov	edx, eax
	mov	eax, DWORD PTR [esp+56]
	mov	ecx, eax
	shr	ecx, 31
	lea	eax, [ecx+eax]
	sar	eax
	mov	DWORD PTR [esp+8], OFFSET FLAT:.LC11
	mov	DWORD PTR [esp+4], edx
	mov	DWORD PTR [esp], eax
	call	mvprintw
	mov	eax, DWORD PTR stdscr
	mov	DWORD PTR [esp], eax
	call	wgetch
	mov	eax, DWORD PTR stdscr
	mov	DWORD PTR [esp+4], 1
	mov	DWORD PTR [esp], eax
	call	nodelay
	jmp	.L32
.L33:
	mov	BYTE PTR [esp+111], 1
.L32:
	mov	eax, DWORD PTR stdscr
	mov	DWORD PTR [esp], eax
	call	werase
	mov	eax, DWORD PTR stdscr
	mov	DWORD PTR [esp+8], 0
	mov	DWORD PTR [esp+4], 768
	mov	DWORD PTR [esp], eax
	call	wattr_on
	mov	eax, DWORD PTR [esp+88]
	mov	edx, DWORD PTR [esp+92]
	sub	edx, 1
	mov	DWORD PTR [esp+8], OFFSET FLAT:.LC12
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], edx
	call	mvprintw
	mov	edx, DWORD PTR [esp+88]
	mov	eax, DWORD PTR [esp+92]
	mov	DWORD PTR [esp+8], OFFSET FLAT:.LC12
	mov	DWORD PTR [esp+4], edx
	mov	DWORD PTR [esp], eax
	call	mvprintw
	mov	eax, DWORD PTR [esp+88]
	mov	edx, DWORD PTR [esp+92]
	add	edx, 1
	mov	DWORD PTR [esp+8], OFFSET FLAT:.LC12
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], edx
	call	mvprintw
	mov	eax, DWORD PTR [esp+76]
	mov	edx, DWORD PTR [esp+80]
	sub	edx, 1
	mov	DWORD PTR [esp+8], OFFSET FLAT:.LC12
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], edx
	call	mvprintw
	mov	edx, DWORD PTR [esp+76]
	mov	eax, DWORD PTR [esp+80]
	mov	DWORD PTR [esp+8], OFFSET FLAT:.LC12
	mov	DWORD PTR [esp+4], edx
	mov	DWORD PTR [esp], eax
	call	mvprintw
	mov	eax, DWORD PTR [esp+76]
	mov	edx, DWORD PTR [esp+80]
	add	edx, 1
	mov	DWORD PTR [esp+8], OFFSET FLAT:.LC12
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], edx
	call	mvprintw
	mov	eax, DWORD PTR stdscr
	mov	DWORD PTR [esp+8], 0
	mov	DWORD PTR [esp+4], 768
	mov	DWORD PTR [esp], eax
	call	wattr_off
	mov	eax, DWORD PTR stdscr
	mov	DWORD PTR [esp+8], 0
	mov	DWORD PTR [esp+4], 256
	mov	DWORD PTR [esp], eax
	call	wattr_on
	mov	edx, DWORD PTR [esp+64]
	mov	eax, DWORD PTR [esp+68]
	mov	DWORD PTR [esp+8], OFFSET FLAT:.LC13
	mov	DWORD PTR [esp+4], edx
	mov	DWORD PTR [esp], eax
	call	mvprintw
	mov	eax, DWORD PTR stdscr
	mov	DWORD PTR [esp+8], 0
	mov	DWORD PTR [esp+4], 256
	mov	DWORD PTR [esp], eax
	call	wattr_off
	mov	eax, DWORD PTR stdscr
	mov	DWORD PTR [esp+32], 0
	mov	DWORD PTR [esp+28], 0
	mov	DWORD PTR [esp+24], 0
	mov	DWORD PTR [esp+20], 0
	mov	DWORD PTR [esp+16], 0
	mov	DWORD PTR [esp+12], 0
	mov	DWORD PTR [esp+8], 0
	mov	DWORD PTR [esp+4], 0
	mov	DWORD PTR [esp], eax
	call	wborder
	mov	ebx, DWORD PTR [esp+96]
	mov	ecx, DWORD PTR [esp+52]
	mov	edx, 715827883
	mov	eax, ecx
	imul	edx
	mov	eax, ecx
	sar	eax, 31
	mov	ecx, edx
	sub	ecx, eax
	mov	eax, ecx
	mov	DWORD PTR [esp+12], ebx
	mov	DWORD PTR [esp+8], OFFSET FLAT:.LC14
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], 2
	call	mvprintw
	mov	ebx, DWORD PTR [esp+84]
	mov	eax, DWORD PTR [esp+52]
	lea	ecx, [0+eax*4]
	mov	edx, 1717986919
	mov	eax, ecx
	imul	edx
	sar	edx
	mov	eax, ecx
	sar	eax, 31
	mov	ecx, edx
	sub	ecx, eax
	mov	eax, ecx
	mov	DWORD PTR [esp+12], ebx
	mov	DWORD PTR [esp+8], OFFSET FLAT:.LC15
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], 2
	call	mvprintw
	mov	eax, DWORD PTR [esp+100]
	mov	edx, eax
	sar	edx, 31
	shr	edx, 29
	lea	eax, [edx+eax]
	sar	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [esp+52]
	mov	ecx, eax
	shr	ecx, 31
	lea	eax, [ecx+eax]
	sar	eax
	sub	eax, 4
	mov	DWORD PTR [esp+12], edx
	mov	DWORD PTR [esp+8], OFFSET FLAT:.LC16
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], 2
	call	mvprintw
	mov	eax, DWORD PTR stdscr
	mov	DWORD PTR [esp+8], 0
	mov	DWORD PTR [esp+4], 512
	mov	DWORD PTR [esp], eax
	call	wattr_on
	mov	eax, DWORD PTR [esp+52]
	mov	edx, eax
	shr	edx, 31
	lea	eax, [edx+eax]
	sar	eax
	lea	edx, [eax-4]
	mov	eax, DWORD PTR [esp+56]
	sub	eax, 4
	mov	DWORD PTR [esp+8], OFFSET FLAT:.LC17
	mov	DWORD PTR [esp+4], edx
	mov	DWORD PTR [esp], eax
	call	mvprintw
	mov	eax, DWORD PTR stdscr
	mov	DWORD PTR [esp+8], 0
	mov	DWORD PTR [esp+4], 512
	mov	DWORD PTR [esp], eax
	call	wattr_off
	mov	eax, DWORD PTR stdscr
	mov	DWORD PTR [esp], eax
	call	wrefresh
	mov	eax, DWORD PTR stdin
	mov	DWORD PTR [esp], eax
	call	fflush
	movzx	eax, BYTE PTR [esp+111]
	xor	eax, 1
	test	al, al
	jne	.L40
	mov	eax, DWORD PTR stdscr
	mov	DWORD PTR [esp], eax
	call	werase
	mov	DWORD PTR [esp+8], OFFSET FLAT:.LC18
	mov	DWORD PTR [esp+4], 20
	mov	DWORD PTR [esp], 4
	call	mvprintw
	mov	eax, DWORD PTR stdscr
	mov	DWORD PTR [esp], eax
	call	wrefresh
	mov	eax, DWORD PTR stdscr
	mov	DWORD PTR [esp], eax
	call	wgetch
	mov	DWORD PTR [esp], OFFSET FLAT:.LC19
	call	system
	call	endwin
	add	esp, 124
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.4.3-4ubuntu5) 4.4.3"
	.section	.note.GNU-stack,"",@progbits
