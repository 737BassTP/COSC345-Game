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
	.globl	mux_str
	.def	mux_str;	.scl	2;	.type	32;	.endef
	.seh_proc	mux_str
mux_str:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	leaq	24(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movl	(%rax), %eax
	cltq
	movq	%rax, -8(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L40
.L41:
	movq	-24(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	addl	$1, -12(%rbp)
.L40:
	movl	-12(%rbp), %eax
	cmpl	16(%rbp), %eax
	jl	.L41
	movq	-8(%rbp), %rax
	addq	$32, %rsp
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
	jmp	.L44
.L45:
	movq	-16(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movq	(%rax), %rax
	movl	%eax, -4(%rbp)
	addl	$1, -8(%rbp)
.L44:
	movl	-8(%rbp), %eax
	cmpl	16(%rbp), %eax
	jl	.L45
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
	jmp	.L48
.L51:
	movq	-24(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movl	(%rax), %eax
	movl	%eax, -12(%rbp)
	movl	24(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jne	.L49
	movl	-4(%rbp), %eax
	jmp	.L52
.L49:
	addl	$1, -4(%rbp)
.L48:
	movl	-4(%rbp), %eax
	cmpl	16(%rbp), %eax
	jl	.L51
	movl	$-1, %eax
.L52:
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
	.globl	BGG
	.def	BGG;	.scl	2;	.type	32;	.endef
	.seh_proc	BGG
BGG:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movl	32(%rbp), %eax
	imull	24(%rbp), %eax
	movl	16(%rbp), %edx
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	24(%rbp), %eax
	movl	$1, %r8d
	movl	%eax, %ecx
	sall	%cl, %r8d
	movl	%r8d, %eax
	subl	$1, %eax
	andl	%edx, %eax
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
	call	SDL_GetTicks64
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
	jl	.L66
	movl	16(%rbp), %eax
	cmpl	48(%rbp), %eax
	jge	.L66
	movl	24(%rbp), %eax
	cmpl	40(%rbp), %eax
	jl	.L66
	movl	24(%rbp), %eax
	cmpl	56(%rbp), %eax
	jge	.L66
	movl	$1, %eax
	jmp	.L68
.L66:
	movl	$0, %eax
.L68:
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
	jne	.L70
	movl	$0, %eax
	jmp	.L71
.L70:
	cmpl	$4, -4(%rbp)
	jne	.L72
	movl	$1, %eax
	jmp	.L71
.L72:
	movl	$2, %eax
.L71:
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
	jmp	.L74
.L77:
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
	jne	.L75
	movl	-4(%rbp), %eax
	jmp	.L76
.L75:
	addl	$1, -4(%rbp)
.L74:
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L77
	movl	$-1, %eax
.L76:
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	darctan2
	.def	darctan2;	.scl	2;	.type	32;	.endef
	.seh_proc	darctan2
darctan2:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	cvtsi2sd	24(%rbp), %xmm1
	cvtsi2sd	16(%rbp), %xmm0
	call	atan2
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	call	radtodeg
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	cartodir
	.def	cartodir;	.scl	2;	.type	32;	.endef
	.seh_proc	cartodir
cartodir:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	24(%rbp), %eax
	movl	16(%rbp), %edx
	movl	%eax, %ecx
	call	darctan2
	movapd	%xmm0, %xmm1
	movsd	.LC3(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	movsd	-8(%rbp), %xmm0
	comisd	.LC3(%rip), %xmm0
	jb	.L81
	movsd	-8(%rbp), %xmm0
	movsd	.LC3(%rip), %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
.L81:
	movsd	-8(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	addq	$48, %rsp
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
.LC4:
	.ascii "faulty at the moment.\0"
.LC5:
	.ascii "r\0"
.LC6:
	.ascii "tiled/cosc345-game.tmx\0"
.LC7:
	.ascii "wb\0"
.LC8:
	.ascii "level-new.dat\0"
.LC9:
	.ascii "entries: %i,%i,%i\12\0"
.LC10:
	.ascii "ch0=%i\12\0"
.LC11:
	.ascii "ch1=%i\12\0"
.LC12:
	.ascii "ch2=%i\12\0"
.LC13:
	.ascii "i=%i/%i: %i (%i,%i,%i)\12\12\0"
	.text
	.globl	dev_tiled_to_leveldata
	.def	dev_tiled_to_leveldata;	.scl	2;	.type	32;	.endef
	.seh_proc	dev_tiled_to_leveldata
dev_tiled_to_leveldata:
	pushq	%rbp
	.seh_pushreg	%rbp
	movl	$131216, %eax
	call	___chkstk_ms
	subq	%rax, %rsp
	.seh_stackalloc	131216
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	leaq	.LC4(%rip), %rcx
	call	puts
	movl	$0, glob_vk_f2(%rip)
	leaq	.LC5(%rip), %rdx
	leaq	.LC6(%rip), %rcx
	call	fopen
	movq	%rax, 131056(%rbp)
	leaq	.LC7(%rip), %rdx
	leaq	.LC8(%rip), %rcx
	call	fopen
	movq	%rax, 131048(%rbp)
	movl	$131072, 131044(%rbp)
	movl	$0, 131084(%rbp)
	jmp	.L87
.L88:
	movl	131084(%rbp), %eax
	cltq
	movb	$0, -48(%rbp,%rax)
	addl	$1, 131084(%rbp)
.L87:
	movl	131084(%rbp), %eax
	cmpl	131044(%rbp), %eax
	jl	.L88
	movl	131044(%rbp), %eax
	movslq	%eax, %rdx
	movq	131056(%rbp), %rcx
	leaq	-48(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	fread
	movq	131056(%rbp), %rax
	movl	$0, %r8d
	movl	$503, %edx
	movq	%rax, %rcx
	call	fseek
	movl	$44, %eax
	movb	%al, 131043(%rbp)
	movl	$0, 131036(%rbp)
	movl	$0, 131080(%rbp)
.L102:
	movq	131056(%rbp), %rax
	movq	%rax, %rcx
	call	fgetc
	movl	%eax, 131036(%rbp)
	cmpl	$60, 131036(%rbp)
	je	.L103
	movl	131080(%rbp), %eax
	cmpl	131044(%rbp), %eax
	jge	.L104
	movl	$0, 131076(%rbp)
	jmp	.L92
.L93:
	movl	131076(%rbp), %eax
	cltq
	movb	$48, -51(%rbp,%rax)
	addl	$1, 131076(%rbp)
.L92:
	cmpl	$2, 131076(%rbp)
	jle	.L93
	movzbl	-49(%rbp), %eax
	movzbl	%al, %ecx
	movzbl	-50(%rbp), %eax
	movzbl	%al, %edx
	movzbl	-51(%rbp), %eax
	movzbl	%al, %eax
	movl	%ecx, %r9d
	movl	%edx, %r8d
	movl	%eax, %edx
	leaq	.LC9(%rip), %rcx
	call	printf
	movl	131036(%rbp), %eax
	movb	%al, -51(%rbp)
	movl	131036(%rbp), %eax
	movl	%eax, %edx
	leaq	.LC10(%rip), %rcx
	call	printf
	movq	131056(%rbp), %rax
	movq	%rax, %rcx
	call	fgetc
	movl	%eax, 131036(%rbp)
	movzbl	131043(%rbp), %eax
	cmpl	%eax, 131036(%rbp)
	je	.L94
	movl	131036(%rbp), %eax
	movb	%al, -50(%rbp)
	movl	131036(%rbp), %eax
	movl	%eax, %edx
	leaq	.LC11(%rip), %rcx
	call	printf
	movq	131056(%rbp), %rax
	movq	%rax, %rcx
	call	fgetc
	movl	%eax, 131036(%rbp)
	movzbl	131043(%rbp), %eax
	cmpl	%eax, 131036(%rbp)
	je	.L95
	movl	131036(%rbp), %eax
	movb	%al, -49(%rbp)
	movl	131036(%rbp), %eax
	movl	%eax, %edx
	leaq	.LC12(%rip), %rcx
	call	printf
	movq	131056(%rbp), %rax
	movq	%rax, %rcx
	call	fgetc
	jmp	.L97
.L95:
	movzbl	-50(%rbp), %eax
	movb	%al, -49(%rbp)
	movzbl	-51(%rbp), %eax
	movb	%al, -50(%rbp)
	movb	$48, -51(%rbp)
	jmp	.L97
.L94:
	movzbl	-51(%rbp), %eax
	movb	%al, -49(%rbp)
	movb	$48, -51(%rbp)
.L97:
	movl	$0, 131072(%rbp)
	jmp	.L98
.L99:
	movl	131072(%rbp), %eax
	cltq
	movzbl	-51(%rbp,%rax), %eax
	subl	$48, %eax
	movl	131072(%rbp), %edx
	movslq	%edx, %rdx
	movb	%al, -51(%rbp,%rdx)
	addl	$1, 131072(%rbp)
.L98:
	cmpl	$2, 131072(%rbp)
	jle	.L99
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
	movb	%al, 131071(%rbp)
	cmpb	$0, 131071(%rbp)
	jne	.L100
	movb	$-1, 131071(%rbp)
	jmp	.L101
.L100:
	subb	$1, 131071(%rbp)
.L101:
	movzbl	-49(%rbp), %eax
	movzbl	%al, %ecx
	movzbl	-50(%rbp), %eax
	movzbl	%al, %edx
	movzbl	-51(%rbp), %eax
	movzbl	%al, %eax
	movzbl	131071(%rbp), %r8d
	movl	131044(%rbp), %r11d
	movl	131080(%rbp), %r10d
	movl	%ecx, 48(%rsp)
	movl	%edx, 40(%rsp)
	movl	%eax, 32(%rsp)
	movl	%r8d, %r9d
	movl	%r11d, %r8d
	movl	%r10d, %edx
	leaq	.LC13(%rip), %rcx
	call	printf
	movl	131080(%rbp), %eax
	movslq	%eax, %rdx
	movzbl	131071(%rbp), %eax
	movb	%al, -48(%rbp,%rdx)
	addl	$1, 131080(%rbp)
	jmp	.L102
.L103:
	nop
	jmp	.L90
.L104:
	nop
.L90:
	movl	131044(%rbp), %eax
	movslq	%eax, %rdx
	movq	131048(%rbp), %rcx
	leaq	-48(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	fwrite
	movq	131056(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movq	131048(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	nop
	addq	$131216, %rsp
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
	.section .rdata,"dr"
.LC14:
	.ascii "rb\0"
.LC15:
	.ascii "location.dat\0"
	.text
	.globl	level_get_name
	.def	level_get_name;	.scl	2;	.type	32;	.endef
	.seh_proc	level_get_name
level_get_name:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	leaq	.LC14(%rip), %rdx
	leaq	.LC15(%rip), %rcx
	call	fopen
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	$0, %r8d
	movl	16(%rbp), %edx
	movq	%rax, %rcx
	call	fseek
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	fgetc
	movl	%eax, -4(%rbp)
	movq	-16(%rbp), %rax
	movl	$0, %r8d
	movl	$256, %edx
	movq	%rax, %rcx
	call	fseek
	movq	-16(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rdx, %r8
	movl	$16, %edx
	movq	%rax, %rcx
	call	fgets
	jmp	.L107
.L108:
	movq	-16(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rdx, %r8
	movl	$16, %edx
	movq	%rax, %rcx
	call	fgets
	subl	$1, -4(%rbp)
.L107:
	cmpl	$0, -4(%rbp)
	jg	.L108
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movq	24(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	MAX_WATER_PARTICLES
	.section .rdata,"dr"
	.align 4
MAX_WATER_PARTICLES:
	.long	100
	.comm	waterParticles, 8, 3
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
	movl	%eax, %ecx
	movl	$1427937179, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$8, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$770, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	leal	298(%rax), %ecx
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	16(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	cvtsi2ss	%ecx, %xmm0
	movss	%xmm0, (%rax)
	call	rand
	cltd
	idivl	32(%rbp)
	movl	%edx, %eax
	negl	%eax
	movl	%eax, %ecx
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	16(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	cvtsi2ss	%ecx, %xmm0
	movss	%xmm0, 4(%rax)
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	16(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movss	.LC16(%rip), %xmm0
	movss	%xmm0, 8(%rax)
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
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
	jb	.L112
	movq	-8(%rbp), %rax
	movl	$0, 12(%rax)
.L112:
	movq	-8(%rbp), %rax
	movl	8(%rax), %edx
	movq	-8(%rbp), %rax
	movl	12(%rax), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -12(%rbp)
	movl	32(%rbp), %eax
	cmpl	%eax, -12(%rbp)
	cmovbe	-12(%rbp), %eax
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
	.globl	clock_get_hour
	.def	clock_get_hour;	.scl	2;	.type	32;	.endef
	.seh_proc	clock_get_hour
clock_get_hour:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	16(%rbp), %ecx
	movl	$-2004318071, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%rdx,%rcx), %eax
	sarl	$5, %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	$715827883, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movl	%edx, %eax
	popq	%rbp
	ret
	.seh_endproc
	.globl	clock_get_minute
	.def	clock_get_minute;	.scl	2;	.type	32;	.endef
	.seh_proc	clock_get_minute
clock_get_minute:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	16(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$-2004318071, %rdx, %rdx
	shrq	$32, %rdx
	addl	%eax, %edx
	movl	%edx, %ecx
	sarl	$5, %ecx
	cltd
	subl	%edx, %ecx
	movl	%ecx, %edx
	imull	$60, %edx, %edx
	subl	%edx, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	popq	%rbp
	ret
	.seh_endproc
	.globl	clock_is_between
	.def	clock_is_between;	.scl	2;	.type	32;	.endef
	.seh_proc	clock_is_between
clock_is_between:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movl	%r9d, 40(%rbp)
	movl	24(%rbp), %eax
	imull	$60, %eax, %eax
	movl	32(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, -4(%rbp)
	movl	40(%rbp), %eax
	imull	$60, %eax, %eax
	movl	48(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, -8(%rbp)
	movl	16(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jl	.L118
	movl	16(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jg	.L118
	movl	$1, %eax
	jmp	.L120
.L118:
	movl	$0, %eax
.L120:
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC17:
	.ascii "Failed to allocate memory for water particles\12\0"
.LC18:
	.ascii "SDL init error:%s\12\0"
.LC19:
	.ascii "COSC345 - Game\0"
.LC20:
	.ascii "Window error\0"
.LC21:
	.ascii "Render error\0"
.LC22:
	.ascii "Surface error\0"
.LC23:
	.ascii "img/spr_grass.png\0"
.LC24:
	.ascii "img/spr_sand.png\0"
.LC25:
	.ascii "img/spr_water.png\0"
.LC26:
	.ascii "img/spr_lava.png\0"
.LC27:
	.ascii "img/player_strip8.png\0"
.LC28:
	.ascii "img/ascii_strip96.png\0"
.LC29:
	.ascii "img/clock1_strip10.png\0"
.LC30:
	.ascii "Night\0"
.LC31:
	.ascii "Morning\0"
.LC32:
	.ascii "Day\0"
.LC33:
	.ascii "Evening\0"
.LC34:
	.ascii "level.dat\0"
.LC35:
	.ascii "img/dunedin-map.png\0"
.LC36:
	.ascii "music.wav\0"
.LC37:
	.ascii "Failed to load WAV file: %s\12\0"
	.align 8
.LC38:
	.ascii "Failed to open audio device: %s\12\0"
.LC39:
	.ascii "img/img_lands.png\0"
.LC40:
	.ascii "Press SPACE to continue.\0"
.LC41:
	.ascii "Entering main loop...\0"
.LC42:
	.ascii "F2 started!\0"
.LC43:
	.ascii "F2 finished!\0"
.LC44:
	.ascii "Location:#DUNEDIN#NEW ZEALAND\0"
.LC45:
	.ascii "LVL: XYZ/255\0"
.LC46:
	.ascii "X\0"
.LC47:
	.ascii "Y\0"
.LC48:
	.ascii "Z\0"
.LC50:
	.ascii ":\0"
.LC51:
	.ascii "title has no texture!\0"
.LC54:
	.ascii "...exited main loop.\0"
.LC55:
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
	movl	$66296, %eax
	call	___chkstk_ms
	subq	%rax, %rsp
	.seh_stackalloc	66296
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movl	%ecx, 66240(%rbp)
	movq	%rdx, 66248(%rbp)
	movq	%rsp, %rax
	movq	%rax, %rsi
	movq	$256, 66080(%rbp)
	movq	66080(%rbp), %rax
	subq	$1, %rax
	movq	%rax, 66072(%rbp)
	movq	66080(%rbp), %rax
	movq	%rax, %r10
	movl	$0, %r11d
	movq	66080(%rbp), %rax
	movq	%rax, %r8
	movl	$0, %r9d
	movq	66080(%rbp), %rax
	addq	$15, %rax
	shrq	$4, %rax
	salq	$4, %rax
	call	___chkstk_ms
	subq	%rax, %rsp
	leaq	80(%rsp), %rax
	addq	$0, %rax
	movq	%rax, 66064(%rbp)
	movl	$1366, 66060(%rbp)
	movl	$768, 66056(%rbp)
	movl	66060(%rbp), %eax
	subl	66056(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, 66052(%rbp)
	movl	$0, 66048(%rbp)
	movl	66056(%rbp), %eax
	movl	%eax, 66044(%rbp)
	movl	66056(%rbp), %eax
	movl	%eax, 66040(%rbp)
	movl	66052(%rbp), %edx
	movl	66044(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 66036(%rbp)
	movl	66048(%rbp), %edx
	movl	66040(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 66032(%rbp)
	movl	$16, 66028(%rbp)
	movl	$16, 66024(%rbp)
	movl	66028(%rbp), %eax
	movl	%eax, %ecx
	call	sqr
	movl	%eax, %edi
	movl	66056(%rbp), %eax
	cltd
	idivl	%edi
	movl	%eax, 66020(%rbp)
	movl	66020(%rbp), %eax
	movl	%eax, 66016(%rbp)
	movl	$100, %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rcx
	call	malloc
	movq	%rax, %rdx
	leaq	waterParticles(%rip), %rax
	movq	%rdx, (%rax)
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L122
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %r9
	movl	$46, %r8d
	movl	$1, %edx
	leaq	.LC17(%rip), %rcx
	call	fwrite
	movl	$1, %eax
	jmp	.L123
.L122:
	movl	$0, %ecx
	call	time
	movl	%eax, %ecx
	call	srand
	movl	$0, 66144(%rbp)
	jmp	.L124
.L125:
	movl	66056(%rbp), %ecx
	movl	66060(%rbp), %edx
	movl	66144(%rbp), %eax
	movl	%ecx, %r8d
	movl	%eax, %ecx
	call	createWaterParticle
	addl	$1, 66144(%rbp)
.L124:
	movl	$100, %eax
	cmpl	%eax, 66144(%rbp)
	jl	.L125
	movl	$62001, 66012(%rbp)
	movl	66012(%rbp), %eax
	movl	%eax, %ecx
	call	SDL_Init
	testl	%eax, %eax
	je	.L126
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC18(%rip), %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L123
.L126:
	movl	66060(%rbp), %edx
	movl	$0, 40(%rsp)
	movl	66056(%rbp), %eax
	movl	%eax, 32(%rsp)
	movl	%edx, %r9d
	movl	$536805376, %r8d
	movl	$536805376, %edx
	leaq	.LC19(%rip), %rcx
	call	SDL_CreateWindow
	movq	%rax, 66000(%rbp)
	cmpq	$0, 66000(%rbp)
	jne	.L127
	movq	66064(%rbp), %rax
	movq	66080(%rbp), %rdx
	leaq	.LC20(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L128
.L127:
	movq	66000(%rbp), %rax
	movl	$4, %r8d
	movl	$-1, %edx
	movq	%rax, %rcx
	call	SDL_CreateRenderer
	movq	%rax, 65992(%rbp)
	cmpq	$0, 65992(%rbp)
	jne	.L129
	movq	66064(%rbp), %rax
	movq	66080(%rbp), %rdx
	leaq	.LC21(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L128
.L129:
	movq	66000(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_GetWindowSurface
	movq	%rax, 65984(%rbp)
	cmpq	$0, 65984(%rbp)
	jne	.L130
	movq	66064(%rbp), %rax
	movq	66080(%rbp), %rdx
	leaq	.LC22(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L128
.L130:
	movl	$2, %ecx
	call	IMG_Init
	movq	65992(%rbp), %rax
	leaq	.LC23(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 65976(%rbp)
	movq	65992(%rbp), %rax
	leaq	.LC24(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 65968(%rbp)
	movq	65992(%rbp), %rax
	leaq	.LC25(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 65960(%rbp)
	movq	65992(%rbp), %rax
	leaq	.LC26(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 65952(%rbp)
	movq	65992(%rbp), %rax
	leaq	.LC27(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 65944(%rbp)
	movq	65992(%rbp), %rax
	leaq	.LC28(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 65936(%rbp)
	movl	$8, 65932(%rbp)
	movl	$24, 65928(%rbp)
	movq	65992(%rbp), %rax
	leaq	.LC29(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 65920(%rbp)
	movl	$1440, 65916(%rbp)
	movl	$0, 66148(%rbp)
	movl	$0, 66152(%rbp)
	movl	$57, 65912(%rbp)
	movl	$60, 65908(%rbp)
	leaq	.LC30(%rip), %rax
	movq	%rax, 65896(%rbp)
	leaq	.LC31(%rip), %rax
	movq	%rax, 65888(%rbp)
	leaq	.LC32(%rip), %rax
	movq	%rax, 65880(%rbp)
	leaq	.LC33(%rip), %rax
	movq	%rax, 65872(%rbp)
	movl	66028(%rbp), %eax
	movl	%eax, %ecx
	call	sqr
	movl	%eax, 65868(%rbp)
	movl	$256, 65864(%rbp)
	movl	$0, 66156(%rbp)
	leaq	.LC14(%rip), %rdx
	leaq	.LC34(%rip), %rcx
	call	fopen
	movq	%rax, 65856(%rbp)
	movl	$0, 66140(%rbp)
	jmp	.L131
.L132:
	movl	66140(%rbp), %eax
	cltq
	movb	$0, 80(%rbp,%rax)
	addl	$1, 66140(%rbp)
.L131:
	movl	65868(%rbp), %eax
	imull	65864(%rbp), %eax
	cmpl	%eax, 66140(%rbp)
	jl	.L132
	movq	65856(%rbp), %rdx
	leaq	80(%rbp), %rax
	movq	%rdx, %r9
	movl	$1, %r8d
	movl	$65536, %edx
	movq	%rax, %rcx
	call	fread
	movq	65856(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movq	65992(%rbp), %rax
	leaq	.LC35(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 65848(%rbp)
	leaq	64(%rbp), %rax
	movl	66156(%rbp), %ecx
	movq	%rax, %rdx
	call	level_get_name
	movl	66020(%rbp), %eax
	imull	66024(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	66052(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 32(%rbp)
	movl	66016(%rbp), %eax
	imull	66024(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	66048(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 36(%rbp)
	movb	$0, 48(%rbp)
	movb	$0, 49(%rbp)
	movb	$1, 50(%rbp)
	movb	$12, 51(%rbp)
	movb	$0, 52(%rbp)
	movb	$2, 53(%rbp)
	movb	$12, 54(%rbp)
	leaq	.LC36(%rip), %rax
	movq	%rax, 65840(%rbp)
	movq	65840(%rbp), %rax
	leaq	.LC14(%rip), %rdx
	movq	%rax, %rcx
	call	SDL_RWFromFile
	movq	%rax, %r10
	leaq	-8(%rbp), %rcx
	movq	%rbp, %rdx
	leaq	-12(%rbp), %rax
	movq	%rax, 32(%rsp)
	movq	%rcx, %r9
	movq	%rdx, %r8
	movl	$1, %edx
	movq	%r10, %rcx
	call	SDL_LoadWAV_RW
	testq	%rax, %rax
	jne	.L133
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC37(%rip), %rcx
	call	printf
	jmp	.L134
.L133:
	movq	-8(%rbp), %rax
	movq	%rax, -32(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, -24(%rbp)
	movl	$0, -20(%rbp)
	leaq	audioCallback(%rip), %rax
	movq	%rax, 16(%rbp)
	leaq	-32(%rbp), %rax
	movq	%rax, 24(%rbp)
	movq	%rbp, %rax
	movl	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$0, %ecx
	call	SDL_OpenAudioDevice
	movl	%eax, 65836(%rbp)
	cmpl	$0, 65836(%rbp)
	jne	.L135
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC38(%rip), %rcx
	call	printf
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_FreeWAV
	jmp	.L134
.L135:
	movl	-12(%rbp), %ecx
	movq	-8(%rbp), %rdx
	movl	65836(%rbp), %eax
	movl	%ecx, %r8d
	movl	%eax, %ecx
	call	SDL_QueueAudio
	movl	65836(%rbp), %eax
	movl	$0, %edx
	movl	%eax, %ecx
	call	SDL_PauseAudioDevice
	movl	$1, 66136(%rbp)
	movq	65992(%rbp), %rax
	leaq	.LC39(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 65824(%rbp)
	leaq	.LC40(%rip), %rax
	movq	%rax, 65816(%rbp)
	movl	$1, 66132(%rbp)
	leaq	.LC41(%rip), %rcx
	call	puts
	jmp	.L136
.L159:
	movl	65616(%rbp), %eax
	cmpl	$768, %eax
	je	.L138
	cmpl	$769, %eax
	je	.L139
	cmpl	$256, %eax
	jne	.L137
	movl	$0, 66132(%rbp)
	jmp	.L137
.L138:
	movl	$1, 65812(%rbp)
	movl	65636(%rbp), %eax
	cmpl	$1073741903, %eax
	je	.L140
	cmpl	$1073741903, %eax
	jg	.L141
	cmpl	$32, %eax
	je	.L142
	cmpl	$1073741883, %eax
	je	.L143
	cmpl	$27, %eax
	je	.L144
	jmp	.L137
.L141:
	cmpl	$1073741905, %eax
	je	.L146
	cmpl	$1073741905, %eax
	jl	.L147
	cmpl	$1073741906, %eax
	je	.L148
	cmpl	$1073741912, %eax
	je	.L149
	jmp	.L137
.L144:
	movl	$0, 66132(%rbp)
	jmp	.L145
.L140:
	movl	65812(%rbp), %eax
	movl	%eax, glob_vk_right(%rip)
	jmp	.L145
.L147:
	movl	65812(%rbp), %eax
	movl	%eax, glob_vk_left(%rip)
	jmp	.L145
.L148:
	movl	65812(%rbp), %eax
	movl	%eax, glob_vk_up(%rip)
	jmp	.L145
.L146:
	movl	65812(%rbp), %eax
	movl	%eax, glob_vk_down(%rip)
	jmp	.L145
.L142:
	movl	65812(%rbp), %eax
	movl	%eax, glob_vk_space(%rip)
	jmp	.L145
.L149:
	movl	65812(%rbp), %eax
	movl	%eax, glob_vk_enter(%rip)
	jmp	.L145
.L143:
	movl	65812(%rbp), %eax
	movl	%eax, glob_vk_f2(%rip)
	nop
.L145:
	jmp	.L137
.L139:
	movl	$0, 65808(%rbp)
	movl	65636(%rbp), %eax
	cmpl	$1073741904, %eax
	je	.L150
	cmpl	$1073741904, %eax
	jg	.L151
	cmpl	$1073741883, %eax
	je	.L152
	cmpl	$1073741903, %eax
	je	.L153
	cmpl	$32, %eax
	je	.L154
	jmp	.L210
.L151:
	cmpl	$1073741906, %eax
	je	.L156
	cmpl	$1073741906, %eax
	jl	.L157
	cmpl	$1073741912, %eax
	je	.L158
	jmp	.L210
.L153:
	movl	65808(%rbp), %eax
	movl	%eax, glob_vk_right(%rip)
	jmp	.L155
.L150:
	movl	65808(%rbp), %eax
	movl	%eax, glob_vk_left(%rip)
	jmp	.L155
.L156:
	movl	65808(%rbp), %eax
	movl	%eax, glob_vk_up(%rip)
	jmp	.L155
.L157:
	movl	65808(%rbp), %eax
	movl	%eax, glob_vk_down(%rip)
	jmp	.L155
.L154:
	movl	65808(%rbp), %eax
	movl	%eax, glob_vk_space(%rip)
	jmp	.L155
.L158:
	movl	65808(%rbp), %eax
	movl	%eax, glob_vk_enter(%rip)
	jmp	.L155
.L152:
	movl	65808(%rbp), %eax
	movl	%eax, glob_vk_f2(%rip)
	nop
.L155:
.L210:
	nop
.L137:
	leaq	65616(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_PollEvent
	testl	%eax, %eax
	jne	.L159
	movl	glob_vk_f2(%rip), %eax
	testl	%eax, %eax
	je	.L160
	leaq	.LC42(%rip), %rcx
	call	puts
	call	dev_tiled_to_leveldata
	leaq	.LC43(%rip), %rcx
	call	puts
.L160:
	movl	glob_vk_right(%rip), %eax
	testl	%eax, %eax
	je	.L161
	movb	$0, 48(%rbp)
	movl	32(%rbp), %edx
	movzbl	54(%rbp), %eax
	movzbl	%al, %eax
	addl	%edx, %eax
	movl	%eax, 32(%rbp)
.L161:
	movl	glob_vk_up(%rip), %eax
	testl	%eax, %eax
	je	.L162
	movb	$1, 48(%rbp)
	movl	36(%rbp), %edx
	movzbl	54(%rbp), %eax
	movzbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, 36(%rbp)
.L162:
	movl	glob_vk_left(%rip), %eax
	testl	%eax, %eax
	je	.L163
	movb	$2, 48(%rbp)
	movl	32(%rbp), %edx
	movzbl	54(%rbp), %eax
	movzbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, 32(%rbp)
.L163:
	movl	glob_vk_down(%rip), %eax
	testl	%eax, %eax
	je	.L164
	movb	$3, 48(%rbp)
	movl	36(%rbp), %edx
	movzbl	54(%rbp), %eax
	movzbl	%al, %eax
	addl	%edx, %eax
	movl	%eax, 36(%rbp)
.L164:
	movl	glob_vk_right(%rip), %edx
	movl	glob_vk_left(%rip), %eax
	orl	%eax, %edx
	movl	glob_vk_up(%rip), %eax
	orl	%eax, %edx
	movl	glob_vk_down(%rip), %eax
	orl	%edx, %eax
	testl	%eax, %eax
	je	.L165
	movzbl	49(%rbp), %edx
	movzbl	50(%rbp), %eax
	addl	%edx, %eax
	movb	%al, 49(%rbp)
	movzbl	52(%rbp), %eax
	movzbl	49(%rbp), %ecx
	movzbl	51(%rbp), %edx
	cmpb	%dl, %cl
	setnb	%dl
	addl	%edx, %eax
	movb	%al, 52(%rbp)
	movzbl	49(%rbp), %eax
	movzbl	51(%rbp), %edx
	movzbl	%al, %eax
	divb	%dl
	movzbl	%ah, %eax
	movb	%al, 49(%rbp)
	movzbl	52(%rbp), %eax
	movzbl	53(%rbp), %edx
	movzbl	%al, %eax
	divb	%dl
	movzbl	%ah, %eax
	movb	%al, 52(%rbp)
	movl	66024(%rbp), %eax
	imull	66020(%rbp), %eax
	movl	66036(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, 65804(%rbp)
	movl	66048(%rbp), %eax
	movl	%eax, 65800(%rbp)
	movl	66052(%rbp), %eax
	movl	%eax, 65796(%rbp)
	movl	66024(%rbp), %eax
	imull	66016(%rbp), %eax
	movl	66032(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, 65792(%rbp)
	movl	$0, 65788(%rbp)
	movl	32(%rbp), %eax
	cmpl	%eax, 65804(%rbp)
	jl	.L166
	movl	36(%rbp), %eax
	cmpl	%eax, 65792(%rbp)
	jl	.L166
	movl	32(%rbp), %eax
	cmpl	%eax, 65796(%rbp)
	jg	.L166
	movl	36(%rbp), %eax
	cmpl	%eax, 65800(%rbp)
	jle	.L167
.L166:
	movl	$1, %eax
	jmp	.L168
.L167:
	movl	$0, %eax
.L168:
	movl	%eax, 65788(%rbp)
	movl	32(%rbp), %eax
	cmpl	%eax, 65804(%rbp)
	jge	.L169
	movl	65796(%rbp), %eax
	movl	%eax, 32(%rbp)
	addl	$1, 66156(%rbp)
.L169:
	movl	36(%rbp), %eax
	cmpl	%eax, 65800(%rbp)
	jle	.L170
	movl	65792(%rbp), %eax
	movl	%eax, 36(%rbp)
	cvtsi2sd	65864(%rbp), %xmm0
	call	sqrt
	cvttsd2si	%xmm0, %eax
	subl	%eax, 66156(%rbp)
.L170:
	movl	32(%rbp), %eax
	cmpl	%eax, 65796(%rbp)
	jle	.L171
	movl	65804(%rbp), %eax
	movl	%eax, 32(%rbp)
	subl	$1, 66156(%rbp)
.L171:
	movl	36(%rbp), %eax
	cmpl	%eax, 65792(%rbp)
	jge	.L172
	movl	65800(%rbp), %eax
	movl	%eax, 36(%rbp)
	cvtsi2sd	65864(%rbp), %xmm0
	call	sqrt
	cvttsd2si	%xmm0, %eax
	addl	%eax, 66156(%rbp)
.L172:
	cmpl	$0, 65788(%rbp)
	je	.L174
	movl	65864(%rbp), %eax
	addl	%eax, 66156(%rbp)
	movl	66156(%rbp), %eax
	cltd
	idivl	65864(%rbp)
	movl	%edx, 66156(%rbp)
	leaq	64(%rbp), %rax
	movl	66156(%rbp), %ecx
	movq	%rax, %rdx
	call	level_get_name
	jmp	.L174
.L165:
	movb	$0, 49(%rbp)
	movb	$0, 52(%rbp)
.L174:
	movl	glob_vk_space(%rip), %edx
	movl	glob_vk_enter(%rip), %eax
	orl	%edx, %eax
	testl	%eax, %eax
	je	.L175
	movl	$0, 66136(%rbp)
.L175:
	movl	32(%rbp), %eax
	movl	%eax, 40(%rbp)
	movl	36(%rbp), %eax
	movl	%eax, 44(%rbp)
	movl	$0, 66128(%rbp)
	jmp	.L176
.L180:
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	66128(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	12(%rax), %eax
	testl	%eax, %eax
	je	.L177
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	66128(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm1
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	66128(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movss	8(%rax), %xmm0
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	66128(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	addss	%xmm1, %xmm0
	movss	%xmm0, 4(%rax)
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	66128(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm0
	cvtsi2ss	66056(%rbp), %xmm1
	comiss	%xmm1, %xmm0
	jbe	.L177
	call	rand
	movl	%eax, %ecx
	movl	$1374389535, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$100, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	cmpl	$4, %eax
	jg	.L179
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	66128(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	$0, 12(%rax)
	jmp	.L177
.L179:
	movl	66056(%rbp), %ecx
	movl	66060(%rbp), %edx
	movl	66128(%rbp), %eax
	movl	%ecx, %r8d
	movl	%eax, %ecx
	call	createWaterParticle
.L177:
	addl	$1, 66128(%rbp)
.L176:
	movl	$100, %eax
	cmpl	%eax, 66128(%rbp)
	jl	.L180
	movl	65908(%rbp), %eax
	addl	%eax, 66152(%rbp)
	movl	66152(%rbp), %eax
	cmpl	65912(%rbp), %eax
	setge	%al
	movzbl	%al, %eax
	addl	%eax, 66148(%rbp)
	movl	66148(%rbp), %eax
	cltd
	idivl	65916(%rbp)
	movl	%edx, 66148(%rbp)
	movl	66152(%rbp), %eax
	cltd
	idivl	65912(%rbp)
	movl	%edx, 66152(%rbp)
	movl	$0, %edx
	movq	65992(%rbp), %rax
	movq	%rax, %rcx
	call	draw_clear
	movl	$16777215, %edx
	movq	65992(%rbp), %rax
	movq	%rax, %rcx
	call	draw_set_color
	movl	$33023, %edx
	movl	66052(%rbp), %ecx
	movq	65992(%rbp), %rax
	movl	%edx, 40(%rsp)
	movl	66056(%rbp), %edx
	movl	%edx, 32(%rsp)
	movl	%ecx, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	$8388863, %r8d
	movl	66060(%rbp), %eax
	subl	66052(%rbp), %eax
	movl	%eax, %ecx
	movl	66052(%rbp), %edx
	movq	65992(%rbp), %rax
	movl	%r8d, 40(%rsp)
	movl	66056(%rbp), %r8d
	movl	%r8d, 32(%rsp)
	movl	%ecx, %r9d
	movl	$0, %r8d
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	$33023, %edx
	movl	66060(%rbp), %eax
	subl	66052(%rbp), %eax
	movl	66060(%rbp), %r8d
	movq	65992(%rbp), %rcx
	movl	%edx, 40(%rsp)
	movl	66056(%rbp), %edx
	movl	%edx, 32(%rsp)
	movl	%r8d, %r9d
	movl	$0, %r8d
	movl	%eax, %edx
	call	draw_rectangle_color
	movl	66020(%rbp), %eax
	movl	%eax, 65784(%rbp)
	movl	$0, 65780(%rbp)
	cmpl	$0, 66136(%rbp)
	jne	.L181
	movl	65928(%rbp), %eax
	imull	66016(%rbp), %eax
	movl	65932(%rbp), %edx
	imull	66020(%rbp), %edx
	movl	%edx, %r8d
	movl	65780(%rbp), %r10d
	movl	65784(%rbp), %edx
	movq	65992(%rbp), %rcx
	movl	65928(%rbp), %r9d
	movl	%r9d, 64(%rsp)
	movl	65932(%rbp), %r9d
	movl	%r9d, 56(%rsp)
	leaq	.LC44(%rip), %r9
	movq	%r9, 48(%rsp)
	movq	65936(%rbp), %r9
	movq	%r9, 40(%rsp)
	movl	%eax, 32(%rsp)
	movl	%r8d, %r9d
	movl	%r10d, %r8d
	call	draw_text
.L181:
	movl	66020(%rbp), %edx
	movl	66036(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 65784(%rbp)
	movl	$0, 65780(%rbp)
	cmpl	$0, 66136(%rbp)
	jne	.L182
	movq	%rsp, %rax
	movq	%rax, -40(%rbp)
	leaq	.LC45(%rip), %rax
	movq	%rax, 65768(%rbp)
	movq	65768(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	subq	$1, %rdx
	movq	%rdx, 65760(%rbp)
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
	movq	%rax, 65752(%rbp)
	movq	65752(%rbp), %rax
	movq	65768(%rbp), %rdx
	movq	%rax, %rcx
	call	strcpy
	movl	66156(%rbp), %eax
	movb	%al, 65751(%rbp)
	movzbl	65751(%rbp), %eax
	movzbl	%al, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	shrw	$8, %ax
	movl	%eax, %ecx
	shrb	$4, %cl
	movzbl	%cl, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	leal	0(,%rax,4), %edx
	addl	%edx, %eax
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
	movq	65752(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC46(%rip), %rcx
	call	string_pos
	movl	%ebx, %ecx
	movq	65752(%rbp), %rdx
	cltq
	movb	%cl, (%rdx,%rax)
	movzbl	65751(%rbp), %eax
	movzbl	%al, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	leal	0(,%rax,4), %edx
	addl	%edx, %eax
	shrw	$8, %ax
	movl	%eax, %ecx
	shrb	$3, %cl
	movzbl	%cl, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	leal	0(,%rax,4), %edx
	addl	%edx, %eax
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
	movq	65752(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC47(%rip), %rcx
	call	string_pos
	movl	%ebx, %ecx
	movq	65752(%rbp), %rdx
	cltq
	movb	%cl, (%rdx,%rax)
	movzbl	65751(%rbp), %ecx
	movzbl	%cl, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	leal	0(,%rax,4), %edx
	addl	%edx, %eax
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
	movq	65752(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC48(%rip), %rcx
	call	string_pos
	movl	%ebx, %ecx
	movq	65752(%rbp), %rdx
	cltq
	movb	%cl, (%rdx,%rax)
	movq	65752(%rbp), %r9
	movl	65928(%rbp), %eax
	imull	66016(%rbp), %eax
	movl	65932(%rbp), %edx
	imull	66020(%rbp), %edx
	movl	%edx, %r8d
	movl	65780(%rbp), %r11d
	movl	65784(%rbp), %edx
	movq	65992(%rbp), %rcx
	movl	65928(%rbp), %r10d
	movl	%r10d, 64(%rsp)
	movl	65932(%rbp), %r10d
	movl	%r10d, 56(%rsp)
	movq	%r9, 48(%rsp)
	movq	65936(%rbp), %r9
	movq	%r9, 40(%rsp)
	movl	%eax, 32(%rsp)
	movl	%r8d, %r9d
	movl	%r11d, %r8d
	call	draw_text
	movl	65928(%rbp), %eax
	imull	66016(%rbp), %eax
	movl	65932(%rbp), %edx
	imull	66020(%rbp), %edx
	movl	%edx, %r8d
	movl	65928(%rbp), %edx
	imull	66016(%rbp), %edx
	movl	65780(%rbp), %ecx
	leal	(%rdx,%rcx), %r11d
	movl	65784(%rbp), %r10d
	movq	65992(%rbp), %rcx
	movl	65928(%rbp), %edx
	movl	%edx, 64(%rsp)
	movl	65932(%rbp), %edx
	movl	%edx, 56(%rsp)
	leaq	64(%rbp), %rdx
	movq	%rdx, 48(%rsp)
	movq	65936(%rbp), %rdx
	movq	%rdx, 40(%rsp)
	movl	%eax, 32(%rsp)
	movl	%r8d, %r9d
	movl	%r11d, %r8d
	movl	%r10d, %edx
	call	draw_text
	movl	65784(%rbp), %eax
	movl	%eax, 65744(%rbp)
	movl	65928(%rbp), %eax
	imull	66016(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	65780(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 65740(%rbp)
	movl	65744(%rbp), %eax
	addl	$256, %eax
	movl	%eax, 65736(%rbp)
	movl	65740(%rbp), %eax
	addl	$256, %eax
	movl	%eax, 65732(%rbp)
	movl	65736(%rbp), %r9d
	movl	65740(%rbp), %r8d
	movl	65744(%rbp), %edx
	movq	65992(%rbp), %rax
	movq	65848(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	65732(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_image
	movzbl	65751(%rbp), %eax
	movl	$0, %r8d
	movl	$4, %edx
	movl	%eax, %ecx
	call	BGG
	cvtsi2sd	%eax, %xmm0
	movsd	.LC49(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	cvtsi2sd	65736(%rbp), %xmm1
	cvtsi2sd	65744(%rbp), %xmm0
	call	lerp
	cvttsd2si	%xmm0, %eax
	movl	%eax, 65728(%rbp)
	movl	$255, %ecx
	movl	65728(%rbp), %eax
	leal	1(%rax), %r9d
	movl	65728(%rbp), %eax
	leal	-1(%rax), %edx
	movl	65740(%rbp), %r8d
	movq	65992(%rbp), %rax
	movl	%ecx, 40(%rsp)
	movl	65732(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_rectangle_color
	movzbl	65751(%rbp), %eax
	movl	$1, %r8d
	movl	$4, %edx
	movl	%eax, %ecx
	call	BGG
	cvtsi2sd	%eax, %xmm0
	movsd	.LC49(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	cvtsi2sd	65732(%rbp), %xmm1
	cvtsi2sd	65740(%rbp), %xmm0
	call	lerp
	cvttsd2si	%xmm0, %eax
	movl	%eax, 65724(%rbp)
	movl	$255, %r10d
	movl	65724(%rbp), %eax
	leal	1(%rax), %ecx
	movl	65724(%rbp), %eax
	leal	-1(%rax), %r8d
	movl	65736(%rbp), %r9d
	movl	65744(%rbp), %edx
	movq	65992(%rbp), %rax
	movl	%r10d, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	$255, %edi
	movzbl	65751(%rbp), %eax
	movl	$1, %r8d
	movl	$4, %edx
	movl	%eax, %ecx
	call	BGG
	addl	$1, %eax
	cvtsi2sd	%eax, %xmm0
	movsd	.LC49(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	cvtsi2sd	65732(%rbp), %xmm1
	cvtsi2sd	65740(%rbp), %xmm0
	call	lerp
	cvttsd2si	%xmm0, %ebx
	movzbl	65751(%rbp), %eax
	movl	$0, %r8d
	movl	$4, %edx
	movl	%eax, %ecx
	call	BGG
	addl	$1, %eax
	cvtsi2sd	%eax, %xmm0
	movsd	.LC49(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	cvtsi2sd	65736(%rbp), %xmm1
	cvtsi2sd	65744(%rbp), %xmm0
	call	lerp
	cvttsd2si	%xmm0, %ecx
	movl	65724(%rbp), %r8d
	movl	65728(%rbp), %edx
	movq	65992(%rbp), %rax
	movl	%edi, 40(%rsp)
	movl	%ebx, 32(%rsp)
	movl	%ecx, %r9d
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	$0, 66124(%rbp)
	movl	66016(%rbp), %eax
	sall	$5, %eax
	movl	%eax, %edx
	movl	65732(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 65720(%rbp)
	movl	$0, 66120(%rbp)
	jmp	.L183
.L186:
	movl	66148(%rbp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %r8d
	movl	%r8d, %eax
	sall	$2, %eax
	addl	%r8d, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %r8d
	movl	66148(%rbp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %r9d
	movl	$715827883, %edx
	movl	%r9d, %eax
	imull	%edx
	movl	%r9d, %eax
	sarl	$31, %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	addl	%eax, %eax
	addl	%ecx, %eax
	addl	%eax, %eax
	movl	%r9d, %ecx
	subl	%eax, %ecx
	movl	66148(%rbp), %r9d
	movl	$-2004318071, %edx
	movl	%r9d, %eax
	imull	%edx
	leal	(%rdx,%r9), %eax
	sarl	$5, %eax
	movl	%eax, %edx
	movl	%r9d, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %r9d
	movl	$1717986919, %edx
	movl	%r9d, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%r9d, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %r10d
	movl	%r10d, %eax
	sall	$2, %eax
	addl	%r10d, %eax
	addl	%eax, %eax
	movl	%r9d, %r10d
	subl	%eax, %r10d
	movl	66148(%rbp), %r9d
	movl	$458129845, %edx
	movl	%r9d, %eax
	imull	%edx
	sarl	$6, %edx
	movl	%r9d, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	66120(%rbp), %eax
	movl	%r8d, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	$737, %r9d
	movl	%r10d, %r8d
	movl	%eax, %ecx
	call	mux_int
	movl	%eax, 65716(%rbp)
	cmpl	$2, 66120(%rbp)
	je	.L184
	movl	65716(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %ecx
	movl	66120(%rbp), %eax
	addl	$1, %eax
	imull	66020(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	65784(%rbp), %eax
	addl	%eax, %edx
	movl	66124(%rbp), %eax
	leal	(%rdx,%rax), %r9d
	movl	66120(%rbp), %eax
	imull	66020(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	65784(%rbp), %eax
	addl	%eax, %edx
	movl	66124(%rbp), %eax
	addl	%eax, %edx
	movl	65732(%rbp), %r8d
	movq	65992(%rbp), %rax
	movl	$32, 72(%rsp)
	movl	$16, 64(%rsp)
	movl	$0, 56(%rsp)
	movl	%ecx, 48(%rsp)
	movq	65920(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	65720(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_image_part
	movl	66020(%rbp), %eax
	addl	%eax, 66124(%rbp)
	jmp	.L185
.L184:
	movl	66020(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	65784(%rbp), %eax
	leal	(%rdx,%rax), %r9d
	movl	66020(%rbp), %eax
	sall	$5, %eax
	movl	%eax, %edx
	movl	65784(%rbp), %eax
	addl	%eax, %edx
	movl	65732(%rbp), %r8d
	movq	65992(%rbp), %rax
	movl	65928(%rbp), %ecx
	movl	%ecx, 64(%rsp)
	movl	65932(%rbp), %ecx
	movl	%ecx, 56(%rsp)
	leaq	.LC50(%rip), %rcx
	movq	%rcx, 48(%rsp)
	movq	65936(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	65720(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_text
.L185:
	addl	$1, 66120(%rbp)
.L183:
	cmpl	$4, 66120(%rbp)
	jle	.L186
	movl	$0, 66116(%rbp)
	movl	66148(%rbp), %eax
	movl	$59, 32(%rsp)
	movl	$5, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	%eax, %ecx
	call	clock_is_between
	testl	%eax, %eax
	je	.L187
	movl	$0, 66116(%rbp)
.L187:
	movl	66148(%rbp), %eax
	movl	$59, 32(%rsp)
	movl	$11, %r9d
	movl	$0, %r8d
	movl	$6, %edx
	movl	%eax, %ecx
	call	clock_is_between
	testl	%eax, %eax
	je	.L188
	movl	$1, 66116(%rbp)
.L188:
	movl	66148(%rbp), %eax
	movl	$59, 32(%rsp)
	movl	$17, %r9d
	movl	$0, %r8d
	movl	$12, %edx
	movl	%eax, %ecx
	call	clock_is_between
	testl	%eax, %eax
	je	.L189
	movl	$2, 66116(%rbp)
.L189:
	movl	66148(%rbp), %eax
	movl	$59, 32(%rsp)
	movl	$23, %r9d
	movl	$0, %r8d
	movl	$18, %edx
	movl	%eax, %ecx
	call	clock_is_between
	testl	%eax, %eax
	je	.L190
	movl	$3, 66116(%rbp)
.L190:
	movq	65880(%rbp), %r9
	movq	65888(%rbp), %r8
	movq	65896(%rbp), %rdx
	movl	66116(%rbp), %eax
	movq	65872(%rbp), %rcx
	movq	%rcx, 32(%rsp)
	movl	%eax, %ecx
	call	mux_str
	movq	%rax, %r11
	movl	65928(%rbp), %eax
	imull	66016(%rbp), %eax
	movl	65932(%rbp), %edx
	imull	66020(%rbp), %edx
	movl	%edx, %r8d
	movl	65720(%rbp), %ecx
	movl	66016(%rbp), %edx
	leal	(%rcx,%rdx), %r10d
	movl	65784(%rbp), %edx
	movq	65992(%rbp), %rcx
	movl	65928(%rbp), %r9d
	movl	%r9d, 64(%rsp)
	movl	65932(%rbp), %r9d
	movl	%r9d, 56(%rsp)
	movq	%r11, 48(%rsp)
	movq	65936(%rbp), %r9
	movq	%r9, 40(%rsp)
	movl	%eax, 32(%rsp)
	movl	%r8d, %r9d
	movl	%r10d, %r8d
	call	draw_text
	movq	-40(%rbp), %rsp
.L182:
	movl	$0, 66112(%rbp)
	jmp	.L191
.L201:
	movl	$0, 66108(%rbp)
	jmp	.L192
.L200:
	movl	66112(%rbp), %eax
	imull	66028(%rbp), %eax
	movl	66108(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65712(%rbp)
	movl	66108(%rbp), %eax
	imull	66020(%rbp), %eax
	imull	66024(%rbp), %eax
	movl	66052(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65708(%rbp)
	movl	66112(%rbp), %eax
	imull	66016(%rbp), %eax
	imull	66024(%rbp), %eax
	movl	66048(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65704(%rbp)
	movl	66108(%rbp), %eax
	addl	$1, %eax
	imull	66020(%rbp), %eax
	imull	66024(%rbp), %eax
	movl	66052(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65700(%rbp)
	movl	66112(%rbp), %eax
	addl	$1, %eax
	imull	66016(%rbp), %eax
	imull	66024(%rbp), %eax
	movl	66048(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65696(%rbp)
	movl	$16711680, %r9d
	movl	$65280, %r8d
	movl	$255, %r10d
	movl	65712(%rbp), %ecx
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
	movl	%eax, 65692(%rbp)
	movl	65700(%rbp), %r9d
	movl	65704(%rbp), %r8d
	movl	65708(%rbp), %edx
	movq	65992(%rbp), %rax
	movl	65692(%rbp), %ecx
	movl	%ecx, 40(%rsp)
	movl	65696(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	65868(%rbp), %eax
	imull	66156(%rbp), %eax
	movl	65712(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65688(%rbp)
	movl	65688(%rbp), %eax
	cltq
	movzbl	80(%rbp,%rax), %eax
	movzbl	%al, %eax
	andl	$3, %eax
	movl	%eax, 65684(%rbp)
	cmpl	$1, 65684(%rbp)
	je	.L193
	cmpl	$1, 65684(%rbp)
	jg	.L194
	cmpl	$0, 65684(%rbp)
	je	.L195
	jmp	.L196
.L194:
	cmpl	$2, 65684(%rbp)
	je	.L197
	cmpl	$3, 65684(%rbp)
	je	.L198
	jmp	.L196
.L195:
	movq	65976(%rbp), %rax
	movq	%rax, 66096(%rbp)
	jmp	.L199
.L193:
	movq	65968(%rbp), %rax
	movq	%rax, 66096(%rbp)
	jmp	.L199
.L197:
	movq	65960(%rbp), %rax
	movq	%rax, 66096(%rbp)
	jmp	.L199
.L198:
	movq	65952(%rbp), %rax
	movq	%rax, 66096(%rbp)
	jmp	.L199
.L196:
	movq	65976(%rbp), %rax
	movq	%rax, 66096(%rbp)
	leaq	.LC51(%rip), %rcx
	call	puts
	nop
.L199:
	movl	65700(%rbp), %r9d
	movl	65704(%rbp), %r8d
	movl	65708(%rbp), %edx
	movq	65992(%rbp), %rax
	movq	66096(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	65696(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_image
	addl	$1, 66108(%rbp)
.L192:
	movl	66108(%rbp), %eax
	cmpl	66028(%rbp), %eax
	jl	.L200
	addl	$1, 66112(%rbp)
.L191:
	movl	66112(%rbp), %eax
	cmpl	66028(%rbp), %eax
	jl	.L201
	movl	66024(%rbp), %eax
	movl	%eax, 65680(%rbp)
	movzbl	48(%rbp), %eax
	movzbl	%al, %eax
	imull	65680(%rbp), %eax
	movl	%eax, %edx
	movzbl	53(%rbp), %eax
	movzbl	%al, %eax
	imull	%eax, %edx
	movzbl	52(%rbp), %eax
	movzbl	%al, %eax
	imull	65680(%rbp), %eax
	leal	(%rdx,%rax), %r8d
	movl	36(%rbp), %edx
	movl	65680(%rbp), %eax
	imull	66016(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	movl	32(%rbp), %edx
	movl	65680(%rbp), %eax
	imull	66020(%rbp), %eax
	leal	(%rdx,%rax), %r11d
	movl	36(%rbp), %r10d
	movl	32(%rbp), %edx
	movq	65992(%rbp), %rax
	movl	65680(%rbp), %r9d
	movl	%r9d, 72(%rsp)
	movl	65680(%rbp), %r9d
	movl	%r9d, 64(%rsp)
	movl	$0, 56(%rsp)
	movl	%r8d, 48(%rsp)
	movq	65944(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	%r11d, %r9d
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	draw_image_part
	movl	$0, 66092(%rbp)
	jmp	.L202
.L204:
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	66092(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	12(%rax), %eax
	testl	%eax, %eax
	je	.L203
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	66092(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm1
	movss	.LC52(%rip), %xmm0
	addss	%xmm1, %xmm0
	cvttss2si	%xmm0, %edx
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rcx
	movl	66092(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm1
	movss	.LC53(%rip), %xmm0
	addss	%xmm1, %xmm0
	cvttss2si	%xmm0, %r9d
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rcx
	movl	66092(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movss	4(%rax), %xmm0
	cvttss2si	%xmm0, %r8d
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rcx
	movl	66092(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm0
	cvttss2si	%xmm0, %eax
	movq	65992(%rbp), %rcx
	movq	65960(%rbp), %r10
	movq	%r10, 40(%rsp)
	movl	%edx, 32(%rsp)
	movl	%eax, %edx
	call	draw_image
.L203:
	addl	$1, 66092(%rbp)
.L202:
	movl	$100, %eax
	cmpl	%eax, 66092(%rbp)
	jl	.L204
	cmpl	$0, 66136(%rbp)
	je	.L205
	movl	66036(%rbp), %r9d
	movl	66048(%rbp), %r8d
	movl	66052(%rbp), %edx
	movq	65992(%rbp), %rax
	movq	65824(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	66032(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_image
	movl	65928(%rbp), %eax
	imull	66016(%rbp), %eax
	movl	65932(%rbp), %edx
	imull	66020(%rbp), %edx
	movl	%edx, %r8d
	movl	66048(%rbp), %r10d
	movl	66052(%rbp), %edx
	movq	65992(%rbp), %rcx
	movl	65928(%rbp), %r9d
	movl	%r9d, 64(%rsp)
	movl	65932(%rbp), %r9d
	movl	%r9d, 56(%rsp)
	movq	65816(%rbp), %r9
	movq	%r9, 48(%rsp)
	movq	65936(%rbp), %r9
	movq	%r9, 40(%rsp)
	movl	%eax, 32(%rsp)
	movl	%r8d, %r9d
	movl	%r10d, %r8d
	call	draw_text
.L205:
	movq	65992(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_RenderPresent
	movl	$16, %ecx
	call	SDL_Delay
.L136:
	cmpl	$0, 66132(%rbp)
	jne	.L137
	leaq	.LC54(%rip), %rcx
	call	puts
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	free
	movq	65976(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	65968(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	65960(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	65952(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	65848(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	65944(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	65824(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	65936(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	65920(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	call	IMG_Quit
	movl	65836(%rbp), %eax
	movl	%eax, %ecx
	call	SDL_CloseAudioDevice
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_FreeWAV
	movq	65992(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyRenderer
	movq	66000(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyWindow
	call	SDL_Quit
	movl	$500, %ecx
	call	SDL_Delay
	movl	$0, %eax
	jmp	.L123
.L128:
	call	SDL_GetError
	movq	%rax, %rsi
	movq	66064(%rbp), %rbx
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC55(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	call	SDL_Quit
	movl	$1, %ecx
	call	exit
.L123:
	movq	%rsi, %rsp
	jmp	.L121
.L134:
	movq	%rsi, %rsp
.L121:
	leaq	66168(%rbp), %rsp
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
	.align 8
.LC3:
	.long	0
	.long	1081507840
	.align 4
.LC16:
	.long	1092616192
	.align 8
.LC49:
	.long	0
	.long	1076887552
	.align 4
.LC52:
	.long	1097859072
	.align 4
.LC53:
	.long	1084227584
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
	.def	SDL_GetTicks64;	.scl	2;	.type	32;	.endef
	.def	atan2;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	fread;	.scl	2;	.type	32;	.endef
	.def	fseek;	.scl	2;	.type	32;	.endef
	.def	fgetc;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	fgets;	.scl	2;	.type	32;	.endef
	.def	rand;	.scl	2;	.type	32;	.endef
	.def	SDL_memcpy;	.scl	2;	.type	32;	.endef
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	time;	.scl	2;	.type	32;	.endef
	.def	srand;	.scl	2;	.type	32;	.endef
	.def	SDL_Init;	.scl	2;	.type	32;	.endef
	.def	SDL_CreateWindow;	.scl	2;	.type	32;	.endef
	.def	SDL_CreateRenderer;	.scl	2;	.type	32;	.endef
	.def	SDL_GetWindowSurface;	.scl	2;	.type	32;	.endef
	.def	IMG_Init;	.scl	2;	.type	32;	.endef
	.def	IMG_LoadTexture;	.scl	2;	.type	32;	.endef
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
