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
	leaq	.LC3(%rip), %rcx
	call	puts
	movl	$0, glob_vk_f2(%rip)
	leaq	.LC4(%rip), %rdx
	leaq	.LC5(%rip), %rcx
	call	fopen
	movq	%rax, 131040(%rbp)
	leaq	.LC6(%rip), %rdx
	leaq	.LC7(%rip), %rcx
	call	fopen
	movq	%rax, 131032(%rbp)
	movl	$131072, 131028(%rbp)
	movl	$32, 131028(%rbp)
	movl	$0, 131068(%rbp)
	jmp	.L70
.L71:
	movl	131068(%rbp), %eax
	cltq
	movb	$0, -48(%rbp,%rax)
	addl	$1, 131068(%rbp)
.L70:
	movl	131068(%rbp), %eax
	cmpl	131028(%rbp), %eax
	jl	.L71
	movl	$0, 131064(%rbp)
	jmp	.L72
.L73:
	movq	131040(%rbp), %rax
	movq	%rax, %rcx
	call	fgetc
	addl	$1, 131064(%rbp)
.L72:
	cmpl	$501, 131064(%rbp)
	jle	.L73
	movl	$44, %eax
	movb	%al, 131027(%rbp)
	movl	$0, 131060(%rbp)
.L87:
	movq	131040(%rbp), %rax
	movq	%rax, %rcx
	call	fgetc
	movb	%al, 131026(%rbp)
	cmpb	$60, 131026(%rbp)
	je	.L88
	movl	131060(%rbp), %eax
	cmpl	131028(%rbp), %eax
	jge	.L89
	movl	$0, 131056(%rbp)
	jmp	.L77
.L78:
	movl	131056(%rbp), %eax
	cltq
	movb	$48, -51(%rbp,%rax)
	addl	$1, 131056(%rbp)
.L77:
	cmpl	$2, 131056(%rbp)
	jle	.L78
	movzbl	131026(%rbp), %eax
	movb	%al, -51(%rbp)
	movq	131040(%rbp), %rax
	movq	%rax, %rcx
	call	fgetc
	movb	%al, 131026(%rbp)
	movzbl	131026(%rbp), %eax
	cmpb	131027(%rbp), %al
	je	.L79
	movzbl	131026(%rbp), %eax
	movb	%al, -50(%rbp)
	movq	131040(%rbp), %rax
	movq	%rax, %rcx
	call	fgetc
	movb	%al, 131026(%rbp)
	movzbl	131026(%rbp), %eax
	cmpb	131027(%rbp), %al
	je	.L80
	movzbl	131026(%rbp), %eax
	movb	%al, -49(%rbp)
	movq	131040(%rbp), %rax
	movq	%rax, %rcx
	call	fgetc
	jmp	.L82
.L80:
	movzbl	-50(%rbp), %eax
	movb	%al, -49(%rbp)
	movzbl	-51(%rbp), %eax
	movb	%al, -50(%rbp)
	movb	$48, -51(%rbp)
	jmp	.L82
.L79:
	movzbl	-51(%rbp), %eax
	movb	%al, -49(%rbp)
	movb	$48, -51(%rbp)
.L82:
	movl	$0, 131052(%rbp)
	jmp	.L83
.L84:
	movl	131052(%rbp), %eax
	cltq
	movzbl	-51(%rbp,%rax), %eax
	subl	$48, %eax
	movl	131052(%rbp), %edx
	movslq	%edx, %rdx
	movb	%al, -51(%rbp,%rdx)
	addl	$1, 131052(%rbp)
.L83:
	cmpl	$2, 131052(%rbp)
	jle	.L84
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
	jne	.L85
	movb	$-1, 131051(%rbp)
	jmp	.L86
.L85:
	subb	$1, 131051(%rbp)
.L86:
	movzbl	-49(%rbp), %eax
	movzbl	%al, %ecx
	movzbl	-50(%rbp), %eax
	movzbl	%al, %edx
	movzbl	-51(%rbp), %eax
	movzbl	%al, %eax
	movzbl	131051(%rbp), %r8d
	movl	131028(%rbp), %r11d
	movl	131060(%rbp), %r10d
	movl	%ecx, 48(%rsp)
	movl	%edx, 40(%rsp)
	movl	%eax, 32(%rsp)
	movl	%r8d, %r9d
	movl	%r11d, %r8d
	movl	%r10d, %edx
	leaq	.LC8(%rip), %rcx
	call	printf
	movl	131060(%rbp), %eax
	movslq	%eax, %rdx
	movzbl	131051(%rbp), %eax
	movb	%al, -48(%rbp,%rdx)
	addl	$1, 131060(%rbp)
	jmp	.L87
.L88:
	nop
	jmp	.L75
.L89:
	nop
.L75:
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
	jb	.L92
	movq	-8(%rbp), %rax
	movl	$0, 12(%rax)
.L92:
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
	.section .rdata,"dr"
.LC9:
	.ascii "SDL init error:%s\12\0"
.LC10:
	.ascii "COSC345 - Game\0"
.LC11:
	.ascii "Window error\0"
.LC12:
	.ascii "Render error\0"
.LC13:
	.ascii "Surface error\0"
.LC14:
	.ascii "img/spr_grass.png\0"
.LC15:
	.ascii "img/spr_sand.png\0"
.LC16:
	.ascii "img/spr_water.png\0"
.LC17:
	.ascii "img/spr_lava.png\0"
.LC18:
	.ascii "img/player_strip8.png\0"
.LC19:
	.ascii "img/ascii_strip96.png\0"
.LC20:
	.ascii "rb\0"
.LC21:
	.ascii "level.dat\0"
.LC22:
	.ascii "music.wav\0"
.LC23:
	.ascii "Failed to load WAV file: %s\12\0"
	.align 8
.LC24:
	.ascii "Failed to open audio device: %s\12\0"
.LC25:
	.ascii "img/img_lands.png\0"
.LC26:
	.ascii "Press SPACE to continue.\0"
.LC27:
	.ascii "Entering main loop...\0"
.LC28:
	.ascii "F2 started!\0"
.LC29:
	.ascii "F2 finished!\0"
.LC30:
	.ascii "Location:#DUNEDIN#NEW ZEALAND\0"
.LC31:
	.ascii "LVL: XYZ/255\0"
.LC32:
	.ascii "X\0"
.LC33:
	.ascii "Y\0"
.LC34:
	.ascii "Z\0"
.LC35:
	.ascii "...exited main loop.\0"
.LC36:
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
	movl	$66120, %eax
	call	___chkstk_ms
	subq	%rax, %rsp
	.seh_stackalloc	66120
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movl	%ecx, 66064(%rbp)
	movq	%rdx, 66072(%rbp)
	movq	%rsp, %rax
	movq	%rax, %rbx
	movq	$256, 65952(%rbp)
	movq	65952(%rbp), %rax
	subq	$1, %rax
	movq	%rax, 65944(%rbp)
	movq	65952(%rbp), %rax
	movq	%rax, %r10
	movl	$0, %r11d
	movq	65952(%rbp), %rax
	movq	%rax, %r8
	movl	$0, %r9d
	movq	65952(%rbp), %rax
	addq	$15, %rax
	shrq	$4, %rax
	salq	$4, %rax
	call	___chkstk_ms
	subq	%rax, %rsp
	leaq	80(%rsp), %rax
	addq	$0, %rax
	movq	%rax, 65936(%rbp)
	movl	$1366, 65932(%rbp)
	movl	$768, 65928(%rbp)
	movl	65932(%rbp), %eax
	subl	65928(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, 65924(%rbp)
	movl	$0, 65920(%rbp)
	movl	65928(%rbp), %eax
	movl	%eax, 65916(%rbp)
	movl	65928(%rbp), %eax
	movl	%eax, 65912(%rbp)
	movl	65924(%rbp), %edx
	movl	65916(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 65908(%rbp)
	movl	65920(%rbp), %edx
	movl	65912(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 65904(%rbp)
	movl	$16, 65900(%rbp)
	movl	$16, 65896(%rbp)
	movl	65900(%rbp), %eax
	movl	%eax, %ecx
	call	sqr
	movl	%eax, %edi
	movl	65928(%rbp), %eax
	cltd
	idivl	%edi
	movl	%eax, 65892(%rbp)
	movl	65892(%rbp), %eax
	movl	%eax, 65888(%rbp)
	movl	$62001, 65884(%rbp)
	movl	65884(%rbp), %eax
	movl	%eax, %ecx
	call	SDL_Init
	testl	%eax, %eax
	je	.L94
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC9(%rip), %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L95
.L94:
	movl	65932(%rbp), %edx
	movl	$0, 40(%rsp)
	movl	65928(%rbp), %eax
	movl	%eax, 32(%rsp)
	movl	%edx, %r9d
	movl	$536805376, %r8d
	movl	$536805376, %edx
	leaq	.LC10(%rip), %rcx
	call	SDL_CreateWindow
	movq	%rax, 65872(%rbp)
	cmpq	$0, 65872(%rbp)
	jne	.L96
	movq	65936(%rbp), %rax
	movq	65952(%rbp), %rdx
	leaq	.LC11(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L97
.L96:
	movq	65872(%rbp), %rax
	movl	$4, %r8d
	movl	$-1, %edx
	movq	%rax, %rcx
	call	SDL_CreateRenderer
	movq	%rax, 65864(%rbp)
	cmpq	$0, 65864(%rbp)
	jne	.L98
	movq	65936(%rbp), %rax
	movq	65952(%rbp), %rdx
	leaq	.LC12(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L97
.L98:
	movq	65872(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_GetWindowSurface
	movq	%rax, 65856(%rbp)
	cmpq	$0, 65856(%rbp)
	jne	.L99
	movq	65936(%rbp), %rax
	movq	65952(%rbp), %rdx
	leaq	.LC13(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L97
.L99:
	movl	$2, %ecx
	call	IMG_Init
	movq	65864(%rbp), %rax
	leaq	.LC14(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 65848(%rbp)
	movq	65864(%rbp), %rax
	leaq	.LC15(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 65840(%rbp)
	movq	65864(%rbp), %rax
	leaq	.LC16(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 65832(%rbp)
	movq	65864(%rbp), %rax
	leaq	.LC17(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 65824(%rbp)
	movq	65864(%rbp), %rax
	leaq	.LC18(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 65816(%rbp)
	movq	65864(%rbp), %rax
	leaq	.LC19(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 65808(%rbp)
	movl	$8, 65804(%rbp)
	movl	$16, 65800(%rbp)
	movl	65900(%rbp), %eax
	movl	%eax, %ecx
	call	sqr
	movl	%eax, 65796(%rbp)
	movl	$256, 65792(%rbp)
	movl	$0, 65980(%rbp)
	leaq	.LC20(%rip), %rdx
	leaq	.LC21(%rip), %rcx
	call	fopen
	movq	%rax, 65784(%rbp)
	movl	$0, 65976(%rbp)
	jmp	.L100
.L101:
	movl	65976(%rbp), %eax
	cltq
	movb	$0, 48(%rbp,%rax)
	addl	$1, 65976(%rbp)
.L100:
	movl	65796(%rbp), %eax
	imull	65792(%rbp), %eax
	cmpl	%eax, 65976(%rbp)
	jl	.L101
	movq	65784(%rbp), %rdx
	leaq	48(%rbp), %rax
	movq	%rdx, %r9
	movl	$1, %r8d
	movl	$65536, %edx
	movq	%rax, %rcx
	call	fread
	movq	65784(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movl	65892(%rbp), %eax
	imull	65896(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	65924(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 16(%rbp)
	movl	65888(%rbp), %eax
	imull	65896(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	65920(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 20(%rbp)
	movb	$0, 32(%rbp)
	movb	$0, 33(%rbp)
	movb	$1, 34(%rbp)
	movb	$12, 35(%rbp)
	movb	$0, 36(%rbp)
	movb	$2, 37(%rbp)
	movb	$12, 38(%rbp)
	leaq	.LC22(%rip), %rax
	movq	%rax, 65776(%rbp)
	movq	65776(%rbp), %rax
	leaq	.LC20(%rip), %rdx
	movq	%rax, %rcx
	call	SDL_RWFromFile
	movq	%rax, %r10
	leaq	-24(%rbp), %rcx
	leaq	-16(%rbp), %rdx
	leaq	-28(%rbp), %rax
	movq	%rax, 32(%rsp)
	movq	%rcx, %r9
	movq	%rdx, %r8
	movl	$1, %edx
	movq	%r10, %rcx
	call	SDL_LoadWAV_RW
	testq	%rax, %rax
	jne	.L102
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC23(%rip), %rcx
	call	printf
	jmp	.L103
.L102:
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
	movl	%eax, 65772(%rbp)
	cmpl	$0, 65772(%rbp)
	jne	.L104
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC24(%rip), %rcx
	call	printf
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_FreeWAV
	jmp	.L103
.L104:
	movl	-28(%rbp), %ecx
	movq	-24(%rbp), %rdx
	movl	65772(%rbp), %eax
	movl	%ecx, %r8d
	movl	%eax, %ecx
	call	SDL_QueueAudio
	movl	65772(%rbp), %eax
	movl	$0, %edx
	movl	%eax, %ecx
	call	SDL_PauseAudioDevice
	movl	$1, 65972(%rbp)
	movq	65864(%rbp), %rax
	leaq	.LC25(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 65760(%rbp)
	leaq	.LC26(%rip), %rax
	movq	%rax, 65752(%rbp)
	movl	$1, 65968(%rbp)
	leaq	.LC27(%rip), %rcx
	call	puts
	jmp	.L105
.L128:
	movl	65584(%rbp), %eax
	cmpl	$768, %eax
	je	.L107
	cmpl	$769, %eax
	je	.L108
	cmpl	$256, %eax
	jne	.L106
	movl	$0, 65968(%rbp)
	jmp	.L106
.L107:
	movl	$1, 65748(%rbp)
	movl	65604(%rbp), %eax
	cmpl	$1073741903, %eax
	je	.L109
	cmpl	$1073741903, %eax
	jg	.L110
	cmpl	$32, %eax
	je	.L111
	cmpl	$1073741883, %eax
	je	.L112
	cmpl	$27, %eax
	je	.L113
	jmp	.L106
.L110:
	cmpl	$1073741905, %eax
	je	.L115
	cmpl	$1073741905, %eax
	jl	.L116
	cmpl	$1073741906, %eax
	je	.L117
	cmpl	$1073741912, %eax
	je	.L118
	jmp	.L106
.L113:
	movl	$0, 65968(%rbp)
	jmp	.L114
.L109:
	movl	65748(%rbp), %eax
	movl	%eax, glob_vk_right(%rip)
	jmp	.L114
.L116:
	movl	65748(%rbp), %eax
	movl	%eax, glob_vk_left(%rip)
	jmp	.L114
.L117:
	movl	65748(%rbp), %eax
	movl	%eax, glob_vk_up(%rip)
	jmp	.L114
.L115:
	movl	65748(%rbp), %eax
	movl	%eax, glob_vk_down(%rip)
	jmp	.L114
.L111:
	movl	65748(%rbp), %eax
	movl	%eax, glob_vk_space(%rip)
	jmp	.L114
.L118:
	movl	65748(%rbp), %eax
	movl	%eax, glob_vk_enter(%rip)
	jmp	.L114
.L112:
	movl	65748(%rbp), %eax
	movl	%eax, glob_vk_f2(%rip)
	nop
.L114:
	jmp	.L106
.L108:
	movl	$0, 65744(%rbp)
	movl	65604(%rbp), %eax
	cmpl	$1073741904, %eax
	je	.L119
	cmpl	$1073741904, %eax
	jg	.L120
	cmpl	$1073741883, %eax
	je	.L121
	cmpl	$1073741903, %eax
	je	.L122
	cmpl	$32, %eax
	je	.L123
	jmp	.L155
.L120:
	cmpl	$1073741906, %eax
	je	.L125
	cmpl	$1073741906, %eax
	jl	.L126
	cmpl	$1073741912, %eax
	je	.L127
	jmp	.L155
.L122:
	movl	65744(%rbp), %eax
	movl	%eax, glob_vk_right(%rip)
	jmp	.L124
.L119:
	movl	65744(%rbp), %eax
	movl	%eax, glob_vk_left(%rip)
	jmp	.L124
.L125:
	movl	65744(%rbp), %eax
	movl	%eax, glob_vk_up(%rip)
	jmp	.L124
.L126:
	movl	65744(%rbp), %eax
	movl	%eax, glob_vk_down(%rip)
	jmp	.L124
.L123:
	movl	65744(%rbp), %eax
	movl	%eax, glob_vk_space(%rip)
	jmp	.L124
.L127:
	movl	65744(%rbp), %eax
	movl	%eax, glob_vk_enter(%rip)
	jmp	.L124
.L121:
	movl	65744(%rbp), %eax
	movl	%eax, glob_vk_f2(%rip)
	nop
.L124:
.L155:
	nop
.L106:
	leaq	65584(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_PollEvent
	testl	%eax, %eax
	jne	.L128
	movl	glob_vk_f2(%rip), %eax
	testl	%eax, %eax
	je	.L129
	leaq	.LC28(%rip), %rcx
	call	puts
	call	dev_tiled_to_leveldata
	leaq	.LC29(%rip), %rcx
	call	puts
.L129:
	movl	glob_vk_right(%rip), %eax
	testl	%eax, %eax
	je	.L130
	movb	$0, 32(%rbp)
	movl	16(%rbp), %edx
	movzbl	38(%rbp), %eax
	movzbl	%al, %eax
	addl	%edx, %eax
	movl	%eax, 16(%rbp)
.L130:
	movl	glob_vk_up(%rip), %eax
	testl	%eax, %eax
	je	.L131
	movb	$1, 32(%rbp)
	movl	20(%rbp), %edx
	movzbl	38(%rbp), %eax
	movzbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, 20(%rbp)
.L131:
	movl	glob_vk_left(%rip), %eax
	testl	%eax, %eax
	je	.L132
	movb	$2, 32(%rbp)
	movl	16(%rbp), %edx
	movzbl	38(%rbp), %eax
	movzbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, 16(%rbp)
.L132:
	movl	glob_vk_down(%rip), %eax
	testl	%eax, %eax
	je	.L133
	movb	$3, 32(%rbp)
	movl	20(%rbp), %edx
	movzbl	38(%rbp), %eax
	movzbl	%al, %eax
	addl	%edx, %eax
	movl	%eax, 20(%rbp)
.L133:
	movl	glob_vk_right(%rip), %edx
	movl	glob_vk_left(%rip), %eax
	orl	%eax, %edx
	movl	glob_vk_up(%rip), %eax
	orl	%eax, %edx
	movl	glob_vk_down(%rip), %eax
	orl	%edx, %eax
	testl	%eax, %eax
	je	.L134
	movzbl	33(%rbp), %edx
	movzbl	34(%rbp), %eax
	addl	%edx, %eax
	movb	%al, 33(%rbp)
	movzbl	36(%rbp), %eax
	movzbl	33(%rbp), %ecx
	movzbl	35(%rbp), %edx
	cmpb	%dl, %cl
	setnb	%dl
	addl	%edx, %eax
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
	movl	65896(%rbp), %eax
	imull	65892(%rbp), %eax
	movl	65908(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, 65740(%rbp)
	movl	65920(%rbp), %eax
	movl	%eax, 65736(%rbp)
	movl	65924(%rbp), %eax
	movl	%eax, 65732(%rbp)
	movl	65896(%rbp), %eax
	imull	65888(%rbp), %eax
	movl	65904(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, 65728(%rbp)
	movl	$0, 65724(%rbp)
	movl	16(%rbp), %eax
	cmpl	%eax, 65740(%rbp)
	jl	.L135
	movl	20(%rbp), %eax
	cmpl	%eax, 65728(%rbp)
	jl	.L135
	movl	16(%rbp), %eax
	cmpl	%eax, 65732(%rbp)
	jg	.L135
	movl	20(%rbp), %eax
	cmpl	%eax, 65736(%rbp)
	jle	.L136
.L135:
	movl	$1, %eax
	jmp	.L137
.L136:
	movl	$0, %eax
.L137:
	movl	%eax, 65724(%rbp)
	movl	16(%rbp), %eax
	cmpl	%eax, 65740(%rbp)
	jge	.L138
	movl	65732(%rbp), %eax
	movl	%eax, 16(%rbp)
	addl	$1, 65980(%rbp)
.L138:
	movl	20(%rbp), %eax
	cmpl	%eax, 65736(%rbp)
	jle	.L139
	movl	65728(%rbp), %eax
	movl	%eax, 20(%rbp)
	cvtsi2sd	65792(%rbp), %xmm0
	call	sqrt
	cvttsd2si	%xmm0, %eax
	subl	%eax, 65980(%rbp)
.L139:
	movl	16(%rbp), %eax
	cmpl	%eax, 65732(%rbp)
	jle	.L140
	movl	65740(%rbp), %eax
	movl	%eax, 16(%rbp)
	subl	$1, 65980(%rbp)
.L140:
	movl	20(%rbp), %eax
	cmpl	%eax, 65728(%rbp)
	jge	.L141
	movl	65736(%rbp), %eax
	movl	%eax, 20(%rbp)
	cvtsi2sd	65792(%rbp), %xmm0
	call	sqrt
	cvttsd2si	%xmm0, %eax
	addl	%eax, 65980(%rbp)
.L141:
	cmpl	$0, 65724(%rbp)
	je	.L143
	movl	65792(%rbp), %eax
	addl	%eax, 65980(%rbp)
	movl	65980(%rbp), %eax
	cltd
	idivl	65792(%rbp)
	movl	%edx, 65980(%rbp)
	jmp	.L143
.L134:
	movb	$0, 33(%rbp)
	movb	$0, 36(%rbp)
.L143:
	movl	glob_vk_space(%rip), %edx
	movl	glob_vk_enter(%rip), %eax
	orl	%edx, %eax
	testl	%eax, %eax
	je	.L144
	movl	$0, 65972(%rbp)
.L144:
	movl	16(%rbp), %eax
	movl	%eax, 24(%rbp)
	movl	20(%rbp), %eax
	movl	%eax, 28(%rbp)
	movl	$0, %edx
	movq	65864(%rbp), %rax
	movq	%rax, %rcx
	call	draw_clear
	movl	$16777215, %edx
	movq	65864(%rbp), %rax
	movq	%rax, %rcx
	call	draw_set_color
	movl	$33023, %edx
	movl	65924(%rbp), %ecx
	movq	65864(%rbp), %rax
	movl	%edx, 40(%rsp)
	movl	65928(%rbp), %edx
	movl	%edx, 32(%rsp)
	movl	%ecx, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	$8388863, %r8d
	movl	65932(%rbp), %eax
	subl	65924(%rbp), %eax
	movl	%eax, %ecx
	movl	65924(%rbp), %edx
	movq	65864(%rbp), %rax
	movl	%r8d, 40(%rsp)
	movl	65928(%rbp), %r8d
	movl	%r8d, 32(%rsp)
	movl	%ecx, %r9d
	movl	$0, %r8d
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	$33023, %edx
	movl	65932(%rbp), %eax
	subl	65924(%rbp), %eax
	movl	65932(%rbp), %r8d
	movq	65864(%rbp), %rcx
	movl	%edx, 40(%rsp)
	movl	65928(%rbp), %edx
	movl	%edx, 32(%rsp)
	movl	%r8d, %r9d
	movl	$0, %r8d
	movl	%eax, %edx
	call	draw_rectangle_color
	movl	$0, 65720(%rbp)
	movl	$0, 65716(%rbp)
	cmpl	$0, 65972(%rbp)
	jne	.L145
	movl	65888(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %ecx
	movl	65892(%rbp), %eax
	leal	0(,%rax,8), %r9d
	movl	65716(%rbp), %r10d
	movl	65720(%rbp), %edx
	movq	65864(%rbp), %rax
	movl	65800(%rbp), %r8d
	movl	%r8d, 64(%rsp)
	movl	65804(%rbp), %r8d
	movl	%r8d, 56(%rsp)
	leaq	.LC30(%rip), %r8
	movq	%r8, 48(%rsp)
	movq	65808(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	draw_text
.L145:
	movl	65908(%rbp), %eax
	movl	%eax, 65720(%rbp)
	movl	$0, 65716(%rbp)
	cmpl	$0, 65972(%rbp)
	jne	.L146
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	.LC31(%rip), %rax
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
	movq	65688(%rbp), %rax
	movq	65704(%rbp), %rdx
	movq	%rax, %rcx
	call	strcpy
	movl	65980(%rbp), %eax
	movb	%al, 65687(%rbp)
	movzbl	65687(%rbp), %eax
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
	leal	48(%rdx), %esi
	movq	65688(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC32(%rip), %rcx
	call	string_pos
	movl	%esi, %ecx
	movq	65688(%rbp), %rdx
	cltq
	movb	%cl, (%rdx,%rax)
	movzbl	65687(%rbp), %eax
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
	leal	48(%rdx), %esi
	movq	65688(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC33(%rip), %rcx
	call	string_pos
	movl	%esi, %ecx
	movq	65688(%rbp), %rdx
	cltq
	movb	%cl, (%rdx,%rax)
	movzbl	65687(%rbp), %ecx
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
	leal	48(%rdx), %esi
	movq	65688(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC34(%rip), %rcx
	call	string_pos
	movl	%esi, %ecx
	movq	65688(%rbp), %rdx
	cltq
	movb	%cl, (%rdx,%rax)
	movq	65688(%rbp), %r8
	movl	65888(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %ecx
	movl	65892(%rbp), %eax
	leal	0(,%rax,8), %r11d
	movl	65716(%rbp), %r10d
	movl	65720(%rbp), %edx
	movq	65864(%rbp), %rax
	movl	65800(%rbp), %r9d
	movl	%r9d, 64(%rsp)
	movl	65804(%rbp), %r9d
	movl	%r9d, 56(%rsp)
	movq	%r8, 48(%rsp)
	movq	65808(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	%r11d, %r9d
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	draw_text
	movq	%rdi, %rsp
.L146:
	movl	$0, 65964(%rbp)
	jmp	.L147
.L150:
	movl	$0, 65960(%rbp)
	jmp	.L148
.L149:
	movl	65964(%rbp), %eax
	imull	65900(%rbp), %eax
	movl	65960(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65680(%rbp)
	movl	65960(%rbp), %eax
	imull	65892(%rbp), %eax
	imull	65896(%rbp), %eax
	movl	65924(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65676(%rbp)
	movl	65964(%rbp), %eax
	imull	65888(%rbp), %eax
	imull	65896(%rbp), %eax
	movl	65920(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65672(%rbp)
	movl	65960(%rbp), %eax
	addl	$1, %eax
	imull	65892(%rbp), %eax
	imull	65896(%rbp), %eax
	movl	65924(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65668(%rbp)
	movl	65964(%rbp), %eax
	addl	$1, %eax
	imull	65888(%rbp), %eax
	imull	65896(%rbp), %eax
	movl	65920(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65664(%rbp)
	movl	$16711680, %r9d
	movl	$65280, %r8d
	movl	$255, %r10d
	movl	65680(%rbp), %ecx
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
	movl	%eax, 65660(%rbp)
	movl	65668(%rbp), %r9d
	movl	65672(%rbp), %r8d
	movl	65676(%rbp), %edx
	movq	65864(%rbp), %rax
	movl	65660(%rbp), %ecx
	movl	%ecx, 40(%rsp)
	movl	65664(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	65796(%rbp), %eax
	imull	65980(%rbp), %eax
	movl	65680(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65656(%rbp)
	movl	65656(%rbp), %eax
	cltq
	movzbl	48(%rbp,%rax), %eax
	movzbl	%al, %eax
	andl	$3, %eax
	movl	%eax, 65652(%rbp)
	movq	65832(%rbp), %r9
	movq	65840(%rbp), %r8
	movq	65848(%rbp), %rdx
	movl	65652(%rbp), %eax
	movq	65824(%rbp), %rcx
	movq	%rcx, 32(%rsp)
	movl	%eax, %ecx
	call	mux_int
	cltq
	movq	%rax, %rcx
	movl	65668(%rbp), %r9d
	movl	65672(%rbp), %r8d
	movl	65676(%rbp), %edx
	movq	65864(%rbp), %rax
	movq	%rcx, 40(%rsp)
	movl	65664(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_image
	addl	$1, 65960(%rbp)
.L148:
	movl	65960(%rbp), %eax
	cmpl	65900(%rbp), %eax
	jl	.L149
	addl	$1, 65964(%rbp)
.L147:
	movl	65964(%rbp), %eax
	cmpl	65900(%rbp), %eax
	jl	.L150
	movl	65896(%rbp), %eax
	movl	%eax, 65648(%rbp)
	movzbl	32(%rbp), %eax
	movzbl	%al, %eax
	imull	65648(%rbp), %eax
	movl	%eax, %edx
	movzbl	37(%rbp), %eax
	movzbl	%al, %eax
	imull	%eax, %edx
	movzbl	36(%rbp), %eax
	movzbl	%al, %eax
	imull	65648(%rbp), %eax
	leal	(%rdx,%rax), %r8d
	movl	20(%rbp), %edx
	movl	65648(%rbp), %eax
	imull	65888(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	movl	16(%rbp), %edx
	movl	65648(%rbp), %eax
	imull	65892(%rbp), %eax
	leal	(%rdx,%rax), %r11d
	movl	20(%rbp), %r10d
	movl	16(%rbp), %edx
	movq	65864(%rbp), %rax
	movl	65648(%rbp), %r9d
	movl	%r9d, 72(%rsp)
	movl	65648(%rbp), %r9d
	movl	%r9d, 64(%rsp)
	movl	$0, 56(%rsp)
	movl	%r8d, 48(%rsp)
	movq	65816(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	%r11d, %r9d
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	draw_image_part
	cmpl	$0, 65972(%rbp)
	je	.L151
	movl	65908(%rbp), %r9d
	movl	65920(%rbp), %r8d
	movl	65924(%rbp), %edx
	movq	65864(%rbp), %rax
	movq	65760(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	65904(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_image
	movl	65888(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %ecx
	movl	65892(%rbp), %eax
	leal	0(,%rax,8), %r9d
	movl	65920(%rbp), %r10d
	movl	65924(%rbp), %edx
	movq	65864(%rbp), %rax
	movl	65800(%rbp), %r8d
	movl	%r8d, 64(%rsp)
	movl	65804(%rbp), %r8d
	movl	%r8d, 56(%rsp)
	movq	65752(%rbp), %r8
	movq	%r8, 48(%rsp)
	movq	65808(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	draw_text
.L151:
	movq	65864(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_RenderPresent
	movl	$16, %ecx
	call	SDL_Delay
.L105:
	cmpl	$0, 65968(%rbp)
	jne	.L106
	leaq	.LC35(%rip), %rcx
	call	puts
	movq	65848(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
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
	movq	65760(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	65808(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	call	IMG_Quit
	movl	65772(%rbp), %eax
	movl	%eax, %ecx
	call	SDL_CloseAudioDevice
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_FreeWAV
	movq	65864(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyRenderer
	movq	65872(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyWindow
	call	SDL_Quit
	movl	$500, %ecx
	call	SDL_Delay
	movl	$0, %eax
	jmp	.L95
.L97:
	call	SDL_GetError
	movq	%rax, %rsi
	movq	65936(%rbp), %rbx
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC36(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	call	SDL_Quit
	movl	$1, %ecx
	call	exit
.L95:
	movq	%rbx, %rsp
	jmp	.L93
.L103:
	movq	%rbx, %rsp
.L93:
	leaq	65992(%rbp), %rsp
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
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	fgetc;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	SDL_memcpy;	.scl	2;	.type	32;	.endef
	.def	SDL_Init;	.scl	2;	.type	32;	.endef
	.def	SDL_CreateWindow;	.scl	2;	.type	32;	.endef
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
	.def	SDL_DestroyTexture;	.scl	2;	.type	32;	.endef
	.def	IMG_Quit;	.scl	2;	.type	32;	.endef
	.def	SDL_CloseAudioDevice;	.scl	2;	.type	32;	.endef
	.def	SDL_DestroyRenderer;	.scl	2;	.type	32;	.endef
	.def	SDL_DestroyWindow;	.scl	2;	.type	32;	.endef
