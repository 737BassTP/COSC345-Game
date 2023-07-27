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
	.globl	make_color_hsv
	.def	make_color_hsv;	.scl	2;	.type	32;	.endef
	.seh_proc	make_color_hsv
make_color_hsv:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$96, %rsp
	.seh_stackalloc	96
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	cvtsi2sd	32(%rbp), %xmm1
	cvtsi2sd	24(%rbp), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -32(%rbp)
	cvtsi2sd	16(%rbp), %xmm0
	movsd	.LC1(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movsd	.LC2(%rip), %xmm0
	movapd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	call	lerp
	movq	%xmm0, %rax
	movq	%rax, -40(%rbp)
	movsd	-40(%rbp), %xmm0
	movsd	.LC4(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -48(%rbp)
	movsd	-48(%rbp), %xmm0
	cvttsd2si	%xmm0, %eax
	cltd
	shrl	$31, %edx
	addl	%edx, %eax
	andl	$1, %eax
	subl	%edx, %eax
	subl	$1, %eax
	cltd
	xorl	%edx, %eax
	subl	%edx, %eax
	cvtsi2sd	%eax, %xmm1
	movsd	.LC5(%rip), %xmm0
	subsd	%xmm1, %xmm0
	movsd	-32(%rbp), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -56(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %xmm0
	call	floor
	cvttsd2si	%xmm0, %eax
	cmpl	$5, %eax
	ja	.L11
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L13(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L13(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L13:
	.long	.L18-.L13
	.long	.L17-.L13
	.long	.L16-.L13
	.long	.L15-.L13
	.long	.L14-.L13
	.long	.L12-.L13
	.text
.L18:
	movsd	-32(%rbp), %xmm0
	movsd	%xmm0, -8(%rbp)
	movsd	-56(%rbp), %xmm0
	movsd	%xmm0, -16(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -24(%rbp)
	jmp	.L11
.L17:
	movsd	-56(%rbp), %xmm0
	movsd	%xmm0, -8(%rbp)
	movsd	-32(%rbp), %xmm0
	movsd	%xmm0, -16(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -24(%rbp)
	jmp	.L11
.L16:
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -8(%rbp)
	movsd	-32(%rbp), %xmm0
	movsd	%xmm0, -16(%rbp)
	movsd	-56(%rbp), %xmm0
	movsd	%xmm0, -24(%rbp)
	jmp	.L11
.L15:
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -8(%rbp)
	movsd	-56(%rbp), %xmm0
	movsd	%xmm0, -16(%rbp)
	movsd	-32(%rbp), %xmm0
	movsd	%xmm0, -24(%rbp)
	jmp	.L11
.L14:
	movsd	-56(%rbp), %xmm0
	movsd	%xmm0, -8(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -16(%rbp)
	movsd	-32(%rbp), %xmm0
	movsd	%xmm0, -24(%rbp)
	jmp	.L11
.L12:
	movsd	-32(%rbp), %xmm0
	movsd	%xmm0, -8(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -16(%rbp)
	movsd	-56(%rbp), %xmm0
	movsd	%xmm0, -24(%rbp)
	nop
.L11:
	cvtsi2sd	32(%rbp), %xmm0
	subsd	-32(%rbp), %xmm0
	movsd	%xmm0, -64(%rbp)
	movsd	-24(%rbp), %xmm0
	addsd	-64(%rbp), %xmm0
	cvttsd2si	%xmm0, %eax
	movl	%eax, %edx
	sall	$8, %edx
	subl	%eax, %edx
	movl	%edx, %r8d
	movsd	-16(%rbp), %xmm0
	addsd	-64(%rbp), %xmm0
	cvttsd2si	%xmm0, %eax
	movl	%eax, %edx
	sall	$8, %edx
	movl	%edx, %ecx
	subl	%eax, %ecx
	movsd	-8(%rbp), %xmm0
	addsd	-64(%rbp), %xmm0
	cvttsd2si	%xmm0, %eax
	movl	%eax, %edx
	sall	$8, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%ecx, %edx
	movl	%eax, %ecx
	call	make_color_rgb
	addq	$96, %rsp
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
	jmp	.L35
.L38:
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
	jne	.L36
	movl	-12(%rbp), %eax
	cltq
	leaq	1(%rax), %rdx
	movq	64(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$32, %eax
	cmpl	%eax, -24(%rbp)
	je	.L36
	movl	$0, -4(%rbp)
	movl	48(%rbp), %eax
	addl	%eax, -8(%rbp)
	jmp	.L37
.L36:
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
.L37:
	addl	$1, -12(%rbp)
.L35:
	movl	-12(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jl	.L38
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
	jmp	.L46
.L47:
	movq	-16(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	addl	$1, -8(%rbp)
.L46:
	movl	-8(%rbp), %eax
	cmpl	16(%rbp), %eax
	jl	.L47
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
	jmp	.L50
.L51:
	movq	-24(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	addl	$1, -12(%rbp)
.L50:
	movl	-12(%rbp), %eax
	cmpl	16(%rbp), %eax
	jl	.L51
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
	jmp	.L54
.L55:
	movq	-16(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movq	(%rax), %rax
	movl	%eax, -4(%rbp)
	addl	$1, -8(%rbp)
.L54:
	movl	-8(%rbp), %eax
	cmpl	16(%rbp), %eax
	jl	.L55
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
	jmp	.L58
.L61:
	movq	-24(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movl	(%rax), %eax
	movl	%eax, -12(%rbp)
	movl	24(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jne	.L59
	movl	-4(%rbp), %eax
	jmp	.L62
.L59:
	addl	$1, -4(%rbp)
.L58:
	movl	-4(%rbp), %eax
	cmpl	16(%rbp), %eax
	jl	.L61
	movl	$-1, %eax
.L62:
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
	movsd	.LC6(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movsd	.LC7(%rip), %xmm0
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
	movsd	.LC7(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movsd	.LC6(%rip), %xmm0
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
	jl	.L76
	movl	16(%rbp), %eax
	cmpl	48(%rbp), %eax
	jge	.L76
	movl	24(%rbp), %eax
	cmpl	40(%rbp), %eax
	jl	.L76
	movl	24(%rbp), %eax
	cmpl	56(%rbp), %eax
	jge	.L76
	movl	$1, %eax
	jmp	.L78
.L76:
	movl	$0, %eax
.L78:
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
	jne	.L80
	movl	$0, %eax
	jmp	.L81
.L80:
	cmpl	$4, -4(%rbp)
	jne	.L82
	movl	$1, %eax
	jmp	.L81
.L82:
	movl	$2, %eax
.L81:
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
	jmp	.L84
.L87:
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
	jne	.L85
	movl	-4(%rbp), %eax
	jmp	.L86
.L85:
	addl	$1, -4(%rbp)
.L84:
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L87
	movl	$-1, %eax
.L86:
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
	movsd	.LC2(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	movsd	-8(%rbp), %xmm0
	comisd	.LC2(%rip), %xmm0
	jb	.L91
	movsd	-8(%rbp), %xmm0
	movsd	.LC2(%rip), %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
.L91:
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
.LC8:
	.ascii "may take a while; please wait.\0"
.LC9:
	.ascii "rb\0"
.LC10:
	.ascii "tiled/cosc345-game.tmx\0"
.LC11:
	.ascii "wb\0"
.LC12:
	.ascii "level.dat\0"
.LC14:
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
	leaq	.LC8(%rip), %rcx
	call	puts
	movl	$0, glob_vk_f2(%rip)
	leaq	.LC9(%rip), %rdx
	leaq	.LC10(%rip), %rcx
	call	fopen
	movq	%rax, 131040(%rbp)
	leaq	.LC11(%rip), %rdx
	leaq	.LC12(%rip), %rcx
	call	fopen
	movq	%rax, 131032(%rbp)
	movl	$2, 131028(%rbp)
	movl	$65536, 131024(%rbp)
	movl	131028(%rbp), %eax
	sall	$16, %eax
	movl	%eax, 131020(%rbp)
	movl	$0, 131068(%rbp)
	jmp	.L97
.L98:
	movl	131068(%rbp), %eax
	cltq
	movb	$0, -80(%rbp,%rax)
	addl	$1, 131068(%rbp)
.L97:
	movl	131068(%rbp), %eax
	cmpl	131020(%rbp), %eax
	jl	.L98
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
	jmp	.L99
.L107:
	movq	131040(%rbp), %rax
	movq	%rax, %rcx
	call	fgetc
	movl	%eax, 131064(%rbp)
	movl	$0, 131052(%rbp)
	jmp	.L100
.L101:
	movl	131052(%rbp), %eax
	cltq
	movb	$48, -83(%rbp,%rax)
	addl	$1, 131052(%rbp)
.L100:
	cmpl	$2, 131052(%rbp)
	jle	.L101
	jmp	.L102
.L103:
	movq	131040(%rbp), %rax
	movq	%rax, %rcx
	call	fgetc
	movl	%eax, 131064(%rbp)
.L102:
	cmpl	$13, 131064(%rbp)
	je	.L103
	cmpl	$10, 131064(%rbp)
	je	.L103
	movl	131064(%rbp), %eax
	movb	%al, -81(%rbp)
	movq	131040(%rbp), %rax
	movq	%rax, %rcx
	call	fgetc
	movl	%eax, 131064(%rbp)
	movzbl	131019(%rbp), %eax
	cmpl	%eax, 131064(%rbp)
	je	.L104
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
	je	.L104
	movzbl	-82(%rbp), %eax
	movb	%al, -83(%rbp)
	movzbl	-81(%rbp), %eax
	movb	%al, -82(%rbp)
	movl	131064(%rbp), %eax
	movb	%al, -81(%rbp)
	movq	131040(%rbp), %rax
	movq	%rax, %rcx
	call	fgetc
.L104:
	movb	$0, 131063(%rbp)
	movl	$0, 131048(%rbp)
	jmp	.L105
.L106:
	movl	131048(%rbp), %eax
	cltq
	movzbl	-83(%rbp,%rax), %eax
	movzbl	%al, %eax
	leal	-48(%rax), %ebx
	movl	$2, %eax
	subl	131048(%rbp), %eax
	cvtsi2sd	%eax, %xmm0
	movq	.LC13(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow
	cvttsd2si	%xmm0, %eax
	movzbl	%al, %eax
	imull	%ebx, %eax
	addb	%al, 131063(%rbp)
	addl	$1, 131048(%rbp)
.L105:
	cmpl	$2, 131048(%rbp)
	jle	.L106
	movzbl	131063(%rbp), %edx
	movl	131024(%rbp), %ecx
	movl	131056(%rbp), %eax
	movl	%edx, %r9d
	movl	%ecx, %r8d
	movl	%eax, %edx
	leaq	.LC14(%rip), %rcx
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
.L99:
	movl	131056(%rbp), %eax
	cmpl	131024(%rbp), %eax
	jl	.L107
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
	leaq	.LC9(%rip), %rdx
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
	jmp	.L111
.L112:
	movq	-16(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rdx, %r8
	movl	$16, %edx
	movq	%rax, %rcx
	call	fgets
	subl	$1, -4(%rbp)
.L111:
	cmpl	$0, -4(%rbp)
	jg	.L112
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
	jmp	.L116
.L117:
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	$1, 12(%rax)
	addl	$1, -4(%rbp)
.L116:
	movl	$100, %eax
	cmpl	%eax, -4(%rbp)
	jl	.L117
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
	jmp	.L119
.L120:
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	$0, 12(%rax)
	addl	$1, -4(%rbp)
.L119:
	movl	$100, %eax
	cmpl	%eax, -4(%rbp)
	jl	.L120
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
	jg	.L122
	movl	$0, health(%rip)
	jmp	.L124
.L122:
	movl	health(%rip), %eax
	subl	16(%rbp), %eax
	movl	%eax, health(%rip)
.L124:
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
	jl	.L126
	movl	$100, health(%rip)
	jmp	.L128
.L126:
	movl	health(%rip), %edx
	movl	16(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, health(%rip)
.L128:
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
	jb	.L130
	movq	-8(%rbp), %rax
	movl	$0, 12(%rax)
.L130:
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
	jl	.L136
	movl	16(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jg	.L136
	movl	$1, %eax
	jmp	.L138
.L136:
	movl	$0, %eax
.L138:
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
	movsd	.LC17(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movsd	.LC18(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC19:
	.ascii "Compiled with SDL version %u.%u.%u ...\12\0"
	.align 8
.LC20:
	.ascii "Linked against SDL version %u.%u.%u.\12\0"
	.align 8
.LC21:
	.ascii "Failed to allocate memory for water particles\12\0"
.LC22:
	.ascii "SDL init error:%s\12\0"
.LC23:
	.ascii "COSC345 - Game\0"
.LC24:
	.ascii "Window error\0"
.LC25:
	.ascii "Render error\0"
.LC26:
	.ascii "Surface error\0"
	.align 8
.LC27:
	.ascii "SDL_ttf could not initialize! TTF_Error: %s\12\0"
.LC28:
	.ascii "font.ttf\0"
	.align 8
.LC29:
	.ascii "Failed to load font! SDL_ttf Error: %s\12\0"
	.align 8
.LC30:
	.ascii "Renderer could not be created! SDL_Error: %s\12\0"
.LC31:
	.ascii "img/spr_grass.png\0"
.LC32:
	.ascii "img/spr_sand.png\0"
.LC33:
	.ascii "img/spr_water.png\0"
.LC34:
	.ascii "img/spr_lava.png\0"
.LC35:
	.ascii "tiled/tileset.png\0"
.LC36:
	.ascii "img/hudshade.png\0"
.LC37:
	.ascii "img/player_strip8.png\0"
.LC38:
	.ascii "img/ascii_strip96.png\0"
.LC39:
	.ascii "img/clock1_strip10.png\0"
.LC40:
	.ascii "Night\0"
.LC41:
	.ascii "Morning\0"
.LC42:
	.ascii "Day\0"
.LC43:
	.ascii "Evening\0"
.LC44:
	.ascii "img/dunedin-map.png\0"
.LC45:
	.ascii "img/spr_map_unknown.png\0"
.LC46:
	.ascii "img/spr_thermometer.png\0"
.LC47:
	.ascii "img/spr_nutrients_strip4.png\0"
.LC48:
	.ascii "music.wav\0"
.LC49:
	.ascii "Failed to load WAV file: %s\12\0"
	.align 8
.LC50:
	.ascii "Failed to open audio device: %s\12\0"
.LC51:
	.ascii "img/img_lands.png\0"
.LC52:
	.ascii "Press SPACE to continue.\0"
.LC53:
	.ascii "Entering main loop...\0"
.LC54:
	.ascii "F2 started!\0"
.LC55:
	.ascii "F2 finished!\0"
	.align 8
.LC56:
	.ascii "you pressed 1, good job. Lets test the limit\0"
	.align 8
.LC57:
	.ascii "you pressed 2, good job. Lets test the limit woo\0"
.LC58:
	.ascii "you pressed 3\0"
	.align 8
.LC59:
	.ascii "you pressed 4, good job. Lets test the limit woo\0"
.LC60:
	.ascii "HEALTH:\0"
.LC61:
	.ascii "Protein\0"
.LC62:
	.ascii "Carbs\0"
.LC63:
	.ascii "Fat\0"
.LC64:
	.ascii "Vitamin\0"
.LC65:
	.ascii "LVL: XYZ/255\0"
.LC66:
	.ascii "X\0"
.LC67:
	.ascii "Y\0"
.LC68:
	.ascii "Z\0"
.LC70:
	.ascii ":\0"
.LC74:
	.ascii "Error: Text Rendering Failed\0"
.LC77:
	.ascii "Score: %d\0"
.LC78:
	.ascii "...exited main loop.\0"
.LC79:
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
	movl	$66840, %eax
	call	___chkstk_ms
	subq	%rax, %rsp
	.seh_stackalloc	66840
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movl	%ecx, 66784(%rbp)
	movq	%rdx, 66792(%rbp)
	movq	%rsp, %rax
	movq	%rax, %r12
	movq	$256, 66608(%rbp)
	movq	66608(%rbp), %rax
	subq	$1, %rax
	movq	%rax, 66600(%rbp)
	movq	66608(%rbp), %rax
	movq	%rax, %r10
	movl	$0, %r11d
	movq	66608(%rbp), %rax
	movq	%rax, %r8
	movl	$0, %r9d
	movq	66608(%rbp), %rax
	addq	$15, %rax
	shrq	$4, %rax
	salq	$4, %rax
	call	___chkstk_ms
	subq	%rax, %rsp
	leaq	80(%rsp), %rax
	addq	$0, %rax
	movq	%rax, 66592(%rbp)
	movb	$2, 77(%rbp)
	movb	$28, 78(%rbp)
	movb	$1, 79(%rbp)
	leaq	74(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_GetVersion
	movzbl	79(%rbp), %eax
	movzbl	%al, %ecx
	movzbl	78(%rbp), %eax
	movzbl	%al, %edx
	movzbl	77(%rbp), %eax
	movzbl	%al, %eax
	movl	%ecx, %r9d
	movl	%edx, %r8d
	movl	%eax, %edx
	leaq	.LC19(%rip), %rcx
	call	SDL_Log
	movzbl	76(%rbp), %eax
	movzbl	%al, %ecx
	movzbl	75(%rbp), %eax
	movzbl	%al, %edx
	movzbl	74(%rbp), %eax
	movzbl	%al, %eax
	movl	%ecx, %r9d
	movl	%edx, %r8d
	movl	%eax, %edx
	leaq	.LC20(%rip), %rcx
	call	SDL_Log
	movl	$1366, 66588(%rbp)
	movl	$768, 66584(%rbp)
	movl	66588(%rbp), %eax
	subl	66584(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, 66580(%rbp)
	movl	$0, 66576(%rbp)
	movl	66584(%rbp), %eax
	movl	%eax, 66572(%rbp)
	movl	66584(%rbp), %eax
	movl	%eax, 66568(%rbp)
	movl	66580(%rbp), %edx
	movl	66572(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 66564(%rbp)
	movl	66576(%rbp), %edx
	movl	66568(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 66560(%rbp)
	movl	$16, 66556(%rbp)
	movl	$16, 66552(%rbp)
	movl	66556(%rbp), %eax
	movl	%eax, %ecx
	call	sqr
	movl	%eax, %edi
	movl	66584(%rbp), %eax
	cltd
	idivl	%edi
	movl	%eax, 66548(%rbp)
	movl	66548(%rbp), %eax
	movl	%eax, 66544(%rbp)
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
	jne	.L142
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %r9
	movl	$46, %r8d
	movl	$1, %edx
	leaq	.LC21(%rip), %rcx
	call	fwrite
	movl	$1, %eax
	jmp	.L143
.L142:
	movl	$0, %ecx
	call	time
	movl	%eax, %ecx
	call	srand
	movl	$0, 66692(%rbp)
	jmp	.L144
.L145:
	movl	66584(%rbp), %ecx
	movl	66588(%rbp), %edx
	movl	66692(%rbp), %eax
	movl	%ecx, %r8d
	movl	%eax, %ecx
	call	createWaterParticle
	addl	$1, 66692(%rbp)
.L144:
	movl	$100, %eax
	cmpl	%eax, 66692(%rbp)
	jl	.L145
	movl	$62001, 66540(%rbp)
	movl	66540(%rbp), %eax
	movl	%eax, %ecx
	call	SDL_Init
	testl	%eax, %eax
	je	.L146
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC22(%rip), %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L143
.L146:
	movl	66588(%rbp), %edx
	movl	$0, 40(%rsp)
	movl	66584(%rbp), %eax
	movl	%eax, 32(%rsp)
	movl	%edx, %r9d
	movl	$536805376, %r8d
	movl	$536805376, %edx
	leaq	.LC23(%rip), %rcx
	call	SDL_CreateWindow
	movq	%rax, 66528(%rbp)
	cmpq	$0, 66528(%rbp)
	jne	.L147
	movq	66592(%rbp), %rax
	movq	66608(%rbp), %rdx
	leaq	.LC24(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L148
.L147:
	movq	66528(%rbp), %rax
	movl	$4, %r8d
	movl	$-1, %edx
	movq	%rax, %rcx
	call	SDL_CreateRenderer
	movq	%rax, 66520(%rbp)
	cmpq	$0, 66520(%rbp)
	jne	.L149
	movq	66592(%rbp), %rax
	movq	66608(%rbp), %rdx
	leaq	.LC25(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L148
.L149:
	movq	66528(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_GetWindowSurface
	movq	%rax, 66512(%rbp)
	cmpq	$0, 66512(%rbp)
	jne	.L150
	movq	66592(%rbp), %rax
	movq	66608(%rbp), %rdx
	leaq	.LC26(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L148
.L150:
	movl	$800, 65888(%rbp)
	movl	$100, 65892(%rbp)
	movl	$100, 65896(%rbp)
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
	movq	%rax, 66504(%rbp)
	leaq	65888(%rbp), %rax
	movq	%rax, 66496(%rbp)
	movl	$0, 66696(%rbp)
	call	TTF_Init
	cmpl	$-1, %eax
	jne	.L151
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC27(%rip), %rcx
	call	printf
	movl	$1, %eax
	jmp	.L143
.L151:
	movl	$12, %edx
	leaq	.LC28(%rip), %rcx
	call	TTF_OpenFont
	movq	%rax, 66488(%rbp)
	cmpq	$0, 66488(%rbp)
	jne	.L152
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC29(%rip), %rcx
	call	printf
	movl	$1, %eax
	jmp	.L143
.L152:
	movl	$0, 66484(%rbp)
	movl	$0, 66700(%rbp)
	movb	$0, 65772(%rbp)
	movb	$0, 65773(%rbp)
	movb	$0, 65774(%rbp)
	movb	$-1, 65775(%rbp)
	movq	66528(%rbp), %rax
	movl	$2, %r8d
	movl	$-1, %edx
	movq	%rax, %rcx
	call	SDL_CreateRenderer
	movq	%rax, 66472(%rbp)
	cmpq	$0, 66520(%rbp)
	jne	.L153
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC30(%rip), %rcx
	call	printf
.L153:
	movl	$2, %ecx
	call	IMG_Init
	movq	66520(%rbp), %rax
	leaq	.LC31(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66464(%rbp)
	movq	66520(%rbp), %rax
	leaq	.LC32(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66456(%rbp)
	movq	66520(%rbp), %rax
	leaq	.LC33(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66448(%rbp)
	movq	66520(%rbp), %rax
	leaq	.LC34(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66440(%rbp)
	movq	66520(%rbp), %rax
	leaq	.LC35(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66432(%rbp)
	movq	66520(%rbp), %rax
	leaq	.LC36(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66424(%rbp)
	movq	66520(%rbp), %rax
	leaq	.LC37(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66416(%rbp)
	movq	66520(%rbp), %rax
	leaq	.LC38(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66408(%rbp)
	movl	$8, 66404(%rbp)
	movl	$24, 66400(%rbp)
	movq	66520(%rbp), %rax
	leaq	.LC39(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66392(%rbp)
	movl	$1440, 66388(%rbp)
	movl	$0, 66688(%rbp)
	movl	$0, 66684(%rbp)
	movl	$57, 66384(%rbp)
	movl	$60, 66380(%rbp)
	leaq	.LC40(%rip), %rax
	movq	%rax, 66368(%rbp)
	leaq	.LC41(%rip), %rax
	movq	%rax, 66360(%rbp)
	leaq	.LC42(%rip), %rax
	movq	%rax, 66352(%rbp)
	leaq	.LC43(%rip), %rax
	movq	%rax, 66344(%rbp)
	movl	66556(%rbp), %eax
	movl	%eax, %ecx
	call	sqr
	movl	%eax, 66340(%rbp)
	movl	$256, 66336(%rbp)
	movl	$0, 66680(%rbp)
	leaq	.LC9(%rip), %rdx
	leaq	.LC12(%rip), %rcx
	call	fopen
	movq	%rax, 66328(%rbp)
	movl	$0, 66676(%rbp)
	jmp	.L154
.L155:
	movl	66676(%rbp), %eax
	cltq
	movb	$0, 224(%rbp,%rax)
	addl	$1, 66676(%rbp)
.L154:
	movl	66340(%rbp), %eax
	imull	66336(%rbp), %eax
	cmpl	%eax, 66676(%rbp)
	jl	.L155
	movq	66328(%rbp), %rdx
	leaq	224(%rbp), %rax
	movq	%rdx, %r9
	movl	$1, %r8d
	movl	$65536, %edx
	movq	%rax, %rcx
	call	fread
	movq	66328(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movq	66520(%rbp), %rax
	leaq	.LC44(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66320(%rbp)
	movq	66520(%rbp), %rax
	leaq	.LC45(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66312(%rbp)
	leaq	208(%rbp), %rax
	movl	66680(%rbp), %ecx
	movq	%rax, %rdx
	call	level_get_name
	movl	66680(%rbp), %edx
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
	movl	66680(%rbp), %eax
	leal	31(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$5, %eax
	movl	%ecx, %edx
	cltq
	movl	%edx, 176(%rbp,%rax,4)
	movl	$0, 66308(%rbp)
	movl	$10, 66304(%rbp)
	movl	$42, %eax
	movb	%al, 174(%rbp)
	movq	66520(%rbp), %rax
	leaq	.LC46(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66296(%rbp)
	movb	$-128, 66295(%rbp)
	movl	66548(%rbp), %eax
	imull	66552(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	66580(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 144(%rbp)
	movl	66544(%rbp), %eax
	imull	66552(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	66576(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 148(%rbp)
	movb	$0, 160(%rbp)
	movb	$0, 161(%rbp)
	movb	$1, 162(%rbp)
	movb	$12, 163(%rbp)
	movb	$0, 164(%rbp)
	movb	$2, 165(%rbp)
	movb	$12, 166(%rbp)
	movq	66520(%rbp), %rax
	leaq	.LC47(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66280(%rbp)
	leaq	.LC48(%rip), %rax
	movq	%rax, 66272(%rbp)
	movq	66272(%rbp), %rax
	leaq	.LC9(%rip), %rdx
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
	jne	.L156
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC49(%rip), %rcx
	call	printf
	jmp	.L157
.L156:
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
	movl	%eax, 66268(%rbp)
	cmpl	$0, 66268(%rbp)
	jne	.L158
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC50(%rip), %rcx
	call	printf
	movq	104(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_FreeWAV
	jmp	.L157
.L158:
	movl	100(%rbp), %ecx
	movq	104(%rbp), %rdx
	movl	66268(%rbp), %eax
	movl	%ecx, %r8d
	movl	%eax, %ecx
	call	SDL_QueueAudio
	movl	66268(%rbp), %eax
	movl	$0, %edx
	movl	%eax, %ecx
	call	SDL_PauseAudioDevice
	movl	$1, 66672(%rbp)
	movq	66520(%rbp), %rax
	leaq	.LC51(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66256(%rbp)
	leaq	.LC52(%rip), %rax
	movq	%rax, 66248(%rbp)
	movl	$1, 66668(%rbp)
	leaq	.LC53(%rip), %rcx
	call	puts
	jmp	.L159
.L206:
	movl	65904(%rbp), %eax
	cmpl	$768, %eax
	je	.L161
	cmpl	$769, %eax
	je	.L162
	cmpl	$256, %eax
	jne	.L160
	movl	$0, 66668(%rbp)
	jmp	.L160
.L161:
	movl	$1, 66244(%rbp)
	movl	65924(%rbp), %eax
	cmpl	$54, %eax
	je	.L163
	cmpl	$54, %eax
	jg	.L164
	cmpl	$49, %eax
	je	.L165
	cmpl	$49, %eax
	jg	.L166
	cmpl	$32, %eax
	je	.L167
	cmpl	$48, %eax
	je	.L168
	cmpl	$27, %eax
	je	.L169
	jmp	.L160
.L166:
	cmpl	$51, %eax
	je	.L171
	cmpl	$51, %eax
	jl	.L172
	cmpl	$52, %eax
	je	.L173
	cmpl	$53, %eax
	je	.L174
	jmp	.L160
.L164:
	cmpl	$1073741903, %eax
	je	.L175
	cmpl	$1073741903, %eax
	jg	.L176
	cmpl	$56, %eax
	je	.L177
	cmpl	$56, %eax
	jl	.L178
	cmpl	$57, %eax
	je	.L179
	cmpl	$1073741883, %eax
	je	.L180
	jmp	.L160
.L176:
	cmpl	$1073741905, %eax
	je	.L181
	cmpl	$1073741905, %eax
	jl	.L182
	cmpl	$1073741906, %eax
	je	.L183
	cmpl	$1073741912, %eax
	je	.L184
	jmp	.L160
.L169:
	movl	$0, 66668(%rbp)
	jmp	.L170
.L175:
	movl	66244(%rbp), %eax
	movl	%eax, glob_vk_right(%rip)
	jmp	.L170
.L182:
	movl	66244(%rbp), %eax
	movl	%eax, glob_vk_left(%rip)
	jmp	.L170
.L183:
	movl	66244(%rbp), %eax
	movl	%eax, glob_vk_up(%rip)
	jmp	.L170
.L181:
	movl	66244(%rbp), %eax
	movl	%eax, glob_vk_down(%rip)
	jmp	.L170
.L167:
	movl	66244(%rbp), %eax
	movl	%eax, glob_vk_space(%rip)
	jmp	.L170
.L184:
	movl	66244(%rbp), %eax
	movl	%eax, glob_vk_enter(%rip)
	jmp	.L170
.L180:
	movl	66244(%rbp), %eax
	movl	%eax, glob_vk_f2(%rip)
	jmp	.L170
.L168:
	movl	66244(%rbp), %eax
	movl	%eax, glob_vk_0(%rip)
	jmp	.L170
.L165:
	movl	66244(%rbp), %eax
	movl	%eax, glob_vk_1(%rip)
	jmp	.L170
.L172:
	movl	66244(%rbp), %eax
	movl	%eax, glob_vk_2(%rip)
	jmp	.L170
.L171:
	movl	66244(%rbp), %eax
	movl	%eax, glob_vk_3(%rip)
	jmp	.L170
.L173:
	movl	66244(%rbp), %eax
	movl	%eax, glob_vk_4(%rip)
	jmp	.L170
.L174:
	movl	66244(%rbp), %eax
	movl	%eax, glob_vk_5(%rip)
	jmp	.L170
.L163:
	movl	66244(%rbp), %eax
	movl	%eax, glob_vk_6(%rip)
	jmp	.L170
.L178:
	movl	66244(%rbp), %eax
	movl	%eax, glob_vk_7(%rip)
	jmp	.L170
.L177:
	movl	66244(%rbp), %eax
	movl	%eax, glob_vk_8(%rip)
	jmp	.L170
.L179:
	movl	66244(%rbp), %eax
	movl	%eax, glob_vk_9(%rip)
	nop
.L170:
	jmp	.L160
.L162:
	movl	$0, 66240(%rbp)
	movl	65924(%rbp), %eax
	cmpl	$55, %eax
	je	.L185
	cmpl	$55, %eax
	jg	.L186
	cmpl	$50, %eax
	je	.L187
	cmpl	$50, %eax
	jg	.L188
	cmpl	$48, %eax
	je	.L189
	cmpl	$48, %eax
	jg	.L190
	cmpl	$32, %eax
	je	.L191
	jmp	.L272
.L188:
	cmpl	$52, %eax
	je	.L193
	cmpl	$52, %eax
	jl	.L194
	cmpl	$53, %eax
	je	.L195
	cmpl	$54, %eax
	je	.L196
	jmp	.L272
.L186:
	cmpl	$1073741903, %eax
	je	.L197
	cmpl	$1073741903, %eax
	jg	.L198
	cmpl	$57, %eax
	je	.L199
	cmpl	$57, %eax
	jl	.L200
	cmpl	$1073741883, %eax
	je	.L201
	jmp	.L272
.L198:
	cmpl	$1073741905, %eax
	je	.L202
	cmpl	$1073741905, %eax
	jl	.L203
	cmpl	$1073741906, %eax
	je	.L204
	cmpl	$1073741912, %eax
	je	.L205
	jmp	.L272
.L197:
	movl	66240(%rbp), %eax
	movl	%eax, glob_vk_right(%rip)
	jmp	.L192
.L203:
	movl	66240(%rbp), %eax
	movl	%eax, glob_vk_left(%rip)
	jmp	.L192
.L204:
	movl	66240(%rbp), %eax
	movl	%eax, glob_vk_up(%rip)
	jmp	.L192
.L202:
	movl	66240(%rbp), %eax
	movl	%eax, glob_vk_down(%rip)
	jmp	.L192
.L191:
	movl	66240(%rbp), %eax
	movl	%eax, glob_vk_space(%rip)
	jmp	.L192
.L205:
	movl	66240(%rbp), %eax
	movl	%eax, glob_vk_enter(%rip)
	jmp	.L192
.L201:
	movl	66240(%rbp), %eax
	movl	%eax, glob_vk_f2(%rip)
	jmp	.L192
.L189:
	movl	66240(%rbp), %eax
	movl	%eax, glob_vk_0(%rip)
	jmp	.L192
.L190:
	movl	66240(%rbp), %eax
	movl	%eax, glob_vk_1(%rip)
	jmp	.L192
.L187:
	movl	66240(%rbp), %eax
	movl	%eax, glob_vk_2(%rip)
	jmp	.L192
.L194:
	movl	66240(%rbp), %eax
	movl	%eax, glob_vk_3(%rip)
	jmp	.L192
.L193:
	movl	66240(%rbp), %eax
	movl	%eax, glob_vk_4(%rip)
	jmp	.L192
.L195:
	movl	66240(%rbp), %eax
	movl	%eax, glob_vk_5(%rip)
	jmp	.L192
.L196:
	movl	66240(%rbp), %eax
	movl	%eax, glob_vk_6(%rip)
	jmp	.L192
.L185:
	movl	66240(%rbp), %eax
	movl	%eax, glob_vk_7(%rip)
	jmp	.L192
.L200:
	movl	66240(%rbp), %eax
	movl	%eax, glob_vk_8(%rip)
	jmp	.L192
.L199:
	movl	66240(%rbp), %eax
	movl	%eax, glob_vk_9(%rip)
	nop
.L192:
.L272:
	nop
.L160:
	leaq	65904(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_PollEvent
	testl	%eax, %eax
	jne	.L206
	movl	glob_vk_f2(%rip), %eax
	testl	%eax, %eax
	je	.L207
	leaq	.LC54(%rip), %rcx
	call	puts
	call	dev_tiled_to_leveldata
	leaq	.LC55(%rip), %rcx
	call	puts
.L207:
	movl	glob_vk_0(%rip), %eax
	testl	%eax, %eax
	je	.L208
	movl	$0, glob_vk_0(%rip)
	movl	waterOn(%rip), %eax
	testl	%eax, %eax
	jne	.L209
	movl	$1, waterOn(%rip)
	call	activateAllWaterParticles
	jmp	.L208
.L209:
	movl	$0, waterOn(%rip)
	call	deactivateAllWaterParticles
.L208:
	movl	glob_vk_9(%rip), %eax
	testl	%eax, %eax
	je	.L210
	movl	$0, glob_vk_9(%rip)
	cmpl	$0, 66696(%rbp)
	jne	.L211
	movl	$1, 66696(%rbp)
	leaq	65776(%rbp), %rax
	movabsq	$3184362091757007472, %rdi
	movq	%rdi, (%rax)
	movl	$741551154, 8(%rax)
	movw	$52, 12(%rax)
	jmp	.L210
.L211:
	movl	$0, 66696(%rbp)
.L210:
	movl	glob_vk_1(%rip), %eax
	testl	%eax, %eax
	je	.L212
	movl	$0, glob_vk_1(%rip)
	cmpl	$1, 66696(%rbp)
	jne	.L212
	leaq	.LC56(%rip), %rax
	movq	%rax, 66232(%rbp)
	movq	$99, 66224(%rbp)
	movq	66224(%rbp), %rcx
	movq	66232(%rbp), %rdx
	leaq	65776(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	strncpy
	leaq	65776(%rbp), %rax
	movq	66224(%rbp), %rdx
	addq	%rdx, %rax
	movb	$0, (%rax)
	addl	$50, 66700(%rbp)
.L212:
	movl	glob_vk_2(%rip), %eax
	testl	%eax, %eax
	je	.L213
	movl	$0, glob_vk_2(%rip)
	cmpl	$1, 66696(%rbp)
	jne	.L213
	leaq	.LC57(%rip), %rax
	movq	%rax, 66216(%rbp)
	movq	$99, 66208(%rbp)
	movq	66208(%rbp), %rcx
	movq	66216(%rbp), %rdx
	leaq	65776(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	strncpy
	leaq	65776(%rbp), %rax
	movq	66208(%rbp), %rdx
	addq	%rdx, %rax
	movb	$0, (%rax)
	addl	$50, 66700(%rbp)
.L213:
	movl	glob_vk_3(%rip), %eax
	testl	%eax, %eax
	je	.L214
	movl	$0, glob_vk_3(%rip)
	cmpl	$1, 66696(%rbp)
	jne	.L214
	leaq	.LC58(%rip), %rax
	movq	%rax, 66200(%rbp)
	movq	$99, 66192(%rbp)
	movq	66192(%rbp), %rcx
	movq	66200(%rbp), %rdx
	leaq	65776(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	strncpy
	leaq	65776(%rbp), %rax
	movq	66192(%rbp), %rdx
	addq	%rdx, %rax
	movb	$0, (%rax)
	addl	$50, 66700(%rbp)
.L214:
	movl	glob_vk_4(%rip), %eax
	testl	%eax, %eax
	je	.L215
	movl	$0, glob_vk_4(%rip)
	cmpl	$1, 66696(%rbp)
	jne	.L215
	leaq	.LC59(%rip), %rax
	movq	%rax, 66184(%rbp)
	movq	$99, 66176(%rbp)
	movq	66176(%rbp), %rcx
	movq	66184(%rbp), %rdx
	leaq	65776(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	strncpy
	leaq	65776(%rbp), %rax
	movq	66176(%rbp), %rdx
	addq	%rdx, %rax
	movb	$0, (%rax)
	addl	$50, 66700(%rbp)
.L215:
	movl	glob_vk_5(%rip), %eax
	testl	%eax, %eax
	je	.L216
	movl	$0, glob_vk_5(%rip)
	movl	$10, %ecx
	call	damageMe
.L216:
	movl	glob_vk_6(%rip), %eax
	testl	%eax, %eax
	je	.L217
	movl	$0, glob_vk_6(%rip)
	movl	$10, %ecx
	call	healMe
.L217:
	movl	glob_vk_right(%rip), %eax
	testl	%eax, %eax
	je	.L218
	movb	$0, 160(%rbp)
	movl	144(%rbp), %edx
	movzbl	166(%rbp), %eax
	movzbl	%al, %eax
	addl	%edx, %eax
	movl	%eax, 144(%rbp)
.L218:
	movl	glob_vk_up(%rip), %eax
	testl	%eax, %eax
	je	.L219
	movb	$1, 160(%rbp)
	movl	148(%rbp), %edx
	movzbl	166(%rbp), %eax
	movzbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, 148(%rbp)
.L219:
	movl	glob_vk_left(%rip), %eax
	testl	%eax, %eax
	je	.L220
	movb	$2, 160(%rbp)
	movl	144(%rbp), %edx
	movzbl	166(%rbp), %eax
	movzbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, 144(%rbp)
.L220:
	movl	glob_vk_down(%rip), %eax
	testl	%eax, %eax
	je	.L221
	movb	$3, 160(%rbp)
	movl	148(%rbp), %edx
	movzbl	166(%rbp), %eax
	movzbl	%al, %eax
	addl	%edx, %eax
	movl	%eax, 148(%rbp)
.L221:
	movl	glob_vk_right(%rip), %edx
	movl	glob_vk_left(%rip), %eax
	orl	%eax, %edx
	movl	glob_vk_up(%rip), %eax
	orl	%eax, %edx
	movl	glob_vk_down(%rip), %eax
	orl	%edx, %eax
	testl	%eax, %eax
	je	.L222
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
	movl	66552(%rbp), %eax
	imull	66548(%rbp), %eax
	movl	66564(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, 66172(%rbp)
	movl	66576(%rbp), %eax
	movl	%eax, 66168(%rbp)
	movl	66580(%rbp), %eax
	movl	%eax, 66164(%rbp)
	movl	66552(%rbp), %eax
	imull	66544(%rbp), %eax
	movl	66560(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, 66160(%rbp)
	movl	$0, 66156(%rbp)
	movl	144(%rbp), %eax
	cmpl	%eax, 66172(%rbp)
	jl	.L223
	movl	148(%rbp), %eax
	cmpl	%eax, 66160(%rbp)
	jl	.L223
	movl	144(%rbp), %eax
	cmpl	%eax, 66164(%rbp)
	jg	.L223
	movl	148(%rbp), %eax
	cmpl	%eax, 66168(%rbp)
	jle	.L224
.L223:
	movl	$1, %eax
	jmp	.L225
.L224:
	movl	$0, %eax
.L225:
	movl	%eax, 66156(%rbp)
	movl	144(%rbp), %eax
	cmpl	%eax, 66172(%rbp)
	jge	.L226
	movl	66164(%rbp), %eax
	movl	%eax, 144(%rbp)
	addl	$1, 66680(%rbp)
.L226:
	movl	148(%rbp), %eax
	cmpl	%eax, 66168(%rbp)
	jle	.L227
	movl	66160(%rbp), %eax
	movl	%eax, 148(%rbp)
	cvtsi2sd	66336(%rbp), %xmm0
	call	sqrt
	cvttsd2si	%xmm0, %eax
	subl	%eax, 66680(%rbp)
.L227:
	movl	144(%rbp), %eax
	cmpl	%eax, 66164(%rbp)
	jle	.L228
	movl	66172(%rbp), %eax
	movl	%eax, 144(%rbp)
	subl	$1, 66680(%rbp)
.L228:
	movl	148(%rbp), %eax
	cmpl	%eax, 66160(%rbp)
	jge	.L229
	movl	66168(%rbp), %eax
	movl	%eax, 148(%rbp)
	cvtsi2sd	66336(%rbp), %xmm0
	call	sqrt
	cvttsd2si	%xmm0, %eax
	addl	%eax, 66680(%rbp)
.L229:
	cmpl	$0, 66156(%rbp)
	je	.L231
	movl	66336(%rbp), %eax
	addl	%eax, 66680(%rbp)
	movl	66680(%rbp), %eax
	cltd
	idivl	66336(%rbp)
	movl	%edx, 66680(%rbp)
	leaq	208(%rbp), %rax
	movl	66680(%rbp), %ecx
	movq	%rax, %rdx
	call	level_get_name
	movl	66680(%rbp), %eax
	leal	31(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$5, %eax
	movl	%eax, %r9d
	movslq	%r9d, %rax
	movl	176(%rbp,%rax,4), %r8d
	movl	66680(%rbp), %edx
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
	jmp	.L231
.L222:
	movb	$0, 161(%rbp)
	movb	$0, 164(%rbp)
.L231:
	movl	glob_vk_space(%rip), %edx
	movl	glob_vk_enter(%rip), %eax
	orl	%edx, %eax
	testl	%eax, %eax
	je	.L232
	movl	$0, 66672(%rbp)
.L232:
	movl	144(%rbp), %eax
	movl	%eax, 152(%rbp)
	movl	148(%rbp), %eax
	movl	%eax, 156(%rbp)
	movl	$0, 66664(%rbp)
	jmp	.L233
.L237:
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	66664(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	12(%rax), %eax
	testl	%eax, %eax
	je	.L234
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	66664(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm1
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	66664(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movss	8(%rax), %xmm0
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	66664(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	addss	%xmm1, %xmm0
	movss	%xmm0, 4(%rax)
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	66664(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm0
	cvtsi2ss	66584(%rbp), %xmm1
	comiss	%xmm1, %xmm0
	jbe	.L234
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
	jg	.L236
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	66664(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	$0, 12(%rax)
	jmp	.L234
.L236:
	movl	66584(%rbp), %ecx
	movl	66588(%rbp), %edx
	movl	66664(%rbp), %eax
	movl	%ecx, %r8d
	movl	%eax, %ecx
	call	createWaterParticle
.L234:
	addl	$1, 66664(%rbp)
.L233:
	movl	$100, %eax
	cmpl	%eax, 66664(%rbp)
	jl	.L237
	movl	66380(%rbp), %eax
	addl	%eax, 66684(%rbp)
	movl	66684(%rbp), %eax
	cmpl	66384(%rbp), %eax
	setge	%al
	movzbl	%al, %eax
	addl	%eax, 66688(%rbp)
	movl	66688(%rbp), %eax
	cltd
	idivl	66388(%rbp)
	movl	%edx, 66688(%rbp)
	movl	66684(%rbp), %eax
	cltd
	idivl	66384(%rbp)
	movl	%edx, 66684(%rbp)
	leaq	171(%rbp), %rdx
	leaq	68(%rbp), %rax
	movq	%rax, %rcx
	call	strcpy
	cmpl	$0, 66304(%rbp)
	js	.L238
	movl	$43, %eax
	jmp	.L239
.L238:
	movl	$45, %eax
.L239:
	movb	%al, 68(%rbp)
	movl	66304(%rbp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	addl	$48, %eax
	movb	%al, 69(%rbp)
	movl	66304(%rbp), %ecx
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
	movb	%al, 70(%rbp)
	movl	$42, %eax
	movb	%al, 71(%rbp)
	cmpl	$0, 66308(%rbp)
	jne	.L240
	movl	$67, %eax
	jmp	.L241
.L240:
	movl	$70, %eax
.L241:
	movb	%al, 72(%rbp)
	movl	$0, %edx
	movq	66520(%rbp), %rax
	movq	%rax, %rcx
	call	draw_clear
	movl	$16777215, %edx
	movq	66520(%rbp), %rax
	movq	%rax, %rcx
	call	draw_set_color
	movl	$33023, %edx
	movl	66580(%rbp), %ecx
	movq	66520(%rbp), %rax
	movl	%edx, 40(%rsp)
	movl	66584(%rbp), %edx
	movl	%edx, 32(%rsp)
	movl	%ecx, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	66580(%rbp), %ecx
	movq	66520(%rbp), %rax
	movq	66424(%rbp), %rdx
	movq	%rdx, 40(%rsp)
	movl	66584(%rbp), %edx
	movl	%edx, 32(%rsp)
	movl	%ecx, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	draw_image
	movl	$8388863, %r8d
	movl	66588(%rbp), %eax
	subl	66580(%rbp), %eax
	movl	%eax, %ecx
	movl	66580(%rbp), %edx
	movq	66520(%rbp), %rax
	movl	%r8d, 40(%rsp)
	movl	66584(%rbp), %r8d
	movl	%r8d, 32(%rsp)
	movl	%ecx, %r9d
	movl	$0, %r8d
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	$33023, %edx
	movl	66588(%rbp), %eax
	subl	66580(%rbp), %eax
	movl	66588(%rbp), %r8d
	movq	66520(%rbp), %rcx
	movl	%edx, 40(%rsp)
	movl	66584(%rbp), %edx
	movl	%edx, 32(%rsp)
	movl	%r8d, %r9d
	movl	$0, %r8d
	movl	%eax, %edx
	call	draw_rectangle_color
	movl	66588(%rbp), %eax
	subl	66580(%rbp), %eax
	movl	66588(%rbp), %r8d
	movq	66520(%rbp), %rcx
	movq	66424(%rbp), %rdx
	movq	%rdx, 40(%rsp)
	movl	66584(%rbp), %edx
	movl	%edx, 32(%rsp)
	movl	%r8d, %r9d
	movl	$0, %r8d
	movl	%eax, %edx
	call	draw_image
	movl	66548(%rbp), %eax
	movl	%eax, 66152(%rbp)
	movl	66544(%rbp), %eax
	movl	%eax, 66148(%rbp)
	cmpl	$0, 66672(%rbp)
	jne	.L242
	movl	66400(%rbp), %eax
	imull	66544(%rbp), %eax
	movl	66404(%rbp), %edx
	imull	66548(%rbp), %edx
	movl	%edx, %r8d
	movl	66148(%rbp), %r10d
	movl	66152(%rbp), %edx
	movq	66520(%rbp), %rcx
	movl	66400(%rbp), %r9d
	movl	%r9d, 64(%rsp)
	movl	66404(%rbp), %r9d
	movl	%r9d, 56(%rsp)
	leaq	.LC60(%rip), %r9
	movq	%r9, 48(%rsp)
	movq	66408(%rbp), %r9
	movq	%r9, 40(%rsp)
	movl	%eax, 32(%rsp)
	movl	%r8d, %r9d
	movl	%r10d, %r8d
	call	draw_text
	movl	66400(%rbp), %eax
	imull	66544(%rbp), %eax
	addl	%eax, 66148(%rbp)
	movl	$16777215, %edx
	movq	66520(%rbp), %rax
	movq	%rax, %rcx
	call	draw_set_color
	movl	$200, 66144(%rbp)
	movl	$20, 66140(%rbp)
	movl	health(%rip), %eax
	imull	66144(%rbp), %eax
	movl	maxHealth(%rip), %esi
	cltd
	idivl	%esi
	movl	%eax, 66136(%rbp)
	movl	$255, 66132(%rbp)
	movl	$0, %r9d
	movl	66148(%rbp), %edx
	movl	66140(%rbp), %eax
	addl	%eax, %edx
	movl	66144(%rbp), %r8d
	movl	66148(%rbp), %ecx
	movq	66520(%rbp), %rax
	movl	%r9d, 40(%rsp)
	movl	%edx, 32(%rsp)
	movl	%r8d, %r9d
	movl	%ecx, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	66148(%rbp), %edx
	movl	66140(%rbp), %eax
	addl	%eax, %edx
	movl	66136(%rbp), %r9d
	movl	66148(%rbp), %r8d
	movq	66520(%rbp), %rax
	movl	66132(%rbp), %ecx
	movl	%ecx, 40(%rsp)
	movl	%edx, 32(%rsp)
	movl	$0, %edx
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	66140(%rbp), %eax
	addl	%eax, 66148(%rbp)
	movl	$0, 66660(%rbp)
	movl	$32, 66128(%rbp)
	movl	$0, 66656(%rbp)
	jmp	.L243
.L244:
	movl	66656(%rbp), %eax
	imull	66128(%rbp), %eax
	movl	66148(%rbp), %ecx
	movl	66660(%rbp), %edx
	addl	%edx, %ecx
	movl	66128(%rbp), %edx
	imull	66544(%rbp), %edx
	leal	(%rcx,%rdx), %r8d
	movl	66128(%rbp), %edx
	imull	66548(%rbp), %edx
	movl	66152(%rbp), %ecx
	leal	(%rdx,%rcx), %r11d
	movl	66148(%rbp), %ecx
	movl	66660(%rbp), %edx
	leal	(%rcx,%rdx), %r10d
	movl	66152(%rbp), %edx
	movq	66520(%rbp), %rcx
	movl	66128(%rbp), %r9d
	movl	%r9d, 72(%rsp)
	movl	66128(%rbp), %r9d
	movl	%r9d, 64(%rsp)
	movl	$0, 56(%rsp)
	movl	%eax, 48(%rsp)
	movq	66280(%rbp), %rax
	movq	%rax, 40(%rsp)
	movl	%r8d, 32(%rsp)
	movl	%r11d, %r9d
	movl	%r10d, %r8d
	call	draw_image_part
	movl	66656(%rbp), %eax
	leaq	.LC64(%rip), %rdx
	movq	%rdx, 32(%rsp)
	leaq	.LC61(%rip), %r9
	leaq	.LC62(%rip), %r8
	leaq	.LC63(%rip), %rdx
	movl	%eax, %ecx
	call	mux_str
	movq	%rax, %r11
	movl	66400(%rbp), %eax
	imull	66544(%rbp), %eax
	movl	%eax, %edx
	movl	66404(%rbp), %eax
	imull	66548(%rbp), %eax
	movl	%eax, %r8d
	movl	66148(%rbp), %ecx
	movl	66660(%rbp), %eax
	addl	%eax, %ecx
	movl	66128(%rbp), %eax
	movl	%eax, %r9d
	shrl	$31, %r9d
	addl	%r9d, %eax
	sarl	%eax
	leal	(%rcx,%rax), %r10d
	movl	66128(%rbp), %eax
	imull	66548(%rbp), %eax
	movl	66152(%rbp), %ecx
	addl	%eax, %ecx
	movq	66520(%rbp), %rax
	movl	66400(%rbp), %r9d
	movl	%r9d, 64(%rsp)
	movl	66404(%rbp), %r9d
	movl	%r9d, 56(%rsp)
	movq	%r11, 48(%rsp)
	movq	66408(%rbp), %r9
	movq	%r9, 40(%rsp)
	movl	%edx, 32(%rsp)
	movl	%r8d, %r9d
	movl	%r10d, %r8d
	movl	%ecx, %edx
	movq	%rax, %rcx
	call	draw_text
	movl	66128(%rbp), %eax
	imull	66548(%rbp), %eax
	addl	%eax, 66660(%rbp)
	addl	$1, 66656(%rbp)
.L243:
	cmpl	$3, 66656(%rbp)
	jle	.L244
.L242:
	movl	66548(%rbp), %edx
	movl	66564(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 66152(%rbp)
	movl	66544(%rbp), %eax
	movl	%eax, 66148(%rbp)
	cmpl	$0, 66672(%rbp)
	jne	.L245
	movq	%rsp, %rax
	movq	%rax, %r15
	leaq	.LC65(%rip), %rax
	movq	%rax, 66120(%rbp)
	movq	66120(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	subq	$1, %rdx
	movq	%rdx, 66112(%rbp)
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
	movq	%rax, 66104(%rbp)
	movq	66104(%rbp), %rax
	movq	66120(%rbp), %rdx
	movq	%rax, %rcx
	call	strcpy
	movl	66680(%rbp), %eax
	movb	%al, 66103(%rbp)
	movzbl	66103(%rbp), %eax
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
	movq	66104(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC66(%rip), %rcx
	call	string_pos
	movl	%ebx, %ecx
	movq	66104(%rbp), %rdx
	cltq
	movb	%cl, (%rdx,%rax)
	movzbl	66103(%rbp), %eax
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
	movq	66104(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC67(%rip), %rcx
	call	string_pos
	movl	%ebx, %ecx
	movq	66104(%rbp), %rdx
	cltq
	movb	%cl, (%rdx,%rax)
	movzbl	66103(%rbp), %ecx
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
	movq	66104(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC68(%rip), %rcx
	call	string_pos
	movl	%ebx, %ecx
	movq	66104(%rbp), %rdx
	cltq
	movb	%cl, (%rdx,%rax)
	movq	66104(%rbp), %r9
	movl	66400(%rbp), %eax
	imull	66544(%rbp), %eax
	movl	66404(%rbp), %edx
	imull	66548(%rbp), %edx
	movl	%edx, %r8d
	movl	66148(%rbp), %r11d
	movl	66152(%rbp), %edx
	movq	66520(%rbp), %rcx
	movl	66400(%rbp), %r10d
	movl	%r10d, 64(%rsp)
	movl	66404(%rbp), %r10d
	movl	%r10d, 56(%rsp)
	movq	%r9, 48(%rsp)
	movq	66408(%rbp), %r9
	movq	%r9, 40(%rsp)
	movl	%eax, 32(%rsp)
	movl	%r8d, %r9d
	movl	%r11d, %r8d
	call	draw_text
	movl	66400(%rbp), %eax
	imull	66544(%rbp), %eax
	movl	66404(%rbp), %edx
	imull	66548(%rbp), %edx
	movl	%edx, %r8d
	movl	66400(%rbp), %edx
	imull	66544(%rbp), %edx
	movl	66148(%rbp), %ecx
	leal	(%rdx,%rcx), %r11d
	movl	66152(%rbp), %r10d
	movq	66520(%rbp), %rcx
	movl	66400(%rbp), %edx
	movl	%edx, 64(%rsp)
	movl	66404(%rbp), %edx
	movl	%edx, 56(%rsp)
	leaq	208(%rbp), %rdx
	movq	%rdx, 48(%rsp)
	movq	66408(%rbp), %rdx
	movq	%rdx, 40(%rsp)
	movl	%eax, 32(%rsp)
	movl	%r8d, %r9d
	movl	%r11d, %r8d
	movl	%r10d, %edx
	call	draw_text
	movl	66152(%rbp), %eax
	movl	%eax, 66096(%rbp)
	movl	66400(%rbp), %eax
	imull	66544(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	66148(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 66092(%rbp)
	movl	66096(%rbp), %eax
	addl	$256, %eax
	movl	%eax, 66088(%rbp)
	movl	66092(%rbp), %eax
	addl	$256, %eax
	movl	%eax, 66084(%rbp)
	movl	66088(%rbp), %r9d
	movl	66092(%rbp), %r8d
	movl	66096(%rbp), %edx
	movq	66520(%rbp), %rax
	movq	66320(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	66084(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_image
	movl	$0, 66652(%rbp)
	jmp	.L246
.L248:
	movl	66652(%rbp), %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$27, %eax
	addl	%eax, %edx
	andl	$31, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	movl	66652(%rbp), %eax
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
	jne	.L247
	movl	66652(%rbp), %eax
	leal	15(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$4, %eax
	addl	$1, %eax
	cvtsi2sd	%eax, %xmm0
	movsd	.LC69(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	cvtsi2sd	66084(%rbp), %xmm1
	cvtsi2sd	66092(%rbp), %xmm0
	call	lerp
	cvttsd2si	%xmm0, %ebx
	movl	66652(%rbp), %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$28, %eax
	addl	%eax, %edx
	andl	$15, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	addl	$1, %eax
	cvtsi2sd	%eax, %xmm0
	movsd	.LC69(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	cvtsi2sd	66088(%rbp), %xmm1
	cvtsi2sd	66096(%rbp), %xmm0
	call	lerp
	cvttsd2si	%xmm0, %edi
	movl	66652(%rbp), %eax
	leal	15(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$4, %eax
	cvtsi2sd	%eax, %xmm0
	movsd	.LC69(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	cvtsi2sd	66084(%rbp), %xmm1
	cvtsi2sd	66092(%rbp), %xmm0
	call	lerp
	cvttsd2si	%xmm0, %esi
	movl	66652(%rbp), %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$28, %eax
	addl	%eax, %edx
	andl	$15, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	cvtsi2sd	%eax, %xmm0
	movsd	.LC69(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	cvtsi2sd	66088(%rbp), %xmm1
	cvtsi2sd	66096(%rbp), %xmm0
	call	lerp
	cvttsd2si	%xmm0, %eax
	movq	66520(%rbp), %rcx
	movq	66312(%rbp), %rdx
	movq	%rdx, 40(%rsp)
	movl	%ebx, 32(%rsp)
	movl	%edi, %r9d
	movl	%esi, %r8d
	movl	%eax, %edx
	call	draw_image
.L247:
	addl	$1, 66652(%rbp)
.L246:
	cmpl	$255, 66652(%rbp)
	jle	.L248
	movzbl	66103(%rbp), %eax
	movl	$0, %r8d
	movl	$4, %edx
	movl	%eax, %ecx
	call	BGG
	cvtsi2sd	%eax, %xmm0
	movsd	.LC69(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	cvtsi2sd	66088(%rbp), %xmm1
	cvtsi2sd	66096(%rbp), %xmm0
	call	lerp
	cvttsd2si	%xmm0, %eax
	movl	%eax, 66080(%rbp)
	movl	$255, %ecx
	movl	66080(%rbp), %eax
	leal	1(%rax), %r9d
	movl	66080(%rbp), %eax
	leal	-1(%rax), %edx
	movl	66092(%rbp), %r8d
	movq	66520(%rbp), %rax
	movl	%ecx, 40(%rsp)
	movl	66084(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_rectangle_color
	movzbl	66103(%rbp), %eax
	movl	$1, %r8d
	movl	$4, %edx
	movl	%eax, %ecx
	call	BGG
	cvtsi2sd	%eax, %xmm0
	movsd	.LC69(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	cvtsi2sd	66084(%rbp), %xmm1
	cvtsi2sd	66092(%rbp), %xmm0
	call	lerp
	cvttsd2si	%xmm0, %eax
	movl	%eax, 66076(%rbp)
	movl	$255, %r10d
	movl	66076(%rbp), %eax
	leal	1(%rax), %ecx
	movl	66076(%rbp), %eax
	leal	-1(%rax), %r8d
	movl	66088(%rbp), %r9d
	movl	66096(%rbp), %edx
	movq	66520(%rbp), %rax
	movl	%r10d, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	$255, %esi
	movzbl	66103(%rbp), %eax
	movl	$1, %r8d
	movl	$4, %edx
	movl	%eax, %ecx
	call	BGG
	addl	$1, %eax
	cvtsi2sd	%eax, %xmm0
	movsd	.LC69(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	cvtsi2sd	66084(%rbp), %xmm1
	cvtsi2sd	66092(%rbp), %xmm0
	call	lerp
	cvttsd2si	%xmm0, %ebx
	movzbl	66103(%rbp), %eax
	movl	$0, %r8d
	movl	$4, %edx
	movl	%eax, %ecx
	call	BGG
	addl	$1, %eax
	cvtsi2sd	%eax, %xmm0
	movsd	.LC69(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	cvtsi2sd	66088(%rbp), %xmm1
	cvtsi2sd	66096(%rbp), %xmm0
	call	lerp
	cvttsd2si	%xmm0, %ecx
	movl	66076(%rbp), %r8d
	movl	66080(%rbp), %edx
	movq	66520(%rbp), %rax
	movl	%esi, 40(%rsp)
	movl	%ebx, 32(%rsp)
	movl	%ecx, %r9d
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	$0, 66648(%rbp)
	movl	66544(%rbp), %eax
	sall	$5, %eax
	movl	%eax, %edx
	movl	66084(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 66072(%rbp)
	movl	$0, 66644(%rbp)
	jmp	.L249
.L252:
	movl	66688(%rbp), %ecx
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
	movl	66688(%rbp), %ecx
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
	movl	66688(%rbp), %r9d
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
	movl	66688(%rbp), %r9d
	movl	$458129845, %edx
	movl	%r9d, %eax
	imull	%edx
	sarl	$6, %edx
	movl	%r9d, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	66644(%rbp), %eax
	movl	%r8d, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	$737, %r9d
	movl	%r10d, %r8d
	movl	%eax, %ecx
	call	mux_int
	movl	%eax, 66068(%rbp)
	cmpl	$2, 66644(%rbp)
	je	.L250
	movl	66068(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %ecx
	movl	66644(%rbp), %eax
	addl	$1, %eax
	imull	66548(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	66152(%rbp), %eax
	addl	%eax, %edx
	movl	66648(%rbp), %eax
	leal	(%rdx,%rax), %r9d
	movl	66644(%rbp), %eax
	imull	66548(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	66152(%rbp), %eax
	addl	%eax, %edx
	movl	66648(%rbp), %eax
	addl	%eax, %edx
	movl	66084(%rbp), %r8d
	movq	66520(%rbp), %rax
	movl	$32, 72(%rsp)
	movl	$16, 64(%rsp)
	movl	$0, 56(%rsp)
	movl	%ecx, 48(%rsp)
	movq	66392(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	66072(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_image_part
	movl	66548(%rbp), %eax
	addl	%eax, 66648(%rbp)
	jmp	.L251
.L250:
	movl	66548(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	66152(%rbp), %eax
	leal	(%rdx,%rax), %r9d
	movl	66548(%rbp), %eax
	sall	$5, %eax
	movl	%eax, %edx
	movl	66152(%rbp), %eax
	addl	%eax, %edx
	movl	66084(%rbp), %r8d
	movq	66520(%rbp), %rax
	movl	66400(%rbp), %ecx
	movl	%ecx, 64(%rsp)
	movl	66404(%rbp), %ecx
	movl	%ecx, 56(%rsp)
	leaq	.LC70(%rip), %rcx
	movq	%rcx, 48(%rsp)
	movq	66408(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	66072(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_text
.L251:
	addl	$1, 66644(%rbp)
.L249:
	cmpl	$4, 66644(%rbp)
	jle	.L252
	movl	$0, 66640(%rbp)
	movl	66688(%rbp), %eax
	movl	$59, 32(%rsp)
	movl	$5, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	%eax, %ecx
	call	clock_is_between
	testl	%eax, %eax
	je	.L253
	movl	$0, 66640(%rbp)
.L253:
	movl	66688(%rbp), %eax
	movl	$59, 32(%rsp)
	movl	$11, %r9d
	movl	$0, %r8d
	movl	$6, %edx
	movl	%eax, %ecx
	call	clock_is_between
	testl	%eax, %eax
	je	.L254
	movl	$1, 66640(%rbp)
.L254:
	movl	66688(%rbp), %eax
	movl	$59, 32(%rsp)
	movl	$17, %r9d
	movl	$0, %r8d
	movl	$12, %edx
	movl	%eax, %ecx
	call	clock_is_between
	testl	%eax, %eax
	je	.L255
	movl	$2, 66640(%rbp)
.L255:
	movl	66688(%rbp), %eax
	movl	$59, 32(%rsp)
	movl	$23, %r9d
	movl	$0, %r8d
	movl	$18, %edx
	movl	%eax, %ecx
	call	clock_is_between
	testl	%eax, %eax
	je	.L256
	movl	$3, 66640(%rbp)
.L256:
	movq	66352(%rbp), %r9
	movq	66360(%rbp), %r8
	movq	66368(%rbp), %rdx
	movl	66640(%rbp), %eax
	movq	66344(%rbp), %rcx
	movq	%rcx, 32(%rsp)
	movl	%eax, %ecx
	call	mux_str
	movq	%rax, %r11
	movl	66400(%rbp), %eax
	imull	66544(%rbp), %eax
	movl	66404(%rbp), %edx
	imull	66548(%rbp), %edx
	movl	%edx, %r8d
	movl	66072(%rbp), %ecx
	movl	66544(%rbp), %edx
	leal	(%rcx,%rdx), %r10d
	movl	66152(%rbp), %edx
	movq	66520(%rbp), %rcx
	movl	66400(%rbp), %r9d
	movl	%r9d, 64(%rsp)
	movl	66404(%rbp), %r9d
	movl	%r9d, 56(%rsp)
	movq	%r11, 48(%rsp)
	movq	66408(%rbp), %r9
	movq	%r9, 40(%rsp)
	movl	%eax, 32(%rsp)
	movl	%r8d, %r9d
	movl	%r10d, %r8d
	call	draw_text
	movl	66072(%rbp), %edx
	movl	66544(%rbp), %eax
	addl	%eax, %edx
	movl	66400(%rbp), %eax
	imull	66544(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 66064(%rbp)
	movl	66544(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	66064(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 66060(%rbp)
	movl	66548(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	66152(%rbp), %eax
	leal	(%rdx,%rax), %r9d
	movl	66064(%rbp), %r8d
	movl	66152(%rbp), %edx
	movq	66520(%rbp), %rax
	movq	66296(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	66060(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_image
	movl	66400(%rbp), %eax
	imull	66544(%rbp), %eax
	movl	%eax, %ebx
	movl	66404(%rbp), %eax
	imull	66548(%rbp), %eax
	movl	%eax, %esi
	cvtsi2sd	66060(%rbp), %xmm1
	cvtsi2sd	66064(%rbp), %xmm0
	movsd	.LC71(%rip), %xmm2
	call	lerp
	cvttsd2si	%xmm0, %r8d
	movl	66152(%rbp), %eax
	leal	48(%rax), %edx
	movq	66520(%rbp), %rcx
	movl	66400(%rbp), %eax
	movl	%eax, 64(%rsp)
	movl	66404(%rbp), %eax
	movl	%eax, 56(%rsp)
	leaq	68(%rbp), %rax
	movq	%rax, 48(%rsp)
	movq	66408(%rbp), %rax
	movq	%rax, 40(%rsp)
	movl	%ebx, 32(%rsp)
	movl	%esi, %r9d
	call	draw_text
	movq	%r15, %rsp
.L245:
	movl	66552(%rbp), %eax
	movl	%eax, 66056(%rbp)
	movl	$0, 66636(%rbp)
	jmp	.L257
.L260:
	movl	$0, 66632(%rbp)
	jmp	.L258
.L259:
	movl	66636(%rbp), %eax
	imull	66556(%rbp), %eax
	movl	66632(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 66052(%rbp)
	movl	66632(%rbp), %eax
	imull	66548(%rbp), %eax
	imull	66552(%rbp), %eax
	movl	66580(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 66048(%rbp)
	movl	66636(%rbp), %eax
	imull	66544(%rbp), %eax
	imull	66552(%rbp), %eax
	movl	66576(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 66044(%rbp)
	movl	66632(%rbp), %eax
	addl	$1, %eax
	imull	66548(%rbp), %eax
	imull	66552(%rbp), %eax
	movl	66580(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 66040(%rbp)
	movl	66636(%rbp), %eax
	addl	$1, %eax
	imull	66544(%rbp), %eax
	imull	66552(%rbp), %eax
	movl	66576(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 66036(%rbp)
	movl	$16711680, %r9d
	movl	$65280, %r8d
	movl	$255, %r10d
	movl	66052(%rbp), %ecx
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
	movl	%eax, 66032(%rbp)
	movl	66040(%rbp), %r9d
	movl	66044(%rbp), %r8d
	movl	66048(%rbp), %edx
	movq	66520(%rbp), %rax
	movl	66032(%rbp), %ecx
	movl	%ecx, 40(%rsp)
	movl	66036(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	66340(%rbp), %eax
	imull	66680(%rbp), %eax
	movl	66052(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 66028(%rbp)
	movl	66028(%rbp), %eax
	cltq
	movzbl	224(%rbp,%rax), %eax
	movzbl	%al, %eax
	movl	%eax, 66024(%rbp)
	movl	66024(%rbp), %eax
	cltd
	idivl	66556(%rbp)
	imull	66056(%rbp), %eax
	movl	%eax, %ecx
	movl	66024(%rbp), %eax
	cltd
	idivl	66556(%rbp)
	movl	%edx, %eax
	imull	66056(%rbp), %eax
	movl	66040(%rbp), %r9d
	movl	66044(%rbp), %r11d
	movl	66048(%rbp), %edx
	movq	66520(%rbp), %r10
	movl	66056(%rbp), %r8d
	movl	%r8d, 72(%rsp)
	movl	66056(%rbp), %r8d
	movl	%r8d, 64(%rsp)
	movl	%ecx, 56(%rsp)
	movl	%eax, 48(%rsp)
	movq	66432(%rbp), %rax
	movq	%rax, 40(%rsp)
	movl	66036(%rbp), %eax
	movl	%eax, 32(%rsp)
	movl	%r11d, %r8d
	movq	%r10, %rcx
	call	draw_image_part
	addl	$1, 66632(%rbp)
.L258:
	movl	66632(%rbp), %eax
	cmpl	66556(%rbp), %eax
	jl	.L259
	addl	$1, 66636(%rbp)
.L257:
	movl	66636(%rbp), %eax
	cmpl	66556(%rbp), %eax
	jl	.L260
	movzbl	160(%rbp), %eax
	movzbl	%al, %eax
	imull	66056(%rbp), %eax
	movl	%eax, %edx
	movzbl	165(%rbp), %eax
	movzbl	%al, %eax
	imull	%eax, %edx
	movzbl	164(%rbp), %eax
	movzbl	%al, %eax
	imull	66056(%rbp), %eax
	leal	(%rdx,%rax), %r8d
	movl	148(%rbp), %edx
	movl	66056(%rbp), %eax
	imull	66544(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	movl	144(%rbp), %edx
	movl	66056(%rbp), %eax
	imull	66548(%rbp), %eax
	leal	(%rdx,%rax), %r11d
	movl	148(%rbp), %r10d
	movl	144(%rbp), %edx
	movq	66520(%rbp), %rax
	movl	66056(%rbp), %r9d
	movl	%r9d, 72(%rsp)
	movl	66056(%rbp), %r9d
	movl	%r9d, 64(%rsp)
	movl	$0, 56(%rsp)
	movl	%r8d, 48(%rsp)
	movq	66416(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	%r11d, %r9d
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	draw_image_part
	cmpl	$0, 66696(%rbp)
	jle	.L261
	movl	144(%rbp), %eax
	addl	$60, %eax
	movl	%eax, 65888(%rbp)
	movl	148(%rbp), %eax
	subl	$120, %eax
	movl	%eax, 65892(%rbp)
	movq	66520(%rbp), %rax
	movl	$255, 32(%rsp)
	movl	$255, %r9d
	movl	$255, %r8d
	movl	$255, %edx
	movq	%rax, %rcx
	call	SDL_SetRenderDrawColor
	movq	66496(%rbp), %rdx
	movq	66520(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_RenderFillRect
	movq	66520(%rbp), %rax
	movl	$255, 32(%rsp)
	movl	$255, %r9d
	movl	$255, %r8d
	movl	$255, %edx
	movq	%rax, %rcx
	call	SDL_SetRenderDrawColor
	movq	66496(%rbp), %rax
	movl	4(%rax), %ecx
	movq	66496(%rbp), %rax
	movl	12(%rax), %eax
	leal	3(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$2, %eax
	leal	(%rcx,%rax), %r8d
	movq	66496(%rbp), %rax
	movl	(%rax), %eax
	cvtsi2sd	%eax, %xmm1
	movq	66496(%rbp), %rax
	movl	8(%rax), %eax
	cvtsi2sd	%eax, %xmm2
	movsd	.LC72(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	cvttsd2si	%xmm0, %ecx
	movl	148(%rbp), %eax
	leal	-15(%rax), %r10d
	movl	144(%rbp), %eax
	leal	45(%rax), %edx
	movq	66520(%rbp), %rax
	movl	%r8d, 32(%rsp)
	movl	%ecx, %r9d
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	SDL_RenderDrawLine
	movq	66496(%rbp), %rax
	movl	4(%rax), %edx
	movq	66496(%rbp), %rax
	movl	12(%rax), %eax
	leal	(%rdx,%rax), %r8d
	movq	66496(%rbp), %rax
	movl	(%rax), %eax
	cvtsi2sd	%eax, %xmm1
	movq	66496(%rbp), %rax
	movl	8(%rax), %eax
	cvtsi2sd	%eax, %xmm2
	movsd	.LC73(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	cvttsd2si	%xmm0, %ecx
	movl	148(%rbp), %eax
	leal	-15(%rax), %r10d
	movl	144(%rbp), %eax
	leal	45(%rax), %edx
	movq	66520(%rbp), %rax
	movl	%r8d, 32(%rsp)
	movl	%ecx, %r9d
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	SDL_RenderDrawLine
	movl	$0, 28(%rbp)
	movq	66496(%rbp), %rax
	movl	8(%rax), %eax
	subl	$10, %eax
	movl	%eax, 66020(%rbp)
	movl	66020(%rbp), %r8d
	movl	28(%rbp), %ecx
	movq	66504(%rbp), %rdx
	movq	66488(%rbp), %rax
	movl	%r8d, %r9d
	movl	%ecx, %r8d
	movq	%rax, %rcx
	call	TTF_RenderText_Blended_Wrapped
	movq	%rax, 66624(%rbp)
	cmpq	$0, 66624(%rbp)
	jne	.L262
	movl	28(%rbp), %edx
	movq	66488(%rbp), %rax
	movl	%edx, %r8d
	leaq	.LC74(%rip), %rdx
	movq	%rax, %rcx
	call	TTF_RenderText_Solid
	movq	%rax, 66624(%rbp)
.L262:
	movq	66624(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, 66016(%rbp)
	movq	66624(%rbp), %rax
	movl	20(%rax), %eax
	movl	%eax, 66012(%rbp)
	movq	66496(%rbp), %rax
	movl	(%rax), %edx
	movq	66496(%rbp), %rax
	movl	8(%rax), %eax
	subl	66016(%rbp), %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	sarl	%eax
	addl	%edx, %eax
	movl	%eax, 66008(%rbp)
	movq	66496(%rbp), %rax
	movl	4(%rax), %edx
	movq	66496(%rbp), %rax
	movl	12(%rax), %eax
	subl	66012(%rbp), %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	sarl	%eax
	addl	%edx, %eax
	movl	%eax, 66004(%rbp)
	movl	66008(%rbp), %eax
	movl	%eax, 0(%rbp)
	movl	66004(%rbp), %eax
	movl	%eax, 4(%rbp)
	movl	66016(%rbp), %eax
	movl	%eax, 8(%rbp)
	movl	66012(%rbp), %eax
	movl	%eax, 12(%rbp)
	movq	66624(%rbp), %rdx
	movq	66520(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_CreateTextureFromSurface
	movq	%rax, 65992(%rbp)
	movq	%rbp, %rcx
	movq	65992(%rbp), %rdx
	movq	66520(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	SDL_RenderCopy
	movq	66624(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_FreeSurface
	movq	65992(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
.L261:
	movl	$0, 66620(%rbp)
	jmp	.L263
.L265:
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	66620(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	12(%rax), %eax
	testl	%eax, %eax
	je	.L264
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rdx
	movl	66620(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm1
	movss	.LC75(%rip), %xmm0
	addss	%xmm1, %xmm0
	cvttss2si	%xmm0, %edx
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rcx
	movl	66620(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm1
	movss	.LC76(%rip), %xmm0
	addss	%xmm1, %xmm0
	cvttss2si	%xmm0, %r9d
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rcx
	movl	66620(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movss	4(%rax), %xmm0
	cvttss2si	%xmm0, %r8d
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rcx
	movl	66620(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm0
	cvttss2si	%xmm0, %eax
	movq	66520(%rbp), %rcx
	movq	66448(%rbp), %r10
	movq	%r10, 40(%rsp)
	movl	%edx, 32(%rsp)
	movl	%eax, %edx
	call	draw_image
.L264:
	addl	$1, 66620(%rbp)
.L263:
	movl	$100, %eax
	cmpl	%eax, 66620(%rbp)
	jl	.L265
	cmpl	$0, 66672(%rbp)
	je	.L266
	movl	66564(%rbp), %r9d
	movl	66576(%rbp), %r8d
	movl	66580(%rbp), %edx
	movq	66520(%rbp), %rax
	movq	66256(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	66560(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_image
	movl	66400(%rbp), %eax
	imull	66544(%rbp), %eax
	movl	66404(%rbp), %edx
	imull	66548(%rbp), %edx
	movl	%edx, %r8d
	movl	66576(%rbp), %r10d
	movl	66580(%rbp), %edx
	movq	66520(%rbp), %rcx
	movl	66400(%rbp), %r9d
	movl	%r9d, 64(%rsp)
	movl	66404(%rbp), %r9d
	movl	%r9d, 56(%rsp)
	movq	66248(%rbp), %r9
	movq	%r9, 48(%rsp)
	movq	66408(%rbp), %r9
	movq	%r9, 40(%rsp)
	movl	%eax, 32(%rsp)
	movl	%r8d, %r9d
	movl	%r10d, %r8d
	call	draw_text
.L266:
	cmpl	$0, 66696(%rbp)
	jle	.L267
	movq	66520(%rbp), %rax
	movl	$255, 32(%rsp)
	movl	$255, %r9d
	movl	$255, %r8d
	movl	$255, %edx
	movq	%rax, %rcx
	call	SDL_SetRenderDrawColor
	leaq	65888(%rbp), %rax
	movq	66520(%rbp), %rcx
	movq	%rax, %rdx
	call	SDL_RenderFillRect
	movl	$0, -4(%rbp)
	movb	$-1, -4(%rbp)
	movl	-4(%rbp), %ecx
	movq	66504(%rbp), %rdx
	movq	66488(%rbp), %rax
	movl	%ecx, %r8d
	movq	%rax, %rcx
	call	TTF_RenderText_Solid
	movq	%rax, 65984(%rbp)
	movq	65984(%rbp), %rdx
	movq	66520(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_CreateTextureFromSurface
	movq	%rax, 65976(%rbp)
	movl	65888(%rbp), %edx
	movl	65896(%rbp), %ecx
	movq	65984(%rbp), %rax
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
	movq	65984(%rbp), %rax
	movl	20(%rax), %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	sarl	%eax
	addl	%edx, %eax
	movl	%eax, -28(%rbp)
	movq	65984(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, -24(%rbp)
	movq	65984(%rbp), %rax
	movl	20(%rax), %eax
	movl	%eax, -20(%rbp)
	leaq	-32(%rbp), %rcx
	movq	65976(%rbp), %rdx
	movq	66520(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	SDL_RenderCopy
	movq	65984(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_FreeSurface
	movq	65976(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
.L267:
	movq	66520(%rbp), %rax
	movl	$255, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	SDL_SetRenderDrawColor
	movl	66700(%rbp), %edx
	leaq	48(%rbp), %rax
	movl	%edx, %r9d
	leaq	.LC77(%rip), %r8
	movl	$20, %edx
	movq	%rax, %rcx
	call	snprintf
	movl	65772(%rbp), %edx
	leaq	48(%rbp), %rax
	movq	66488(%rbp), %rcx
	movl	%edx, %r8d
	movq	%rax, %rdx
	call	TTF_RenderText_Solid
	movq	%rax, 65968(%rbp)
	movq	65968(%rbp), %rdx
	movq	66520(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_CreateTextureFromSurface
	movq	%rax, 65960(%rbp)
	movl	$10, 32(%rbp)
	movl	$720, 36(%rbp)
	movq	65968(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, 40(%rbp)
	movq	65968(%rbp), %rax
	movl	20(%rax), %eax
	movl	%eax, 44(%rbp)
	leaq	32(%rbp), %rcx
	movq	65960(%rbp), %rdx
	movq	66520(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	SDL_RenderCopy
	movq	65968(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_FreeSurface
	movq	65960(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66520(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_RenderPresent
	movl	$16, %ecx
	call	SDL_Delay
.L159:
	cmpl	$0, 66668(%rbp)
	jne	.L160
	leaq	.LC78(%rip), %rcx
	call	puts
	leaq	waterParticles(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	free
	movq	66488(%rbp), %rax
	movq	%rax, %rcx
	call	TTF_CloseFont
	movq	66464(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66456(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66448(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66440(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66432(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66320(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66312(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66416(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66256(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66408(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66392(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66296(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66424(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66280(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	call	IMG_Quit
	movl	66268(%rbp), %eax
	movl	%eax, %ecx
	call	SDL_CloseAudioDevice
	movq	104(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_FreeWAV
	movq	66520(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyRenderer
	movq	66528(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyWindow
	call	SDL_Quit
	movl	$500, %ecx
	call	SDL_Delay
	movl	$0, %eax
	jmp	.L143
.L148:
	call	SDL_GetError
	movq	%rax, %rsi
	movq	66592(%rbp), %rbx
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC79(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	call	SDL_Quit
	movl	$1, %ecx
	call	exit
.L143:
	movq	%r12, %rsp
	jmp	.L141
.L157:
	movq	%r12, %rsp
.L141:
	leaq	66712(%rbp), %rsp
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
	.long	1081081856
	.align 8
.LC2:
	.long	0
	.long	1081507840
	.align 8
.LC4:
	.long	0
	.long	1078853632
	.align 8
.LC5:
	.long	0
	.long	1072693248
	.align 8
.LC6:
	.long	0
	.long	1080459264
	.align 8
.LC7:
	.long	1413754136
	.long	1074340347
	.align 8
.LC13:
	.long	0
	.long	1076101120
	.align 4
.LC16:
	.long	1092616192
	.align 8
.LC17:
	.long	-858993459
	.long	1073532108
	.align 8
.LC18:
	.long	0
	.long	1077936128
	.align 8
.LC69:
	.long	0
	.long	1076887552
	.align 8
.LC71:
	.long	0
	.long	1070596096
	.align 8
.LC72:
	.long	-1717986918
	.long	1069128089
	.align 8
.LC73:
	.long	858993459
	.long	1070805811
	.align 4
.LC75:
	.long	1097859072
	.align 4
.LC76:
	.long	1084227584
	.ident	"GCC: (x86_64-posix-seh, Built by strawberryperl.com project) 8.3.0"
	.def	__ms_vsnprintf;	.scl	2;	.type	32;	.endef
	.def	SDL_FillRect;	.scl	2;	.type	32;	.endef
	.def	SDL_GetError;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	SDL_Quit;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	floor;	.scl	2;	.type	32;	.endef
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
	.def	SDL_GetVersion;	.scl	2;	.type	32;	.endef
	.def	SDL_Log;	.scl	2;	.type	32;	.endef
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
