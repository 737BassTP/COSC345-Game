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
	pxor	%xmm0, %xmm0
	cvtsi2sdl	24(%rbp), %xmm0
	pxor	%xmm2, %xmm2
	cvtsi2sdl	16(%rbp), %xmm2
	movq	%xmm2, %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
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
	movl	16(%rbp), %edx
	movl	24(%rbp), %eax
	movl	%eax, %ecx
	call	darctan2
	movsd	.LC3(%rip), %xmm1
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
	leaq	.LC4(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movl	$0, glob_vk_f2(%rip)
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC6(%rip), %rax
	movq	%rax, %rcx
	call	fopen
	movq	%rax, 131040(%rbp)
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC8(%rip), %rax
	movq	%rax, %rcx
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
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movq	.LC9(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow
	cvttsd2sil	%xmm0, %eax
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
	leaq	.LC10(%rip), %rax
	movq	%rax, %rcx
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
	nop
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
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC11(%rip), %rax
	movq	%rax, %rcx
	call	fopen
	movq	%rax, -16(%rbp)
	movl	16(%rbp), %edx
	movq	-16(%rbp), %rax
	movl	$0, %r8d
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
	jmp	.L103
.L104:
	movq	-16(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rdx, %r8
	movl	$16, %edx
	movq	%rax, %rcx
	call	fgets
	subl	$1, -4(%rbp)
.L103:
	cmpl	$0, -4(%rbp)
	jg	.L104
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
	movss	.LC12(%rip), %xmm0
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
	jb	.L108
	movq	-8(%rbp), %rax
	movl	$0, 12(%rax)
.L108:
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
	movl	16(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$-2004318071, %rdx, %rdx
	shrq	$32, %rdx
	addl	%eax, %edx
	sarl	$5, %edx
	sarl	$31, %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movslq	%ecx, %rax
	imulq	$715827883, %rax, %rax
	shrq	$32, %rax
	movl	%eax, %edx
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
	sarl	$5, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	imull	$60, %edx, %ecx
	subl	%ecx, %eax
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
	movslq	%ecx, %rax
	imulq	$715827883, %rax, %rax
	shrq	$32, %rax
	movl	%eax, %edx
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
	imull	$60, %edx, %r8d
	movl	32(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$-2004318071, %rdx, %rdx
	shrq	$32, %rdx
	addl	%eax, %edx
	sarl	$5, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	imull	$60, %edx, %ecx
	subl	%ecx, %eax
	movl	%eax, %edx
	leal	(%r8,%rdx), %eax
	movl	%eax, -4(%rbp)
	movl	40(%rbp), %ecx
	movslq	%ecx, %rax
	imulq	$715827883, %rax, %rax
	shrq	$32, %rax
	movl	%eax, %edx
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
	imull	$60, %edx, %r8d
	movl	48(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$-2004318071, %rdx, %rdx
	shrq	$32, %rdx
	addl	%eax, %edx
	sarl	$5, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	imull	$60, %edx, %ecx
	subl	%ecx, %eax
	movl	%eax, %edx
	leal	(%r8,%rdx), %eax
	movl	%eax, -8(%rbp)
	movl	16(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jl	.L114
	movl	16(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jg	.L114
	movl	$1, %eax
	jmp	.L116
.L114:
	movl	$0, %eax
.L116:
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
.LC38:
	.ascii "Failed to open audio device: %s\12\0"
.LC39:
	.ascii "img/img_lands.png\0"
.LC40:
	.ascii "Press SPACE to continue.\0"
.LC41:
	.ascii "Entering main loop...\0"
	.align 8
.LC42:
	.ascii "you pressed 1, good job. Lets test the limit\0"
	.align 8
.LC43:
	.ascii "you pressed 2, good job. Lets test the limit woo\0"
.LC44:
	.ascii "you pressed 3\0"
	.align 8
.LC45:
	.ascii "you pressed 4, good job. Lets test the limit woo\0"
.LC46:
	.ascii "F2 started!\0"
.LC47:
	.ascii "F2 finished!\0"
.LC48:
	.ascii "Location:#DUNEDIN#NEW ZEALAND\0"
.LC49:
	.ascii "LVL: XYZ/255\0"
.LC50:
	.ascii "X\0"
.LC51:
	.ascii "Y\0"
.LC52:
	.ascii "Z\0"
.LC54:
	.ascii ":\0"
.LC57:
	.ascii "Score: %d\0"
.LC58:
	.ascii "...exited main loop.\0"
.LC59:
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
	movq	$256, 66360(%rbp)
	movq	66360(%rbp), %rax
	subq	$1, %rax
	movq	%rax, 66352(%rbp)
	movq	66360(%rbp), %rax
	movq	%rax, %r10
	movl	$0, %r11d
	movq	66360(%rbp), %rax
	movq	%rax, %r8
	movl	$0, %r9d
	movq	66360(%rbp), %rax
	addq	$15, %rax
	shrq	$4, %rax
	salq	$4, %rax
	call	___chkstk_ms
	subq	%rax, %rsp
	leaq	80(%rsp), %rax
	addq	$0, %rax
	movq	%rax, 66344(%rbp)
	movl	$1366, 66340(%rbp)
	movl	$768, 66336(%rbp)
	movl	66340(%rbp), %eax
	subl	66336(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, 66332(%rbp)
	movl	$0, 66328(%rbp)
	movl	66336(%rbp), %eax
	movl	%eax, 66324(%rbp)
	movl	66336(%rbp), %eax
	movl	%eax, 66320(%rbp)
	movl	66332(%rbp), %edx
	movl	66324(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 66316(%rbp)
	movl	66328(%rbp), %edx
	movl	66320(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 66312(%rbp)
	movl	$16, 66308(%rbp)
	movl	$16, 66304(%rbp)
	movl	66308(%rbp), %eax
	movl	%eax, %ecx
	call	sqr
	movl	%eax, %edi
	movl	66336(%rbp), %eax
	cltd
	idivl	%edi
	movl	%eax, 66300(%rbp)
	movl	66300(%rbp), %eax
	movl	%eax, 66296(%rbp)
	movl	$100, %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rcx
	call	malloc
	movq	%rax, waterParticles(%rip)
	movq	waterParticles(%rip), %rax
	testq	%rax, %rax
	jne	.L118
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %r9
	movl	$46, %r8d
	movl	$1, %edx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$1, %eax
	jmp	.L119
.L118:
	movl	$0, %ecx
	call	time
	movl	%eax, %ecx
	call	srand
	movl	$0, 66412(%rbp)
	jmp	.L120
.L121:
	movl	66336(%rbp), %ecx
	movl	66340(%rbp), %edx
	movl	66412(%rbp), %eax
	movl	%ecx, %r8d
	movl	%eax, %ecx
	call	createWaterParticle
	addl	$1, 66412(%rbp)
.L120:
	movl	$100, %eax
	cmpl	%eax, 66412(%rbp)
	jl	.L121
	movl	$62001, 66292(%rbp)
	movl	66292(%rbp), %eax
	movl	%eax, %ecx
	call	SDL_Init
	testl	%eax, %eax
	je	.L122
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC14(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L119
.L122:
	movl	66340(%rbp), %edx
	movl	$0, 40(%rsp)
	movl	66336(%rbp), %eax
	movl	%eax, 32(%rsp)
	movl	%edx, %r9d
	movl	$536805376, %r8d
	movl	$536805376, %edx
	leaq	.LC15(%rip), %rax
	movq	%rax, %rcx
	call	SDL_CreateWindow
	movq	%rax, 66280(%rbp)
	cmpq	$0, 66280(%rbp)
	jne	.L123
	movq	66360(%rbp), %rdx
	movq	66344(%rbp), %rax
	leaq	.LC16(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L124
.L123:
	movq	66280(%rbp), %rax
	movl	$4, %r8d
	movl	$-1, %edx
	movq	%rax, %rcx
	call	SDL_CreateRenderer
	movq	%rax, 66272(%rbp)
	cmpq	$0, 66272(%rbp)
	jne	.L125
	movq	66360(%rbp), %rdx
	movq	66344(%rbp), %rax
	leaq	.LC17(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L124
.L125:
	movq	66280(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_GetWindowSurface
	movq	%rax, 66264(%rbp)
	cmpq	$0, 66264(%rbp)
	jne	.L126
	movq	66360(%rbp), %rdx
	movq	66344(%rbp), %rax
	leaq	.LC18(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L124
.L126:
	movl	$800, 65728(%rbp)
	movl	$100, 65732(%rbp)
	movl	$100, 65736(%rbp)
	movl	$100, 65740(%rbp)
	movabsq	$2338613357913204068, %rax
	movq	%rax, 65712(%rbp)
	movabsq	$28542640894207341, %rax
	movq	%rax, 65720(%rbp)
	leaq	65712(%rbp), %rax
	movq	%rax, 66256(%rbp)
	movl	$0, 66408(%rbp)
	call	TTF_Init
	cmpl	$-1, %eax
	jne	.L127
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC19(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L119
.L127:
	movl	$12, %edx
	leaq	.LC20(%rip), %rax
	movq	%rax, %rcx
	call	TTF_OpenFont
	movq	%rax, 66248(%rbp)
	cmpq	$0, 66248(%rbp)
	jne	.L128
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC21(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L119
.L128:
	movl	$0, 66244(%rbp)
	movl	$0, 66404(%rbp)
	movb	$0, 65708(%rbp)
	movb	$0, 65709(%rbp)
	movb	$0, 65710(%rbp)
	movb	$-1, 65711(%rbp)
	movq	66280(%rbp), %rax
	movl	$2, %r8d
	movl	$-1, %edx
	movq	%rax, %rcx
	call	SDL_CreateRenderer
	movq	%rax, 66232(%rbp)
	cmpq	$0, 66272(%rbp)
	jne	.L129
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC22(%rip), %rax
	movq	%rax, %rcx
	call	printf
.L129:
	movl	$2, %ecx
	call	IMG_Init
	movq	66272(%rbp), %rax
	leaq	.LC23(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66224(%rbp)
	movq	66272(%rbp), %rax
	leaq	.LC24(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66216(%rbp)
	movq	66272(%rbp), %rax
	leaq	.LC25(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66208(%rbp)
	movq	66272(%rbp), %rax
	leaq	.LC26(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66200(%rbp)
	movq	66272(%rbp), %rax
	leaq	.LC27(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66192(%rbp)
	movq	66272(%rbp), %rax
	leaq	.LC28(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66184(%rbp)
	movq	66272(%rbp), %rax
	leaq	.LC29(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66176(%rbp)
	movl	$8, 66172(%rbp)
	movl	$24, 66168(%rbp)
	movq	66272(%rbp), %rax
	leaq	.LC30(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66160(%rbp)
	movl	$1440, 66156(%rbp)
	movl	$0, 66152(%rbp)
	movl	$0, 66148(%rbp)
	movl	$57, 66144(%rbp)
	movl	$60, 66140(%rbp)
	leaq	.LC31(%rip), %rax
	movq	%rax, 66128(%rbp)
	leaq	.LC32(%rip), %rax
	movq	%rax, 66120(%rbp)
	leaq	.LC33(%rip), %rax
	movq	%rax, 66112(%rbp)
	leaq	.LC34(%rip), %rax
	movq	%rax, 66104(%rbp)
	movl	66308(%rbp), %eax
	movl	%eax, %ecx
	call	sqr
	movl	%eax, 66100(%rbp)
	movl	$256, 66096(%rbp)
	movl	$0, 66400(%rbp)
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC8(%rip), %rax
	movq	%rax, %rcx
	call	fopen
	movq	%rax, 66088(%rbp)
	movl	$0, 66396(%rbp)
	jmp	.L130
.L131:
	movl	66396(%rbp), %eax
	cltq
	movb	$0, 160(%rbp,%rax)
	addl	$1, 66396(%rbp)
.L130:
	movl	66100(%rbp), %eax
	imull	66096(%rbp), %eax
	cmpl	%eax, 66396(%rbp)
	jl	.L131
	movq	66088(%rbp), %rdx
	leaq	160(%rbp), %rax
	movq	%rdx, %r9
	movl	$1, %r8d
	movl	$65536, %edx
	movq	%rax, %rcx
	call	fread
	movq	66088(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movq	66272(%rbp), %rax
	leaq	.LC35(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66080(%rbp)
	leaq	144(%rbp), %rax
	movl	66400(%rbp), %ecx
	movq	%rax, %rdx
	call	level_get_name
	movl	66300(%rbp), %eax
	imull	66304(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	66332(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 112(%rbp)
	movl	66296(%rbp), %eax
	imull	66304(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	66328(%rbp), %eax
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
	movq	%rax, 66072(%rbp)
	movq	66072(%rbp), %rax
	leaq	.LC5(%rip), %rdx
	movq	%rax, %rcx
	call	SDL_RWFromFile
	movq	%rax, %rcx
	leaq	72(%rbp), %r8
	leaq	80(%rbp), %rdx
	leaq	68(%rbp), %rax
	movq	%rax, 32(%rsp)
	movq	%r8, %r9
	movq	%rdx, %r8
	movl	$1, %edx
	call	SDL_LoadWAV_RW
	testq	%rax, %rax
	jne	.L132
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC37(%rip), %rax
	movq	%rax, %rcx
	call	printf
	jmp	.L133
.L132:
	movq	72(%rbp), %rax
	movq	%rax, 48(%rbp)
	movl	68(%rbp), %eax
	movl	%eax, 56(%rbp)
	movl	$0, 60(%rbp)
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
	movl	%eax, 66068(%rbp)
	cmpl	$0, 66068(%rbp)
	jne	.L134
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC38(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movq	72(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_FreeWAV
	jmp	.L133
.L134:
	movl	68(%rbp), %ecx
	movq	72(%rbp), %rdx
	movl	66068(%rbp), %eax
	movl	%ecx, %r8d
	movl	%eax, %ecx
	call	SDL_QueueAudio
	movl	66068(%rbp), %eax
	movl	$0, %edx
	movl	%eax, %ecx
	call	SDL_PauseAudioDevice
	movl	$1, 66392(%rbp)
	movq	66272(%rbp), %rax
	leaq	.LC39(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66056(%rbp)
	leaq	.LC40(%rip), %rax
	movq	%rax, 66048(%rbp)
	movl	$1, 66388(%rbp)
	leaq	.LC41(%rip), %rax
	movq	%rax, %rcx
	call	puts
	jmp	.L135
.L174:
	movl	65744(%rbp), %eax
	cmpl	$769, %eax
	je	.L137
	cmpl	$769, %eax
	ja	.L136
	cmpl	$256, %eax
	je	.L138
	cmpl	$768, %eax
	je	.L139
	jmp	.L136
.L138:
	movl	$0, 66388(%rbp)
	jmp	.L136
.L139:
	movl	$1, 65872(%rbp)
	movl	65764(%rbp), %eax
	cmpl	$57, %eax
	jg	.L140
	cmpl	$27, %eax
	jge	.L141
	jmp	.L136
.L158:
	subl	$1073741883, %eax
	cmpl	$29, %eax
	ja	.L136
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L144(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L144(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L144:
	.long	.L149-.L144
	.long	.L136-.L144
	.long	.L136-.L144
	.long	.L136-.L144
	.long	.L136-.L144
	.long	.L136-.L144
	.long	.L136-.L144
	.long	.L136-.L144
	.long	.L136-.L144
	.long	.L136-.L144
	.long	.L136-.L144
	.long	.L136-.L144
	.long	.L136-.L144
	.long	.L136-.L144
	.long	.L136-.L144
	.long	.L136-.L144
	.long	.L136-.L144
	.long	.L136-.L144
	.long	.L136-.L144
	.long	.L136-.L144
	.long	.L148-.L144
	.long	.L147-.L144
	.long	.L146-.L144
	.long	.L145-.L144
	.long	.L136-.L144
	.long	.L136-.L144
	.long	.L136-.L144
	.long	.L136-.L144
	.long	.L136-.L144
	.long	.L143-.L144
	.text
.L141:
	subl	$27, %eax
	cmpl	$30, %eax
	ja	.L136
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L151(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L151(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L151:
	.long	.L157-.L151
	.long	.L136-.L151
	.long	.L136-.L151
	.long	.L136-.L151
	.long	.L136-.L151
	.long	.L156-.L151
	.long	.L136-.L151
	.long	.L136-.L151
	.long	.L136-.L151
	.long	.L136-.L151
	.long	.L136-.L151
	.long	.L136-.L151
	.long	.L136-.L151
	.long	.L136-.L151
	.long	.L136-.L151
	.long	.L136-.L151
	.long	.L136-.L151
	.long	.L136-.L151
	.long	.L136-.L151
	.long	.L136-.L151
	.long	.L136-.L151
	.long	.L136-.L151
	.long	.L155-.L151
	.long	.L154-.L151
	.long	.L153-.L151
	.long	.L152-.L151
	.long	.L136-.L151
	.long	.L136-.L151
	.long	.L136-.L151
	.long	.L136-.L151
	.long	.L150-.L151
	.text
.L140:
	cmpl	$1073741912, %eax
	jg	.L136
	cmpl	$1073741883, %eax
	jge	.L158
	jmp	.L136
.L157:
	movl	$0, 66388(%rbp)
	jmp	.L142
.L148:
	movl	65872(%rbp), %eax
	movl	%eax, glob_vk_right(%rip)
	jmp	.L142
.L147:
	movl	65872(%rbp), %eax
	movl	%eax, glob_vk_left(%rip)
	jmp	.L142
.L145:
	movl	65872(%rbp), %eax
	movl	%eax, glob_vk_up(%rip)
	jmp	.L142
.L146:
	movl	65872(%rbp), %eax
	movl	%eax, glob_vk_down(%rip)
	jmp	.L142
.L156:
	movl	65872(%rbp), %eax
	movl	%eax, glob_vk_space(%rip)
	jmp	.L142
.L143:
	movl	65872(%rbp), %eax
	movl	%eax, glob_vk_enter(%rip)
	jmp	.L142
.L149:
	movl	65872(%rbp), %eax
	movl	%eax, glob_vk_f2(%rip)
	jmp	.L142
.L150:
	cmpl	$0, 66408(%rbp)
	jne	.L159
	movl	$1, 66408(%rbp)
	leaq	65712(%rbp), %rax
	movabsq	$3184362091757007472, %rdi
	movq	%rdi, (%rax)
	movabsq	$14685297085393969, %rdi
	movq	%rdi, 6(%rax)
	jmp	.L142
.L159:
	movl	$0, 66408(%rbp)
	jmp	.L142
.L155:
	cmpl	$1, 66408(%rbp)
	jne	.L212
	leaq	.LC42(%rip), %rax
	movq	%rax, 65816(%rbp)
	movq	$15, 65808(%rbp)
	movq	65808(%rbp), %rcx
	movq	65816(%rbp), %rdx
	leaq	65712(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	strncpy
	leaq	65712(%rbp), %rax
	movq	65808(%rbp), %rdx
	addq	%rdx, %rax
	movb	$0, (%rax)
	addl	$50, 66404(%rbp)
	jmp	.L212
.L154:
	cmpl	$1, 66408(%rbp)
	jne	.L213
	leaq	.LC43(%rip), %rax
	movq	%rax, 65832(%rbp)
	movq	$15, 65824(%rbp)
	movq	65824(%rbp), %rcx
	movq	65832(%rbp), %rdx
	leaq	65712(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	strncpy
	leaq	65712(%rbp), %rax
	movq	65824(%rbp), %rdx
	addq	%rdx, %rax
	movb	$0, (%rax)
	addl	$50, 66404(%rbp)
	jmp	.L213
.L153:
	cmpl	$1, 66408(%rbp)
	jne	.L214
	leaq	.LC44(%rip), %rax
	movq	%rax, 65848(%rbp)
	movq	$15, 65840(%rbp)
	movq	65840(%rbp), %rcx
	movq	65848(%rbp), %rdx
	leaq	65712(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	strncpy
	leaq	65712(%rbp), %rax
	movq	65840(%rbp), %rdx
	addq	%rdx, %rax
	movb	$0, (%rax)
	addl	$50, 66404(%rbp)
	jmp	.L214
.L152:
	cmpl	$1, 66408(%rbp)
	jne	.L215
	leaq	.LC45(%rip), %rax
	movq	%rax, 65864(%rbp)
	movq	$15, 65856(%rbp)
	movq	65856(%rbp), %rcx
	movq	65864(%rbp), %rdx
	leaq	65712(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	strncpy
	leaq	65712(%rbp), %rax
	movq	65856(%rbp), %rdx
	addq	%rdx, %rax
	movb	$0, (%rax)
	addl	$50, 66404(%rbp)
	jmp	.L215
.L212:
	nop
	jmp	.L136
.L213:
	nop
	jmp	.L136
.L214:
	nop
	jmp	.L136
.L215:
	nop
.L142:
	jmp	.L136
.L137:
	movl	$0, 65876(%rbp)
	movl	65764(%rbp), %eax
	cmpl	$32, %eax
	je	.L165
	cmpl	$32, %eax
	jl	.L216
	cmpl	$1073741912, %eax
	jg	.L216
	cmpl	$1073741883, %eax
	jl	.L216
	subl	$1073741883, %eax
	cmpl	$29, %eax
	ja	.L216
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L168(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L168(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L168:
	.long	.L173-.L168
	.long	.L216-.L168
	.long	.L216-.L168
	.long	.L216-.L168
	.long	.L216-.L168
	.long	.L216-.L168
	.long	.L216-.L168
	.long	.L216-.L168
	.long	.L216-.L168
	.long	.L216-.L168
	.long	.L216-.L168
	.long	.L216-.L168
	.long	.L216-.L168
	.long	.L216-.L168
	.long	.L216-.L168
	.long	.L216-.L168
	.long	.L216-.L168
	.long	.L216-.L168
	.long	.L216-.L168
	.long	.L216-.L168
	.long	.L172-.L168
	.long	.L171-.L168
	.long	.L170-.L168
	.long	.L169-.L168
	.long	.L216-.L168
	.long	.L216-.L168
	.long	.L216-.L168
	.long	.L216-.L168
	.long	.L216-.L168
	.long	.L167-.L168
	.text
.L172:
	movl	65876(%rbp), %eax
	movl	%eax, glob_vk_right(%rip)
	jmp	.L166
.L171:
	movl	65876(%rbp), %eax
	movl	%eax, glob_vk_left(%rip)
	jmp	.L166
.L169:
	movl	65876(%rbp), %eax
	movl	%eax, glob_vk_up(%rip)
	jmp	.L166
.L170:
	movl	65876(%rbp), %eax
	movl	%eax, glob_vk_down(%rip)
	jmp	.L166
.L165:
	movl	65876(%rbp), %eax
	movl	%eax, glob_vk_space(%rip)
	jmp	.L166
.L167:
	movl	65876(%rbp), %eax
	movl	%eax, glob_vk_enter(%rip)
	jmp	.L166
.L173:
	movl	65876(%rbp), %eax
	movl	%eax, glob_vk_f2(%rip)
	nop
.L166:
.L216:
	nop
.L136:
	leaq	65744(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_PollEvent
	testl	%eax, %eax
	jne	.L174
	movl	glob_vk_f2(%rip), %eax
	testl	%eax, %eax
	je	.L175
	leaq	.LC46(%rip), %rax
	movq	%rax, %rcx
	call	puts
	call	dev_tiled_to_leveldata
	leaq	.LC47(%rip), %rax
	movq	%rax, %rcx
	call	puts
.L175:
	movl	glob_vk_right(%rip), %eax
	testl	%eax, %eax
	je	.L176
	movb	$0, 128(%rbp)
	movl	112(%rbp), %edx
	movzbl	134(%rbp), %eax
	movzbl	%al, %eax
	addl	%edx, %eax
	movl	%eax, 112(%rbp)
.L176:
	movl	glob_vk_up(%rip), %eax
	testl	%eax, %eax
	je	.L177
	movb	$1, 128(%rbp)
	movl	116(%rbp), %edx
	movzbl	134(%rbp), %eax
	movzbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, 116(%rbp)
.L177:
	movl	glob_vk_left(%rip), %eax
	testl	%eax, %eax
	je	.L178
	movb	$2, 128(%rbp)
	movl	112(%rbp), %edx
	movzbl	134(%rbp), %eax
	movzbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, 112(%rbp)
.L178:
	movl	glob_vk_down(%rip), %eax
	testl	%eax, %eax
	je	.L179
	movb	$3, 128(%rbp)
	movl	116(%rbp), %edx
	movzbl	134(%rbp), %eax
	movzbl	%al, %eax
	addl	%edx, %eax
	movl	%eax, 116(%rbp)
.L179:
	movl	glob_vk_right(%rip), %edx
	movl	glob_vk_left(%rip), %eax
	orl	%eax, %edx
	movl	glob_vk_up(%rip), %eax
	orl	%eax, %edx
	movl	glob_vk_down(%rip), %eax
	orl	%edx, %eax
	testl	%eax, %eax
	je	.L180
	movzbl	129(%rbp), %edx
	movzbl	130(%rbp), %eax
	addl	%edx, %eax
	movb	%al, 129(%rbp)
	movzbl	132(%rbp), %ecx
	movzbl	129(%rbp), %edx
	movzbl	131(%rbp), %eax
	cmpb	%al, %dl
	setnb	%al
	addl	%ecx, %eax
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
	movb	%al, 132(%rbp)
	movl	66304(%rbp), %eax
	imull	66300(%rbp), %eax
	movl	66316(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, 66044(%rbp)
	movl	66328(%rbp), %eax
	movl	%eax, 66040(%rbp)
	movl	66332(%rbp), %eax
	movl	%eax, 66036(%rbp)
	movl	66304(%rbp), %eax
	imull	66296(%rbp), %eax
	movl	66312(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, 66032(%rbp)
	movl	$0, 66028(%rbp)
	movl	112(%rbp), %eax
	cmpl	%eax, 66044(%rbp)
	jl	.L181
	movl	116(%rbp), %eax
	cmpl	%eax, 66032(%rbp)
	jl	.L181
	movl	112(%rbp), %eax
	cmpl	%eax, 66036(%rbp)
	jg	.L181
	movl	116(%rbp), %eax
	cmpl	%eax, 66040(%rbp)
	jle	.L182
.L181:
	movl	$1, %eax
	jmp	.L183
.L182:
	movl	$0, %eax
.L183:
	movl	%eax, 66028(%rbp)
	movl	112(%rbp), %eax
	cmpl	%eax, 66044(%rbp)
	jge	.L184
	movl	66036(%rbp), %eax
	movl	%eax, 112(%rbp)
	addl	$1, 66400(%rbp)
.L184:
	movl	116(%rbp), %eax
	cmpl	%eax, 66040(%rbp)
	jle	.L185
	movl	66032(%rbp), %eax
	movl	%eax, 116(%rbp)
	pxor	%xmm3, %xmm3
	cvtsi2sdl	66096(%rbp), %xmm3
	movq	%xmm3, %rax
	movq	%rax, %xmm0
	call	sqrt
	cvttsd2sil	%xmm0, %eax
	subl	%eax, 66400(%rbp)
.L185:
	movl	112(%rbp), %eax
	cmpl	%eax, 66036(%rbp)
	jle	.L186
	movl	66044(%rbp), %eax
	movl	%eax, 112(%rbp)
	subl	$1, 66400(%rbp)
.L186:
	movl	116(%rbp), %eax
	cmpl	%eax, 66032(%rbp)
	jge	.L187
	movl	66040(%rbp), %eax
	movl	%eax, 116(%rbp)
	pxor	%xmm4, %xmm4
	cvtsi2sdl	66096(%rbp), %xmm4
	movq	%xmm4, %rax
	movq	%rax, %xmm0
	call	sqrt
	cvttsd2sil	%xmm0, %eax
	addl	%eax, 66400(%rbp)
.L187:
	cmpl	$0, 66028(%rbp)
	je	.L188
	movl	66096(%rbp), %eax
	addl	%eax, 66400(%rbp)
	movl	66400(%rbp), %eax
	cltd
	idivl	66096(%rbp)
	movl	%edx, 66400(%rbp)
	jmp	.L188
.L180:
	movb	$0, 129(%rbp)
	movb	$0, 132(%rbp)
.L188:
	movl	glob_vk_space(%rip), %edx
	movl	glob_vk_enter(%rip), %eax
	orl	%edx, %eax
	testl	%eax, %eax
	je	.L189
	movl	$0, 66392(%rbp)
.L189:
	movl	112(%rbp), %eax
	movl	%eax, 120(%rbp)
	movl	116(%rbp), %eax
	movl	%eax, 124(%rbp)
	movl	$0, %edx
	movq	66272(%rbp), %rax
	movq	%rax, %rcx
	call	draw_clear
	movl	$16777215, %edx
	movq	66272(%rbp), %rax
	movq	%rax, %rcx
	call	draw_set_color
	movl	$33023, %edx
	movl	66332(%rbp), %ecx
	movq	66272(%rbp), %rax
	movl	%edx, 40(%rsp)
	movl	66336(%rbp), %edx
	movl	%edx, 32(%rsp)
	movl	%ecx, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	$8388863, %ecx
	movl	66340(%rbp), %eax
	subl	66332(%rbp), %eax
	movl	%eax, %r8d
	movl	66332(%rbp), %edx
	movq	66272(%rbp), %rax
	movl	%ecx, 40(%rsp)
	movl	66336(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movl	%r8d, %r9d
	movl	$0, %r8d
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	$33023, %edx
	movl	66340(%rbp), %eax
	subl	66332(%rbp), %eax
	movl	66340(%rbp), %r8d
	movq	66272(%rbp), %rcx
	movl	%edx, 40(%rsp)
	movl	66336(%rbp), %edx
	movl	%edx, 32(%rsp)
	movl	%r8d, %r9d
	movl	$0, %r8d
	movl	%eax, %edx
	call	draw_rectangle_color
	movl	66300(%rbp), %eax
	movl	%eax, 66024(%rbp)
	movl	$0, 66020(%rbp)
	cmpl	$0, 66392(%rbp)
	jne	.L190
	movl	66168(%rbp), %eax
	imull	66296(%rbp), %eax
	movl	%eax, %ecx
	movl	66172(%rbp), %eax
	imull	66300(%rbp), %eax
	movl	%eax, %r9d
	movl	66020(%rbp), %r10d
	movl	66024(%rbp), %edx
	movq	66272(%rbp), %rax
	movl	66168(%rbp), %r8d
	movl	%r8d, 64(%rsp)
	movl	66172(%rbp), %r8d
	movl	%r8d, 56(%rsp)
	leaq	.LC48(%rip), %r8
	movq	%r8, 48(%rsp)
	movq	66176(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	draw_text
.L190:
	movl	66300(%rbp), %edx
	movl	66316(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 66024(%rbp)
	movl	$0, 66020(%rbp)
	cmpl	$0, 66392(%rbp)
	jne	.L191
	movq	%rsp, %rax
	movq	%rax, -40(%rbp)
	leaq	.LC49(%rip), %rax
	movq	%rax, 66008(%rbp)
	movq	66008(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	subq	$1, %rdx
	movq	%rdx, 66000(%rbp)
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
	movq	%rax, 65992(%rbp)
	movq	66008(%rbp), %rdx
	movq	65992(%rbp), %rax
	movq	%rax, %rcx
	call	strcpy
	movl	66400(%rbp), %eax
	movb	%al, 65991(%rbp)
	movzbl	65991(%rbp), %eax
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
	movq	65992(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC50(%rip), %rax
	movq	%rax, %rcx
	call	string_pos
	movl	%ebx, %ecx
	movq	65992(%rbp), %rdx
	cltq
	movb	%cl, (%rdx,%rax)
	movzbl	65991(%rbp), %eax
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
	movq	65992(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC51(%rip), %rax
	movq	%rax, %rcx
	call	string_pos
	movl	%ebx, %ecx
	movq	65992(%rbp), %rdx
	cltq
	movb	%cl, (%rdx,%rax)
	movzbl	65991(%rbp), %ecx
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
	movq	65992(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC52(%rip), %rax
	movq	%rax, %rcx
	call	string_pos
	movl	%ebx, %ecx
	movq	65992(%rbp), %rdx
	cltq
	movb	%cl, (%rdx,%rax)
	movl	66168(%rbp), %eax
	imull	66296(%rbp), %eax
	movl	%eax, %ecx
	movl	66172(%rbp), %eax
	imull	66300(%rbp), %eax
	movl	%eax, %r9d
	movl	66020(%rbp), %r10d
	movl	66024(%rbp), %edx
	movq	66272(%rbp), %rax
	movl	66168(%rbp), %r8d
	movl	%r8d, 64(%rsp)
	movl	66172(%rbp), %r8d
	movl	%r8d, 56(%rsp)
	movq	65992(%rbp), %r8
	movq	%r8, 48(%rsp)
	movq	66176(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	draw_text
	movl	66168(%rbp), %eax
	imull	66296(%rbp), %eax
	movl	%eax, %ecx
	movl	66172(%rbp), %eax
	imull	66300(%rbp), %eax
	movl	%eax, %r9d
	movl	66168(%rbp), %eax
	imull	66296(%rbp), %eax
	movl	66020(%rbp), %edx
	leal	(%rax,%rdx), %r10d
	movl	66024(%rbp), %edx
	movq	66272(%rbp), %rax
	movl	66168(%rbp), %r8d
	movl	%r8d, 64(%rsp)
	movl	66172(%rbp), %r8d
	movl	%r8d, 56(%rsp)
	leaq	144(%rbp), %r8
	movq	%r8, 48(%rsp)
	movq	66176(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	draw_text
	movl	66024(%rbp), %eax
	movl	%eax, 65984(%rbp)
	movl	66168(%rbp), %eax
	imull	66296(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	66020(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 65980(%rbp)
	movl	65984(%rbp), %eax
	addl	$256, %eax
	movl	%eax, 65976(%rbp)
	movl	65980(%rbp), %eax
	addl	$256, %eax
	movl	%eax, 65972(%rbp)
	movl	65976(%rbp), %r9d
	movl	65980(%rbp), %r8d
	movl	65984(%rbp), %edx
	movq	66272(%rbp), %rax
	movq	66080(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	65972(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_image
	movzbl	65991(%rbp), %eax
	movl	$0, %r8d
	movl	$4, %edx
	movl	%eax, %ecx
	call	BGG
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	.LC53(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	pxor	%xmm0, %xmm0
	cvtsi2sdl	65976(%rbp), %xmm0
	pxor	%xmm5, %xmm5
	cvtsi2sdl	65984(%rbp), %xmm5
	movq	%xmm5, %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	lerp
	cvttsd2sil	%xmm0, %eax
	movl	%eax, 65968(%rbp)
	movl	$255, %ecx
	movl	65968(%rbp), %eax
	leal	1(%rax), %r9d
	movl	65968(%rbp), %eax
	leal	-1(%rax), %edx
	movl	65980(%rbp), %r8d
	movq	66272(%rbp), %rax
	movl	%ecx, 40(%rsp)
	movl	65972(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_rectangle_color
	movzbl	65991(%rbp), %eax
	movl	$1, %r8d
	movl	$4, %edx
	movl	%eax, %ecx
	call	BGG
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	.LC53(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	pxor	%xmm0, %xmm0
	cvtsi2sdl	65972(%rbp), %xmm0
	pxor	%xmm3, %xmm3
	cvtsi2sdl	65980(%rbp), %xmm3
	movq	%xmm3, %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	lerp
	cvttsd2sil	%xmm0, %eax
	movl	%eax, 65964(%rbp)
	movl	$255, %r10d
	movl	65964(%rbp), %eax
	leal	1(%rax), %ecx
	movl	65964(%rbp), %eax
	leal	-1(%rax), %r8d
	movl	65976(%rbp), %r9d
	movl	65984(%rbp), %edx
	movq	66272(%rbp), %rax
	movl	%r10d, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	$255, %edi
	movzbl	65991(%rbp), %eax
	movl	$1, %r8d
	movl	$4, %edx
	movl	%eax, %ecx
	call	BGG
	addl	$1, %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	.LC53(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	pxor	%xmm0, %xmm0
	cvtsi2sdl	65972(%rbp), %xmm0
	pxor	%xmm4, %xmm4
	cvtsi2sdl	65980(%rbp), %xmm4
	movq	%xmm4, %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	lerp
	cvttsd2sil	%xmm0, %ebx
	movzbl	65991(%rbp), %eax
	movl	$0, %r8d
	movl	$4, %edx
	movl	%eax, %ecx
	call	BGG
	addl	$1, %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	.LC53(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	pxor	%xmm0, %xmm0
	cvtsi2sdl	65976(%rbp), %xmm0
	pxor	%xmm5, %xmm5
	cvtsi2sdl	65984(%rbp), %xmm5
	movq	%xmm5, %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	lerp
	cvttsd2sil	%xmm0, %ecx
	movl	65964(%rbp), %r8d
	movl	65968(%rbp), %edx
	movq	66272(%rbp), %rax
	movl	%edi, 40(%rsp)
	movl	%ebx, 32(%rsp)
	movl	%ecx, %r9d
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	$0, 66384(%rbp)
	movl	66296(%rbp), %eax
	sall	$5, %eax
	movl	%eax, %edx
	movl	65972(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 65960(%rbp)
	movl	$0, 66380(%rbp)
	jmp	.L192
.L195:
	movl	66152(%rbp), %edx
	movslq	%edx, %rax
	imulq	$1717986919, %rax, %rax
	shrq	$32, %rax
	movl	%eax, %ecx
	sarl	$2, %ecx
	movl	%edx, %eax
	sarl	$31, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	addl	%eax, %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	66152(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$1717986919, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$2, %edx
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %r8d
	movslq	%r8d, %rax
	imulq	$715827883, %rax, %rax
	shrq	$32, %rax
	movq	%rax, %rdx
	movl	%r8d, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%r8d, %edx
	subl	%eax, %edx
	movl	66152(%rbp), %eax
	movslq	%eax, %r8
	imulq	$-2004318071, %r8, %r8
	shrq	$32, %r8
	addl	%eax, %r8d
	sarl	$5, %r8d
	sarl	$31, %eax
	movl	%r8d, %r9d
	subl	%eax, %r9d
	movslq	%r9d, %rax
	imulq	$1717986919, %rax, %rax
	shrq	$32, %rax
	movl	%eax, %r8d
	sarl	$2, %r8d
	movl	%r9d, %eax
	sarl	$31, %eax
	subl	%eax, %r8d
	movl	%r8d, %eax
	sall	$2, %eax
	addl	%r8d, %eax
	addl	%eax, %eax
	subl	%eax, %r9d
	movl	%r9d, %r8d
	movl	66152(%rbp), %eax
	movslq	%eax, %r9
	imulq	$458129845, %r9, %r9
	shrq	$32, %r9
	sarl	$6, %r9d
	sarl	$31, %eax
	movl	%r9d, %r10d
	subl	%eax, %r10d
	movl	66380(%rbp), %eax
	movl	%ecx, 40(%rsp)
	movl	%edx, 32(%rsp)
	movl	$737, %r9d
	movl	%r10d, %edx
	movl	%eax, %ecx
	call	mux_int
	movl	%eax, 65952(%rbp)
	cmpl	$2, 66380(%rbp)
	je	.L193
	movl	65952(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %ecx
	movl	66380(%rbp), %eax
	addl	$1, %eax
	imull	66300(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	66024(%rbp), %eax
	addl	%eax, %edx
	movl	66384(%rbp), %eax
	leal	(%rdx,%rax), %r9d
	movl	66380(%rbp), %eax
	imull	66300(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	66024(%rbp), %eax
	addl	%eax, %edx
	movl	66384(%rbp), %eax
	addl	%eax, %edx
	movl	65972(%rbp), %r8d
	movq	66272(%rbp), %rax
	movl	$32, 72(%rsp)
	movl	$16, 64(%rsp)
	movl	$0, 56(%rsp)
	movl	%ecx, 48(%rsp)
	movq	66160(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	65960(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_image_part
	movl	66300(%rbp), %eax
	addl	%eax, 66384(%rbp)
	jmp	.L194
.L193:
	movl	66300(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	66024(%rbp), %eax
	leal	(%rdx,%rax), %r9d
	movl	66300(%rbp), %eax
	sall	$5, %eax
	movl	%eax, %edx
	movl	66024(%rbp), %eax
	addl	%eax, %edx
	movl	65972(%rbp), %r8d
	movq	66272(%rbp), %rax
	movl	66168(%rbp), %ecx
	movl	%ecx, 64(%rsp)
	movl	66172(%rbp), %ecx
	movl	%ecx, 56(%rsp)
	leaq	.LC54(%rip), %rcx
	movq	%rcx, 48(%rsp)
	movq	66176(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	65960(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_text
.L194:
	addl	$1, 66380(%rbp)
.L192:
	cmpl	$4, 66380(%rbp)
	jle	.L195
	movl	$0, 65956(%rbp)
	movl	66152(%rbp), %eax
	movl	$59, 32(%rsp)
	movl	$5, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	%eax, %ecx
	call	clock_is_between
	testl	%eax, %eax
	je	.L196
	movl	$0, 65956(%rbp)
.L196:
	movl	66152(%rbp), %eax
	movl	$59, 32(%rsp)
	movl	$11, %r9d
	movl	$0, %r8d
	movl	$6, %edx
	movl	%eax, %ecx
	call	clock_is_between
	testl	%eax, %eax
	je	.L197
	movl	$1, 65956(%rbp)
.L197:
	movl	66152(%rbp), %eax
	movl	$59, 32(%rsp)
	movl	$17, %r9d
	movl	$0, %r8d
	movl	$12, %edx
	movl	%eax, %ecx
	call	clock_is_between
	testl	%eax, %eax
	je	.L198
	movl	$2, 65956(%rbp)
.L198:
	movl	66152(%rbp), %eax
	movl	$59, 32(%rsp)
	movl	$23, %r9d
	movl	$0, %r8d
	movl	$18, %edx
	movl	%eax, %ecx
	call	clock_is_between
	testl	%eax, %eax
	je	.L199
	movl	$3, 65956(%rbp)
.L199:
	movq	-40(%rbp), %rsp
.L191:
	movl	66304(%rbp), %eax
	movl	%eax, 65948(%rbp)
	movl	$0, 66376(%rbp)
	jmp	.L200
.L203:
	movl	$0, 66372(%rbp)
	jmp	.L201
.L202:
	movl	66376(%rbp), %eax
	imull	66308(%rbp), %eax
	movl	66372(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65908(%rbp)
	movl	66372(%rbp), %eax
	imull	66300(%rbp), %eax
	imull	66304(%rbp), %eax
	movl	66332(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65904(%rbp)
	movl	66376(%rbp), %eax
	imull	66296(%rbp), %eax
	imull	66304(%rbp), %eax
	movl	66328(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65900(%rbp)
	movl	66372(%rbp), %eax
	addl	$1, %eax
	imull	66300(%rbp), %eax
	imull	66304(%rbp), %eax
	movl	66332(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65896(%rbp)
	movl	66376(%rbp), %eax
	addl	$1, %eax
	imull	66296(%rbp), %eax
	imull	66304(%rbp), %eax
	movl	66328(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65892(%rbp)
	movl	$16711680, %r9d
	movl	$65280, %r8d
	movl	$255, %r10d
	movl	65908(%rbp), %ecx
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
	movl	%eax, 65888(%rbp)
	movl	65896(%rbp), %r9d
	movl	65900(%rbp), %r8d
	movl	65904(%rbp), %edx
	movq	66272(%rbp), %rax
	movl	65888(%rbp), %ecx
	movl	%ecx, 40(%rsp)
	movl	65892(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	66100(%rbp), %eax
	imull	66400(%rbp), %eax
	movl	65908(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65884(%rbp)
	movl	65884(%rbp), %eax
	cltq
	movzbl	160(%rbp,%rax), %eax
	movzbl	%al, %eax
	movl	%eax, 65880(%rbp)
	movl	65880(%rbp), %eax
	cltd
	idivl	66308(%rbp)
	imull	65948(%rbp), %eax
	movl	%eax, %r8d
	movl	65880(%rbp), %eax
	cltd
	idivl	66308(%rbp)
	movl	%edx, %eax
	imull	65948(%rbp), %eax
	movl	%eax, %ecx
	movl	65896(%rbp), %r11d
	movl	65900(%rbp), %r10d
	movl	65904(%rbp), %edx
	movq	66272(%rbp), %rax
	movl	65948(%rbp), %r9d
	movl	%r9d, 72(%rsp)
	movl	65948(%rbp), %r9d
	movl	%r9d, 64(%rsp)
	movl	%r8d, 56(%rsp)
	movl	%ecx, 48(%rsp)
	movq	66192(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	65892(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movl	%r11d, %r9d
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	draw_image_part
	addl	$1, 66372(%rbp)
.L201:
	movl	66372(%rbp), %eax
	cmpl	66308(%rbp), %eax
	jl	.L202
	addl	$1, 66376(%rbp)
.L200:
	movl	66376(%rbp), %eax
	cmpl	66308(%rbp), %eax
	jl	.L203
	movzbl	128(%rbp), %eax
	movzbl	%al, %eax
	imull	65948(%rbp), %eax
	movl	%eax, %edx
	movzbl	133(%rbp), %eax
	movzbl	%al, %eax
	imull	%eax, %edx
	movzbl	132(%rbp), %eax
	movzbl	%al, %eax
	imull	65948(%rbp), %eax
	leal	(%rdx,%rax), %r8d
	movl	116(%rbp), %edx
	movl	65948(%rbp), %eax
	imull	66296(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	movl	112(%rbp), %edx
	movl	65948(%rbp), %eax
	imull	66300(%rbp), %eax
	leal	(%rdx,%rax), %r11d
	movl	116(%rbp), %r10d
	movl	112(%rbp), %edx
	movq	66272(%rbp), %rax
	movl	65948(%rbp), %r9d
	movl	%r9d, 72(%rsp)
	movl	65948(%rbp), %r9d
	movl	%r9d, 64(%rsp)
	movl	$0, 56(%rsp)
	movl	%r8d, 48(%rsp)
	movq	66184(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	%r11d, %r9d
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	draw_image_part
	movl	$0, 66368(%rbp)
	jmp	.L204
.L206:
	movq	waterParticles(%rip), %rdx
	movl	66368(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	12(%rax), %eax
	testl	%eax, %eax
	je	.L205
	movq	waterParticles(%rip), %rdx
	movl	66368(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm1
	movss	.LC55(%rip), %xmm0
	addss	%xmm1, %xmm0
	cvttss2sil	%xmm0, %edx
	movq	waterParticles(%rip), %rcx
	movl	66368(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm1
	movss	.LC56(%rip), %xmm0
	addss	%xmm1, %xmm0
	cvttss2sil	%xmm0, %r9d
	movq	waterParticles(%rip), %rcx
	movl	66368(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movss	4(%rax), %xmm0
	cvttss2sil	%xmm0, %r10d
	movq	waterParticles(%rip), %rcx
	movl	66368(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm0
	cvttss2sil	%xmm0, %eax
	movq	66272(%rbp), %rcx
	movq	66208(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%edx, 32(%rsp)
	movl	%r10d, %r8d
	movl	%eax, %edx
	call	draw_image
.L205:
	addl	$1, 66368(%rbp)
.L204:
	movl	$100, %eax
	cmpl	%eax, 66368(%rbp)
	jl	.L206
	cmpl	$0, 66392(%rbp)
	je	.L207
	movl	66316(%rbp), %r9d
	movl	66328(%rbp), %r8d
	movl	66332(%rbp), %edx
	movq	66272(%rbp), %rax
	movq	66056(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	66312(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_image
	movl	66168(%rbp), %eax
	imull	66296(%rbp), %eax
	movl	%eax, %ecx
	movl	66172(%rbp), %eax
	imull	66300(%rbp), %eax
	movl	%eax, %r9d
	movl	66328(%rbp), %r10d
	movl	66332(%rbp), %edx
	movq	66272(%rbp), %rax
	movl	66168(%rbp), %r8d
	movl	%r8d, 64(%rsp)
	movl	66172(%rbp), %r8d
	movl	%r8d, 56(%rsp)
	movq	66048(%rbp), %r8
	movq	%r8, 48(%rsp)
	movq	66176(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	draw_text
.L207:
	cmpl	$0, 66408(%rbp)
	jle	.L208
	movq	66272(%rbp), %rax
	movl	$255, 32(%rsp)
	movl	$255, %r9d
	movl	$255, %r8d
	movl	$255, %edx
	movq	%rax, %rcx
	call	SDL_SetRenderDrawColor
	leaq	65728(%rbp), %rax
	movq	66272(%rbp), %rcx
	movq	%rax, %rdx
	call	SDL_RenderFillRect
	movl	$0, -4(%rbp)
	movb	$-1, -4(%rbp)
	movl	-4(%rbp), %ecx
	movq	66256(%rbp), %rdx
	movq	66248(%rbp), %rax
	movl	%ecx, %r8d
	movq	%rax, %rcx
	call	TTF_RenderText_Solid
	movq	%rax, 65936(%rbp)
	movq	65936(%rbp), %rdx
	movq	66272(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_CreateTextureFromSurface
	movq	%rax, 65928(%rbp)
	movl	65728(%rbp), %ecx
	movl	65736(%rbp), %r8d
	movq	65936(%rbp), %rax
	movl	16(%rax), %edx
	movl	%r8d, %eax
	subl	%edx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%ecx, %eax
	movl	%eax, -32(%rbp)
	movl	65732(%rbp), %ecx
	movl	65740(%rbp), %r8d
	movq	65936(%rbp), %rax
	movl	20(%rax), %edx
	movl	%r8d, %eax
	subl	%edx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%ecx, %eax
	movl	%eax, -28(%rbp)
	movq	65936(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, -24(%rbp)
	movq	65936(%rbp), %rax
	movl	20(%rax), %eax
	movl	%eax, -20(%rbp)
	leaq	-32(%rbp), %rcx
	movq	65928(%rbp), %rdx
	movq	66272(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	SDL_RenderCopy
	movq	65936(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_FreeSurface
	movq	65928(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
.L208:
	movq	66272(%rbp), %rax
	movl	$255, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	SDL_SetRenderDrawColor
	movl	66404(%rbp), %edx
	leaq	16(%rbp), %rax
	movl	%edx, %r9d
	leaq	.LC57(%rip), %r8
	movl	$20, %edx
	movq	%rax, %rcx
	call	snprintf
	movl	65708(%rbp), %edx
	leaq	16(%rbp), %rax
	movq	66248(%rbp), %rcx
	movl	%edx, %r8d
	movq	%rax, %rdx
	call	TTF_RenderText_Solid
	movq	%rax, 65920(%rbp)
	movq	65920(%rbp), %rdx
	movq	66272(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_CreateTextureFromSurface
	movq	%rax, 65912(%rbp)
	movl	$10, 0(%rbp)
	movl	$720, 4(%rbp)
	movq	65920(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, 8(%rbp)
	movq	65920(%rbp), %rax
	movl	20(%rax), %eax
	movl	%eax, 12(%rbp)
	movq	%rbp, %rcx
	movq	65912(%rbp), %rdx
	movq	66272(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	SDL_RenderCopy
	movq	65920(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_FreeSurface
	movq	65912(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66272(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_RenderPresent
	movl	$16, %ecx
	call	SDL_Delay
.L135:
	cmpl	$0, 66388(%rbp)
	jne	.L136
	leaq	.LC58(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movq	waterParticles(%rip), %rax
	movq	%rax, %rcx
	call	free
	movq	66248(%rbp), %rax
	movq	%rax, %rcx
	call	TTF_CloseFont
	movq	66224(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66216(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66208(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66200(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66192(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66080(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66184(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66056(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66176(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66160(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	call	IMG_Quit
	movl	66068(%rbp), %eax
	movl	%eax, %ecx
	call	SDL_CloseAudioDevice
	movq	72(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_FreeWAV
	movq	66272(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyRenderer
	movq	66280(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyWindow
	call	SDL_Quit
	movl	$500, %ecx
	call	SDL_Delay
	movl	$0, %eax
	jmp	.L119
.L124:
	call	SDL_GetError
	movq	%rax, %rbx
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	66344(%rbp), %rax
	movq	%rbx, %r9
	movq	%rax, %r8
	leaq	.LC59(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	call	SDL_Quit
	movl	$1, %ecx
	call	exit
.L119:
	movq	%rsi, %rsp
	jmp	.L117
.L133:
	movq	%rsi, %rsp
.L117:
	leaq	66424(%rbp), %rsp
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
.LC53:
	.long	0
	.long	1076887552
	.align 4
.LC55:
	.long	1097859072
	.align 4
.LC56:
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
	.def	srand;	.scl	2;	.type	32;	.endef
	.def	SDL_Init;	.scl	2;	.type	32;	.endef
	.def	SDL_CreateWindow;	.scl	2;	.type	32;	.endef
	.def	snprintf;	.scl	2;	.type	32;	.endef
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
