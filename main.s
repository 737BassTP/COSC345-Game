	.file	"main.c"
	.text
	.def	snprintf;	.scl	3;	.type	32;	.endef
	.seh_proc	snprintf
snprintf:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	leaq	40(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rcx
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	__ms_vsnprintf
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	c_white
	.section .rdata,"dr"
	.align 4
c_white:
	.long	16777215
	.globl	c_black
	.align 4
c_black:
	.space 4
	.globl	c_gray
	.align 4
c_gray:
	.long	8421504
	.globl	c_dkgray
	.align 4
c_dkgray:
	.long	4210752
	.globl	c_ltgray
	.align 4
c_ltgray:
	.long	12632256
	.globl	c_red
	.align 4
c_red:
	.long	255
	.globl	c_orange
	.align 4
c_orange:
	.long	65408
	.globl	c_yellow
	.align 4
c_yellow:
	.long	65535
	.globl	c_lime
	.align 4
c_lime:
	.long	33023
	.globl	c_green
	.align 4
c_green:
	.long	65280
	.globl	c_blue
	.align 4
c_blue:
	.long	16711680
	.globl	c_aqua
	.align 4
c_aqua:
	.long	16776960
	.globl	c_purple
	.align 4
c_purple:
	.long	16711808
	.globl	c_fuchsia
	.align 4
c_fuchsia:
	.long	16711935
	.globl	c_rose
	.align 4
c_rose:
	.long	8388863
	.globl	glob_draw_alpha
	.data
	.align 4
glob_draw_alpha:
	.long	255
	.globl	glob_draw_colour
	.align 4
glob_draw_colour:
	.long	16777215
	.globl	glob_vk_right
	.bss
	.align 4
glob_vk_right:
	.space 4
	.globl	glob_vk_left
	.align 4
glob_vk_left:
	.space 4
	.globl	glob_vk_up
	.align 4
glob_vk_up:
	.space 4
	.globl	glob_vk_down
	.align 4
glob_vk_down:
	.space 4
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Unable to clear the surface. Error returned: %s\12\0"
	.text
	.globl	clear_screen
	.def	clear_screen;	.scl	2;	.type	32;	.endef
	.seh_proc	clear_screen
clear_screen:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rcx, -64(%rbp)
	movl	$-16777152, %r8d
	movl	$0, %edx
	movq	-64(%rbp), %rcx
	call	SDL_FillRect
	testl	%eax, %eax
	jns	.L5
	call	SDL_GetError
	movq	%rax, %rbx
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rbx, %r8
	leaq	.LC0(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	call	SDL_Quit
	movl	$1, %ecx
	call	exit
.L5:
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.globl	draw_get_alpha
	.def	draw_get_alpha;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_get_alpha
draw_get_alpha:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	glob_draw_alpha(%rip), %eax
	popq	%rbp
	ret
	.seh_endproc
	.globl	draw_get_colour
	.def	draw_get_colour;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_get_colour
draw_get_colour:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	glob_draw_colour(%rip), %eax
	popq	%rbp
	ret
	.seh_endproc
	.globl	draw_set_color
	.def	draw_set_color;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_set_color
draw_set_color:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	24(%rbp), %eax
	andl	$16777215, %eax
	movl	%eax, glob_draw_colour(%rip)
	call	draw_get_alpha
	movzbl	%al, %edx
	movl	24(%rbp), %eax
	sarl	$16, %eax
	movzbl	%al, %r8d
	movl	24(%rbp), %eax
	sarl	$8, %eax
	movzbl	%al, %ecx
	movl	24(%rbp), %eax
	movzbl	%al, %eax
	movl	%edx, 32(%rsp)
	movl	%r8d, %r9d
	movl	%ecx, %r8d
	movl	%eax, %edx
	movq	16(%rbp), %rcx
	call	SDL_SetRenderDrawColor
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	draw_set_alpha
	.def	draw_set_alpha;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_set_alpha
draw_set_alpha:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	24(%rbp), %eax
	movzbl	%al, %eax
	movl	%eax, glob_draw_alpha(%rip)
	call	draw_get_colour
	movl	%eax, -4(%rbp)
	movl	24(%rbp), %eax
	movzbl	%al, %edx
	movl	-4(%rbp), %eax
	sarl	$16, %eax
	movzbl	%al, %r8d
	movl	-4(%rbp), %eax
	sarl	$8, %eax
	movzbl	%al, %ecx
	movl	-4(%rbp), %eax
	movzbl	%al, %eax
	movl	%edx, 32(%rsp)
	movl	%r8d, %r9d
	movl	%ecx, %r8d
	movl	%eax, %edx
	movq	16(%rbp), %rcx
	call	SDL_SetRenderDrawColor
	nop
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	draw_clear
	.def	draw_clear;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_clear
draw_clear:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	24(%rbp), %eax
	movl	%eax, %edx
	movq	16(%rbp), %rcx
	call	draw_set_color
	movq	16(%rbp), %rcx
	call	SDL_RenderClear
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	draw_clear_alpha
	.def	draw_clear_alpha;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_clear_alpha
draw_clear_alpha:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movl	32(%rbp), %eax
	movl	%eax, %edx
	movq	16(%rbp), %rcx
	call	draw_set_alpha
	movl	24(%rbp), %eax
	movl	%eax, %edx
	movq	16(%rbp), %rcx
	call	draw_clear
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	draw_rectangle
	.def	draw_rectangle;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_rectangle
draw_rectangle:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movl	%r9d, 40(%rbp)
	movl	24(%rbp), %eax
	movl	%eax, -16(%rbp)
	movl	32(%rbp), %eax
	movl	%eax, -12(%rbp)
	movl	40(%rbp), %eax
	movl	%eax, -8(%rbp)
	movl	48(%rbp), %eax
	movl	%eax, -4(%rbp)
	leaq	-16(%rbp), %rax
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	SDL_RenderFillRect
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	keyboard_check
	.def	keyboard_check;	.scl	2;	.type	32;	.endef
	.seh_proc	keyboard_check
keyboard_check:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	glob_vk_down(%rip), %eax
	popq	%rbp
	ret
	.seh_endproc
	.globl	keyboard_check_pressed
	.def	keyboard_check_pressed;	.scl	2;	.type	32;	.endef
	.seh_proc	keyboard_check_pressed
keyboard_check_pressed:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	glob_vk_down(%rip), %eax
	popq	%rbp
	ret
	.seh_endproc
	.globl	keyboard_check_released
	.def	keyboard_check_released;	.scl	2;	.type	32;	.endef
	.seh_proc	keyboard_check_released
keyboard_check_released:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	glob_vk_down(%rip), %eax
	popq	%rbp
	ret
	.seh_endproc
	.globl	mux_int
	.def	mux_int;	.scl	2;	.type	32;	.endef
	.seh_proc	mux_int
mux_int:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	leaq	24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movl	$1, -8(%rbp)
	jmp	.L22
.L23:
	movq	-16(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	addl	$1, -8(%rbp)
.L22:
	movl	-8(%rbp), %eax
	cmpl	16(%rbp), %eax
	jl	.L23
	movl	-4(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	BG
	.def	BG;	.scl	2;	.type	32;	.endef
	.seh_proc	BG
BG:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	24(%rbp), %eax
	movl	16(%rbp), %edx
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC1:
	.ascii "SDL init error:%s\12\0"
.LC2:
	.ascii "COSC345 - Game\0"
.LC3:
	.ascii "Window error\0"
.LC4:
	.ascii "Render error\0"
.LC5:
	.ascii "Surface error\0"
.LC6:
	.ascii "image-test.png\0"
.LC7:
	.ascii "Entering main loop...\0"
.LC8:
	.ascii "...exited main loop.\0"
.LC9:
	.ascii "%s Error returned: %s\12\0"
	.text
	.globl	SDL_main
	.def	SDL_main;	.scl	2;	.type	32;	.endef
	.seh_proc	SDL_main
SDL_main:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$208, %rsp
	.seh_stackalloc	208
	.seh_endprologue
	movl	%ecx, 32(%rbp)
	movq	%rdx, 40(%rbp)
	movq	%rsp, %rax
	movq	%rax, %rbx
	movl	$1600, -8(%rbp)
	movl	$900, -12(%rbp)
	movq	$256, -24(%rbp)
	movq	-24(%rbp), %rax
	subq	$1, %rax
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %r10
	movl	$0, %r11d
	movq	-24(%rbp), %rax
	movq	%rax, %r8
	movl	$0, %r9d
	movq	-24(%rbp), %rax
	addq	$15, %rax
	shrq	$4, %rax
	salq	$4, %rax
	call	___chkstk_ms
	subq	%rax, %rsp
	leaq	48(%rsp), %rax
	addq	$0, %rax
	movq	%rax, -40(%rbp)
	movl	$32, -160(%rbp)
	movl	$64, -156(%rbp)
	movl	$480, -152(%rbp)
	movl	$480, -148(%rbp)
	movl	$62001, -44(%rbp)
	movl	-44(%rbp), %eax
	movl	%eax, %ecx
	call	SDL_Init
	testl	%eax, %eax
	je	.L28
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC1(%rip), %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L29
.L28:
	movl	-8(%rbp), %edx
	movl	$0, 40(%rsp)
	movl	-12(%rbp), %eax
	movl	%eax, 32(%rsp)
	movl	%edx, %r9d
	movl	$536805376, %r8d
	movl	$536805376, %edx
	leaq	.LC2(%rip), %rcx
	call	SDL_CreateWindow
	movq	%rax, -56(%rbp)
	cmpq	$0, -56(%rbp)
	jne	.L30
	movq	-40(%rbp), %rax
	movq	-24(%rbp), %rdx
	leaq	.LC3(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L31
.L30:
	movq	-56(%rbp), %rax
	movl	$4, %r8d
	movl	$-1, %edx
	movq	%rax, %rcx
	call	SDL_CreateRenderer
	movq	%rax, -64(%rbp)
	cmpq	$0, -64(%rbp)
	jne	.L32
	movq	-40(%rbp), %rax
	movq	-24(%rbp), %rdx
	leaq	.LC4(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L31
.L32:
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_GetWindowSurface
	movq	%rax, -72(%rbp)
	cmpq	$0, -72(%rbp)
	jne	.L33
	movq	-40(%rbp), %rax
	movq	-24(%rbp), %rdx
	leaq	.LC5(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L31
.L33:
	movl	$2, %ecx
	call	IMG_Init
	movq	-64(%rbp), %rax
	leaq	.LC6(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, -80(%rbp)
	movl	$1, -4(%rbp)
	leaq	.LC7(%rip), %rcx
	call	puts
	jmp	.L34
.L50:
	movl	-144(%rbp), %eax
	cmpl	$768, %eax
	je	.L36
	cmpl	$769, %eax
	je	.L37
	cmpl	$256, %eax
	jne	.L35
	movl	$0, -4(%rbp)
	jmp	.L35
.L36:
	movl	$1, -84(%rbp)
	movl	-124(%rbp), %eax
	cmpl	$1073741904, %eax
	je	.L38
	cmpl	$1073741904, %eax
	jg	.L39
	cmpl	$1073741903, %eax
	je	.L40
	jmp	.L35
.L39:
	cmpl	$1073741905, %eax
	je	.L42
	cmpl	$1073741906, %eax
	je	.L43
	jmp	.L35
.L40:
	movl	-84(%rbp), %eax
	movl	%eax, glob_vk_right(%rip)
	jmp	.L41
.L38:
	movl	-84(%rbp), %eax
	movl	%eax, glob_vk_left(%rip)
	jmp	.L41
.L43:
	movl	-84(%rbp), %eax
	movl	%eax, glob_vk_up(%rip)
	jmp	.L41
.L42:
	movl	-84(%rbp), %eax
	movl	%eax, glob_vk_down(%rip)
	nop
.L41:
	jmp	.L35
.L37:
	movl	$0, -88(%rbp)
	movl	-124(%rbp), %eax
	cmpl	$1073741904, %eax
	je	.L44
	cmpl	$1073741904, %eax
	jg	.L45
	cmpl	$1073741903, %eax
	je	.L46
	jmp	.L58
.L45:
	cmpl	$1073741905, %eax
	je	.L48
	cmpl	$1073741906, %eax
	je	.L49
	jmp	.L58
.L46:
	movl	-88(%rbp), %eax
	movl	%eax, glob_vk_right(%rip)
	jmp	.L47
.L44:
	movl	-88(%rbp), %eax
	movl	%eax, glob_vk_left(%rip)
	jmp	.L47
.L49:
	movl	-88(%rbp), %eax
	movl	%eax, glob_vk_up(%rip)
	jmp	.L47
.L48:
	movl	-88(%rbp), %eax
	movl	%eax, glob_vk_down(%rip)
	nop
.L47:
.L58:
	nop
.L35:
	leaq	-144(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_PollEvent
	testl	%eax, %eax
	jne	.L50
	movl	$16711680, %edx
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	draw_clear
	movq	-80(%rbp), %rdx
	movq	-64(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rcx
	call	SDL_RenderCopy
	movl	$255, %edx
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	draw_set_color
	movq	-64(%rbp), %rax
	movl	$480, 32(%rsp)
	movl	$480, %r9d
	movl	$64, %r8d
	movl	$32, %edx
	movq	%rax, %rcx
	call	draw_rectangle
	movl	glob_vk_right(%rip), %eax
	testl	%eax, %eax
	je	.L51
	movl	$65280, %edx
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	draw_set_color
.L51:
	movl	glob_vk_left(%rip), %eax
	testl	%eax, %eax
	je	.L52
	movl	$65535, %edx
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	draw_set_color
.L52:
	movl	glob_vk_up(%rip), %eax
	testl	%eax, %eax
	je	.L53
	movl	$65408, %edx
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	draw_set_color
.L53:
	movl	glob_vk_down(%rip), %eax
	testl	%eax, %eax
	je	.L54
	movl	$8388863, %edx
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	draw_set_color
.L54:
	movl	glob_vk_right(%rip), %edx
	movl	glob_vk_left(%rip), %eax
	orl	%eax, %edx
	movl	glob_vk_up(%rip), %eax
	orl	%eax, %edx
	movl	glob_vk_down(%rip), %eax
	orl	%edx, %eax
	testl	%eax, %eax
	je	.L55
	movq	-64(%rbp), %rax
	movl	$160, 32(%rsp)
	movl	$160, %r9d
	movl	$128, %r8d
	movl	$128, %edx
	movq	%rax, %rcx
	call	draw_rectangle
.L55:
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_RenderPresent
	movl	$16, %ecx
	call	SDL_Delay
.L34:
	cmpl	$0, -4(%rbp)
	jne	.L35
	leaq	.LC8(%rip), %rcx
	call	puts
	movq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	call	IMG_Quit
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyRenderer
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyWindow
	call	SDL_Quit
	movl	$500, %ecx
	call	SDL_Delay
	movl	$0, %eax
	jmp	.L29
.L31:
	call	SDL_GetError
	movq	%rax, %rsi
	movq	-40(%rbp), %rbx
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC9(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	call	SDL_Quit
	movl	$1, %ecx
	call	exit
.L29:
	movq	%rbx, %rsp
	movq	%rbp, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (x86_64-posix-seh, Built by strawberryperl.com project) 8.3.0"
	.def	__ms_vsnprintf;	.scl	2;	.type	32;	.endef
	.def	SDL_FillRect;	.scl	2;	.type	32;	.endef
	.def	SDL_GetError;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	SDL_Quit;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	SDL_SetRenderDrawColor;	.scl	2;	.type	32;	.endef
	.def	SDL_RenderClear;	.scl	2;	.type	32;	.endef
	.def	SDL_RenderFillRect;	.scl	2;	.type	32;	.endef
	.def	SDL_Init;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	SDL_CreateWindow;	.scl	2;	.type	32;	.endef
	.def	SDL_CreateRenderer;	.scl	2;	.type	32;	.endef
	.def	SDL_GetWindowSurface;	.scl	2;	.type	32;	.endef
	.def	IMG_Init;	.scl	2;	.type	32;	.endef
	.def	IMG_LoadTexture;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	SDL_PollEvent;	.scl	2;	.type	32;	.endef
	.def	SDL_RenderCopy;	.scl	2;	.type	32;	.endef
	.def	SDL_RenderPresent;	.scl	2;	.type	32;	.endef
	.def	SDL_Delay;	.scl	2;	.type	32;	.endef
	.def	SDL_DestroyTexture;	.scl	2;	.type	32;	.endef
	.def	IMG_Quit;	.scl	2;	.type	32;	.endef
	.def	SDL_DestroyRenderer;	.scl	2;	.type	32;	.endef
	.def	SDL_DestroyWindow;	.scl	2;	.type	32;	.endef
