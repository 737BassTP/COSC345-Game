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
	.globl	c_black
	.section .rdata,"dr"
	.align 4
c_black:
	.space 4
	.globl	c_dkgray
	.align 4
c_dkgray:
	.long	4210752
	.globl	c_gray
	.align 4
c_gray:
	.long	8421504
	.globl	c_ltgray
	.align 4
c_ltgray:
	.long	12632256
	.globl	c_white
	.align 4
c_white:
	.long	16777215
	.globl	c_red
	.align 4
c_red:
	.long	255
	.globl	c_orange
	.align 4
c_orange:
	.long	33023
	.globl	c_yellow
	.align 4
c_yellow:
	.long	65535
	.globl	c_lime
	.align 4
c_lime:
	.long	65408
	.globl	c_green
	.align 4
c_green:
	.long	65280
	.globl	c_slime
	.align 4
c_slime:
	.long	8453888
	.globl	c_aqua
	.align 4
c_aqua:
	.long	16776960
	.globl	c_sky
	.align 4
c_sky:
	.long	16744448
	.globl	c_blue
	.align 4
c_blue:
	.long	16711680
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
	.globl	make_color_rgb
	.def	make_color_rgb;	.scl	2;	.type	32;	.endef
	.seh_proc	make_color_rgb
make_color_rgb:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movl	16(%rbp), %eax
	movzbl	%al, %edx
	movl	24(%rbp), %eax
	sall	$8, %eax
	movzwl	%ax, %eax
	orl	%eax, %edx
	movl	32(%rbp), %eax
	sall	$16, %eax
	andl	$16711680, %eax
	orl	%edx, %eax
	popq	%rbp
	ret
	.seh_endproc
	.globl	lerp
	.def	lerp;	.scl	2;	.type	32;	.endef
	.seh_proc	lerp
lerp:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movl	24(%rbp), %eax
	subl	16(%rbp), %eax
	imull	32(%rbp), %eax
	movl	16(%rbp), %edx
	addl	%edx, %eax
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
	.globl	draw_get_color
	.def	draw_get_color;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_get_color
draw_get_color:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	glob_draw_colour(%rip), %eax
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
	subl	24(%rbp), %eax
	movl	%eax, -8(%rbp)
	movl	48(%rbp), %eax
	subl	32(%rbp), %eax
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
	.globl	draw_rectangle_color
	.def	draw_rectangle_color;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_rectangle_color
draw_rectangle_color:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movl	%r9d, 40(%rbp)
	call	draw_get_color
	movl	%eax, -4(%rbp)
	movl	56(%rbp), %eax
	movl	%eax, %edx
	movq	16(%rbp), %rcx
	call	draw_set_color
	movl	40(%rbp), %r8d
	movl	32(%rbp), %ecx
	movl	24(%rbp), %eax
	movl	48(%rbp), %edx
	movl	%edx, 32(%rsp)
	movl	%r8d, %r9d
	movl	%ecx, %r8d
	movl	%eax, %edx
	movq	16(%rbp), %rcx
	call	draw_rectangle
	movl	-4(%rbp), %eax
	movl	%eax, %edx
	movq	16(%rbp), %rcx
	call	draw_set_color
	nop
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	draw_image
	.def	draw_image;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_image
draw_image:
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
	subl	24(%rbp), %eax
	movl	%eax, -8(%rbp)
	movl	48(%rbp), %eax
	subl	32(%rbp), %eax
	movl	%eax, -4(%rbp)
	leaq	-16(%rbp), %rdx
	movq	56(%rbp), %rax
	movq	%rdx, %r9
	movl	$0, %r8d
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	SDL_RenderCopy
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
	movl	$0, -8(%rbp)
	jmp	.L30
.L31:
	movq	-16(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	addl	$1, -8(%rbp)
.L30:
	movl	-8(%rbp), %eax
	cmpl	16(%rbp), %eax
	jl	.L31
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
	.globl	sqr
	.def	sqr;	.scl	2;	.type	32;	.endef
	.seh_proc	sqr
sqr:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	16(%rbp), %eax
	imull	16(%rbp), %eax
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
	.ascii "img/spr_grass.png\0"
.LC7:
	.ascii "img/spr_sand.png\0"
.LC8:
	.ascii "img/spr_water.png\0"
.LC9:
	.ascii "img/spr_lava.png\0"
.LC10:
	.ascii "rb\0"
.LC11:
	.ascii "level.dat\0"
.LC12:
	.ascii "Entering main loop...\0"
.LC13:
	.ascii "...exited main loop.\0"
.LC14:
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
	subq	$560, %rsp
	.seh_stackalloc	560
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movl	%ecx, 464(%rbp)
	movq	%rdx, 472(%rbp)
	movq	%rsp, %rax
	movq	%rax, %rbx
	movq	$256, 408(%rbp)
	movq	408(%rbp), %rax
	subq	$1, %rax
	movq	%rax, 400(%rbp)
	movq	408(%rbp), %rax
	movq	%rax, %r10
	movl	$0, %r11d
	movq	408(%rbp), %rax
	movq	%rax, %r8
	movl	$0, %r9d
	movq	408(%rbp), %rax
	addq	$15, %rax
	shrq	$4, %rax
	salq	$4, %rax
	call	___chkstk_ms
	subq	%rax, %rsp
	leaq	48(%rsp), %rax
	addq	$0, %rax
	movq	%rax, 392(%rbp)
	movl	$1366, 388(%rbp)
	movl	$768, 384(%rbp)
	movl	388(%rbp), %eax
	subl	384(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, 380(%rbp)
	movl	$0, 376(%rbp)
	movl	384(%rbp), %eax
	movl	%eax, 372(%rbp)
	movl	384(%rbp), %eax
	movl	%eax, 368(%rbp)
	movl	380(%rbp), %edx
	movl	372(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 364(%rbp)
	movl	376(%rbp), %edx
	movl	368(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 360(%rbp)
	movl	$16, 356(%rbp)
	movl	$16, 352(%rbp)
	movl	$62001, 348(%rbp)
	movl	348(%rbp), %eax
	movl	%eax, %ecx
	call	SDL_Init
	testl	%eax, %eax
	je	.L38
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC1(%rip), %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L39
.L38:
	movl	388(%rbp), %edx
	movl	$0, 40(%rsp)
	movl	384(%rbp), %eax
	movl	%eax, 32(%rsp)
	movl	%edx, %r9d
	movl	$536805376, %r8d
	movl	$536805376, %edx
	leaq	.LC2(%rip), %rcx
	call	SDL_CreateWindow
	movq	%rax, 336(%rbp)
	cmpq	$0, 336(%rbp)
	jne	.L40
	movq	392(%rbp), %rax
	movq	408(%rbp), %rdx
	leaq	.LC3(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L41
.L40:
	movq	336(%rbp), %rax
	movl	$4, %r8d
	movl	$-1, %edx
	movq	%rax, %rcx
	call	SDL_CreateRenderer
	movq	%rax, 328(%rbp)
	cmpq	$0, 328(%rbp)
	jne	.L42
	movq	392(%rbp), %rax
	movq	408(%rbp), %rdx
	leaq	.LC4(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L41
.L42:
	movq	336(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_GetWindowSurface
	movq	%rax, 320(%rbp)
	cmpq	$0, 320(%rbp)
	jne	.L43
	movq	392(%rbp), %rax
	movq	408(%rbp), %rdx
	leaq	.LC5(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L41
.L43:
	movl	$2, %ecx
	call	IMG_Init
	movq	328(%rbp), %rax
	leaq	.LC6(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 312(%rbp)
	movq	328(%rbp), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 304(%rbp)
	movq	328(%rbp), %rax
	leaq	.LC8(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 296(%rbp)
	movq	328(%rbp), %rax
	leaq	.LC9(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 288(%rbp)
	movl	356(%rbp), %eax
	movl	%eax, %ecx
	call	sqr
	movl	%eax, 284(%rbp)
	leaq	.LC10(%rip), %rdx
	leaq	.LC11(%rip), %rcx
	call	fopen
	movq	%rax, 272(%rbp)
	movl	$0, 424(%rbp)
	jmp	.L44
.L45:
	movl	424(%rbp), %eax
	cltq
	movb	$0, -80(%rbp,%rax)
	addl	$1, 424(%rbp)
.L44:
	movl	424(%rbp), %eax
	cmpl	284(%rbp), %eax
	jl	.L45
	movq	272(%rbp), %rdx
	leaq	-80(%rbp), %rax
	movq	%rdx, %r9
	movl	$1, %r8d
	movl	$256, %edx
	movq	%rax, %rcx
	call	fread
	movq	272(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movl	$1, 428(%rbp)
	leaq	.LC12(%rip), %rcx
	call	puts
	jmp	.L46
.L63:
	movl	176(%rbp), %eax
	cmpl	$768, %eax
	je	.L48
	cmpl	$769, %eax
	je	.L49
	cmpl	$256, %eax
	jne	.L47
	movl	$0, 428(%rbp)
	jmp	.L47
.L48:
	movl	$1, 268(%rbp)
	movl	196(%rbp), %eax
	cmpl	$1073741904, %eax
	je	.L50
	cmpl	$1073741904, %eax
	jg	.L51
	cmpl	$27, %eax
	je	.L52
	cmpl	$1073741903, %eax
	je	.L53
	jmp	.L47
.L51:
	cmpl	$1073741905, %eax
	je	.L55
	cmpl	$1073741906, %eax
	je	.L56
	jmp	.L47
.L52:
	movl	$0, 428(%rbp)
	jmp	.L54
.L53:
	movl	268(%rbp), %eax
	movl	%eax, glob_vk_right(%rip)
	jmp	.L54
.L50:
	movl	268(%rbp), %eax
	movl	%eax, glob_vk_left(%rip)
	jmp	.L54
.L56:
	movl	268(%rbp), %eax
	movl	%eax, glob_vk_up(%rip)
	jmp	.L54
.L55:
	movl	268(%rbp), %eax
	movl	%eax, glob_vk_down(%rip)
	nop
.L54:
	jmp	.L47
.L49:
	movl	$0, 264(%rbp)
	movl	196(%rbp), %eax
	cmpl	$1073741904, %eax
	je	.L57
	cmpl	$1073741904, %eax
	jg	.L58
	cmpl	$1073741903, %eax
	je	.L59
	jmp	.L75
.L58:
	cmpl	$1073741905, %eax
	je	.L61
	cmpl	$1073741906, %eax
	je	.L62
	jmp	.L75
.L59:
	movl	264(%rbp), %eax
	movl	%eax, glob_vk_right(%rip)
	jmp	.L60
.L57:
	movl	264(%rbp), %eax
	movl	%eax, glob_vk_left(%rip)
	jmp	.L60
.L62:
	movl	264(%rbp), %eax
	movl	%eax, glob_vk_up(%rip)
	jmp	.L60
.L61:
	movl	264(%rbp), %eax
	movl	%eax, glob_vk_down(%rip)
	nop
.L60:
.L75:
	nop
.L47:
	leaq	176(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_PollEvent
	testl	%eax, %eax
	jne	.L63
	movl	$0, %edx
	movq	328(%rbp), %rax
	movq	%rax, %rcx
	call	draw_clear
	movl	$16777215, %edx
	movq	328(%rbp), %rax
	movq	%rax, %rcx
	call	draw_set_color
	movl	$33023, %edx
	movl	380(%rbp), %ecx
	movq	328(%rbp), %rax
	movl	%edx, 40(%rsp)
	movl	384(%rbp), %edx
	movl	%edx, 32(%rsp)
	movl	%ecx, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	$8388863, %r8d
	movl	388(%rbp), %eax
	subl	380(%rbp), %eax
	movl	%eax, %ecx
	movl	380(%rbp), %edx
	movq	328(%rbp), %rax
	movl	%r8d, 40(%rsp)
	movl	384(%rbp), %r8d
	movl	%r8d, 32(%rsp)
	movl	%ecx, %r9d
	movl	$0, %r8d
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	$33023, %edx
	movl	388(%rbp), %eax
	subl	380(%rbp), %eax
	movl	388(%rbp), %r8d
	movq	328(%rbp), %rcx
	movl	%edx, 40(%rsp)
	movl	384(%rbp), %edx
	movl	%edx, 32(%rsp)
	movl	%r8d, %r9d
	movl	$0, %r8d
	movl	%eax, %edx
	call	draw_rectangle_color
	movl	356(%rbp), %eax
	movl	%eax, %ecx
	call	sqr
	movl	%eax, %esi
	movl	384(%rbp), %eax
	cltd
	idivl	%esi
	movl	%eax, 260(%rbp)
	movl	260(%rbp), %eax
	movl	%eax, 256(%rbp)
	movl	$0, 420(%rbp)
	jmp	.L64
.L67:
	movl	$0, 416(%rbp)
	jmp	.L65
.L66:
	movl	420(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	416(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 252(%rbp)
	movl	416(%rbp), %eax
	imull	352(%rbp), %eax
	imull	260(%rbp), %eax
	movl	380(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 248(%rbp)
	movl	420(%rbp), %eax
	imull	352(%rbp), %eax
	imull	256(%rbp), %eax
	movl	376(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 244(%rbp)
	movl	416(%rbp), %eax
	addl	$1, %eax
	imull	352(%rbp), %eax
	imull	260(%rbp), %eax
	movl	380(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 240(%rbp)
	movl	420(%rbp), %eax
	addl	$1, %eax
	imull	352(%rbp), %eax
	imull	256(%rbp), %eax
	movl	376(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 236(%rbp)
	movl	$16711680, %r9d
	movl	$65280, %r8d
	movl	$255, %r10d
	movl	252(%rbp), %ecx
	movl	$1431655766, %edx
	movl	%ecx, %eax
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	addl	%edx, %edx
	addl	%eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	movl	%r10d, %edx
	movl	%eax, %ecx
	call	mux_int
	movl	%eax, %edx
	movq	328(%rbp), %rax
	movq	%rax, %rcx
	call	draw_set_color
	movl	240(%rbp), %r9d
	movl	244(%rbp), %r8d
	movl	248(%rbp), %edx
	movq	328(%rbp), %rax
	movl	236(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_rectangle
	movl	252(%rbp), %eax
	cltq
	movzbl	-80(%rbp,%rax), %eax
	movzbl	%al, %eax
	movl	%eax, 232(%rbp)
	movq	296(%rbp), %r9
	movq	304(%rbp), %r8
	movq	312(%rbp), %rdx
	movl	232(%rbp), %eax
	movq	288(%rbp), %rcx
	movq	%rcx, 32(%rsp)
	movl	%eax, %ecx
	call	mux_int
	cltq
	movq	%rax, %rcx
	movl	240(%rbp), %r9d
	movl	244(%rbp), %r8d
	movl	248(%rbp), %edx
	movq	328(%rbp), %rax
	movq	%rcx, 40(%rsp)
	movl	236(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_image
	addl	$1, 416(%rbp)
.L65:
	movl	416(%rbp), %eax
	cmpl	356(%rbp), %eax
	jl	.L66
	addl	$1, 420(%rbp)
.L64:
	movl	420(%rbp), %eax
	cmpl	356(%rbp), %eax
	jl	.L67
	movl	glob_vk_right(%rip), %eax
	testl	%eax, %eax
	je	.L68
	movl	$65280, %edx
	movq	328(%rbp), %rax
	movq	%rax, %rcx
	call	draw_set_color
.L68:
	movl	glob_vk_left(%rip), %eax
	testl	%eax, %eax
	je	.L69
	movl	$65535, %edx
	movq	328(%rbp), %rax
	movq	%rax, %rcx
	call	draw_set_color
.L69:
	movl	glob_vk_up(%rip), %eax
	testl	%eax, %eax
	je	.L70
	movl	$33023, %edx
	movq	328(%rbp), %rax
	movq	%rax, %rcx
	call	draw_set_color
.L70:
	movl	glob_vk_down(%rip), %eax
	testl	%eax, %eax
	je	.L71
	movl	$8388863, %edx
	movq	328(%rbp), %rax
	movq	%rax, %rcx
	call	draw_set_color
.L71:
	movl	glob_vk_right(%rip), %edx
	movl	glob_vk_left(%rip), %eax
	orl	%eax, %edx
	movl	glob_vk_up(%rip), %eax
	orl	%eax, %edx
	movl	glob_vk_down(%rip), %eax
	orl	%edx, %eax
	testl	%eax, %eax
	je	.L72
	movq	328(%rbp), %rax
	movl	$128, 32(%rsp)
	movl	$128, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	draw_rectangle
.L72:
	movq	328(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_RenderPresent
	movl	$16, %ecx
	call	SDL_Delay
.L46:
	cmpl	$0, 428(%rbp)
	jne	.L47
	leaq	.LC13(%rip), %rcx
	call	puts
	movq	312(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	304(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	296(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	288(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	call	IMG_Quit
	movq	328(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyRenderer
	movq	336(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyWindow
	call	SDL_Quit
	movl	$500, %ecx
	call	SDL_Delay
	movl	$0, %eax
	jmp	.L39
.L41:
	call	SDL_GetError
	movq	%rax, %rsi
	movq	392(%rbp), %rbx
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC14(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	call	SDL_Quit
	movl	$1, %ecx
	call	exit
.L39:
	movq	%rbx, %rsp
	leaq	432(%rbp), %rsp
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
	.def	SDL_RenderCopy;	.scl	2;	.type	32;	.endef
	.def	SDL_Init;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	SDL_CreateWindow;	.scl	2;	.type	32;	.endef
	.def	SDL_CreateRenderer;	.scl	2;	.type	32;	.endef
	.def	SDL_GetWindowSurface;	.scl	2;	.type	32;	.endef
	.def	IMG_Init;	.scl	2;	.type	32;	.endef
	.def	IMG_LoadTexture;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	fread;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	SDL_PollEvent;	.scl	2;	.type	32;	.endef
	.def	SDL_RenderPresent;	.scl	2;	.type	32;	.endef
	.def	SDL_Delay;	.scl	2;	.type	32;	.endef
	.def	SDL_DestroyTexture;	.scl	2;	.type	32;	.endef
	.def	IMG_Quit;	.scl	2;	.type	32;	.endef
	.def	SDL_DestroyRenderer;	.scl	2;	.type	32;	.endef
	.def	SDL_DestroyWindow;	.scl	2;	.type	32;	.endef
