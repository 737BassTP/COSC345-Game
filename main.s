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
	.globl	glob_vk_space
	.align 4
glob_vk_space:
	.space 4
	.globl	glob_vk_enter
	.align 4
glob_vk_enter:
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
	movsd	%xmm0, 16(%rbp)
	movsd	%xmm1, 24(%rbp)
	movsd	%xmm2, 32(%rbp)
	movsd	24(%rbp), %xmm0
	subsd	16(%rbp), %xmm0
	mulsd	32(%rbp), %xmm0
	addsd	16(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
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
	.globl	draw_image_part
	.def	draw_image_part;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_image_part
draw_image_part:
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
	movl	64(%rbp), %eax
	movl	%eax, -32(%rbp)
	movl	72(%rbp), %eax
	movl	%eax, -28(%rbp)
	movl	80(%rbp), %eax
	movl	%eax, -24(%rbp)
	movl	88(%rbp), %eax
	movl	%eax, -20(%rbp)
	leaq	-16(%rbp), %rcx
	leaq	-32(%rbp), %rdx
	movq	56(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	SDL_RenderCopy
	nop
	addq	$64, %rsp
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
	jmp	.L31
.L32:
	movq	-16(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	addl	$1, -8(%rbp)
.L31:
	movl	-8(%rbp), %eax
	cmpl	16(%rbp), %eax
	jl	.L32
	movl	-4(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	pos_int
	.def	pos_int;	.scl	2;	.type	32;	.endef
	.seh_proc	pos_int
pos_int:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	leaq	32(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movl	(%rax), %eax
	movl	%eax, -8(%rbp)
	movl	$0, -4(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L35
.L38:
	movq	-24(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movl	(%rax), %eax
	movl	%eax, -12(%rbp)
	movl	24(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jne	.L36
	movl	-4(%rbp), %eax
	jmp	.L39
.L36:
	addl	$1, -4(%rbp)
.L35:
	movl	-4(%rbp), %eax
	cmpl	16(%rbp), %eax
	jl	.L38
	movl	$-1, %eax
.L39:
	addq	$32, %rsp
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
	.globl	degtorad
	.def	degtorad;	.scl	2;	.type	32;	.endef
	.seh_proc	degtorad
degtorad:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movsd	%xmm0, 16(%rbp)
	movsd	16(%rbp), %xmm0
	movsd	.LC1(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movsd	.LC2(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	popq	%rbp
	ret
	.seh_endproc
	.globl	radtodeg
	.def	radtodeg;	.scl	2;	.type	32;	.endef
	.seh_proc	radtodeg
radtodeg:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movsd	%xmm0, 16(%rbp)
	movsd	16(%rbp), %xmm0
	movsd	.LC2(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movsd	.LC1(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	popq	%rbp
	ret
	.seh_endproc
	.globl	get_timer
	.def	get_timer;	.scl	2;	.type	32;	.endef
	.seh_proc	get_timer
get_timer:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	call	SDL_GetTicks
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC3:
	.ascii "SDL init error:%s\12\0"
.LC4:
	.ascii "COSC345 - Game\0"
.LC5:
	.ascii "Window error\0"
.LC6:
	.ascii "Render error\0"
.LC7:
	.ascii "Surface error\0"
.LC8:
	.ascii "img/spr_grass.png\0"
.LC9:
	.ascii "img/spr_sand.png\0"
.LC10:
	.ascii "img/spr_water.png\0"
.LC11:
	.ascii "img/spr_lava.png\0"
.LC12:
	.ascii "img/player_strip8.png\0"
.LC13:
	.ascii "rb\0"
.LC14:
	.ascii "level.dat\0"
.LC15:
	.ascii "img/img_lands.png\0"
.LC16:
	.ascii "Entering main loop...\0"
.LC17:
	.ascii "...exited main loop.\0"
.LC18:
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
	subq	$640, %rsp
	.seh_stackalloc	640
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movl	%ecx, 544(%rbp)
	movq	%rdx, 552(%rbp)
	movq	%rsp, %rax
	movq	%rax, %rbx
	movq	$256, 480(%rbp)
	movq	480(%rbp), %rax
	subq	$1, %rax
	movq	%rax, 472(%rbp)
	movq	480(%rbp), %rax
	movq	%rax, %r10
	movl	$0, %r11d
	movq	480(%rbp), %rax
	movq	%rax, %r8
	movl	$0, %r9d
	movq	480(%rbp), %rax
	addq	$15, %rax
	shrq	$4, %rax
	salq	$4, %rax
	call	___chkstk_ms
	subq	%rax, %rsp
	leaq	80(%rsp), %rax
	addq	$0, %rax
	movq	%rax, 464(%rbp)
	movl	$1366, 460(%rbp)
	movl	$768, 456(%rbp)
	movl	460(%rbp), %eax
	subl	456(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, 452(%rbp)
	movl	$0, 448(%rbp)
	movl	456(%rbp), %eax
	movl	%eax, 444(%rbp)
	movl	456(%rbp), %eax
	movl	%eax, 440(%rbp)
	movl	452(%rbp), %edx
	movl	444(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 436(%rbp)
	movl	448(%rbp), %edx
	movl	440(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 432(%rbp)
	movl	$16, 428(%rbp)
	movl	$16, 424(%rbp)
	movl	428(%rbp), %eax
	movl	%eax, %ecx
	call	sqr
	movl	%eax, %esi
	movl	456(%rbp), %eax
	cltd
	idivl	%esi
	movl	%eax, 420(%rbp)
	movl	420(%rbp), %eax
	movl	%eax, 416(%rbp)
	movl	$62001, 412(%rbp)
	movl	412(%rbp), %eax
	movl	%eax, %ecx
	call	SDL_Init
	testl	%eax, %eax
	je	.L51
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC3(%rip), %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L52
.L51:
	movl	460(%rbp), %edx
	movl	$0, 40(%rsp)
	movl	456(%rbp), %eax
	movl	%eax, 32(%rsp)
	movl	%edx, %r9d
	movl	$536805376, %r8d
	movl	$536805376, %edx
	leaq	.LC4(%rip), %rcx
	call	SDL_CreateWindow
	movq	%rax, 400(%rbp)
	cmpq	$0, 400(%rbp)
	jne	.L53
	movq	464(%rbp), %rax
	movq	480(%rbp), %rdx
	leaq	.LC5(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L54
.L53:
	movq	400(%rbp), %rax
	movl	$4, %r8d
	movl	$-1, %edx
	movq	%rax, %rcx
	call	SDL_CreateRenderer
	movq	%rax, 392(%rbp)
	cmpq	$0, 392(%rbp)
	jne	.L55
	movq	464(%rbp), %rax
	movq	480(%rbp), %rdx
	leaq	.LC6(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L54
.L55:
	movq	400(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_GetWindowSurface
	movq	%rax, 384(%rbp)
	cmpq	$0, 384(%rbp)
	jne	.L56
	movq	464(%rbp), %rax
	movq	480(%rbp), %rdx
	leaq	.LC7(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L54
.L56:
	movl	$2, %ecx
	call	IMG_Init
	movq	392(%rbp), %rax
	leaq	.LC8(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 376(%rbp)
	movq	392(%rbp), %rax
	leaq	.LC9(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 368(%rbp)
	movq	392(%rbp), %rax
	leaq	.LC10(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 360(%rbp)
	movq	392(%rbp), %rax
	leaq	.LC11(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 352(%rbp)
	movq	392(%rbp), %rax
	leaq	.LC12(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 344(%rbp)
	movl	428(%rbp), %eax
	movl	%eax, %ecx
	call	sqr
	movl	%eax, 340(%rbp)
	leaq	.LC13(%rip), %rdx
	leaq	.LC14(%rip), %rcx
	call	fopen
	movq	%rax, 328(%rbp)
	movl	$0, 504(%rbp)
	jmp	.L57
.L58:
	movl	504(%rbp), %eax
	cltq
	movb	$0, -32(%rbp,%rax)
	addl	$1, 504(%rbp)
.L57:
	movl	504(%rbp), %eax
	cmpl	340(%rbp), %eax
	jl	.L58
	movq	328(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rdx, %r9
	movl	$1, %r8d
	movl	$256, %edx
	movq	%rax, %rcx
	call	fread
	movq	328(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movl	420(%rbp), %eax
	imull	424(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	452(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -48(%rbp)
	movl	416(%rbp), %eax
	imull	424(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	448(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -44(%rbp)
	movb	$0, -40(%rbp)
	movb	$0, -39(%rbp)
	movb	$1, -38(%rbp)
	movb	$12, -37(%rbp)
	movb	$0, -36(%rbp)
	movb	$2, -35(%rbp)
	movb	$3, -34(%rbp)
	movl	$1, 508(%rbp)
	movq	392(%rbp), %rax
	leaq	.LC15(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 320(%rbp)
	movl	$1, 500(%rbp)
	leaq	.LC16(%rip), %rcx
	call	puts
	jmp	.L59
.L80:
	movl	224(%rbp), %eax
	cmpl	$768, %eax
	je	.L61
	cmpl	$769, %eax
	je	.L62
	cmpl	$256, %eax
	jne	.L60
	movl	$0, 500(%rbp)
	jmp	.L60
.L61:
	movl	$1, 316(%rbp)
	movl	244(%rbp), %eax
	cmpl	$1073741904, %eax
	je	.L63
	cmpl	$1073741904, %eax
	jg	.L64
	cmpl	$32, %eax
	je	.L65
	cmpl	$1073741903, %eax
	je	.L66
	cmpl	$27, %eax
	je	.L67
	jmp	.L60
.L64:
	cmpl	$1073741906, %eax
	je	.L69
	cmpl	$1073741906, %eax
	jl	.L70
	cmpl	$1073741912, %eax
	je	.L71
	jmp	.L60
.L67:
	movl	$0, 500(%rbp)
	jmp	.L68
.L66:
	movl	316(%rbp), %eax
	movl	%eax, glob_vk_right(%rip)
	jmp	.L68
.L63:
	movl	316(%rbp), %eax
	movl	%eax, glob_vk_left(%rip)
	jmp	.L68
.L69:
	movl	316(%rbp), %eax
	movl	%eax, glob_vk_up(%rip)
	jmp	.L68
.L70:
	movl	316(%rbp), %eax
	movl	%eax, glob_vk_down(%rip)
	jmp	.L68
.L65:
	movl	316(%rbp), %eax
	movl	%eax, glob_vk_space(%rip)
	jmp	.L68
.L71:
	movl	316(%rbp), %eax
	movl	%eax, glob_vk_enter(%rip)
	nop
.L68:
	jmp	.L60
.L62:
	movl	$0, 312(%rbp)
	movl	244(%rbp), %eax
	cmpl	$1073741904, %eax
	je	.L72
	cmpl	$1073741904, %eax
	jg	.L73
	cmpl	$32, %eax
	je	.L74
	cmpl	$1073741903, %eax
	je	.L75
	jmp	.L99
.L73:
	cmpl	$1073741906, %eax
	je	.L77
	cmpl	$1073741906, %eax
	jl	.L78
	cmpl	$1073741912, %eax
	je	.L79
	jmp	.L99
.L75:
	movl	312(%rbp), %eax
	movl	%eax, glob_vk_right(%rip)
	jmp	.L76
.L72:
	movl	312(%rbp), %eax
	movl	%eax, glob_vk_left(%rip)
	jmp	.L76
.L77:
	movl	312(%rbp), %eax
	movl	%eax, glob_vk_up(%rip)
	jmp	.L76
.L78:
	movl	312(%rbp), %eax
	movl	%eax, glob_vk_down(%rip)
	jmp	.L76
.L74:
	movl	312(%rbp), %eax
	movl	%eax, glob_vk_space(%rip)
	jmp	.L76
.L79:
	movl	312(%rbp), %eax
	movl	%eax, glob_vk_enter(%rip)
	nop
.L76:
.L99:
	nop
.L60:
	leaq	224(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_PollEvent
	testl	%eax, %eax
	jne	.L80
	movl	glob_vk_right(%rip), %eax
	testl	%eax, %eax
	je	.L81
	movb	$0, -40(%rbp)
	movl	-48(%rbp), %edx
	movzbl	-34(%rbp), %eax
	movzbl	%al, %eax
	addl	%edx, %eax
	movl	%eax, -48(%rbp)
.L81:
	movl	glob_vk_up(%rip), %eax
	testl	%eax, %eax
	je	.L82
	movb	$1, -40(%rbp)
	movl	-44(%rbp), %edx
	movzbl	-34(%rbp), %eax
	movzbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -44(%rbp)
.L82:
	movl	glob_vk_left(%rip), %eax
	testl	%eax, %eax
	je	.L83
	movb	$2, -40(%rbp)
	movl	-48(%rbp), %edx
	movzbl	-34(%rbp), %eax
	movzbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -48(%rbp)
.L83:
	movl	glob_vk_down(%rip), %eax
	testl	%eax, %eax
	je	.L84
	movb	$3, -40(%rbp)
	movl	-44(%rbp), %edx
	movzbl	-34(%rbp), %eax
	movzbl	%al, %eax
	addl	%edx, %eax
	movl	%eax, -44(%rbp)
.L84:
	movl	glob_vk_right(%rip), %edx
	movl	glob_vk_left(%rip), %eax
	orl	%eax, %edx
	movl	glob_vk_up(%rip), %eax
	orl	%eax, %edx
	movl	glob_vk_down(%rip), %eax
	orl	%edx, %eax
	testl	%eax, %eax
	je	.L85
	movzbl	-39(%rbp), %edx
	movzbl	-38(%rbp), %eax
	addl	%edx, %eax
	movb	%al, -39(%rbp)
	movzbl	-36(%rbp), %eax
	movzbl	-39(%rbp), %ecx
	movzbl	-37(%rbp), %edx
	cmpb	%dl, %cl
	setnb	%dl
	addl	%edx, %eax
	movb	%al, -36(%rbp)
	movzbl	-39(%rbp), %eax
	movzbl	-37(%rbp), %edx
	movzbl	%al, %eax
	divb	%dl
	movzbl	%ah, %eax
	movb	%al, -39(%rbp)
	movzbl	-36(%rbp), %eax
	movzbl	-35(%rbp), %edx
	movzbl	%al, %eax
	divb	%dl
	movzbl	%ah, %eax
	movb	%al, -36(%rbp)
	movl	-48(%rbp), %edx
	movl	424(%rbp), %eax
	imull	420(%rbp), %eax
	movl	436(%rbp), %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	cmpl	%eax, %edx
	jle	.L86
	movl	452(%rbp), %eax
	movl	%eax, -48(%rbp)
.L86:
	movl	-44(%rbp), %edx
	movl	424(%rbp), %eax
	imull	416(%rbp), %eax
	movl	432(%rbp), %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	cmpl	%eax, %edx
	jle	.L87
	movl	448(%rbp), %eax
	movl	%eax, -44(%rbp)
.L87:
	movl	-48(%rbp), %eax
	cmpl	%eax, 452(%rbp)
	jle	.L88
	movl	424(%rbp), %eax
	imull	420(%rbp), %eax
	movl	436(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -48(%rbp)
.L88:
	movl	-44(%rbp), %eax
	cmpl	%eax, 448(%rbp)
	jle	.L90
	movl	424(%rbp), %eax
	imull	416(%rbp), %eax
	movl	432(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -44(%rbp)
	jmp	.L90
.L85:
	movb	$0, -39(%rbp)
	movb	$0, -36(%rbp)
.L90:
	movl	glob_vk_space(%rip), %edx
	movl	glob_vk_enter(%rip), %eax
	orl	%edx, %eax
	testl	%eax, %eax
	je	.L91
	movl	$0, 508(%rbp)
.L91:
	movl	$0, %edx
	movq	392(%rbp), %rax
	movq	%rax, %rcx
	call	draw_clear
	movl	$16777215, %edx
	movq	392(%rbp), %rax
	movq	%rax, %rcx
	call	draw_set_color
	movl	$33023, %edx
	movl	452(%rbp), %ecx
	movq	392(%rbp), %rax
	movl	%edx, 40(%rsp)
	movl	456(%rbp), %edx
	movl	%edx, 32(%rsp)
	movl	%ecx, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	$8388863, %r8d
	movl	460(%rbp), %eax
	subl	452(%rbp), %eax
	movl	%eax, %ecx
	movl	452(%rbp), %edx
	movq	392(%rbp), %rax
	movl	%r8d, 40(%rsp)
	movl	456(%rbp), %r8d
	movl	%r8d, 32(%rsp)
	movl	%ecx, %r9d
	movl	$0, %r8d
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	$33023, %edx
	movl	460(%rbp), %eax
	subl	452(%rbp), %eax
	movl	460(%rbp), %r8d
	movq	392(%rbp), %rcx
	movl	%edx, 40(%rsp)
	movl	456(%rbp), %edx
	movl	%edx, 32(%rsp)
	movl	%r8d, %r9d
	movl	$0, %r8d
	movl	%eax, %edx
	call	draw_rectangle_color
	movl	$0, 496(%rbp)
	jmp	.L92
.L95:
	movl	$0, 492(%rbp)
	jmp	.L93
.L94:
	movl	496(%rbp), %eax
	imull	428(%rbp), %eax
	movl	492(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 308(%rbp)
	movl	492(%rbp), %eax
	imull	420(%rbp), %eax
	imull	424(%rbp), %eax
	movl	452(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 304(%rbp)
	movl	496(%rbp), %eax
	imull	416(%rbp), %eax
	imull	424(%rbp), %eax
	movl	448(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 300(%rbp)
	movl	492(%rbp), %eax
	addl	$1, %eax
	imull	420(%rbp), %eax
	imull	424(%rbp), %eax
	movl	452(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 296(%rbp)
	movl	496(%rbp), %eax
	addl	$1, %eax
	imull	416(%rbp), %eax
	imull	424(%rbp), %eax
	movl	448(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 292(%rbp)
	movl	$16711680, %r9d
	movl	$65280, %r8d
	movl	$255, %r10d
	movl	308(%rbp), %ecx
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
	movl	%eax, 288(%rbp)
	movl	296(%rbp), %r9d
	movl	300(%rbp), %r8d
	movl	304(%rbp), %edx
	movq	392(%rbp), %rax
	movl	288(%rbp), %ecx
	movl	%ecx, 40(%rsp)
	movl	292(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	308(%rbp), %eax
	cltq
	movzbl	-32(%rbp,%rax), %eax
	movzbl	%al, %eax
	movl	%eax, 284(%rbp)
	movq	360(%rbp), %r9
	movq	368(%rbp), %r8
	movq	376(%rbp), %rdx
	movl	284(%rbp), %eax
	movq	352(%rbp), %rcx
	movq	%rcx, 32(%rsp)
	movl	%eax, %ecx
	call	mux_int
	cltq
	movq	%rax, %rcx
	movl	296(%rbp), %r9d
	movl	300(%rbp), %r8d
	movl	304(%rbp), %edx
	movq	392(%rbp), %rax
	movq	%rcx, 40(%rsp)
	movl	292(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_image
	addl	$1, 492(%rbp)
.L93:
	movl	492(%rbp), %eax
	cmpl	428(%rbp), %eax
	jl	.L94
	addl	$1, 496(%rbp)
.L92:
	movl	496(%rbp), %eax
	cmpl	428(%rbp), %eax
	jl	.L95
	movl	424(%rbp), %eax
	movl	%eax, 280(%rbp)
	movzbl	-40(%rbp), %eax
	movzbl	%al, %eax
	imull	280(%rbp), %eax
	movl	%eax, %edx
	movzbl	-35(%rbp), %eax
	movzbl	%al, %eax
	imull	%eax, %edx
	movzbl	-36(%rbp), %eax
	movzbl	%al, %eax
	imull	280(%rbp), %eax
	leal	(%rdx,%rax), %r8d
	movl	-44(%rbp), %edx
	movl	280(%rbp), %eax
	imull	416(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	movl	-48(%rbp), %edx
	movl	280(%rbp), %eax
	imull	420(%rbp), %eax
	leal	(%rdx,%rax), %r11d
	movl	-44(%rbp), %r10d
	movl	-48(%rbp), %edx
	movq	392(%rbp), %rax
	movl	280(%rbp), %r9d
	movl	%r9d, 72(%rsp)
	movl	280(%rbp), %r9d
	movl	%r9d, 64(%rsp)
	movl	$0, 56(%rsp)
	movl	%r8d, 48(%rsp)
	movq	344(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	%r11d, %r9d
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	draw_image_part
	cmpl	$0, 508(%rbp)
	je	.L96
	movl	436(%rbp), %r9d
	movl	448(%rbp), %r8d
	movl	452(%rbp), %edx
	movq	392(%rbp), %rax
	movq	320(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	432(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_image
.L96:
	movq	392(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_RenderPresent
	movl	$16, %ecx
	call	SDL_Delay
.L59:
	cmpl	$0, 500(%rbp)
	jne	.L60
	leaq	.LC17(%rip), %rcx
	call	puts
	movq	376(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	368(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	360(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	352(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	344(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	320(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	call	IMG_Quit
	movq	392(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyRenderer
	movq	400(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyWindow
	call	SDL_Quit
	movl	$500, %ecx
	call	SDL_Delay
	movl	$0, %eax
	jmp	.L52
.L54:
	call	SDL_GetError
	movq	%rax, %rsi
	movq	464(%rbp), %rbx
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC18(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	call	SDL_Quit
	movl	$1, %ecx
	call	exit
.L52:
	movq	%rbx, %rsp
	leaq	512(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC1:
	.long	0
	.long	1080459264
	.align 8
.LC2:
	.long	1413754136
	.long	1074340347
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
	.def	SDL_GetTicks;	.scl	2;	.type	32;	.endef
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
