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
	.globl	chatBoxMod
	.def	chatBoxMod;	.scl	2;	.type	32;	.endef
	.seh_proc	chatBoxMod
chatBoxMod:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movl	%r9d, 40(%rbp)
	movq	16(%rbp), %rax
	movl	24(%rbp), %edx
	movl	%edx, (%rax)
	movq	16(%rbp), %rax
	movl	32(%rbp), %edx
	movl	%edx, 4(%rax)
	movq	16(%rbp), %rax
	movl	40(%rbp), %edx
	movl	%edx, 8(%rax)
	movq	16(%rbp), %rax
	movl	48(%rbp), %edx
	movl	%edx, 12(%rax)
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
<<<<<<< HEAD
	jb	.L97
	movq	-8(%rbp), %rax
	movl	$0, 12(%rax)
.L97:
=======
	jb	.L106
	movq	-8(%rbp), %rax
	movl	$0, 12(%rax)
.L106:
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
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
	jl	.L112
	movl	16(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jg	.L112
	movl	$1, %eax
	jmp	.L114
.L112:
	movl	$0, %eax
.L114:
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC13:
	.ascii "Failed to allocate memory for water particles\12\0"
.LC14:
	.ascii "SDL init error:%s\12\0"
.LC15:
	.ascii "COSC345 - Game\0"
.LC16:
	.ascii "Window error\0"
.LC17:
	.ascii "Render error\0"
.LC18:
	.ascii "Surface error\0"
	.align 8
.LC19:
	.ascii "SDL_ttf could not initialize! TTF_Error: %s\12\0"
.LC20:
	.ascii "font.ttf\0"
	.align 8
.LC21:
	.ascii "Failed to load font! SDL_ttf Error: %s\12\0"
	.align 8
.LC22:
	.ascii "Renderer could not be created! SDL_Error: %s\12\0"
.LC23:
	.ascii "img/spr_grass.png\0"
.LC24:
	.ascii "img/spr_sand.png\0"
.LC25:
	.ascii "img/spr_water.png\0"
.LC26:
	.ascii "img/spr_lava.png\0"
.LC27:
	.ascii "tiled/tileset.png\0"
.LC28:
	.ascii "img/player_strip8.png\0"
.LC29:
	.ascii "img/ascii_strip96.png\0"
.LC30:
	.ascii "img/clock1_strip10.png\0"
.LC31:
	.ascii "Night\0"
.LC32:
	.ascii "Morning\0"
.LC33:
	.ascii "Day\0"
.LC34:
	.ascii "Evening\0"
.LC35:
	.ascii "img/dunedin-map.png\0"
.LC36:
	.ascii "music.wav\0"
.LC37:
	.ascii "Failed to load WAV file: %s\12\0"
	.align 8
<<<<<<< HEAD
.LC30:
	.ascii "Failed to open audio device: %s\12\0"
.LC31:
	.ascii "img/img_lands.png\0"
.LC32:
	.ascii "Press SPACE to continue.\0"
.LC33:
	.ascii "Entering main loop...\0"
	.align 8
.LC34:
	.ascii "you pressed 1, good job. Lets test the limit\0"
	.align 8
.LC35:
	.ascii "you pressed 2, good job. Lets test the limit woo\0"
.LC36:
	.ascii "you pressed 3\0"
	.align 8
.LC37:
	.ascii "you pressed 4, good job. Lets test the limit woo\0"
.LC38:
	.ascii "F2 started!\0"
.LC39:
	.ascii "F2 finished!\0"
.LC40:
	.ascii "Location:#DUNEDIN#NEW ZEALAND\0"
.LC41:
	.ascii "LVL: XYZ/255\0"
.LC42:
	.ascii "X\0"
.LC43:
	.ascii "Y\0"
.LC44:
	.ascii "Z\0"
.LC45:
	.ascii "title has no texture!\0"
.LC50:
	.ascii "Error: Text Rendering Failed\0"
.LC51:
	.ascii "Score: %d\0"
.LC52:
	.ascii "...exited main loop.\0"
.LC53:
=======
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
.LC53:
	.ascii "Score: %d\0"
.LC54:
	.ascii "...exited main loop.\0"
.LC55:
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
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
<<<<<<< HEAD
	movl	$66552, %eax
	call	___chkstk_ms
	subq	%rax, %rsp
	.seh_stackalloc	66552
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movl	%ecx, 66496(%rbp)
	movq	%rdx, 66504(%rbp)
	movq	%rsp, %rax
	movq	%rax, %rsi
	movq	$256, 66344(%rbp)
	movq	66344(%rbp), %rax
	subq	$1, %rax
	movq	%rax, 66336(%rbp)
	movq	66344(%rbp), %rax
	movq	%rax, %r10
	movl	$0, %r11d
	movq	66344(%rbp), %rax
	movq	%rax, %r8
	movl	$0, %r9d
	movq	66344(%rbp), %rax
=======
	movl	$66504, %eax
	call	___chkstk_ms
	subq	%rax, %rsp
	.seh_stackalloc	66504
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movl	%ecx, 66448(%rbp)
	movq	%rdx, 66456(%rbp)
	movq	%rsp, %rax
	movq	%rax, %rsi
	movq	$256, 66296(%rbp)
	movq	66296(%rbp), %rax
	subq	$1, %rax
	movq	%rax, 66288(%rbp)
	movq	66296(%rbp), %rax
	movq	%rax, %r10
	movl	$0, %r11d
	movq	66296(%rbp), %rax
	movq	%rax, %r8
	movl	$0, %r9d
	movq	66296(%rbp), %rax
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	addq	$15, %rax
	shrq	$4, %rax
	salq	$4, %rax
	call	___chkstk_ms
	subq	%rax, %rsp
	leaq	80(%rsp), %rax
	addq	$0, %rax
<<<<<<< HEAD
	movq	%rax, 66328(%rbp)
	movl	$1366, 66324(%rbp)
	movl	$768, 66320(%rbp)
	movl	66324(%rbp), %eax
	subl	66320(%rbp), %eax
=======
	movq	%rax, 66280(%rbp)
	movl	$1366, 66276(%rbp)
	movl	$768, 66272(%rbp)
	movl	66276(%rbp), %eax
	subl	66272(%rbp), %eax
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
<<<<<<< HEAD
	movl	%eax, 66316(%rbp)
	movl	$0, 66312(%rbp)
	movl	66320(%rbp), %eax
	movl	%eax, 66308(%rbp)
	movl	66320(%rbp), %eax
	movl	%eax, 66304(%rbp)
	movl	66316(%rbp), %edx
	movl	66308(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 66300(%rbp)
	movl	66312(%rbp), %edx
	movl	66304(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 66296(%rbp)
	movl	$16, 66292(%rbp)
	movl	$16, 66288(%rbp)
	movl	66292(%rbp), %eax
	movl	%eax, %ecx
	call	sqr
	movl	%eax, %edi
	movl	66320(%rbp), %eax
	cltd
	idivl	%edi
	movl	%eax, 66284(%rbp)
	movl	66284(%rbp), %eax
	movl	%eax, 66280(%rbp)
=======
	movl	%eax, 66268(%rbp)
	movl	$0, 66264(%rbp)
	movl	66272(%rbp), %eax
	movl	%eax, 66260(%rbp)
	movl	66272(%rbp), %eax
	movl	%eax, 66256(%rbp)
	movl	66268(%rbp), %edx
	movl	66260(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 66252(%rbp)
	movl	66264(%rbp), %edx
	movl	66256(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 66248(%rbp)
	movl	$16, 66244(%rbp)
	movl	$16, 66240(%rbp)
	movl	66244(%rbp), %eax
	movl	%eax, %ecx
	call	sqr
	movl	%eax, %edi
	movl	66272(%rbp), %eax
	cltd
	idivl	%edi
	movl	%eax, 66236(%rbp)
	movl	66236(%rbp), %eax
	movl	%eax, 66232(%rbp)
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
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
<<<<<<< HEAD
	jne	.L99
=======
	jne	.L116
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %r9
	movl	$46, %r8d
	movl	$1, %edx
	leaq	.LC13(%rip), %rcx
	call	fwrite
	movl	$1, %eax
<<<<<<< HEAD
	jmp	.L100
.L99:
=======
	jmp	.L117
.L116:
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	movl	$0, %ecx
	call	time
	movl	%eax, %ecx
	call	srand
<<<<<<< HEAD
	movl	$0, 66412(%rbp)
	jmp	.L101
.L102:
	movl	66320(%rbp), %ecx
	movl	66324(%rbp), %edx
	movl	66412(%rbp), %eax
	movl	%ecx, %r8d
	movl	%eax, %ecx
	call	createWaterParticle
	addl	$1, 66412(%rbp)
.L101:
	movl	$100, %eax
	cmpl	%eax, 66412(%rbp)
	jl	.L102
	movl	$62001, 66276(%rbp)
	movl	66276(%rbp), %eax
	movl	%eax, %ecx
	call	SDL_Init
	testl	%eax, %eax
	je	.L103
=======
	movl	$0, 66356(%rbp)
	jmp	.L118
.L119:
	movl	66272(%rbp), %ecx
	movl	66276(%rbp), %edx
	movl	66356(%rbp), %eax
	movl	%ecx, %r8d
	movl	%eax, %ecx
	call	createWaterParticle
	addl	$1, 66356(%rbp)
.L118:
	movl	$100, %eax
	cmpl	%eax, 66356(%rbp)
	jl	.L119
	movl	$62001, 66228(%rbp)
	movl	66228(%rbp), %eax
	movl	%eax, %ecx
	call	SDL_Init
	testl	%eax, %eax
	je	.L120
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC14(%rip), %rcx
	call	printf
	movl	$-1, %eax
<<<<<<< HEAD
	jmp	.L100
.L103:
	movl	66324(%rbp), %edx
	movl	$0, 40(%rsp)
	movl	66320(%rbp), %eax
=======
	jmp	.L117
.L120:
	movl	66276(%rbp), %edx
	movl	$0, 40(%rsp)
	movl	66272(%rbp), %eax
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	movl	%eax, 32(%rsp)
	movl	%edx, %r9d
	movl	$536805376, %r8d
	movl	$536805376, %edx
	leaq	.LC15(%rip), %rcx
	call	SDL_CreateWindow
<<<<<<< HEAD
	movq	%rax, 66264(%rbp)
	cmpq	$0, 66264(%rbp)
	jne	.L104
	movq	66344(%rbp), %rdx
	movq	66328(%rbp), %rax
	leaq	.LC13(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L105
.L104:
	movq	66264(%rbp), %rax
=======
	movq	%rax, 66216(%rbp)
	cmpq	$0, 66216(%rbp)
	jne	.L121
	movq	66280(%rbp), %rax
	movq	66296(%rbp), %rdx
	leaq	.LC16(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L122
.L121:
	movq	66216(%rbp), %rax
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	movl	$4, %r8d
	movl	$-1, %edx
	movq	%rax, %rcx
	call	SDL_CreateRenderer
<<<<<<< HEAD
	movq	%rax, 66256(%rbp)
	cmpq	$0, 66256(%rbp)
	jne	.L106
	movq	66344(%rbp), %rdx
	movq	66328(%rbp), %rax
	leaq	.LC14(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L105
.L106:
	movl	$0, 66252(%rbp)
	movw	$48, 65822(%rbp)
	movq	66264(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_GetWindowSurface
	movq	%rax, 66240(%rbp)
	cmpq	$0, 66240(%rbp)
	jne	.L107
	movq	66344(%rbp), %rdx
	movq	66328(%rbp), %rax
	leaq	.LC15(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L105
.L107:
	movl	$800, 65792(%rbp)
	movl	$100, 65796(%rbp)
	movl	$200, 65800(%rbp)
	movl	$80, 65804(%rbp)
	leaq	65792(%rbp), %rax
	movq	%rax, 66232(%rbp)
=======
	movq	%rax, 66208(%rbp)
	cmpq	$0, 66208(%rbp)
	jne	.L123
	movq	66280(%rbp), %rax
	movq	66296(%rbp), %rdx
	leaq	.LC17(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L122
.L123:
	movq	66216(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_GetWindowSurface
	movq	%rax, 66200(%rbp)
	cmpq	$0, 66200(%rbp)
	jne	.L124
	movq	66280(%rbp), %rax
	movq	66296(%rbp), %rdx
	leaq	.LC18(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L122
.L124:
	movl	$0, 66196(%rbp)
	movw	$48, 65758(%rbp)
	movl	$800, 65728(%rbp)
	movl	$100, 65732(%rbp)
	movl	$100, 65736(%rbp)
	movl	$100, 65740(%rbp)
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	movabsq	$2338613357913204068, %rax
	movq	%rax, 65712(%rbp)
	movabsq	$28542640894207341, %rax
<<<<<<< HEAD
	movq	%rax, 65688(%rbp)
	movq	$0, 65696(%rbp)
	movq	$0, 65704(%rbp)
	movq	$0, 65712(%rbp)
	movq	$0, 65720(%rbp)
	movq	$0, 65728(%rbp)
	movq	$0, 65736(%rbp)
	movq	$0, 65744(%rbp)
	movq	$0, 65752(%rbp)
	movq	$0, 65760(%rbp)
	movq	$0, 65768(%rbp)
	movl	$0, 65776(%rbp)
	leaq	65680(%rbp), %rax
	movq	%rax, 66224(%rbp)
	movl	$0, 66408(%rbp)
	call	TTF_Init
	cmpl	$-1, %eax
	jne	.L108
=======
	movq	%rax, 65720(%rbp)
	leaq	65712(%rbp), %rax
	movq	%rax, 66184(%rbp)
	movl	$0, 66360(%rbp)
	call	TTF_Init
	cmpl	$-1, %eax
	jne	.L125
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC19(%rip), %rcx
	call	printf
	movl	$1, %eax
<<<<<<< HEAD
	jmp	.L100
.L108:
=======
	jmp	.L117
.L125:
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	movl	$12, %edx
	leaq	.LC20(%rip), %rcx
	call	TTF_OpenFont
<<<<<<< HEAD
	movq	%rax, 66216(%rbp)
	cmpq	$0, 66216(%rbp)
	jne	.L109
=======
	movq	%rax, 66176(%rbp)
	cmpq	$0, 66176(%rbp)
	jne	.L126
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC21(%rip), %rcx
	call	printf
	movl	$1, %eax
<<<<<<< HEAD
	jmp	.L100
.L109:
	movl	$0, 66404(%rbp)
	movb	$0, 65676(%rbp)
	movb	$0, 65677(%rbp)
	movb	$0, 65678(%rbp)
	movb	$-1, 65679(%rbp)
	movq	66264(%rbp), %rax
=======
	jmp	.L117
.L126:
	movl	$0, 66172(%rbp)
	movl	$0, 66364(%rbp)
	movb	$-1, 65708(%rbp)
	movb	$-1, 65709(%rbp)
	movb	$-1, 65710(%rbp)
	movb	$-1, 65711(%rbp)
	movq	66216(%rbp), %rax
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	movl	$2, %r8d
	movl	$-1, %edx
	movq	%rax, %rcx
	call	SDL_CreateRenderer
<<<<<<< HEAD
	movq	%rax, 66208(%rbp)
	cmpq	$0, 66256(%rbp)
	jne	.L110
=======
	movq	%rax, 66160(%rbp)
	cmpq	$0, 66208(%rbp)
	jne	.L127
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC22(%rip), %rcx
	call	printf
<<<<<<< HEAD
.L110:
	movl	$2, %ecx
	call	IMG_Init
	movq	66256(%rbp), %rax
	leaq	.LC20(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66200(%rbp)
	movq	66256(%rbp), %rax
	leaq	.LC21(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66192(%rbp)
	movq	66256(%rbp), %rax
	leaq	.LC22(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66184(%rbp)
	movq	66256(%rbp), %rax
	leaq	.LC23(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66176(%rbp)
	movq	66256(%rbp), %rax
	leaq	.LC24(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66168(%rbp)
	movq	66256(%rbp), %rax
	leaq	.LC25(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66160(%rbp)
	movl	$8, 66156(%rbp)
	movl	$16, 66152(%rbp)
	movl	66292(%rbp), %eax
	movl	%eax, %ecx
	call	sqr
	movl	%eax, 66148(%rbp)
	movl	$256, 66144(%rbp)
	movl	$0, 66400(%rbp)
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC27(%rip), %rax
	movq	%rax, %rcx
	call	fopen
	movq	%rax, 66136(%rbp)
	movl	$0, 66396(%rbp)
	jmp	.L111
.L112:
	movl	66396(%rbp), %eax
	cltq
	movb	$0, 128(%rbp,%rax)
	addl	$1, 66396(%rbp)
.L111:
	movl	66148(%rbp), %eax
	imull	66144(%rbp), %eax
	cmpl	%eax, 66396(%rbp)
	jl	.L112
	movq	66136(%rbp), %rdx
	leaq	128(%rbp), %rax
=======
.L127:
	movl	$2, %ecx
	call	IMG_Init
	movq	66208(%rbp), %rax
	leaq	.LC23(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66152(%rbp)
	movq	66208(%rbp), %rax
	leaq	.LC24(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66144(%rbp)
	movq	66208(%rbp), %rax
	leaq	.LC25(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66136(%rbp)
	movq	66208(%rbp), %rax
	leaq	.LC26(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66128(%rbp)
	movq	66208(%rbp), %rax
	leaq	.LC27(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66120(%rbp)
	movq	66208(%rbp), %rax
	leaq	.LC28(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66112(%rbp)
	movq	66208(%rbp), %rax
	leaq	.LC29(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66104(%rbp)
	movl	$8, 66100(%rbp)
	movl	$24, 66096(%rbp)
	movq	66208(%rbp), %rax
	leaq	.LC30(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66088(%rbp)
	movl	$1440, 66084(%rbp)
	movl	$0, 66352(%rbp)
	movl	$0, 66348(%rbp)
	movl	$57, 66080(%rbp)
	movl	$60, 66076(%rbp)
	leaq	.LC31(%rip), %rax
	movq	%rax, 66064(%rbp)
	leaq	.LC32(%rip), %rax
	movq	%rax, 66056(%rbp)
	leaq	.LC33(%rip), %rax
	movq	%rax, 66048(%rbp)
	leaq	.LC34(%rip), %rax
	movq	%rax, 66040(%rbp)
	movl	66244(%rbp), %eax
	movl	%eax, %ecx
	call	sqr
	movl	%eax, 66036(%rbp)
	movl	$256, 66032(%rbp)
	movl	$0, 66344(%rbp)
	leaq	.LC5(%rip), %rdx
	leaq	.LC8(%rip), %rcx
	call	fopen
	movq	%rax, 66024(%rbp)
	movl	$0, 66340(%rbp)
	jmp	.L128
.L129:
	movl	66340(%rbp), %eax
	cltq
	movb	$0, 160(%rbp,%rax)
	addl	$1, 66340(%rbp)
.L128:
	movl	66036(%rbp), %eax
	imull	66032(%rbp), %eax
	cmpl	%eax, 66340(%rbp)
	jl	.L129
	movq	66024(%rbp), %rdx
	leaq	160(%rbp), %rax
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	movq	%rdx, %r9
	movl	$1, %r8d
	movl	$65536, %edx
	movq	%rax, %rcx
	call	fread
<<<<<<< HEAD
	movq	66136(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movl	66284(%rbp), %eax
	imull	66288(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	66316(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 96(%rbp)
	movl	66280(%rbp), %eax
	imull	66288(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	66312(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 100(%rbp)
	movb	$0, 112(%rbp)
	movb	$0, 113(%rbp)
	movb	$1, 114(%rbp)
	movb	$12, 115(%rbp)
	movb	$0, 116(%rbp)
	movb	$2, 117(%rbp)
	movb	$12, 118(%rbp)
	leaq	.LC28(%rip), %rax
	movq	%rax, 66128(%rbp)
	movq	66128(%rbp), %rax
	leaq	.LC26(%rip), %rdx
=======
	movq	66024(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movq	66208(%rbp), %rax
	leaq	.LC35(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66016(%rbp)
	leaq	144(%rbp), %rax
	movl	66344(%rbp), %ecx
	movq	%rax, %rdx
	call	level_get_name
	movl	66236(%rbp), %eax
	imull	66240(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	66268(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 112(%rbp)
	movl	66232(%rbp), %eax
	imull	66240(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	66264(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 116(%rbp)
	movb	$0, 128(%rbp)
	movb	$0, 129(%rbp)
	movb	$1, 130(%rbp)
	movb	$12, 131(%rbp)
	movb	$0, 132(%rbp)
	movb	$2, 133(%rbp)
	movb	$12, 134(%rbp)
	leaq	.LC36(%rip), %rax
	movq	%rax, 66008(%rbp)
	movq	66008(%rbp), %rax
	leaq	.LC5(%rip), %rdx
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	movq	%rax, %rcx
	call	SDL_RWFromFile
	movq	%rax, %r10
	leaq	72(%rbp), %rcx
	leaq	80(%rbp), %rdx
	leaq	68(%rbp), %rax
	movq	%rax, 32(%rsp)
	movq	%rcx, %r9
	movq	%rdx, %r8
	movl	$1, %edx
	movq	%r10, %rcx
	call	SDL_LoadWAV_RW
	testq	%rax, %rax
<<<<<<< HEAD
	jne	.L113
=======
	jne	.L130
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC37(%rip), %rcx
	call	printf
<<<<<<< HEAD
	jmp	.L114
.L113:
	movq	56(%rbp), %rax
	movq	%rax, 32(%rbp)
	movl	52(%rbp), %eax
	movl	%eax, 40(%rbp)
	movl	$0, 44(%rbp)
=======
	jmp	.L131
.L130:
	movq	72(%rbp), %rax
	movq	%rax, 48(%rbp)
	movl	68(%rbp), %eax
	movl	%eax, 56(%rbp)
	movl	$0, 60(%rbp)
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	leaq	audioCallback(%rip), %rax
	movq	%rax, 96(%rbp)
	leaq	48(%rbp), %rax
	movq	%rax, 104(%rbp)
	leaq	80(%rbp), %rax
	movl	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$0, %ecx
	call	SDL_OpenAudioDevice
<<<<<<< HEAD
	movl	%eax, 66124(%rbp)
	cmpl	$0, 66124(%rbp)
	jne	.L115
=======
	movl	%eax, 66004(%rbp)
	cmpl	$0, 66004(%rbp)
	jne	.L132
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC38(%rip), %rcx
	call	printf
	movq	72(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_FreeWAV
<<<<<<< HEAD
	jmp	.L114
.L115:
	movl	52(%rbp), %ecx
	movq	56(%rbp), %rdx
	movl	66124(%rbp), %eax
	movl	%ecx, %r8d
	movl	%eax, %ecx
	call	SDL_QueueAudio
	movl	66124(%rbp), %eax
	movl	$0, %edx
	movl	%eax, %ecx
	call	SDL_PauseAudioDevice
	movl	$1, 66392(%rbp)
	movq	66256(%rbp), %rax
	leaq	.LC31(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66112(%rbp)
	leaq	.LC32(%rip), %rax
	movq	%rax, 66104(%rbp)
	movl	$0, 66100(%rbp)
	movl	$1, 66388(%rbp)
	leaq	.LC33(%rip), %rax
	movq	%rax, %rcx
	call	puts
	jmp	.L116
.L155:
	movl	65824(%rbp), %eax
	cmpl	$769, %eax
	je	.L118
	cmpl	$769, %eax
	ja	.L117
	cmpl	$256, %eax
	je	.L119
	cmpl	$768, %eax
	je	.L120
	jmp	.L117
.L119:
	movl	$0, 66388(%rbp)
	jmp	.L117
.L120:
	movl	$1, 65952(%rbp)
	movl	65844(%rbp), %eax
	cmpl	$57, %eax
	jg	.L121
	cmpl	$27, %eax
	jge	.L122
	jmp	.L117
.L139:
	subl	$1073741883, %eax
	cmpl	$29, %eax
	ja	.L117
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L125(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L125(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L125:
	.long	.L130-.L125
	.long	.L117-.L125
	.long	.L117-.L125
	.long	.L117-.L125
	.long	.L117-.L125
	.long	.L117-.L125
	.long	.L117-.L125
	.long	.L117-.L125
	.long	.L117-.L125
	.long	.L117-.L125
	.long	.L117-.L125
	.long	.L117-.L125
	.long	.L117-.L125
	.long	.L117-.L125
	.long	.L117-.L125
	.long	.L117-.L125
	.long	.L117-.L125
	.long	.L117-.L125
	.long	.L117-.L125
	.long	.L117-.L125
	.long	.L129-.L125
	.long	.L128-.L125
	.long	.L127-.L125
	.long	.L126-.L125
	.long	.L117-.L125
	.long	.L117-.L125
	.long	.L117-.L125
	.long	.L117-.L125
	.long	.L117-.L125
	.long	.L124-.L125
	.text
.L122:
	subl	$27, %eax
	cmpl	$30, %eax
	ja	.L117
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L132(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L132(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L132:
	.long	.L138-.L132
	.long	.L117-.L132
	.long	.L117-.L132
	.long	.L117-.L132
	.long	.L117-.L132
	.long	.L137-.L132
	.long	.L117-.L132
	.long	.L117-.L132
	.long	.L117-.L132
	.long	.L117-.L132
	.long	.L117-.L132
	.long	.L117-.L132
	.long	.L117-.L132
	.long	.L117-.L132
	.long	.L117-.L132
	.long	.L117-.L132
	.long	.L117-.L132
	.long	.L117-.L132
	.long	.L117-.L132
	.long	.L117-.L132
	.long	.L117-.L132
	.long	.L117-.L132
	.long	.L136-.L132
	.long	.L135-.L132
	.long	.L134-.L132
	.long	.L133-.L132
	.long	.L117-.L132
	.long	.L117-.L132
	.long	.L117-.L132
	.long	.L117-.L132
	.long	.L131-.L132
	.text
.L121:
	cmpl	$1073741912, %eax
	jg	.L117
	cmpl	$1073741883, %eax
	jge	.L139
	jmp	.L117
.L138:
	movl	$0, 66388(%rbp)
	jmp	.L123
.L129:
	movl	65952(%rbp), %eax
	movl	%eax, glob_vk_right(%rip)
	jmp	.L123
.L128:
	movl	65952(%rbp), %eax
	movl	%eax, glob_vk_left(%rip)
	jmp	.L123
.L126:
	movl	65952(%rbp), %eax
	movl	%eax, glob_vk_up(%rip)
	jmp	.L123
.L127:
	movl	65952(%rbp), %eax
	movl	%eax, glob_vk_down(%rip)
	jmp	.L123
.L137:
	movl	65952(%rbp), %eax
	movl	%eax, glob_vk_space(%rip)
	jmp	.L123
.L124:
	movl	65952(%rbp), %eax
	movl	%eax, glob_vk_enter(%rip)
	jmp	.L123
.L130:
	movl	65952(%rbp), %eax
	movl	%eax, glob_vk_f2(%rip)
	jmp	.L123
.L131:
	cmpl	$0, 66408(%rbp)
	jne	.L140
	movl	$1, 66408(%rbp)
	leaq	65680(%rbp), %rax
	movabsq	$3184362091757007472, %rdi
	movq	%rdi, (%rax)
	movabsq	$14685297085393969, %rdi
	movq	%rdi, 6(%rax)
	jmp	.L123
.L140:
	movl	$0, 66408(%rbp)
	jmp	.L123
.L136:
	cmpl	$1, 66408(%rbp)
	jne	.L198
	leaq	.LC34(%rip), %rax
	movq	%rax, 65896(%rbp)
	movq	$99, 65888(%rbp)
	movq	65888(%rbp), %rcx
	movq	65896(%rbp), %rdx
	leaq	65680(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	strncpy
	leaq	65680(%rbp), %rax
	movq	65888(%rbp), %rdx
	addq	%rdx, %rax
	movb	$0, (%rax)
	addl	$50, 66404(%rbp)
	jmp	.L198
.L135:
	cmpl	$1, 66408(%rbp)
	jne	.L199
	leaq	.LC35(%rip), %rax
	movq	%rax, 65912(%rbp)
	movq	$99, 65904(%rbp)
	movq	65904(%rbp), %rcx
	movq	65912(%rbp), %rdx
	leaq	65680(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	strncpy
	leaq	65680(%rbp), %rax
	movq	65904(%rbp), %rdx
	addq	%rdx, %rax
	movb	$0, (%rax)
	addl	$50, 66404(%rbp)
	jmp	.L199
.L134:
	cmpl	$1, 66408(%rbp)
	jne	.L200
	leaq	.LC36(%rip), %rax
	movq	%rax, 65928(%rbp)
	movq	$99, 65920(%rbp)
	movq	65920(%rbp), %rcx
	movq	65928(%rbp), %rdx
	leaq	65680(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	strncpy
	leaq	65680(%rbp), %rax
	movq	65920(%rbp), %rdx
	addq	%rdx, %rax
	movb	$0, (%rax)
	addl	$50, 66404(%rbp)
	jmp	.L200
.L133:
	cmpl	$1, 66408(%rbp)
	jne	.L201
	leaq	.LC37(%rip), %rax
	movq	%rax, 65944(%rbp)
	movq	$99, 65936(%rbp)
	movq	65936(%rbp), %rcx
	movq	65944(%rbp), %rdx
	leaq	65680(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	strncpy
	leaq	65680(%rbp), %rax
	movq	65936(%rbp), %rdx
	addq	%rdx, %rax
	movb	$0, (%rax)
	addl	$50, 66404(%rbp)
	jmp	.L201
.L198:
	nop
	jmp	.L117
.L199:
	nop
	jmp	.L117
.L200:
	nop
	jmp	.L117
.L201:
	nop
.L123:
	jmp	.L117
.L118:
	movl	$0, 65956(%rbp)
	movl	65844(%rbp), %eax
	cmpl	$32, %eax
	je	.L146
	cmpl	$32, %eax
	jl	.L202
	cmpl	$1073741912, %eax
	jg	.L202
	cmpl	$1073741883, %eax
	jl	.L202
	subl	$1073741883, %eax
	cmpl	$29, %eax
	ja	.L202
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L149(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L149(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L149:
	.long	.L154-.L149
	.long	.L202-.L149
	.long	.L202-.L149
	.long	.L202-.L149
	.long	.L202-.L149
	.long	.L202-.L149
	.long	.L202-.L149
	.long	.L202-.L149
	.long	.L202-.L149
	.long	.L202-.L149
	.long	.L202-.L149
	.long	.L202-.L149
	.long	.L202-.L149
	.long	.L202-.L149
	.long	.L202-.L149
	.long	.L202-.L149
	.long	.L202-.L149
	.long	.L202-.L149
	.long	.L202-.L149
	.long	.L202-.L149
	.long	.L153-.L149
	.long	.L152-.L149
	.long	.L151-.L149
	.long	.L150-.L149
	.long	.L202-.L149
	.long	.L202-.L149
	.long	.L202-.L149
	.long	.L202-.L149
	.long	.L202-.L149
	.long	.L148-.L149
	.text
.L153:
	movl	65956(%rbp), %eax
	movl	%eax, glob_vk_right(%rip)
	jmp	.L147
.L152:
	movl	65956(%rbp), %eax
	movl	%eax, glob_vk_left(%rip)
	jmp	.L147
.L150:
	movl	65956(%rbp), %eax
	movl	%eax, glob_vk_up(%rip)
	jmp	.L147
.L151:
	movl	65956(%rbp), %eax
	movl	%eax, glob_vk_down(%rip)
	jmp	.L147
.L146:
	movl	65956(%rbp), %eax
	movl	%eax, glob_vk_space(%rip)
	jmp	.L147
.L148:
	movl	65956(%rbp), %eax
	movl	%eax, glob_vk_enter(%rip)
	jmp	.L147
.L154:
	movl	65956(%rbp), %eax
	movl	%eax, glob_vk_f2(%rip)
	nop
.L147:
.L202:
	nop
.L117:
	leaq	65824(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_PollEvent
	testl	%eax, %eax
	jne	.L155
	movl	glob_vk_f2(%rip), %eax
	testl	%eax, %eax
	je	.L156
	leaq	.LC38(%rip), %rax
	movq	%rax, %rcx
	call	puts
	call	dev_tiled_to_leveldata
	leaq	.LC39(%rip), %rax
	movq	%rax, %rcx
	call	puts
.L156:
	movl	glob_vk_right(%rip), %eax
	testl	%eax, %eax
	je	.L157
	movb	$0, 112(%rbp)
	movl	96(%rbp), %edx
	movzbl	118(%rbp), %eax
	movzbl	%al, %eax
	addl	%edx, %eax
	movl	%eax, 96(%rbp)
.L157:
	movl	glob_vk_up(%rip), %eax
	testl	%eax, %eax
	je	.L158
	movb	$1, 112(%rbp)
	movl	100(%rbp), %edx
	movzbl	118(%rbp), %eax
	movzbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, 100(%rbp)
.L158:
	movl	glob_vk_left(%rip), %eax
	testl	%eax, %eax
	je	.L159
	movb	$2, 112(%rbp)
	movl	96(%rbp), %edx
	movzbl	118(%rbp), %eax
	movzbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, 96(%rbp)
.L159:
	movl	glob_vk_down(%rip), %eax
	testl	%eax, %eax
	je	.L160
	movb	$3, 112(%rbp)
	movl	100(%rbp), %edx
	movzbl	118(%rbp), %eax
	movzbl	%al, %eax
	addl	%edx, %eax
	movl	%eax, 100(%rbp)
.L160:
=======
	jmp	.L131
.L132:
	movl	68(%rbp), %ecx
	movq	72(%rbp), %rdx
	movl	66004(%rbp), %eax
	movl	%ecx, %r8d
	movl	%eax, %ecx
	call	SDL_QueueAudio
	movl	66004(%rbp), %eax
	movl	$0, %edx
	movl	%eax, %ecx
	call	SDL_PauseAudioDevice
	movl	$1, 66336(%rbp)
	movq	66208(%rbp), %rax
	leaq	.LC39(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 65992(%rbp)
	leaq	.LC40(%rip), %rax
	movq	%rax, 65984(%rbp)
	movl	$1, 66332(%rbp)
	leaq	.LC41(%rip), %rcx
	call	puts
	jmp	.L133
.L180:
	movl	65760(%rbp), %eax
	cmpl	$768, %eax
	je	.L135
	cmpl	$769, %eax
	je	.L136
	cmpl	$256, %eax
	jne	.L134
	movl	$0, 66332(%rbp)
	jmp	.L134
.L135:
	movl	$1, 65980(%rbp)
	movl	65780(%rbp), %eax
	cmpl	$54, %eax
	je	.L137
	cmpl	$54, %eax
	jg	.L138
	cmpl	$49, %eax
	je	.L139
	cmpl	$49, %eax
	jg	.L140
	cmpl	$32, %eax
	je	.L141
	cmpl	$48, %eax
	je	.L142
	cmpl	$27, %eax
	je	.L143
	jmp	.L134
.L140:
	cmpl	$51, %eax
	je	.L145
	cmpl	$51, %eax
	jl	.L146
	cmpl	$52, %eax
	je	.L147
	cmpl	$53, %eax
	je	.L148
	jmp	.L134
.L138:
	cmpl	$1073741903, %eax
	je	.L149
	cmpl	$1073741903, %eax
	jg	.L150
	cmpl	$56, %eax
	je	.L151
	cmpl	$56, %eax
	jl	.L152
	cmpl	$57, %eax
	je	.L153
	cmpl	$1073741883, %eax
	je	.L154
	jmp	.L134
.L150:
	cmpl	$1073741905, %eax
	je	.L155
	cmpl	$1073741905, %eax
	jl	.L156
	cmpl	$1073741906, %eax
	je	.L157
	cmpl	$1073741912, %eax
	je	.L158
	jmp	.L134
.L143:
	movl	$0, 66332(%rbp)
	jmp	.L144
.L149:
	movl	65980(%rbp), %eax
	movl	%eax, glob_vk_right(%rip)
	jmp	.L144
.L156:
	movl	65980(%rbp), %eax
	movl	%eax, glob_vk_left(%rip)
	jmp	.L144
.L157:
	movl	65980(%rbp), %eax
	movl	%eax, glob_vk_up(%rip)
	jmp	.L144
.L155:
	movl	65980(%rbp), %eax
	movl	%eax, glob_vk_down(%rip)
	jmp	.L144
.L141:
	movl	65980(%rbp), %eax
	movl	%eax, glob_vk_space(%rip)
	jmp	.L144
.L158:
	movl	65980(%rbp), %eax
	movl	%eax, glob_vk_enter(%rip)
	jmp	.L144
.L154:
	movl	65980(%rbp), %eax
	movl	%eax, glob_vk_f2(%rip)
	jmp	.L144
.L142:
	movl	65980(%rbp), %eax
	movl	%eax, glob_vk_0(%rip)
	jmp	.L144
.L139:
	movl	65980(%rbp), %eax
	movl	%eax, glob_vk_1(%rip)
	jmp	.L144
.L146:
	movl	65980(%rbp), %eax
	movl	%eax, glob_vk_2(%rip)
	jmp	.L144
.L145:
	movl	65980(%rbp), %eax
	movl	%eax, glob_vk_3(%rip)
	jmp	.L144
.L147:
	movl	65980(%rbp), %eax
	movl	%eax, glob_vk_4(%rip)
	jmp	.L144
.L148:
	movl	65980(%rbp), %eax
	movl	%eax, glob_vk_5(%rip)
	jmp	.L144
.L137:
	movl	65980(%rbp), %eax
	movl	%eax, glob_vk_6(%rip)
	jmp	.L144
.L152:
	movl	65980(%rbp), %eax
	movl	%eax, glob_vk_7(%rip)
	jmp	.L144
.L151:
	movl	65980(%rbp), %eax
	movl	%eax, glob_vk_8(%rip)
	jmp	.L144
.L153:
	movl	65980(%rbp), %eax
	movl	%eax, glob_vk_9(%rip)
	nop
.L144:
	jmp	.L134
.L136:
	movl	$0, 65976(%rbp)
	movl	65780(%rbp), %eax
	cmpl	$55, %eax
	je	.L159
	cmpl	$55, %eax
	jg	.L160
	cmpl	$50, %eax
	je	.L161
	cmpl	$50, %eax
	jg	.L162
	cmpl	$48, %eax
	je	.L163
	cmpl	$48, %eax
	jg	.L164
	cmpl	$32, %eax
	je	.L165
	jmp	.L231
.L162:
	cmpl	$52, %eax
	je	.L167
	cmpl	$52, %eax
	jl	.L168
	cmpl	$53, %eax
	je	.L169
	cmpl	$54, %eax
	je	.L170
	jmp	.L231
.L160:
	cmpl	$1073741903, %eax
	je	.L171
	cmpl	$1073741903, %eax
	jg	.L172
	cmpl	$57, %eax
	je	.L173
	cmpl	$57, %eax
	jl	.L174
	cmpl	$1073741883, %eax
	je	.L175
	jmp	.L231
.L172:
	cmpl	$1073741905, %eax
	je	.L176
	cmpl	$1073741905, %eax
	jl	.L177
	cmpl	$1073741906, %eax
	je	.L178
	cmpl	$1073741912, %eax
	je	.L179
	jmp	.L231
.L171:
	movl	65976(%rbp), %eax
	movl	%eax, glob_vk_right(%rip)
	jmp	.L166
.L177:
	movl	65976(%rbp), %eax
	movl	%eax, glob_vk_left(%rip)
	jmp	.L166
.L178:
	movl	65976(%rbp), %eax
	movl	%eax, glob_vk_up(%rip)
	jmp	.L166
.L176:
	movl	65976(%rbp), %eax
	movl	%eax, glob_vk_down(%rip)
	jmp	.L166
.L165:
	movl	65976(%rbp), %eax
	movl	%eax, glob_vk_space(%rip)
	jmp	.L166
.L179:
	movl	65976(%rbp), %eax
	movl	%eax, glob_vk_enter(%rip)
	jmp	.L166
.L175:
	movl	65976(%rbp), %eax
	movl	%eax, glob_vk_f2(%rip)
	jmp	.L166
.L163:
	movl	65976(%rbp), %eax
	movl	%eax, glob_vk_0(%rip)
	jmp	.L166
.L164:
	movl	65976(%rbp), %eax
	movl	%eax, glob_vk_1(%rip)
	jmp	.L166
.L161:
	movl	65976(%rbp), %eax
	movl	%eax, glob_vk_2(%rip)
	jmp	.L166
.L168:
	movl	65976(%rbp), %eax
	movl	%eax, glob_vk_3(%rip)
	jmp	.L166
.L167:
	movl	65976(%rbp), %eax
	movl	%eax, glob_vk_4(%rip)
	jmp	.L166
.L169:
	movl	65976(%rbp), %eax
	movl	%eax, glob_vk_5(%rip)
	jmp	.L166
.L170:
	movl	65976(%rbp), %eax
	movl	%eax, glob_vk_6(%rip)
	jmp	.L166
.L159:
	movl	65976(%rbp), %eax
	movl	%eax, glob_vk_7(%rip)
	jmp	.L166
.L174:
	movl	65976(%rbp), %eax
	movl	%eax, glob_vk_8(%rip)
	jmp	.L166
.L173:
	movl	65976(%rbp), %eax
	movl	%eax, glob_vk_9(%rip)
	nop
.L166:
.L231:
	nop
.L134:
	leaq	65760(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_PollEvent
	testl	%eax, %eax
	jne	.L180
	movl	glob_vk_f2(%rip), %eax
	testl	%eax, %eax
	je	.L181
	leaq	.LC42(%rip), %rcx
	call	puts
	call	dev_tiled_to_leveldata
	leaq	.LC43(%rip), %rcx
	call	puts
.L181:
	movl	glob_vk_9(%rip), %eax
	testl	%eax, %eax
	je	.L182
	movl	$0, glob_vk_9(%rip)
	cmpl	$0, 66360(%rbp)
	jne	.L183
	movl	$1, 66360(%rbp)
	leaq	65712(%rbp), %rax
	movabsq	$3184362091757007472, %rdi
	movq	%rdi, (%rax)
	movl	$741551154, 8(%rax)
	movw	$52, 12(%rax)
	jmp	.L182
.L183:
	movl	$0, 66360(%rbp)
.L182:
	movl	glob_vk_1(%rip), %eax
	testl	%eax, %eax
	je	.L184
	movl	$0, glob_vk_1(%rip)
	cmpl	$1, 66360(%rbp)
	jne	.L184
	leaq	65712(%rbp), %rax
	movabsq	$8315178112915959673, %rdi
	movq	%rdi, (%rax)
	movl	$543450483, 8(%rax)
	movw	$49, 12(%rax)
	addl	$10, 66364(%rbp)
.L184:
	movl	glob_vk_2(%rip), %eax
	testl	%eax, %eax
	je	.L185
	movl	$0, glob_vk_2(%rip)
	cmpl	$1, 66360(%rbp)
	jne	.L185
	leaq	65712(%rbp), %rax
	movabsq	$8315178112915959673, %rdi
	movq	%rdi, (%rax)
	movl	$543450483, 8(%rax)
	movw	$50, 12(%rax)
	addl	$20, 66364(%rbp)
.L185:
	movl	glob_vk_3(%rip), %eax
	testl	%eax, %eax
	je	.L186
	movl	$0, glob_vk_3(%rip)
	cmpl	$1, 66360(%rbp)
	jne	.L186
	leaq	65712(%rbp), %rax
	movabsq	$8315178112915959673, %rdi
	movq	%rdi, (%rax)
	movl	$543450483, 8(%rax)
	movw	$51, 12(%rax)
	addl	$30, 66364(%rbp)
.L186:
	movl	glob_vk_4(%rip), %eax
	testl	%eax, %eax
	je	.L187
	movl	$0, glob_vk_4(%rip)
	cmpl	$1, 66360(%rbp)
	jne	.L187
	leaq	65712(%rbp), %rax
	movabsq	$8315178112915959673, %rbx
	movq	%rbx, (%rax)
	movl	$543450483, 8(%rax)
	movw	$52, 12(%rax)
	addl	$40, 66364(%rbp)
.L187:
	movl	glob_vk_right(%rip), %eax
	testl	%eax, %eax
	je	.L188
	movb	$0, 128(%rbp)
	movl	112(%rbp), %edx
	movzbl	134(%rbp), %eax
	movzbl	%al, %eax
	addl	%edx, %eax
	movl	%eax, 112(%rbp)
.L188:
	movl	glob_vk_up(%rip), %eax
	testl	%eax, %eax
	je	.L189
	movb	$1, 128(%rbp)
	movl	116(%rbp), %edx
	movzbl	134(%rbp), %eax
	movzbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, 116(%rbp)
.L189:
	movl	glob_vk_left(%rip), %eax
	testl	%eax, %eax
	je	.L190
	movb	$2, 128(%rbp)
	movl	112(%rbp), %edx
	movzbl	134(%rbp), %eax
	movzbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, 112(%rbp)
.L190:
	movl	glob_vk_down(%rip), %eax
	testl	%eax, %eax
	je	.L191
	movb	$3, 128(%rbp)
	movl	116(%rbp), %edx
	movzbl	134(%rbp), %eax
	movzbl	%al, %eax
	addl	%edx, %eax
	movl	%eax, 116(%rbp)
.L191:
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	movl	glob_vk_right(%rip), %edx
	movl	glob_vk_left(%rip), %eax
	orl	%eax, %edx
	movl	glob_vk_up(%rip), %eax
	orl	%eax, %edx
	movl	glob_vk_down(%rip), %eax
	orl	%edx, %eax
	testl	%eax, %eax
<<<<<<< HEAD
	je	.L161
	movzbl	113(%rbp), %edx
	movzbl	114(%rbp), %eax
=======
	je	.L192
	movzbl	129(%rbp), %edx
	movzbl	130(%rbp), %eax
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	addl	%edx, %eax
	movb	%al, 129(%rbp)
	movzbl	132(%rbp), %eax
	movzbl	129(%rbp), %ecx
	movzbl	131(%rbp), %edx
	cmpb	%dl, %cl
	setnb	%dl
	addl	%edx, %eax
	movb	%al, 132(%rbp)
	movzbl	129(%rbp), %eax
	movzbl	131(%rbp), %edx
	movzbl	%al, %eax
	divb	%dl
	movzbl	%ah, %eax
	movb	%al, 129(%rbp)
	movzbl	132(%rbp), %eax
	movzbl	133(%rbp), %edx
	movzbl	%al, %eax
	divb	%dl
	movzbl	%ah, %eax
<<<<<<< HEAD
	movb	%al, 116(%rbp)
	movl	66288(%rbp), %eax
	imull	66284(%rbp), %eax
	movl	66300(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, 66096(%rbp)
	movl	66312(%rbp), %eax
	movl	%eax, 66092(%rbp)
	movl	66316(%rbp), %eax
	movl	%eax, 66088(%rbp)
	movl	66288(%rbp), %eax
	imull	66280(%rbp), %eax
	movl	66296(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, 66084(%rbp)
	movl	$0, 66080(%rbp)
	movl	96(%rbp), %eax
	cmpl	%eax, 66096(%rbp)
	jl	.L162
	movl	100(%rbp), %eax
	cmpl	%eax, 66084(%rbp)
	jl	.L162
	movl	96(%rbp), %eax
	cmpl	%eax, 66088(%rbp)
	jg	.L162
	movl	100(%rbp), %eax
	cmpl	%eax, 66092(%rbp)
	jle	.L163
.L162:
	movl	$1, %eax
	jmp	.L164
.L163:
	movl	$0, %eax
.L164:
	movl	%eax, 66080(%rbp)
	movl	96(%rbp), %eax
	cmpl	%eax, 66096(%rbp)
	jge	.L165
	movl	66088(%rbp), %eax
	movl	%eax, 96(%rbp)
	addl	$1, 66400(%rbp)
.L165:
	movl	100(%rbp), %eax
	cmpl	%eax, 66092(%rbp)
	jle	.L166
	movl	66084(%rbp), %eax
	movl	%eax, 100(%rbp)
	pxor	%xmm3, %xmm3
	cvtsi2sdl	66144(%rbp), %xmm3
	movq	%xmm3, %rax
	movq	%rax, %xmm0
	call	sqrt
	cvttsd2sil	%xmm0, %eax
	subl	%eax, 66400(%rbp)
.L166:
	movl	96(%rbp), %eax
	cmpl	%eax, 66088(%rbp)
	jle	.L167
	movl	66096(%rbp), %eax
	movl	%eax, 96(%rbp)
	subl	$1, 66400(%rbp)
.L167:
	movl	100(%rbp), %eax
	cmpl	%eax, 66084(%rbp)
	jge	.L168
	movl	66092(%rbp), %eax
	movl	%eax, 100(%rbp)
	pxor	%xmm4, %xmm4
	cvtsi2sdl	66144(%rbp), %xmm4
	movq	%xmm4, %rax
	movq	%rax, %xmm0
	call	sqrt
	cvttsd2sil	%xmm0, %eax
	addl	%eax, 66400(%rbp)
.L168:
	cmpl	$0, 66080(%rbp)
	je	.L169
	movl	66144(%rbp), %eax
	addl	%eax, 66400(%rbp)
	movl	66400(%rbp), %eax
	cltd
	idivl	66144(%rbp)
	movl	%edx, 66400(%rbp)
	jmp	.L169
.L161:
	movb	$0, 113(%rbp)
	movb	$0, 116(%rbp)
.L169:
=======
	movb	%al, 132(%rbp)
	movl	66240(%rbp), %eax
	imull	66236(%rbp), %eax
	movl	66252(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, 65972(%rbp)
	movl	66264(%rbp), %eax
	movl	%eax, 65968(%rbp)
	movl	66268(%rbp), %eax
	movl	%eax, 65964(%rbp)
	movl	66240(%rbp), %eax
	imull	66232(%rbp), %eax
	movl	66248(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, 65960(%rbp)
	movl	$0, 65956(%rbp)
	movl	112(%rbp), %eax
	cmpl	%eax, 65972(%rbp)
	jl	.L193
	movl	116(%rbp), %eax
	cmpl	%eax, 65960(%rbp)
	jl	.L193
	movl	112(%rbp), %eax
	cmpl	%eax, 65964(%rbp)
	jg	.L193
	movl	116(%rbp), %eax
	cmpl	%eax, 65968(%rbp)
	jle	.L194
.L193:
	movl	$1, %eax
	jmp	.L195
.L194:
	movl	$0, %eax
.L195:
	movl	%eax, 65956(%rbp)
	movl	112(%rbp), %eax
	cmpl	%eax, 65972(%rbp)
	jge	.L196
	movl	65964(%rbp), %eax
	movl	%eax, 112(%rbp)
	addl	$1, 66344(%rbp)
.L196:
	movl	116(%rbp), %eax
	cmpl	%eax, 65968(%rbp)
	jle	.L197
	movl	65960(%rbp), %eax
	movl	%eax, 116(%rbp)
	cvtsi2sd	66032(%rbp), %xmm0
	call	sqrt
	cvttsd2si	%xmm0, %eax
	subl	%eax, 66344(%rbp)
.L197:
	movl	112(%rbp), %eax
	cmpl	%eax, 65964(%rbp)
	jle	.L198
	movl	65972(%rbp), %eax
	movl	%eax, 112(%rbp)
	subl	$1, 66344(%rbp)
.L198:
	movl	116(%rbp), %eax
	cmpl	%eax, 65960(%rbp)
	jge	.L199
	movl	65968(%rbp), %eax
	movl	%eax, 116(%rbp)
	cvtsi2sd	66032(%rbp), %xmm0
	call	sqrt
	cvttsd2si	%xmm0, %eax
	addl	%eax, 66344(%rbp)
.L199:
	cmpl	$0, 65956(%rbp)
	je	.L201
	movl	66032(%rbp), %eax
	addl	%eax, 66344(%rbp)
	movl	66344(%rbp), %eax
	cltd
	idivl	66032(%rbp)
	movl	%edx, 66344(%rbp)
	leaq	144(%rbp), %rax
	movl	66344(%rbp), %ecx
	movq	%rax, %rdx
	call	level_get_name
	jmp	.L201
.L192:
	movb	$0, 129(%rbp)
	movb	$0, 132(%rbp)
.L201:
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	movl	glob_vk_space(%rip), %edx
	movl	glob_vk_enter(%rip), %eax
	orl	%edx, %eax
	testl	%eax, %eax
<<<<<<< HEAD
	je	.L170
	movl	$0, 66392(%rbp)
.L170:
	movl	96(%rbp), %eax
	movl	%eax, 104(%rbp)
	movl	100(%rbp), %eax
	movl	%eax, 108(%rbp)
	movl	$0, %edx
	movq	66256(%rbp), %rax
	movq	%rax, %rcx
	call	draw_clear
	movl	$16777215, %edx
	movq	66256(%rbp), %rax
	movq	%rax, %rcx
	call	draw_set_color
	movl	$33023, %edx
	movl	66316(%rbp), %ecx
	movq	66256(%rbp), %rax
	movl	%edx, 40(%rsp)
	movl	66320(%rbp), %edx
=======
	je	.L202
	movl	$0, 66336(%rbp)
.L202:
	movl	112(%rbp), %eax
	movl	%eax, 120(%rbp)
	movl	116(%rbp), %eax
	movl	%eax, 124(%rbp)
	movl	$0, 66328(%rbp)
	jmp	.L203
.L207:
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	66328(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	12(%rax), %eax
	testl	%eax, %eax
	je	.L204
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	66328(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm1
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	66328(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movss	8(%rax), %xmm0
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	66328(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	addss	%xmm1, %xmm0
	movss	%xmm0, 4(%rax)
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	66328(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm0
	cvtsi2ss	66272(%rbp), %xmm1
	comiss	%xmm1, %xmm0
	jbe	.L204
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
	jg	.L206
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	66328(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	$0, 12(%rax)
	jmp	.L204
.L206:
	movl	66272(%rbp), %ecx
	movl	66276(%rbp), %edx
	movl	66328(%rbp), %eax
	movl	%ecx, %r8d
	movl	%eax, %ecx
	call	createWaterParticle
.L204:
	addl	$1, 66328(%rbp)
.L203:
	movl	$100, %eax
	cmpl	%eax, 66328(%rbp)
	jl	.L207
	movl	66076(%rbp), %eax
	addl	%eax, 66348(%rbp)
	movl	66348(%rbp), %eax
	cmpl	66080(%rbp), %eax
	setge	%al
	movzbl	%al, %eax
	addl	%eax, 66352(%rbp)
	movl	66352(%rbp), %eax
	cltd
	idivl	66084(%rbp)
	movl	%edx, 66352(%rbp)
	movl	66348(%rbp), %eax
	cltd
	idivl	66080(%rbp)
	movl	%edx, 66348(%rbp)
	movl	$0, %edx
	movq	66208(%rbp), %rax
	movq	%rax, %rcx
	call	draw_clear
	movl	$16777215, %edx
	movq	66208(%rbp), %rax
	movq	%rax, %rcx
	call	draw_set_color
	movl	$33023, %edx
	movl	66268(%rbp), %ecx
	movq	66208(%rbp), %rax
	movl	%edx, 40(%rsp)
	movl	66272(%rbp), %edx
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	movl	%edx, 32(%rsp)
	movl	%ecx, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	draw_rectangle_color
<<<<<<< HEAD
	movl	$8388863, %ecx
	movl	66324(%rbp), %eax
	subl	66316(%rbp), %eax
	movl	%eax, %r8d
	movl	66316(%rbp), %edx
	movq	66256(%rbp), %rax
	movl	%ecx, 40(%rsp)
	movl	66320(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movl	%r8d, %r9d
=======
	movl	$8388863, %r8d
	movl	66276(%rbp), %eax
	subl	66268(%rbp), %eax
	movl	%eax, %ecx
	movl	66268(%rbp), %edx
	movq	66208(%rbp), %rax
	movl	%r8d, 40(%rsp)
	movl	66272(%rbp), %r8d
	movl	%r8d, 32(%rsp)
	movl	%ecx, %r9d
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	movl	$0, %r8d
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	$33023, %edx
<<<<<<< HEAD
	movl	66324(%rbp), %eax
	subl	66316(%rbp), %eax
	movl	66324(%rbp), %r8d
	movq	66256(%rbp), %rcx
	movl	%edx, 40(%rsp)
	movl	66320(%rbp), %edx
=======
	movl	66276(%rbp), %eax
	subl	66268(%rbp), %eax
	movl	66276(%rbp), %r8d
	movq	66208(%rbp), %rcx
	movl	%edx, 40(%rsp)
	movl	66272(%rbp), %edx
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	movl	%edx, 32(%rsp)
	movl	%r8d, %r9d
	movl	$0, %r8d
	movl	%eax, %edx
	call	draw_rectangle_color
<<<<<<< HEAD
	movl	$0, 66076(%rbp)
	movl	$0, 66072(%rbp)
	cmpl	$0, 66392(%rbp)
	jne	.L171
	movl	66280(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %ecx
	movl	66284(%rbp), %eax
	leal	0(,%rax,8), %r9d
	movl	66072(%rbp), %r10d
	movl	66076(%rbp), %edx
	movq	66256(%rbp), %rax
	movl	66152(%rbp), %r8d
	movl	%r8d, 64(%rsp)
	movl	66156(%rbp), %r8d
	movl	%r8d, 56(%rsp)
	leaq	.LC40(%rip), %r8
	movq	%r8, 48(%rsp)
	movq	66160(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%ecx, 32(%rsp)
=======
	movl	66236(%rbp), %eax
	movl	%eax, 65952(%rbp)
	movl	$0, 65948(%rbp)
	cmpl	$0, 66336(%rbp)
	jne	.L208
	movl	66096(%rbp), %eax
	imull	66232(%rbp), %eax
	movl	66100(%rbp), %edx
	imull	66236(%rbp), %edx
	movl	%edx, %r8d
	movl	65948(%rbp), %r10d
	movl	65952(%rbp), %edx
	movq	66208(%rbp), %rcx
	movl	66096(%rbp), %r9d
	movl	%r9d, 64(%rsp)
	movl	66100(%rbp), %r9d
	movl	%r9d, 56(%rsp)
	leaq	.LC44(%rip), %r9
	movq	%r9, 48(%rsp)
	movq	66104(%rbp), %r9
	movq	%r9, 40(%rsp)
	movl	%eax, 32(%rsp)
	movl	%r8d, %r9d
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	movl	%r10d, %r8d
	call	draw_text
<<<<<<< HEAD
.L171:
	movl	66300(%rbp), %eax
	movl	%eax, 66076(%rbp)
	movl	$0, 66072(%rbp)
	cmpl	$0, 66392(%rbp)
	jne	.L172
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	.LC41(%rip), %rax
	movq	%rax, 66064(%rbp)
	movq	66064(%rbp), %rax
=======
.L208:
	movl	66236(%rbp), %edx
	movl	66252(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 65952(%rbp)
	movl	$0, 65948(%rbp)
	cmpl	$0, 66336(%rbp)
	jne	.L209
	movq	%rsp, %rax
	movq	%rax, -40(%rbp)
	leaq	.LC45(%rip), %rax
	movq	%rax, 65936(%rbp)
	movq	65936(%rbp), %rax
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	subq	$1, %rdx
<<<<<<< HEAD
	movq	%rdx, 66056(%rbp)
=======
	movq	%rdx, 65928(%rbp)
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
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
<<<<<<< HEAD
	movq	%rax, 66048(%rbp)
	movq	66064(%rbp), %rdx
	movq	66048(%rbp), %rax
	movq	%rax, %rcx
	call	strcpy
	movl	66400(%rbp), %eax
	movb	%al, 66047(%rbp)
	movzbl	66047(%rbp), %eax
	movl	$41, %edx
	mulb	%dl
=======
	movq	%rax, 65920(%rbp)
	movq	65920(%rbp), %rax
	movq	65936(%rbp), %rdx
	movq	%rax, %rcx
	call	strcpy
	movl	66344(%rbp), %eax
	movb	%al, 65919(%rbp)
	movzbl	65919(%rbp), %eax
	movzbl	%al, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
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
<<<<<<< HEAD
	movq	66048(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC42(%rip), %rax
	movq	%rax, %rcx
	call	string_pos
	movl	%ebx, %ecx
	movq	66048(%rbp), %rdx
	cltq
	movb	%cl, (%rdx,%rax)
	movzbl	66047(%rbp), %eax
	movl	$-51, %edx
	mulb	%dl
=======
	movq	65920(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC46(%rip), %rcx
	call	string_pos
	movl	%ebx, %ecx
	movq	65920(%rbp), %rdx
	cltq
	movb	%cl, (%rdx,%rax)
	movzbl	65919(%rbp), %eax
	movzbl	%al, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	leal	0(,%rax,4), %edx
	addl	%edx, %eax
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
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
<<<<<<< HEAD
	movq	66048(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC43(%rip), %rax
	movq	%rax, %rcx
	call	string_pos
	movl	%ebx, %ecx
	movq	66048(%rbp), %rdx
	cltq
	movb	%cl, (%rdx,%rax)
	movzbl	66047(%rbp), %ecx
	movl	$-51, %edx
=======
	movq	65920(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC47(%rip), %rcx
	call	string_pos
	movl	%ebx, %ecx
	movq	65920(%rbp), %rdx
	cltq
	movb	%cl, (%rdx,%rax)
	movzbl	65919(%rbp), %ecx
	movzbl	%cl, %edx
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
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
<<<<<<< HEAD
	movq	66048(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC44(%rip), %rax
	movq	%rax, %rcx
	call	string_pos
	movl	%ebx, %ecx
	movq	66048(%rbp), %rdx
	cltq
	movb	%cl, (%rdx,%rax)
	movl	66280(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %ecx
	movl	66284(%rbp), %eax
	leal	0(,%rax,8), %r9d
	movl	66072(%rbp), %r10d
	movl	66076(%rbp), %edx
	movq	66256(%rbp), %rax
	movl	66152(%rbp), %r8d
	movl	%r8d, 64(%rsp)
	movl	66156(%rbp), %r8d
	movl	%r8d, 56(%rsp)
	movq	66048(%rbp), %r8
	movq	%r8, 48(%rsp)
	movq	66160(%rbp), %r8
	movq	%r8, 40(%rsp)
=======
	movq	65920(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC48(%rip), %rcx
	call	string_pos
	movl	%ebx, %ecx
	movq	65920(%rbp), %rdx
	cltq
	movb	%cl, (%rdx,%rax)
	movq	65920(%rbp), %r9
	movl	66096(%rbp), %eax
	imull	66232(%rbp), %eax
	movl	66100(%rbp), %edx
	imull	66236(%rbp), %edx
	movl	%edx, %r8d
	movl	65948(%rbp), %r11d
	movl	65952(%rbp), %edx
	movq	66208(%rbp), %rcx
	movl	66096(%rbp), %r10d
	movl	%r10d, 64(%rsp)
	movl	66100(%rbp), %r10d
	movl	%r10d, 56(%rsp)
	movq	%r9, 48(%rsp)
	movq	66104(%rbp), %r9
	movq	%r9, 40(%rsp)
	movl	%eax, 32(%rsp)
	movl	%r8d, %r9d
	movl	%r11d, %r8d
	call	draw_text
	movl	66096(%rbp), %eax
	imull	66232(%rbp), %eax
	movl	66100(%rbp), %edx
	imull	66236(%rbp), %edx
	movl	%edx, %r8d
	movl	66096(%rbp), %edx
	imull	66232(%rbp), %edx
	movl	65948(%rbp), %ecx
	leal	(%rdx,%rcx), %r11d
	movl	65952(%rbp), %r10d
	movq	66208(%rbp), %rcx
	movl	66096(%rbp), %edx
	movl	%edx, 64(%rsp)
	movl	66100(%rbp), %edx
	movl	%edx, 56(%rsp)
	leaq	144(%rbp), %rdx
	movq	%rdx, 48(%rsp)
	movq	66104(%rbp), %rdx
	movq	%rdx, 40(%rsp)
	movl	%eax, 32(%rsp)
	movl	%r8d, %r9d
	movl	%r11d, %r8d
	movl	%r10d, %edx
	call	draw_text
	movl	65952(%rbp), %eax
	movl	%eax, 65912(%rbp)
	movl	66096(%rbp), %eax
	imull	66232(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	65948(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 65908(%rbp)
	movl	65912(%rbp), %eax
	addl	$256, %eax
	movl	%eax, 65904(%rbp)
	movl	65908(%rbp), %eax
	addl	$256, %eax
	movl	%eax, 65900(%rbp)
	movl	65904(%rbp), %r9d
	movl	65908(%rbp), %r8d
	movl	65912(%rbp), %edx
	movq	66208(%rbp), %rax
	movq	66016(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	65900(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_image
	movzbl	65919(%rbp), %eax
	movl	$0, %r8d
	movl	$4, %edx
	movl	%eax, %ecx
	call	BGG
	cvtsi2sd	%eax, %xmm0
	movsd	.LC49(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	cvtsi2sd	65904(%rbp), %xmm1
	cvtsi2sd	65912(%rbp), %xmm0
	call	lerp
	cvttsd2si	%xmm0, %eax
	movl	%eax, 65896(%rbp)
	movl	$255, %ecx
	movl	65896(%rbp), %eax
	leal	1(%rax), %r9d
	movl	65896(%rbp), %eax
	leal	-1(%rax), %edx
	movl	65908(%rbp), %r8d
	movq	66208(%rbp), %rax
	movl	%ecx, 40(%rsp)
	movl	65900(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_rectangle_color
	movzbl	65919(%rbp), %eax
	movl	$1, %r8d
	movl	$4, %edx
	movl	%eax, %ecx
	call	BGG
	cvtsi2sd	%eax, %xmm0
	movsd	.LC49(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	cvtsi2sd	65900(%rbp), %xmm1
	cvtsi2sd	65908(%rbp), %xmm0
	call	lerp
	cvttsd2si	%xmm0, %eax
	movl	%eax, 65892(%rbp)
	movl	$255, %r10d
	movl	65892(%rbp), %eax
	leal	1(%rax), %ecx
	movl	65892(%rbp), %eax
	leal	-1(%rax), %r8d
	movl	65904(%rbp), %r9d
	movl	65912(%rbp), %edx
	movq	66208(%rbp), %rax
	movl	%r10d, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	$255, %edi
	movzbl	65919(%rbp), %eax
	movl	$1, %r8d
	movl	$4, %edx
	movl	%eax, %ecx
	call	BGG
	addl	$1, %eax
	cvtsi2sd	%eax, %xmm0
	movsd	.LC49(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	cvtsi2sd	65900(%rbp), %xmm1
	cvtsi2sd	65908(%rbp), %xmm0
	call	lerp
	cvttsd2si	%xmm0, %ebx
	movzbl	65919(%rbp), %eax
	movl	$0, %r8d
	movl	$4, %edx
	movl	%eax, %ecx
	call	BGG
	addl	$1, %eax
	cvtsi2sd	%eax, %xmm0
	movsd	.LC49(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	cvtsi2sd	65904(%rbp), %xmm1
	cvtsi2sd	65912(%rbp), %xmm0
	call	lerp
	cvttsd2si	%xmm0, %ecx
	movl	65892(%rbp), %r8d
	movl	65896(%rbp), %edx
	movq	66208(%rbp), %rax
	movl	%edi, 40(%rsp)
	movl	%ebx, 32(%rsp)
	movl	%ecx, %r9d
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	$0, 66324(%rbp)
	movl	66232(%rbp), %eax
	sall	$5, %eax
	movl	%eax, %edx
	movl	65900(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 65888(%rbp)
	movl	$0, 66320(%rbp)
	jmp	.L210
.L213:
	movl	66352(%rbp), %ecx
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
	movl	66352(%rbp), %ecx
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
	movl	66352(%rbp), %r9d
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
	movl	66352(%rbp), %r9d
	movl	$458129845, %edx
	movl	%r9d, %eax
	imull	%edx
	sarl	$6, %edx
	movl	%r9d, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	66320(%rbp), %eax
	movl	%r8d, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	$737, %r9d
	movl	%r10d, %r8d
	movl	%eax, %ecx
	call	mux_int
	movl	%eax, 65884(%rbp)
	cmpl	$2, 66320(%rbp)
	je	.L211
	movl	65884(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %ecx
	movl	66320(%rbp), %eax
	addl	$1, %eax
	imull	66236(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	65952(%rbp), %eax
	addl	%eax, %edx
	movl	66324(%rbp), %eax
	leal	(%rdx,%rax), %r9d
	movl	66320(%rbp), %eax
	imull	66236(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	65952(%rbp), %eax
	addl	%eax, %edx
	movl	66324(%rbp), %eax
	addl	%eax, %edx
	movl	65900(%rbp), %r8d
	movq	66208(%rbp), %rax
	movl	$32, 72(%rsp)
	movl	$16, 64(%rsp)
	movl	$0, 56(%rsp)
	movl	%ecx, 48(%rsp)
	movq	66088(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	65888(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_image_part
	movl	66236(%rbp), %eax
	addl	%eax, 66324(%rbp)
	jmp	.L212
.L211:
	movl	66236(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	65952(%rbp), %eax
	leal	(%rdx,%rax), %r9d
	movl	66236(%rbp), %eax
	sall	$5, %eax
	movl	%eax, %edx
	movl	65952(%rbp), %eax
	addl	%eax, %edx
	movl	65900(%rbp), %r8d
	movq	66208(%rbp), %rax
	movl	66096(%rbp), %ecx
	movl	%ecx, 64(%rsp)
	movl	66100(%rbp), %ecx
	movl	%ecx, 56(%rsp)
	leaq	.LC50(%rip), %rcx
	movq	%rcx, 48(%rsp)
	movq	66104(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	65888(%rbp), %ecx
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_text
<<<<<<< HEAD
	movq	%rdi, %rsp
.L172:
	movl	$0, 66384(%rbp)
	jmp	.L173
.L182:
	movl	$0, 66380(%rbp)
	jmp	.L174
.L181:
	movl	66384(%rbp), %eax
	imull	66292(%rbp), %eax
	movl	66380(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65988(%rbp)
	movl	66380(%rbp), %eax
	imull	66284(%rbp), %eax
	imull	66288(%rbp), %eax
	movl	66316(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65984(%rbp)
	movl	66384(%rbp), %eax
	imull	66280(%rbp), %eax
	imull	66288(%rbp), %eax
	movl	66312(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65980(%rbp)
	movl	66380(%rbp), %eax
	addl	$1, %eax
	imull	66284(%rbp), %eax
	imull	66288(%rbp), %eax
	movl	66316(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65976(%rbp)
	movl	66384(%rbp), %eax
	addl	$1, %eax
	imull	66280(%rbp), %eax
	imull	66288(%rbp), %eax
	movl	66312(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65972(%rbp)
	movl	$16711680, %r9d
	movl	$65280, %r8d
	movl	$255, %r10d
	movl	65988(%rbp), %ecx
	movslq	%ecx, %rax
	imulq	$1431655766, %rax, %rax
	shrq	$32, %rax
	movl	%ecx, %edx
	sarl	$31, %edx
	subl	%edx, %eax
=======
.L212:
	addl	$1, 66320(%rbp)
.L210:
	cmpl	$4, 66320(%rbp)
	jle	.L213
	movl	$0, 66316(%rbp)
	movl	66352(%rbp), %eax
	movl	$59, 32(%rsp)
	movl	$5, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	%eax, %ecx
	call	clock_is_between
	testl	%eax, %eax
	je	.L214
	movl	$0, 66316(%rbp)
.L214:
	movl	66352(%rbp), %eax
	movl	$59, 32(%rsp)
	movl	$11, %r9d
	movl	$0, %r8d
	movl	$6, %edx
	movl	%eax, %ecx
	call	clock_is_between
	testl	%eax, %eax
	je	.L215
	movl	$1, 66316(%rbp)
.L215:
	movl	66352(%rbp), %eax
	movl	$59, 32(%rsp)
	movl	$17, %r9d
	movl	$0, %r8d
	movl	$12, %edx
	movl	%eax, %ecx
	call	clock_is_between
	testl	%eax, %eax
	je	.L216
	movl	$2, 66316(%rbp)
.L216:
	movl	66352(%rbp), %eax
	movl	$59, 32(%rsp)
	movl	$23, %r9d
	movl	$0, %r8d
	movl	$18, %edx
	movl	%eax, %ecx
	call	clock_is_between
	testl	%eax, %eax
	je	.L217
	movl	$3, 66316(%rbp)
.L217:
	movq	66048(%rbp), %r9
	movq	66056(%rbp), %r8
	movq	66064(%rbp), %rdx
	movl	66316(%rbp), %eax
	movq	66040(%rbp), %rcx
	movq	%rcx, 32(%rsp)
	movl	%eax, %ecx
	call	mux_str
	movq	%rax, %r11
	movl	66096(%rbp), %eax
	imull	66232(%rbp), %eax
	movl	66100(%rbp), %edx
	imull	66236(%rbp), %edx
	movl	%edx, %r8d
	movl	65888(%rbp), %ecx
	movl	66232(%rbp), %edx
	leal	(%rcx,%rdx), %r10d
	movl	65952(%rbp), %edx
	movq	66208(%rbp), %rcx
	movl	66096(%rbp), %r9d
	movl	%r9d, 64(%rsp)
	movl	66100(%rbp), %r9d
	movl	%r9d, 56(%rsp)
	movq	%r11, 48(%rsp)
	movq	66104(%rbp), %r9
	movq	%r9, 40(%rsp)
	movl	%eax, 32(%rsp)
	movl	%r8d, %r9d
	movl	%r10d, %r8d
	call	draw_text
	movq	-40(%rbp), %rsp
.L209:
	movl	66240(%rbp), %eax
	movl	%eax, 65880(%rbp)
	movl	$0, 66312(%rbp)
	jmp	.L218
.L221:
	movl	$0, 66308(%rbp)
	jmp	.L219
.L220:
	movl	66312(%rbp), %eax
	imull	66244(%rbp), %eax
	movl	66308(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65876(%rbp)
	movl	66308(%rbp), %eax
	imull	66236(%rbp), %eax
	imull	66240(%rbp), %eax
	movl	66268(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65872(%rbp)
	movl	66312(%rbp), %eax
	imull	66232(%rbp), %eax
	imull	66240(%rbp), %eax
	movl	66264(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65868(%rbp)
	movl	66308(%rbp), %eax
	addl	$1, %eax
	imull	66236(%rbp), %eax
	imull	66240(%rbp), %eax
	movl	66268(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65864(%rbp)
	movl	66312(%rbp), %eax
	addl	$1, %eax
	imull	66232(%rbp), %eax
	imull	66240(%rbp), %eax
	movl	66264(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65860(%rbp)
	movl	$16711680, %r9d
	movl	$65280, %r8d
	movl	$255, %r10d
	movl	65876(%rbp), %ecx
	movl	$1431655766, %edx
	movl	%ecx, %eax
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	movl	%eax, %edx
	addl	%edx, %edx
	addl	%eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	movl	%r10d, %edx
	movl	%eax, %ecx
	call	mux_int
<<<<<<< HEAD
	movl	%eax, 65968(%rbp)
	movl	65976(%rbp), %r9d
	movl	65980(%rbp), %r8d
	movl	65984(%rbp), %edx
	movq	66256(%rbp), %rax
	movl	65968(%rbp), %ecx
	movl	%ecx, 40(%rsp)
	movl	65972(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	66148(%rbp), %eax
	imull	66400(%rbp), %eax
	movl	65988(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65964(%rbp)
	movl	65964(%rbp), %eax
=======
	movl	%eax, 65856(%rbp)
	movl	65864(%rbp), %r9d
	movl	65868(%rbp), %r8d
	movl	65872(%rbp), %edx
	movq	66208(%rbp), %rax
	movl	65856(%rbp), %ecx
	movl	%ecx, 40(%rsp)
	movl	65860(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	66036(%rbp), %eax
	imull	66344(%rbp), %eax
	movl	65876(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65852(%rbp)
	movl	65852(%rbp), %eax
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	cltq
	movzbl	160(%rbp,%rax), %eax
	movzbl	%al, %eax
<<<<<<< HEAD
	andl	$3, %eax
	movl	%eax, 65960(%rbp)
	cmpl	$3, 65960(%rbp)
	je	.L175
	cmpl	$3, 65960(%rbp)
	jg	.L176
	cmpl	$2, 65960(%rbp)
	je	.L177
	cmpl	$2, 65960(%rbp)
	jg	.L176
	cmpl	$0, 65960(%rbp)
	je	.L178
	cmpl	$1, 65960(%rbp)
	je	.L179
	jmp	.L176
.L178:
	movq	66200(%rbp), %rax
	movq	%rax, 66368(%rbp)
	jmp	.L180
.L179:
	movq	66192(%rbp), %rax
	movq	%rax, 66368(%rbp)
	jmp	.L180
.L177:
	movq	66184(%rbp), %rax
	movq	%rax, 66368(%rbp)
	jmp	.L180
.L175:
	movq	66176(%rbp), %rax
	movq	%rax, 66368(%rbp)
	jmp	.L180
.L176:
	movq	66200(%rbp), %rax
	movq	%rax, 66368(%rbp)
	leaq	.LC45(%rip), %rax
	movq	%rax, %rcx
	call	puts
	nop
.L180:
	movl	65976(%rbp), %r9d
	movl	65980(%rbp), %r8d
	movl	65984(%rbp), %edx
	movq	66256(%rbp), %rax
	movq	66368(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	65972(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_image
	addl	$1, 66380(%rbp)
.L174:
	movl	66380(%rbp), %eax
	cmpl	66292(%rbp), %eax
	jl	.L181
	addl	$1, 66384(%rbp)
.L173:
	movl	66384(%rbp), %eax
	cmpl	66292(%rbp), %eax
	jl	.L182
	movl	66288(%rbp), %eax
	movl	%eax, 66040(%rbp)
	movzbl	112(%rbp), %eax
	movzbl	%al, %eax
	imull	66040(%rbp), %eax
=======
	movl	%eax, 65848(%rbp)
	movl	65848(%rbp), %eax
	cltd
	idivl	66244(%rbp)
	imull	65880(%rbp), %eax
	movl	%eax, %ecx
	movl	65848(%rbp), %eax
	cltd
	idivl	66244(%rbp)
	movl	%edx, %eax
	imull	65880(%rbp), %eax
	movl	65864(%rbp), %r9d
	movl	65868(%rbp), %r11d
	movl	65872(%rbp), %edx
	movq	66208(%rbp), %r10
	movl	65880(%rbp), %r8d
	movl	%r8d, 72(%rsp)
	movl	65880(%rbp), %r8d
	movl	%r8d, 64(%rsp)
	movl	%ecx, 56(%rsp)
	movl	%eax, 48(%rsp)
	movq	66120(%rbp), %rax
	movq	%rax, 40(%rsp)
	movl	65860(%rbp), %eax
	movl	%eax, 32(%rsp)
	movl	%r11d, %r8d
	movq	%r10, %rcx
	call	draw_image_part
	addl	$1, 66308(%rbp)
.L219:
	movl	66308(%rbp), %eax
	cmpl	66244(%rbp), %eax
	jl	.L220
	addl	$1, 66312(%rbp)
.L218:
	movl	66312(%rbp), %eax
	cmpl	66244(%rbp), %eax
	jl	.L221
	movzbl	128(%rbp), %eax
	movzbl	%al, %eax
	imull	65880(%rbp), %eax
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	movl	%eax, %edx
	movzbl	133(%rbp), %eax
	movzbl	%al, %eax
	imull	%eax, %edx
	movzbl	132(%rbp), %eax
	movzbl	%al, %eax
<<<<<<< HEAD
	imull	66040(%rbp), %eax
	leal	(%rdx,%rax), %r8d
	movl	100(%rbp), %edx
	movl	66040(%rbp), %eax
	imull	66280(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	movl	96(%rbp), %edx
	movl	66040(%rbp), %eax
	imull	66284(%rbp), %eax
	leal	(%rdx,%rax), %r11d
	movl	100(%rbp), %r10d
	movl	96(%rbp), %edx
	movq	66256(%rbp), %rax
	movl	66040(%rbp), %r9d
	movl	%r9d, 72(%rsp)
	movl	66040(%rbp), %r9d
	movl	%r9d, 64(%rsp)
	movl	$0, 56(%rsp)
	movl	%r8d, 48(%rsp)
	movq	66168(%rbp), %r8
=======
	imull	65880(%rbp), %eax
	leal	(%rdx,%rax), %r8d
	movl	116(%rbp), %edx
	movl	65880(%rbp), %eax
	imull	66232(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	movl	112(%rbp), %edx
	movl	65880(%rbp), %eax
	imull	66236(%rbp), %eax
	leal	(%rdx,%rax), %r11d
	movl	116(%rbp), %r10d
	movl	112(%rbp), %edx
	movq	66208(%rbp), %rax
	movl	65880(%rbp), %r9d
	movl	%r9d, 72(%rsp)
	movl	65880(%rbp), %r9d
	movl	%r9d, 64(%rsp)
	movl	$0, 56(%rsp)
	movl	%r8d, 48(%rsp)
	movq	66112(%rbp), %r8
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	movq	%r8, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	%r11d, %r9d
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	draw_image_part
<<<<<<< HEAD
	movl	$0, 66364(%rbp)
	jmp	.L183
.L187:
	movq	waterParticles(%rip), %rdx
	movl	66364(%rbp), %eax
=======
	movl	$0, 66304(%rbp)
	jmp	.L222
.L224:
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	66304(%rbp), %eax
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	12(%rax), %eax
	testl	%eax, %eax
<<<<<<< HEAD
	je	.L184
	movq	waterParticles(%rip), %rdx
	movl	66364(%rbp), %eax
=======
	je	.L223
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	66304(%rbp), %eax
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm1
<<<<<<< HEAD
	movq	waterParticles(%rip), %rdx
	movl	66364(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movss	8(%rax), %xmm0
	movq	waterParticles(%rip), %rdx
	movl	66364(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	addss	%xmm1, %xmm0
	movss	%xmm0, 4(%rax)
	movq	waterParticles(%rip), %rdx
	movl	66364(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2ssl	66320(%rbp), %xmm1
	comiss	%xmm1, %xmm0
	jbe	.L184
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
	jg	.L186
	movq	waterParticles(%rip), %rdx
	movl	66364(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	$0, 12(%rax)
	jmp	.L184
.L186:
	movl	66320(%rbp), %ecx
	movl	66324(%rbp), %edx
	movl	66364(%rbp), %eax
	movl	%ecx, %r8d
	movl	%eax, %ecx
	call	createWaterParticle
.L184:
	addl	$1, 66364(%rbp)
.L183:
	movl	$100, %eax
	cmpl	%eax, 66364(%rbp)
	jl	.L187
	movl	$0, 66360(%rbp)
	jmp	.L188
.L190:
	movq	waterParticles(%rip), %rdx
	movl	66360(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	12(%rax), %eax
	testl	%eax, %eax
	je	.L189
	movq	waterParticles(%rip), %rdx
	movl	66360(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm1
	movss	.LC46(%rip), %xmm0
	addss	%xmm1, %xmm0
	cvttss2sil	%xmm0, %edx
	movq	waterParticles(%rip), %rcx
	movl	66360(%rbp), %eax
=======
	movss	.LC51(%rip), %xmm0
	addss	%xmm1, %xmm0
	cvttss2si	%xmm0, %edx
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rcx
	movl	66304(%rbp), %eax
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm1
<<<<<<< HEAD
	movss	.LC47(%rip), %xmm0
	addss	%xmm1, %xmm0
	cvttss2sil	%xmm0, %r9d
	movq	waterParticles(%rip), %rcx
	movl	66360(%rbp), %eax
=======
	movss	.LC52(%rip), %xmm0
	addss	%xmm1, %xmm0
	cvttss2si	%xmm0, %r9d
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rcx
	movl	66304(%rbp), %eax
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movss	4(%rax), %xmm0
<<<<<<< HEAD
	cvttss2sil	%xmm0, %r10d
	movq	waterParticles(%rip), %rcx
	movl	66360(%rbp), %eax
=======
	cvttss2si	%xmm0, %r8d
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rcx
	movl	66304(%rbp), %eax
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm0
<<<<<<< HEAD
	cvttss2sil	%xmm0, %eax
	movq	66256(%rbp), %rcx
	movq	66184(%rbp), %r8
	movq	%r8, 40(%rsp)
=======
	cvttss2si	%xmm0, %eax
	movq	66208(%rbp), %rcx
	movq	66136(%rbp), %r10
	movq	%r10, 40(%rsp)
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	movl	%edx, 32(%rsp)
	movl	%eax, %edx
	call	draw_image
<<<<<<< HEAD
.L189:
	addl	$1, 66360(%rbp)
.L188:
	movl	$100, %eax
	cmpl	%eax, 66360(%rbp)
	jl	.L190
	cmpl	$0, 66392(%rbp)
	je	.L191
	movl	66300(%rbp), %r9d
	movl	66312(%rbp), %r8d
	movl	66316(%rbp), %edx
	movq	66256(%rbp), %rax
	movq	66112(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	66296(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_image
	movl	66280(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %ecx
	movl	66284(%rbp), %eax
	leal	0(,%rax,8), %r9d
	movl	66312(%rbp), %r10d
	movl	66316(%rbp), %edx
	movq	66256(%rbp), %rax
	movl	66152(%rbp), %r8d
	movl	%r8d, 64(%rsp)
	movl	66156(%rbp), %r8d
	movl	%r8d, 56(%rsp)
	movq	66104(%rbp), %r8
	movq	%r8, 48(%rsp)
	movq	66160(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%ecx, 32(%rsp)
=======
.L223:
	addl	$1, 66304(%rbp)
.L222:
	movl	$100, %eax
	cmpl	%eax, 66304(%rbp)
	jl	.L224
	cmpl	$0, 66336(%rbp)
	je	.L225
	movl	66252(%rbp), %r9d
	movl	66264(%rbp), %r8d
	movl	66268(%rbp), %edx
	movq	66208(%rbp), %rax
	movq	65992(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	66248(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_image
	movl	66096(%rbp), %eax
	imull	66232(%rbp), %eax
	movl	66100(%rbp), %edx
	imull	66236(%rbp), %edx
	movl	%edx, %r8d
	movl	66264(%rbp), %r10d
	movl	66268(%rbp), %edx
	movq	66208(%rbp), %rcx
	movl	66096(%rbp), %r9d
	movl	%r9d, 64(%rsp)
	movl	66100(%rbp), %r9d
	movl	%r9d, 56(%rsp)
	movq	65984(%rbp), %r9
	movq	%r9, 48(%rsp)
	movq	66104(%rbp), %r9
	movq	%r9, 40(%rsp)
	movl	%eax, 32(%rsp)
	movl	%r8d, %r9d
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	movl	%r10d, %r8d
	call	draw_text
<<<<<<< HEAD
.L191:
	cmpl	$0, 66408(%rbp)
	jle	.L192
	movl	96(%rbp), %eax
	addl	$60, %eax
	movl	%eax, 65792(%rbp)
	movl	100(%rbp), %eax
	subl	$120, %eax
	movl	%eax, 65796(%rbp)
	movq	66256(%rbp), %rax
=======
.L225:
	cmpl	$0, 66360(%rbp)
	jle	.L226
	movq	66208(%rbp), %rax
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	movl	$255, 32(%rsp)
	movl	$255, %r9d
	movl	$255, %r8d
	movl	$255, %edx
	movq	%rax, %rcx
	call	SDL_SetRenderDrawColor
<<<<<<< HEAD
	movq	66232(%rbp), %rdx
	movq	66256(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_RenderFillRect
	movq	66256(%rbp), %rax
	movl	$255, 32(%rsp)
	movl	$255, %r9d
	movl	$255, %r8d
	movl	$255, %edx
	movq	%rax, %rcx
	call	SDL_SetRenderDrawColor
	movq	66232(%rbp), %rax
	movl	4(%rax), %ecx
	movq	66232(%rbp), %rax
	movl	12(%rax), %eax
	leal	3(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$2, %eax
	addl	%eax, %ecx
	movq	66232(%rbp), %rax
	movl	(%rax), %eax
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%eax, %xmm1
	movq	66232(%rbp), %rax
	movl	8(%rax), %eax
	pxor	%xmm2, %xmm2
	cvtsi2sdl	%eax, %xmm2
	movsd	.LC48(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %r8d
	movl	100(%rbp), %eax
	leal	-15(%rax), %r10d
	movl	96(%rbp), %eax
	leal	45(%rax), %edx
	movq	66256(%rbp), %rax
	movl	%ecx, 32(%rsp)
	movl	%r8d, %r9d
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	SDL_RenderDrawLine
	movq	66232(%rbp), %rax
	movl	4(%rax), %ecx
	movq	66232(%rbp), %rax
	movl	12(%rax), %eax
	leal	3(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$2, %eax
	addl	%eax, %ecx
	movq	66232(%rbp), %rax
	movl	(%rax), %eax
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%eax, %xmm1
	movq	66232(%rbp), %rax
	movl	8(%rax), %eax
	pxor	%xmm2, %xmm2
	cvtsi2sdl	%eax, %xmm2
	movsd	.LC49(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %r8d
	movl	100(%rbp), %eax
	leal	-15(%rax), %r10d
	movl	96(%rbp), %eax
	leal	45(%rax), %edx
	movq	66256(%rbp), %rax
	movl	%ecx, 32(%rsp)
	movl	%r8d, %r9d
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	SDL_RenderDrawLine
	movl	$0, -20(%rbp)
	movq	66232(%rbp), %rax
	movl	8(%rax), %eax
	subl	$10, %eax
	movl	%eax, 66036(%rbp)
	movl	66036(%rbp), %r8d
	movl	-20(%rbp), %ecx
	movq	66224(%rbp), %rdx
	movq	66216(%rbp), %rax
	movl	%r8d, %r9d
=======
	leaq	65728(%rbp), %rax
	movq	66208(%rbp), %rcx
	movq	%rax, %rdx
	call	SDL_RenderFillRect
	movl	$0, -4(%rbp)
	movb	$-1, -4(%rbp)
	movl	-4(%rbp), %ecx
	movq	66184(%rbp), %rdx
	movq	66176(%rbp), %rax
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	movl	%ecx, %r8d
	movq	%rax, %rcx
	call	TTF_RenderText_Blended_Wrapped
	movq	%rax, 66352(%rbp)
	cmpq	$0, 66352(%rbp)
	jne	.L193
	movl	-20(%rbp), %edx
	movq	66216(%rbp), %rax
	movl	%edx, %r8d
	leaq	.LC50(%rip), %rdx
	movq	%rax, %rcx
	call	TTF_RenderText_Solid
<<<<<<< HEAD
	movq	%rax, 66352(%rbp)
.L193:
	movq	66352(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, 66032(%rbp)
	movq	66352(%rbp), %rax
	movl	20(%rax), %eax
	movl	%eax, 66028(%rbp)
	movq	66232(%rbp), %rax
	movl	(%rax), %edx
	movq	66232(%rbp), %rax
	movl	8(%rax), %eax
	subl	66032(%rbp), %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	sarl	%eax
	addl	%edx, %eax
	movl	%eax, 66024(%rbp)
	movq	66232(%rbp), %rax
	movl	4(%rax), %edx
	movq	66232(%rbp), %rax
	movl	12(%rax), %eax
	subl	66028(%rbp), %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	sarl	%eax
	addl	%edx, %eax
	movl	%eax, 66020(%rbp)
	movl	66024(%rbp), %eax
	movl	%eax, -48(%rbp)
	movl	66020(%rbp), %eax
	movl	%eax, -44(%rbp)
	movl	66032(%rbp), %eax
	movl	%eax, -40(%rbp)
	movl	66028(%rbp), %eax
	movl	%eax, -36(%rbp)
	movq	66352(%rbp), %rdx
	movq	66256(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_CreateTextureFromSurface
	movq	%rax, 66008(%rbp)
	leaq	-48(%rbp), %rcx
	movq	66008(%rbp), %rdx
	movq	66256(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	SDL_RenderCopy
	movq	66352(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_FreeSurface
	movq	66008(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
.L192:
	movq	66256(%rbp), %rax
	movl	$255, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	SDL_SetRenderDrawColor
	movl	66404(%rbp), %edx
	movq	%rbp, %rax
	movl	%edx, %r9d
	leaq	.LC51(%rip), %r8
	movl	$20, %edx
	movq	%rax, %rcx
	call	snprintf
	movl	65676(%rbp), %edx
	movq	%rbp, %rax
	movq	66216(%rbp), %rcx
	movl	%edx, %r8d
	movq	%rax, %rdx
	call	TTF_RenderText_Solid
	movq	%rax, 66000(%rbp)
	movq	66000(%rbp), %rdx
	movq	66256(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_CreateTextureFromSurface
	movq	%rax, 65992(%rbp)
	movl	$10, -16(%rbp)
	movl	$720, -12(%rbp)
	movq	66000(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, -8(%rbp)
	movq	66000(%rbp), %rax
	movl	20(%rax), %eax
	movl	%eax, -4(%rbp)
	leaq	-16(%rbp), %rcx
	movq	65992(%rbp), %rdx
	movq	66256(%rbp), %rax
=======
	movq	%rax, 65840(%rbp)
	movq	65840(%rbp), %rdx
	movq	66208(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_CreateTextureFromSurface
	movq	%rax, 65832(%rbp)
	movl	65728(%rbp), %edx
	movl	65736(%rbp), %ecx
	movq	65840(%rbp), %rax
	movl	16(%rax), %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	sarl	%eax
	addl	%edx, %eax
	movl	%eax, -32(%rbp)
	movl	65732(%rbp), %edx
	movl	65740(%rbp), %ecx
	movq	65840(%rbp), %rax
	movl	20(%rax), %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	sarl	%eax
	addl	%edx, %eax
	movl	%eax, -28(%rbp)
	movq	65840(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, -24(%rbp)
	movq	65840(%rbp), %rax
	movl	20(%rax), %eax
	movl	%eax, -20(%rbp)
	leaq	-32(%rbp), %rcx
	movq	65832(%rbp), %rdx
	movq	66208(%rbp), %rax
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	SDL_RenderCopy
	movq	66000(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_FreeSurface
	movq	65992(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
<<<<<<< HEAD
	movq	66256(%rbp), %rax
=======
.L226:
	movq	66208(%rbp), %rax
	movl	$255, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	SDL_SetRenderDrawColor
	movl	66364(%rbp), %edx
	leaq	16(%rbp), %rax
	movl	%edx, %r9d
	leaq	.LC53(%rip), %r8
	movl	$20, %edx
	movq	%rax, %rcx
	call	snprintf
	movl	65708(%rbp), %edx
	leaq	16(%rbp), %rax
	movq	66176(%rbp), %rcx
	movl	%edx, %r8d
	movq	%rax, %rdx
	call	TTF_RenderText_Solid
	movq	%rax, 65824(%rbp)
	movq	65824(%rbp), %rdx
	movq	66208(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_CreateTextureFromSurface
	movq	%rax, 65816(%rbp)
	movl	$10, 0(%rbp)
	movl	$720, 4(%rbp)
	movq	65824(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, 8(%rbp)
	movq	65824(%rbp), %rax
	movl	20(%rax), %eax
	movl	%eax, 12(%rbp)
	movq	%rbp, %rcx
	movq	65816(%rbp), %rdx
	movq	66208(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	SDL_RenderCopy
	movq	65824(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_FreeSurface
	movq	65816(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66208(%rbp), %rax
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	movq	%rax, %rcx
	call	SDL_RenderPresent
	movl	$16, %ecx
	call	SDL_Delay
<<<<<<< HEAD
.L116:
	cmpl	$0, 66388(%rbp)
	jne	.L117
	leaq	.LC52(%rip), %rax
	movq	%rax, %rcx
=======
.L133:
	cmpl	$0, 66332(%rbp)
	jne	.L134
	leaq	.LC54(%rip), %rcx
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	call	puts
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	free
<<<<<<< HEAD
	movq	66216(%rbp), %rax
	movq	%rax, %rcx
	call	TTF_CloseFont
	movq	66200(%rbp), %rax
=======
	movq	66176(%rbp), %rax
	movq	%rax, %rcx
	call	TTF_CloseFont
	movq	66152(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66144(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66136(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66128(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66120(%rbp), %rax
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66192(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
<<<<<<< HEAD
	movq	66184(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66176(%rbp), %rax
=======
	movq	66112(%rbp), %rax
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66168(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
<<<<<<< HEAD
	movq	66112(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66160(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	call	IMG_Quit
	movl	66124(%rbp), %eax
=======
	movq	66104(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66088(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	call	IMG_Quit
	movl	66004(%rbp), %eax
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	movl	%eax, %ecx
	call	SDL_CloseAudioDevice
	movq	72(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_FreeWAV
<<<<<<< HEAD
	movq	66256(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyRenderer
	movq	66264(%rbp), %rax
=======
	movq	66208(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyRenderer
	movq	66216(%rbp), %rax
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	movq	%rax, %rcx
	call	SDL_DestroyWindow
	call	SDL_Quit
	movl	$500, %ecx
	call	SDL_Delay
	movl	$0, %eax
<<<<<<< HEAD
	jmp	.L100
.L105:
=======
	jmp	.L117
.L122:
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	call	SDL_GetError
	movq	%rax, %rsi
	movq	66280(%rbp), %rbx
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC55(%rip), %rdx
	movq	%rax, %rcx
<<<<<<< HEAD
	movq	66328(%rbp), %rax
	movq	%rbx, %r9
	movq	%rax, %r8
	leaq	.LC53(%rip), %rax
	movq	%rax, %rdx
=======
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
	call	fprintf
	call	SDL_Quit
	movl	$1, %ecx
	call	exit
<<<<<<< HEAD
.L100:
	movq	%rsi, %rsp
	jmp	.L98
.L114:
	movq	%rsi, %rsp
.L98:
	leaq	66424(%rbp), %rsp
=======
.L117:
	movq	%rsi, %rsp
	jmp	.L115
.L131:
	movq	%rsi, %rsp
.L115:
	leaq	66376(%rbp), %rsp
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
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
<<<<<<< HEAD
.LC46:
	.long	1097859072
	.align 4
.LC47:
	.long	1084227584
	.align 8
.LC48:
	.long	-1717986918
	.long	1069128089
	.align 8
.LC49:
	.long	858993459
	.long	1070805811
	.ident	"GCC: (x86_64-posix-seh-rev2, Built by MinGW-W64 project) 12.2.0"
=======
.LC12:
	.long	1092616192
	.align 8
.LC49:
	.long	0
	.long	1076887552
	.align 4
.LC51:
	.long	1097859072
	.align 4
.LC52:
	.long	1084227584
	.ident	"GCC: (x86_64-posix-seh, Built by strawberryperl.com project) 8.3.0"
	.def	__ms_vsnprintf;	.scl	2;	.type	32;	.endef
>>>>>>> 488e673008a0b0dc50fb25092bc960d5f693106c
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
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	SDL_PollEvent;	.scl	2;	.type	32;	.endef
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
