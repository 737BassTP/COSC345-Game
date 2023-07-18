	.file	"main.c"
	.text
	.def	time;	.scl	3;	.type	32;	.endef
	.seh_proc	time
time:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	movq	__imp__time64(%rip), %rax
	call	*%rax
	addq	$32, %rsp
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
	.globl	glob_vk_f2
	.align 4
glob_vk_f2:
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
	leaq	32(%rsp), %rbp
	.seh_setframe	%rbp, 32
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movq	32(%rbp), %rax
	movl	$-16777152, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	SDL_FillRect
	testl	%eax, %eax
	jns	.L5
	call	SDL_GetError
	movq	%rax, %rbx
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, %r8
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdx
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
	movzbl	%al, %r9d
	movl	24(%rbp), %eax
	sarl	$8, %eax
	movzbl	%al, %r8d
	movl	24(%rbp), %eax
	movzbl	%al, %eax
	movq	16(%rbp), %rcx
	movl	%edx, 32(%rsp)
	movl	%eax, %edx
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
	movzbl	%al, %r9d
	movl	-4(%rbp), %eax
	sarl	$8, %eax
	movzbl	%al, %r8d
	movl	-4(%rbp), %eax
	movzbl	%al, %eax
	movq	16(%rbp), %rcx
	movl	%edx, 32(%rsp)
	movl	%eax, %edx
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
	movl	24(%rbp), %edx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	draw_set_color
	movq	16(%rbp), %rax
	movq	%rax, %rcx
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
	movl	32(%rbp), %edx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	draw_set_alpha
	movl	24(%rbp), %edx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
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
	movq	16(%rbp), %rcx
	movq	%rax, %rdx
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
	movl	56(%rbp), %edx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	draw_set_color
	movl	40(%rbp), %r9d
	movl	32(%rbp), %r8d
	movl	24(%rbp), %edx
	movq	16(%rbp), %rax
	movl	48(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_rectangle
	movl	-4(%rbp), %edx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
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
	leaq	-16(%rbp), %rcx
	movq	56(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
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
	leaq	-16(%rbp), %r8
	leaq	-32(%rbp), %rcx
	movq	56(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%r8, %r9
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	SDL_RenderCopy
	nop
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	draw_text
	.def	draw_text;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_text
draw_text:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$112, %rsp
	.seh_stackalloc	112
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movl	%r9d, 40(%rbp)
	movq	64(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movl	%eax, -16(%rbp)
	movl	$0, -20(%rbp)
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	movl	$35, %eax
	movsbl	%al, %eax
	subl	$32, %eax
	movl	%eax, -24(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L25
.L28:
	movl	-12(%rbp), %eax
	cltq
	movq	64(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$32, %eax
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jne	.L26
	movl	-12(%rbp), %eax
	cltq
	leaq	1(%rax), %rdx
	movq	64(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$32, %eax
	cmpl	%eax, -24(%rbp)
	je	.L26
	movl	$0, -4(%rbp)
	movl	48(%rbp), %eax
	addl	%eax, -8(%rbp)
	jmp	.L27
.L26:
	movl	-20(%rbp), %eax
	imull	72(%rbp), %eax
	movl	%eax, %ecx
	movl	32(%rbp), %edx
	movl	-8(%rbp), %eax
	addl	%eax, %edx
	movl	48(%rbp), %eax
	leal	(%rdx,%rax), %r8d
	movl	24(%rbp), %edx
	movl	-4(%rbp), %eax
	addl	%eax, %edx
	movl	40(%rbp), %eax
	leal	(%rdx,%rax), %r11d
	movl	32(%rbp), %edx
	movl	-8(%rbp), %eax
	leal	(%rdx,%rax), %r10d
	movl	24(%rbp), %edx
	movl	-4(%rbp), %eax
	addl	%eax, %edx
	movq	16(%rbp), %rax
	movl	80(%rbp), %r9d
	movl	%r9d, 72(%rsp)
	movl	72(%rbp), %r9d
	movl	%r9d, 64(%rsp)
	movl	$0, 56(%rsp)
	movl	%ecx, 48(%rsp)
	movq	56(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	%r8d, 32(%rsp)
	movl	%r11d, %r9d
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	draw_image_part
	movl	40(%rbp), %eax
	addl	%eax, -4(%rbp)
.L27:
	addl	$1, -12(%rbp)
.L25:
	movl	-12(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jl	.L28
	nop
	nop
	addq	$112, %rsp
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
	jmp	.L36
.L37:
	movq	-16(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	addl	$1, -8(%rbp)
.L36:
	movl	-8(%rbp), %eax
	cmpl	16(%rbp), %eax
	jl	.L37
	movl	-4(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	mux_sdltex
	.def	mux_sdltex;	.scl	2;	.type	32;	.endef
	.seh_proc	mux_sdltex
mux_sdltex:
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
	jmp	.L40
.L41:
	movq	-16(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movq	(%rax), %rax
	movl	%eax, -4(%rbp)
	addl	$1, -8(%rbp)
.L40:
	movl	-8(%rbp), %eax
	cmpl	16(%rbp), %eax
	jl	.L41
	movl	-4(%rbp), %eax
	cltq
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
	jmp	.L44
.L47:
	movq	-24(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movl	(%rax), %eax
	movl	%eax, -12(%rbp)
	movl	24(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jne	.L45
	movl	-4(%rbp), %eax
	jmp	.L48
.L45:
	addl	$1, -4(%rbp)
.L44:
	movl	-4(%rbp), %eax
	cmpl	16(%rbp), %eax
	jl	.L47
	movl	$-1, %eax
.L48:
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
	imull	%eax, %eax
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
	movsd	.LC1(%rip), %xmm2
	movapd	%xmm0, %xmm1
	divsd	%xmm2, %xmm1
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
	movsd	.LC2(%rip), %xmm2
	movapd	%xmm0, %xmm1
	divsd	%xmm2, %xmm1
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
	.globl	point_in_rectangle
	.def	point_in_rectangle;	.scl	2;	.type	32;	.endef
	.seh_proc	point_in_rectangle
point_in_rectangle:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movl	%r9d, 40(%rbp)
	movl	16(%rbp), %eax
	cmpl	32(%rbp), %eax
	jl	.L60
	movl	16(%rbp), %eax
	cmpl	48(%rbp), %eax
	jge	.L60
	movl	24(%rbp), %eax
	cmpl	40(%rbp), %eax
	jl	.L60
	movl	24(%rbp), %eax
	cmpl	56(%rbp), %eax
	jge	.L60
	movl	$1, %eax
	jmp	.L62
.L60:
	movl	$0, %eax
.L62:
	popq	%rbp
	ret
	.seh_endproc
	.globl	rectangle_in_rectangle
	.def	rectangle_in_rectangle;	.scl	2;	.type	32;	.endef
	.seh_proc	rectangle_in_rectangle
rectangle_in_rectangle:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movl	%r9d, 40(%rbp)
	movl	$0, -4(%rbp)
	movl	56(%rbp), %r9d
	movl	48(%rbp), %r8d
	movl	24(%rbp), %edx
	movl	16(%rbp), %eax
	movl	72(%rbp), %ecx
	movl	%ecx, 40(%rsp)
	movl	64(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movl	%eax, %ecx
	call	point_in_rectangle
	addl	%eax, -4(%rbp)
	movl	56(%rbp), %r9d
	movl	48(%rbp), %r8d
	movl	24(%rbp), %edx
	movl	32(%rbp), %eax
	movl	72(%rbp), %ecx
	movl	%ecx, 40(%rsp)
	movl	64(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movl	%eax, %ecx
	call	point_in_rectangle
	addl	%eax, -4(%rbp)
	movl	56(%rbp), %r9d
	movl	48(%rbp), %r8d
	movl	40(%rbp), %edx
	movl	16(%rbp), %eax
	movl	72(%rbp), %ecx
	movl	%ecx, 40(%rsp)
	movl	64(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movl	%eax, %ecx
	call	point_in_rectangle
	addl	%eax, -4(%rbp)
	movl	56(%rbp), %r9d
	movl	48(%rbp), %r8d
	movl	40(%rbp), %edx
	movl	32(%rbp), %eax
	movl	72(%rbp), %ecx
	movl	%ecx, 40(%rsp)
	movl	64(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movl	%eax, %ecx
	call	point_in_rectangle
	addl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	jne	.L64
	movl	$0, %eax
	jmp	.L65
.L64:
	cmpl	$4, -4(%rbp)
	jne	.L66
	movl	$1, %eax
	jmp	.L65
.L66:
	movl	$2, %eax
.L65:
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	string_pos
	.def	string_pos;	.scl	2;	.type	32;	.endef
	.seh_proc	string_pos
string_pos:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movzbl	(%rax), %eax
	movsbq	%al, %rax
	movq	%rax, -16(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movl	%eax, -20(%rbp)
	movl	$0, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L68
.L71:
	movl	-4(%rbp), %eax
	cltq
	movq	24(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbq	%al, %rax
	movq	%rax, -32(%rbp)
	movq	-16(%rbp), %rax
	movl	%eax, %edx
	movq	-32(%rbp), %rax
	cmpb	%al, %dl
	jne	.L69
	movl	-4(%rbp), %eax
	jmp	.L70
.L69:
	addl	$1, -4(%rbp)
.L68:
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L71
	movl	$-1, %eax
.L70:
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	game_level_load
	.def	game_level_load;	.scl	2;	.type	32;	.endef
	.seh_proc	game_level_load
game_level_load:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	nop
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC3:
	.ascii "faulty at the moment.\0"
.LC4:
	.ascii "r\0"
.LC5:
	.ascii "cosc345-game.tmx\0"
.LC6:
	.ascii "wb\0"
.LC7:
	.ascii "level-new.dat\0"
.LC8:
	.ascii "i=%i/%i: %i (%i,%i,%i)\12,\0"
	.text
	.globl	dev_tiled_to_leveldata
	.def	dev_tiled_to_leveldata;	.scl	2;	.type	32;	.endef
	.seh_proc	dev_tiled_to_leveldata
dev_tiled_to_leveldata:
	pushq	%rbp
	.seh_pushreg	%rbp
	movl	$131200, %eax
	call	___chkstk_ms
	subq	%rax, %rsp
	.seh_stackalloc	131200
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	leaq	.LC3(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movl	$0, glob_vk_f2(%rip)
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC5(%rip), %rax
	movq	%rax, %rcx
	call	fopen
	movq	%rax, 131040(%rbp)
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC7(%rip), %rax
	movq	%rax, %rcx
	call	fopen
	movq	%rax, 131032(%rbp)
	movl	$131072, 131028(%rbp)
	movl	$32, 131028(%rbp)
	movl	$0, 131068(%rbp)
	jmp	.L74
.L75:
	movl	131068(%rbp), %eax
	cltq
	movb	$0, -48(%rbp,%rax)
	addl	$1, 131068(%rbp)
.L74:
	movl	131068(%rbp), %eax
	cmpl	131028(%rbp), %eax
	jl	.L75
	movl	$0, 131064(%rbp)
	jmp	.L76
.L77:
	movq	131040(%rbp), %rax
	movq	%rax, %rcx
	call	fgetc
	addl	$1, 131064(%rbp)
.L76:
	cmpl	$501, 131064(%rbp)
	jle	.L77
	movl	$44, %eax
	movb	%al, 131027(%rbp)
	movl	$0, 131060(%rbp)
.L90:
	movq	131040(%rbp), %rax
	movq	%rax, %rcx
	call	fgetc
	movb	%al, 131026(%rbp)
	cmpb	$60, 131026(%rbp)
	je	.L91
	movl	131060(%rbp), %eax
	cmpl	131028(%rbp), %eax
	jge	.L92
	movl	$0, 131056(%rbp)
	jmp	.L81
.L82:
	movl	131056(%rbp), %eax
	cltq
	movb	$48, -51(%rbp,%rax)
	addl	$1, 131056(%rbp)
.L81:
	cmpl	$2, 131056(%rbp)
	jle	.L82
	movzbl	131026(%rbp), %eax
	movb	%al, -51(%rbp)
	movq	131040(%rbp), %rax
	movq	%rax, %rcx
	call	fgetc
	movb	%al, 131026(%rbp)
	movzbl	131026(%rbp), %eax
	cmpb	131027(%rbp), %al
	je	.L83
	movzbl	131026(%rbp), %eax
	movb	%al, -50(%rbp)
	movq	131040(%rbp), %rax
	movq	%rax, %rcx
	call	fgetc
	movb	%al, 131026(%rbp)
	movzbl	131026(%rbp), %eax
	cmpb	131027(%rbp), %al
	je	.L84
	movzbl	131026(%rbp), %eax
	movb	%al, -49(%rbp)
	movq	131040(%rbp), %rax
	movq	%rax, %rcx
	call	fgetc
	jmp	.L85
.L84:
	movzbl	-50(%rbp), %eax
	movb	%al, -49(%rbp)
	movzbl	-51(%rbp), %eax
	movb	%al, -50(%rbp)
	movb	$48, -51(%rbp)
	jmp	.L85
.L83:
	movzbl	-51(%rbp), %eax
	movb	%al, -49(%rbp)
	movb	$48, -51(%rbp)
.L85:
	movl	$0, 131052(%rbp)
	jmp	.L86
.L87:
	movl	131052(%rbp), %eax
	cltq
	movzbl	-51(%rbp,%rax), %eax
	subl	$48, %eax
	movl	131052(%rbp), %edx
	movslq	%edx, %rdx
	movb	%al, -51(%rbp,%rdx)
	addl	$1, 131052(%rbp)
.L86:
	cmpl	$2, 131052(%rbp)
	jle	.L87
	movzbl	-51(%rbp), %eax
	movl	$100, %edx
	imull	%edx, %eax
	movl	%eax, %ecx
	movzbl	-50(%rbp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	leal	(%rcx,%rax), %edx
	movzbl	-49(%rbp), %eax
	addl	%edx, %eax
	movb	%al, 131051(%rbp)
	cmpb	$0, 131051(%rbp)
	jne	.L88
	movb	$-1, 131051(%rbp)
	jmp	.L89
.L88:
	subb	$1, 131051(%rbp)
.L89:
	movzbl	-49(%rbp), %eax
	movzbl	%al, %r8d
	movzbl	-50(%rbp), %eax
	movzbl	%al, %ecx
	movzbl	-51(%rbp), %eax
	movzbl	%al, %edx
	movzbl	131051(%rbp), %r9d
	movl	131028(%rbp), %r10d
	movl	131060(%rbp), %eax
	movl	%r8d, 48(%rsp)
	movl	%ecx, 40(%rsp)
	movl	%edx, 32(%rsp)
	movl	%r10d, %r8d
	movl	%eax, %edx
	leaq	.LC8(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	131060(%rbp), %eax
	movslq	%eax, %rdx
	movzbl	131051(%rbp), %eax
	movb	%al, -48(%rbp,%rdx)
	addl	$1, 131060(%rbp)
	jmp	.L90
.L91:
	nop
	jmp	.L79
.L92:
	nop
.L79:
	movl	131028(%rbp), %eax
	movslq	%eax, %rdx
	movq	131032(%rbp), %rcx
	leaq	-48(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	fwrite
	movq	131040(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movq	131032(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	nop
	addq	$131200, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	play_WAV
	.def	play_WAV;	.scl	2;	.type	32;	.endef
	.seh_proc	play_WAV
play_WAV:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	nop
	popq	%rbp
	ret
	.seh_endproc
	.globl	MAX_WATER_PARTICLES
	.section .rdata,"dr"
	.align 4
MAX_WATER_PARTICLES:
	.long	100
	.globl	waterParticles
	.bss
	.align 8
waterParticles:
	.space 8
	.text
	.globl	createWaterParticle
	.def	createWaterParticle;	.scl	2;	.type	32;	.endef
	.seh_proc	createWaterParticle
createWaterParticle:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	call	rand
	movl	%eax, %edx
	movslq	%edx, %rax
	imulq	$1427937179, %rax, %rax
	shrq	$32, %rax
	sarl	$8, %eax
	movl	%edx, %ecx
	sarl	$31, %ecx
	subl	%ecx, %eax
	imull	$770, %eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	leal	298(%rax), %ecx
	movq	waterParticles(%rip), %rdx
	movl	16(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%ecx, %xmm0
	movss	%xmm0, (%rax)
	call	rand
	cltd
	idivl	32(%rbp)
	movl	%edx, %eax
	negl	%eax
	movl	%eax, %ecx
	movq	waterParticles(%rip), %rdx
	movl	16(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%ecx, %xmm0
	movss	%xmm0, 4(%rax)
	movq	waterParticles(%rip), %rdx
	movl	16(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movss	.LC9(%rip), %xmm0
	movss	%xmm0, 8(%rax)
	movq	waterParticles(%rip), %rdx
	movl	16(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	$1, 12(%rax)
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	audioCallback
	.def	audioCallback;	.scl	2;	.type	32;	.endef
	.seh_proc	audioCallback
audioCallback:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	12(%rax), %edx
	movq	-8(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	%eax, %edx
	jb	.L96
	movq	-8(%rbp), %rax
	movl	$0, 12(%rax)
.L96:
	movq	-8(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-8(%rbp), %rax
	movl	12(%rax), %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	movl	%eax, -12(%rbp)
	movl	32(%rbp), %eax
	movl	-12(%rbp), %edx
	cmpl	%eax, %edx
	cmovbe	%edx, %eax
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %ecx
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movl	12(%rax), %eax
	movl	%eax, %eax
	addq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	SDL_memcpy
	movq	-8(%rbp), %rax
	movl	12(%rax), %edx
	movl	-16(%rbp), %eax
	addl	%eax, %edx
	movq	-8(%rbp), %rax
	movl	%edx, 12(%rax)
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC10:
	.ascii "Failed to allocate memory for water particles\12\0"
.LC11:
	.ascii "SDL init error:%s\12\0"
.LC12:
	.ascii "COSC345 - Game\0"
.LC13:
	.ascii "Window error\0"
.LC14:
	.ascii "Render error\0"
.LC15:
	.ascii "Surface error\0"
.LC16:
	.ascii "img/spr_grass.png\0"
.LC17:
	.ascii "img/spr_sand.png\0"
.LC18:
	.ascii "img/spr_water.png\0"
.LC19:
	.ascii "img/spr_lava.png\0"
.LC20:
	.ascii "img/player_strip8.png\0"
.LC21:
	.ascii "img/ascii_strip96.png\0"
.LC22:
	.ascii "rb\0"
.LC23:
	.ascii "level.dat\0"
.LC24:
	.ascii "music.wav\0"
.LC25:
	.ascii "Failed to load WAV file: %s\12\0"
	.align 8
.LC26:
	.ascii "Failed to open audio device: %s\12\0"
.LC27:
	.ascii "img/img_lands.png\0"
.LC28:
	.ascii "Press SPACE to continue.\0"
.LC29:
	.ascii "Entering main loop...\0"
.LC30:
	.ascii "F2 started!\0"
.LC31:
	.ascii "F2 finished!\0"
.LC32:
	.ascii "Location:#DUNEDIN#NEW ZEALAND\0"
.LC33:
	.ascii "LVL: XYZ/255\0"
.LC34:
	.ascii "X\0"
.LC35:
	.ascii "Y\0"
.LC36:
	.ascii "Z\0"
.LC37:
	.ascii "title has no texture!\0"
.LC40:
	.ascii "...exited main loop.\0"
.LC41:
	.ascii "%s Error returned: %s\12\0"
	.text
	.globl	SDL_main
	.def	SDL_main;	.scl	2;	.type	32;	.endef
	.seh_proc	SDL_main
SDL_main:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	movl	$66136, %eax
	call	___chkstk_ms
	subq	%rax, %rsp
	.seh_stackalloc	66136
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movl	%ecx, 66080(%rbp)
	movq	%rdx, 66088(%rbp)
	movq	%rsp, %rax
	movq	%rax, %rsi
	movq	$256, 65944(%rbp)
	movq	65944(%rbp), %rax
	subq	$1, %rax
	movq	%rax, 65936(%rbp)
	movq	65944(%rbp), %rax
	movq	%rax, %r10
	movl	$0, %r11d
	movq	65944(%rbp), %rax
	movq	%rax, %r8
	movl	$0, %r9d
	movq	65944(%rbp), %rax
	addq	$15, %rax
	shrq	$4, %rax
	salq	$4, %rax
	call	___chkstk_ms
	subq	%rax, %rsp
	leaq	80(%rsp), %rax
	addq	$0, %rax
	movq	%rax, 65928(%rbp)
	movl	$1366, 65924(%rbp)
	movl	$768, 65920(%rbp)
	movl	65924(%rbp), %eax
	subl	65920(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, 65916(%rbp)
	movl	$0, 65912(%rbp)
	movl	65920(%rbp), %eax
	movl	%eax, 65908(%rbp)
	movl	65920(%rbp), %eax
	movl	%eax, 65904(%rbp)
	movl	65916(%rbp), %edx
	movl	65908(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 65900(%rbp)
	movl	65912(%rbp), %edx
	movl	65904(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 65896(%rbp)
	movl	$16, 65892(%rbp)
	movl	$16, 65888(%rbp)
	movl	65892(%rbp), %eax
	movl	%eax, %ecx
	call	sqr
	movl	%eax, %edi
	movl	65920(%rbp), %eax
	cltd
	idivl	%edi
	movl	%eax, 65884(%rbp)
	movl	65884(%rbp), %eax
	movl	%eax, 65880(%rbp)
	movl	$100, %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rcx
	call	malloc
	movq	%rax, waterParticles(%rip)
	movq	waterParticles(%rip), %rax
	testq	%rax, %rax
	jne	.L98
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %r9
	movl	$46, %r8d
	movl	$1, %edx
	leaq	.LC10(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$1, %eax
	jmp	.L99
.L98:
	movl	$0, %ecx
	call	time
	movl	%eax, %ecx
	call	srand
	movl	$0, 65996(%rbp)
	jmp	.L100
.L101:
	movl	65920(%rbp), %ecx
	movl	65924(%rbp), %edx
	movl	65996(%rbp), %eax
	movl	%ecx, %r8d
	movl	%eax, %ecx
	call	createWaterParticle
	addl	$1, 65996(%rbp)
.L100:
	movl	$100, %eax
	cmpl	%eax, 65996(%rbp)
	jl	.L101
	movl	$62001, 65876(%rbp)
	movl	65876(%rbp), %eax
	movl	%eax, %ecx
	call	SDL_Init
	testl	%eax, %eax
	je	.L102
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC11(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L99
.L102:
	movl	65924(%rbp), %edx
	movl	$0, 40(%rsp)
	movl	65920(%rbp), %eax
	movl	%eax, 32(%rsp)
	movl	%edx, %r9d
	movl	$536805376, %r8d
	movl	$536805376, %edx
	leaq	.LC12(%rip), %rax
	movq	%rax, %rcx
	call	SDL_CreateWindow
	movq	%rax, 65864(%rbp)
	cmpq	$0, 65864(%rbp)
	jne	.L103
	movq	65944(%rbp), %rdx
	movq	65928(%rbp), %rax
	leaq	.LC13(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L104
.L103:
	movq	65864(%rbp), %rax
	movl	$4, %r8d
	movl	$-1, %edx
	movq	%rax, %rcx
	call	SDL_CreateRenderer
	movq	%rax, 65856(%rbp)
	cmpq	$0, 65856(%rbp)
	jne	.L105
	movq	65944(%rbp), %rdx
	movq	65928(%rbp), %rax
	leaq	.LC14(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L104
.L105:
	movq	65864(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_GetWindowSurface
	movq	%rax, 65848(%rbp)
	cmpq	$0, 65848(%rbp)
	jne	.L106
	movq	65944(%rbp), %rdx
	movq	65928(%rbp), %rax
	leaq	.LC15(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L104
.L106:
	movl	$2, %ecx
	call	IMG_Init
	movq	65856(%rbp), %rax
	leaq	.LC16(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 65840(%rbp)
	movq	65856(%rbp), %rax
	leaq	.LC17(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 65832(%rbp)
	movq	65856(%rbp), %rax
	leaq	.LC18(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 65824(%rbp)
	movq	65856(%rbp), %rax
	leaq	.LC19(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 65816(%rbp)
	movq	65856(%rbp), %rax
	leaq	.LC20(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 65808(%rbp)
	movq	65856(%rbp), %rax
	leaq	.LC21(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 65800(%rbp)
	movl	$8, 65796(%rbp)
	movl	$16, 65792(%rbp)
	movl	65892(%rbp), %eax
	movl	%eax, %ecx
	call	sqr
	movl	%eax, 65788(%rbp)
	movl	$256, 65784(%rbp)
	movl	$0, 65992(%rbp)
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC23(%rip), %rax
	movq	%rax, %rcx
	call	fopen
	movq	%rax, 65776(%rbp)
	movl	$0, 65988(%rbp)
	jmp	.L107
.L108:
	movl	65988(%rbp), %eax
	cltq
	movb	$0, 48(%rbp,%rax)
	addl	$1, 65988(%rbp)
.L107:
	movl	65788(%rbp), %eax
	imull	65784(%rbp), %eax
	cmpl	%eax, 65988(%rbp)
	jl	.L108
	movq	65776(%rbp), %rdx
	leaq	48(%rbp), %rax
	movq	%rdx, %r9
	movl	$1, %r8d
	movl	$65536, %edx
	movq	%rax, %rcx
	call	fread
	movq	65776(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movl	65884(%rbp), %eax
	imull	65888(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	65916(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 16(%rbp)
	movl	65880(%rbp), %eax
	imull	65888(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	65912(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 20(%rbp)
	movb	$0, 32(%rbp)
	movb	$0, 33(%rbp)
	movb	$1, 34(%rbp)
	movb	$12, 35(%rbp)
	movb	$0, 36(%rbp)
	movb	$2, 37(%rbp)
	movb	$12, 38(%rbp)
	leaq	.LC24(%rip), %rax
	movq	%rax, 65768(%rbp)
	movq	65768(%rbp), %rax
	leaq	.LC22(%rip), %rdx
	movq	%rax, %rcx
	call	SDL_RWFromFile
	movq	%rax, %rcx
	leaq	-24(%rbp), %r8
	leaq	-16(%rbp), %rdx
	leaq	-28(%rbp), %rax
	movq	%rax, 32(%rsp)
	movq	%r8, %r9
	movq	%rdx, %r8
	movl	$1, %edx
	call	SDL_LoadWAV_RW
	testq	%rax, %rax
	jne	.L109
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC25(%rip), %rax
	movq	%rax, %rcx
	call	printf
	jmp	.L110
.L109:
	movq	-24(%rbp), %rax
	movq	%rax, -48(%rbp)
	movl	-28(%rbp), %eax
	movl	%eax, -40(%rbp)
	movl	$0, -36(%rbp)
	leaq	audioCallback(%rip), %rax
	movq	%rax, 0(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, 8(%rbp)
	leaq	-16(%rbp), %rax
	movl	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$0, %ecx
	call	SDL_OpenAudioDevice
	movl	%eax, 65764(%rbp)
	cmpl	$0, 65764(%rbp)
	jne	.L111
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC26(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_FreeWAV
	jmp	.L110
.L111:
	movl	-28(%rbp), %ecx
	movq	-24(%rbp), %rdx
	movl	65764(%rbp), %eax
	movl	%ecx, %r8d
	movl	%eax, %ecx
	call	SDL_QueueAudio
	movl	65764(%rbp), %eax
	movl	$0, %edx
	movl	%eax, %ecx
	call	SDL_PauseAudioDevice
	movl	$1, 65984(%rbp)
	movq	65856(%rbp), %rax
	leaq	.LC27(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 65752(%rbp)
	leaq	.LC28(%rip), %rax
	movq	%rax, 65744(%rbp)
	movl	$1, 65980(%rbp)
	leaq	.LC29(%rip), %rax
	movq	%rax, %rcx
	call	puts
	jmp	.L112
.L137:
	movl	65584(%rbp), %eax
	cmpl	$769, %eax
	je	.L114
	cmpl	$769, %eax
	ja	.L113
	cmpl	$256, %eax
	je	.L115
	cmpl	$768, %eax
	je	.L116
	jmp	.L113
.L115:
	movl	$0, 65980(%rbp)
	jmp	.L113
.L116:
	movl	$1, 65640(%rbp)
	movl	65604(%rbp), %eax
	cmpl	$1073741912, %eax
	jg	.L113
	cmpl	$1073741883, %eax
	jge	.L118
	cmpl	$27, %eax
	je	.L119
	cmpl	$32, %eax
	je	.L120
	jmp	.L113
.L118:
	subl	$1073741883, %eax
	cmpl	$29, %eax
	ja	.L113
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L122(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L122(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L122:
	.long	.L127-.L122
	.long	.L113-.L122
	.long	.L113-.L122
	.long	.L113-.L122
	.long	.L113-.L122
	.long	.L113-.L122
	.long	.L113-.L122
	.long	.L113-.L122
	.long	.L113-.L122
	.long	.L113-.L122
	.long	.L113-.L122
	.long	.L113-.L122
	.long	.L113-.L122
	.long	.L113-.L122
	.long	.L113-.L122
	.long	.L113-.L122
	.long	.L113-.L122
	.long	.L113-.L122
	.long	.L113-.L122
	.long	.L113-.L122
	.long	.L126-.L122
	.long	.L125-.L122
	.long	.L124-.L122
	.long	.L123-.L122
	.long	.L113-.L122
	.long	.L113-.L122
	.long	.L113-.L122
	.long	.L113-.L122
	.long	.L113-.L122
	.long	.L121-.L122
	.text
.L119:
	movl	$0, 65980(%rbp)
	jmp	.L117
.L126:
	movl	65640(%rbp), %eax
	movl	%eax, glob_vk_right(%rip)
	jmp	.L117
.L125:
	movl	65640(%rbp), %eax
	movl	%eax, glob_vk_left(%rip)
	jmp	.L117
.L123:
	movl	65640(%rbp), %eax
	movl	%eax, glob_vk_up(%rip)
	jmp	.L117
.L124:
	movl	65640(%rbp), %eax
	movl	%eax, glob_vk_down(%rip)
	jmp	.L117
.L120:
	movl	65640(%rbp), %eax
	movl	%eax, glob_vk_space(%rip)
	jmp	.L117
.L121:
	movl	65640(%rbp), %eax
	movl	%eax, glob_vk_enter(%rip)
	jmp	.L117
.L127:
	movl	65640(%rbp), %eax
	movl	%eax, glob_vk_f2(%rip)
	nop
.L117:
	jmp	.L113
.L114:
	movl	$0, 65644(%rbp)
	movl	65604(%rbp), %eax
	cmpl	$32, %eax
	je	.L128
	cmpl	$32, %eax
	jl	.L178
	cmpl	$1073741912, %eax
	jg	.L178
	cmpl	$1073741883, %eax
	jl	.L178
	subl	$1073741883, %eax
	cmpl	$29, %eax
	ja	.L178
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L131(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L131(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L131:
	.long	.L136-.L131
	.long	.L178-.L131
	.long	.L178-.L131
	.long	.L178-.L131
	.long	.L178-.L131
	.long	.L178-.L131
	.long	.L178-.L131
	.long	.L178-.L131
	.long	.L178-.L131
	.long	.L178-.L131
	.long	.L178-.L131
	.long	.L178-.L131
	.long	.L178-.L131
	.long	.L178-.L131
	.long	.L178-.L131
	.long	.L178-.L131
	.long	.L178-.L131
	.long	.L178-.L131
	.long	.L178-.L131
	.long	.L178-.L131
	.long	.L135-.L131
	.long	.L134-.L131
	.long	.L133-.L131
	.long	.L132-.L131
	.long	.L178-.L131
	.long	.L178-.L131
	.long	.L178-.L131
	.long	.L178-.L131
	.long	.L178-.L131
	.long	.L130-.L131
	.text
.L135:
	movl	65644(%rbp), %eax
	movl	%eax, glob_vk_right(%rip)
	jmp	.L129
.L134:
	movl	65644(%rbp), %eax
	movl	%eax, glob_vk_left(%rip)
	jmp	.L129
.L132:
	movl	65644(%rbp), %eax
	movl	%eax, glob_vk_up(%rip)
	jmp	.L129
.L133:
	movl	65644(%rbp), %eax
	movl	%eax, glob_vk_down(%rip)
	jmp	.L129
.L128:
	movl	65644(%rbp), %eax
	movl	%eax, glob_vk_space(%rip)
	jmp	.L129
.L130:
	movl	65644(%rbp), %eax
	movl	%eax, glob_vk_enter(%rip)
	jmp	.L129
.L136:
	movl	65644(%rbp), %eax
	movl	%eax, glob_vk_f2(%rip)
	nop
.L129:
.L178:
	nop
.L113:
	leaq	65584(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_PollEvent
	testl	%eax, %eax
	jne	.L137
	movl	glob_vk_f2(%rip), %eax
	testl	%eax, %eax
	je	.L138
	leaq	.LC30(%rip), %rax
	movq	%rax, %rcx
	call	puts
	call	dev_tiled_to_leveldata
	leaq	.LC31(%rip), %rax
	movq	%rax, %rcx
	call	puts
.L138:
	movl	glob_vk_right(%rip), %eax
	testl	%eax, %eax
	je	.L139
	movb	$0, 32(%rbp)
	movl	16(%rbp), %edx
	movzbl	38(%rbp), %eax
	movzbl	%al, %eax
	addl	%edx, %eax
	movl	%eax, 16(%rbp)
.L139:
	movl	glob_vk_up(%rip), %eax
	testl	%eax, %eax
	je	.L140
	movb	$1, 32(%rbp)
	movl	20(%rbp), %edx
	movzbl	38(%rbp), %eax
	movzbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, 20(%rbp)
.L140:
	movl	glob_vk_left(%rip), %eax
	testl	%eax, %eax
	je	.L141
	movb	$2, 32(%rbp)
	movl	16(%rbp), %edx
	movzbl	38(%rbp), %eax
	movzbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, 16(%rbp)
.L141:
	movl	glob_vk_down(%rip), %eax
	testl	%eax, %eax
	je	.L142
	movb	$3, 32(%rbp)
	movl	20(%rbp), %edx
	movzbl	38(%rbp), %eax
	movzbl	%al, %eax
	addl	%edx, %eax
	movl	%eax, 20(%rbp)
.L142:
	movl	glob_vk_right(%rip), %edx
	movl	glob_vk_left(%rip), %eax
	orl	%eax, %edx
	movl	glob_vk_up(%rip), %eax
	orl	%eax, %edx
	movl	glob_vk_down(%rip), %eax
	orl	%edx, %eax
	testl	%eax, %eax
	je	.L143
	movzbl	33(%rbp), %edx
	movzbl	34(%rbp), %eax
	addl	%edx, %eax
	movb	%al, 33(%rbp)
	movzbl	36(%rbp), %ecx
	movzbl	33(%rbp), %edx
	movzbl	35(%rbp), %eax
	cmpb	%al, %dl
	setnb	%al
	addl	%ecx, %eax
	movb	%al, 36(%rbp)
	movzbl	33(%rbp), %eax
	movzbl	35(%rbp), %edx
	movzbl	%al, %eax
	divb	%dl
	movzbl	%ah, %eax
	movb	%al, 33(%rbp)
	movzbl	36(%rbp), %eax
	movzbl	37(%rbp), %edx
	movzbl	%al, %eax
	divb	%dl
	movzbl	%ah, %eax
	movb	%al, 36(%rbp)
	movl	65888(%rbp), %eax
	imull	65884(%rbp), %eax
	movl	65900(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, 65740(%rbp)
	movl	65912(%rbp), %eax
	movl	%eax, 65736(%rbp)
	movl	65916(%rbp), %eax
	movl	%eax, 65732(%rbp)
	movl	65888(%rbp), %eax
	imull	65880(%rbp), %eax
	movl	65896(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, 65728(%rbp)
	movl	$0, 65724(%rbp)
	movl	16(%rbp), %eax
	cmpl	%eax, 65740(%rbp)
	jl	.L144
	movl	20(%rbp), %eax
	cmpl	%eax, 65728(%rbp)
	jl	.L144
	movl	16(%rbp), %eax
	cmpl	%eax, 65732(%rbp)
	jg	.L144
	movl	20(%rbp), %eax
	cmpl	%eax, 65736(%rbp)
	jle	.L145
.L144:
	movl	$1, %eax
	jmp	.L146
.L145:
	movl	$0, %eax
.L146:
	movl	%eax, 65724(%rbp)
	movl	16(%rbp), %eax
	cmpl	%eax, 65740(%rbp)
	jge	.L147
	movl	65732(%rbp), %eax
	movl	%eax, 16(%rbp)
	addl	$1, 65992(%rbp)
.L147:
	movl	20(%rbp), %eax
	cmpl	%eax, 65736(%rbp)
	jle	.L148
	movl	65728(%rbp), %eax
	movl	%eax, 20(%rbp)
	pxor	%xmm2, %xmm2
	cvtsi2sdl	65784(%rbp), %xmm2
	movq	%xmm2, %rax
	movq	%rax, %xmm0
	call	sqrt
	cvttsd2sil	%xmm0, %eax
	subl	%eax, 65992(%rbp)
.L148:
	movl	16(%rbp), %eax
	cmpl	%eax, 65732(%rbp)
	jle	.L149
	movl	65740(%rbp), %eax
	movl	%eax, 16(%rbp)
	subl	$1, 65992(%rbp)
.L149:
	movl	20(%rbp), %eax
	cmpl	%eax, 65728(%rbp)
	jge	.L150
	movl	65736(%rbp), %eax
	movl	%eax, 20(%rbp)
	pxor	%xmm3, %xmm3
	cvtsi2sdl	65784(%rbp), %xmm3
	movq	%xmm3, %rax
	movq	%rax, %xmm0
	call	sqrt
	cvttsd2sil	%xmm0, %eax
	addl	%eax, 65992(%rbp)
.L150:
	cmpl	$0, 65724(%rbp)
	je	.L151
	movl	65784(%rbp), %eax
	addl	%eax, 65992(%rbp)
	movl	65992(%rbp), %eax
	cltd
	idivl	65784(%rbp)
	movl	%edx, 65992(%rbp)
	jmp	.L151
.L143:
	movb	$0, 33(%rbp)
	movb	$0, 36(%rbp)
.L151:
	movl	glob_vk_space(%rip), %edx
	movl	glob_vk_enter(%rip), %eax
	orl	%edx, %eax
	testl	%eax, %eax
	je	.L152
	movl	$0, 65984(%rbp)
.L152:
	movl	16(%rbp), %eax
	movl	%eax, 24(%rbp)
	movl	20(%rbp), %eax
	movl	%eax, 28(%rbp)
	movl	$0, %edx
	movq	65856(%rbp), %rax
	movq	%rax, %rcx
	call	draw_clear
	movl	$16777215, %edx
	movq	65856(%rbp), %rax
	movq	%rax, %rcx
	call	draw_set_color
	movl	$33023, %edx
	movl	65916(%rbp), %ecx
	movq	65856(%rbp), %rax
	movl	%edx, 40(%rsp)
	movl	65920(%rbp), %edx
	movl	%edx, 32(%rsp)
	movl	%ecx, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	$8388863, %ecx
	movl	65924(%rbp), %eax
	subl	65916(%rbp), %eax
	movl	%eax, %r8d
	movl	65916(%rbp), %edx
	movq	65856(%rbp), %rax
	movl	%ecx, 40(%rsp)
	movl	65920(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movl	%r8d, %r9d
	movl	$0, %r8d
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	$33023, %edx
	movl	65924(%rbp), %eax
	subl	65916(%rbp), %eax
	movl	65924(%rbp), %r8d
	movq	65856(%rbp), %rcx
	movl	%edx, 40(%rsp)
	movl	65920(%rbp), %edx
	movl	%edx, 32(%rsp)
	movl	%r8d, %r9d
	movl	$0, %r8d
	movl	%eax, %edx
	call	draw_rectangle_color
	movl	$0, 65720(%rbp)
	movl	$0, 65716(%rbp)
	cmpl	$0, 65984(%rbp)
	jne	.L153
	movl	65880(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %ecx
	movl	65884(%rbp), %eax
	leal	0(,%rax,8), %r9d
	movl	65716(%rbp), %r10d
	movl	65720(%rbp), %edx
	movq	65856(%rbp), %rax
	movl	65792(%rbp), %r8d
	movl	%r8d, 64(%rsp)
	movl	65796(%rbp), %r8d
	movl	%r8d, 56(%rsp)
	leaq	.LC32(%rip), %r8
	movq	%r8, 48(%rsp)
	movq	65800(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	draw_text
.L153:
	movl	65900(%rbp), %eax
	movl	%eax, 65720(%rbp)
	movl	$0, 65716(%rbp)
	cmpl	$0, 65984(%rbp)
	jne	.L154
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	.LC33(%rip), %rax
	movq	%rax, 65704(%rbp)
	movq	65704(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	subq	$1, %rdx
	movq	%rdx, 65696(%rbp)
	movq	%rax, %r12
	movl	$0, %r13d
	movq	%rax, %r14
	movl	$0, %r15d
	addq	$15, %rax
	shrq	$4, %rax
	salq	$4, %rax
	call	___chkstk_ms
	subq	%rax, %rsp
	leaq	80(%rsp), %rax
	addq	$0, %rax
	movq	%rax, 65688(%rbp)
	movq	65704(%rbp), %rdx
	movq	65688(%rbp), %rax
	movq	%rax, %rcx
	call	strcpy
	movl	65992(%rbp), %eax
	movb	%al, 65687(%rbp)
	movzbl	65687(%rbp), %eax
	movl	$41, %edx
	mulb	%dl
	shrw	$8, %ax
	movl	%eax, %ecx
	shrb	$4, %cl
	movl	$-51, %edx
	movl	%edx, %eax
	mulb	%cl
	shrw	$8, %ax
	movl	%eax, %edx
	shrb	$3, %dl
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	leal	48(%rdx), %ebx
	movq	65688(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC34(%rip), %rax
	movq	%rax, %rcx
	call	string_pos
	movl	%ebx, %ecx
	movq	65688(%rbp), %rdx
	cltq
	movb	%cl, (%rdx,%rax)
	movzbl	65687(%rbp), %eax
	movl	$-51, %edx
	mulb	%dl
	shrw	$8, %ax
	movl	%eax, %ecx
	shrb	$3, %cl
	movl	$-51, %edx
	movl	%edx, %eax
	mulb	%cl
	shrw	$8, %ax
	movl	%eax, %edx
	shrb	$3, %dl
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	leal	48(%rdx), %ebx
	movq	65688(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC35(%rip), %rax
	movq	%rax, %rcx
	call	string_pos
	movl	%ebx, %ecx
	movq	65688(%rbp), %rdx
	cltq
	movb	%cl, (%rdx,%rax)
	movzbl	65687(%rbp), %ecx
	movl	$-51, %edx
	movl	%edx, %eax
	mulb	%cl
	shrw	$8, %ax
	movl	%eax, %edx
	shrb	$3, %dl
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	leal	48(%rdx), %ebx
	movq	65688(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC36(%rip), %rax
	movq	%rax, %rcx
	call	string_pos
	movl	%ebx, %ecx
	movq	65688(%rbp), %rdx
	cltq
	movb	%cl, (%rdx,%rax)
	movl	65880(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %ecx
	movl	65884(%rbp), %eax
	leal	0(,%rax,8), %r9d
	movl	65716(%rbp), %r10d
	movl	65720(%rbp), %edx
	movq	65856(%rbp), %rax
	movl	65792(%rbp), %r8d
	movl	%r8d, 64(%rsp)
	movl	65796(%rbp), %r8d
	movl	%r8d, 56(%rsp)
	movq	65688(%rbp), %r8
	movq	%r8, 48(%rsp)
	movq	65800(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	draw_text
	movq	%rdi, %rsp
.L154:
	movl	$0, 65976(%rbp)
	jmp	.L155
.L164:
	movl	$0, 65972(%rbp)
	jmp	.L156
.L163:
	movl	65976(%rbp), %eax
	imull	65892(%rbp), %eax
	movl	65972(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65676(%rbp)
	movl	65972(%rbp), %eax
	imull	65884(%rbp), %eax
	imull	65888(%rbp), %eax
	movl	65916(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65672(%rbp)
	movl	65976(%rbp), %eax
	imull	65880(%rbp), %eax
	imull	65888(%rbp), %eax
	movl	65912(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65668(%rbp)
	movl	65972(%rbp), %eax
	addl	$1, %eax
	imull	65884(%rbp), %eax
	imull	65888(%rbp), %eax
	movl	65916(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65664(%rbp)
	movl	65976(%rbp), %eax
	addl	$1, %eax
	imull	65880(%rbp), %eax
	imull	65888(%rbp), %eax
	movl	65912(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65660(%rbp)
	movl	$16711680, %r9d
	movl	$65280, %r8d
	movl	$255, %r10d
	movl	65676(%rbp), %ecx
	movslq	%ecx, %rax
	imulq	$1431655766, %rax, %rax
	shrq	$32, %rax
	movl	%ecx, %edx
	sarl	$31, %edx
	subl	%edx, %eax
	movl	%eax, %edx
	addl	%edx, %edx
	addl	%eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	movl	%r10d, %edx
	movl	%eax, %ecx
	call	mux_int
	movl	%eax, 65656(%rbp)
	movl	65664(%rbp), %r9d
	movl	65668(%rbp), %r8d
	movl	65672(%rbp), %edx
	movq	65856(%rbp), %rax
	movl	65656(%rbp), %ecx
	movl	%ecx, 40(%rsp)
	movl	65660(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	65788(%rbp), %eax
	imull	65992(%rbp), %eax
	movl	65676(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65652(%rbp)
	movl	65652(%rbp), %eax
	cltq
	movzbl	48(%rbp,%rax), %eax
	movzbl	%al, %eax
	andl	$3, %eax
	movl	%eax, 65648(%rbp)
	cmpl	$3, 65648(%rbp)
	je	.L157
	cmpl	$3, 65648(%rbp)
	jg	.L158
	cmpl	$2, 65648(%rbp)
	je	.L159
	cmpl	$2, 65648(%rbp)
	jg	.L158
	cmpl	$0, 65648(%rbp)
	je	.L160
	cmpl	$1, 65648(%rbp)
	je	.L161
	jmp	.L158
.L160:
	movq	65840(%rbp), %rax
	movq	%rax, 65960(%rbp)
	jmp	.L162
.L161:
	movq	65832(%rbp), %rax
	movq	%rax, 65960(%rbp)
	jmp	.L162
.L159:
	movq	65824(%rbp), %rax
	movq	%rax, 65960(%rbp)
	jmp	.L162
.L157:
	movq	65816(%rbp), %rax
	movq	%rax, 65960(%rbp)
	jmp	.L162
.L158:
	movq	65840(%rbp), %rax
	movq	%rax, 65960(%rbp)
	leaq	.LC37(%rip), %rax
	movq	%rax, %rcx
	call	puts
	nop
.L162:
	movl	65664(%rbp), %r9d
	movl	65668(%rbp), %r8d
	movl	65672(%rbp), %edx
	movq	65856(%rbp), %rax
	movq	65960(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	65660(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_image
	addl	$1, 65972(%rbp)
.L156:
	movl	65972(%rbp), %eax
	cmpl	65892(%rbp), %eax
	jl	.L163
	addl	$1, 65976(%rbp)
.L155:
	movl	65976(%rbp), %eax
	cmpl	65892(%rbp), %eax
	jl	.L164
	movl	65888(%rbp), %eax
	movl	%eax, 65680(%rbp)
	movzbl	32(%rbp), %eax
	movzbl	%al, %eax
	imull	65680(%rbp), %eax
	movl	%eax, %edx
	movzbl	37(%rbp), %eax
	movzbl	%al, %eax
	imull	%eax, %edx
	movzbl	36(%rbp), %eax
	movzbl	%al, %eax
	imull	65680(%rbp), %eax
	leal	(%rdx,%rax), %r8d
	movl	20(%rbp), %edx
	movl	65680(%rbp), %eax
	imull	65880(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	movl	16(%rbp), %edx
	movl	65680(%rbp), %eax
	imull	65884(%rbp), %eax
	leal	(%rdx,%rax), %r11d
	movl	20(%rbp), %r10d
	movl	16(%rbp), %edx
	movq	65856(%rbp), %rax
	movl	65680(%rbp), %r9d
	movl	%r9d, 72(%rsp)
	movl	65680(%rbp), %r9d
	movl	%r9d, 64(%rsp)
	movl	$0, 56(%rsp)
	movl	%r8d, 48(%rsp)
	movq	65808(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	%r11d, %r9d
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	draw_image_part
	movl	$0, 65956(%rbp)
	jmp	.L165
.L169:
	movq	waterParticles(%rip), %rdx
	movl	65956(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	12(%rax), %eax
	testl	%eax, %eax
	je	.L166
	movq	waterParticles(%rip), %rdx
	movl	65956(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm1
	movq	waterParticles(%rip), %rdx
	movl	65956(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movss	8(%rax), %xmm0
	movq	waterParticles(%rip), %rdx
	movl	65956(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	addss	%xmm1, %xmm0
	movss	%xmm0, 4(%rax)
	movq	waterParticles(%rip), %rdx
	movl	65956(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2ssl	65920(%rbp), %xmm1
	comiss	%xmm1, %xmm0
	jbe	.L166
	call	rand
	movl	%eax, %edx
	movslq	%edx, %rax
	imulq	$1374389535, %rax, %rax
	shrq	$32, %rax
	sarl	$5, %eax
	movl	%edx, %ecx
	sarl	$31, %ecx
	subl	%ecx, %eax
	imull	$100, %eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	cmpl	$4, %eax
	jg	.L168
	movq	waterParticles(%rip), %rdx
	movl	65956(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	$0, 12(%rax)
	jmp	.L166
.L168:
	movl	65920(%rbp), %ecx
	movl	65924(%rbp), %edx
	movl	65956(%rbp), %eax
	movl	%ecx, %r8d
	movl	%eax, %ecx
	call	createWaterParticle
.L166:
	addl	$1, 65956(%rbp)
.L165:
	movl	$100, %eax
	cmpl	%eax, 65956(%rbp)
	jl	.L169
	movl	$0, 65952(%rbp)
	jmp	.L170
.L172:
	movq	waterParticles(%rip), %rdx
	movl	65952(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	12(%rax), %eax
	testl	%eax, %eax
	je	.L171
	movq	waterParticles(%rip), %rdx
	movl	65952(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm1
	movss	.LC38(%rip), %xmm0
	addss	%xmm1, %xmm0
	cvttss2sil	%xmm0, %edx
	movq	waterParticles(%rip), %rcx
	movl	65952(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm1
	movss	.LC39(%rip), %xmm0
	addss	%xmm1, %xmm0
	cvttss2sil	%xmm0, %r9d
	movq	waterParticles(%rip), %rcx
	movl	65952(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movss	4(%rax), %xmm0
	cvttss2sil	%xmm0, %r10d
	movq	waterParticles(%rip), %rcx
	movl	65952(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm0
	cvttss2sil	%xmm0, %eax
	movq	65856(%rbp), %rcx
	movq	65824(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%edx, 32(%rsp)
	movl	%r10d, %r8d
	movl	%eax, %edx
	call	draw_image
.L171:
	addl	$1, 65952(%rbp)
.L170:
	movl	$100, %eax
	cmpl	%eax, 65952(%rbp)
	jl	.L172
	cmpl	$0, 65984(%rbp)
	je	.L173
	movl	65900(%rbp), %r9d
	movl	65912(%rbp), %r8d
	movl	65916(%rbp), %edx
	movq	65856(%rbp), %rax
	movq	65752(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	65896(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_image
	movl	65880(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %ecx
	movl	65884(%rbp), %eax
	leal	0(,%rax,8), %r9d
	movl	65912(%rbp), %r10d
	movl	65916(%rbp), %edx
	movq	65856(%rbp), %rax
	movl	65792(%rbp), %r8d
	movl	%r8d, 64(%rsp)
	movl	65796(%rbp), %r8d
	movl	%r8d, 56(%rsp)
	movq	65744(%rbp), %r8
	movq	%r8, 48(%rsp)
	movq	65800(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	draw_text
.L173:
	movq	65856(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_RenderPresent
	movl	$16, %ecx
	call	SDL_Delay
.L112:
	cmpl	$0, 65980(%rbp)
	jne	.L113
	leaq	.LC40(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movq	waterParticles(%rip), %rax
	movq	%rax, %rcx
	call	free
	movq	65840(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	65832(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	65824(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	65816(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	65808(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	65752(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	65800(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	call	IMG_Quit
	movl	65764(%rbp), %eax
	movl	%eax, %ecx
	call	SDL_CloseAudioDevice
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_FreeWAV
	movq	65856(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyRenderer
	movq	65864(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyWindow
	call	SDL_Quit
	movl	$500, %ecx
	call	SDL_Delay
	movl	$0, %eax
	jmp	.L99
.L104:
	call	SDL_GetError
	movq	%rax, %rbx
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	65928(%rbp), %rax
	movq	%rbx, %r9
	movq	%rax, %r8
	leaq	.LC41(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	call	SDL_Quit
	movl	$1, %ecx
	call	exit
.L99:
	movq	%rsi, %rsp
	jmp	.L97
.L110:
	movq	%rsi, %rsp
.L97:
	leaq	66008(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
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
	.align 4
.LC9:
	.long	1092616192
	.align 4
.LC38:
	.long	1097859072
	.align 4
.LC39:
	.long	1084227584
	.ident	"GCC: (x86_64-posix-seh-rev2, Built by MinGW-W64 project) 12.2.0"
	.def	SDL_FillRect;	.scl	2;	.type	32;	.endef
	.def	SDL_GetError;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	SDL_Quit;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	SDL_SetRenderDrawColor;	.scl	2;	.type	32;	.endef
	.def	SDL_RenderClear;	.scl	2;	.type	32;	.endef
	.def	SDL_RenderFillRect;	.scl	2;	.type	32;	.endef
	.def	SDL_RenderCopy;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	SDL_GetTicks;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	fgetc;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	rand;	.scl	2;	.type	32;	.endef
	.def	SDL_memcpy;	.scl	2;	.type	32;	.endef
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	srand;	.scl	2;	.type	32;	.endef
	.def	SDL_Init;	.scl	2;	.type	32;	.endef
	.def	SDL_CreateWindow;	.scl	2;	.type	32;	.endef
	.def	snprintf;	.scl	2;	.type	32;	.endef
	.def	SDL_CreateRenderer;	.scl	2;	.type	32;	.endef
	.def	SDL_GetWindowSurface;	.scl	2;	.type	32;	.endef
	.def	IMG_Init;	.scl	2;	.type	32;	.endef
	.def	IMG_LoadTexture;	.scl	2;	.type	32;	.endef
	.def	fread;	.scl	2;	.type	32;	.endef
	.def	SDL_RWFromFile;	.scl	2;	.type	32;	.endef
	.def	SDL_LoadWAV_RW;	.scl	2;	.type	32;	.endef
	.def	SDL_OpenAudioDevice;	.scl	2;	.type	32;	.endef
	.def	SDL_FreeWAV;	.scl	2;	.type	32;	.endef
	.def	SDL_QueueAudio;	.scl	2;	.type	32;	.endef
	.def	SDL_PauseAudioDevice;	.scl	2;	.type	32;	.endef
	.def	SDL_PollEvent;	.scl	2;	.type	32;	.endef
	.def	sqrt;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	SDL_RenderPresent;	.scl	2;	.type	32;	.endef
	.def	SDL_Delay;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	SDL_DestroyTexture;	.scl	2;	.type	32;	.endef
	.def	IMG_Quit;	.scl	2;	.type	32;	.endef
	.def	SDL_CloseAudioDevice;	.scl	2;	.type	32;	.endef
	.def	SDL_DestroyRenderer;	.scl	2;	.type	32;	.endef
	.def	SDL_DestroyWindow;	.scl	2;	.type	32;	.endef
