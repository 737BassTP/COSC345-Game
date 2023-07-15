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
	movl	32(%rbp), %ecx
	movl	-8(%rbp), %edx
	addl	%edx, %ecx
	movl	48(%rbp), %edx
	addl	%edx, %ecx
	movl	24(%rbp), %r8d
	movl	-4(%rbp), %edx
	addl	%edx, %r8d
	movl	40(%rbp), %edx
	leal	(%r8,%rdx), %r9d
	movl	32(%rbp), %r8d
	movl	-8(%rbp), %edx
	leal	(%r8,%rdx), %r10d
	movl	24(%rbp), %r8d
	movl	-4(%rbp), %edx
	addl	%r8d, %edx
	movl	80(%rbp), %r8d
	movl	%r8d, 72(%rsp)
	movl	72(%rbp), %r8d
	movl	%r8d, 64(%rsp)
	movl	$0, 56(%rsp)
	movl	%eax, 48(%rsp)
	movq	56(%rbp), %rax
	movq	%rax, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	%r10d, %r8d
	movq	16(%rbp), %rcx
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
	jmp	.L40
.L43:
	movq	-24(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movl	(%rax), %eax
	movl	%eax, -12(%rbp)
	movl	24(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jne	.L41
	movl	-4(%rbp), %eax
	jmp	.L44
.L41:
	addl	$1, -4(%rbp)
.L40:
	movl	-4(%rbp), %eax
	cmpl	16(%rbp), %eax
	jl	.L43
	movl	$-1, %eax
.L44:
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
	jl	.L56
	movl	16(%rbp), %eax
	cmpl	48(%rbp), %eax
	jge	.L56
	movl	24(%rbp), %eax
	cmpl	40(%rbp), %eax
	jl	.L56
	movl	24(%rbp), %eax
	cmpl	56(%rbp), %eax
	jge	.L56
	movl	$1, %eax
	jmp	.L58
.L56:
	movl	$0, %eax
.L58:
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
	movl	56(%rbp), %r8d
	movl	48(%rbp), %ecx
	movl	24(%rbp), %eax
	movl	72(%rbp), %edx
	movl	%edx, 40(%rsp)
	movl	64(%rbp), %edx
	movl	%edx, 32(%rsp)
	movl	%r8d, %r9d
	movl	%ecx, %r8d
	movl	%eax, %edx
	movl	16(%rbp), %ecx
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
	movl	56(%rbp), %r8d
	movl	48(%rbp), %ecx
	movl	40(%rbp), %eax
	movl	72(%rbp), %edx
	movl	%edx, 40(%rsp)
	movl	64(%rbp), %edx
	movl	%edx, 32(%rsp)
	movl	%r8d, %r9d
	movl	%ecx, %r8d
	movl	%eax, %edx
	movl	16(%rbp), %ecx
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
	jne	.L60
	movl	$0, %eax
	jmp	.L61
.L60:
	cmpl	$4, -4(%rbp)
	jne	.L62
	movl	$1, %eax
	jmp	.L61
.L62:
	movl	$2, %eax
.L61:
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
	jmp	.L64
.L67:
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
	jne	.L65
	movl	-4(%rbp), %eax
	jmp	.L66
.L65:
	addl	$1, -4(%rbp)
.L64:
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L67
	movl	$-1, %eax
.L66:
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
	.globl	a
	.def	a;	.scl	2;	.type	32;	.endef
	.seh_proc	a
a:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	nop
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
	.ascii "img/ascii_strip96.png\0"
.LC14:
	.ascii "rb\0"
.LC15:
	.ascii "level.dat\0"
.LC16:
	.ascii "img/img_lands.png\0"
.LC17:
	.ascii "Press SPACE to continue.\0"
.LC18:
	.ascii "Entering main loop...\0"
.LC19:
	.ascii "Location:#DUNEDIN#NEW ZEALAND\0"
.LC20:
	.ascii "Level: X/3\0"
.LC21:
	.ascii "X\0"
.LC22:
	.ascii "...exited main loop.\0"
.LC23:
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
	subq	$1528, %rsp
	.seh_stackalloc	1528
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movl	%ecx, 1472(%rbp)
	movq	%rdx, 1480(%rbp)
	movq	%rsp, %rax
	movq	%rax, %rsi
	movq	$256, 1360(%rbp)
	movq	1360(%rbp), %rax
	subq	$1, %rax
	movq	%rax, 1352(%rbp)
	movq	1360(%rbp), %rax
	movq	%rax, %r10
	movl	$0, %r11d
	movq	1360(%rbp), %rax
	movq	%rax, %r8
	movl	$0, %r9d
	movq	1360(%rbp), %rax
	addq	$15, %rax
	shrq	$4, %rax
	salq	$4, %rax
	call	___chkstk_ms
	subq	%rax, %rsp
	leaq	80(%rsp), %rax
	addq	$0, %rax
	movq	%rax, 1344(%rbp)
	movl	$1366, 1340(%rbp)
	movl	$768, 1336(%rbp)
	movl	1340(%rbp), %eax
	subl	1336(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, 1332(%rbp)
	movl	$0, 1328(%rbp)
	movl	1336(%rbp), %eax
	movl	%eax, 1324(%rbp)
	movl	1336(%rbp), %eax
	movl	%eax, 1320(%rbp)
	movl	1332(%rbp), %edx
	movl	1324(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 1316(%rbp)
	movl	1328(%rbp), %edx
	movl	1320(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 1312(%rbp)
	movl	$16, 1308(%rbp)
	movl	$16, 1304(%rbp)
	movl	1308(%rbp), %eax
	movl	%eax, %ecx
	call	sqr
	movl	%eax, %edi
	movl	1336(%rbp), %eax
	cltd
	idivl	%edi
	movl	%eax, 1300(%rbp)
	movl	1300(%rbp), %eax
	movl	%eax, 1296(%rbp)
	movl	$62001, 1292(%rbp)
	movl	1292(%rbp), %eax
	movl	%eax, %ecx
	call	SDL_Init
	testl	%eax, %eax
	je	.L71
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC3(%rip), %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L72
.L71:
	movl	1340(%rbp), %edx
	movl	$0, 40(%rsp)
	movl	1336(%rbp), %eax
	movl	%eax, 32(%rsp)
	movl	%edx, %r9d
	movl	$536805376, %r8d
	movl	$536805376, %edx
	leaq	.LC4(%rip), %rcx
	call	SDL_CreateWindow
	movq	%rax, 1280(%rbp)
	cmpq	$0, 1280(%rbp)
	jne	.L73
	movq	1344(%rbp), %rax
	movq	1360(%rbp), %rdx
	leaq	.LC5(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L74
.L73:
	movq	1280(%rbp), %rax
	movl	$4, %r8d
	movl	$-1, %edx
	movq	%rax, %rcx
	call	SDL_CreateRenderer
	movq	%rax, 1272(%rbp)
	cmpq	$0, 1272(%rbp)
	jne	.L75
	movq	1344(%rbp), %rax
	movq	1360(%rbp), %rdx
	leaq	.LC6(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L74
.L75:
	movq	1280(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_GetWindowSurface
	movq	%rax, 1264(%rbp)
	cmpq	$0, 1264(%rbp)
	jne	.L76
	movq	1344(%rbp), %rax
	movq	1360(%rbp), %rdx
	leaq	.LC7(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L74
.L76:
	movl	$2, %ecx
	call	IMG_Init
	movq	1272(%rbp), %rax
	leaq	.LC8(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 1256(%rbp)
	movq	1272(%rbp), %rax
	leaq	.LC9(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 1248(%rbp)
	movq	1272(%rbp), %rax
	leaq	.LC10(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 1240(%rbp)
	movq	1272(%rbp), %rax
	leaq	.LC11(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 1232(%rbp)
	movq	1272(%rbp), %rax
	leaq	.LC12(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 1224(%rbp)
	movq	1272(%rbp), %rax
	leaq	.LC13(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 1216(%rbp)
	movl	$8, 1212(%rbp)
	movl	$16, 1208(%rbp)
	movl	1308(%rbp), %eax
	movl	%eax, %ecx
	call	sqr
	movl	%eax, 1204(%rbp)
	movl	$4, 1200(%rbp)
	movl	$0, 1388(%rbp)
	leaq	.LC14(%rip), %rdx
	leaq	.LC15(%rip), %rcx
	call	fopen
	movq	%rax, 1192(%rbp)
	movl	$0, 1384(%rbp)
	jmp	.L77
.L78:
	movl	1384(%rbp), %eax
	cltq
	movb	$0, -16(%rbp,%rax)
	addl	$1, 1384(%rbp)
.L77:
	movl	1204(%rbp), %eax
	imull	1200(%rbp), %eax
	cmpl	%eax, 1384(%rbp)
	jl	.L78
	movq	1192(%rbp), %rdx
	leaq	-16(%rbp), %rax
	movq	%rdx, %r9
	movl	$1, %r8d
	movl	$1024, %edx
	movq	%rax, %rcx
	call	fread
	movq	1192(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movl	1300(%rbp), %eax
	imull	1304(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	1332(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -48(%rbp)
	movl	1296(%rbp), %eax
	imull	1304(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	1328(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -44(%rbp)
	movb	$0, -32(%rbp)
	movb	$0, -31(%rbp)
	movb	$1, -30(%rbp)
	movb	$12, -29(%rbp)
	movb	$0, -28(%rbp)
	movb	$2, -27(%rbp)
	movb	$3, -26(%rbp)
	movl	$1, 1380(%rbp)
	movq	1272(%rbp), %rax
	leaq	.LC16(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 1184(%rbp)
	leaq	.LC17(%rip), %rax
	movq	%rax, 1176(%rbp)
	movl	$1, 1376(%rbp)
	leaq	.LC18(%rip), %rcx
	call	puts
	jmp	.L79
.L100:
	movl	1008(%rbp), %eax
	cmpl	$768, %eax
	je	.L81
	cmpl	$769, %eax
	je	.L82
	cmpl	$256, %eax
	jne	.L80
	movl	$0, 1376(%rbp)
	jmp	.L80
.L81:
	movl	$1, 1172(%rbp)
	movl	1028(%rbp), %eax
	cmpl	$1073741904, %eax
	je	.L83
	cmpl	$1073741904, %eax
	jg	.L84
	cmpl	$32, %eax
	je	.L85
	cmpl	$1073741903, %eax
	je	.L86
	cmpl	$27, %eax
	je	.L87
	jmp	.L80
.L84:
	cmpl	$1073741906, %eax
	je	.L89
	cmpl	$1073741906, %eax
	jl	.L90
	cmpl	$1073741912, %eax
	je	.L91
	jmp	.L80
.L87:
	movl	$0, 1376(%rbp)
	jmp	.L88
.L86:
	movl	1172(%rbp), %eax
	movl	%eax, glob_vk_right(%rip)
	jmp	.L88
.L83:
	movl	1172(%rbp), %eax
	movl	%eax, glob_vk_left(%rip)
	jmp	.L88
.L89:
	movl	1172(%rbp), %eax
	movl	%eax, glob_vk_up(%rip)
	jmp	.L88
.L90:
	movl	1172(%rbp), %eax
	movl	%eax, glob_vk_down(%rip)
	jmp	.L88
.L85:
	movl	1172(%rbp), %eax
	movl	%eax, glob_vk_space(%rip)
	jmp	.L88
.L91:
	movl	1172(%rbp), %eax
	movl	%eax, glob_vk_enter(%rip)
	nop
.L88:
	jmp	.L80
.L82:
	movl	$0, 1168(%rbp)
	movl	1028(%rbp), %eax
	cmpl	$1073741904, %eax
	je	.L92
	cmpl	$1073741904, %eax
	jg	.L93
	cmpl	$32, %eax
	je	.L94
	cmpl	$1073741903, %eax
	je	.L95
	jmp	.L125
.L93:
	cmpl	$1073741906, %eax
	je	.L97
	cmpl	$1073741906, %eax
	jl	.L98
	cmpl	$1073741912, %eax
	je	.L99
	jmp	.L125
.L95:
	movl	1168(%rbp), %eax
	movl	%eax, glob_vk_right(%rip)
	jmp	.L96
.L92:
	movl	1168(%rbp), %eax
	movl	%eax, glob_vk_left(%rip)
	jmp	.L96
.L97:
	movl	1168(%rbp), %eax
	movl	%eax, glob_vk_up(%rip)
	jmp	.L96
.L98:
	movl	1168(%rbp), %eax
	movl	%eax, glob_vk_down(%rip)
	jmp	.L96
.L94:
	movl	1168(%rbp), %eax
	movl	%eax, glob_vk_space(%rip)
	jmp	.L96
.L99:
	movl	1168(%rbp), %eax
	movl	%eax, glob_vk_enter(%rip)
	nop
.L96:
.L125:
	nop
.L80:
	leaq	1008(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_PollEvent
	testl	%eax, %eax
	jne	.L100
	movl	glob_vk_right(%rip), %eax
	testl	%eax, %eax
	je	.L101
	movb	$0, -32(%rbp)
	movl	-48(%rbp), %edx
	movzbl	-26(%rbp), %eax
	movzbl	%al, %eax
	addl	%edx, %eax
	movl	%eax, -48(%rbp)
.L101:
	movl	glob_vk_up(%rip), %eax
	testl	%eax, %eax
	je	.L102
	movb	$1, -32(%rbp)
	movl	-44(%rbp), %edx
	movzbl	-26(%rbp), %eax
	movzbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -44(%rbp)
.L102:
	movl	glob_vk_left(%rip), %eax
	testl	%eax, %eax
	je	.L103
	movb	$2, -32(%rbp)
	movl	-48(%rbp), %edx
	movzbl	-26(%rbp), %eax
	movzbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -48(%rbp)
.L103:
	movl	glob_vk_down(%rip), %eax
	testl	%eax, %eax
	je	.L104
	movb	$3, -32(%rbp)
	movl	-44(%rbp), %edx
	movzbl	-26(%rbp), %eax
	movzbl	%al, %eax
	addl	%edx, %eax
	movl	%eax, -44(%rbp)
.L104:
	movl	glob_vk_right(%rip), %edx
	movl	glob_vk_left(%rip), %eax
	orl	%eax, %edx
	movl	glob_vk_up(%rip), %eax
	orl	%eax, %edx
	movl	glob_vk_down(%rip), %eax
	orl	%edx, %eax
	testl	%eax, %eax
	je	.L105
	movzbl	-31(%rbp), %edx
	movzbl	-30(%rbp), %eax
	addl	%edx, %eax
	movb	%al, -31(%rbp)
	movzbl	-28(%rbp), %eax
	movzbl	-31(%rbp), %ecx
	movzbl	-29(%rbp), %edx
	cmpb	%dl, %cl
	setnb	%dl
	addl	%edx, %eax
	movb	%al, -28(%rbp)
	movzbl	-31(%rbp), %eax
	movzbl	-29(%rbp), %edx
	movzbl	%al, %eax
	divb	%dl
	movzbl	%ah, %eax
	movb	%al, -31(%rbp)
	movzbl	-28(%rbp), %eax
	movzbl	-27(%rbp), %edx
	movzbl	%al, %eax
	divb	%dl
	movzbl	%ah, %eax
	movb	%al, -28(%rbp)
	movl	1304(%rbp), %eax
	imull	1300(%rbp), %eax
	movl	1316(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, 1164(%rbp)
	movl	1328(%rbp), %eax
	movl	%eax, 1160(%rbp)
	movl	1332(%rbp), %eax
	movl	%eax, 1156(%rbp)
	movl	1304(%rbp), %eax
	imull	1296(%rbp), %eax
	movl	1312(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, 1152(%rbp)
	movl	$0, 1148(%rbp)
	movl	-48(%rbp), %eax
	cmpl	%eax, 1164(%rbp)
	jl	.L106
	movl	-44(%rbp), %eax
	cmpl	%eax, 1152(%rbp)
	jl	.L106
	movl	-48(%rbp), %eax
	cmpl	%eax, 1156(%rbp)
	jg	.L106
	movl	-44(%rbp), %eax
	cmpl	%eax, 1160(%rbp)
	jle	.L107
.L106:
	movl	$1, %eax
	jmp	.L108
.L107:
	movl	$0, %eax
.L108:
	movl	%eax, 1148(%rbp)
	movl	-48(%rbp), %eax
	cmpl	%eax, 1164(%rbp)
	jge	.L109
	movl	1156(%rbp), %eax
	movl	%eax, -48(%rbp)
	addl	$1, 1388(%rbp)
.L109:
	movl	-44(%rbp), %eax
	cmpl	%eax, 1160(%rbp)
	jle	.L110
	movl	1152(%rbp), %eax
	movl	%eax, -44(%rbp)
	cvtsi2sd	1200(%rbp), %xmm0
	call	sqrt
	cvttsd2si	%xmm0, %eax
	subl	%eax, 1388(%rbp)
.L110:
	movl	-48(%rbp), %eax
	cmpl	%eax, 1156(%rbp)
	jle	.L111
	movl	1164(%rbp), %eax
	movl	%eax, -48(%rbp)
	subl	$1, 1388(%rbp)
.L111:
	movl	-44(%rbp), %eax
	cmpl	%eax, 1152(%rbp)
	jge	.L112
	movl	1160(%rbp), %eax
	movl	%eax, -44(%rbp)
	cvtsi2sd	1200(%rbp), %xmm0
	call	sqrt
	cvttsd2si	%xmm0, %eax
	addl	%eax, 1388(%rbp)
.L112:
	cmpl	$0, 1148(%rbp)
	je	.L114
	movl	1200(%rbp), %eax
	addl	%eax, 1388(%rbp)
	movl	1388(%rbp), %eax
	cltd
	idivl	1200(%rbp)
	movl	%edx, 1388(%rbp)
	jmp	.L114
.L105:
	movb	$0, -31(%rbp)
	movb	$0, -28(%rbp)
.L114:
	movl	glob_vk_space(%rip), %edx
	movl	glob_vk_enter(%rip), %eax
	orl	%edx, %eax
	testl	%eax, %eax
	je	.L115
	movl	$0, 1380(%rbp)
.L115:
	movl	-48(%rbp), %eax
	movl	%eax, -40(%rbp)
	movl	-44(%rbp), %eax
	movl	%eax, -36(%rbp)
	movl	$0, %edx
	movq	1272(%rbp), %rax
	movq	%rax, %rcx
	call	draw_clear
	movl	$16777215, %edx
	movq	1272(%rbp), %rax
	movq	%rax, %rcx
	call	draw_set_color
	movl	$33023, %edx
	movl	1332(%rbp), %ecx
	movq	1272(%rbp), %rax
	movl	%edx, 40(%rsp)
	movl	1336(%rbp), %edx
	movl	%edx, 32(%rsp)
	movl	%ecx, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	$8388863, %r8d
	movl	1340(%rbp), %eax
	subl	1332(%rbp), %eax
	movl	%eax, %ecx
	movl	1332(%rbp), %edx
	movq	1272(%rbp), %rax
	movl	%r8d, 40(%rsp)
	movl	1336(%rbp), %r8d
	movl	%r8d, 32(%rsp)
	movl	%ecx, %r9d
	movl	$0, %r8d
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	$33023, %edx
	movl	1340(%rbp), %eax
	subl	1332(%rbp), %eax
	movl	1340(%rbp), %r8d
	movq	1272(%rbp), %rcx
	movl	%edx, 40(%rsp)
	movl	1336(%rbp), %edx
	movl	%edx, 32(%rsp)
	movl	%r8d, %r9d
	movl	$0, %r8d
	movl	%eax, %edx
	call	draw_rectangle_color
	movl	$0, 1144(%rbp)
	movl	$0, 1140(%rbp)
	cmpl	$0, 1380(%rbp)
	jne	.L116
	movl	1296(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %ecx
	movl	1300(%rbp), %eax
	leal	0(,%rax,8), %r9d
	movl	1140(%rbp), %r10d
	movl	1144(%rbp), %edx
	movq	1272(%rbp), %rax
	movl	1208(%rbp), %r8d
	movl	%r8d, 64(%rsp)
	movl	1212(%rbp), %r8d
	movl	%r8d, 56(%rsp)
	leaq	.LC19(%rip), %r8
	movq	%r8, 48(%rsp)
	movq	1216(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	draw_text
.L116:
	movl	1316(%rbp), %eax
	movl	%eax, 1144(%rbp)
	movl	$0, 1140(%rbp)
	cmpl	$0, 1380(%rbp)
	jne	.L117
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	.LC20(%rip), %rax
	movq	%rax, 1128(%rbp)
	movq	1128(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	subq	$1, %rdx
	movq	%rdx, 1120(%rbp)
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
	movq	%rax, 1112(%rbp)
	movq	1112(%rbp), %rax
	movq	1128(%rbp), %rdx
	movq	%rax, %rcx
	call	strcpy
	movl	1388(%rbp), %eax
	leal	48(%rax), %ebx
	movq	1112(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC21(%rip), %rcx
	call	string_pos
	movl	%ebx, %ecx
	movq	1112(%rbp), %rdx
	cltq
	movb	%cl, (%rdx,%rax)
	movq	1112(%rbp), %r8
	movl	1296(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %ecx
	movl	1300(%rbp), %eax
	leal	0(,%rax,8), %r11d
	movl	1140(%rbp), %r10d
	movl	1144(%rbp), %edx
	movq	1272(%rbp), %rax
	movl	1208(%rbp), %r9d
	movl	%r9d, 64(%rsp)
	movl	1212(%rbp), %r9d
	movl	%r9d, 56(%rsp)
	movq	%r8, 48(%rsp)
	movq	1216(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	%r11d, %r9d
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	draw_text
	movq	%rdi, %rsp
.L117:
	movl	$0, 1372(%rbp)
	jmp	.L118
.L121:
	movl	$0, 1368(%rbp)
	jmp	.L119
.L120:
	movl	1372(%rbp), %eax
	imull	1308(%rbp), %eax
	movl	1368(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 1108(%rbp)
	movl	1368(%rbp), %eax
	imull	1300(%rbp), %eax
	imull	1304(%rbp), %eax
	movl	1332(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 1104(%rbp)
	movl	1372(%rbp), %eax
	imull	1296(%rbp), %eax
	imull	1304(%rbp), %eax
	movl	1328(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 1100(%rbp)
	movl	1368(%rbp), %eax
	addl	$1, %eax
	imull	1300(%rbp), %eax
	imull	1304(%rbp), %eax
	movl	1332(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 1096(%rbp)
	movl	1372(%rbp), %eax
	addl	$1, %eax
	imull	1296(%rbp), %eax
	imull	1304(%rbp), %eax
	movl	1328(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 1092(%rbp)
	movl	$16711680, %r9d
	movl	$65280, %r8d
	movl	$255, %r10d
	movl	1108(%rbp), %ecx
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
	movl	%eax, 1088(%rbp)
	movl	1096(%rbp), %r9d
	movl	1100(%rbp), %r8d
	movl	1104(%rbp), %edx
	movq	1272(%rbp), %rax
	movl	1088(%rbp), %ecx
	movl	%ecx, 40(%rsp)
	movl	1092(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	1204(%rbp), %eax
	imull	1388(%rbp), %eax
	movl	1108(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 1084(%rbp)
	movl	1084(%rbp), %eax
	cltq
	movzbl	-16(%rbp,%rax), %eax
	movzbl	%al, %eax
	andl	$3, %eax
	movl	%eax, 1080(%rbp)
	movq	1240(%rbp), %r9
	movq	1248(%rbp), %r8
	movq	1256(%rbp), %rdx
	movl	1080(%rbp), %eax
	movq	1232(%rbp), %rcx
	movq	%rcx, 32(%rsp)
	movl	%eax, %ecx
	call	mux_int
	cltq
	movq	%rax, %rcx
	movl	1096(%rbp), %r9d
	movl	1100(%rbp), %r8d
	movl	1104(%rbp), %edx
	movq	1272(%rbp), %rax
	movq	%rcx, 40(%rsp)
	movl	1092(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_image
	addl	$1, 1368(%rbp)
.L119:
	movl	1368(%rbp), %eax
	cmpl	1308(%rbp), %eax
	jl	.L120
	addl	$1, 1372(%rbp)
.L118:
	movl	1372(%rbp), %eax
	cmpl	1308(%rbp), %eax
	jl	.L121
	movl	1304(%rbp), %eax
	movl	%eax, 1076(%rbp)
	movzbl	-32(%rbp), %eax
	movzbl	%al, %eax
	imull	1076(%rbp), %eax
	movl	%eax, %edx
	movzbl	-27(%rbp), %eax
	movzbl	%al, %eax
	imull	%eax, %edx
	movzbl	-28(%rbp), %eax
	movzbl	%al, %eax
	imull	1076(%rbp), %eax
	leal	(%rdx,%rax), %r8d
	movl	-44(%rbp), %edx
	movl	1076(%rbp), %eax
	imull	1296(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	movl	-48(%rbp), %edx
	movl	1076(%rbp), %eax
	imull	1300(%rbp), %eax
	leal	(%rdx,%rax), %r11d
	movl	-44(%rbp), %r10d
	movl	-48(%rbp), %edx
	movq	1272(%rbp), %rax
	movl	1076(%rbp), %r9d
	movl	%r9d, 72(%rsp)
	movl	1076(%rbp), %r9d
	movl	%r9d, 64(%rsp)
	movl	$0, 56(%rsp)
	movl	%r8d, 48(%rsp)
	movq	1224(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	%r11d, %r9d
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	draw_image_part
	cmpl	$0, 1380(%rbp)
	je	.L122
	movl	1316(%rbp), %r9d
	movl	1328(%rbp), %r8d
	movl	1332(%rbp), %edx
	movq	1272(%rbp), %rax
	movq	1184(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	1312(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_image
	movl	1296(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %ecx
	movl	1300(%rbp), %eax
	leal	0(,%rax,8), %r9d
	movl	1328(%rbp), %r10d
	movl	1332(%rbp), %edx
	movq	1272(%rbp), %rax
	movl	1208(%rbp), %r8d
	movl	%r8d, 64(%rsp)
	movl	1212(%rbp), %r8d
	movl	%r8d, 56(%rsp)
	movq	1176(%rbp), %r8
	movq	%r8, 48(%rsp)
	movq	1216(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	draw_text
.L122:
	movq	1272(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_RenderPresent
	movl	$16, %ecx
	call	SDL_Delay
.L79:
	cmpl	$0, 1376(%rbp)
	jne	.L80
	leaq	.LC22(%rip), %rcx
	call	puts
	movq	1256(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	1248(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	1240(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	1232(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	1224(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	1184(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	1216(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	call	IMG_Quit
	movq	1272(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyRenderer
	movq	1280(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyWindow
	call	SDL_Quit
	movl	$500, %ecx
	call	SDL_Delay
	movl	$0, %eax
	jmp	.L72
.L74:
	call	SDL_GetError
	movq	%rax, %rsi
	movq	1344(%rbp), %rbx
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC23(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	call	SDL_Quit
	movl	$1, %ecx
	call	exit
.L72:
	movq	%rsi, %rsp
	leaq	1400(%rbp), %rsp
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
	.def	strlen;	.scl	2;	.type	32;	.endef
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
	.def	sqrt;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	SDL_RenderPresent;	.scl	2;	.type	32;	.endef
	.def	SDL_Delay;	.scl	2;	.type	32;	.endef
	.def	SDL_DestroyTexture;	.scl	2;	.type	32;	.endef
	.def	IMG_Quit;	.scl	2;	.type	32;	.endef
	.def	SDL_DestroyRenderer;	.scl	2;	.type	32;	.endef
	.def	SDL_DestroyWindow;	.scl	2;	.type	32;	.endef
