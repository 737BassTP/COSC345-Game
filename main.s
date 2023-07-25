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
	.globl	waterOn
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
	jmp	.L108
.L109:
	movq	waterParticles(%rip), %rdx
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	$1, 12(%rax)
	addl	$1, -4(%rbp)
.L108:
	movl	$100, %eax
	cmpl	%eax, -4(%rbp)
	jl	.L109
	nop
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
	jmp	.L111
.L112:
	movq	waterParticles(%rip), %rdx
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	$0, 12(%rax)
	addl	$1, -4(%rbp)
.L111:
	movl	$100, %eax
	cmpl	%eax, -4(%rbp)
	jl	.L112
	nop
	nop
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	health
	.data
	.align 4
health:
	.long	100
	.globl	maxHealth
	.align 4
maxHealth:
	.long	100
	.text
	.globl	damageMe
	.def	damageMe;	.scl	2;	.type	32;	.endef
	.seh_proc	damageMe
damageMe:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	health(%rip), %eax
	subl	16(%rbp), %eax
	testl	%eax, %eax
	jg	.L114
	movl	$0, health(%rip)
	jmp	.L116
.L114:
	movl	health(%rip), %eax
	subl	16(%rbp), %eax
	movl	%eax, health(%rip)
.L116:
	nop
	popq	%rbp
	ret
	.seh_endproc
	.globl	healMe
	.def	healMe;	.scl	2;	.type	32;	.endef
	.seh_proc	healMe
healMe:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	health(%rip), %edx
	movl	16(%rbp), %eax
	addl	%eax, %edx
	movl	maxHealth(%rip), %eax
	cmpl	%eax, %edx
	jl	.L118
	movl	$100, health(%rip)
	jmp	.L120
.L118:
	movl	health(%rip), %edx
	movl	16(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, health(%rip)
.L120:
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
	jb	.L122
	movq	-8(%rbp), %rax
	movl	$0, 12(%rax)
.L122:
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
	jl	.L128
	movl	16(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jg	.L128
	movl	$1, %eax
	jmp	.L130
.L128:
	movl	$0, %eax
.L130:
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
	pxor	%xmm1, %xmm1
	cvtsi2sdl	16(%rbp), %xmm1
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
	movl	$66776, %eax
	call	___chkstk_ms
	subq	%rax, %rsp
	.seh_stackalloc	66776
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movl	%ecx, 66720(%rbp)
	movq	%rdx, 66728(%rbp)
	movq	%rsp, %rax
	movq	%rax, %r12
	movq	$256, 66552(%rbp)
	movq	66552(%rbp), %rax
	subq	$1, %rax
	movq	%rax, 66544(%rbp)
	movq	66552(%rbp), %rax
	movq	%rax, %r10
	movl	$0, %r11d
	movq	66552(%rbp), %rax
	movq	%rax, %r8
	movl	$0, %r9d
	movq	66552(%rbp), %rax
	addq	$15, %rax
	shrq	$4, %rax
	salq	$4, %rax
	call	___chkstk_ms
	subq	%rax, %rsp
	leaq	80(%rsp), %rax
	addq	$0, %rax
	movq	%rax, 66536(%rbp)
	movl	$1366, 66532(%rbp)
	movl	$768, 66528(%rbp)
	movl	66532(%rbp), %eax
	subl	66528(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, 66524(%rbp)
	movl	$0, 66520(%rbp)
	movl	66528(%rbp), %eax
	movl	%eax, 66516(%rbp)
	movl	66528(%rbp), %eax
	movl	%eax, 66512(%rbp)
	movl	66524(%rbp), %edx
	movl	66516(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 66508(%rbp)
	movl	66520(%rbp), %edx
	movl	66512(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 66504(%rbp)
	movl	$16, 66500(%rbp)
	movl	$16, 66496(%rbp)
	movl	66500(%rbp), %eax
	movl	%eax, %ecx
	call	sqr
	movl	%eax, %esi
	movl	66528(%rbp), %eax
	cltd
	idivl	%esi
	movl	%eax, 66492(%rbp)
	movl	66492(%rbp), %eax
	movl	%eax, 66488(%rbp)
	movl	$100, %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rcx
	call	malloc
	movq	%rax, waterParticles(%rip)
	movq	waterParticles(%rip), %rax
	testq	%rax, %rax
	jne	.L134
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %r9
	movl	$46, %r8d
	movl	$1, %edx
	leaq	.LC15(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$1, %eax
	jmp	.L135
.L134:
	movl	$0, %ecx
	call	time
	movl	%eax, %ecx
	call	srand
	movl	$0, 66636(%rbp)
	jmp	.L136
.L137:
	movl	66528(%rbp), %ecx
	movl	66532(%rbp), %edx
	movl	66636(%rbp), %eax
	movl	%ecx, %r8d
	movl	%eax, %ecx
	call	createWaterParticle
	addl	$1, 66636(%rbp)
.L136:
	movl	$100, %eax
	cmpl	%eax, 66636(%rbp)
	jl	.L137
	movl	$62001, 66484(%rbp)
	movl	66484(%rbp), %eax
	movl	%eax, %ecx
	call	SDL_Init
	testl	%eax, %eax
	je	.L138
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC16(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L135
.L138:
	movl	66532(%rbp), %edx
	movl	$0, 40(%rsp)
	movl	66528(%rbp), %eax
	movl	%eax, 32(%rsp)
	movl	%edx, %r9d
	movl	$536805376, %r8d
	movl	$536805376, %edx
	leaq	.LC17(%rip), %rax
	movq	%rax, %rcx
	call	SDL_CreateWindow
	movq	%rax, 66472(%rbp)
	cmpq	$0, 66472(%rbp)
	jne	.L139
	movq	66552(%rbp), %rdx
	movq	66536(%rbp), %rax
	leaq	.LC18(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L140
.L139:
	movq	66472(%rbp), %rax
	movl	$4, %r8d
	movl	$-1, %edx
	movq	%rax, %rcx
	call	SDL_CreateRenderer
	movq	%rax, 66464(%rbp)
	cmpq	$0, 66464(%rbp)
	jne	.L141
	movq	66552(%rbp), %rdx
	movq	66536(%rbp), %rax
	leaq	.LC19(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L140
.L141:
	movq	66472(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_GetWindowSurface
	movq	%rax, 66456(%rbp)
	cmpq	$0, 66456(%rbp)
	jne	.L142
	movq	66552(%rbp), %rdx
	movq	66536(%rbp), %rax
	leaq	.LC20(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L140
.L142:
	movl	$800, 65872(%rbp)
	movl	$100, 65876(%rbp)
	movl	$100, 65880(%rbp)
	movl	$100, 65884(%rbp)
	movabsq	$2338613357913204068, %rax
	movq	%rax, 65760(%rbp)
	movabsq	$28542640894207341, %rax
	movq	%rax, 65768(%rbp)
	movq	$0, 65776(%rbp)
	movq	$0, 65784(%rbp)
	movq	$0, 65792(%rbp)
	movq	$0, 65800(%rbp)
	movq	$0, 65808(%rbp)
	movq	$0, 65816(%rbp)
	movq	$0, 65824(%rbp)
	movq	$0, 65832(%rbp)
	movq	$0, 65840(%rbp)
	movq	$0, 65848(%rbp)
	movl	$0, 65856(%rbp)
	leaq	65760(%rbp), %rax
	movq	%rax, 66448(%rbp)
	leaq	65872(%rbp), %rax
	movq	%rax, 66440(%rbp)
	movl	$0, 66632(%rbp)
	call	TTF_Init
	cmpl	$-1, %eax
	jne	.L143
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC21(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L135
.L143:
	movl	$12, %edx
	leaq	.LC22(%rip), %rax
	movq	%rax, %rcx
	call	TTF_OpenFont
	movq	%rax, 66432(%rbp)
	cmpq	$0, 66432(%rbp)
	jne	.L144
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC23(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L135
.L144:
	movl	$0, 66428(%rbp)
	movl	$0, 66628(%rbp)
	movb	$0, 65756(%rbp)
	movb	$0, 65757(%rbp)
	movb	$0, 65758(%rbp)
	movb	$-1, 65759(%rbp)
	movq	66472(%rbp), %rax
	movl	$2, %r8d
	movl	$-1, %edx
	movq	%rax, %rcx
	call	SDL_CreateRenderer
	movq	%rax, 66416(%rbp)
	cmpq	$0, 66464(%rbp)
	jne	.L145
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC24(%rip), %rax
	movq	%rax, %rcx
	call	printf
.L145:
	movl	$2, %ecx
	call	IMG_Init
	movq	66464(%rbp), %rax
	leaq	.LC25(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66408(%rbp)
	movq	66464(%rbp), %rax
	leaq	.LC26(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66400(%rbp)
	movq	66464(%rbp), %rax
	leaq	.LC27(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66392(%rbp)
	movq	66464(%rbp), %rax
	leaq	.LC28(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66384(%rbp)
	movq	66464(%rbp), %rax
	leaq	.LC29(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66376(%rbp)
	movq	66464(%rbp), %rax
	leaq	.LC30(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66368(%rbp)
	movq	66464(%rbp), %rax
	leaq	.LC31(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66360(%rbp)
	movl	$8, 66356(%rbp)
	movl	$24, 66352(%rbp)
	movq	66464(%rbp), %rax
	leaq	.LC32(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66344(%rbp)
	movl	$1440, 66340(%rbp)
	movl	$0, 66624(%rbp)
	movl	$0, 66620(%rbp)
	movl	$57, 66336(%rbp)
	movl	$60, 66332(%rbp)
	leaq	.LC33(%rip), %rax
	movq	%rax, 66320(%rbp)
	leaq	.LC34(%rip), %rax
	movq	%rax, 66312(%rbp)
	leaq	.LC35(%rip), %rax
	movq	%rax, 66304(%rbp)
	leaq	.LC36(%rip), %rax
	movq	%rax, 66296(%rbp)
	movl	66500(%rbp), %eax
	movl	%eax, %ecx
	call	sqr
	movl	%eax, 66292(%rbp)
	movl	$256, 66288(%rbp)
	movl	$0, 66616(%rbp)
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC8(%rip), %rax
	movq	%rax, %rcx
	call	fopen
	movq	%rax, 66280(%rbp)
	movl	$0, 66612(%rbp)
	jmp	.L146
.L147:
	movl	66612(%rbp), %eax
	cltq
	movb	$0, 208(%rbp,%rax)
	addl	$1, 66612(%rbp)
.L146:
	movl	66292(%rbp), %eax
	imull	66288(%rbp), %eax
	cmpl	%eax, 66612(%rbp)
	jl	.L147
	movq	66280(%rbp), %rdx
	leaq	208(%rbp), %rax
	movq	%rdx, %r9
	movl	$1, %r8d
	movl	$65536, %edx
	movq	%rax, %rcx
	call	fread
	movq	66280(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movq	66464(%rbp), %rax
	leaq	.LC37(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66272(%rbp)
	movq	66464(%rbp), %rax
	leaq	.LC38(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66264(%rbp)
	leaq	192(%rbp), %rax
	movl	66616(%rbp), %ecx
	movq	%rax, %rdx
	call	level_get_name
	movl	66616(%rbp), %eax
	andl	$31, %eax
	movl	$1, %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %ecx
	movl	66616(%rbp), %eax
	leal	31(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$5, %eax
	movl	%ecx, %edx
	cltq
	movl	%edx, 160(%rbp,%rax,4)
	movl	$0, 66260(%rbp)
	movl	$10, 66256(%rbp)
	movl	$42, %eax
	movb	%al, 158(%rbp)
	movq	66464(%rbp), %rax
	leaq	.LC39(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66248(%rbp)
	movb	$-128, 66247(%rbp)
	movl	66492(%rbp), %eax
	imull	66496(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	66524(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 128(%rbp)
	movl	66488(%rbp), %eax
	imull	66496(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	66520(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 132(%rbp)
	movb	$0, 144(%rbp)
	movb	$0, 145(%rbp)
	movb	$1, 146(%rbp)
	movb	$12, 147(%rbp)
	movb	$0, 148(%rbp)
	movb	$2, 149(%rbp)
	movb	$12, 150(%rbp)
	leaq	.LC40(%rip), %rax
	movq	%rax, 66232(%rbp)
	movq	66232(%rbp), %rax
	leaq	.LC5(%rip), %rdx
	movq	%rax, %rcx
	call	SDL_RWFromFile
	movq	%rax, %rcx
	leaq	88(%rbp), %r8
	leaq	96(%rbp), %rdx
	leaq	84(%rbp), %rax
	movq	%rax, 32(%rsp)
	movq	%r8, %r9
	movq	%rdx, %r8
	movl	$1, %edx
	call	SDL_LoadWAV_RW
	testq	%rax, %rax
	jne	.L148
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC41(%rip), %rax
	movq	%rax, %rcx
	call	printf
	jmp	.L149
.L148:
	movq	88(%rbp), %rax
	movq	%rax, 64(%rbp)
	movl	84(%rbp), %eax
	movl	%eax, 72(%rbp)
	movl	$0, 76(%rbp)
	leaq	audioCallback(%rip), %rax
	movq	%rax, 112(%rbp)
	leaq	64(%rbp), %rax
	movq	%rax, 120(%rbp)
	leaq	96(%rbp), %rax
	movl	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$0, %ecx
	call	SDL_OpenAudioDevice
	movl	%eax, 66228(%rbp)
	cmpl	$0, 66228(%rbp)
	jne	.L150
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC42(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movq	88(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_FreeWAV
	jmp	.L149
.L150:
	movl	84(%rbp), %ecx
	movq	88(%rbp), %rdx
	movl	66228(%rbp), %eax
	movl	%ecx, %r8d
	movl	%eax, %ecx
	call	SDL_QueueAudio
	movl	66228(%rbp), %eax
	movl	$0, %edx
	movl	%eax, %ecx
	call	SDL_PauseAudioDevice
	movl	$1, 66608(%rbp)
	movq	66464(%rbp), %rax
	leaq	.LC43(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66216(%rbp)
	leaq	.LC44(%rip), %rax
	movq	%rax, 66208(%rbp)
	movl	$1, 66604(%rbp)
	leaq	.LC45(%rip), %rax
	movq	%rax, %rcx
	call	puts
	jmp	.L151
.L203:
	movl	65888(%rbp), %eax
	cmpl	$769, %eax
	je	.L153
	cmpl	$769, %eax
	ja	.L152
	cmpl	$256, %eax
	je	.L154
	cmpl	$768, %eax
	je	.L155
	jmp	.L152
.L154:
	movl	$0, 66604(%rbp)
	jmp	.L152
.L155:
	movl	$1, 65944(%rbp)
	movl	65908(%rbp), %eax
	cmpl	$57, %eax
	jg	.L156
	cmpl	$27, %eax
	jge	.L157
	jmp	.L152
.L179:
	subl	$1073741883, %eax
	cmpl	$29, %eax
	ja	.L152
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L160(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L160(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L160:
	.long	.L165-.L160
	.long	.L152-.L160
	.long	.L152-.L160
	.long	.L152-.L160
	.long	.L152-.L160
	.long	.L152-.L160
	.long	.L152-.L160
	.long	.L152-.L160
	.long	.L152-.L160
	.long	.L152-.L160
	.long	.L152-.L160
	.long	.L152-.L160
	.long	.L152-.L160
	.long	.L152-.L160
	.long	.L152-.L160
	.long	.L152-.L160
	.long	.L152-.L160
	.long	.L152-.L160
	.long	.L152-.L160
	.long	.L152-.L160
	.long	.L164-.L160
	.long	.L163-.L160
	.long	.L162-.L160
	.long	.L161-.L160
	.long	.L152-.L160
	.long	.L152-.L160
	.long	.L152-.L160
	.long	.L152-.L160
	.long	.L152-.L160
	.long	.L159-.L160
	.text
.L157:
	subl	$27, %eax
	cmpl	$30, %eax
	ja	.L152
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L167(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L167(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L167:
	.long	.L178-.L167
	.long	.L152-.L167
	.long	.L152-.L167
	.long	.L152-.L167
	.long	.L152-.L167
	.long	.L177-.L167
	.long	.L152-.L167
	.long	.L152-.L167
	.long	.L152-.L167
	.long	.L152-.L167
	.long	.L152-.L167
	.long	.L152-.L167
	.long	.L152-.L167
	.long	.L152-.L167
	.long	.L152-.L167
	.long	.L152-.L167
	.long	.L152-.L167
	.long	.L152-.L167
	.long	.L152-.L167
	.long	.L152-.L167
	.long	.L152-.L167
	.long	.L176-.L167
	.long	.L175-.L167
	.long	.L174-.L167
	.long	.L173-.L167
	.long	.L172-.L167
	.long	.L171-.L167
	.long	.L170-.L167
	.long	.L169-.L167
	.long	.L168-.L167
	.long	.L166-.L167
	.text
.L156:
	cmpl	$1073741912, %eax
	jg	.L152
	cmpl	$1073741883, %eax
	jge	.L179
	jmp	.L152
.L178:
	movl	$0, 66604(%rbp)
	jmp	.L158
.L164:
	movl	65944(%rbp), %eax
	movl	%eax, glob_vk_right(%rip)
	jmp	.L158
.L163:
	movl	65944(%rbp), %eax
	movl	%eax, glob_vk_left(%rip)
	jmp	.L158
.L161:
	movl	65944(%rbp), %eax
	movl	%eax, glob_vk_up(%rip)
	jmp	.L158
.L162:
	movl	65944(%rbp), %eax
	movl	%eax, glob_vk_down(%rip)
	jmp	.L158
.L177:
	movl	65944(%rbp), %eax
	movl	%eax, glob_vk_space(%rip)
	jmp	.L158
.L159:
	movl	65944(%rbp), %eax
	movl	%eax, glob_vk_enter(%rip)
	jmp	.L158
.L165:
	movl	65944(%rbp), %eax
	movl	%eax, glob_vk_f2(%rip)
	jmp	.L158
.L176:
	movl	65944(%rbp), %eax
	movl	%eax, glob_vk_0(%rip)
	jmp	.L158
.L175:
	movl	65944(%rbp), %eax
	movl	%eax, glob_vk_1(%rip)
	jmp	.L158
.L174:
	movl	65944(%rbp), %eax
	movl	%eax, glob_vk_2(%rip)
	jmp	.L158
.L173:
	movl	65944(%rbp), %eax
	movl	%eax, glob_vk_3(%rip)
	jmp	.L158
.L172:
	movl	65944(%rbp), %eax
	movl	%eax, glob_vk_4(%rip)
	jmp	.L158
.L171:
	movl	65944(%rbp), %eax
	movl	%eax, glob_vk_5(%rip)
	jmp	.L158
.L170:
	movl	65944(%rbp), %eax
	movl	%eax, glob_vk_6(%rip)
	jmp	.L158
.L169:
	movl	65944(%rbp), %eax
	movl	%eax, glob_vk_7(%rip)
	jmp	.L158
.L168:
	movl	65944(%rbp), %eax
	movl	%eax, glob_vk_8(%rip)
	jmp	.L158
.L166:
	movl	65944(%rbp), %eax
	movl	%eax, glob_vk_9(%rip)
	nop
.L158:
	jmp	.L152
.L153:
	movl	$0, 65948(%rbp)
	movl	65908(%rbp), %eax
	cmpl	$57, %eax
	jg	.L180
	cmpl	$32, %eax
	jge	.L181
	jmp	.L266
.L202:
	subl	$1073741883, %eax
	cmpl	$29, %eax
	ja	.L266
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L184(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L184(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L184:
	.long	.L189-.L184
	.long	.L266-.L184
	.long	.L266-.L184
	.long	.L266-.L184
	.long	.L266-.L184
	.long	.L266-.L184
	.long	.L266-.L184
	.long	.L266-.L184
	.long	.L266-.L184
	.long	.L266-.L184
	.long	.L266-.L184
	.long	.L266-.L184
	.long	.L266-.L184
	.long	.L266-.L184
	.long	.L266-.L184
	.long	.L266-.L184
	.long	.L266-.L184
	.long	.L266-.L184
	.long	.L266-.L184
	.long	.L266-.L184
	.long	.L188-.L184
	.long	.L187-.L184
	.long	.L186-.L184
	.long	.L185-.L184
	.long	.L266-.L184
	.long	.L266-.L184
	.long	.L266-.L184
	.long	.L266-.L184
	.long	.L266-.L184
	.long	.L183-.L184
	.text
.L181:
	subl	$32, %eax
	cmpl	$25, %eax
	ja	.L266
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L191(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L191(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L191:
	.long	.L201-.L191
	.long	.L266-.L191
	.long	.L266-.L191
	.long	.L266-.L191
	.long	.L266-.L191
	.long	.L266-.L191
	.long	.L266-.L191
	.long	.L266-.L191
	.long	.L266-.L191
	.long	.L266-.L191
	.long	.L266-.L191
	.long	.L266-.L191
	.long	.L266-.L191
	.long	.L266-.L191
	.long	.L266-.L191
	.long	.L266-.L191
	.long	.L200-.L191
	.long	.L199-.L191
	.long	.L198-.L191
	.long	.L197-.L191
	.long	.L196-.L191
	.long	.L195-.L191
	.long	.L194-.L191
	.long	.L193-.L191
	.long	.L192-.L191
	.long	.L190-.L191
	.text
.L180:
	cmpl	$1073741912, %eax
	jg	.L266
	cmpl	$1073741883, %eax
	jge	.L202
	jmp	.L266
.L188:
	movl	65948(%rbp), %eax
	movl	%eax, glob_vk_right(%rip)
	jmp	.L182
.L187:
	movl	65948(%rbp), %eax
	movl	%eax, glob_vk_left(%rip)
	jmp	.L182
.L185:
	movl	65948(%rbp), %eax
	movl	%eax, glob_vk_up(%rip)
	jmp	.L182
.L186:
	movl	65948(%rbp), %eax
	movl	%eax, glob_vk_down(%rip)
	jmp	.L182
.L201:
	movl	65948(%rbp), %eax
	movl	%eax, glob_vk_space(%rip)
	jmp	.L182
.L183:
	movl	65948(%rbp), %eax
	movl	%eax, glob_vk_enter(%rip)
	jmp	.L182
.L189:
	movl	65948(%rbp), %eax
	movl	%eax, glob_vk_f2(%rip)
	jmp	.L182
.L200:
	movl	65948(%rbp), %eax
	movl	%eax, glob_vk_0(%rip)
	jmp	.L182
.L199:
	movl	65948(%rbp), %eax
	movl	%eax, glob_vk_1(%rip)
	jmp	.L182
.L198:
	movl	65948(%rbp), %eax
	movl	%eax, glob_vk_2(%rip)
	jmp	.L182
.L197:
	movl	65948(%rbp), %eax
	movl	%eax, glob_vk_3(%rip)
	jmp	.L182
.L196:
	movl	65948(%rbp), %eax
	movl	%eax, glob_vk_4(%rip)
	jmp	.L182
.L195:
	movl	65948(%rbp), %eax
	movl	%eax, glob_vk_5(%rip)
	jmp	.L182
.L194:
	movl	65948(%rbp), %eax
	movl	%eax, glob_vk_6(%rip)
	jmp	.L182
.L193:
	movl	65948(%rbp), %eax
	movl	%eax, glob_vk_7(%rip)
	jmp	.L182
.L192:
	movl	65948(%rbp), %eax
	movl	%eax, glob_vk_8(%rip)
	jmp	.L182
.L190:
	movl	65948(%rbp), %eax
	movl	%eax, glob_vk_9(%rip)
	nop
.L182:
.L266:
	nop
.L152:
	leaq	65888(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_PollEvent
	testl	%eax, %eax
	jne	.L203
	movl	glob_vk_f2(%rip), %eax
	testl	%eax, %eax
	je	.L204
	leaq	.LC46(%rip), %rax
	movq	%rax, %rcx
	call	puts
	call	dev_tiled_to_leveldata
	leaq	.LC47(%rip), %rax
	movq	%rax, %rcx
	call	puts
.L204:
	movl	glob_vk_0(%rip), %eax
	testl	%eax, %eax
	je	.L205
	movl	$0, glob_vk_0(%rip)
	movl	waterOn(%rip), %eax
	testl	%eax, %eax
	jne	.L206
	movl	$1, waterOn(%rip)
	call	activateAllWaterParticles
	jmp	.L205
.L206:
	movl	$0, waterOn(%rip)
	call	deactivateAllWaterParticles
.L205:
	movl	glob_vk_9(%rip), %eax
	testl	%eax, %eax
	je	.L207
	movl	$0, glob_vk_9(%rip)
	cmpl	$0, 66632(%rbp)
	jne	.L208
	movl	$1, 66632(%rbp)
	leaq	65760(%rbp), %rax
	movabsq	$3184362091757007472, %rdi
	movq	%rdi, (%rax)
	movabsq	$14685297085393969, %rdi
	movq	%rdi, 6(%rax)
	jmp	.L207
.L208:
	movl	$0, 66632(%rbp)
.L207:
	movl	glob_vk_1(%rip), %eax
	testl	%eax, %eax
	je	.L209
	movl	$0, glob_vk_1(%rip)
	cmpl	$1, 66632(%rbp)
	jne	.L209
	leaq	.LC48(%rip), %rax
	movq	%rax, 66200(%rbp)
	movq	$99, 66192(%rbp)
	movq	66192(%rbp), %rcx
	movq	66200(%rbp), %rdx
	leaq	65760(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	strncpy
	leaq	65760(%rbp), %rax
	movq	66192(%rbp), %rdx
	addq	%rdx, %rax
	movb	$0, (%rax)
	addl	$50, 66628(%rbp)
.L209:
	movl	glob_vk_2(%rip), %eax
	testl	%eax, %eax
	je	.L210
	movl	$0, glob_vk_2(%rip)
	cmpl	$1, 66632(%rbp)
	jne	.L210
	leaq	.LC49(%rip), %rax
	movq	%rax, 66184(%rbp)
	movq	$99, 66176(%rbp)
	movq	66176(%rbp), %rcx
	movq	66184(%rbp), %rdx
	leaq	65760(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	strncpy
	leaq	65760(%rbp), %rax
	movq	66176(%rbp), %rdx
	addq	%rdx, %rax
	movb	$0, (%rax)
	addl	$50, 66628(%rbp)
.L210:
	movl	glob_vk_3(%rip), %eax
	testl	%eax, %eax
	je	.L211
	movl	$0, glob_vk_3(%rip)
	cmpl	$1, 66632(%rbp)
	jne	.L211
	leaq	.LC50(%rip), %rax
	movq	%rax, 66168(%rbp)
	movq	$99, 66160(%rbp)
	movq	66160(%rbp), %rcx
	movq	66168(%rbp), %rdx
	leaq	65760(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	strncpy
	leaq	65760(%rbp), %rax
	movq	66160(%rbp), %rdx
	addq	%rdx, %rax
	movb	$0, (%rax)
	addl	$50, 66628(%rbp)
.L211:
	movl	glob_vk_4(%rip), %eax
	testl	%eax, %eax
	je	.L212
	movl	$0, glob_vk_4(%rip)
	cmpl	$1, 66632(%rbp)
	jne	.L212
	leaq	.LC51(%rip), %rax
	movq	%rax, 66152(%rbp)
	movq	$99, 66144(%rbp)
	movq	66144(%rbp), %rcx
	movq	66152(%rbp), %rdx
	leaq	65760(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	strncpy
	leaq	65760(%rbp), %rax
	movq	66144(%rbp), %rdx
	addq	%rdx, %rax
	movb	$0, (%rax)
	addl	$50, 66628(%rbp)
.L212:
	movl	glob_vk_5(%rip), %eax
	testl	%eax, %eax
	je	.L213
	movl	$0, glob_vk_5(%rip)
	movl	$10, %ecx
	call	damageMe
.L213:
	movl	glob_vk_6(%rip), %eax
	testl	%eax, %eax
	je	.L214
	movl	$0, glob_vk_6(%rip)
	movl	$10, %ecx
	call	healMe
.L214:
	movl	glob_vk_right(%rip), %eax
	testl	%eax, %eax
	je	.L215
	movb	$0, 144(%rbp)
	movl	128(%rbp), %edx
	movzbl	150(%rbp), %eax
	movzbl	%al, %eax
	addl	%edx, %eax
	movl	%eax, 128(%rbp)
.L215:
	movl	glob_vk_up(%rip), %eax
	testl	%eax, %eax
	je	.L216
	movb	$1, 144(%rbp)
	movl	132(%rbp), %edx
	movzbl	150(%rbp), %eax
	movzbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, 132(%rbp)
.L216:
	movl	glob_vk_left(%rip), %eax
	testl	%eax, %eax
	je	.L217
	movb	$2, 144(%rbp)
	movl	128(%rbp), %edx
	movzbl	150(%rbp), %eax
	movzbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, 128(%rbp)
.L217:
	movl	glob_vk_down(%rip), %eax
	testl	%eax, %eax
	je	.L218
	movb	$3, 144(%rbp)
	movl	132(%rbp), %edx
	movzbl	150(%rbp), %eax
	movzbl	%al, %eax
	addl	%edx, %eax
	movl	%eax, 132(%rbp)
.L218:
	movl	glob_vk_right(%rip), %edx
	movl	glob_vk_left(%rip), %eax
	orl	%eax, %edx
	movl	glob_vk_up(%rip), %eax
	orl	%eax, %edx
	movl	glob_vk_down(%rip), %eax
	orl	%edx, %eax
	testl	%eax, %eax
	je	.L219
	movzbl	145(%rbp), %edx
	movzbl	146(%rbp), %eax
	addl	%edx, %eax
	movb	%al, 145(%rbp)
	movzbl	148(%rbp), %ecx
	movzbl	145(%rbp), %edx
	movzbl	147(%rbp), %eax
	cmpb	%al, %dl
	setnb	%al
	addl	%ecx, %eax
	movb	%al, 148(%rbp)
	movzbl	145(%rbp), %eax
	movzbl	147(%rbp), %edx
	movzbl	%al, %eax
	divb	%dl
	movzbl	%ah, %eax
	movb	%al, 145(%rbp)
	movzbl	148(%rbp), %eax
	movzbl	149(%rbp), %edx
	movzbl	%al, %eax
	divb	%dl
	movzbl	%ah, %eax
	movb	%al, 148(%rbp)
	movl	66496(%rbp), %eax
	imull	66492(%rbp), %eax
	movl	66508(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, 66140(%rbp)
	movl	66520(%rbp), %eax
	movl	%eax, 66136(%rbp)
	movl	66524(%rbp), %eax
	movl	%eax, 66132(%rbp)
	movl	66496(%rbp), %eax
	imull	66488(%rbp), %eax
	movl	66504(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, 66128(%rbp)
	movl	$0, 66124(%rbp)
	movl	128(%rbp), %eax
	cmpl	%eax, 66140(%rbp)
	jl	.L220
	movl	132(%rbp), %eax
	cmpl	%eax, 66128(%rbp)
	jl	.L220
	movl	128(%rbp), %eax
	cmpl	%eax, 66132(%rbp)
	jg	.L220
	movl	132(%rbp), %eax
	cmpl	%eax, 66136(%rbp)
	jle	.L221
.L220:
	movl	$1, %eax
	jmp	.L222
.L221:
	movl	$0, %eax
.L222:
	movl	%eax, 66124(%rbp)
	movl	128(%rbp), %eax
	cmpl	%eax, 66140(%rbp)
	jge	.L223
	movl	66132(%rbp), %eax
	movl	%eax, 128(%rbp)
	addl	$1, 66616(%rbp)
.L223:
	movl	132(%rbp), %eax
	cmpl	%eax, 66136(%rbp)
	jle	.L224
	movl	66128(%rbp), %eax
	movl	%eax, 132(%rbp)
	pxor	%xmm3, %xmm3
	cvtsi2sdl	66288(%rbp), %xmm3
	movq	%xmm3, %rax
	movq	%rax, %xmm0
	call	sqrt
	cvttsd2sil	%xmm0, %eax
	subl	%eax, 66616(%rbp)
.L224:
	movl	128(%rbp), %eax
	cmpl	%eax, 66132(%rbp)
	jle	.L225
	movl	66140(%rbp), %eax
	movl	%eax, 128(%rbp)
	subl	$1, 66616(%rbp)
.L225:
	movl	132(%rbp), %eax
	cmpl	%eax, 66128(%rbp)
	jge	.L226
	movl	66136(%rbp), %eax
	movl	%eax, 132(%rbp)
	pxor	%xmm4, %xmm4
	cvtsi2sdl	66288(%rbp), %xmm4
	movq	%xmm4, %rax
	movq	%rax, %xmm0
	call	sqrt
	cvttsd2sil	%xmm0, %eax
	addl	%eax, 66616(%rbp)
.L226:
	cmpl	$0, 66124(%rbp)
	je	.L227
	movl	66288(%rbp), %eax
	addl	%eax, 66616(%rbp)
	movl	66616(%rbp), %eax
	cltd
	idivl	66288(%rbp)
	movl	%edx, 66616(%rbp)
	leaq	192(%rbp), %rax
	movl	66616(%rbp), %ecx
	movq	%rax, %rdx
	call	level_get_name
	movl	66616(%rbp), %eax
	leal	31(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$5, %eax
	movl	%eax, %r8d
	movslq	%r8d, %rax
	movl	160(%rbp,%rax,4), %edx
	movl	66616(%rbp), %eax
	andl	$31, %eax
	movl	$1, %r9d
	movl	%eax, %ecx
	sall	%cl, %r9d
	movl	%r9d, %eax
	orl	%eax, %edx
	movslq	%r8d, %rax
	movl	%edx, 160(%rbp,%rax,4)
	jmp	.L227
.L219:
	movb	$0, 145(%rbp)
	movb	$0, 148(%rbp)
.L227:
	movl	glob_vk_space(%rip), %edx
	movl	glob_vk_enter(%rip), %eax
	orl	%edx, %eax
	testl	%eax, %eax
	je	.L228
	movl	$0, 66608(%rbp)
.L228:
	movl	128(%rbp), %eax
	movl	%eax, 136(%rbp)
	movl	132(%rbp), %eax
	movl	%eax, 140(%rbp)
	movl	$0, 66600(%rbp)
	jmp	.L229
.L233:
	movq	waterParticles(%rip), %rdx
	movl	66600(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	12(%rax), %eax
	testl	%eax, %eax
	je	.L230
	movq	waterParticles(%rip), %rdx
	movl	66600(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm1
	movq	waterParticles(%rip), %rdx
	movl	66600(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movss	8(%rax), %xmm0
	movq	waterParticles(%rip), %rdx
	movl	66600(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	addss	%xmm1, %xmm0
	movss	%xmm0, 4(%rax)
	movq	waterParticles(%rip), %rdx
	movl	66600(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2ssl	66528(%rbp), %xmm1
	comiss	%xmm1, %xmm0
	jbe	.L230
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
	jg	.L232
	movq	waterParticles(%rip), %rdx
	movl	66600(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	$0, 12(%rax)
	jmp	.L230
.L232:
	movl	66528(%rbp), %ecx
	movl	66532(%rbp), %edx
	movl	66600(%rbp), %eax
	movl	%ecx, %r8d
	movl	%eax, %ecx
	call	createWaterParticle
.L230:
	addl	$1, 66600(%rbp)
.L229:
	movl	$100, %eax
	cmpl	%eax, 66600(%rbp)
	jl	.L233
	movl	66332(%rbp), %eax
	addl	%eax, 66620(%rbp)
	movl	66620(%rbp), %eax
	cmpl	66336(%rbp), %eax
	setge	%al
	movzbl	%al, %eax
	addl	%eax, 66624(%rbp)
	movl	66624(%rbp), %eax
	cltd
	idivl	66340(%rbp)
	movl	%edx, 66624(%rbp)
	movl	66620(%rbp), %eax
	cltd
	idivl	66336(%rbp)
	movl	%edx, 66620(%rbp)
	leaq	155(%rbp), %rdx
	leaq	58(%rbp), %rax
	movq	%rax, %rcx
	call	strcpy
	cmpl	$0, 66256(%rbp)
	js	.L234
	movl	$43, %eax
	jmp	.L235
.L234:
	movl	$45, %eax
.L235:
	movb	%al, 58(%rbp)
	movl	66256(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$1717986919, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$2, %edx
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	addl	$48, %eax
	movb	%al, 59(%rbp)
	movl	66256(%rbp), %ecx
	movslq	%ecx, %rax
	imulq	$1717986919, %rax, %rax
	shrq	$32, %rax
	movl	%eax, %edx
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
	movb	%al, 60(%rbp)
	movl	$42, %eax
	movb	%al, 61(%rbp)
	cmpl	$0, 66260(%rbp)
	jne	.L236
	movl	$67, %eax
	jmp	.L237
.L236:
	movl	$70, %eax
.L237:
	movb	%al, 62(%rbp)
	movl	$0, %edx
	movq	66464(%rbp), %rax
	movq	%rax, %rcx
	call	draw_clear
	movl	$16777215, %edx
	movq	66464(%rbp), %rax
	movq	%rax, %rcx
	call	draw_set_color
	movl	$33023, %edx
	movl	66524(%rbp), %ecx
	movq	66464(%rbp), %rax
	movl	%edx, 40(%rsp)
	movl	66528(%rbp), %edx
	movl	%edx, 32(%rsp)
	movl	%ecx, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	$8388863, %ecx
	movl	66532(%rbp), %eax
	subl	66524(%rbp), %eax
	movl	%eax, %r8d
	movl	66524(%rbp), %edx
	movq	66464(%rbp), %rax
	movl	%ecx, 40(%rsp)
	movl	66528(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movl	%r8d, %r9d
	movl	$0, %r8d
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	$33023, %edx
	movl	66532(%rbp), %eax
	subl	66524(%rbp), %eax
	movl	66532(%rbp), %r8d
	movq	66464(%rbp), %rcx
	movl	%edx, 40(%rsp)
	movl	66528(%rbp), %edx
	movl	%edx, 32(%rsp)
	movl	%r8d, %r9d
	movl	$0, %r8d
	movl	%eax, %edx
	call	draw_rectangle_color
	movl	66492(%rbp), %eax
	movl	%eax, 66120(%rbp)
	movl	$0, 66116(%rbp)
	cmpl	$0, 66608(%rbp)
	jne	.L238
	movl	66352(%rbp), %eax
	imull	66488(%rbp), %eax
	movl	%eax, %ecx
	movl	66356(%rbp), %eax
	imull	66492(%rbp), %eax
	movl	%eax, %r9d
	movl	66116(%rbp), %r10d
	movl	66120(%rbp), %edx
	movq	66464(%rbp), %rax
	movl	66352(%rbp), %r8d
	movl	%r8d, 64(%rsp)
	movl	66356(%rbp), %r8d
	movl	%r8d, 56(%rsp)
	leaq	.LC52(%rip), %r8
	movq	%r8, 48(%rsp)
	movq	66360(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	draw_text
.L238:
	movl	66492(%rbp), %edx
	movl	66508(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 66120(%rbp)
	movl	$0, 66116(%rbp)
	cmpl	$0, 66608(%rbp)
	jne	.L239
	movq	%rsp, %rax
	movq	%rax, %r13
	leaq	.LC53(%rip), %rax
	movq	%rax, 66104(%rbp)
	movq	66104(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	subq	$1, %rdx
	movq	%rdx, 66096(%rbp)
	movq	%rax, %r14
	movl	$0, %r15d
	movq	%rax, -48(%rbp)
	movq	$0, -40(%rbp)
	addq	$15, %rax
	shrq	$4, %rax
	salq	$4, %rax
	call	___chkstk_ms
	subq	%rax, %rsp
	leaq	80(%rsp), %rax
	addq	$0, %rax
	movq	%rax, 66088(%rbp)
	movq	66104(%rbp), %rdx
	movq	66088(%rbp), %rax
	movq	%rax, %rcx
	call	strcpy
	movl	66616(%rbp), %eax
	movb	%al, 66087(%rbp)
	movzbl	66087(%rbp), %eax
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
	movq	66088(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC54(%rip), %rax
	movq	%rax, %rcx
	call	string_pos
	movl	%ebx, %ecx
	movq	66088(%rbp), %rdx
	cltq
	movb	%cl, (%rdx,%rax)
	movzbl	66087(%rbp), %eax
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
	movq	66088(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC55(%rip), %rax
	movq	%rax, %rcx
	call	string_pos
	movl	%ebx, %ecx
	movq	66088(%rbp), %rdx
	cltq
	movb	%cl, (%rdx,%rax)
	movzbl	66087(%rbp), %ecx
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
	movq	66088(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC56(%rip), %rax
	movq	%rax, %rcx
	call	string_pos
	movl	%ebx, %ecx
	movq	66088(%rbp), %rdx
	cltq
	movb	%cl, (%rdx,%rax)
	movl	66352(%rbp), %eax
	imull	66488(%rbp), %eax
	movl	%eax, %ecx
	movl	66356(%rbp), %eax
	imull	66492(%rbp), %eax
	movl	%eax, %r9d
	movl	66116(%rbp), %r10d
	movl	66120(%rbp), %edx
	movq	66464(%rbp), %rax
	movl	66352(%rbp), %r8d
	movl	%r8d, 64(%rsp)
	movl	66356(%rbp), %r8d
	movl	%r8d, 56(%rsp)
	movq	66088(%rbp), %r8
	movq	%r8, 48(%rsp)
	movq	66360(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	draw_text
	movl	66352(%rbp), %eax
	imull	66488(%rbp), %eax
	movl	%eax, %ecx
	movl	66356(%rbp), %eax
	imull	66492(%rbp), %eax
	movl	%eax, %r9d
	movl	66352(%rbp), %eax
	imull	66488(%rbp), %eax
	movl	66116(%rbp), %edx
	leal	(%rax,%rdx), %r10d
	movl	66120(%rbp), %edx
	movq	66464(%rbp), %rax
	movl	66352(%rbp), %r8d
	movl	%r8d, 64(%rsp)
	movl	66356(%rbp), %r8d
	movl	%r8d, 56(%rsp)
	leaq	192(%rbp), %r8
	movq	%r8, 48(%rsp)
	movq	66360(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	draw_text
	movl	66120(%rbp), %eax
	movl	%eax, 66080(%rbp)
	movl	66352(%rbp), %eax
	imull	66488(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	66116(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 66076(%rbp)
	movl	66080(%rbp), %eax
	addl	$256, %eax
	movl	%eax, 66072(%rbp)
	movl	66076(%rbp), %eax
	addl	$256, %eax
	movl	%eax, 66068(%rbp)
	movl	66072(%rbp), %r9d
	movl	66076(%rbp), %r8d
	movl	66080(%rbp), %edx
	movq	66464(%rbp), %rax
	movq	66272(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	66068(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_image
	movl	$0, 66596(%rbp)
	jmp	.L240
.L242:
	movl	66596(%rbp), %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$27, %eax
	addl	%eax, %edx
	andl	$31, %edx
	subl	%eax, %edx
	movl	%edx, %ecx
	movl	66596(%rbp), %eax
	leal	31(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$5, %eax
	cltq
	movl	160(%rbp,%rax,4), %eax
	movl	%ecx, %edx
	movl	%eax, %ecx
	call	BG
	testl	%eax, %eax
	jne	.L241
	movl	66596(%rbp), %eax
	leal	15(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$4, %eax
	addl	$1, %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	.LC57(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	pxor	%xmm0, %xmm0
	cvtsi2sdl	66068(%rbp), %xmm0
	pxor	%xmm5, %xmm5
	cvtsi2sdl	66076(%rbp), %xmm5
	movq	%xmm5, %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	lerp
	cvttsd2sil	%xmm0, %ebx
	movl	66596(%rbp), %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$28, %eax
	addl	%eax, %edx
	andl	$15, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	addl	$1, %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	.LC57(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	pxor	%xmm0, %xmm0
	cvtsi2sdl	66072(%rbp), %xmm0
	pxor	%xmm3, %xmm3
	cvtsi2sdl	66080(%rbp), %xmm3
	movq	%xmm3, %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	lerp
	cvttsd2sil	%xmm0, %edi
	movl	66596(%rbp), %eax
	leal	15(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$4, %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	.LC57(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	pxor	%xmm0, %xmm0
	cvtsi2sdl	66068(%rbp), %xmm0
	pxor	%xmm4, %xmm4
	cvtsi2sdl	66076(%rbp), %xmm4
	movq	%xmm4, %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	lerp
	cvttsd2sil	%xmm0, %esi
	movl	66596(%rbp), %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$28, %eax
	addl	%eax, %edx
	andl	$15, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	.LC57(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	pxor	%xmm0, %xmm0
	cvtsi2sdl	66072(%rbp), %xmm0
	pxor	%xmm5, %xmm5
	cvtsi2sdl	66080(%rbp), %xmm5
	movq	%xmm5, %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	lerp
	cvttsd2sil	%xmm0, %eax
	movq	66464(%rbp), %rcx
	movq	66264(%rbp), %rdx
	movq	%rdx, 40(%rsp)
	movl	%ebx, 32(%rsp)
	movl	%edi, %r9d
	movl	%esi, %r8d
	movl	%eax, %edx
	call	draw_image
.L241:
	addl	$1, 66596(%rbp)
.L240:
	cmpl	$255, 66596(%rbp)
	jle	.L242
	movzbl	66087(%rbp), %eax
	movl	$0, %r8d
	movl	$4, %edx
	movl	%eax, %ecx
	call	BGG
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	.LC57(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	pxor	%xmm0, %xmm0
	cvtsi2sdl	66072(%rbp), %xmm0
	pxor	%xmm3, %xmm3
	cvtsi2sdl	66080(%rbp), %xmm3
	movq	%xmm3, %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	lerp
	cvttsd2sil	%xmm0, %eax
	movl	%eax, 66064(%rbp)
	movl	$255, %ecx
	movl	66064(%rbp), %eax
	leal	1(%rax), %r9d
	movl	66064(%rbp), %eax
	leal	-1(%rax), %edx
	movl	66076(%rbp), %r8d
	movq	66464(%rbp), %rax
	movl	%ecx, 40(%rsp)
	movl	66068(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_rectangle_color
	movzbl	66087(%rbp), %eax
	movl	$1, %r8d
	movl	$4, %edx
	movl	%eax, %ecx
	call	BGG
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	.LC57(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	pxor	%xmm0, %xmm0
	cvtsi2sdl	66068(%rbp), %xmm0
	pxor	%xmm4, %xmm4
	cvtsi2sdl	66076(%rbp), %xmm4
	movq	%xmm4, %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	lerp
	cvttsd2sil	%xmm0, %eax
	movl	%eax, 66060(%rbp)
	movl	$255, %r10d
	movl	66060(%rbp), %eax
	leal	1(%rax), %ecx
	movl	66060(%rbp), %eax
	leal	-1(%rax), %r8d
	movl	66072(%rbp), %r9d
	movl	66080(%rbp), %edx
	movq	66464(%rbp), %rax
	movl	%r10d, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	$255, %esi
	movzbl	66087(%rbp), %eax
	movl	$1, %r8d
	movl	$4, %edx
	movl	%eax, %ecx
	call	BGG
	addl	$1, %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	.LC57(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	pxor	%xmm0, %xmm0
	cvtsi2sdl	66068(%rbp), %xmm0
	pxor	%xmm5, %xmm5
	cvtsi2sdl	66076(%rbp), %xmm5
	movq	%xmm5, %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	lerp
	cvttsd2sil	%xmm0, %ebx
	movzbl	66087(%rbp), %eax
	movl	$0, %r8d
	movl	$4, %edx
	movl	%eax, %ecx
	call	BGG
	addl	$1, %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	.LC57(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	pxor	%xmm0, %xmm0
	cvtsi2sdl	66072(%rbp), %xmm0
	pxor	%xmm3, %xmm3
	cvtsi2sdl	66080(%rbp), %xmm3
	movq	%xmm3, %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	lerp
	cvttsd2sil	%xmm0, %ecx
	movl	66060(%rbp), %r8d
	movl	66064(%rbp), %edx
	movq	66464(%rbp), %rax
	movl	%esi, 40(%rsp)
	movl	%ebx, 32(%rsp)
	movl	%ecx, %r9d
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	$0, 66592(%rbp)
	movl	66488(%rbp), %eax
	sall	$5, %eax
	movl	%eax, %edx
	movl	66068(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 66056(%rbp)
	movl	$0, 66588(%rbp)
	jmp	.L243
.L246:
	movl	66624(%rbp), %edx
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
	movl	66624(%rbp), %eax
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
	movl	66624(%rbp), %eax
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
	movl	66624(%rbp), %eax
	movslq	%eax, %r9
	imulq	$458129845, %r9, %r9
	shrq	$32, %r9
	sarl	$6, %r9d
	sarl	$31, %eax
	movl	%r9d, %r10d
	subl	%eax, %r10d
	movl	66588(%rbp), %eax
	movl	%ecx, 40(%rsp)
	movl	%edx, 32(%rsp)
	movl	$737, %r9d
	movl	%r10d, %edx
	movl	%eax, %ecx
	call	mux_int
	movl	%eax, 66040(%rbp)
	cmpl	$2, 66588(%rbp)
	je	.L244
	movl	66040(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %ecx
	movl	66588(%rbp), %eax
	addl	$1, %eax
	imull	66492(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	66120(%rbp), %eax
	addl	%eax, %edx
	movl	66592(%rbp), %eax
	leal	(%rdx,%rax), %r9d
	movl	66588(%rbp), %eax
	imull	66492(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	66120(%rbp), %eax
	addl	%eax, %edx
	movl	66592(%rbp), %eax
	addl	%eax, %edx
	movl	66068(%rbp), %r8d
	movq	66464(%rbp), %rax
	movl	$32, 72(%rsp)
	movl	$16, 64(%rsp)
	movl	$0, 56(%rsp)
	movl	%ecx, 48(%rsp)
	movq	66344(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	66056(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_image_part
	movl	66492(%rbp), %eax
	addl	%eax, 66592(%rbp)
	jmp	.L245
.L244:
	movl	66492(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	66120(%rbp), %eax
	leal	(%rdx,%rax), %r9d
	movl	66492(%rbp), %eax
	sall	$5, %eax
	movl	%eax, %edx
	movl	66120(%rbp), %eax
	addl	%eax, %edx
	movl	66068(%rbp), %r8d
	movq	66464(%rbp), %rax
	movl	66352(%rbp), %ecx
	movl	%ecx, 64(%rsp)
	movl	66356(%rbp), %ecx
	movl	%ecx, 56(%rsp)
	leaq	.LC58(%rip), %rcx
	movq	%rcx, 48(%rsp)
	movq	66360(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	66056(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_text
.L245:
	addl	$1, 66588(%rbp)
.L243:
	cmpl	$4, 66588(%rbp)
	jle	.L246
	movl	$0, 66052(%rbp)
	movl	66624(%rbp), %eax
	movl	$59, 32(%rsp)
	movl	$5, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	%eax, %ecx
	call	clock_is_between
	testl	%eax, %eax
	je	.L247
	movl	$0, 66052(%rbp)
.L247:
	movl	66624(%rbp), %eax
	movl	$59, 32(%rsp)
	movl	$11, %r9d
	movl	$0, %r8d
	movl	$6, %edx
	movl	%eax, %ecx
	call	clock_is_between
	testl	%eax, %eax
	je	.L248
	movl	$1, 66052(%rbp)
.L248:
	movl	66624(%rbp), %eax
	movl	$59, 32(%rsp)
	movl	$17, %r9d
	movl	$0, %r8d
	movl	$12, %edx
	movl	%eax, %ecx
	call	clock_is_between
	testl	%eax, %eax
	je	.L249
	movl	$2, 66052(%rbp)
.L249:
	movl	66624(%rbp), %eax
	movl	$59, 32(%rsp)
	movl	$23, %r9d
	movl	$0, %r8d
	movl	$18, %edx
	movl	%eax, %ecx
	call	clock_is_between
	testl	%eax, %eax
	je	.L250
	movl	$3, 66052(%rbp)
.L250:
	movl	66056(%rbp), %edx
	movl	66488(%rbp), %eax
	addl	%eax, %edx
	movl	66352(%rbp), %eax
	imull	66488(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 66048(%rbp)
	movl	66488(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	66048(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 66044(%rbp)
	movl	66492(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	66120(%rbp), %eax
	leal	(%rdx,%rax), %r9d
	movl	66048(%rbp), %r8d
	movl	66120(%rbp), %edx
	movq	66464(%rbp), %rax
	movq	66248(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	66044(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_image
	movl	66352(%rbp), %eax
	imull	66488(%rbp), %eax
	movl	%eax, %ebx
	movl	66356(%rbp), %eax
	imull	66492(%rbp), %eax
	movl	%eax, %esi
	pxor	%xmm0, %xmm0
	cvtsi2sdl	66044(%rbp), %xmm0
	pxor	%xmm4, %xmm4
	cvtsi2sdl	66048(%rbp), %xmm4
	movq	%xmm4, %rax
	movsd	.LC59(%rip), %xmm1
	movapd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	lerp
	cvttsd2sil	%xmm0, %r8d
	movl	66120(%rbp), %eax
	leal	48(%rax), %edx
	movq	66464(%rbp), %rax
	movl	66352(%rbp), %ecx
	movl	%ecx, 64(%rsp)
	movl	66356(%rbp), %ecx
	movl	%ecx, 56(%rsp)
	leaq	58(%rbp), %rcx
	movq	%rcx, 48(%rsp)
	movq	66360(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	%ebx, 32(%rsp)
	movl	%esi, %r9d
	movq	%rax, %rcx
	call	draw_text
	movq	%r13, %rsp
.L239:
	movl	66496(%rbp), %eax
	movl	%eax, 66036(%rbp)
	movl	$0, 66584(%rbp)
	jmp	.L251
.L254:
	movl	$0, 66580(%rbp)
	jmp	.L252
.L253:
	movl	66584(%rbp), %eax
	imull	66500(%rbp), %eax
	movl	66580(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65980(%rbp)
	movl	66580(%rbp), %eax
	imull	66492(%rbp), %eax
	imull	66496(%rbp), %eax
	movl	66524(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65976(%rbp)
	movl	66584(%rbp), %eax
	imull	66488(%rbp), %eax
	imull	66496(%rbp), %eax
	movl	66520(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65972(%rbp)
	movl	66580(%rbp), %eax
	addl	$1, %eax
	imull	66492(%rbp), %eax
	imull	66496(%rbp), %eax
	movl	66524(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65968(%rbp)
	movl	66584(%rbp), %eax
	addl	$1, %eax
	imull	66488(%rbp), %eax
	imull	66496(%rbp), %eax
	movl	66520(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65964(%rbp)
	movl	$16711680, %r9d
	movl	$65280, %r8d
	movl	$255, %r10d
	movl	65980(%rbp), %ecx
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
	movl	%eax, 65960(%rbp)
	movl	65968(%rbp), %r9d
	movl	65972(%rbp), %r8d
	movl	65976(%rbp), %edx
	movq	66464(%rbp), %rax
	movl	65960(%rbp), %ecx
	movl	%ecx, 40(%rsp)
	movl	65964(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	66292(%rbp), %eax
	imull	66616(%rbp), %eax
	movl	65980(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65956(%rbp)
	movl	65956(%rbp), %eax
	cltq
	movzbl	208(%rbp,%rax), %eax
	movzbl	%al, %eax
	movl	%eax, 65952(%rbp)
	movl	65952(%rbp), %eax
	cltd
	idivl	66500(%rbp)
	imull	66036(%rbp), %eax
	movl	%eax, %r8d
	movl	65952(%rbp), %eax
	cltd
	idivl	66500(%rbp)
	movl	%edx, %eax
	imull	66036(%rbp), %eax
	movl	%eax, %ecx
	movl	65968(%rbp), %r11d
	movl	65972(%rbp), %r10d
	movl	65976(%rbp), %edx
	movq	66464(%rbp), %rax
	movl	66036(%rbp), %r9d
	movl	%r9d, 72(%rsp)
	movl	66036(%rbp), %r9d
	movl	%r9d, 64(%rsp)
	movl	%r8d, 56(%rsp)
	movl	%ecx, 48(%rsp)
	movq	66376(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	65964(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movl	%r11d, %r9d
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	draw_image_part
	addl	$1, 66580(%rbp)
.L252:
	movl	66580(%rbp), %eax
	cmpl	66500(%rbp), %eax
	jl	.L253
	addl	$1, 66584(%rbp)
.L251:
	movl	66584(%rbp), %eax
	cmpl	66500(%rbp), %eax
	jl	.L254
	movzbl	144(%rbp), %eax
	movzbl	%al, %eax
	imull	66036(%rbp), %eax
	movl	%eax, %edx
	movzbl	149(%rbp), %eax
	movzbl	%al, %eax
	imull	%eax, %edx
	movzbl	148(%rbp), %eax
	movzbl	%al, %eax
	imull	66036(%rbp), %eax
	leal	(%rdx,%rax), %r8d
	movl	132(%rbp), %edx
	movl	66036(%rbp), %eax
	imull	66488(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	movl	128(%rbp), %edx
	movl	66036(%rbp), %eax
	imull	66492(%rbp), %eax
	leal	(%rdx,%rax), %r11d
	movl	132(%rbp), %r10d
	movl	128(%rbp), %edx
	movq	66464(%rbp), %rax
	movl	66036(%rbp), %r9d
	movl	%r9d, 72(%rsp)
	movl	66036(%rbp), %r9d
	movl	%r9d, 64(%rsp)
	movl	$0, 56(%rsp)
	movl	%r8d, 48(%rsp)
	movq	66368(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	%r11d, %r9d
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	draw_image_part
	cmpl	$0, 66632(%rbp)
	jle	.L255
	movl	128(%rbp), %eax
	addl	$60, %eax
	movl	%eax, 65872(%rbp)
	movl	132(%rbp), %eax
	subl	$120, %eax
	movl	%eax, 65876(%rbp)
	movq	66464(%rbp), %rax
	movl	$255, 32(%rsp)
	movl	$255, %r9d
	movl	$255, %r8d
	movl	$255, %edx
	movq	%rax, %rcx
	call	SDL_SetRenderDrawColor
	movq	66440(%rbp), %rdx
	movq	66464(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_RenderFillRect
	movq	66464(%rbp), %rax
	movl	$255, 32(%rsp)
	movl	$255, %r9d
	movl	$255, %r8d
	movl	$255, %edx
	movq	%rax, %rcx
	call	SDL_SetRenderDrawColor
	movq	66440(%rbp), %rax
	movl	4(%rax), %ecx
	movq	66440(%rbp), %rax
	movl	12(%rax), %eax
	leal	3(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$2, %eax
	addl	%eax, %ecx
	movq	66440(%rbp), %rax
	movl	(%rax), %eax
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%eax, %xmm1
	movq	66440(%rbp), %rax
	movl	8(%rax), %eax
	pxor	%xmm2, %xmm2
	cvtsi2sdl	%eax, %xmm2
	movsd	.LC60(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %r8d
	movl	132(%rbp), %eax
	leal	-15(%rax), %r10d
	movl	128(%rbp), %eax
	leal	45(%rax), %edx
	movq	66464(%rbp), %rax
	movl	%ecx, 32(%rsp)
	movl	%r8d, %r9d
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	SDL_RenderDrawLine
	movq	66440(%rbp), %rax
	movl	4(%rax), %edx
	movq	66440(%rbp), %rax
	movl	12(%rax), %eax
	leal	(%rdx,%rax), %ecx
	movq	66440(%rbp), %rax
	movl	(%rax), %eax
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%eax, %xmm1
	movq	66440(%rbp), %rax
	movl	8(%rax), %eax
	pxor	%xmm2, %xmm2
	cvtsi2sdl	%eax, %xmm2
	movsd	.LC61(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %r8d
	movl	132(%rbp), %eax
	leal	-15(%rax), %r10d
	movl	128(%rbp), %eax
	leal	45(%rax), %edx
	movq	66464(%rbp), %rax
	movl	%ecx, 32(%rsp)
	movl	%r8d, %r9d
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	SDL_RenderDrawLine
	movl	$0, 12(%rbp)
	movq	66440(%rbp), %rax
	movl	8(%rax), %eax
	subl	$10, %eax
	movl	%eax, 66032(%rbp)
	movl	66032(%rbp), %r8d
	movl	12(%rbp), %ecx
	movq	66448(%rbp), %rdx
	movq	66432(%rbp), %rax
	movl	%r8d, %r9d
	movl	%ecx, %r8d
	movq	%rax, %rcx
	call	TTF_RenderText_Blended_Wrapped
	movq	%rax, 66568(%rbp)
	cmpq	$0, 66568(%rbp)
	jne	.L256
	movl	12(%rbp), %edx
	movq	66432(%rbp), %rax
	movl	%edx, %r8d
	leaq	.LC62(%rip), %rdx
	movq	%rax, %rcx
	call	TTF_RenderText_Solid
	movq	%rax, 66568(%rbp)
.L256:
	movq	66568(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, 66028(%rbp)
	movq	66568(%rbp), %rax
	movl	20(%rax), %eax
	movl	%eax, 66024(%rbp)
	movq	66440(%rbp), %rax
	movl	(%rax), %edx
	movq	66440(%rbp), %rax
	movl	8(%rax), %eax
	subl	66028(%rbp), %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	sarl	%eax
	addl	%edx, %eax
	movl	%eax, 66020(%rbp)
	movq	66440(%rbp), %rax
	movl	4(%rax), %edx
	movq	66440(%rbp), %rax
	movl	12(%rax), %eax
	subl	66024(%rbp), %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	sarl	%eax
	addl	%edx, %eax
	movl	%eax, 66016(%rbp)
	movl	66020(%rbp), %eax
	movl	%eax, -16(%rbp)
	movl	66016(%rbp), %eax
	movl	%eax, -12(%rbp)
	movl	66028(%rbp), %eax
	movl	%eax, -8(%rbp)
	movl	66024(%rbp), %eax
	movl	%eax, -4(%rbp)
	movq	66568(%rbp), %rdx
	movq	66464(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_CreateTextureFromSurface
	movq	%rax, 66008(%rbp)
	leaq	-16(%rbp), %rcx
	movq	66008(%rbp), %rdx
	movq	66464(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	SDL_RenderCopy
	movq	66568(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_FreeSurface
	movq	66008(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
.L255:
	movl	$0, 66564(%rbp)
	jmp	.L257
.L259:
	movq	waterParticles(%rip), %rdx
	movl	66564(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	12(%rax), %eax
	testl	%eax, %eax
	je	.L258
	movq	waterParticles(%rip), %rdx
	movl	66564(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm1
	movss	.LC63(%rip), %xmm0
	addss	%xmm1, %xmm0
	cvttss2sil	%xmm0, %edx
	movq	waterParticles(%rip), %rcx
	movl	66564(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm1
	movss	.LC64(%rip), %xmm0
	addss	%xmm1, %xmm0
	cvttss2sil	%xmm0, %r9d
	movq	waterParticles(%rip), %rcx
	movl	66564(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movss	4(%rax), %xmm0
	cvttss2sil	%xmm0, %r10d
	movq	waterParticles(%rip), %rcx
	movl	66564(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm0
	cvttss2sil	%xmm0, %eax
	movq	66464(%rbp), %rcx
	movq	66392(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%edx, 32(%rsp)
	movl	%r10d, %r8d
	movl	%eax, %edx
	call	draw_image
.L258:
	addl	$1, 66564(%rbp)
.L257:
	movl	$100, %eax
	cmpl	%eax, 66564(%rbp)
	jl	.L259
	cmpl	$0, 66608(%rbp)
	jne	.L260
	movq	66464(%rbp), %rax
	movl	$255, 32(%rsp)
	movl	$255, %r9d
	movl	$255, %r8d
	movl	$255, %edx
	movq	%rax, %rcx
	call	SDL_SetRenderDrawColor
	movl	$200, 66004(%rbp)
	movl	health(%rip), %eax
	imull	66004(%rbp), %eax
	movl	maxHealth(%rip), %edi
	cltd
	idivl	%edi
	movl	%eax, 66000(%rbp)
	movq	66464(%rbp), %rax
	movl	$255, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$255, %edx
	movq	%rax, %rcx
	call	SDL_SetRenderDrawColor
	movl	$0, -32(%rbp)
	movl	$200, -28(%rbp)
	movl	66000(%rbp), %eax
	movl	%eax, -24(%rbp)
	movl	$20, -20(%rbp)
	leaq	-32(%rbp), %rax
	movq	66464(%rbp), %rcx
	movq	%rax, %rdx
	call	SDL_RenderFillRect
.L260:
	cmpl	$0, 66608(%rbp)
	je	.L261
	movl	66508(%rbp), %r9d
	movl	66520(%rbp), %r8d
	movl	66524(%rbp), %edx
	movq	66464(%rbp), %rax
	movq	66216(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	66504(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_image
	movl	66352(%rbp), %eax
	imull	66488(%rbp), %eax
	movl	%eax, %ecx
	movl	66356(%rbp), %eax
	imull	66492(%rbp), %eax
	movl	%eax, %r9d
	movl	66520(%rbp), %r10d
	movl	66524(%rbp), %edx
	movq	66464(%rbp), %rax
	movl	66352(%rbp), %r8d
	movl	%r8d, 64(%rsp)
	movl	66356(%rbp), %r8d
	movl	%r8d, 56(%rsp)
	movq	66208(%rbp), %r8
	movq	%r8, 48(%rsp)
	movq	66360(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	draw_text
.L261:
	movq	66464(%rbp), %rax
	movl	$255, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	SDL_SetRenderDrawColor
	movl	66628(%rbp), %edx
	leaq	32(%rbp), %rax
	movl	%edx, %r9d
	leaq	.LC65(%rip), %r8
	movl	$20, %edx
	movq	%rax, %rcx
	call	snprintf
	movl	65756(%rbp), %edx
	leaq	32(%rbp), %rax
	movq	66432(%rbp), %rcx
	movl	%edx, %r8d
	movq	%rax, %rdx
	call	TTF_RenderText_Solid
	movq	%rax, 65992(%rbp)
	movq	65992(%rbp), %rdx
	movq	66464(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_CreateTextureFromSurface
	movq	%rax, 65984(%rbp)
	movl	$10, 16(%rbp)
	movl	$720, 20(%rbp)
	movq	65992(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, 24(%rbp)
	movq	65992(%rbp), %rax
	movl	20(%rax), %eax
	movl	%eax, 28(%rbp)
	leaq	16(%rbp), %rcx
	movq	65984(%rbp), %rdx
	movq	66464(%rbp), %rax
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
	movq	66464(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_RenderPresent
	movl	$16, %ecx
	call	SDL_Delay
.L151:
	cmpl	$0, 66604(%rbp)
	jne	.L152
	leaq	.LC66(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movq	waterParticles(%rip), %rax
	movq	%rax, %rcx
	call	free
	movq	66432(%rbp), %rax
	movq	%rax, %rcx
	call	TTF_CloseFont
	movq	66408(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66400(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66392(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66384(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66376(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66272(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66264(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66368(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66216(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66360(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66344(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66248(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	call	IMG_Quit
	movl	66228(%rbp), %eax
	movl	%eax, %ecx
	call	SDL_CloseAudioDevice
	movq	88(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_FreeWAV
	movq	66464(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyRenderer
	movq	66472(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyWindow
	call	SDL_Quit
	movl	$500, %ecx
	call	SDL_Delay
	movl	$0, %eax
	jmp	.L135
.L140:
	call	SDL_GetError
	movq	%rax, %rbx
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	66536(%rbp), %rax
	movq	%rbx, %r9
	movq	%rax, %r8
	leaq	.LC67(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	call	SDL_Quit
	movl	$1, %ecx
	call	exit
.L135:
	movq	%r12, %rsp
	jmp	.L133
.L149:
	movq	%r12, %rsp
.L133:
	leaq	66648(%rbp), %rsp
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
