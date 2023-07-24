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
	.globl	glob_vk_0
	.align 4
glob_vk_0:
	.space 4
	.globl	glob_vk_1
	.align 4
glob_vk_1:
	.space 4
	.globl	glob_vk_2
	.align 4
glob_vk_2:
	.space 4
	.globl	glob_vk_3
	.align 4
glob_vk_3:
	.space 4
	.globl	glob_vk_4
	.align 4
glob_vk_4:
	.space 4
	.globl	glob_vk_5
	.align 4
glob_vk_5:
	.space 4
	.globl	glob_vk_6
	.align 4
glob_vk_6:
	.space 4
	.globl	glob_vk_7
	.align 4
glob_vk_7:
	.space 4
	.globl	glob_vk_8
	.align 4
glob_vk_8:
	.space 4
	.globl	glob_vk_9
	.align 4
glob_vk_9:
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
	.align 8
.LC4:
	.ascii "may take a while; please wait.\0"
.LC5:
	.ascii "rb\0"
.LC6:
	.ascii "tiled/cosc345-game.tmx\0"
.LC7:
	.ascii "wb\0"
.LC8:
	.ascii "level.dat\0"
.LC10:
	.ascii "i=%i/%i (v=%i)\12\0"
	.text
	.globl	dev_tiled_to_leveldata
	.def	dev_tiled_to_leveldata;	.scl	2;	.type	32;	.endef
	.seh_proc	dev_tiled_to_leveldata
dev_tiled_to_leveldata:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	movl	$131208, %eax
	call	___chkstk_ms
	subq	%rax, %rsp
	.seh_stackalloc	131208
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	leaq	.LC4(%rip), %rcx
	call	puts
	movl	$0, glob_vk_f2(%rip)
	leaq	.LC5(%rip), %rdx
	leaq	.LC6(%rip), %rcx
	call	fopen
	movq	%rax, 131040(%rbp)
	leaq	.LC7(%rip), %rdx
	leaq	.LC8(%rip), %rcx
	call	fopen
	movq	%rax, 131032(%rbp)
	movl	$2, 131028(%rbp)
	movl	$65536, 131024(%rbp)
	movl	131028(%rbp), %eax
	sall	$16, %eax
	movl	%eax, 131020(%rbp)
	movl	$0, 131068(%rbp)
	jmp	.L87
.L88:
	movl	131068(%rbp), %eax
	cltq
	movb	$0, -80(%rbp,%rax)
	addl	$1, 131068(%rbp)
.L87:
	movl	131068(%rbp), %eax
	cmpl	131020(%rbp), %eax
	jl	.L88
	movq	131040(%rbp), %rax
	movl	$0, %r8d
	movl	$503, %edx
	movq	%rax, %rcx
	call	fseek
	movl	$44, %eax
	movb	%al, 131019(%rbp)
	movl	$0, 131064(%rbp)
	movl	$0, 131012(%rbp)
	movl	$0, 131008(%rbp)
	movl	$0, 131004(%rbp)
	movl	$0, 131056(%rbp)
	jmp	.L89
.L97:
	movq	131040(%rbp), %rax
	movq	%rax, %rcx
	call	fgetc
	movl	%eax, 131064(%rbp)
	movl	$0, 131052(%rbp)
	jmp	.L90
.L91:
	movl	131052(%rbp), %eax
	cltq
	movb	$48, -83(%rbp,%rax)
	addl	$1, 131052(%rbp)
.L90:
	cmpl	$2, 131052(%rbp)
	jle	.L91
	jmp	.L92
.L93:
	movq	131040(%rbp), %rax
	movq	%rax, %rcx
	call	fgetc
	movl	%eax, 131064(%rbp)
.L92:
	cmpl	$13, 131064(%rbp)
	je	.L93
	cmpl	$10, 131064(%rbp)
	je	.L93
	movzbl	131019(%rbp), %eax
	cmpl	%eax, 131064(%rbp)
	je	.L94
	movzbl	-81(%rbp), %eax
	movb	%al, -82(%rbp)
	movl	131064(%rbp), %eax
	movb	%al, -81(%rbp)
	movq	131040(%rbp), %rax
	movq	%rax, %rcx
	call	fgetc
	movl	%eax, 131064(%rbp)
	movzbl	131019(%rbp), %eax
	cmpl	%eax, 131064(%rbp)
	je	.L94
	movzbl	-82(%rbp), %eax
	movb	%al, -83(%rbp)
	movzbl	-81(%rbp), %eax
	movb	%al, -82(%rbp)
	movl	131064(%rbp), %eax
	movb	%al, -81(%rbp)
.L94:
	movb	$0, 131063(%rbp)
	movl	$0, 131048(%rbp)
	jmp	.L95
.L96:
	movl	131048(%rbp), %eax
	cltq
	movzbl	-83(%rbp,%rax), %eax
	movzbl	%al, %eax
	leal	-48(%rax), %ebx
	movl	$2, %eax
	subl	131048(%rbp), %eax
	cvtsi2sd	%eax, %xmm0
	movq	.LC9(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow
	cvttsd2si	%xmm0, %eax
	movzbl	%al, %eax
	imull	%ebx, %eax
	addb	%al, 131063(%rbp)
	addl	$1, 131048(%rbp)
.L95:
	cmpl	$2, 131048(%rbp)
	jle	.L96
	movzbl	131063(%rbp), %edx
	movl	131024(%rbp), %ecx
	movl	131056(%rbp), %eax
	movl	%edx, %r9d
	movl	%ecx, %r8d
	movl	%eax, %edx
	leaq	.LC10(%rip), %rcx
	call	printf
	subb	$1, 131063(%rbp)
	movl	131056(%rbp), %eax
	sarl	$12, %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	131056(%rbp), %eax
	sarl	$4, %eax
	andl	$15, %eax
	addl	%edx, %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	131056(%rbp), %eax
	sarl	$8, %eax
	andl	$15, %eax
	addl	%edx, %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	131056(%rbp), %eax
	andl	$15, %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movzbl	131063(%rbp), %eax
	movb	%al, -80(%rbp,%rdx)
	addl	$1, 131056(%rbp)
.L89:
	movl	131056(%rbp), %eax
	cmpl	131024(%rbp), %eax
	jl	.L97
	movb	$0, 131063(%rbp)
	movl	$0, 131012(%rbp)
	movl	$0, 131000(%rbp)
	movl	131000(%rbp), %eax
	cmpl	131024(%rbp), %eax
	movl	131020(%rbp), %eax
	movslq	%eax, %rdx
	movq	131032(%rbp), %rcx
	leaq	-80(%rbp), %rax
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
	addq	$131208, %rsp
	popq	%rbx
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
.LC11:
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
	leaq	.LC5(%rip), %rdx
	leaq	.LC11(%rip), %rcx
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
	jmp	.L101
.L102:
	movq	-16(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rdx, %r8
	movl	$16, %edx
	movq	%rax, %rcx
	call	fgets
	subl	$1, -4(%rbp)
.L101:
	cmpl	$0, -4(%rbp)
	jg	.L102
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
	.globl	waterOn
	.bss
	.align 4
waterOn:
	.space 4
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
	movss	.LC12(%rip), %xmm0
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
	.globl	activateAllWaterParticles
	.def	activateAllWaterParticles;	.scl	2;	.type	32;	.endef
	.seh_proc	activateAllWaterParticles
activateAllWaterParticles:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movl	$0, -4(%rbp)
	jmp	.L106
.L107:
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	$1, 12(%rax)
	addl	$1, -4(%rbp)
.L106:
	movl	$100, %eax
	cmpl	%eax, -4(%rbp)
	jl	.L107
	nop
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	deactivateAllWaterParticles
	.def	deactivateAllWaterParticles;	.scl	2;	.type	32;	.endef
	.seh_proc	deactivateAllWaterParticles
deactivateAllWaterParticles:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movl	$0, -4(%rbp)
	jmp	.L109
.L110:
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	$0, 12(%rax)
	addl	$1, -4(%rbp)
.L109:
	movl	$100, %eax
	cmpl	%eax, -4(%rbp)
	jl	.L110
	nop
	addq	$16, %rsp
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
	movl	24(%rbp), %ecx
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
	imull	$60, %edx, %ecx
	movl	32(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$-2004318071, %rdx, %rdx
	shrq	$32, %rdx
	addl	%eax, %edx
	sarl	$5, %edx
	movl	%edx, %r8d
	cltd
	subl	%edx, %r8d
	movl	%r8d, %edx
	imull	$60, %edx, %edx
	subl	%edx, %eax
	movl	%eax, %edx
	leal	(%rcx,%rdx), %eax
	movl	%eax, -4(%rbp)
	movl	40(%rbp), %ecx
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
	imull	$60, %edx, %ecx
	movl	48(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$-2004318071, %rdx, %rdx
	shrq	$32, %rdx
	addl	%eax, %edx
	sarl	$5, %edx
	movl	%edx, %r8d
	cltd
	subl	%edx, %r8d
	movl	%r8d, %edx
	imull	$60, %edx, %edx
	subl	%edx, %eax
	movl	%eax, %edx
	leal	(%rcx,%rdx), %eax
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
	.globl	temp_ctof
	.def	temp_ctof;	.scl	2;	.type	32;	.endef
	.seh_proc	temp_ctof
temp_ctof:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	cvtsi2sd	16(%rbp), %xmm1
	movsd	.LC13(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movsd	.LC14(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC15:
	.ascii "Failed to allocate memory for water particles\12\0"
.LC16:
	.ascii "SDL init error:%s\12\0"
.LC17:
	.ascii "COSC345 - Game\0"
.LC18:
	.ascii "Window error\0"
.LC19:
	.ascii "Render error\0"
.LC20:
	.ascii "Surface error\0"
	.align 8
.LC21:
	.ascii "SDL_ttf could not initialize! TTF_Error: %s\12\0"
.LC22:
	.ascii "font.ttf\0"
	.align 8
.LC23:
	.ascii "Failed to load font! SDL_ttf Error: %s\12\0"
	.align 8
.LC24:
	.ascii "Renderer could not be created! SDL_Error: %s\12\0"
.LC25:
	.ascii "img/spr_grass.png\0"
.LC26:
	.ascii "img/spr_sand.png\0"
.LC27:
	.ascii "img/spr_water.png\0"
.LC28:
	.ascii "img/spr_lava.png\0"
.LC29:
	.ascii "tiled/tileset.png\0"
.LC30:
	.ascii "img/player_strip8.png\0"
.LC31:
	.ascii "img/ascii_strip96.png\0"
.LC32:
	.ascii "img/clock1_strip10.png\0"
.LC33:
	.ascii "Night\0"
.LC34:
	.ascii "Morning\0"
.LC35:
	.ascii "Day\0"
.LC36:
	.ascii "Evening\0"
.LC37:
	.ascii "img/dunedin-map.png\0"
.LC38:
	.ascii "img/spr_map_unknown.png\0"
.LC39:
	.ascii "img/spr_thermometer.png\0"
.LC40:
	.ascii "music.wav\0"
.LC41:
	.ascii "Failed to load WAV file: %s\12\0"
	.align 8
.LC42:
	.ascii "Failed to open audio device: %s\12\0"
.LC43:
	.ascii "img/img_lands.png\0"
.LC44:
	.ascii "Press SPACE to continue.\0"
.LC45:
	.ascii "Entering main loop...\0"
.LC46:
	.ascii "F2 started!\0"
.LC47:
	.ascii "F2 finished!\0"
	.align 8
.LC48:
	.ascii "you pressed 1, good job. Lets test the limit\0"
	.align 8
.LC49:
	.ascii "you pressed 2, good job. Lets test the limit woo\0"
.LC50:
	.ascii "you pressed 3\0"
	.align 8
.LC51:
	.ascii "you pressed 4, good job. Lets test the limit woo\0"
.LC52:
	.ascii "Location:#DUNEDIN#NEW ZEALAND\0"
.LC53:
	.ascii "LVL: XYZ/255\0"
.LC54:
	.ascii "X\0"
.LC55:
	.ascii "Y\0"
.LC56:
	.ascii "Z\0"
.LC58:
	.ascii ":\0"
.LC62:
	.ascii "Error: Text Rendering Failed\0"
.LC65:
	.ascii "Score: %d\0"
.LC66:
	.ascii "...exited main loop.\0"
.LC67:
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
	movl	$66808, %eax
	call	___chkstk_ms
	subq	%rax, %rsp
	.seh_stackalloc	66808
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movl	%ecx, 66752(%rbp)
	movq	%rdx, 66760(%rbp)
	movq	%rsp, %rax
	movq	%rax, %r12
	movq	$256, 66584(%rbp)
	movq	66584(%rbp), %rax
	subq	$1, %rax
	movq	%rax, 66576(%rbp)
	movq	66584(%rbp), %rax
	movq	%rax, %r10
	movl	$0, %r11d
	movq	66584(%rbp), %rax
	movq	%rax, %r8
	movl	$0, %r9d
	movq	66584(%rbp), %rax
	addq	$15, %rax
	shrq	$4, %rax
	salq	$4, %rax
	call	___chkstk_ms
	subq	%rax, %rsp
	leaq	80(%rsp), %rax
	addq	$0, %rax
	movq	%rax, 66568(%rbp)
	movl	$1366, 66564(%rbp)
	movl	$768, 66560(%rbp)
	movl	66564(%rbp), %eax
	subl	66560(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, 66556(%rbp)
	movl	$0, 66552(%rbp)
	movl	66560(%rbp), %eax
	movl	%eax, 66548(%rbp)
	movl	66560(%rbp), %eax
	movl	%eax, 66544(%rbp)
	movl	66556(%rbp), %edx
	movl	66548(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 66540(%rbp)
	movl	66552(%rbp), %edx
	movl	66544(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 66536(%rbp)
	movl	$16, 66532(%rbp)
	movl	$16, 66528(%rbp)
	movl	66532(%rbp), %eax
	movl	%eax, %ecx
	call	sqr
	movl	%eax, %edi
	movl	66560(%rbp), %eax
	cltd
	idivl	%edi
	movl	%eax, 66524(%rbp)
	movl	66524(%rbp), %eax
	movl	%eax, 66520(%rbp)
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
	jne	.L124
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %r9
	movl	$46, %r8d
	movl	$1, %edx
	leaq	.LC15(%rip), %rcx
	call	fwrite
	movl	$1, %eax
	jmp	.L125
.L124:
	movl	$0, %ecx
	call	time
	movl	%eax, %ecx
	call	srand
	movl	$0, 66660(%rbp)
	jmp	.L126
.L127:
	movl	66560(%rbp), %ecx
	movl	66564(%rbp), %edx
	movl	66660(%rbp), %eax
	movl	%ecx, %r8d
	movl	%eax, %ecx
	call	createWaterParticle
	addl	$1, 66660(%rbp)
.L126:
	movl	$100, %eax
	cmpl	%eax, 66660(%rbp)
	jl	.L127
	movl	$62001, 66516(%rbp)
	movl	66516(%rbp), %eax
	movl	%eax, %ecx
	call	SDL_Init
	testl	%eax, %eax
	je	.L128
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC16(%rip), %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L125
.L128:
	movl	66564(%rbp), %edx
	movl	$0, 40(%rsp)
	movl	66560(%rbp), %eax
	movl	%eax, 32(%rsp)
	movl	%edx, %r9d
	movl	$536805376, %r8d
	movl	$536805376, %edx
	leaq	.LC17(%rip), %rcx
	call	SDL_CreateWindow
	movq	%rax, 66504(%rbp)
	cmpq	$0, 66504(%rbp)
	jne	.L129
	movq	66568(%rbp), %rax
	movq	66584(%rbp), %rdx
	leaq	.LC18(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L130
.L129:
	movq	66504(%rbp), %rax
	movl	$4, %r8d
	movl	$-1, %edx
	movq	%rax, %rcx
	call	SDL_CreateRenderer
	movq	%rax, 66496(%rbp)
	cmpq	$0, 66496(%rbp)
	jne	.L131
	movq	66568(%rbp), %rax
	movq	66584(%rbp), %rdx
	leaq	.LC19(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L130
.L131:
	movq	66504(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_GetWindowSurface
	movq	%rax, 66488(%rbp)
	cmpq	$0, 66488(%rbp)
	jne	.L132
	movq	66568(%rbp), %rax
	movq	66584(%rbp), %rdx
	leaq	.LC20(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L130
.L132:
	movl	$800, 65888(%rbp)
	movl	$100, 65892(%rbp)
	movl	$200, 65896(%rbp)
	movl	$100, 65900(%rbp)
	movabsq	$2338613357913204068, %rax
	movq	%rax, 65776(%rbp)
	movabsq	$28542640894207341, %rax
	movq	%rax, 65784(%rbp)
	leaq	65792(%rbp), %rdx
	movl	$0, %eax
	movl	$10, %ecx
	movq	%rdx, %rdi
	rep stosq
	movq	%rdi, %rdx
	movl	%eax, (%rdx)
	addq	$4, %rdx
	leaq	65776(%rbp), %rax
	movq	%rax, 66480(%rbp)
	leaq	65888(%rbp), %rax
	movq	%rax, 66472(%rbp)
	movl	$0, 66664(%rbp)
	call	TTF_Init
	cmpl	$-1, %eax
	jne	.L133
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC21(%rip), %rcx
	call	printf
	movl	$1, %eax
	jmp	.L125
.L133:
	movl	$12, %edx
	leaq	.LC22(%rip), %rcx
	call	TTF_OpenFont
	movq	%rax, 66464(%rbp)
	cmpq	$0, 66464(%rbp)
	jne	.L134
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC23(%rip), %rcx
	call	printf
	movl	$1, %eax
	jmp	.L125
.L134:
	movl	$0, 66460(%rbp)
	movl	$0, 66668(%rbp)
	movb	$0, 65772(%rbp)
	movb	$0, 65773(%rbp)
	movb	$0, 65774(%rbp)
	movb	$-1, 65775(%rbp)
	movq	66504(%rbp), %rax
	movl	$2, %r8d
	movl	$-1, %edx
	movq	%rax, %rcx
	call	SDL_CreateRenderer
	movq	%rax, 66448(%rbp)
	cmpq	$0, 66496(%rbp)
	jne	.L135
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC24(%rip), %rcx
	call	printf
.L135:
	movl	$2, %ecx
	call	IMG_Init
	movq	66496(%rbp), %rax
	leaq	.LC25(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66440(%rbp)
	movq	66496(%rbp), %rax
	leaq	.LC26(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66432(%rbp)
	movq	66496(%rbp), %rax
	leaq	.LC27(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66424(%rbp)
	movq	66496(%rbp), %rax
	leaq	.LC28(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66416(%rbp)
	movq	66496(%rbp), %rax
	leaq	.LC29(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66408(%rbp)
	movq	66496(%rbp), %rax
	leaq	.LC30(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66400(%rbp)
	movq	66496(%rbp), %rax
	leaq	.LC31(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66392(%rbp)
	movl	$8, 66388(%rbp)
	movl	$24, 66384(%rbp)
	movq	66496(%rbp), %rax
	leaq	.LC32(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66376(%rbp)
	movl	$1440, 66372(%rbp)
	movl	$0, 66656(%rbp)
	movl	$0, 66652(%rbp)
	movl	$57, 66368(%rbp)
	movl	$60, 66364(%rbp)
	leaq	.LC33(%rip), %rax
	movq	%rax, 66352(%rbp)
	leaq	.LC34(%rip), %rax
	movq	%rax, 66344(%rbp)
	leaq	.LC35(%rip), %rax
	movq	%rax, 66336(%rbp)
	leaq	.LC36(%rip), %rax
	movq	%rax, 66328(%rbp)
	movl	66532(%rbp), %eax
	movl	%eax, %ecx
	call	sqr
	movl	%eax, 66324(%rbp)
	movl	$256, 66320(%rbp)
	movl	$0, 66648(%rbp)
	leaq	.LC5(%rip), %rdx
	leaq	.LC8(%rip), %rcx
	call	fopen
	movq	%rax, 66312(%rbp)
	movl	$0, 66644(%rbp)
	jmp	.L136
.L137:
	movl	66644(%rbp), %eax
	cltq
	movb	$0, 224(%rbp,%rax)
	addl	$1, 66644(%rbp)
.L136:
	movl	66324(%rbp), %eax
	imull	66320(%rbp), %eax
	cmpl	%eax, 66644(%rbp)
	jl	.L137
	movq	66312(%rbp), %rdx
	leaq	224(%rbp), %rax
	movq	%rdx, %r9
	movl	$1, %r8d
	movl	$65536, %edx
	movq	%rax, %rcx
	call	fread
	movq	66312(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movq	66496(%rbp), %rax
	leaq	.LC37(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66304(%rbp)
	movq	66496(%rbp), %rax
	leaq	.LC38(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66296(%rbp)
	leaq	208(%rbp), %rax
	movl	66648(%rbp), %ecx
	movq	%rax, %rdx
	call	level_get_name
	movl	66648(%rbp), %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$27, %eax
	addl	%eax, %edx
	andl	$31, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	$1, %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %ecx
	movl	66648(%rbp), %eax
	leal	31(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$5, %eax
	movl	%ecx, %edx
	cltq
	movl	%edx, 176(%rbp,%rax,4)
	movl	$0, 66292(%rbp)
	movl	$10, 66288(%rbp)
	movl	$42, %eax
	movb	%al, 174(%rbp)
	movq	66496(%rbp), %rax
	leaq	.LC39(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66280(%rbp)
	movb	$-128, 66279(%rbp)
	movl	66524(%rbp), %eax
	imull	66528(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	66556(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 144(%rbp)
	movl	66520(%rbp), %eax
	imull	66528(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	66552(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 148(%rbp)
	movb	$0, 160(%rbp)
	movb	$0, 161(%rbp)
	movb	$1, 162(%rbp)
	movb	$12, 163(%rbp)
	movb	$0, 164(%rbp)
	movb	$2, 165(%rbp)
	movb	$12, 166(%rbp)
	leaq	.LC40(%rip), %rax
	movq	%rax, 66264(%rbp)
	movq	66264(%rbp), %rax
	leaq	.LC5(%rip), %rdx
	movq	%rax, %rcx
	call	SDL_RWFromFile
	movq	%rax, %r10
	leaq	104(%rbp), %rcx
	leaq	112(%rbp), %rdx
	leaq	100(%rbp), %rax
	movq	%rax, 32(%rsp)
	movq	%rcx, %r9
	movq	%rdx, %r8
	movl	$1, %edx
	movq	%r10, %rcx
	call	SDL_LoadWAV_RW
	testq	%rax, %rax
	jne	.L138
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC41(%rip), %rcx
	call	printf
	jmp	.L139
.L138:
	movq	104(%rbp), %rax
	movq	%rax, 80(%rbp)
	movl	100(%rbp), %eax
	movl	%eax, 88(%rbp)
	movl	$0, 92(%rbp)
	leaq	audioCallback(%rip), %rax
	movq	%rax, 128(%rbp)
	leaq	80(%rbp), %rax
	movq	%rax, 136(%rbp)
	leaq	112(%rbp), %rax
	movl	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$0, %ecx
	call	SDL_OpenAudioDevice
	movl	%eax, 66260(%rbp)
	cmpl	$0, 66260(%rbp)
	jne	.L140
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC42(%rip), %rcx
	call	printf
	movq	104(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_FreeWAV
	jmp	.L139
.L140:
	movl	100(%rbp), %ecx
	movq	104(%rbp), %rdx
	movl	66260(%rbp), %eax
	movl	%ecx, %r8d
	movl	%eax, %ecx
	call	SDL_QueueAudio
	movl	66260(%rbp), %eax
	movl	$0, %edx
	movl	%eax, %ecx
	call	SDL_PauseAudioDevice
	movl	$1, 66640(%rbp)
	movq	66496(%rbp), %rax
	leaq	.LC43(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66248(%rbp)
	leaq	.LC44(%rip), %rax
	movq	%rax, 66240(%rbp)
	movl	$1, 66636(%rbp)
	leaq	.LC45(%rip), %rcx
	call	puts
	jmp	.L141
.L188:
	movl	65904(%rbp), %eax
	cmpl	$768, %eax
	je	.L143
	cmpl	$769, %eax
	je	.L144
	cmpl	$256, %eax
	jne	.L142
	movl	$0, 66636(%rbp)
	jmp	.L142
.L143:
	movl	$1, 66236(%rbp)
	movl	65924(%rbp), %eax
	cmpl	$54, %eax
	je	.L145
	cmpl	$54, %eax
	jg	.L146
	cmpl	$49, %eax
	je	.L147
	cmpl	$49, %eax
	jg	.L148
	cmpl	$32, %eax
	je	.L149
	cmpl	$48, %eax
	je	.L150
	cmpl	$27, %eax
	je	.L151
	jmp	.L142
.L148:
	cmpl	$51, %eax
	je	.L153
	cmpl	$51, %eax
	jl	.L154
	cmpl	$52, %eax
	je	.L155
	cmpl	$53, %eax
	je	.L156
	jmp	.L142
.L146:
	cmpl	$1073741903, %eax
	je	.L157
	cmpl	$1073741903, %eax
	jg	.L158
	cmpl	$56, %eax
	je	.L159
	cmpl	$56, %eax
	jl	.L160
	cmpl	$57, %eax
	je	.L161
	cmpl	$1073741883, %eax
	je	.L162
	jmp	.L142
.L158:
	cmpl	$1073741905, %eax
	je	.L163
	cmpl	$1073741905, %eax
	jl	.L164
	cmpl	$1073741906, %eax
	je	.L165
	cmpl	$1073741912, %eax
	je	.L166
	jmp	.L142
.L151:
	movl	$0, 66636(%rbp)
	jmp	.L152
.L157:
	movl	66236(%rbp), %eax
	movl	%eax, glob_vk_right(%rip)
	jmp	.L152
.L164:
	movl	66236(%rbp), %eax
	movl	%eax, glob_vk_left(%rip)
	jmp	.L152
.L165:
	movl	66236(%rbp), %eax
	movl	%eax, glob_vk_up(%rip)
	jmp	.L152
.L163:
	movl	66236(%rbp), %eax
	movl	%eax, glob_vk_down(%rip)
	jmp	.L152
.L149:
	movl	66236(%rbp), %eax
	movl	%eax, glob_vk_space(%rip)
	jmp	.L152
.L166:
	movl	66236(%rbp), %eax
	movl	%eax, glob_vk_enter(%rip)
	jmp	.L152
.L162:
	movl	66236(%rbp), %eax
	movl	%eax, glob_vk_f2(%rip)
	jmp	.L152
.L150:
	movl	66236(%rbp), %eax
	movl	%eax, glob_vk_0(%rip)
	jmp	.L152
.L147:
	movl	66236(%rbp), %eax
	movl	%eax, glob_vk_1(%rip)
	jmp	.L152
.L154:
	movl	66236(%rbp), %eax
	movl	%eax, glob_vk_2(%rip)
	jmp	.L152
.L153:
	movl	66236(%rbp), %eax
	movl	%eax, glob_vk_3(%rip)
	jmp	.L152
.L155:
	movl	66236(%rbp), %eax
	movl	%eax, glob_vk_4(%rip)
	jmp	.L152
.L156:
	movl	66236(%rbp), %eax
	movl	%eax, glob_vk_5(%rip)
	jmp	.L152
.L145:
	movl	66236(%rbp), %eax
	movl	%eax, glob_vk_6(%rip)
	jmp	.L152
.L160:
	movl	66236(%rbp), %eax
	movl	%eax, glob_vk_7(%rip)
	jmp	.L152
.L159:
	movl	66236(%rbp), %eax
	movl	%eax, glob_vk_8(%rip)
	jmp	.L152
.L161:
	movl	66236(%rbp), %eax
	movl	%eax, glob_vk_9(%rip)
	nop
.L152:
	jmp	.L142
.L144:
	movl	$0, 66232(%rbp)
	movl	65924(%rbp), %eax
	cmpl	$55, %eax
	je	.L167
	cmpl	$55, %eax
	jg	.L168
	cmpl	$50, %eax
	je	.L169
	cmpl	$50, %eax
	jg	.L170
	cmpl	$48, %eax
	je	.L171
	cmpl	$48, %eax
	jg	.L172
	cmpl	$32, %eax
	je	.L173
	jmp	.L250
.L170:
	cmpl	$52, %eax
	je	.L175
	cmpl	$52, %eax
	jl	.L176
	cmpl	$53, %eax
	je	.L177
	cmpl	$54, %eax
	je	.L178
	jmp	.L250
.L168:
	cmpl	$1073741903, %eax
	je	.L179
	cmpl	$1073741903, %eax
	jg	.L180
	cmpl	$57, %eax
	je	.L181
	cmpl	$57, %eax
	jl	.L182
	cmpl	$1073741883, %eax
	je	.L183
	jmp	.L250
.L180:
	cmpl	$1073741905, %eax
	je	.L184
	cmpl	$1073741905, %eax
	jl	.L185
	cmpl	$1073741906, %eax
	je	.L186
	cmpl	$1073741912, %eax
	je	.L187
	jmp	.L250
.L179:
	movl	66232(%rbp), %eax
	movl	%eax, glob_vk_right(%rip)
	jmp	.L174
.L185:
	movl	66232(%rbp), %eax
	movl	%eax, glob_vk_left(%rip)
	jmp	.L174
.L186:
	movl	66232(%rbp), %eax
	movl	%eax, glob_vk_up(%rip)
	jmp	.L174
.L184:
	movl	66232(%rbp), %eax
	movl	%eax, glob_vk_down(%rip)
	jmp	.L174
.L173:
	movl	66232(%rbp), %eax
	movl	%eax, glob_vk_space(%rip)
	jmp	.L174
.L187:
	movl	66232(%rbp), %eax
	movl	%eax, glob_vk_enter(%rip)
	jmp	.L174
.L183:
	movl	66232(%rbp), %eax
	movl	%eax, glob_vk_f2(%rip)
	jmp	.L174
.L171:
	movl	66232(%rbp), %eax
	movl	%eax, glob_vk_0(%rip)
	jmp	.L174
.L172:
	movl	66232(%rbp), %eax
	movl	%eax, glob_vk_1(%rip)
	jmp	.L174
.L169:
	movl	66232(%rbp), %eax
	movl	%eax, glob_vk_2(%rip)
	jmp	.L174
.L176:
	movl	66232(%rbp), %eax
	movl	%eax, glob_vk_3(%rip)
	jmp	.L174
.L175:
	movl	66232(%rbp), %eax
	movl	%eax, glob_vk_4(%rip)
	jmp	.L174
.L177:
	movl	66232(%rbp), %eax
	movl	%eax, glob_vk_5(%rip)
	jmp	.L174
.L178:
	movl	66232(%rbp), %eax
	movl	%eax, glob_vk_6(%rip)
	jmp	.L174
.L167:
	movl	66232(%rbp), %eax
	movl	%eax, glob_vk_7(%rip)
	jmp	.L174
.L182:
	movl	66232(%rbp), %eax
	movl	%eax, glob_vk_8(%rip)
	jmp	.L174
.L181:
	movl	66232(%rbp), %eax
	movl	%eax, glob_vk_9(%rip)
	nop
.L174:
.L250:
	nop
.L142:
	leaq	65904(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_PollEvent
	testl	%eax, %eax
	jne	.L188
	movl	glob_vk_f2(%rip), %eax
	testl	%eax, %eax
	je	.L189
	leaq	.LC46(%rip), %rcx
	call	puts
	call	dev_tiled_to_leveldata
	leaq	.LC47(%rip), %rcx
	call	puts
.L189:
	movl	glob_vk_0(%rip), %eax
	testl	%eax, %eax
	je	.L190
	movl	$0, glob_vk_0(%rip)
	movl	waterOn(%rip), %eax
	testl	%eax, %eax
	jne	.L191
	movl	$1, waterOn(%rip)
	call	activateAllWaterParticles
	jmp	.L190
.L191:
	movl	$0, waterOn(%rip)
	call	deactivateAllWaterParticles
.L190:
	movl	glob_vk_9(%rip), %eax
	testl	%eax, %eax
	je	.L192
	movl	$0, glob_vk_9(%rip)
	cmpl	$0, 66664(%rbp)
	jne	.L193
	movl	$1, 66664(%rbp)
	leaq	65776(%rbp), %rax
	movabsq	$3184362091757007472, %rdi
	movq	%rdi, (%rax)
	movl	$741551154, 8(%rax)
	movw	$52, 12(%rax)
	jmp	.L192
.L193:
	movl	$0, 66664(%rbp)
.L192:
	movl	glob_vk_1(%rip), %eax
	testl	%eax, %eax
	je	.L194
	movl	$0, glob_vk_1(%rip)
	cmpl	$1, 66664(%rbp)
	jne	.L194
	leaq	.LC48(%rip), %rax
	movq	%rax, 66224(%rbp)
	movq	$99, 66216(%rbp)
	movq	66216(%rbp), %rcx
	movq	66224(%rbp), %rdx
	leaq	65776(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	strncpy
	leaq	65776(%rbp), %rax
	movq	66216(%rbp), %rdx
	addq	%rdx, %rax
	movb	$0, (%rax)
	addl	$50, 66668(%rbp)
.L194:
	movl	glob_vk_2(%rip), %eax
	testl	%eax, %eax
	je	.L195
	movl	$0, glob_vk_2(%rip)
	cmpl	$1, 66664(%rbp)
	jne	.L195
	leaq	.LC49(%rip), %rax
	movq	%rax, 66208(%rbp)
	movq	$99, 66200(%rbp)
	movq	66200(%rbp), %rcx
	movq	66208(%rbp), %rdx
	leaq	65776(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	strncpy
	leaq	65776(%rbp), %rax
	movq	66200(%rbp), %rdx
	addq	%rdx, %rax
	movb	$0, (%rax)
	addl	$50, 66668(%rbp)
.L195:
	movl	glob_vk_3(%rip), %eax
	testl	%eax, %eax
	je	.L196
	movl	$0, glob_vk_3(%rip)
	cmpl	$1, 66664(%rbp)
	jne	.L196
	leaq	.LC50(%rip), %rax
	movq	%rax, 66192(%rbp)
	movq	$99, 66184(%rbp)
	movq	66184(%rbp), %rcx
	movq	66192(%rbp), %rdx
	leaq	65776(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	strncpy
	leaq	65776(%rbp), %rax
	movq	66184(%rbp), %rdx
	addq	%rdx, %rax
	movb	$0, (%rax)
	addl	$50, 66668(%rbp)
.L196:
	movl	glob_vk_4(%rip), %eax
	testl	%eax, %eax
	je	.L197
	movl	$0, glob_vk_4(%rip)
	cmpl	$1, 66664(%rbp)
	jne	.L197
	leaq	.LC51(%rip), %rax
	movq	%rax, 66176(%rbp)
	movq	$99, 66168(%rbp)
	movq	66168(%rbp), %rcx
	movq	66176(%rbp), %rdx
	leaq	65776(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	strncpy
	leaq	65776(%rbp), %rax
	movq	66168(%rbp), %rdx
	addq	%rdx, %rax
	movb	$0, (%rax)
	addl	$50, 66668(%rbp)
.L197:
	movl	glob_vk_right(%rip), %eax
	testl	%eax, %eax
	je	.L198
	movb	$0, 160(%rbp)
	movl	144(%rbp), %edx
	movzbl	166(%rbp), %eax
	movzbl	%al, %eax
	addl	%edx, %eax
	movl	%eax, 144(%rbp)
.L198:
	movl	glob_vk_up(%rip), %eax
	testl	%eax, %eax
	je	.L199
	movb	$1, 160(%rbp)
	movl	148(%rbp), %edx
	movzbl	166(%rbp), %eax
	movzbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, 148(%rbp)
.L199:
	movl	glob_vk_left(%rip), %eax
	testl	%eax, %eax
	je	.L200
	movb	$2, 160(%rbp)
	movl	144(%rbp), %edx
	movzbl	166(%rbp), %eax
	movzbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, 144(%rbp)
.L200:
	movl	glob_vk_down(%rip), %eax
	testl	%eax, %eax
	je	.L201
	movb	$3, 160(%rbp)
	movl	148(%rbp), %edx
	movzbl	166(%rbp), %eax
	movzbl	%al, %eax
	addl	%edx, %eax
	movl	%eax, 148(%rbp)
.L201:
	movl	glob_vk_right(%rip), %edx
	movl	glob_vk_left(%rip), %eax
	orl	%eax, %edx
	movl	glob_vk_up(%rip), %eax
	orl	%eax, %edx
	movl	glob_vk_down(%rip), %eax
	orl	%edx, %eax
	testl	%eax, %eax
	je	.L202
	movzbl	161(%rbp), %edx
	movzbl	162(%rbp), %eax
	addl	%edx, %eax
	movb	%al, 161(%rbp)
	movzbl	164(%rbp), %eax
	movzbl	161(%rbp), %ecx
	movzbl	163(%rbp), %edx
	cmpb	%dl, %cl
	setnb	%dl
	addl	%edx, %eax
	movb	%al, 164(%rbp)
	movzbl	161(%rbp), %eax
	movzbl	163(%rbp), %edx
	movzbl	%al, %eax
	divb	%dl
	movzbl	%ah, %eax
	movb	%al, 161(%rbp)
	movzbl	164(%rbp), %eax
	movzbl	165(%rbp), %edx
	movzbl	%al, %eax
	divb	%dl
	movzbl	%ah, %eax
	movb	%al, 164(%rbp)
	movl	66528(%rbp), %eax
	imull	66524(%rbp), %eax
	movl	66540(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, 66164(%rbp)
	movl	66552(%rbp), %eax
	movl	%eax, 66160(%rbp)
	movl	66556(%rbp), %eax
	movl	%eax, 66156(%rbp)
	movl	66528(%rbp), %eax
	imull	66520(%rbp), %eax
	movl	66536(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, 66152(%rbp)
	movl	$0, 66148(%rbp)
	movl	144(%rbp), %eax
	cmpl	%eax, 66164(%rbp)
	jl	.L203
	movl	148(%rbp), %eax
	cmpl	%eax, 66152(%rbp)
	jl	.L203
	movl	144(%rbp), %eax
	cmpl	%eax, 66156(%rbp)
	jg	.L203
	movl	148(%rbp), %eax
	cmpl	%eax, 66160(%rbp)
	jle	.L204
.L203:
	movl	$1, %eax
	jmp	.L205
.L204:
	movl	$0, %eax
.L205:
	movl	%eax, 66148(%rbp)
	movl	144(%rbp), %eax
	cmpl	%eax, 66164(%rbp)
	jge	.L206
	movl	66156(%rbp), %eax
	movl	%eax, 144(%rbp)
	addl	$1, 66648(%rbp)
.L206:
	movl	148(%rbp), %eax
	cmpl	%eax, 66160(%rbp)
	jle	.L207
	movl	66152(%rbp), %eax
	movl	%eax, 148(%rbp)
	cvtsi2sd	66320(%rbp), %xmm0
	call	sqrt
	cvttsd2si	%xmm0, %eax
	subl	%eax, 66648(%rbp)
.L207:
	movl	144(%rbp), %eax
	cmpl	%eax, 66156(%rbp)
	jle	.L208
	movl	66164(%rbp), %eax
	movl	%eax, 144(%rbp)
	subl	$1, 66648(%rbp)
.L208:
	movl	148(%rbp), %eax
	cmpl	%eax, 66152(%rbp)
	jge	.L209
	movl	66160(%rbp), %eax
	movl	%eax, 148(%rbp)
	cvtsi2sd	66320(%rbp), %xmm0
	call	sqrt
	cvttsd2si	%xmm0, %eax
	addl	%eax, 66648(%rbp)
.L209:
	cmpl	$0, 66148(%rbp)
	je	.L211
	movl	66320(%rbp), %eax
	addl	%eax, 66648(%rbp)
	movl	66648(%rbp), %eax
	cltd
	idivl	66320(%rbp)
	movl	%edx, 66648(%rbp)
	leaq	208(%rbp), %rax
	movl	66648(%rbp), %ecx
	movq	%rax, %rdx
	call	level_get_name
	movl	66648(%rbp), %eax
	leal	31(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$5, %eax
	movl	%eax, %r9d
	movslq	%r9d, %rax
	movl	176(%rbp,%rax,4), %r8d
	movl	66648(%rbp), %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$27, %eax
	addl	%eax, %edx
	andl	$31, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	$1, %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	movl	%r8d, %edx
	orl	%eax, %edx
	movslq	%r9d, %rax
	movl	%edx, 176(%rbp,%rax,4)
	jmp	.L211
.L202:
	movb	$0, 161(%rbp)
	movb	$0, 164(%rbp)
.L211:
	movl	glob_vk_space(%rip), %edx
	movl	glob_vk_enter(%rip), %eax
	orl	%edx, %eax
	testl	%eax, %eax
	je	.L212
	movl	$0, 66640(%rbp)
.L212:
	movl	144(%rbp), %eax
	movl	%eax, 152(%rbp)
	movl	148(%rbp), %eax
	movl	%eax, 156(%rbp)
	movl	$0, 66632(%rbp)
	jmp	.L213
.L217:
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	66632(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	12(%rax), %eax
	testl	%eax, %eax
	je	.L214
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	66632(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm1
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	66632(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movss	8(%rax), %xmm0
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	66632(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	addss	%xmm1, %xmm0
	movss	%xmm0, 4(%rax)
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	66632(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm0
	cvtsi2ss	66560(%rbp), %xmm1
	comiss	%xmm1, %xmm0
	jbe	.L214
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
	jg	.L216
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	66632(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	$0, 12(%rax)
	jmp	.L214
.L216:
	movl	66560(%rbp), %ecx
	movl	66564(%rbp), %edx
	movl	66632(%rbp), %eax
	movl	%ecx, %r8d
	movl	%eax, %ecx
	call	createWaterParticle
.L214:
	addl	$1, 66632(%rbp)
.L213:
	movl	$100, %eax
	cmpl	%eax, 66632(%rbp)
	jl	.L217
	movl	66364(%rbp), %eax
	addl	%eax, 66652(%rbp)
	movl	66652(%rbp), %eax
	cmpl	66368(%rbp), %eax
	setge	%al
	movzbl	%al, %eax
	addl	%eax, 66656(%rbp)
	movl	66656(%rbp), %eax
	cltd
	idivl	66372(%rbp)
	movl	%edx, 66656(%rbp)
	movl	66652(%rbp), %eax
	cltd
	idivl	66368(%rbp)
	movl	%edx, 66652(%rbp)
	leaq	171(%rbp), %rdx
	leaq	74(%rbp), %rax
	movq	%rax, %rcx
	call	strcpy
	cmpl	$0, 66288(%rbp)
	js	.L218
	movl	$43, %eax
	jmp	.L219
.L218:
	movl	$45, %eax
.L219:
	movb	%al, 74(%rbp)
	movl	66288(%rbp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	addl	$48, %eax
	movb	%al, 75(%rbp)
	movl	66288(%rbp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movl	%edx, %eax
	addl	$48, %eax
	movb	%al, 76(%rbp)
	movl	$42, %eax
	movb	%al, 77(%rbp)
	cmpl	$0, 66292(%rbp)
	jne	.L220
	movl	$67, %eax
	jmp	.L221
.L220:
	movl	$70, %eax
.L221:
	movb	%al, 78(%rbp)
	movl	$0, %edx
	movq	66496(%rbp), %rax
	movq	%rax, %rcx
	call	draw_clear
	movl	$16777215, %edx
	movq	66496(%rbp), %rax
	movq	%rax, %rcx
	call	draw_set_color
	movl	$33023, %edx
	movl	66556(%rbp), %ecx
	movq	66496(%rbp), %rax
	movl	%edx, 40(%rsp)
	movl	66560(%rbp), %edx
	movl	%edx, 32(%rsp)
	movl	%ecx, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	$8388863, %r8d
	movl	66564(%rbp), %eax
	subl	66556(%rbp), %eax
	movl	%eax, %ecx
	movl	66556(%rbp), %edx
	movq	66496(%rbp), %rax
	movl	%r8d, 40(%rsp)
	movl	66560(%rbp), %r8d
	movl	%r8d, 32(%rsp)
	movl	%ecx, %r9d
	movl	$0, %r8d
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	$33023, %edx
	movl	66564(%rbp), %eax
	subl	66556(%rbp), %eax
	movl	66564(%rbp), %r8d
	movq	66496(%rbp), %rcx
	movl	%edx, 40(%rsp)
	movl	66560(%rbp), %edx
	movl	%edx, 32(%rsp)
	movl	%r8d, %r9d
	movl	$0, %r8d
	movl	%eax, %edx
	call	draw_rectangle_color
	movl	66524(%rbp), %eax
	movl	%eax, 66144(%rbp)
	movl	$0, 66140(%rbp)
	cmpl	$0, 66640(%rbp)
	jne	.L222
	movl	66384(%rbp), %eax
	imull	66520(%rbp), %eax
	movl	66388(%rbp), %edx
	imull	66524(%rbp), %edx
	movl	%edx, %r8d
	movl	66140(%rbp), %r10d
	movl	66144(%rbp), %edx
	movq	66496(%rbp), %rcx
	movl	66384(%rbp), %r9d
	movl	%r9d, 64(%rsp)
	movl	66388(%rbp), %r9d
	movl	%r9d, 56(%rsp)
	leaq	.LC52(%rip), %r9
	movq	%r9, 48(%rsp)
	movq	66392(%rbp), %r9
	movq	%r9, 40(%rsp)
	movl	%eax, 32(%rsp)
	movl	%r8d, %r9d
	movl	%r10d, %r8d
	call	draw_text
.L222:
	movl	66524(%rbp), %edx
	movl	66540(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 66144(%rbp)
	movl	$0, 66140(%rbp)
	cmpl	$0, 66640(%rbp)
	jne	.L223
	movq	%rsp, %rax
	movq	%rax, %r15
	leaq	.LC53(%rip), %rax
	movq	%rax, 66128(%rbp)
	movq	66128(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	subq	$1, %rdx
	movq	%rdx, 66120(%rbp)
	movq	%rax, %r13
	movl	$0, %r14d
	movq	%rax, -48(%rbp)
	movq	$0, -40(%rbp)
	addq	$15, %rax
	shrq	$4, %rax
	salq	$4, %rax
	call	___chkstk_ms
	subq	%rax, %rsp
	leaq	80(%rsp), %rax
	addq	$0, %rax
	movq	%rax, 66112(%rbp)
	movq	66112(%rbp), %rax
	movq	66128(%rbp), %rdx
	movq	%rax, %rcx
	call	strcpy
	movl	66648(%rbp), %eax
	movb	%al, 66111(%rbp)
	movzbl	66111(%rbp), %eax
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
	movq	66112(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC54(%rip), %rcx
	call	string_pos
	movl	%ebx, %ecx
	movq	66112(%rbp), %rdx
	cltq
	movb	%cl, (%rdx,%rax)
	movzbl	66111(%rbp), %eax
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
	movq	66112(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC55(%rip), %rcx
	call	string_pos
	movl	%ebx, %ecx
	movq	66112(%rbp), %rdx
	cltq
	movb	%cl, (%rdx,%rax)
	movzbl	66111(%rbp), %ecx
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
	movq	66112(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC56(%rip), %rcx
	call	string_pos
	movl	%ebx, %ecx
	movq	66112(%rbp), %rdx
	cltq
	movb	%cl, (%rdx,%rax)
	movq	66112(%rbp), %r9
	movl	66384(%rbp), %eax
	imull	66520(%rbp), %eax
	movl	66388(%rbp), %edx
	imull	66524(%rbp), %edx
	movl	%edx, %r8d
	movl	66140(%rbp), %r11d
	movl	66144(%rbp), %edx
	movq	66496(%rbp), %rcx
	movl	66384(%rbp), %r10d
	movl	%r10d, 64(%rsp)
	movl	66388(%rbp), %r10d
	movl	%r10d, 56(%rsp)
	movq	%r9, 48(%rsp)
	movq	66392(%rbp), %r9
	movq	%r9, 40(%rsp)
	movl	%eax, 32(%rsp)
	movl	%r8d, %r9d
	movl	%r11d, %r8d
	call	draw_text
	movl	66384(%rbp), %eax
	imull	66520(%rbp), %eax
	movl	66388(%rbp), %edx
	imull	66524(%rbp), %edx
	movl	%edx, %r8d
	movl	66384(%rbp), %edx
	imull	66520(%rbp), %edx
	movl	66140(%rbp), %ecx
	leal	(%rdx,%rcx), %r11d
	movl	66144(%rbp), %r10d
	movq	66496(%rbp), %rcx
	movl	66384(%rbp), %edx
	movl	%edx, 64(%rsp)
	movl	66388(%rbp), %edx
	movl	%edx, 56(%rsp)
	leaq	208(%rbp), %rdx
	movq	%rdx, 48(%rsp)
	movq	66392(%rbp), %rdx
	movq	%rdx, 40(%rsp)
	movl	%eax, 32(%rsp)
	movl	%r8d, %r9d
	movl	%r11d, %r8d
	movl	%r10d, %edx
	call	draw_text
	movl	66144(%rbp), %eax
	movl	%eax, 66104(%rbp)
	movl	66384(%rbp), %eax
	imull	66520(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	66140(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 66100(%rbp)
	movl	66104(%rbp), %eax
	addl	$256, %eax
	movl	%eax, 66096(%rbp)
	movl	66100(%rbp), %eax
	addl	$256, %eax
	movl	%eax, 66092(%rbp)
	movl	66096(%rbp), %r9d
	movl	66100(%rbp), %r8d
	movl	66104(%rbp), %edx
	movq	66496(%rbp), %rax
	movq	66304(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	66092(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_image
	movl	$0, 66628(%rbp)
	jmp	.L224
.L226:
	movl	66628(%rbp), %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$27, %eax
	addl	%eax, %edx
	andl	$31, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	movl	66628(%rbp), %eax
	leal	31(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$5, %eax
	cltq
	movl	176(%rbp,%rax,4), %eax
	movl	%ecx, %edx
	movl	%eax, %ecx
	call	BG
	testl	%eax, %eax
	jne	.L225
	movl	66628(%rbp), %eax
	leal	15(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$4, %eax
	addl	$1, %eax
	cvtsi2sd	%eax, %xmm0
	movsd	.LC57(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	cvtsi2sd	66092(%rbp), %xmm1
	cvtsi2sd	66100(%rbp), %xmm0
	call	lerp
	cvttsd2si	%xmm0, %ebx
	movl	66628(%rbp), %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$28, %eax
	addl	%eax, %edx
	andl	$15, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	addl	$1, %eax
	cvtsi2sd	%eax, %xmm0
	movsd	.LC57(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	cvtsi2sd	66096(%rbp), %xmm1
	cvtsi2sd	66104(%rbp), %xmm0
	call	lerp
	cvttsd2si	%xmm0, %edi
	movl	66628(%rbp), %eax
	leal	15(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$4, %eax
	cvtsi2sd	%eax, %xmm0
	movsd	.LC57(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	cvtsi2sd	66092(%rbp), %xmm1
	cvtsi2sd	66100(%rbp), %xmm0
	call	lerp
	cvttsd2si	%xmm0, %esi
	movl	66628(%rbp), %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$28, %eax
	addl	%eax, %edx
	andl	$15, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	cvtsi2sd	%eax, %xmm0
	movsd	.LC57(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	cvtsi2sd	66096(%rbp), %xmm1
	cvtsi2sd	66104(%rbp), %xmm0
	call	lerp
	cvttsd2si	%xmm0, %eax
	movq	66496(%rbp), %rcx
	movq	66296(%rbp), %rdx
	movq	%rdx, 40(%rsp)
	movl	%ebx, 32(%rsp)
	movl	%edi, %r9d
	movl	%esi, %r8d
	movl	%eax, %edx
	call	draw_image
.L225:
	addl	$1, 66628(%rbp)
.L224:
	cmpl	$255, 66628(%rbp)
	jle	.L226
	movzbl	66111(%rbp), %eax
	movl	$0, %r8d
	movl	$4, %edx
	movl	%eax, %ecx
	call	BGG
	cvtsi2sd	%eax, %xmm0
	movsd	.LC57(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	cvtsi2sd	66096(%rbp), %xmm1
	cvtsi2sd	66104(%rbp), %xmm0
	call	lerp
	cvttsd2si	%xmm0, %eax
	movl	%eax, 66088(%rbp)
	movl	$255, %ecx
	movl	66088(%rbp), %eax
	leal	1(%rax), %r9d
	movl	66088(%rbp), %eax
	leal	-1(%rax), %edx
	movl	66100(%rbp), %r8d
	movq	66496(%rbp), %rax
	movl	%ecx, 40(%rsp)
	movl	66092(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_rectangle_color
	movzbl	66111(%rbp), %eax
	movl	$1, %r8d
	movl	$4, %edx
	movl	%eax, %ecx
	call	BGG
	cvtsi2sd	%eax, %xmm0
	movsd	.LC57(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	cvtsi2sd	66092(%rbp), %xmm1
	cvtsi2sd	66100(%rbp), %xmm0
	call	lerp
	cvttsd2si	%xmm0, %eax
	movl	%eax, 66084(%rbp)
	movl	$255, %r10d
	movl	66084(%rbp), %eax
	leal	1(%rax), %ecx
	movl	66084(%rbp), %eax
	leal	-1(%rax), %r8d
	movl	66096(%rbp), %r9d
	movl	66104(%rbp), %edx
	movq	66496(%rbp), %rax
	movl	%r10d, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	$255, %esi
	movzbl	66111(%rbp), %eax
	movl	$1, %r8d
	movl	$4, %edx
	movl	%eax, %ecx
	call	BGG
	addl	$1, %eax
	cvtsi2sd	%eax, %xmm0
	movsd	.LC57(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	cvtsi2sd	66092(%rbp), %xmm1
	cvtsi2sd	66100(%rbp), %xmm0
	call	lerp
	cvttsd2si	%xmm0, %ebx
	movzbl	66111(%rbp), %eax
	movl	$0, %r8d
	movl	$4, %edx
	movl	%eax, %ecx
	call	BGG
	addl	$1, %eax
	cvtsi2sd	%eax, %xmm0
	movsd	.LC57(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	cvtsi2sd	66096(%rbp), %xmm1
	cvtsi2sd	66104(%rbp), %xmm0
	call	lerp
	cvttsd2si	%xmm0, %ecx
	movl	66084(%rbp), %r8d
	movl	66088(%rbp), %edx
	movq	66496(%rbp), %rax
	movl	%esi, 40(%rsp)
	movl	%ebx, 32(%rsp)
	movl	%ecx, %r9d
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	$0, 66624(%rbp)
	movl	66520(%rbp), %eax
	sall	$5, %eax
	movl	%eax, %edx
	movl	66092(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 66080(%rbp)
	movl	$0, 66620(%rbp)
	jmp	.L227
.L230:
	movl	66656(%rbp), %ecx
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
	movl	66656(%rbp), %ecx
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
	movl	66656(%rbp), %r9d
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
	movl	66656(%rbp), %r9d
	movl	$458129845, %edx
	movl	%r9d, %eax
	imull	%edx
	sarl	$6, %edx
	movl	%r9d, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	66620(%rbp), %eax
	movl	%r8d, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	$737, %r9d
	movl	%r10d, %r8d
	movl	%eax, %ecx
	call	mux_int
	movl	%eax, 66076(%rbp)
	cmpl	$2, 66620(%rbp)
	je	.L228
	movl	66076(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %ecx
	movl	66620(%rbp), %eax
	addl	$1, %eax
	imull	66524(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	66144(%rbp), %eax
	addl	%eax, %edx
	movl	66624(%rbp), %eax
	leal	(%rdx,%rax), %r9d
	movl	66620(%rbp), %eax
	imull	66524(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	66144(%rbp), %eax
	addl	%eax, %edx
	movl	66624(%rbp), %eax
	addl	%eax, %edx
	movl	66092(%rbp), %r8d
	movq	66496(%rbp), %rax
	movl	$32, 72(%rsp)
	movl	$16, 64(%rsp)
	movl	$0, 56(%rsp)
	movl	%ecx, 48(%rsp)
	movq	66376(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	66080(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_image_part
	movl	66524(%rbp), %eax
	addl	%eax, 66624(%rbp)
	jmp	.L229
.L228:
	movl	66524(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	66144(%rbp), %eax
	leal	(%rdx,%rax), %r9d
	movl	66524(%rbp), %eax
	sall	$5, %eax
	movl	%eax, %edx
	movl	66144(%rbp), %eax
	addl	%eax, %edx
	movl	66092(%rbp), %r8d
	movq	66496(%rbp), %rax
	movl	66384(%rbp), %ecx
	movl	%ecx, 64(%rsp)
	movl	66388(%rbp), %ecx
	movl	%ecx, 56(%rsp)
	leaq	.LC58(%rip), %rcx
	movq	%rcx, 48(%rsp)
	movq	66392(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	66080(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_text
.L229:
	addl	$1, 66620(%rbp)
.L227:
	cmpl	$4, 66620(%rbp)
	jle	.L230
	movl	$0, 66616(%rbp)
	movl	66656(%rbp), %eax
	movl	$59, 32(%rsp)
	movl	$5, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	%eax, %ecx
	call	clock_is_between
	testl	%eax, %eax
	je	.L231
	movl	$0, 66616(%rbp)
.L231:
	movl	66656(%rbp), %eax
	movl	$59, 32(%rsp)
	movl	$11, %r9d
	movl	$0, %r8d
	movl	$6, %edx
	movl	%eax, %ecx
	call	clock_is_between
	testl	%eax, %eax
	je	.L232
	movl	$1, 66616(%rbp)
.L232:
	movl	66656(%rbp), %eax
	movl	$59, 32(%rsp)
	movl	$17, %r9d
	movl	$0, %r8d
	movl	$12, %edx
	movl	%eax, %ecx
	call	clock_is_between
	testl	%eax, %eax
	je	.L233
	movl	$2, 66616(%rbp)
.L233:
	movl	66656(%rbp), %eax
	movl	$59, 32(%rsp)
	movl	$23, %r9d
	movl	$0, %r8d
	movl	$18, %edx
	movl	%eax, %ecx
	call	clock_is_between
	testl	%eax, %eax
	je	.L234
	movl	$3, 66616(%rbp)
.L234:
	movq	66336(%rbp), %r9
	movq	66344(%rbp), %r8
	movq	66352(%rbp), %rdx
	movl	66616(%rbp), %eax
	movq	66328(%rbp), %rcx
	movq	%rcx, 32(%rsp)
	movl	%eax, %ecx
	call	mux_str
	movq	%rax, %r11
	movl	66384(%rbp), %eax
	imull	66520(%rbp), %eax
	movl	66388(%rbp), %edx
	imull	66524(%rbp), %edx
	movl	%edx, %r8d
	movl	66080(%rbp), %ecx
	movl	66520(%rbp), %edx
	leal	(%rcx,%rdx), %r10d
	movl	66144(%rbp), %edx
	movq	66496(%rbp), %rcx
	movl	66384(%rbp), %r9d
	movl	%r9d, 64(%rsp)
	movl	66388(%rbp), %r9d
	movl	%r9d, 56(%rsp)
	movq	%r11, 48(%rsp)
	movq	66392(%rbp), %r9
	movq	%r9, 40(%rsp)
	movl	%eax, 32(%rsp)
	movl	%r8d, %r9d
	movl	%r10d, %r8d
	call	draw_text
	movl	66080(%rbp), %edx
	movl	66520(%rbp), %eax
	addl	%eax, %edx
	movl	66384(%rbp), %eax
	imull	66520(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 66072(%rbp)
	movl	66520(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	66072(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 66068(%rbp)
	movl	66524(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	66144(%rbp), %eax
	leal	(%rdx,%rax), %r9d
	movl	66072(%rbp), %r8d
	movl	66144(%rbp), %edx
	movq	66496(%rbp), %rax
	movq	66280(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	66068(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_image
	movl	66384(%rbp), %eax
	imull	66520(%rbp), %eax
	movl	%eax, %ebx
	movl	66388(%rbp), %eax
	imull	66524(%rbp), %eax
	movl	%eax, %esi
	cvtsi2sd	66068(%rbp), %xmm1
	cvtsi2sd	66072(%rbp), %xmm0
	movsd	.LC59(%rip), %xmm2
	call	lerp
	cvttsd2si	%xmm0, %r8d
	movl	66144(%rbp), %eax
	leal	48(%rax), %edx
	movq	66496(%rbp), %rcx
	movl	66384(%rbp), %eax
	movl	%eax, 64(%rsp)
	movl	66388(%rbp), %eax
	movl	%eax, 56(%rsp)
	leaq	74(%rbp), %rax
	movq	%rax, 48(%rsp)
	movq	66392(%rbp), %rax
	movq	%rax, 40(%rsp)
	movl	%ebx, 32(%rsp)
	movl	%esi, %r9d
	call	draw_text
	movq	%r15, %rsp
.L223:
	movl	66528(%rbp), %eax
	movl	%eax, 66064(%rbp)
	movl	$0, 66612(%rbp)
	jmp	.L235
.L238:
	movl	$0, 66608(%rbp)
	jmp	.L236
.L237:
	movl	66612(%rbp), %eax
	imull	66532(%rbp), %eax
	movl	66608(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 66060(%rbp)
	movl	66608(%rbp), %eax
	imull	66524(%rbp), %eax
	imull	66528(%rbp), %eax
	movl	66556(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 66056(%rbp)
	movl	66612(%rbp), %eax
	imull	66520(%rbp), %eax
	imull	66528(%rbp), %eax
	movl	66552(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 66052(%rbp)
	movl	66608(%rbp), %eax
	addl	$1, %eax
	imull	66524(%rbp), %eax
	imull	66528(%rbp), %eax
	movl	66556(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 66048(%rbp)
	movl	66612(%rbp), %eax
	addl	$1, %eax
	imull	66520(%rbp), %eax
	imull	66528(%rbp), %eax
	movl	66552(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 66044(%rbp)
	movl	$16711680, %r9d
	movl	$65280, %r8d
	movl	$255, %r10d
	movl	66060(%rbp), %ecx
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
	movl	%eax, 66040(%rbp)
	movl	66048(%rbp), %r9d
	movl	66052(%rbp), %r8d
	movl	66056(%rbp), %edx
	movq	66496(%rbp), %rax
	movl	66040(%rbp), %ecx
	movl	%ecx, 40(%rsp)
	movl	66044(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	66324(%rbp), %eax
	imull	66648(%rbp), %eax
	movl	66060(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 66036(%rbp)
	movl	66036(%rbp), %eax
	cltq
	movzbl	224(%rbp,%rax), %eax
	movzbl	%al, %eax
	movl	%eax, 66032(%rbp)
	movl	66032(%rbp), %eax
	cltd
	idivl	66532(%rbp)
	imull	66064(%rbp), %eax
	movl	%eax, %ecx
	movl	66032(%rbp), %eax
	cltd
	idivl	66532(%rbp)
	movl	%edx, %eax
	imull	66064(%rbp), %eax
	movl	66048(%rbp), %r9d
	movl	66052(%rbp), %r11d
	movl	66056(%rbp), %edx
	movq	66496(%rbp), %r10
	movl	66064(%rbp), %r8d
	movl	%r8d, 72(%rsp)
	movl	66064(%rbp), %r8d
	movl	%r8d, 64(%rsp)
	movl	%ecx, 56(%rsp)
	movl	%eax, 48(%rsp)
	movq	66408(%rbp), %rax
	movq	%rax, 40(%rsp)
	movl	66044(%rbp), %eax
	movl	%eax, 32(%rsp)
	movl	%r11d, %r8d
	movq	%r10, %rcx
	call	draw_image_part
	addl	$1, 66608(%rbp)
.L236:
	movl	66608(%rbp), %eax
	cmpl	66532(%rbp), %eax
	jl	.L237
	addl	$1, 66612(%rbp)
.L235:
	movl	66612(%rbp), %eax
	cmpl	66532(%rbp), %eax
	jl	.L238
	movzbl	160(%rbp), %eax
	movzbl	%al, %eax
	imull	66064(%rbp), %eax
	movl	%eax, %edx
	movzbl	165(%rbp), %eax
	movzbl	%al, %eax
	imull	%eax, %edx
	movzbl	164(%rbp), %eax
	movzbl	%al, %eax
	imull	66064(%rbp), %eax
	leal	(%rdx,%rax), %r8d
	movl	148(%rbp), %edx
	movl	66064(%rbp), %eax
	imull	66520(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	movl	144(%rbp), %edx
	movl	66064(%rbp), %eax
	imull	66524(%rbp), %eax
	leal	(%rdx,%rax), %r11d
	movl	148(%rbp), %r10d
	movl	144(%rbp), %edx
	movq	66496(%rbp), %rax
	movl	66064(%rbp), %r9d
	movl	%r9d, 72(%rsp)
	movl	66064(%rbp), %r9d
	movl	%r9d, 64(%rsp)
	movl	$0, 56(%rsp)
	movl	%r8d, 48(%rsp)
	movq	66400(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	%r11d, %r9d
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	draw_image_part
	cmpl	$0, 66664(%rbp)
	jle	.L239
	movl	144(%rbp), %eax
	addl	$60, %eax
	movl	%eax, 65888(%rbp)
	movl	148(%rbp), %eax
	subl	$120, %eax
	movl	%eax, 65892(%rbp)
	movq	66496(%rbp), %rax
	movl	$255, 32(%rsp)
	movl	$255, %r9d
	movl	$255, %r8d
	movl	$255, %edx
	movq	%rax, %rcx
	call	SDL_SetRenderDrawColor
	movq	66472(%rbp), %rdx
	movq	66496(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_RenderFillRect
	movq	66496(%rbp), %rax
	movl	$255, 32(%rsp)
	movl	$255, %r9d
	movl	$255, %r8d
	movl	$255, %edx
	movq	%rax, %rcx
	call	SDL_SetRenderDrawColor
	movq	66472(%rbp), %rax
	movl	4(%rax), %ecx
	movq	66472(%rbp), %rax
	movl	12(%rax), %eax
	leal	3(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$2, %eax
	leal	(%rcx,%rax), %r8d
	movq	66472(%rbp), %rax
	movl	(%rax), %eax
	cvtsi2sd	%eax, %xmm1
	movq	66472(%rbp), %rax
	movl	8(%rax), %eax
	cvtsi2sd	%eax, %xmm2
	movsd	.LC60(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	cvttsd2si	%xmm0, %ecx
	movl	148(%rbp), %eax
	leal	-15(%rax), %r10d
	movl	144(%rbp), %eax
	leal	45(%rax), %edx
	movq	66496(%rbp), %rax
	movl	%r8d, 32(%rsp)
	movl	%ecx, %r9d
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	SDL_RenderDrawLine
	movq	66472(%rbp), %rax
	movl	4(%rax), %edx
	movq	66472(%rbp), %rax
	movl	12(%rax), %eax
	leal	(%rdx,%rax), %r8d
	movq	66472(%rbp), %rax
	movl	(%rax), %eax
	cvtsi2sd	%eax, %xmm1
	movq	66472(%rbp), %rax
	movl	8(%rax), %eax
	cvtsi2sd	%eax, %xmm2
	movsd	.LC61(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	cvttsd2si	%xmm0, %ecx
	movl	148(%rbp), %eax
	leal	-15(%rax), %r10d
	movl	144(%rbp), %eax
	leal	45(%rax), %edx
	movq	66496(%rbp), %rax
	movl	%r8d, 32(%rsp)
	movl	%ecx, %r9d
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	SDL_RenderDrawLine
	movl	$0, 28(%rbp)
	movq	66472(%rbp), %rax
	movl	8(%rax), %eax
	subl	$10, %eax
	movl	%eax, 66028(%rbp)
	movl	66028(%rbp), %r8d
	movl	28(%rbp), %ecx
	movq	66480(%rbp), %rdx
	movq	66464(%rbp), %rax
	movl	%r8d, %r9d
	movl	%ecx, %r8d
	movq	%rax, %rcx
	call	TTF_RenderText_Blended_Wrapped
	movq	%rax, 66600(%rbp)
	cmpq	$0, 66600(%rbp)
	jne	.L240
	movl	28(%rbp), %edx
	movq	66464(%rbp), %rax
	movl	%edx, %r8d
	leaq	.LC62(%rip), %rdx
	movq	%rax, %rcx
	call	TTF_RenderText_Solid
	movq	%rax, 66600(%rbp)
.L240:
	movq	66600(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, 66024(%rbp)
	movq	66600(%rbp), %rax
	movl	20(%rax), %eax
	movl	%eax, 66020(%rbp)
	movq	66472(%rbp), %rax
	movl	(%rax), %edx
	movq	66472(%rbp), %rax
	movl	8(%rax), %eax
	subl	66024(%rbp), %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	sarl	%eax
	addl	%edx, %eax
	movl	%eax, 66016(%rbp)
	movq	66472(%rbp), %rax
	movl	4(%rax), %edx
	movq	66472(%rbp), %rax
	movl	12(%rax), %eax
	subl	66020(%rbp), %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	sarl	%eax
	addl	%edx, %eax
	movl	%eax, 66012(%rbp)
	movl	66016(%rbp), %eax
	movl	%eax, 0(%rbp)
	movl	66012(%rbp), %eax
	movl	%eax, 4(%rbp)
	movl	66024(%rbp), %eax
	movl	%eax, 8(%rbp)
	movl	66020(%rbp), %eax
	movl	%eax, 12(%rbp)
	movq	66600(%rbp), %rdx
	movq	66496(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_CreateTextureFromSurface
	movq	%rax, 66000(%rbp)
	movq	%rbp, %rcx
	movq	66000(%rbp), %rdx
	movq	66496(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	SDL_RenderCopy
	movq	66600(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_FreeSurface
	movq	66000(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
.L239:
	movl	$0, 66596(%rbp)
	jmp	.L241
.L243:
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	66596(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	12(%rax), %eax
	testl	%eax, %eax
	je	.L242
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	66596(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm1
	movss	.LC63(%rip), %xmm0
	addss	%xmm1, %xmm0
	cvttss2si	%xmm0, %edx
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rcx
	movl	66596(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm1
	movss	.LC64(%rip), %xmm0
	addss	%xmm1, %xmm0
	cvttss2si	%xmm0, %r9d
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rcx
	movl	66596(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movss	4(%rax), %xmm0
	cvttss2si	%xmm0, %r8d
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rcx
	movl	66596(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm0
	cvttss2si	%xmm0, %eax
	movq	66496(%rbp), %rcx
	movq	66424(%rbp), %r10
	movq	%r10, 40(%rsp)
	movl	%edx, 32(%rsp)
	movl	%eax, %edx
	call	draw_image
.L242:
	addl	$1, 66596(%rbp)
.L241:
	movl	$100, %eax
	cmpl	%eax, 66596(%rbp)
	jl	.L243
	cmpl	$0, 66640(%rbp)
	je	.L244
	movl	66540(%rbp), %r9d
	movl	66552(%rbp), %r8d
	movl	66556(%rbp), %edx
	movq	66496(%rbp), %rax
	movq	66248(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	66536(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_image
	movl	66384(%rbp), %eax
	imull	66520(%rbp), %eax
	movl	66388(%rbp), %edx
	imull	66524(%rbp), %edx
	movl	%edx, %r8d
	movl	66552(%rbp), %r10d
	movl	66556(%rbp), %edx
	movq	66496(%rbp), %rcx
	movl	66384(%rbp), %r9d
	movl	%r9d, 64(%rsp)
	movl	66388(%rbp), %r9d
	movl	%r9d, 56(%rsp)
	movq	66240(%rbp), %r9
	movq	%r9, 48(%rsp)
	movq	66392(%rbp), %r9
	movq	%r9, 40(%rsp)
	movl	%eax, 32(%rsp)
	movl	%r8d, %r9d
	movl	%r10d, %r8d
	call	draw_text
.L244:
	cmpl	$0, 66664(%rbp)
	jle	.L245
	movq	66496(%rbp), %rax
	movl	$255, 32(%rsp)
	movl	$255, %r9d
	movl	$255, %r8d
	movl	$255, %edx
	movq	%rax, %rcx
	call	SDL_SetRenderDrawColor
	leaq	65888(%rbp), %rax
	movq	66496(%rbp), %rcx
	movq	%rax, %rdx
	call	SDL_RenderFillRect
	movl	$0, -4(%rbp)
	movb	$-1, -4(%rbp)
	movl	-4(%rbp), %ecx
	movq	66480(%rbp), %rdx
	movq	66464(%rbp), %rax
	movl	%ecx, %r8d
	movq	%rax, %rcx
	call	TTF_RenderText_Solid
	movq	%rax, 65992(%rbp)
	movq	65992(%rbp), %rdx
	movq	66496(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_CreateTextureFromSurface
	movq	%rax, 65984(%rbp)
	movl	65888(%rbp), %edx
	movl	65896(%rbp), %ecx
	movq	65992(%rbp), %rax
	movl	16(%rax), %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	sarl	%eax
	addl	%edx, %eax
	movl	%eax, -32(%rbp)
	movl	65892(%rbp), %edx
	movl	65900(%rbp), %ecx
	movq	65992(%rbp), %rax
	movl	20(%rax), %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	sarl	%eax
	addl	%edx, %eax
	movl	%eax, -28(%rbp)
	movq	65992(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, -24(%rbp)
	movq	65992(%rbp), %rax
	movl	20(%rax), %eax
	movl	%eax, -20(%rbp)
	leaq	-32(%rbp), %rcx
	movq	65984(%rbp), %rdx
	movq	66496(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	SDL_RenderCopy
	movq	65992(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_FreeSurface
	movq	65984(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
.L245:
	movq	66496(%rbp), %rax
	movl	$255, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	SDL_SetRenderDrawColor
	movl	66668(%rbp), %edx
	leaq	48(%rbp), %rax
	movl	%edx, %r9d
	leaq	.LC65(%rip), %r8
	movl	$20, %edx
	movq	%rax, %rcx
	call	snprintf
	movl	65772(%rbp), %edx
	leaq	48(%rbp), %rax
	movq	66464(%rbp), %rcx
	movl	%edx, %r8d
	movq	%rax, %rdx
	call	TTF_RenderText_Solid
	movq	%rax, 65976(%rbp)
	movq	65976(%rbp), %rdx
	movq	66496(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_CreateTextureFromSurface
	movq	%rax, 65968(%rbp)
	movl	$10, 32(%rbp)
	movl	$720, 36(%rbp)
	movq	65976(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, 40(%rbp)
	movq	65976(%rbp), %rax
	movl	20(%rax), %eax
	movl	%eax, 44(%rbp)
	leaq	32(%rbp), %rcx
	movq	65968(%rbp), %rdx
	movq	66496(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	SDL_RenderCopy
	movq	65976(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_FreeSurface
	movq	65968(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66496(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_RenderPresent
	movl	$16, %ecx
	call	SDL_Delay
.L141:
	cmpl	$0, 66636(%rbp)
	jne	.L142
	leaq	.LC66(%rip), %rcx
	call	puts
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	free
	movq	66464(%rbp), %rax
	movq	%rax, %rcx
	call	TTF_CloseFont
	movq	66440(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66432(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66424(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66416(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66408(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66304(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66296(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66400(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66248(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66392(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66376(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66280(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	call	IMG_Quit
	movl	66260(%rbp), %eax
	movl	%eax, %ecx
	call	SDL_CloseAudioDevice
	movq	104(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_FreeWAV
	movq	66496(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyRenderer
	movq	66504(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyWindow
	call	SDL_Quit
	movl	$500, %ecx
	call	SDL_Delay
	movl	$0, %eax
	jmp	.L125
.L130:
	call	SDL_GetError
	movq	%rax, %rsi
	movq	66568(%rbp), %rbx
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC67(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	call	SDL_Quit
	movl	$1, %ecx
	call	exit
.L125:
	movq	%r12, %rsp
	jmp	.L123
.L139:
	movq	%r12, %rsp
.L123:
	leaq	66680(%rbp), %rsp
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
	.align 8
.LC9:
	.long	0
	.long	1076101120
	.align 4
.LC12:
	.long	1092616192
	.align 8
.LC13:
	.long	-858993459
	.long	1073532108
	.align 8
.LC14:
	.long	0
	.long	1077936128
	.align 8
.LC57:
	.long	0
	.long	1076887552
	.align 8
.LC59:
	.long	0
	.long	1070596096
	.align 8
.LC60:
	.long	-1717986918
	.long	1069128089
	.align 8
.LC61:
	.long	858993459
	.long	1070805811
	.align 4
.LC63:
	.long	1097859072
	.align 4
.LC64:
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
	.def	fseek;	.scl	2;	.type	32;	.endef
	.def	fgetc;	.scl	2;	.type	32;	.endef
	.def	pow;	.scl	2;	.type	32;	.endef
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
	.def	TTF_Init;	.scl	2;	.type	32;	.endef
	.def	TTF_OpenFont;	.scl	2;	.type	32;	.endef
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
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	sqrt;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	SDL_RenderDrawLine;	.scl	2;	.type	32;	.endef
	.def	TTF_RenderText_Blended_Wrapped;	.scl	2;	.type	32;	.endef
	.def	TTF_RenderText_Solid;	.scl	2;	.type	32;	.endef
	.def	SDL_CreateTextureFromSurface;	.scl	2;	.type	32;	.endef
	.def	SDL_FreeSurface;	.scl	2;	.type	32;	.endef
	.def	SDL_DestroyTexture;	.scl	2;	.type	32;	.endef
	.def	SDL_RenderPresent;	.scl	2;	.type	32;	.endef
	.def	SDL_Delay;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	TTF_CloseFont;	.scl	2;	.type	32;	.endef
	.def	IMG_Quit;	.scl	2;	.type	32;	.endef
	.def	SDL_CloseAudioDevice;	.scl	2;	.type	32;	.endef
	.def	SDL_DestroyRenderer;	.scl	2;	.type	32;	.endef
	.def	SDL_DestroyWindow;	.scl	2;	.type	32;	.endef
