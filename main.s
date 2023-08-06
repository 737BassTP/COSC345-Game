	.file	"main.c"
	.intel_syntax noprefix
	.text
	.def	time;	.scl	3;	.type	32;	.endef
	.seh_proc	time
time:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	mov	rcx, rax
	mov	rax, QWORD PTR __imp__time64[rip]
	call	rax
	add	rsp, 32
	pop	rbp
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
	.globl	glob_draw_color
	.align 4
glob_draw_color:
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
	push	rbp
	.seh_pushreg	rbp
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 40
	.seh_stackalloc	40
	lea	rbp, 32[rsp]
	.seh_setframe	rbp, 32
	.seh_endprologue
	mov	QWORD PTR 32[rbp], rcx
	mov	rax, QWORD PTR 32[rbp]
	mov	r8d, -16777152
	mov	edx, 0
	mov	rcx, rax
	call	SDL_FillRect
	test	eax, eax
	jns	.L5
	call	SDL_GetError
	mov	rbx, rax
	mov	ecx, 2
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	rcx, rax
	mov	r8, rbx
	lea	rax, .LC0[rip]
	mov	rdx, rax
	call	fprintf
	call	SDL_Quit
	mov	ecx, 1
	call	exit
.L5:
	nop
	add	rsp, 40
	pop	rbx
	pop	rbp
	ret
	.seh_endproc
	.globl	make_color_rgb
	.def	make_color_rgb;	.scl	2;	.type	32;	.endef
	.seh_proc	make_color_rgb
make_color_rgb:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	DWORD PTR 24[rbp], edx
	mov	DWORD PTR 32[rbp], r8d
	mov	eax, DWORD PTR 16[rbp]
	movzx	edx, al
	mov	eax, DWORD PTR 24[rbp]
	sal	eax, 8
	movzx	eax, ax
	or	edx, eax
	mov	eax, DWORD PTR 32[rbp]
	sal	eax, 16
	and	eax, 16711680
	or	eax, edx
	pop	rbp
	ret
	.seh_endproc
	.globl	lerp
	.def	lerp;	.scl	2;	.type	32;	.endef
	.seh_proc	lerp
lerp:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	movsd	QWORD PTR 16[rbp], xmm0
	movsd	QWORD PTR 24[rbp], xmm1
	movsd	QWORD PTR 32[rbp], xmm2
	movsd	xmm0, QWORD PTR 24[rbp]
	subsd	xmm0, QWORD PTR 16[rbp]
	mulsd	xmm0, QWORD PTR 32[rbp]
	addsd	xmm0, QWORD PTR 16[rbp]
	movq	rax, xmm0
	movq	xmm0, rax
	pop	rbp
	ret
	.seh_endproc
	.globl	make_color_hsv
	.def	make_color_hsv;	.scl	2;	.type	32;	.endef
	.seh_proc	make_color_hsv
make_color_hsv:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	DWORD PTR 24[rbp], edx
	mov	DWORD PTR 32[rbp], r8d
	cmp	DWORD PTR 24[rbp], 0
	jne	.L11
	mov	ecx, DWORD PTR 32[rbp]
	mov	edx, DWORD PTR 32[rbp]
	mov	eax, DWORD PTR 32[rbp]
	mov	r8d, ecx
	mov	ecx, eax
	call	make_color_rgb
	jmp	.L12
.L11:
	mov	eax, DWORD PTR 16[rbp]
	movsx	rdx, eax
	imul	rdx, rdx, 799063683
	shr	rdx, 32
	mov	ecx, edx
	sar	ecx, 3
	cdq
	mov	eax, ecx
	sub	eax, edx
	mov	BYTE PTR -4[rbp], al
	movzx	eax, BYTE PTR -4[rbp]
	imul	eax, eax, -43
	mov	edx, DWORD PTR 16[rbp]
	add	eax, edx
	mov	edx, eax
	mov	eax, edx
	add	eax, eax
	add	eax, edx
	add	eax, eax
	mov	BYTE PTR -5[rbp], al
	mov	eax, 255
	sub	eax, DWORD PTR 24[rbp]
	imul	eax, DWORD PTR 32[rbp]
	sar	eax, 8
	mov	BYTE PTR -6[rbp], al
	movzx	eax, BYTE PTR -5[rbp]
	imul	eax, DWORD PTR 24[rbp]
	sar	eax, 8
	mov	edx, eax
	mov	eax, 255
	sub	eax, edx
	imul	eax, DWORD PTR 32[rbp]
	sar	eax, 8
	mov	BYTE PTR -7[rbp], al
	movzx	eax, BYTE PTR -5[rbp]
	mov	edx, 255
	sub	edx, eax
	mov	eax, edx
	imul	eax, DWORD PTR 24[rbp]
	sar	eax, 8
	mov	edx, eax
	mov	eax, 255
	sub	eax, edx
	imul	eax, DWORD PTR 32[rbp]
	sar	eax, 8
	mov	BYTE PTR -8[rbp], al
	movzx	eax, BYTE PTR -4[rbp]
	cmp	eax, 4
	ja	.L13
	mov	eax, eax
	lea	rdx, 0[0+rax*4]
	lea	rax, .L15[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cdqe
	lea	rdx, .L15[rip]
	add	rax, rdx
	jmp	rax
	.section .rdata,"dr"
	.align 4
.L15:
	.long	.L19-.L15
	.long	.L18-.L15
	.long	.L17-.L15
	.long	.L16-.L15
	.long	.L14-.L15
	.text
.L19:
	mov	eax, DWORD PTR 32[rbp]
	mov	BYTE PTR -1[rbp], al
	movzx	eax, BYTE PTR -8[rbp]
	mov	BYTE PTR -2[rbp], al
	movzx	eax, BYTE PTR -6[rbp]
	mov	BYTE PTR -3[rbp], al
	jmp	.L20
.L18:
	movzx	eax, BYTE PTR -7[rbp]
	mov	BYTE PTR -1[rbp], al
	mov	eax, DWORD PTR 32[rbp]
	mov	BYTE PTR -2[rbp], al
	movzx	eax, BYTE PTR -6[rbp]
	mov	BYTE PTR -3[rbp], al
	jmp	.L20
.L17:
	movzx	eax, BYTE PTR -6[rbp]
	mov	BYTE PTR -1[rbp], al
	mov	eax, DWORD PTR 32[rbp]
	mov	BYTE PTR -2[rbp], al
	movzx	eax, BYTE PTR -8[rbp]
	mov	BYTE PTR -3[rbp], al
	jmp	.L20
.L16:
	movzx	eax, BYTE PTR -6[rbp]
	mov	BYTE PTR -1[rbp], al
	movzx	eax, BYTE PTR -7[rbp]
	mov	BYTE PTR -2[rbp], al
	mov	eax, DWORD PTR 32[rbp]
	mov	BYTE PTR -3[rbp], al
	jmp	.L20
.L14:
	movzx	eax, BYTE PTR -8[rbp]
	mov	BYTE PTR -1[rbp], al
	movzx	eax, BYTE PTR -6[rbp]
	mov	BYTE PTR -2[rbp], al
	mov	eax, DWORD PTR 32[rbp]
	mov	BYTE PTR -3[rbp], al
	jmp	.L20
.L13:
	mov	eax, DWORD PTR 32[rbp]
	mov	BYTE PTR -1[rbp], al
	movzx	eax, BYTE PTR -6[rbp]
	mov	BYTE PTR -2[rbp], al
	movzx	eax, BYTE PTR -7[rbp]
	mov	BYTE PTR -3[rbp], al
	nop
.L20:
	movzx	ecx, BYTE PTR -3[rbp]
	movzx	edx, BYTE PTR -2[rbp]
	movzx	eax, BYTE PTR -1[rbp]
	mov	r8d, ecx
	mov	ecx, eax
	call	make_color_rgb
.L12:
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	draw_get_alpha
	.def	draw_get_alpha;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_get_alpha
draw_get_alpha:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	eax, DWORD PTR glob_draw_alpha[rip]
	pop	rbp
	ret
	.seh_endproc
	.globl	draw_get_color
	.def	draw_get_color;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_get_color
draw_get_color:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	eax, DWORD PTR glob_draw_color[rip]
	pop	rbp
	ret
	.seh_endproc
	.globl	draw_set_color
	.def	draw_set_color;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_set_color
draw_set_color:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	DWORD PTR 24[rbp], edx
	mov	eax, DWORD PTR 24[rbp]
	and	eax, 16777215
	mov	DWORD PTR glob_draw_color[rip], eax
	call	draw_get_alpha
	movzx	edx, al
	mov	eax, DWORD PTR 24[rbp]
	sar	eax, 16
	movzx	r9d, al
	mov	eax, DWORD PTR 24[rbp]
	sar	eax, 8
	movzx	r8d, al
	mov	eax, DWORD PTR 24[rbp]
	movzx	eax, al
	mov	rcx, QWORD PTR 16[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	edx, eax
	call	SDL_SetRenderDrawColor
	nop
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	draw_set_alpha
	.def	draw_set_alpha;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_set_alpha
draw_set_alpha:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	DWORD PTR 24[rbp], edx
	mov	eax, DWORD PTR 24[rbp]
	movzx	eax, al
	mov	DWORD PTR glob_draw_alpha[rip], eax
	call	draw_get_color
	mov	DWORD PTR -4[rbp], eax
	mov	eax, DWORD PTR 24[rbp]
	movzx	edx, al
	mov	eax, DWORD PTR -4[rbp]
	sar	eax, 16
	movzx	r9d, al
	mov	eax, DWORD PTR -4[rbp]
	sar	eax, 8
	movzx	r8d, al
	mov	eax, DWORD PTR -4[rbp]
	movzx	eax, al
	mov	rcx, QWORD PTR 16[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	edx, eax
	call	SDL_SetRenderDrawColor
	nop
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	draw_clear
	.def	draw_clear;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_clear
draw_clear:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	DWORD PTR 24[rbp], edx
	mov	edx, DWORD PTR 24[rbp]
	mov	rax, QWORD PTR 16[rbp]
	mov	rcx, rax
	call	draw_set_color
	mov	rax, QWORD PTR 16[rbp]
	mov	rcx, rax
	call	SDL_RenderClear
	nop
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.globl	draw_clear_alpha
	.def	draw_clear_alpha;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_clear_alpha
draw_clear_alpha:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	DWORD PTR 24[rbp], edx
	mov	DWORD PTR 32[rbp], r8d
	mov	edx, DWORD PTR 32[rbp]
	mov	rax, QWORD PTR 16[rbp]
	mov	rcx, rax
	call	draw_set_alpha
	mov	edx, DWORD PTR 24[rbp]
	mov	rax, QWORD PTR 16[rbp]
	mov	rcx, rax
	call	draw_clear
	nop
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.globl	draw_rectangle
	.def	draw_rectangle;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_rectangle
draw_rectangle:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	DWORD PTR 24[rbp], edx
	mov	DWORD PTR 32[rbp], r8d
	mov	DWORD PTR 40[rbp], r9d
	mov	eax, DWORD PTR 24[rbp]
	mov	DWORD PTR -16[rbp], eax
	mov	eax, DWORD PTR 32[rbp]
	mov	DWORD PTR -12[rbp], eax
	mov	eax, DWORD PTR 40[rbp]
	sub	eax, DWORD PTR 24[rbp]
	mov	DWORD PTR -8[rbp], eax
	mov	eax, DWORD PTR 48[rbp]
	sub	eax, DWORD PTR 32[rbp]
	mov	DWORD PTR -4[rbp], eax
	lea	rax, -16[rbp]
	mov	rcx, QWORD PTR 16[rbp]
	mov	rdx, rax
	call	SDL_RenderFillRect
	nop
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	draw_rectangle_color
	.def	draw_rectangle_color;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_rectangle_color
draw_rectangle_color:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	DWORD PTR 24[rbp], edx
	mov	DWORD PTR 32[rbp], r8d
	mov	DWORD PTR 40[rbp], r9d
	call	draw_get_color
	mov	DWORD PTR -4[rbp], eax
	mov	edx, DWORD PTR 56[rbp]
	mov	rax, QWORD PTR 16[rbp]
	mov	rcx, rax
	call	draw_set_color
	mov	r9d, DWORD PTR 40[rbp]
	mov	r8d, DWORD PTR 32[rbp]
	mov	edx, DWORD PTR 24[rbp]
	mov	rax, QWORD PTR 16[rbp]
	mov	ecx, DWORD PTR 48[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_rectangle
	mov	edx, DWORD PTR -4[rbp]
	mov	rax, QWORD PTR 16[rbp]
	mov	rcx, rax
	call	draw_set_color
	nop
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	draw_image
	.def	draw_image;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_image
draw_image:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	DWORD PTR 24[rbp], edx
	mov	DWORD PTR 32[rbp], r8d
	mov	DWORD PTR 40[rbp], r9d
	mov	eax, DWORD PTR 24[rbp]
	mov	DWORD PTR -32[rbp], eax
	mov	eax, DWORD PTR 32[rbp]
	mov	DWORD PTR -28[rbp], eax
	mov	eax, DWORD PTR 40[rbp]
	sub	eax, DWORD PTR 24[rbp]
	mov	DWORD PTR -24[rbp], eax
	mov	eax, DWORD PTR 48[rbp]
	sub	eax, DWORD PTR 32[rbp]
	mov	DWORD PTR -20[rbp], eax
	mov	eax, DWORD PTR glob_draw_color[rip]
	mov	DWORD PTR -4[rbp], eax
	mov	eax, DWORD PTR -4[rbp]
	sar	eax, 16
	movzx	r8d, al
	mov	eax, DWORD PTR -4[rbp]
	sar	eax, 8
	movzx	edx, al
	mov	eax, DWORD PTR -4[rbp]
	movzx	eax, al
	mov	rcx, QWORD PTR 56[rbp]
	mov	r9d, r8d
	mov	r8d, edx
	mov	edx, eax
	call	SDL_SetTextureColorMod
	lea	rcx, -32[rbp]
	mov	rdx, QWORD PTR 56[rbp]
	mov	rax, QWORD PTR 16[rbp]
	mov	r9, rcx
	mov	r8d, 0
	mov	rcx, rax
	call	SDL_RenderCopy
	nop
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	draw_image_part
	.def	draw_image_part;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_image_part
draw_image_part:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	DWORD PTR 24[rbp], edx
	mov	DWORD PTR 32[rbp], r8d
	mov	DWORD PTR 40[rbp], r9d
	mov	eax, DWORD PTR 24[rbp]
	mov	DWORD PTR -32[rbp], eax
	mov	eax, DWORD PTR 32[rbp]
	mov	DWORD PTR -28[rbp], eax
	mov	eax, DWORD PTR 40[rbp]
	sub	eax, DWORD PTR 24[rbp]
	mov	DWORD PTR -24[rbp], eax
	mov	eax, DWORD PTR 48[rbp]
	sub	eax, DWORD PTR 32[rbp]
	mov	DWORD PTR -20[rbp], eax
	mov	eax, DWORD PTR 64[rbp]
	mov	DWORD PTR -48[rbp], eax
	mov	eax, DWORD PTR 72[rbp]
	mov	DWORD PTR -44[rbp], eax
	mov	eax, DWORD PTR 80[rbp]
	mov	DWORD PTR -40[rbp], eax
	mov	eax, DWORD PTR 88[rbp]
	mov	DWORD PTR -36[rbp], eax
	mov	eax, DWORD PTR glob_draw_color[rip]
	mov	DWORD PTR -4[rbp], eax
	mov	eax, DWORD PTR -4[rbp]
	sar	eax, 16
	movzx	r8d, al
	mov	eax, DWORD PTR -4[rbp]
	sar	eax, 8
	movzx	edx, al
	mov	eax, DWORD PTR -4[rbp]
	movzx	eax, al
	mov	rcx, QWORD PTR 56[rbp]
	mov	r9d, r8d
	mov	r8d, edx
	mov	edx, eax
	call	SDL_SetTextureColorMod
	lea	r8, -32[rbp]
	lea	rcx, -48[rbp]
	mov	rdx, QWORD PTR 56[rbp]
	mov	rax, QWORD PTR 16[rbp]
	mov	r9, r8
	mov	r8, rcx
	mov	rcx, rax
	call	SDL_RenderCopy
	nop
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	draw_text
	.def	draw_text;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_text
draw_text:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	DWORD PTR 24[rbp], edx
	mov	DWORD PTR 32[rbp], r8d
	mov	DWORD PTR 40[rbp], r9d
	mov	rax, QWORD PTR 64[rbp]
	mov	rcx, rax
	call	strlen
	mov	DWORD PTR -16[rbp], eax
	mov	DWORD PTR -20[rbp], 0
	mov	DWORD PTR -4[rbp], 0
	mov	DWORD PTR -8[rbp], 0
	mov	eax, 35
	movsx	eax, al
	sub	eax, 32
	mov	DWORD PTR -24[rbp], eax
	mov	DWORD PTR -12[rbp], 0
	jmp	.L34
.L37:
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	mov	rdx, QWORD PTR 64[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	sub	eax, 32
	mov	DWORD PTR -20[rbp], eax
	mov	eax, DWORD PTR -20[rbp]
	cmp	eax, DWORD PTR -24[rbp]
	jne	.L35
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	lea	rdx, 1[rax]
	mov	rax, QWORD PTR 64[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	sub	eax, 32
	cmp	DWORD PTR -24[rbp], eax
	je	.L35
	mov	DWORD PTR -4[rbp], 0
	mov	eax, DWORD PTR 48[rbp]
	add	DWORD PTR -8[rbp], eax
	jmp	.L36
.L35:
	mov	eax, DWORD PTR -20[rbp]
	imul	eax, DWORD PTR 72[rbp]
	mov	ecx, eax
	mov	edx, DWORD PTR 32[rbp]
	mov	eax, DWORD PTR -8[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 48[rbp]
	lea	r8d, [rdx+rax]
	mov	edx, DWORD PTR 24[rbp]
	mov	eax, DWORD PTR -4[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 40[rbp]
	lea	r11d, [rdx+rax]
	mov	edx, DWORD PTR 32[rbp]
	mov	eax, DWORD PTR -8[rbp]
	lea	r10d, [rdx+rax]
	mov	edx, DWORD PTR 24[rbp]
	mov	eax, DWORD PTR -4[rbp]
	add	edx, eax
	mov	rax, QWORD PTR 16[rbp]
	mov	r9d, DWORD PTR 80[rbp]
	mov	DWORD PTR 72[rsp], r9d
	mov	r9d, DWORD PTR 72[rbp]
	mov	DWORD PTR 64[rsp], r9d
	mov	DWORD PTR 56[rsp], 0
	mov	DWORD PTR 48[rsp], ecx
	mov	rcx, QWORD PTR 56[rbp]
	mov	QWORD PTR 40[rsp], rcx
	mov	DWORD PTR 32[rsp], r8d
	mov	r9d, r11d
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_image_part
	mov	eax, DWORD PTR 40[rbp]
	add	DWORD PTR -4[rbp], eax
.L36:
	add	DWORD PTR -12[rbp], 1
.L34:
	mov	eax, DWORD PTR -12[rbp]
	cmp	eax, DWORD PTR -16[rbp]
	jl	.L37
	nop
	nop
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	draw_text_color
	.def	draw_text_color;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_text_color
draw_text_color:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	DWORD PTR 24[rbp], edx
	mov	DWORD PTR 32[rbp], r8d
	mov	DWORD PTR 40[rbp], r9d
	call	draw_get_color
	mov	DWORD PTR -4[rbp], eax
	mov	edx, DWORD PTR 88[rbp]
	mov	rax, QWORD PTR 16[rbp]
	mov	rcx, rax
	call	draw_set_color
	mov	r9d, DWORD PTR 40[rbp]
	mov	r8d, DWORD PTR 32[rbp]
	mov	edx, DWORD PTR 24[rbp]
	mov	rax, QWORD PTR 16[rbp]
	mov	ecx, DWORD PTR 80[rbp]
	mov	DWORD PTR 64[rsp], ecx
	mov	ecx, DWORD PTR 72[rbp]
	mov	DWORD PTR 56[rsp], ecx
	mov	rcx, QWORD PTR 64[rbp]
	mov	QWORD PTR 48[rsp], rcx
	mov	rcx, QWORD PTR 56[rbp]
	mov	QWORD PTR 40[rsp], rcx
	mov	ecx, DWORD PTR 48[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_text
	mov	edx, DWORD PTR -4[rbp]
	mov	rax, QWORD PTR 16[rbp]
	mov	rcx, rax
	call	draw_set_color
	nop
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	keyboard_check
	.def	keyboard_check;	.scl	2;	.type	32;	.endef
	.seh_proc	keyboard_check
keyboard_check:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	eax, DWORD PTR glob_vk_down[rip]
	pop	rbp
	ret
	.seh_endproc
	.globl	keyboard_check_pressed
	.def	keyboard_check_pressed;	.scl	2;	.type	32;	.endef
	.seh_proc	keyboard_check_pressed
keyboard_check_pressed:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	eax, DWORD PTR glob_vk_down[rip]
	pop	rbp
	ret
	.seh_endproc
	.globl	keyboard_check_released
	.def	keyboard_check_released;	.scl	2;	.type	32;	.endef
	.seh_proc	keyboard_check_released
keyboard_check_released:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	eax, DWORD PTR glob_vk_down[rip]
	pop	rbp
	ret
	.seh_endproc
	.globl	mux_int
	.def	mux_int;	.scl	2;	.type	32;	.endef
	.seh_proc	mux_int
mux_int:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	lea	rax, 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	lea	rdx, 8[rax]
	mov	QWORD PTR -16[rbp], rdx
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR -4[rbp], eax
	mov	DWORD PTR -8[rbp], 0
	jmp	.L46
.L47:
	mov	rax, QWORD PTR -16[rbp]
	lea	rdx, 8[rax]
	mov	QWORD PTR -16[rbp], rdx
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR -4[rbp], eax
	add	DWORD PTR -8[rbp], 1
.L46:
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR 16[rbp]
	jl	.L47
	mov	eax, DWORD PTR -4[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	mux_str
	.def	mux_str;	.scl	2;	.type	32;	.endef
	.seh_proc	mux_str
mux_str:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	lea	rax, 24[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	lea	rdx, 8[rax]
	mov	QWORD PTR -24[rbp], rdx
	mov	eax, DWORD PTR [rax]
	cdqe
	mov	QWORD PTR -8[rbp], rax
	mov	DWORD PTR -12[rbp], 0
	jmp	.L50
.L51:
	mov	rax, QWORD PTR -24[rbp]
	lea	rdx, 8[rax]
	mov	QWORD PTR -24[rbp], rdx
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	add	DWORD PTR -12[rbp], 1
.L50:
	mov	eax, DWORD PTR -12[rbp]
	cmp	eax, DWORD PTR 16[rbp]
	jl	.L51
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.globl	mux_sdltex
	.def	mux_sdltex;	.scl	2;	.type	32;	.endef
	.seh_proc	mux_sdltex
mux_sdltex:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	lea	rax, 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	lea	rdx, 8[rax]
	mov	QWORD PTR -16[rbp], rdx
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR -4[rbp], eax
	mov	DWORD PTR -8[rbp], 0
	jmp	.L54
.L55:
	mov	rax, QWORD PTR -16[rbp]
	lea	rdx, 8[rax]
	mov	QWORD PTR -16[rbp], rdx
	mov	rax, QWORD PTR [rax]
	mov	DWORD PTR -4[rbp], eax
	add	DWORD PTR -8[rbp], 1
.L54:
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR 16[rbp]
	jl	.L55
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	pos_int
	.def	pos_int;	.scl	2;	.type	32;	.endef
	.seh_proc	pos_int
pos_int:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	DWORD PTR 24[rbp], edx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	lea	rax, 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	lea	rdx, 8[rax]
	mov	QWORD PTR -24[rbp], rdx
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR -8[rbp], eax
	mov	DWORD PTR -4[rbp], 0
	mov	DWORD PTR -4[rbp], 0
	jmp	.L58
.L61:
	mov	rax, QWORD PTR -24[rbp]
	lea	rdx, 8[rax]
	mov	QWORD PTR -24[rbp], rdx
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR -12[rbp], eax
	mov	eax, DWORD PTR 24[rbp]
	cmp	eax, DWORD PTR -12[rbp]
	jne	.L59
	mov	eax, DWORD PTR -4[rbp]
	jmp	.L62
.L59:
	add	DWORD PTR -4[rbp], 1
.L58:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR 16[rbp]
	jl	.L61
	mov	eax, -1
.L62:
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.globl	BG
	.def	BG;	.scl	2;	.type	32;	.endef
	.seh_proc	BG
BG:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	DWORD PTR 24[rbp], edx
	mov	eax, DWORD PTR 24[rbp]
	mov	edx, DWORD PTR 16[rbp]
	mov	ecx, eax
	sar	edx, cl
	mov	eax, edx
	and	eax, 1
	pop	rbp
	ret
	.seh_endproc
	.globl	BGG
	.def	BGG;	.scl	2;	.type	32;	.endef
	.seh_proc	BGG
BGG:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	DWORD PTR 24[rbp], edx
	mov	DWORD PTR 32[rbp], r8d
	mov	eax, DWORD PTR 32[rbp]
	imul	eax, DWORD PTR 24[rbp]
	mov	edx, DWORD PTR 16[rbp]
	mov	ecx, eax
	sar	edx, cl
	mov	eax, DWORD PTR 24[rbp]
	mov	r8d, 1
	mov	ecx, eax
	sal	r8d, cl
	mov	eax, r8d
	sub	eax, 1
	and	eax, edx
	pop	rbp
	ret
	.seh_endproc
	.globl	sqr
	.def	sqr;	.scl	2;	.type	32;	.endef
	.seh_proc	sqr
sqr:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	eax, DWORD PTR 16[rbp]
	imul	eax, eax
	pop	rbp
	ret
	.seh_endproc
	.globl	degtorad
	.def	degtorad;	.scl	2;	.type	32;	.endef
	.seh_proc	degtorad
degtorad:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	movsd	QWORD PTR 16[rbp], xmm0
	movsd	xmm0, QWORD PTR 16[rbp]
	movsd	xmm2, QWORD PTR .LC1[rip]
	movapd	xmm1, xmm0
	divsd	xmm1, xmm2
	movsd	xmm0, QWORD PTR .LC2[rip]
	mulsd	xmm0, xmm1
	movq	rax, xmm0
	movq	xmm0, rax
	pop	rbp
	ret
	.seh_endproc
	.globl	radtodeg
	.def	radtodeg;	.scl	2;	.type	32;	.endef
	.seh_proc	radtodeg
radtodeg:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	movsd	QWORD PTR 16[rbp], xmm0
	movsd	xmm0, QWORD PTR 16[rbp]
	movsd	xmm2, QWORD PTR .LC2[rip]
	movapd	xmm1, xmm0
	divsd	xmm1, xmm2
	movsd	xmm0, QWORD PTR .LC1[rip]
	mulsd	xmm0, xmm1
	movq	rax, xmm0
	movq	xmm0, rax
	pop	rbp
	ret
	.seh_endproc
	.globl	dcos
	.def	dcos;	.scl	2;	.type	32;	.endef
	.seh_proc	dcos
dcos:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	movsd	QWORD PTR 16[rbp], xmm0
	mov	rax, QWORD PTR 16[rbp]
	movq	xmm0, rax
	call	degtorad
	movq	rax, xmm0
	movq	xmm0, rax
	call	cos
	movq	rax, xmm0
	movq	xmm0, rax
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.globl	dsin
	.def	dsin;	.scl	2;	.type	32;	.endef
	.seh_proc	dsin
dsin:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	movsd	QWORD PTR 16[rbp], xmm0
	mov	rax, QWORD PTR 16[rbp]
	movq	xmm0, rax
	call	degtorad
	movq	rax, xmm0
	movq	xmm0, rax
	call	sin
	movq	rax, xmm0
	movq	xmm0, rax
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.globl	get_timer
	.def	get_timer;	.scl	2;	.type	32;	.endef
	.seh_proc	get_timer
get_timer:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	call	SDL_GetTicks64
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.globl	point_in_rectangle
	.def	point_in_rectangle;	.scl	2;	.type	32;	.endef
	.seh_proc	point_in_rectangle
point_in_rectangle:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	DWORD PTR 24[rbp], edx
	mov	DWORD PTR 32[rbp], r8d
	mov	DWORD PTR 40[rbp], r9d
	mov	eax, DWORD PTR 16[rbp]
	cmp	eax, DWORD PTR 32[rbp]
	jl	.L80
	mov	eax, DWORD PTR 16[rbp]
	cmp	eax, DWORD PTR 48[rbp]
	jge	.L80
	mov	eax, DWORD PTR 24[rbp]
	cmp	eax, DWORD PTR 40[rbp]
	jl	.L80
	mov	eax, DWORD PTR 24[rbp]
	cmp	eax, DWORD PTR 56[rbp]
	jge	.L80
	mov	eax, 1
	jmp	.L82
.L80:
	mov	eax, 0
.L82:
	pop	rbp
	ret
	.seh_endproc
	.globl	rectangle_in_rectangle
	.def	rectangle_in_rectangle;	.scl	2;	.type	32;	.endef
	.seh_proc	rectangle_in_rectangle
rectangle_in_rectangle:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	DWORD PTR 24[rbp], edx
	mov	DWORD PTR 32[rbp], r8d
	mov	DWORD PTR 40[rbp], r9d
	mov	DWORD PTR -4[rbp], 0
	mov	r9d, DWORD PTR 56[rbp]
	mov	r8d, DWORD PTR 48[rbp]
	mov	edx, DWORD PTR 24[rbp]
	mov	eax, DWORD PTR 16[rbp]
	mov	ecx, DWORD PTR 72[rbp]
	mov	DWORD PTR 40[rsp], ecx
	mov	ecx, DWORD PTR 64[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	ecx, eax
	call	point_in_rectangle
	add	DWORD PTR -4[rbp], eax
	mov	r9d, DWORD PTR 56[rbp]
	mov	r8d, DWORD PTR 48[rbp]
	mov	edx, DWORD PTR 24[rbp]
	mov	eax, DWORD PTR 32[rbp]
	mov	ecx, DWORD PTR 72[rbp]
	mov	DWORD PTR 40[rsp], ecx
	mov	ecx, DWORD PTR 64[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	ecx, eax
	call	point_in_rectangle
	add	DWORD PTR -4[rbp], eax
	mov	r9d, DWORD PTR 56[rbp]
	mov	r8d, DWORD PTR 48[rbp]
	mov	edx, DWORD PTR 40[rbp]
	mov	eax, DWORD PTR 16[rbp]
	mov	ecx, DWORD PTR 72[rbp]
	mov	DWORD PTR 40[rsp], ecx
	mov	ecx, DWORD PTR 64[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	ecx, eax
	call	point_in_rectangle
	add	DWORD PTR -4[rbp], eax
	mov	r9d, DWORD PTR 56[rbp]
	mov	r8d, DWORD PTR 48[rbp]
	mov	edx, DWORD PTR 40[rbp]
	mov	eax, DWORD PTR 32[rbp]
	mov	ecx, DWORD PTR 72[rbp]
	mov	DWORD PTR 40[rsp], ecx
	mov	ecx, DWORD PTR 64[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	ecx, eax
	call	point_in_rectangle
	add	DWORD PTR -4[rbp], eax
	cmp	DWORD PTR -4[rbp], 0
	jne	.L84
	mov	eax, 0
	jmp	.L85
.L84:
	cmp	DWORD PTR -4[rbp], 4
	jne	.L86
	mov	eax, 1
	jmp	.L85
.L86:
	mov	eax, 2
.L85:
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	string_pos
	.def	string_pos;	.scl	2;	.type	32;	.endef
	.seh_proc	string_pos
string_pos:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	movzx	eax, BYTE PTR [rax]
	movsx	rax, al
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	rcx, rax
	call	strlen
	mov	DWORD PTR -20[rbp], eax
	mov	DWORD PTR -24[rbp], 0
	mov	DWORD PTR -4[rbp], 0
	jmp	.L88
.L91:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	mov	rdx, QWORD PTR 24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	rax, al
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	mov	edx, eax
	mov	rax, QWORD PTR -32[rbp]
	cmp	dl, al
	jne	.L89
	mov	eax, DWORD PTR -4[rbp]
	jmp	.L90
.L89:
	add	DWORD PTR -4[rbp], 1
.L88:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -20[rbp]
	jl	.L91
	mov	eax, -1
.L90:
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	darctan2
	.def	darctan2;	.scl	2;	.type	32;	.endef
	.seh_proc	darctan2
darctan2:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	DWORD PTR 24[rbp], edx
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 24[rbp]
	pxor	xmm2, xmm2
	cvtsi2sd	xmm2, DWORD PTR 16[rbp]
	movq	rax, xmm2
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	atan2
	movq	rax, xmm0
	movq	xmm0, rax
	call	radtodeg
	movq	rax, xmm0
	movq	xmm0, rax
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.globl	cartodir
	.def	cartodir;	.scl	2;	.type	32;	.endef
	.seh_proc	cartodir
cartodir:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	DWORD PTR 24[rbp], edx
	mov	edx, DWORD PTR 16[rbp]
	mov	eax, DWORD PTR 24[rbp]
	mov	ecx, eax
	call	darctan2
	movsd	xmm1, QWORD PTR .LC3[rip]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	xmm0, QWORD PTR -8[rbp]
	comisd	xmm0, QWORD PTR .LC3[rip]
	jb	.L95
	movsd	xmm0, QWORD PTR -8[rbp]
	movsd	xmm1, QWORD PTR .LC3[rip]
	subsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
.L95:
	movsd	xmm0, QWORD PTR -8[rbp]
	movq	rax, xmm0
	movq	xmm0, rax
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	game_level_load
	.def	game_level_load;	.scl	2;	.type	32;	.endef
	.seh_proc	game_level_load
game_level_load:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	DWORD PTR 24[rbp], edx
	nop
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC4:
	.ascii "rb\0"
.LC5:
	.ascii "level.dat\0"
	.text
	.globl	level_load
	.def	level_load;	.scl	2;	.type	32;	.endef
	.seh_proc	level_load
level_load:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	DWORD PTR 24[rbp], edx
	mov	DWORD PTR 32[rbp], r8d
	mov	DWORD PTR 40[rbp], r9d
	lea	rax, .LC4[rip]
	mov	rdx, rax
	lea	rax, .LC5[rip]
	mov	rcx, rax
	call	fopen
	mov	QWORD PTR -16[rbp], rax
	mov	DWORD PTR -4[rbp], 0
	jmp	.L101
.L102:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	mov	rdx, QWORD PTR 16[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	add	DWORD PTR -4[rbp], 1
.L101:
	mov	eax, DWORD PTR 24[rbp]
	imul	eax, DWORD PTR 32[rbp]
	imul	eax, DWORD PTR 40[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L102
	mov	eax, DWORD PTR 24[rbp]
	imul	eax, DWORD PTR 32[rbp]
	imul	eax, DWORD PTR 40[rbp]
	cdqe
	mov	rdx, QWORD PTR -16[rbp]
	mov	rcx, QWORD PTR 16[rbp]
	mov	r9, rdx
	mov	r8d, 1
	mov	rdx, rax
	call	fread
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, rax
	call	fclose
	nop
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC6:
	.ascii "may take a while; please wait.\0"
.LC7:
	.ascii "tiled/cosc345-game.tmx\0"
.LC8:
	.ascii "wb\0"
.LC10:
	.ascii "i=%i/%i (v=%i)\12\0"
	.text
	.globl	dev_tiled_to_leveldata
	.def	dev_tiled_to_leveldata;	.scl	2;	.type	32;	.endef
	.seh_proc	dev_tiled_to_leveldata
dev_tiled_to_leveldata:
	push	rbp
	.seh_pushreg	rbp
	push	rbx
	.seh_pushreg	rbx
	mov	eax, 262280
	call	___chkstk_ms
	sub	rsp, rax
	.seh_stackalloc	262280
	lea	rbp, 128[rsp]
	.seh_setframe	rbp, 128
	.seh_endprologue
	mov	QWORD PTR 262176[rbp], rcx
	lea	rax, .LC6[rip]
	mov	rcx, rax
	call	puts
	mov	DWORD PTR glob_vk_f2[rip], 0
	lea	rax, .LC4[rip]
	mov	rdx, rax
	lea	rax, .LC7[rip]
	mov	rcx, rax
	call	fopen
	mov	QWORD PTR 262112[rbp], rax
	lea	rax, .LC8[rip]
	mov	rdx, rax
	lea	rax, .LC5[rip]
	mov	rcx, rax
	call	fopen
	mov	QWORD PTR 262104[rbp], rax
	mov	DWORD PTR 262100[rbp], 2
	mov	DWORD PTR 262096[rbp], 131072
	mov	eax, DWORD PTR 262096[rbp]
	imul	eax, DWORD PTR 262100[rbp]
	mov	DWORD PTR 262092[rbp], eax
	mov	DWORD PTR 262088[rbp], 262144
	mov	DWORD PTR 262140[rbp], 0
	jmp	.L104
.L105:
	mov	eax, DWORD PTR 262140[rbp]
	cdqe
	mov	BYTE PTR -80[rbp+rax], 0
	add	DWORD PTR 262140[rbp], 1
.L104:
	mov	eax, DWORD PTR 262140[rbp]
	cmp	eax, DWORD PTR 262092[rbp]
	jl	.L105
	mov	rax, QWORD PTR 262112[rbp]
	mov	r8d, 0
	mov	edx, 508
	mov	rcx, rax
	call	fseek
	mov	eax, 44
	mov	BYTE PTR 262087[rbp], al
	mov	DWORD PTR 262136[rbp], 0
	mov	DWORD PTR 262080[rbp], 0
	mov	DWORD PTR 262076[rbp], 0
	mov	DWORD PTR 262072[rbp], 0
	mov	DWORD PTR 262128[rbp], 0
	jmp	.L106
.L118:
	mov	rax, QWORD PTR 262112[rbp]
	mov	rcx, rax
	call	fgetc
	mov	DWORD PTR 262136[rbp], eax
	mov	DWORD PTR 262124[rbp], 0
	jmp	.L107
.L108:
	mov	eax, DWORD PTR 262124[rbp]
	cdqe
	mov	BYTE PTR -83[rbp+rax], 48
	add	DWORD PTR 262124[rbp], 1
.L107:
	cmp	DWORD PTR 262124[rbp], 2
	jle	.L108
	jmp	.L109
.L110:
	mov	rax, QWORD PTR 262112[rbp]
	mov	rcx, rax
	call	fgetc
	mov	DWORD PTR 262136[rbp], eax
.L109:
	cmp	DWORD PTR 262136[rbp], 13
	je	.L110
	cmp	DWORD PTR 262136[rbp], 10
	je	.L110
	mov	eax, DWORD PTR 262136[rbp]
	mov	BYTE PTR -81[rbp], al
	mov	rax, QWORD PTR 262112[rbp]
	mov	rcx, rax
	call	fgetc
	mov	DWORD PTR 262136[rbp], eax
	movzx	eax, BYTE PTR 262087[rbp]
	cmp	DWORD PTR 262136[rbp], eax
	je	.L111
	movzx	eax, BYTE PTR -81[rbp]
	mov	BYTE PTR -82[rbp], al
	mov	eax, DWORD PTR 262136[rbp]
	mov	BYTE PTR -81[rbp], al
	mov	rax, QWORD PTR 262112[rbp]
	mov	rcx, rax
	call	fgetc
	mov	DWORD PTR 262136[rbp], eax
	movzx	eax, BYTE PTR 262087[rbp]
	cmp	DWORD PTR 262136[rbp], eax
	je	.L111
	movzx	eax, BYTE PTR -82[rbp]
	mov	BYTE PTR -83[rbp], al
	movzx	eax, BYTE PTR -81[rbp]
	mov	BYTE PTR -82[rbp], al
	mov	eax, DWORD PTR 262136[rbp]
	mov	BYTE PTR -81[rbp], al
	mov	rax, QWORD PTR 262112[rbp]
	mov	rcx, rax
	call	fgetc
.L111:
	mov	WORD PTR 262134[rbp], 0
	mov	DWORD PTR 262120[rbp], 0
	jmp	.L112
.L113:
	mov	eax, DWORD PTR 262120[rbp]
	cdqe
	movzx	eax, BYTE PTR -83[rbp+rax]
	movzx	eax, al
	lea	ebx, -48[rax]
	mov	eax, 2
	sub	eax, DWORD PTR 262120[rbp]
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	mov	rax, QWORD PTR .LC9[rip]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	pow
	cvttsd2si	eax, xmm0
	movzx	eax, al
	imul	eax, ebx
	add	WORD PTR 262134[rbp], ax
	add	DWORD PTR 262120[rbp], 1
.L112:
	cmp	DWORD PTR 262120[rbp], 2
	jle	.L113
	movzx	edx, WORD PTR 262134[rbp]
	mov	ecx, DWORD PTR 262096[rbp]
	mov	eax, DWORD PTR 262128[rbp]
	mov	r9d, edx
	mov	r8d, ecx
	mov	edx, eax
	lea	rax, .LC10[rip]
	mov	rcx, rax
	call	printf
	cmp	WORD PTR 262134[rbp], 0
	jne	.L114
	mov	eax, -255
	jmp	.L115
.L114:
	mov	eax, 1
.L115:
	sub	WORD PTR 262134[rbp], ax
	cmp	WORD PTR 262134[rbp], 255
	jbe	.L116
	mov	edx, 131072
	jmp	.L117
.L116:
	mov	edx, 0
.L117:
	mov	eax, DWORD PTR 262128[rbp]
	sar	eax, 12
	sal	eax, 12
	add	edx, eax
	mov	eax, DWORD PTR 262128[rbp]
	sar	eax, 4
	and	eax, 15
	sal	eax, 8
	add	edx, eax
	mov	eax, DWORD PTR 262128[rbp]
	sar	eax, 8
	and	eax, 15
	sal	eax, 4
	add	edx, eax
	mov	eax, DWORD PTR 262128[rbp]
	and	eax, 15
	add	eax, edx
	movzx	edx, WORD PTR 262134[rbp]
	cdqe
	mov	BYTE PTR -80[rbp+rax], dl
	add	DWORD PTR 262128[rbp], 1
.L106:
	mov	eax, DWORD PTR 262128[rbp]
	cmp	eax, DWORD PTR 262088[rbp]
	jl	.L118
	mov	WORD PTR 262134[rbp], 0
	mov	DWORD PTR 262080[rbp], 0
	mov	DWORD PTR 262068[rbp], 0
	nop
	mov	eax, DWORD PTR 262068[rbp]
	cmp	eax, DWORD PTR 262096[rbp]
	mov	eax, DWORD PTR 262092[rbp]
	movsx	rdx, eax
	mov	rcx, QWORD PTR 262104[rbp]
	lea	rax, -80[rbp]
	mov	r9, rcx
	mov	r8d, 1
	mov	rcx, rax
	call	fwrite
	mov	rax, QWORD PTR 262112[rbp]
	mov	rcx, rax
	call	fclose
	mov	rax, QWORD PTR 262104[rbp]
	mov	rcx, rax
	call	fclose
	mov	rax, QWORD PTR 262176[rbp]
	mov	r9d, 2
	mov	r8d, 512
	mov	edx, 256
	mov	rcx, rax
	call	level_load
	nop
	add	rsp, 262280
	pop	rbx
	pop	rbp
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
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	QWORD PTR 24[rbp], rdx
	lea	rax, .LC4[rip]
	mov	rdx, rax
	lea	rax, .LC11[rip]
	mov	rcx, rax
	call	fopen
	mov	QWORD PTR -16[rbp], rax
	mov	edx, DWORD PTR 16[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8d, 0
	mov	rcx, rax
	call	fseek
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, rax
	call	fgetc
	mov	DWORD PTR -4[rbp], eax
	mov	rax, QWORD PTR -16[rbp]
	mov	r8d, 0
	mov	edx, 256
	mov	rcx, rax
	call	fseek
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 24[rbp]
	mov	r8, rdx
	mov	edx, 16
	mov	rcx, rax
	call	fgets
	jmp	.L123
.L124:
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 24[rbp]
	mov	r8, rdx
	mov	edx, 16
	mov	rcx, rax
	call	fgets
	sub	DWORD PTR -4[rbp], 1
.L123:
	cmp	DWORD PTR -4[rbp], 0
	jg	.L124
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, rax
	call	fclose
	mov	rax, QWORD PTR 24[rbp]
	add	rsp, 48
	pop	rbp
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
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	DWORD PTR 24[rbp], edx
	mov	DWORD PTR 32[rbp], r8d
	call	rand
	mov	edx, eax
	movsx	rax, edx
	imul	rax, rax, 1427937179
	shr	rax, 32
	sar	eax, 8
	mov	ecx, edx
	sar	ecx, 31
	sub	eax, ecx
	imul	ecx, eax, 770
	mov	eax, edx
	sub	eax, ecx
	lea	ecx, 298[rax]
	mov	rdx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 16[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	pxor	xmm0, xmm0
	cvtsi2ss	xmm0, ecx
	movss	DWORD PTR [rax], xmm0
	call	rand
	cdq
	idiv	DWORD PTR 32[rbp]
	mov	eax, edx
	neg	eax
	mov	ecx, eax
	mov	rdx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 16[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	pxor	xmm0, xmm0
	cvtsi2ss	xmm0, ecx
	movss	DWORD PTR 4[rax], xmm0
	mov	rdx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 16[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	movss	xmm0, DWORD PTR .LC12[rip]
	movss	DWORD PTR 8[rax], xmm0
	mov	rdx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 16[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	mov	DWORD PTR 12[rax], 1
	nop
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.globl	activateAllWaterParticles
	.def	activateAllWaterParticles;	.scl	2;	.type	32;	.endef
	.seh_proc	activateAllWaterParticles
activateAllWaterParticles:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	DWORD PTR -4[rbp], 0
	jmp	.L128
.L129:
	mov	rdx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	mov	DWORD PTR 12[rax], 1
	add	DWORD PTR -4[rbp], 1
.L128:
	mov	eax, 100
	cmp	DWORD PTR -4[rbp], eax
	jl	.L129
	nop
	nop
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	deactivateAllWaterParticles
	.def	deactivateAllWaterParticles;	.scl	2;	.type	32;	.endef
	.seh_proc	deactivateAllWaterParticles
deactivateAllWaterParticles:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	DWORD PTR -4[rbp], 0
	jmp	.L131
.L132:
	mov	rdx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	mov	DWORD PTR 12[rax], 0
	add	DWORD PTR -4[rbp], 1
.L131:
	mov	eax, 100
	cmp	DWORD PTR -4[rbp], eax
	jl	.L132
	nop
	nop
	add	rsp, 16
	pop	rbp
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
	.globl	playerHitbox
	.bss
	.align 16
playerHitbox:
	.space 16
	.text
	.globl	updatePlayerHitbox
	.def	updatePlayerHitbox;	.scl	2;	.type	32;	.endef
	.seh_proc	updatePlayerHitbox
updatePlayerHitbox:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	DWORD PTR 24[rbp], edx
	mov	DWORD PTR 32[rbp], r8d
	mov	DWORD PTR 40[rbp], r9d
	mov	eax, DWORD PTR 16[rbp]
	mov	DWORD PTR playerHitbox[rip], eax
	mov	eax, DWORD PTR 24[rbp]
	mov	DWORD PTR playerHitbox[rip+4], eax
	mov	eax, DWORD PTR 32[rbp]
	mov	DWORD PTR playerHitbox[rip+8], eax
	mov	eax, DWORD PTR 40[rbp]
	mov	DWORD PTR playerHitbox[rip+12], eax
	nop
	pop	rbp
	ret
	.seh_endproc
	.globl	damageMe
	.def	damageMe;	.scl	2;	.type	32;	.endef
	.seh_proc	damageMe
damageMe:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	eax, DWORD PTR health[rip]
	sub	eax, DWORD PTR 16[rbp]
	test	eax, eax
	jg	.L135
	mov	DWORD PTR health[rip], 0
	jmp	.L137
.L135:
	mov	eax, DWORD PTR health[rip]
	sub	eax, DWORD PTR 16[rbp]
	mov	DWORD PTR health[rip], eax
.L137:
	nop
	pop	rbp
	ret
	.seh_endproc
	.globl	healMe
	.def	healMe;	.scl	2;	.type	32;	.endef
	.seh_proc	healMe
healMe:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	edx, DWORD PTR health[rip]
	mov	eax, DWORD PTR 16[rbp]
	add	edx, eax
	mov	eax, DWORD PTR maxHealth[rip]
	cmp	edx, eax
	jl	.L139
	mov	DWORD PTR health[rip], 100
	jmp	.L141
.L139:
	mov	edx, DWORD PTR health[rip]
	mov	eax, DWORD PTR 16[rbp]
	add	eax, edx
	mov	DWORD PTR health[rip], eax
.L141:
	nop
	pop	rbp
	ret
	.seh_endproc
	.globl	initEnemy
	.def	initEnemy;	.scl	2;	.type	32;	.endef
	.seh_proc	initEnemy
initEnemy:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	DWORD PTR 24[rbp], edx
	mov	DWORD PTR 32[rbp], r8d
	mov	DWORD PTR 40[rbp], r9d
	mov	rax, QWORD PTR 16[rbp]
	mov	edx, DWORD PTR 24[rbp]
	mov	DWORD PTR [rax], edx
	mov	rax, QWORD PTR 16[rbp]
	mov	edx, DWORD PTR 32[rbp]
	mov	DWORD PTR 4[rax], edx
	mov	rax, QWORD PTR 16[rbp]
	mov	edx, DWORD PTR 40[rbp]
	mov	DWORD PTR 8[rax], edx
	mov	rax, QWORD PTR 16[rbp]
	mov	edx, DWORD PTR 48[rbp]
	mov	DWORD PTR 12[rax], edx
	mov	rax, QWORD PTR 16[rbp]
	mov	edx, DWORD PTR 56[rbp]
	mov	DWORD PTR 16[rax], edx
	mov	rax, QWORD PTR 16[rbp]
	mov	edx, DWORD PTR 64[rbp]
	mov	DWORD PTR 20[rax], edx
	mov	rax, QWORD PTR 16[rbp]
	mov	rdx, QWORD PTR 72[rbp]
	mov	QWORD PTR 24[rax], rdx
	nop
	pop	rbp
	ret
	.seh_endproc
	.globl	resetEnemy
	.def	resetEnemy;	.scl	2;	.type	32;	.endef
	.seh_proc	resetEnemy
resetEnemy:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	mov	DWORD PTR [rax], 0
	mov	rax, QWORD PTR 16[rbp]
	mov	DWORD PTR 4[rax], 0
	mov	rax, QWORD PTR 16[rbp]
	mov	DWORD PTR 8[rax], 0
	mov	rax, QWORD PTR 16[rbp]
	mov	DWORD PTR 12[rax], 0
	mov	rax, QWORD PTR 16[rbp]
	mov	DWORD PTR 16[rax], 0
	mov	rax, QWORD PTR 16[rbp]
	mov	DWORD PTR 20[rax], 0
	nop
	pop	rbp
	ret
	.seh_endproc
	.globl	enemies
	.bss
	.align 32
enemies:
	.space 8000
	.text
	.globl	addEnemy
	.def	addEnemy;	.scl	2;	.type	32;	.endef
	.seh_proc	addEnemy
addEnemy:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	DWORD PTR 24[rbp], edx
	mov	DWORD PTR 32[rbp], r8d
	mov	DWORD PTR 40[rbp], r9d
	mov	DWORD PTR -4[rbp], 0
	jmp	.L145
.L148:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	sal	rax, 5
	mov	rdx, rax
	lea	rax, enemies[rip]
	add	rax, rdx
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	mov	eax, DWORD PTR 16[rax]
	test	eax, eax
	jg	.L146
	mov	r9d, DWORD PTR 32[rbp]
	mov	r8d, DWORD PTR 24[rbp]
	mov	edx, DWORD PTR 16[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, QWORD PTR 64[rbp]
	mov	QWORD PTR 56[rsp], rcx
	mov	ecx, DWORD PTR 56[rbp]
	mov	DWORD PTR 48[rsp], ecx
	mov	ecx, DWORD PTR 48[rbp]
	mov	DWORD PTR 40[rsp], ecx
	mov	ecx, DWORD PTR 40[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	initEnemy
	jmp	.L144
.L146:
	add	DWORD PTR -4[rbp], 1
.L145:
	cmp	DWORD PTR -4[rbp], 249
	jle	.L148
.L144:
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	randomSpawnEnemy
	.def	randomSpawnEnemy;	.scl	2;	.type	32;	.endef
	.seh_proc	randomSpawnEnemy
randomSpawnEnemy:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	DWORD PTR 24[rbp], edx
	mov	DWORD PTR 32[rbp], r8d
	mov	DWORD PTR 40[rbp], r9d
	mov	DWORD PTR -4[rbp], 50
	mov	ecx, 0
	call	time
	mov	ecx, eax
	call	srand
	call	rand
	movsx	rdx, eax
	imul	rdx, rdx, 1374389535
	shr	rdx, 32
	sar	edx, 5
	mov	ecx, eax
	sar	ecx, 31
	sub	edx, ecx
	mov	DWORD PTR -8[rbp], edx
	mov	edx, DWORD PTR -8[rbp]
	imul	edx, edx, 100
	sub	eax, edx
	mov	DWORD PTR -8[rbp], eax
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR -4[rbp]
	jge	.L151
	mov	r9d, DWORD PTR 40[rbp]
	mov	r8d, DWORD PTR 32[rbp]
	mov	edx, DWORD PTR 24[rbp]
	mov	eax, DWORD PTR 16[rbp]
	mov	rcx, QWORD PTR 64[rbp]
	mov	QWORD PTR 48[rsp], rcx
	mov	ecx, DWORD PTR 56[rbp]
	mov	DWORD PTR 40[rsp], ecx
	mov	ecx, DWORD PTR 48[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	ecx, eax
	call	addEnemy
.L151:
	nop
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	distance
	.def	distance;	.scl	2;	.type	32;	.endef
	.seh_proc	distance
distance:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	movss	DWORD PTR 16[rbp], xmm0
	movss	DWORD PTR 24[rbp], xmm1
	movss	DWORD PTR 32[rbp], xmm2
	movss	DWORD PTR 40[rbp], xmm3
	movss	xmm0, DWORD PTR 32[rbp]
	subss	xmm0, DWORD PTR 16[rbp]
	movss	DWORD PTR -4[rbp], xmm0
	movss	xmm0, DWORD PTR 40[rbp]
	subss	xmm0, DWORD PTR 24[rbp]
	movss	DWORD PTR -8[rbp], xmm0
	movss	xmm0, DWORD PTR -4[rbp]
	movaps	xmm1, xmm0
	mulss	xmm1, xmm0
	movss	xmm0, DWORD PTR -8[rbp]
	mulss	xmm0, xmm0
	addss	xmm0, xmm1
	pxor	xmm4, xmm4
	cvtss2sd	xmm4, xmm0
	movq	rax, xmm4
	movq	xmm0, rax
	call	sqrt
	cvtsd2ss	xmm0, xmm0
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	checkCollision
	.def	checkCollision;	.scl	2;	.type	32;	.endef
	.seh_proc	checkCollision
checkCollision:
	push	rbp
	.seh_pushreg	rbp
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 40
	.seh_stackalloc	40
	lea	rbp, 32[rsp]
	.seh_setframe	rbp, 32
	.seh_endprologue
	mov	rbx, rcx
	mov	rcx, QWORD PTR [rbx]
	mov	rbx, QWORD PTR 8[rbx]
	mov	QWORD PTR -16[rbp], rcx
	mov	QWORD PTR -8[rbp], rbx
	mov	rbx, rdx
	mov	rax, QWORD PTR [rbx]
	mov	rdx, QWORD PTR 8[rbx]
	mov	QWORD PTR -32[rbp], rax
	mov	QWORD PTR -24[rbp], rdx
	mov	edx, DWORD PTR -16[rbp]
	mov	ecx, DWORD PTR -32[rbp]
	mov	eax, DWORD PTR -24[rbp]
	add	eax, ecx
	cmp	edx, eax
	jge	.L155
	mov	edx, DWORD PTR -16[rbp]
	mov	eax, DWORD PTR -8[rbp]
	add	edx, eax
	mov	eax, DWORD PTR -32[rbp]
	cmp	edx, eax
	jle	.L155
	mov	edx, DWORD PTR -12[rbp]
	mov	ecx, DWORD PTR -28[rbp]
	mov	eax, DWORD PTR -20[rbp]
	add	eax, ecx
	cmp	edx, eax
	jge	.L155
	mov	edx, DWORD PTR -12[rbp]
	mov	eax, DWORD PTR -4[rbp]
	add	edx, eax
	mov	eax, DWORD PTR -28[rbp]
	cmp	edx, eax
	jg	.L156
.L155:
	mov	edx, DWORD PTR -32[rbp]
	mov	ecx, DWORD PTR -16[rbp]
	mov	eax, DWORD PTR -8[rbp]
	add	eax, ecx
	cmp	edx, eax
	jge	.L157
	mov	edx, DWORD PTR -32[rbp]
	mov	eax, DWORD PTR -24[rbp]
	add	edx, eax
	mov	eax, DWORD PTR -16[rbp]
	cmp	edx, eax
	jle	.L157
	mov	edx, DWORD PTR -28[rbp]
	mov	ecx, DWORD PTR -12[rbp]
	mov	eax, DWORD PTR -4[rbp]
	add	eax, ecx
	cmp	edx, eax
	jge	.L157
	mov	edx, DWORD PTR -28[rbp]
	mov	eax, DWORD PTR -20[rbp]
	add	edx, eax
	mov	eax, DWORD PTR -12[rbp]
	cmp	edx, eax
	jle	.L157
.L156:
	mov	eax, 1
	jmp	.L159
.L157:
	mov	eax, 0
.L159:
	add	rsp, 40
	pop	rbx
	pop	rbp
	ret
	.seh_endproc
	.globl	calculateAttackHitbox
	.def	calculateAttackHitbox;	.scl	2;	.type	32;	.endef
	.seh_proc	calculateAttackHitbox
calculateAttackHitbox:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR -4[rbp], eax
	mov	rax, QWORD PTR 16[rbp]
	mov	eax, DWORD PTR 4[rax]
	mov	DWORD PTR -8[rbp], eax
	mov	rax, QWORD PTR 16[rbp]
	movzx	eax, BYTE PTR 16[rax]
	cmp	al, 1
	jne	.L161
	mov	rax, QWORD PTR 16[rbp]
	mov	eax, DWORD PTR 32[rax]
	sub	DWORD PTR -8[rbp], eax
	jmp	.L162
.L161:
	mov	rax, QWORD PTR 16[rbp]
	movzx	eax, BYTE PTR 16[rax]
	test	al, al
	jne	.L163
	mov	rax, QWORD PTR 16[rbp]
	mov	eax, DWORD PTR 28[rax]
	add	DWORD PTR -4[rbp], eax
	jmp	.L162
.L163:
	mov	rax, QWORD PTR 16[rbp]
	movzx	eax, BYTE PTR 16[rax]
	cmp	al, 3
	jne	.L164
	mov	rax, QWORD PTR 16[rbp]
	mov	eax, DWORD PTR 32[rax]
	add	DWORD PTR -8[rbp], eax
	jmp	.L162
.L164:
	mov	rax, QWORD PTR 16[rbp]
	movzx	eax, BYTE PTR 16[rax]
	cmp	al, 2
	jne	.L162
	mov	rax, QWORD PTR 16[rbp]
	mov	eax, DWORD PTR 28[rax]
	sub	DWORD PTR -4[rbp], eax
.L162:
	mov	rax, QWORD PTR 24[rbp]
	mov	edx, DWORD PTR -4[rbp]
	mov	DWORD PTR [rax], edx
	mov	rax, QWORD PTR 24[rbp]
	mov	edx, DWORD PTR -8[rbp]
	mov	DWORD PTR 4[rax], edx
	mov	rax, QWORD PTR 16[rbp]
	mov	edx, DWORD PTR 28[rax]
	mov	rax, QWORD PTR 24[rbp]
	mov	DWORD PTR 8[rax], edx
	mov	rax, QWORD PTR 16[rbp]
	mov	edx, DWORD PTR 32[rax]
	mov	rax, QWORD PTR 24[rbp]
	mov	DWORD PTR 12[rax], edx
	nop
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	globalEnemy
	.bss
	.align 8
globalEnemy:
	.space 8
	.section .rdata,"dr"
.LC13:
	.ascii "Hit enemy!\0"
	.text
	.globl	attack
	.def	attack;	.scl	2;	.type	32;	.endef
	.seh_proc	attack
attack:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	DWORD PTR -4[rbp], 0
	jmp	.L166
.L169:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	sal	rax, 5
	mov	rdx, rax
	lea	rax, enemies[rip]
	add	rax, rdx
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	mov	eax, DWORD PTR 16[rax]
	test	eax, eax
	jle	.L167
	lea	rax, -32[rbp]
	mov	rcx, QWORD PTR 16[rbp]
	mov	rdx, rax
	call	calculateAttackHitbox
	mov	rax, QWORD PTR -16[rbp]
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR -48[rbp], eax
	mov	rax, QWORD PTR -16[rbp]
	mov	eax, DWORD PTR 4[rax]
	mov	DWORD PTR -44[rbp], eax
	mov	rax, QWORD PTR -16[rbp]
	mov	eax, DWORD PTR 8[rax]
	mov	DWORD PTR -40[rbp], eax
	mov	rax, QWORD PTR -16[rbp]
	mov	eax, DWORD PTR 12[rax]
	mov	DWORD PTR -36[rbp], eax
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	QWORD PTR -64[rbp], rax
	mov	QWORD PTR -56[rbp], rdx
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, QWORD PTR -40[rbp]
	mov	QWORD PTR -80[rbp], rax
	mov	QWORD PTR -72[rbp], rdx
	lea	rdx, -80[rbp]
	lea	rax, -64[rbp]
	mov	rcx, rax
	call	checkCollision
	test	eax, eax
	je	.L167
	lea	rax, .LC13[rip]
	mov	rcx, rax
	call	puts
	mov	rax, QWORD PTR -16[rbp]
	mov	edx, DWORD PTR 16[rax]
	mov	rax, QWORD PTR 16[rbp]
	mov	eax, DWORD PTR 24[rax]
	sub	edx, eax
	mov	rax, QWORD PTR -16[rbp]
	mov	DWORD PTR 16[rax], edx
.L167:
	add	DWORD PTR -4[rbp], 1
.L166:
	cmp	DWORD PTR -4[rbp], 249
	jle	.L169
	nop
	nop
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	renderWeaponSwing
	.def	renderWeaponSwing;	.scl	2;	.type	32;	.endef
	.seh_proc	renderWeaponSwing
renderWeaponSwing:
	push	rbp
	.seh_pushreg	rbp
	sub	rsp, 144
	.seh_stackalloc	144
	lea	rbp, 128[rsp]
	.seh_setframe	rbp, 128
	movaps	XMMWORD PTR 0[rbp], xmm6
	.seh_savexmm	xmm6, 128
	.seh_endprologue
	mov	QWORD PTR 32[rbp], rcx
	mov	QWORD PTR 40[rbp], rdx
	mov	QWORD PTR 48[rbp], r8
	movss	xmm0, DWORD PTR .LC14[rip]
	movss	DWORD PTR -12[rbp], xmm0
	pxor	xmm0, xmm0
	movss	DWORD PTR -4[rbp], xmm0
	mov	rax, QWORD PTR 48[rbp]
	movzx	eax, BYTE PTR 16[rax]
	test	al, al
	jne	.L171
	pxor	xmm0, xmm0
	movss	DWORD PTR -4[rbp], xmm0
	jmp	.L172
.L171:
	mov	rax, QWORD PTR 48[rbp]
	movzx	eax, BYTE PTR 16[rax]
	cmp	al, 1
	jne	.L173
	movss	xmm0, DWORD PTR .LC16[rip]
	movss	DWORD PTR -4[rbp], xmm0
	jmp	.L172
.L173:
	mov	rax, QWORD PTR 48[rbp]
	movzx	eax, BYTE PTR 16[rax]
	cmp	al, 2
	jne	.L174
	movss	xmm0, DWORD PTR .LC17[rip]
	movss	DWORD PTR -4[rbp], xmm0
	jmp	.L172
.L174:
	mov	rax, QWORD PTR 48[rbp]
	movzx	eax, BYTE PTR 16[rax]
	cmp	al, 3
	jne	.L172
	movss	xmm0, DWORD PTR .LC18[rip]
	movss	DWORD PTR -4[rbp], xmm0
.L172:
	lea	rcx, -44[rbp]
	mov	rax, QWORD PTR 40[rbp]
	lea	rdx, -48[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	r9, rcx
	mov	r8d, 0
	mov	edx, 0
	mov	rcx, rax
	call	SDL_QueryTexture
	mov	eax, DWORD PTR -44[rbp]
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	mov	DWORD PTR -44[rbp], eax
	mov	eax, DWORD PTR -48[rbp]
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	mov	DWORD PTR -48[rbp], eax
	movss	xmm0, DWORD PTR .LC19[rip]
	movss	DWORD PTR -16[rbp], xmm0
	mov	DWORD PTR -20[rbp], 20
	mov	DWORD PTR -8[rbp], 0
	jmp	.L175
.L177:
	pxor	xmm0, xmm0
	cvtsi2ss	xmm0, DWORD PTR -8[rbp]
	mulss	xmm0, DWORD PTR -12[rbp]
	movss	xmm1, DWORD PTR -4[rbp]
	addss	xmm0, xmm1
	movss	DWORD PTR -24[rbp], xmm0
	pxor	xmm6, xmm6
	cvtsi2ss	xmm6, DWORD PTR -20[rbp]
	pxor	xmm1, xmm1
	cvtss2sd	xmm1, DWORD PTR -24[rbp]
	movsd	xmm0, QWORD PTR .LC2[rip]
	mulsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC1[rip]
	divsd	xmm0, xmm1
	pxor	xmm2, xmm2
	cvtsd2ss	xmm2, xmm0
	movd	eax, xmm2
	movd	xmm0, eax
	call	cosf
	mulss	xmm0, xmm6
	cvttss2si	eax, xmm0
	mov	DWORD PTR -28[rbp], eax
	pxor	xmm6, xmm6
	cvtsi2ss	xmm6, DWORD PTR -20[rbp]
	pxor	xmm1, xmm1
	cvtss2sd	xmm1, DWORD PTR -24[rbp]
	movsd	xmm0, QWORD PTR .LC2[rip]
	mulsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC1[rip]
	divsd	xmm0, xmm1
	pxor	xmm3, xmm3
	cvtsd2ss	xmm3, xmm0
	movd	eax, xmm3
	movd	xmm0, eax
	call	sinf
	mulss	xmm0, xmm6
	cvttss2si	eax, xmm0
	mov	DWORD PTR -32[rbp], eax
	mov	eax, DWORD PTR -44[rbp]
	add	eax, eax
	pxor	xmm0, xmm0
	cvtsi2ss	xmm0, eax
	mulss	xmm0, DWORD PTR -16[rbp]
	cvttss2si	eax, xmm0
	mov	DWORD PTR -36[rbp], eax
	mov	eax, DWORD PTR -48[rbp]
	add	eax, eax
	pxor	xmm0, xmm0
	cvtsi2ss	xmm0, eax
	mulss	xmm0, DWORD PTR -16[rbp]
	cvttss2si	eax, xmm0
	mov	DWORD PTR -40[rbp], eax
	mov	eax, DWORD PTR -36[rbp]
	mov	DWORD PTR -56[rbp], eax
	mov	eax, DWORD PTR -40[rbp]
	mov	DWORD PTR -52[rbp], eax
	mov	rax, QWORD PTR 48[rbp]
	mov	edx, DWORD PTR [rax]
	mov	eax, DWORD PTR -44[rbp]
	sub	edx, eax
	mov	eax, DWORD PTR -28[rbp]
	add	eax, edx
	add	eax, 120
	mov	DWORD PTR -64[rbp], eax
	mov	rax, QWORD PTR 48[rbp]
	movzx	eax, BYTE PTR 16[rax]
	test	al, al
	jne	.L176
	mov	eax, DWORD PTR -64[rbp]
	add	eax, 20
	mov	DWORD PTR -64[rbp], eax
	mov	eax, DWORD PTR -60[rbp]
	add	eax, 5
	mov	DWORD PTR -60[rbp], eax
.L176:
	mov	rax, QWORD PTR 48[rbp]
	mov	edx, DWORD PTR 4[rax]
	mov	eax, DWORD PTR -48[rbp]
	sub	edx, eax
	mov	eax, DWORD PTR -32[rbp]
	add	eax, edx
	add	eax, 40
	mov	DWORD PTR -60[rbp], eax
	pxor	xmm0, xmm0
	cvtss2sd	xmm0, DWORD PTR -24[rbp]
	lea	rcx, -64[rbp]
	mov	rdx, QWORD PTR 40[rbp]
	mov	rax, QWORD PTR 32[rbp]
	mov	DWORD PTR 48[rsp], 0
	mov	QWORD PTR 40[rsp], 0
	movsd	QWORD PTR 32[rsp], xmm0
	mov	r9, rcx
	mov	r8d, 0
	mov	rcx, rax
	call	SDL_RenderCopyEx
	mov	rax, QWORD PTR 32[rbp]
	mov	rcx, rax
	call	SDL_RenderPresent
	mov	ecx, 10
	call	SDL_Delay
	add	DWORD PTR -8[rbp], 1
.L175:
	cmp	DWORD PTR -8[rbp], 7
	jle	.L177
	nop
	nop
	movaps	xmm6, XMMWORD PTR 0[rbp]
	add	rsp, 144
	pop	rbp
	ret
	.seh_endproc
	.globl	audioCallback
	.def	audioCallback;	.scl	2;	.type	32;	.endef
	.seh_proc	audioCallback
audioCallback:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	DWORD PTR 32[rbp], r8d
	mov	rax, QWORD PTR 16[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	edx, DWORD PTR 12[rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 8[rax]
	cmp	edx, eax
	jb	.L179
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR 12[rax], 0
.L179:
	mov	rax, QWORD PTR -8[rbp]
	mov	ecx, DWORD PTR 8[rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	edx, DWORD PTR 12[rax]
	mov	eax, ecx
	sub	eax, edx
	mov	DWORD PTR -12[rbp], eax
	mov	eax, DWORD PTR 32[rbp]
	mov	edx, DWORD PTR -12[rbp]
	cmp	edx, eax
	cmovbe	eax, edx
	mov	DWORD PTR -16[rbp], eax
	mov	ecx, DWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 12[rax]
	mov	eax, eax
	add	rdx, rax
	mov	rax, QWORD PTR 24[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	SDL_memcpy
	mov	rax, QWORD PTR -8[rbp]
	mov	edx, DWORD PTR 12[rax]
	mov	eax, DWORD PTR -16[rbp]
	add	edx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR 12[rax], edx
	nop
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	play_WAV
	.def	play_WAV;	.scl	2;	.type	32;	.endef
	.seh_proc	play_WAV
play_WAV:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 32[rbp], r8
	mov	DWORD PTR 40[rbp], r9d
	nop
	pop	rbp
	ret
	.seh_endproc
	.globl	clock_get_hour
	.def	clock_get_hour;	.scl	2;	.type	32;	.endef
	.seh_proc	clock_get_hour
clock_get_hour:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	eax, DWORD PTR 16[rbp]
	movsx	rdx, eax
	imul	rdx, rdx, -2004318071
	shr	rdx, 32
	add	edx, eax
	sar	edx, 5
	sar	eax, 31
	mov	ecx, edx
	sub	ecx, eax
	movsx	rax, ecx
	imul	rax, rax, 715827883
	shr	rax, 32
	mov	edx, eax
	sar	edx, 2
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	add	eax, eax
	add	eax, edx
	sal	eax, 3
	sub	ecx, eax
	mov	edx, ecx
	mov	eax, edx
	pop	rbp
	ret
	.seh_endproc
	.globl	clock_get_minute
	.def	clock_get_minute;	.scl	2;	.type	32;	.endef
	.seh_proc	clock_get_minute
clock_get_minute:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	eax, DWORD PTR 16[rbp]
	movsx	rdx, eax
	imul	rdx, rdx, -2004318071
	shr	rdx, 32
	add	edx, eax
	sar	edx, 5
	mov	ecx, eax
	sar	ecx, 31
	sub	edx, ecx
	imul	ecx, edx, 60
	sub	eax, ecx
	mov	edx, eax
	mov	eax, edx
	pop	rbp
	ret
	.seh_endproc
	.globl	clock_is_between
	.def	clock_is_between;	.scl	2;	.type	32;	.endef
	.seh_proc	clock_is_between
clock_is_between:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	DWORD PTR 24[rbp], edx
	mov	DWORD PTR 32[rbp], r8d
	mov	DWORD PTR 40[rbp], r9d
	mov	ecx, DWORD PTR 24[rbp]
	movsx	rax, ecx
	imul	rax, rax, 715827883
	shr	rax, 32
	mov	edx, eax
	sar	edx, 2
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	add	eax, eax
	add	eax, edx
	sal	eax, 3
	sub	ecx, eax
	mov	edx, ecx
	imul	r8d, edx, 60
	mov	eax, DWORD PTR 32[rbp]
	movsx	rdx, eax
	imul	rdx, rdx, -2004318071
	shr	rdx, 32
	add	edx, eax
	sar	edx, 5
	mov	ecx, eax
	sar	ecx, 31
	sub	edx, ecx
	imul	ecx, edx, 60
	sub	eax, ecx
	mov	edx, eax
	lea	eax, [r8+rdx]
	mov	DWORD PTR -4[rbp], eax
	mov	ecx, DWORD PTR 40[rbp]
	movsx	rax, ecx
	imul	rax, rax, 715827883
	shr	rax, 32
	mov	edx, eax
	sar	edx, 2
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	add	eax, eax
	add	eax, edx
	sal	eax, 3
	sub	ecx, eax
	mov	edx, ecx
	imul	r8d, edx, 60
	mov	eax, DWORD PTR 48[rbp]
	movsx	rdx, eax
	imul	rdx, rdx, -2004318071
	shr	rdx, 32
	add	edx, eax
	sar	edx, 5
	mov	ecx, eax
	sar	ecx, 31
	sub	edx, ecx
	imul	ecx, edx, 60
	sub	eax, ecx
	mov	edx, eax
	lea	eax, [r8+rdx]
	mov	DWORD PTR -8[rbp], eax
	mov	eax, DWORD PTR 16[rbp]
	cmp	eax, DWORD PTR -4[rbp]
	jl	.L186
	mov	eax, DWORD PTR 16[rbp]
	cmp	eax, DWORD PTR -8[rbp]
	jg	.L186
	mov	eax, 1
	jmp	.L188
.L186:
	mov	eax, 0
.L188:
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	temp_ctof
	.def	temp_ctof;	.scl	2;	.type	32;	.endef
	.seh_proc	temp_ctof
temp_ctof:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, DWORD PTR 16[rbp]
	movsd	xmm0, QWORD PTR .LC20[rip]
	mulsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC21[rip]
	addsd	xmm0, xmm1
	movq	rax, xmm0
	movq	xmm0, rax
	pop	rbp
	ret
	.seh_endproc
	.globl	quizHeader
	.section .rdata,"dr"
.LC22:
	.ascii "INSERT NAME HERE\0"
	.data
	.align 8
quizHeader:
	.quad	.LC22
	.globl	quizInfo
	.section .rdata,"dr"
.LC23:
	.ascii "\0"
	.data
	.align 8
quizInfo:
	.quad	.LC23
	.globl	quizInfoHolder
	.align 8
quizInfoHolder:
	.quad	.LC23
	.globl	quizQuestion
	.section .rdata,"dr"
	.align 8
.LC24:
	.ascii "What is the capital of France?\0"
	.data
	.align 8
quizQuestion:
	.quad	.LC24
	.globl	answerA
	.section .rdata,"dr"
.LC25:
	.ascii "A) Paris\0"
	.data
	.align 8
answerA:
	.quad	.LC25
	.globl	answerB
	.section .rdata,"dr"
.LC26:
	.ascii "B) London\0"
	.data
	.align 8
answerB:
	.quad	.LC26
	.globl	answerC
	.section .rdata,"dr"
.LC27:
	.ascii "C) Berlin\0"
	.data
	.align 8
answerC:
	.quad	.LC27
	.globl	correctAnswer
	.bss
	.align 4
correctAnswer:
	.space 4
	.globl	userAnswer
	.align 4
userAnswer:
	.space 4
	.globl	quizOn
quizOn:
	.space 1
	.globl	quizQNum
	.data
	.align 4
quizQNum:
	.long	1
	.globl	quiz2Called
	.bss
quiz2Called:
	.space 1
	.globl	quiz3Called
quiz3Called:
	.space 1
	.globl	quizLoopOn
quizLoopOn:
	.space 1
	.globl	usedQuestions
	.align 32
usedQuestions:
	.space 400
	.globl	usedQuestionCount
	.align 4
usedQuestionCount:
	.space 4
	.text
	.globl	isQuestionUsed
	.def	isQuestionUsed;	.scl	2;	.type	32;	.endef
	.seh_proc	isQuestionUsed
isQuestionUsed:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	DWORD PTR -4[rbp], 0
	jmp	.L192
.L195:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, usedQuestions[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cmp	DWORD PTR 16[rbp], eax
	jne	.L193
	mov	eax, 1
	jmp	.L194
.L193:
	add	DWORD PTR -4[rbp], 1
.L192:
	mov	eax, DWORD PTR usedQuestionCount[rip]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L195
	mov	eax, 0
.L194:
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC28:
	.ascii "r\0"
.LC29:
	.ascii "Error opening the file.\0"
.LC30:
	.ascii ";\0"
.LC31:
	.ascii "%[^=]=%[^\12]\0"
.LC32:
	.ascii "quizQuestion\0"
.LC33:
	.ascii "answerA\0"
.LC34:
	.ascii "answerB\0"
.LC35:
	.ascii "answerC\0"
.LC36:
	.ascii "userAnswer\0"
.LC37:
	.ascii "correctAnswer\0"
.LC38:
	.ascii "quizInfoHolder\0"
	.text
	.globl	updateQuizDataFromRandomLine
	.def	updateQuizDataFromRandomLine;	.scl	2;	.type	32;	.endef
	.seh_proc	updateQuizDataFromRandomLine
updateQuizDataFromRandomLine:
	push	rbp
	.seh_pushreg	rbp
	sub	rsp, 2128
	.seh_stackalloc	2128
	lea	rbp, 128[rsp]
	.seh_setframe	rbp, 128
	.seh_endprologue
	mov	QWORD PTR 2016[rbp], rcx
	mov	QWORD PTR 2024[rbp], rdx
	mov	QWORD PTR 2032[rbp], r8
	mov	QWORD PTR 2040[rbp], r9
	mov	rax, QWORD PTR 2016[rbp]
	lea	rdx, .LC28[rip]
	mov	rcx, rax
	call	fopen
	mov	QWORD PTR 1976[rbp], rax
	cmp	QWORD PTR 1976[rbp], 0
	jne	.L197
	lea	rax, .LC29[rip]
	mov	rcx, rax
	call	puts
	jmp	.L196
.L197:
	mov	DWORD PTR 1996[rbp], 0
	jmp	.L199
.L200:
	cmp	BYTE PTR 1975[rbp], 10
	jne	.L199
	add	DWORD PTR 1996[rbp], 1
.L199:
	mov	rax, QWORD PTR 1976[rbp]
	mov	rcx, rax
	call	fgetc
	mov	BYTE PTR 1975[rbp], al
	cmp	BYTE PTR 1975[rbp], -1
	jne	.L200
	mov	rax, QWORD PTR 1976[rbp]
	mov	rcx, rax
	call	rewind
	mov	ecx, 0
	call	time
	mov	ecx, eax
	call	srand
.L201:
	call	rand
	cdq
	idiv	DWORD PTR 1996[rbp]
	mov	DWORD PTR 1968[rbp], edx
	mov	eax, DWORD PTR 1968[rbp]
	mov	ecx, eax
	call	isQuestionUsed
	test	eax, eax
	jne	.L201
	mov	eax, DWORD PTR usedQuestionCount[rip]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, usedQuestions[rip]
	mov	ecx, DWORD PTR 1968[rbp]
	mov	DWORD PTR [rdx+rax], ecx
	mov	eax, DWORD PTR usedQuestionCount[rip]
	add	eax, 1
	mov	DWORD PTR usedQuestionCount[rip], eax
	mov	DWORD PTR 1992[rbp], 0
	jmp	.L202
.L213:
	mov	rdx, QWORD PTR 1976[rbp]
	lea	rax, 928[rbp]
	mov	r8, rdx
	mov	edx, 1024
	mov	rcx, rax
	call	fgets
	test	rax, rax
	je	.L203
	lea	rax, .LC30[rip]
	mov	QWORD PTR 1960[rbp], rax
	mov	rdx, QWORD PTR 1960[rbp]
	lea	rax, 928[rbp]
	mov	rcx, rax
	call	strtok
	mov	QWORD PTR 1984[rbp], rax
	jmp	.L204
.L212:
	lea	rcx, 160[rbp]
	lea	rdx, -96[rbp]
	mov	rax, QWORD PTR 1984[rbp]
	mov	r9, rcx
	mov	r8, rdx
	lea	rdx, .LC31[rip]
	mov	rcx, rax
	call	sscanf
	cmp	eax, 2
	jne	.L205
	lea	rax, -96[rbp]
	lea	rdx, .LC32[rip]
	mov	rcx, rax
	call	strcmp
	test	eax, eax
	jne	.L206
	lea	rax, 160[rbp]
	mov	rcx, rax
	call	strdup
	mov	rdx, rax
	mov	rax, QWORD PTR 2024[rbp]
	mov	QWORD PTR [rax], rdx
	jmp	.L205
.L206:
	lea	rax, -96[rbp]
	lea	rdx, .LC33[rip]
	mov	rcx, rax
	call	strcmp
	test	eax, eax
	jne	.L207
	lea	rax, 160[rbp]
	mov	rcx, rax
	call	strdup
	mov	rdx, rax
	mov	rax, QWORD PTR 2032[rbp]
	mov	QWORD PTR [rax], rdx
	jmp	.L205
.L207:
	lea	rax, -96[rbp]
	lea	rdx, .LC34[rip]
	mov	rcx, rax
	call	strcmp
	test	eax, eax
	jne	.L208
	lea	rax, 160[rbp]
	mov	rcx, rax
	call	strdup
	mov	rdx, rax
	mov	rax, QWORD PTR 2040[rbp]
	mov	QWORD PTR [rax], rdx
	jmp	.L205
.L208:
	lea	rax, -96[rbp]
	lea	rdx, .LC35[rip]
	mov	rcx, rax
	call	strcmp
	test	eax, eax
	jne	.L209
	lea	rax, 160[rbp]
	mov	rcx, rax
	call	strdup
	mov	rdx, rax
	mov	rax, QWORD PTR 2048[rbp]
	mov	QWORD PTR [rax], rdx
	jmp	.L205
.L209:
	lea	rax, -96[rbp]
	lea	rdx, .LC36[rip]
	mov	rcx, rax
	call	strcmp
	test	eax, eax
	jne	.L210
	lea	rax, 160[rbp]
	mov	rcx, rax
	call	atoi
	mov	rdx, QWORD PTR 2056[rbp]
	mov	DWORD PTR [rdx], eax
	jmp	.L205
.L210:
	lea	rax, -96[rbp]
	lea	rdx, .LC37[rip]
	mov	rcx, rax
	call	strcmp
	test	eax, eax
	jne	.L211
	lea	rax, 160[rbp]
	mov	rcx, rax
	call	atoi
	mov	rdx, QWORD PTR 2064[rbp]
	mov	DWORD PTR [rdx], eax
	jmp	.L205
.L211:
	lea	rax, -96[rbp]
	lea	rdx, .LC38[rip]
	mov	rcx, rax
	call	strcmp
	test	eax, eax
	jne	.L205
	lea	rax, 160[rbp]
	mov	rcx, rax
	call	strdup
	mov	rdx, rax
	mov	rax, QWORD PTR 2072[rbp]
	mov	QWORD PTR [rax], rdx
.L205:
	mov	rax, QWORD PTR 1960[rbp]
	mov	rdx, rax
	mov	ecx, 0
	call	strtok
	mov	QWORD PTR 1984[rbp], rax
.L204:
	cmp	QWORD PTR 1984[rbp], 0
	jne	.L212
.L203:
	add	DWORD PTR 1992[rbp], 1
.L202:
	mov	eax, DWORD PTR 1992[rbp]
	cmp	eax, DWORD PTR 1968[rbp]
	jle	.L213
	mov	rax, QWORD PTR 1976[rbp]
	mov	rcx, rax
	call	fclose
	nop
.L196:
	add	rsp, 2128
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC39:
	.ascii "Compiled with SDL version %u.%u.%u ...\12\0"
	.align 8
.LC40:
	.ascii "Linked against SDL version %u.%u.%u.\12\0"
	.align 8
.LC41:
	.ascii "Failed to allocate memory for water particles\12\0"
.LC42:
	.ascii "SDL init error:%s\12\0"
.LC43:
	.ascii "COSC345 - Game\0"
.LC44:
	.ascii "Window error\0"
.LC45:
	.ascii "Render error\0"
.LC46:
	.ascii "Surface error\0"
	.align 8
.LC47:
	.ascii "SDL_ttf could not initialize! TTF_Error: %s\12\0"
.LC48:
	.ascii "font.ttf\0"
	.align 8
.LC49:
	.ascii "Failed to load font! SDL_ttf Error: %s\12\0"
	.align 8
.LC50:
	.ascii "Renderer could not be created! SDL_Error: %s\12\0"
.LC51:
	.ascii "img/spr_grass.png\0"
.LC52:
	.ascii "img/spr_sand.png\0"
.LC53:
	.ascii "img/spr_water_strip16.png\0"
.LC54:
	.ascii "img/spr_lava_strip16.png\0"
	.align 8
.LC55:
	.ascii "img/spr_water_shallow_strip16.png\0"
	.align 8
.LC56:
	.ascii "img/spr_lava_shallow_strip16.png\0"
.LC57:
	.ascii "tiled/tileset.png\0"
.LC58:
	.ascii "img/hudshade.png\0"
.LC59:
	.ascii "img/spr_enemy1.png\0"
.LC60:
	.ascii "img/player_strip8.png\0"
.LC61:
	.ascii "img/ascii_strip96.png\0"
.LC62:
	.ascii "img/clock1_strip10.png\0"
.LC63:
	.ascii "Night\0"
.LC64:
	.ascii "Morning\0"
.LC65:
	.ascii "Day\0"
.LC66:
	.ascii "Evening\0"
.LC67:
	.ascii "MTWTFSS\0"
.LC68:
	.ascii "img/dunedin-map.png\0"
.LC69:
	.ascii "img/spr_map_unknown.png\0"
.LC70:
	.ascii "img/spr_thermometer.png\0"
.LC71:
	.ascii "img/spr_nutrients_strip4.png\0"
.LC72:
	.ascii "music.wav\0"
.LC73:
	.ascii "Failed to load WAV file: %s\12\0"
	.align 8
.LC74:
	.ascii "Failed to open audio device: %s\12\0"
.LC75:
	.ascii "img/logo1a.png\0"
.LC76:
	.ascii "img/logo1b.png\0"
.LC77:
	.ascii "img/logo1c.png\0"
.LC78:
	.ascii "Press SPACE to continue.\0"
	.align 8
.LC79:
	.ascii "(C) 2023 - Thomas, Sean, Matthew, Nicholas - COSC345\0"
.LC80:
	.ascii "Entering main loop...\0"
.LC81:
	.ascii "F2 started!\0"
.LC82:
	.ascii "F2 finished!\0"
	.align 8
.LC83:
	.ascii "you pressed 1, good job. Lets test the limit\0"
	.align 8
.LC84:
	.ascii "you pressed 2, good job. Lets test the limit woo\0"
.LC85:
	.ascii "you pressed 3\0"
	.align 8
.LC86:
	.ascii "you pressed 4, good job. Lets test the limit woo\0"
.LC87:
	.ascii "HEALTH:\0"
.LC88:
	.ascii "LVL: XYZ/511\0"
.LC89:
	.ascii "X\0"
.LC90:
	.ascii "Y\0"
.LC91:
	.ascii "Z\0"
.LC93:
	.ascii ":\0"
.LC98:
	.ascii "Error: Text Rendering Failed\0"
.LC101:
	.ascii "Player collided with enemy!\0"
	.align 8
.LC102:
	.ascii "Greetings wanderer\12Answer my riddle to pass through\12 Which of these macronutrients contains the most calories per gram\0"
.LC103:
	.ascii "1. Carbohydrate\0"
.LC104:
	.ascii "2. Fat\0"
.LC105:
	.ascii "3. Protein\0"
	.align 8
.LC106:
	.ascii "Greetings wanderer\12Answer my riddle to pass through\12 Should this quiz work?\0"
.LC107:
	.ascii "1. yes\0"
.LC108:
	.ascii "2. no\0"
.LC109:
	.ascii "3. definitely not\0"
.LC110:
	.ascii "Correct\0"
.LC111:
	.ascii "questions.txt\0"
.LC112:
	.ascii "false\0"
.LC113:
	.ascii "correct\0"
.LC114:
	.ascii " \0"
.LC115:
	.ascii "press 1 2 or 3 to exit\0"
.LC116:
	.ascii "\12%s\12%s\12%s\12%s\12%s\0"
	.align 8
.LC117:
	.ascii "Error creating text surface: %s\12\0"
	.align 8
.LC118:
	.ascii "Error creating text texture: %s\12\0"
.LC126:
	.ascii "Score: %d\0"
.LC127:
	.ascii "...exited main loop.\0"
.LC128:
	.ascii "%s Error returned: %s\12\0"
	.text
	.globl	SDL_main
	.def	SDL_main;	.scl	2;	.type	32;	.endef
	.seh_proc	SDL_main
SDL_main:
	push	rbp
	.seh_pushreg	rbp
	push	r15
	.seh_pushreg	r15
	push	r14
	.seh_pushreg	r14
	push	r13
	.seh_pushreg	r13
	push	r12
	.seh_pushreg	r12
	push	rdi
	.seh_pushreg	rdi
	push	rsi
	.seh_pushreg	rsi
	push	rbx
	.seh_pushreg	rbx
	mov	eax, 265016
	call	___chkstk_ms
	sub	rsp, rax
	.seh_stackalloc	265016
	lea	rbp, 128[rsp]
	.seh_setframe	rbp, 128
	movaps	XMMWORD PTR 264848[rbp], xmm6
	.seh_savexmm	xmm6, 264976
	movaps	XMMWORD PTR 264864[rbp], xmm7
	.seh_savexmm	xmm7, 264992
	.seh_endprologue
	mov	DWORD PTR 264960[rbp], ecx
	mov	QWORD PTR 264968[rbp], rdx
	mov	rax, rsp
	mov	r12, rax
	mov	QWORD PTR 264712[rbp], 256
	mov	rax, QWORD PTR 264712[rbp]
	sub	rax, 1
	mov	QWORD PTR 264704[rbp], rax
	mov	rax, QWORD PTR 264712[rbp]
	mov	r10, rax
	mov	r11d, 0
	mov	rax, QWORD PTR 264712[rbp]
	mov	r8, rax
	mov	r9d, 0
	mov	rax, QWORD PTR 264712[rbp]
	add	rax, 15
	shr	rax, 4
	sal	rax, 4
	call	___chkstk_ms
	sub	rsp, rax
	lea	rax, 80[rsp]
	add	rax, 0
	mov	QWORD PTR 264696[rbp], rax
	mov	BYTE PTR 1229[rbp], 2
	mov	BYTE PTR 1230[rbp], 28
	mov	BYTE PTR 1231[rbp], 1
	lea	rax, 1226[rbp]
	mov	rcx, rax
	call	SDL_GetVersion
	movzx	eax, BYTE PTR 1231[rbp]
	movzx	ecx, al
	movzx	eax, BYTE PTR 1230[rbp]
	movzx	edx, al
	movzx	eax, BYTE PTR 1229[rbp]
	movzx	eax, al
	mov	r9d, ecx
	mov	r8d, edx
	mov	edx, eax
	lea	rax, .LC39[rip]
	mov	rcx, rax
	call	SDL_Log
	movzx	eax, BYTE PTR 1228[rbp]
	movzx	ecx, al
	movzx	eax, BYTE PTR 1227[rbp]
	movzx	edx, al
	movzx	eax, BYTE PTR 1226[rbp]
	movzx	eax, al
	mov	r9d, ecx
	mov	r8d, edx
	mov	edx, eax
	lea	rax, .LC40[rip]
	mov	rcx, rax
	call	SDL_Log
	mov	DWORD PTR 264692[rbp], 1366
	mov	DWORD PTR 264688[rbp], 768
	mov	eax, DWORD PTR 264692[rbp]
	sub	eax, DWORD PTR 264688[rbp]
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	mov	DWORD PTR 264684[rbp], eax
	mov	DWORD PTR 264680[rbp], 0
	mov	eax, DWORD PTR 264688[rbp]
	mov	DWORD PTR 264676[rbp], eax
	mov	eax, DWORD PTR 264688[rbp]
	mov	DWORD PTR 264672[rbp], eax
	mov	edx, DWORD PTR 264684[rbp]
	mov	eax, DWORD PTR 264676[rbp]
	add	eax, edx
	mov	DWORD PTR 264668[rbp], eax
	mov	edx, DWORD PTR 264680[rbp]
	mov	eax, DWORD PTR 264672[rbp]
	add	eax, edx
	mov	DWORD PTR 264664[rbp], eax
	mov	DWORD PTR 264660[rbp], 16
	mov	DWORD PTR 264656[rbp], 16
	mov	eax, DWORD PTR 264660[rbp]
	mov	ecx, eax
	call	sqr
	mov	esi, eax
	mov	eax, DWORD PTR 264688[rbp]
	cdq
	idiv	esi
	mov	DWORD PTR 264652[rbp], eax
	mov	eax, DWORD PTR 264652[rbp]
	mov	DWORD PTR 264648[rbp], eax
	mov	eax, 100
	cdqe
	sal	rax, 4
	mov	rcx, rax
	call	malloc
	mov	QWORD PTR waterParticles[rip], rax
	mov	rax, QWORD PTR waterParticles[rip]
	test	rax, rax
	jne	.L215
	mov	ecx, 2
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	r9, rax
	mov	r8d, 46
	mov	edx, 1
	lea	rax, .LC41[rip]
	mov	rcx, rax
	call	fwrite
	mov	eax, 1
	jmp	.L216
.L215:
	mov	ecx, 0
	call	time
	mov	ecx, eax
	call	srand
	mov	DWORD PTR 264844[rbp], 0
	jmp	.L217
.L218:
	mov	ecx, DWORD PTR 264688[rbp]
	mov	edx, DWORD PTR 264692[rbp]
	mov	eax, DWORD PTR 264844[rbp]
	mov	r8d, ecx
	mov	ecx, eax
	call	createWaterParticle
	add	DWORD PTR 264844[rbp], 1
.L217:
	mov	eax, 100
	cmp	DWORD PTR 264844[rbp], eax
	jl	.L218
	mov	DWORD PTR 264644[rbp], 62001
	mov	eax, DWORD PTR 264644[rbp]
	mov	ecx, eax
	call	SDL_Init
	test	eax, eax
	je	.L219
	call	SDL_GetError
	mov	rdx, rax
	lea	rax, .LC42[rip]
	mov	rcx, rax
	call	printf
	mov	eax, -1
	jmp	.L216
.L219:
	mov	edx, DWORD PTR 264692[rbp]
	mov	DWORD PTR 40[rsp], 0
	mov	eax, DWORD PTR 264688[rbp]
	mov	DWORD PTR 32[rsp], eax
	mov	r9d, edx
	mov	r8d, 536805376
	mov	edx, 536805376
	lea	rax, .LC43[rip]
	mov	rcx, rax
	call	SDL_CreateWindow
	mov	QWORD PTR 264632[rbp], rax
	cmp	QWORD PTR 264632[rbp], 0
	jne	.L220
	mov	rdx, QWORD PTR 264712[rbp]
	mov	rax, QWORD PTR 264696[rbp]
	lea	r8, .LC44[rip]
	mov	rcx, rax
	call	snprintf
	jmp	.L221
.L220:
	mov	rax, QWORD PTR 264632[rbp]
	mov	r8d, 4
	mov	edx, -1
	mov	rcx, rax
	call	SDL_CreateRenderer
	mov	QWORD PTR 264624[rbp], rax
	cmp	QWORD PTR 264624[rbp], 0
	jne	.L222
	mov	rdx, QWORD PTR 264712[rbp]
	mov	rax, QWORD PTR 264696[rbp]
	lea	r8, .LC45[rip]
	mov	rcx, rax
	call	snprintf
	jmp	.L221
.L222:
	mov	rax, QWORD PTR 264632[rbp]
	mov	rcx, rax
	call	SDL_GetWindowSurface
	mov	QWORD PTR 264616[rbp], rax
	cmp	QWORD PTR 264616[rbp], 0
	jne	.L223
	mov	rdx, QWORD PTR 264712[rbp]
	mov	rax, QWORD PTR 264696[rbp]
	lea	r8, .LC46[rip]
	mov	rcx, rax
	call	snprintf
	jmp	.L221
.L223:
	mov	DWORD PTR 263712[rbp], 800
	mov	DWORD PTR 263716[rbp], 100
	mov	DWORD PTR 263720[rbp], 100
	mov	DWORD PTR 263724[rbp], 100
	movabs	rax, 2338613357913204068
	mov	QWORD PTR 263600[rbp], rax
	movabs	rax, 28542640894207341
	mov	QWORD PTR 263608[rbp], rax
	mov	QWORD PTR 263616[rbp], 0
	mov	QWORD PTR 263624[rbp], 0
	mov	QWORD PTR 263632[rbp], 0
	mov	QWORD PTR 263640[rbp], 0
	mov	QWORD PTR 263648[rbp], 0
	mov	QWORD PTR 263656[rbp], 0
	mov	QWORD PTR 263664[rbp], 0
	mov	QWORD PTR 263672[rbp], 0
	mov	QWORD PTR 263680[rbp], 0
	mov	QWORD PTR 263688[rbp], 0
	mov	DWORD PTR 263696[rbp], 0
	lea	rax, 263600[rbp]
	mov	QWORD PTR 264608[rbp], rax
	lea	rax, 263712[rbp]
	mov	QWORD PTR 264600[rbp], rax
	mov	DWORD PTR 264840[rbp], 0
	mov	DWORD PTR 264596[rbp], 0
	call	TTF_Init
	cmp	eax, -1
	jne	.L224
	call	SDL_GetError
	mov	rdx, rax
	lea	rax, .LC47[rip]
	mov	rcx, rax
	call	printf
	mov	eax, 1
	jmp	.L216
.L224:
	mov	edx, 12
	lea	rax, .LC48[rip]
	mov	rcx, rax
	call	TTF_OpenFont
	mov	QWORD PTR 264584[rbp], rax
	cmp	QWORD PTR 264584[rbp], 0
	jne	.L225
	call	SDL_GetError
	mov	rdx, rax
	lea	rax, .LC49[rip]
	mov	rcx, rax
	call	printf
	mov	eax, 1
	jmp	.L216
.L225:
	mov	DWORD PTR 264580[rbp], 0
	mov	DWORD PTR 264836[rbp], 0
	mov	BYTE PTR 263596[rbp], 0
	mov	BYTE PTR 263597[rbp], 0
	mov	BYTE PTR 263598[rbp], 0
	mov	BYTE PTR 263599[rbp], -1
	mov	rax, QWORD PTR 264632[rbp]
	mov	r8d, 2
	mov	edx, -1
	mov	rcx, rax
	call	SDL_CreateRenderer
	mov	QWORD PTR 264568[rbp], rax
	cmp	QWORD PTR 264624[rbp], 0
	jne	.L226
	call	SDL_GetError
	mov	rdx, rax
	lea	rax, .LC50[rip]
	mov	rcx, rax
	call	printf
.L226:
	mov	ecx, 2
	call	IMG_Init
	mov	rax, QWORD PTR 264624[rbp]
	lea	rdx, .LC51[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 264560[rbp], rax
	mov	rax, QWORD PTR 264624[rbp]
	lea	rdx, .LC52[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 264552[rbp], rax
	mov	rax, QWORD PTR 264624[rbp]
	lea	rdx, .LC53[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 264544[rbp], rax
	mov	rax, QWORD PTR 264624[rbp]
	lea	rdx, .LC54[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 264536[rbp], rax
	mov	rax, QWORD PTR 264624[rbp]
	lea	rdx, .LC55[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 264528[rbp], rax
	mov	rax, QWORD PTR 264624[rbp]
	lea	rdx, .LC56[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 264520[rbp], rax
	mov	rax, QWORD PTR 264624[rbp]
	lea	rdx, .LC57[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 264512[rbp], rax
	mov	rax, QWORD PTR 264624[rbp]
	lea	rdx, .LC58[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 264504[rbp], rax
	mov	rax, QWORD PTR 264624[rbp]
	lea	rdx, .LC59[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 264496[rbp], rax
	mov	rax, QWORD PTR 264624[rbp]
	lea	rdx, .LC60[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 264488[rbp], rax
	mov	rax, QWORD PTR 264624[rbp]
	lea	rdx, .LC61[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 264480[rbp], rax
	mov	DWORD PTR 264476[rbp], 8
	mov	DWORD PTR 264472[rbp], 24
	mov	rax, QWORD PTR 264624[rbp]
	lea	rdx, .LC62[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 264464[rbp], rax
	mov	DWORD PTR 264460[rbp], 1440
	mov	DWORD PTR 264832[rbp], 0
	mov	DWORD PTR 264828[rbp], 0
	mov	DWORD PTR 264456[rbp], 57
	mov	DWORD PTR 264452[rbp], 60
	lea	rax, .LC63[rip]
	mov	QWORD PTR 264440[rbp], rax
	lea	rax, .LC64[rip]
	mov	QWORD PTR 264432[rbp], rax
	lea	rax, .LC65[rip]
	mov	QWORD PTR 264424[rbp], rax
	lea	rax, .LC66[rip]
	mov	QWORD PTR 264416[rbp], rax
	mov	DWORD PTR 264824[rbp], 0
	lea	rax, .LC67[rip]
	mov	QWORD PTR 264408[rbp], rax
	mov	DWORD PTR 264820[rbp], 0
	mov	eax, DWORD PTR 264660[rbp]
	mov	ecx, eax
	call	sqr
	mov	DWORD PTR 264404[rbp], eax
	mov	DWORD PTR 264400[rbp], 2
	mov	eax, DWORD PTR 264400[rbp]
	sal	eax, 8
	mov	DWORD PTR 264396[rbp], eax
	mov	DWORD PTR 264392[rbp], 2
	mov	DWORD PTR 264816[rbp], 0
	mov	r8d, DWORD PTR 264392[rbp]
	mov	ecx, DWORD PTR 264396[rbp]
	mov	edx, DWORD PTR 264404[rbp]
	lea	rax, 1440[rbp]
	mov	r9d, r8d
	mov	r8d, ecx
	mov	rcx, rax
	call	level_load
	mov	DWORD PTR 264388[rbp], 131072
	mov	eax, DWORD PTR 264396[rbp]
	cdq
	idiv	DWORD PTR 264400[rbp]
	pxor	xmm4, xmm4
	cvtsi2sd	xmm4, eax
	movq	rax, xmm4
	movq	xmm0, rax
	call	sqrt
	cvttsd2si	eax, xmm0
	mov	DWORD PTR 264384[rbp], eax
	mov	rax, QWORD PTR 264624[rbp]
	lea	rdx, .LC68[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 264376[rbp], rax
	mov	rax, QWORD PTR 264624[rbp]
	lea	rdx, .LC69[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 264368[rbp], rax
	lea	rax, 1424[rbp]
	mov	ecx, DWORD PTR 264816[rbp]
	mov	rdx, rax
	call	level_get_name
	mov	eax, DWORD PTR 264816[rbp]
	and	eax, 31
	mov	edx, 1
	mov	ecx, eax
	sal	edx, cl
	mov	ecx, edx
	mov	eax, DWORD PTR 264816[rbp]
	lea	edx, 31[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 5
	mov	edx, ecx
	cdqe
	mov	DWORD PTR 1360[rbp+rax*4], edx
	mov	DWORD PTR 264364[rbp], 0
	mov	DWORD PTR 264360[rbp], 10
	mov	eax, 42
	mov	BYTE PTR 1358[rbp], al
	mov	rax, QWORD PTR 264624[rbp]
	lea	rdx, .LC70[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 264352[rbp], rax
	mov	BYTE PTR 264351[rbp], -128
	mov	eax, DWORD PTR 264652[rbp]
	imul	eax, DWORD PTR 264656[rbp]
	lea	edx, 0[0+rax*8]
	mov	eax, DWORD PTR 264684[rbp]
	add	eax, edx
	mov	DWORD PTR 1296[rbp], eax
	mov	eax, DWORD PTR 264648[rbp]
	imul	eax, DWORD PTR 264656[rbp]
	lea	edx, 0[0+rax*8]
	mov	eax, DWORD PTR 264680[rbp]
	add	eax, edx
	mov	DWORD PTR 1300[rbp], eax
	mov	BYTE PTR 1312[rbp], 0
	mov	BYTE PTR 1313[rbp], 0
	mov	BYTE PTR 1314[rbp], 1
	mov	BYTE PTR 1315[rbp], 12
	mov	BYTE PTR 1316[rbp], 0
	mov	BYTE PTR 1317[rbp], 2
	mov	BYTE PTR 1318[rbp], 12
	mov	DWORD PTR 1328[rbp], 50
	mov	DWORD PTR 1324[rbp], 15
	mov	DWORD PTR 1320[rbp], 50
	mov	DWORD PTR 1332[rbp], 15
	mov	DWORD PTR 1336[rbp], 15
	mov	r8d, DWORD PTR 1336[rbp]
	mov	ecx, DWORD PTR 1332[rbp]
	mov	edx, DWORD PTR 1300[rbp]
	mov	eax, DWORD PTR 1296[rbp]
	mov	r9d, r8d
	mov	r8d, ecx
	mov	ecx, eax
	call	updatePlayerHitbox
	mov	rax, QWORD PTR 264624[rbp]
	lea	rdx, .LC71[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 264336[rbp], rax
	lea	rax, .LC72[rip]
	mov	QWORD PTR 264328[rbp], rax
	mov	rax, QWORD PTR 264328[rbp]
	lea	rdx, .LC4[rip]
	mov	rcx, rax
	call	SDL_RWFromFile
	mov	rcx, rax
	lea	r8, 1256[rbp]
	lea	rdx, 1264[rbp]
	lea	rax, 1252[rbp]
	mov	QWORD PTR 32[rsp], rax
	mov	r9, r8
	mov	r8, rdx
	mov	edx, 1
	call	SDL_LoadWAV_RW
	test	rax, rax
	jne	.L227
	call	SDL_GetError
	mov	rdx, rax
	lea	rax, .LC73[rip]
	mov	rcx, rax
	call	printf
	jmp	.L228
.L227:
	mov	rax, QWORD PTR 1256[rbp]
	mov	QWORD PTR 1232[rbp], rax
	mov	eax, DWORD PTR 1252[rbp]
	mov	DWORD PTR 1240[rbp], eax
	mov	DWORD PTR 1244[rbp], 0
	lea	rax, audioCallback[rip]
	mov	QWORD PTR 1280[rbp], rax
	lea	rax, 1232[rbp]
	mov	QWORD PTR 1288[rbp], rax
	lea	rax, 1264[rbp]
	mov	DWORD PTR 32[rsp], 0
	mov	r9d, 0
	mov	r8, rax
	mov	edx, 0
	mov	ecx, 0
	call	SDL_OpenAudioDevice
	mov	DWORD PTR 264324[rbp], eax
	cmp	DWORD PTR 264324[rbp], 0
	jne	.L229
	call	SDL_GetError
	mov	rdx, rax
	lea	rax, .LC74[rip]
	mov	rcx, rax
	call	printf
	mov	rax, QWORD PTR 1256[rbp]
	mov	rcx, rax
	call	SDL_FreeWAV
	jmp	.L228
.L229:
	mov	ecx, DWORD PTR 1252[rbp]
	mov	rdx, QWORD PTR 1256[rbp]
	mov	eax, DWORD PTR 264324[rbp]
	mov	r8d, ecx
	mov	ecx, eax
	call	SDL_QueueAudio
	mov	eax, DWORD PTR 264324[rbp]
	mov	edx, 0
	mov	ecx, eax
	call	SDL_PauseAudioDevice
	mov	DWORD PTR 264812[rbp], 1
	mov	rax, QWORD PTR 264624[rbp]
	lea	rdx, .LC75[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 264312[rbp], rax
	mov	rax, QWORD PTR 264624[rbp]
	lea	rdx, .LC76[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 264304[rbp], rax
	mov	rax, QWORD PTR 264624[rbp]
	lea	rdx, .LC77[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 264296[rbp], rax
	lea	rax, .LC78[rip]
	mov	QWORD PTR 264288[rbp], rax
	lea	rax, .LC79[rip]
	mov	QWORD PTR 264280[rbp], rax
	mov	rax, QWORD PTR 264288[rbp]
	mov	rcx, rax
	call	strlen
	mov	DWORD PTR 264276[rbp], eax
	mov	rax, QWORD PTR 264280[rbp]
	mov	rcx, rax
	call	strlen
	mov	DWORD PTR 264272[rbp], eax
	mov	DWORD PTR 264808[rbp], 1
	lea	rax, .LC80[rip]
	mov	rcx, rax
	call	puts
	jmp	.L230
.L282:
	mov	eax, DWORD PTR 263728[rbp]
	cmp	eax, 769
	je	.L232
	cmp	eax, 769
	ja	.L231
	cmp	eax, 256
	je	.L233
	cmp	eax, 768
	je	.L234
	jmp	.L231
.L233:
	mov	DWORD PTR 264808[rbp], 0
	jmp	.L231
.L234:
	mov	DWORD PTR 263792[rbp], 1
	mov	eax, DWORD PTR 263748[rbp]
	cmp	eax, 57
	jg	.L235
	cmp	eax, 27
	jge	.L236
	jmp	.L231
.L258:
	sub	eax, 1073741883
	cmp	eax, 29
	ja	.L231
	mov	eax, eax
	lea	rdx, 0[0+rax*4]
	lea	rax, .L239[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cdqe
	lea	rdx, .L239[rip]
	add	rax, rdx
	jmp	rax
	.section .rdata,"dr"
	.align 4
.L239:
	.long	.L244-.L239
	.long	.L231-.L239
	.long	.L231-.L239
	.long	.L231-.L239
	.long	.L231-.L239
	.long	.L231-.L239
	.long	.L231-.L239
	.long	.L231-.L239
	.long	.L231-.L239
	.long	.L231-.L239
	.long	.L231-.L239
	.long	.L231-.L239
	.long	.L231-.L239
	.long	.L231-.L239
	.long	.L231-.L239
	.long	.L231-.L239
	.long	.L231-.L239
	.long	.L231-.L239
	.long	.L231-.L239
	.long	.L231-.L239
	.long	.L243-.L239
	.long	.L242-.L239
	.long	.L241-.L239
	.long	.L240-.L239
	.long	.L231-.L239
	.long	.L231-.L239
	.long	.L231-.L239
	.long	.L231-.L239
	.long	.L231-.L239
	.long	.L238-.L239
	.text
.L236:
	sub	eax, 27
	cmp	eax, 30
	ja	.L231
	mov	eax, eax
	lea	rdx, 0[0+rax*4]
	lea	rax, .L246[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cdqe
	lea	rdx, .L246[rip]
	add	rax, rdx
	jmp	rax
	.section .rdata,"dr"
	.align 4
.L246:
	.long	.L257-.L246
	.long	.L231-.L246
	.long	.L231-.L246
	.long	.L231-.L246
	.long	.L231-.L246
	.long	.L256-.L246
	.long	.L231-.L246
	.long	.L231-.L246
	.long	.L231-.L246
	.long	.L231-.L246
	.long	.L231-.L246
	.long	.L231-.L246
	.long	.L231-.L246
	.long	.L231-.L246
	.long	.L231-.L246
	.long	.L231-.L246
	.long	.L231-.L246
	.long	.L231-.L246
	.long	.L231-.L246
	.long	.L231-.L246
	.long	.L231-.L246
	.long	.L255-.L246
	.long	.L254-.L246
	.long	.L253-.L246
	.long	.L252-.L246
	.long	.L251-.L246
	.long	.L250-.L246
	.long	.L249-.L246
	.long	.L248-.L246
	.long	.L247-.L246
	.long	.L245-.L246
	.text
.L235:
	cmp	eax, 1073741912
	jg	.L231
	cmp	eax, 1073741883
	jge	.L258
	jmp	.L231
.L257:
	mov	DWORD PTR 264808[rbp], 0
	jmp	.L237
.L243:
	mov	eax, DWORD PTR 263792[rbp]
	mov	DWORD PTR glob_vk_right[rip], eax
	jmp	.L237
.L242:
	mov	eax, DWORD PTR 263792[rbp]
	mov	DWORD PTR glob_vk_left[rip], eax
	jmp	.L237
.L240:
	mov	eax, DWORD PTR 263792[rbp]
	mov	DWORD PTR glob_vk_up[rip], eax
	jmp	.L237
.L241:
	mov	eax, DWORD PTR 263792[rbp]
	mov	DWORD PTR glob_vk_down[rip], eax
	jmp	.L237
.L256:
	mov	eax, DWORD PTR 263792[rbp]
	mov	DWORD PTR glob_vk_space[rip], eax
	jmp	.L237
.L238:
	mov	eax, DWORD PTR 263792[rbp]
	mov	DWORD PTR glob_vk_enter[rip], eax
	jmp	.L237
.L244:
	mov	eax, DWORD PTR 263792[rbp]
	mov	DWORD PTR glob_vk_f2[rip], eax
	jmp	.L237
.L255:
	mov	eax, DWORD PTR 263792[rbp]
	mov	DWORD PTR glob_vk_0[rip], eax
	jmp	.L237
.L254:
	mov	eax, DWORD PTR 263792[rbp]
	mov	DWORD PTR glob_vk_1[rip], eax
	jmp	.L237
.L253:
	mov	eax, DWORD PTR 263792[rbp]
	mov	DWORD PTR glob_vk_2[rip], eax
	jmp	.L237
.L252:
	mov	eax, DWORD PTR 263792[rbp]
	mov	DWORD PTR glob_vk_3[rip], eax
	jmp	.L237
.L251:
	mov	eax, DWORD PTR 263792[rbp]
	mov	DWORD PTR glob_vk_4[rip], eax
	jmp	.L237
.L250:
	mov	eax, DWORD PTR 263792[rbp]
	mov	DWORD PTR glob_vk_5[rip], eax
	jmp	.L237
.L249:
	mov	eax, DWORD PTR 263792[rbp]
	mov	DWORD PTR glob_vk_6[rip], eax
	jmp	.L237
.L248:
	mov	eax, DWORD PTR 263792[rbp]
	mov	DWORD PTR glob_vk_7[rip], eax
	jmp	.L237
.L247:
	mov	eax, DWORD PTR 263792[rbp]
	mov	DWORD PTR glob_vk_8[rip], eax
	jmp	.L237
.L245:
	mov	eax, DWORD PTR 263792[rbp]
	mov	DWORD PTR glob_vk_9[rip], eax
	nop
.L237:
	jmp	.L231
.L232:
	mov	DWORD PTR 263796[rbp], 0
	mov	eax, DWORD PTR 263748[rbp]
	cmp	eax, 57
	jg	.L259
	cmp	eax, 32
	jge	.L260
	jmp	.L408
.L281:
	sub	eax, 1073741883
	cmp	eax, 29
	ja	.L408
	mov	eax, eax
	lea	rdx, 0[0+rax*4]
	lea	rax, .L263[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cdqe
	lea	rdx, .L263[rip]
	add	rax, rdx
	jmp	rax
	.section .rdata,"dr"
	.align 4
.L263:
	.long	.L268-.L263
	.long	.L408-.L263
	.long	.L408-.L263
	.long	.L408-.L263
	.long	.L408-.L263
	.long	.L408-.L263
	.long	.L408-.L263
	.long	.L408-.L263
	.long	.L408-.L263
	.long	.L408-.L263
	.long	.L408-.L263
	.long	.L408-.L263
	.long	.L408-.L263
	.long	.L408-.L263
	.long	.L408-.L263
	.long	.L408-.L263
	.long	.L408-.L263
	.long	.L408-.L263
	.long	.L408-.L263
	.long	.L408-.L263
	.long	.L267-.L263
	.long	.L266-.L263
	.long	.L265-.L263
	.long	.L264-.L263
	.long	.L408-.L263
	.long	.L408-.L263
	.long	.L408-.L263
	.long	.L408-.L263
	.long	.L408-.L263
	.long	.L262-.L263
	.text
.L260:
	sub	eax, 32
	cmp	eax, 25
	ja	.L408
	mov	eax, eax
	lea	rdx, 0[0+rax*4]
	lea	rax, .L270[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cdqe
	lea	rdx, .L270[rip]
	add	rax, rdx
	jmp	rax
	.section .rdata,"dr"
	.align 4
.L270:
	.long	.L280-.L270
	.long	.L408-.L270
	.long	.L408-.L270
	.long	.L408-.L270
	.long	.L408-.L270
	.long	.L408-.L270
	.long	.L408-.L270
	.long	.L408-.L270
	.long	.L408-.L270
	.long	.L408-.L270
	.long	.L408-.L270
	.long	.L408-.L270
	.long	.L408-.L270
	.long	.L408-.L270
	.long	.L408-.L270
	.long	.L408-.L270
	.long	.L279-.L270
	.long	.L278-.L270
	.long	.L277-.L270
	.long	.L276-.L270
	.long	.L275-.L270
	.long	.L274-.L270
	.long	.L273-.L270
	.long	.L272-.L270
	.long	.L271-.L270
	.long	.L269-.L270
	.text
.L259:
	cmp	eax, 1073741912
	jg	.L408
	cmp	eax, 1073741883
	jge	.L281
	jmp	.L408
.L267:
	mov	eax, DWORD PTR 263796[rbp]
	mov	DWORD PTR glob_vk_right[rip], eax
	jmp	.L261
.L266:
	mov	eax, DWORD PTR 263796[rbp]
	mov	DWORD PTR glob_vk_left[rip], eax
	jmp	.L261
.L264:
	mov	eax, DWORD PTR 263796[rbp]
	mov	DWORD PTR glob_vk_up[rip], eax
	jmp	.L261
.L265:
	mov	eax, DWORD PTR 263796[rbp]
	mov	DWORD PTR glob_vk_down[rip], eax
	jmp	.L261
.L280:
	mov	eax, DWORD PTR 263796[rbp]
	mov	DWORD PTR glob_vk_space[rip], eax
	jmp	.L261
.L262:
	mov	eax, DWORD PTR 263796[rbp]
	mov	DWORD PTR glob_vk_enter[rip], eax
	jmp	.L261
.L268:
	mov	eax, DWORD PTR 263796[rbp]
	mov	DWORD PTR glob_vk_f2[rip], eax
	jmp	.L261
.L279:
	mov	eax, DWORD PTR 263796[rbp]
	mov	DWORD PTR glob_vk_0[rip], eax
	jmp	.L261
.L278:
	mov	eax, DWORD PTR 263796[rbp]
	mov	DWORD PTR glob_vk_1[rip], eax
	jmp	.L261
.L277:
	mov	eax, DWORD PTR 263796[rbp]
	mov	DWORD PTR glob_vk_2[rip], eax
	jmp	.L261
.L276:
	mov	eax, DWORD PTR 263796[rbp]
	mov	DWORD PTR glob_vk_3[rip], eax
	jmp	.L261
.L275:
	mov	eax, DWORD PTR 263796[rbp]
	mov	DWORD PTR glob_vk_4[rip], eax
	jmp	.L261
.L274:
	mov	eax, DWORD PTR 263796[rbp]
	mov	DWORD PTR glob_vk_5[rip], eax
	jmp	.L261
.L273:
	mov	eax, DWORD PTR 263796[rbp]
	mov	DWORD PTR glob_vk_6[rip], eax
	jmp	.L261
.L272:
	mov	eax, DWORD PTR 263796[rbp]
	mov	DWORD PTR glob_vk_7[rip], eax
	jmp	.L261
.L271:
	mov	eax, DWORD PTR 263796[rbp]
	mov	DWORD PTR glob_vk_8[rip], eax
	jmp	.L261
.L269:
	mov	eax, DWORD PTR 263796[rbp]
	mov	DWORD PTR glob_vk_9[rip], eax
	nop
.L261:
.L408:
	nop
.L231:
	lea	rax, 263728[rbp]
	mov	rcx, rax
	call	SDL_PollEvent
	test	eax, eax
	jne	.L282
	mov	eax, DWORD PTR glob_vk_f2[rip]
	test	eax, eax
	je	.L283
	lea	rax, .LC81[rip]
	mov	rcx, rax
	call	puts
	lea	rax, 1440[rbp]
	mov	rcx, rax
	call	dev_tiled_to_leveldata
	lea	rax, .LC82[rip]
	mov	rcx, rax
	call	puts
.L283:
	mov	eax, DWORD PTR glob_vk_7[rip]
	test	eax, eax
	je	.L284
	mov	DWORD PTR glob_vk_7[rip], 0
	lea	rax, 1296[rbp]
	mov	rcx, rax
	call	attack
	lea	rcx, 1296[rbp]
	mov	rdx, QWORD PTR 264544[rbp]
	mov	rax, QWORD PTR 264624[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	renderWeaponSwing
.L284:
	mov	eax, DWORD PTR glob_vk_0[rip]
	test	eax, eax
	je	.L285
	mov	DWORD PTR glob_vk_0[rip], 0
	mov	eax, DWORD PTR waterOn[rip]
	test	eax, eax
	jne	.L286
	mov	DWORD PTR waterOn[rip], 1
	call	activateAllWaterParticles
	jmp	.L285
.L286:
	mov	DWORD PTR waterOn[rip], 0
	call	deactivateAllWaterParticles
.L285:
	mov	eax, DWORD PTR glob_vk_9[rip]
	test	eax, eax
	je	.L287
	mov	DWORD PTR glob_vk_9[rip], 0
	cmp	DWORD PTR 264840[rbp], 0
	jne	.L288
	mov	DWORD PTR 264840[rbp], 1
	lea	rax, 263600[rbp]
	movabs	rdi, 3184362091757007472
	mov	QWORD PTR [rax], rdi
	movabs	rdi, 14685297085393969
	mov	QWORD PTR 6[rax], rdi
	jmp	.L287
.L288:
	mov	DWORD PTR 264840[rbp], 0
.L287:
	mov	eax, DWORD PTR glob_vk_1[rip]
	test	eax, eax
	je	.L289
	mov	DWORD PTR glob_vk_1[rip], 0
	cmp	DWORD PTR 264840[rbp], 1
	jne	.L290
	lea	rax, .LC83[rip]
	mov	QWORD PTR 264264[rbp], rax
	mov	QWORD PTR 264256[rbp], 99
	mov	rcx, QWORD PTR 264256[rbp]
	mov	rdx, QWORD PTR 264264[rbp]
	lea	rax, 263600[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	strncpy
	lea	rax, 263600[rbp]
	mov	rdx, QWORD PTR 264256[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	add	DWORD PTR 264836[rbp], 50
	jmp	.L289
.L290:
	movzx	eax, BYTE PTR quizOn[rip]
	test	al, al
	je	.L289
	mov	DWORD PTR userAnswer[rip], 1
.L289:
	mov	eax, DWORD PTR glob_vk_2[rip]
	test	eax, eax
	je	.L291
	mov	DWORD PTR glob_vk_2[rip], 0
	cmp	DWORD PTR 264840[rbp], 1
	jne	.L292
	lea	rax, .LC84[rip]
	mov	QWORD PTR 264248[rbp], rax
	mov	QWORD PTR 264240[rbp], 99
	mov	rcx, QWORD PTR 264240[rbp]
	mov	rdx, QWORD PTR 264248[rbp]
	lea	rax, 263600[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	strncpy
	lea	rax, 263600[rbp]
	mov	rdx, QWORD PTR 264240[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	add	DWORD PTR 264836[rbp], 50
	jmp	.L291
.L292:
	movzx	eax, BYTE PTR quizOn[rip]
	test	al, al
	je	.L291
	mov	DWORD PTR userAnswer[rip], 2
.L291:
	mov	eax, DWORD PTR glob_vk_3[rip]
	test	eax, eax
	je	.L293
	mov	DWORD PTR glob_vk_3[rip], 0
	cmp	DWORD PTR 264840[rbp], 1
	jne	.L294
	lea	rax, .LC85[rip]
	mov	QWORD PTR 264232[rbp], rax
	mov	QWORD PTR 264224[rbp], 99
	mov	rcx, QWORD PTR 264224[rbp]
	mov	rdx, QWORD PTR 264232[rbp]
	lea	rax, 263600[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	strncpy
	lea	rax, 263600[rbp]
	mov	rdx, QWORD PTR 264224[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	add	DWORD PTR 264836[rbp], 50
	jmp	.L293
.L294:
	movzx	eax, BYTE PTR quizOn[rip]
	test	al, al
	je	.L293
	mov	DWORD PTR userAnswer[rip], 3
.L293:
	mov	eax, DWORD PTR glob_vk_4[rip]
	test	eax, eax
	je	.L295
	mov	DWORD PTR glob_vk_4[rip], 0
	cmp	DWORD PTR 264840[rbp], 1
	jne	.L295
	lea	rax, .LC86[rip]
	mov	QWORD PTR 264216[rbp], rax
	mov	QWORD PTR 264208[rbp], 99
	mov	rcx, QWORD PTR 264208[rbp]
	mov	rdx, QWORD PTR 264216[rbp]
	lea	rax, 263600[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	strncpy
	lea	rax, 263600[rbp]
	mov	rdx, QWORD PTR 264208[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	add	DWORD PTR 264836[rbp], 50
.L295:
	mov	eax, DWORD PTR glob_vk_5[rip]
	test	eax, eax
	je	.L296
	mov	DWORD PTR glob_vk_5[rip], 0
	mov	ecx, 10
	call	damageMe
.L296:
	mov	eax, DWORD PTR glob_vk_6[rip]
	test	eax, eax
	je	.L297
	mov	DWORD PTR glob_vk_6[rip], 0
	mov	ecx, 10
	call	healMe
.L297:
	mov	eax, DWORD PTR glob_vk_right[rip]
	test	eax, eax
	je	.L298
	mov	BYTE PTR 1312[rbp], 0
	mov	edx, DWORD PTR 1296[rbp]
	movzx	eax, BYTE PTR 1318[rbp]
	movzx	eax, al
	add	eax, edx
	mov	DWORD PTR 1296[rbp], eax
	mov	r8d, DWORD PTR 1336[rbp]
	mov	ecx, DWORD PTR 1332[rbp]
	mov	edx, DWORD PTR 1300[rbp]
	mov	eax, DWORD PTR 1296[rbp]
	mov	r9d, r8d
	mov	r8d, ecx
	mov	ecx, eax
	call	updatePlayerHitbox
.L298:
	mov	eax, DWORD PTR glob_vk_up[rip]
	test	eax, eax
	je	.L299
	mov	BYTE PTR 1312[rbp], 1
	mov	edx, DWORD PTR 1300[rbp]
	movzx	eax, BYTE PTR 1318[rbp]
	movzx	eax, al
	sub	edx, eax
	mov	DWORD PTR 1300[rbp], edx
	mov	r8d, DWORD PTR 1336[rbp]
	mov	ecx, DWORD PTR 1332[rbp]
	mov	edx, DWORD PTR 1300[rbp]
	mov	eax, DWORD PTR 1296[rbp]
	mov	r9d, r8d
	mov	r8d, ecx
	mov	ecx, eax
	call	updatePlayerHitbox
.L299:
	mov	eax, DWORD PTR glob_vk_left[rip]
	test	eax, eax
	je	.L300
	mov	BYTE PTR 1312[rbp], 2
	mov	edx, DWORD PTR 1296[rbp]
	movzx	eax, BYTE PTR 1318[rbp]
	movzx	eax, al
	sub	edx, eax
	mov	DWORD PTR 1296[rbp], edx
	mov	r8d, DWORD PTR 1336[rbp]
	mov	ecx, DWORD PTR 1332[rbp]
	mov	edx, DWORD PTR 1300[rbp]
	mov	eax, DWORD PTR 1296[rbp]
	mov	r9d, r8d
	mov	r8d, ecx
	mov	ecx, eax
	call	updatePlayerHitbox
.L300:
	mov	eax, DWORD PTR glob_vk_down[rip]
	test	eax, eax
	je	.L301
	mov	BYTE PTR 1312[rbp], 3
	mov	edx, DWORD PTR 1300[rbp]
	movzx	eax, BYTE PTR 1318[rbp]
	movzx	eax, al
	add	eax, edx
	mov	DWORD PTR 1300[rbp], eax
	mov	r8d, DWORD PTR 1336[rbp]
	mov	ecx, DWORD PTR 1332[rbp]
	mov	edx, DWORD PTR 1300[rbp]
	mov	eax, DWORD PTR 1296[rbp]
	mov	r9d, r8d
	mov	r8d, ecx
	mov	ecx, eax
	call	updatePlayerHitbox
.L301:
	mov	edx, DWORD PTR glob_vk_right[rip]
	mov	eax, DWORD PTR glob_vk_left[rip]
	or	edx, eax
	mov	eax, DWORD PTR glob_vk_up[rip]
	or	edx, eax
	mov	eax, DWORD PTR glob_vk_down[rip]
	or	eax, edx
	test	eax, eax
	je	.L302
	movzx	edx, BYTE PTR 1313[rbp]
	movzx	eax, BYTE PTR 1314[rbp]
	add	eax, edx
	mov	BYTE PTR 1313[rbp], al
	movzx	ecx, BYTE PTR 1316[rbp]
	movzx	edx, BYTE PTR 1313[rbp]
	movzx	eax, BYTE PTR 1315[rbp]
	cmp	dl, al
	setnb	al
	add	eax, ecx
	mov	BYTE PTR 1316[rbp], al
	movzx	eax, BYTE PTR 1313[rbp]
	movzx	edx, BYTE PTR 1315[rbp]
	movzx	eax, al
	div	dl
	movzx	eax, ah
	mov	BYTE PTR 1313[rbp], al
	movzx	eax, BYTE PTR 1316[rbp]
	movzx	edx, BYTE PTR 1317[rbp]
	movzx	eax, al
	div	dl
	movzx	eax, ah
	mov	BYTE PTR 1316[rbp], al
	mov	eax, DWORD PTR 264656[rbp]
	imul	eax, DWORD PTR 264652[rbp]
	mov	edx, DWORD PTR 264668[rbp]
	sub	edx, eax
	mov	DWORD PTR 264204[rbp], edx
	mov	eax, DWORD PTR 264680[rbp]
	mov	DWORD PTR 264200[rbp], eax
	mov	eax, DWORD PTR 264684[rbp]
	mov	DWORD PTR 264196[rbp], eax
	mov	eax, DWORD PTR 264656[rbp]
	imul	eax, DWORD PTR 264648[rbp]
	mov	edx, DWORD PTR 264664[rbp]
	sub	edx, eax
	mov	DWORD PTR 264192[rbp], edx
	mov	DWORD PTR 264188[rbp], 0
	mov	eax, DWORD PTR 1296[rbp]
	cmp	DWORD PTR 264204[rbp], eax
	jl	.L303
	mov	eax, DWORD PTR 1300[rbp]
	cmp	DWORD PTR 264192[rbp], eax
	jl	.L303
	mov	eax, DWORD PTR 1296[rbp]
	cmp	DWORD PTR 264196[rbp], eax
	jg	.L303
	mov	eax, DWORD PTR 1300[rbp]
	cmp	DWORD PTR 264200[rbp], eax
	jle	.L304
.L303:
	mov	eax, 1
	jmp	.L305
.L304:
	mov	eax, 0
.L305:
	mov	DWORD PTR 264188[rbp], eax
	mov	eax, DWORD PTR 1296[rbp]
	cmp	DWORD PTR 264204[rbp], eax
	jge	.L306
	mov	eax, DWORD PTR 264196[rbp]
	mov	DWORD PTR 1296[rbp], eax
	add	DWORD PTR 264816[rbp], 1
	mov	rax, QWORD PTR 264496[rbp]
	mov	QWORD PTR 48[rsp], rax
	mov	DWORD PTR 40[rsp], 10
	mov	DWORD PTR 32[rsp], 100
	mov	r9d, 100
	mov	r8d, 100
	mov	edx, 500
	mov	ecx, 500
	call	randomSpawnEnemy
.L306:
	mov	eax, DWORD PTR 1300[rbp]
	cmp	DWORD PTR 264200[rbp], eax
	jle	.L307
	mov	eax, DWORD PTR 264192[rbp]
	mov	DWORD PTR 1300[rbp], eax
	mov	eax, DWORD PTR 264384[rbp]
	sub	DWORD PTR 264816[rbp], eax
	mov	rax, QWORD PTR 264496[rbp]
	mov	QWORD PTR 48[rsp], rax
	mov	DWORD PTR 40[rsp], 10
	mov	DWORD PTR 32[rsp], 100
	mov	r9d, 100
	mov	r8d, 100
	mov	edx, 500
	mov	ecx, 500
	call	randomSpawnEnemy
.L307:
	mov	eax, DWORD PTR 1296[rbp]
	cmp	DWORD PTR 264196[rbp], eax
	jle	.L308
	mov	eax, DWORD PTR 264204[rbp]
	mov	DWORD PTR 1296[rbp], eax
	sub	DWORD PTR 264816[rbp], 1
	mov	rax, QWORD PTR 264496[rbp]
	mov	QWORD PTR 48[rsp], rax
	mov	DWORD PTR 40[rsp], 10
	mov	DWORD PTR 32[rsp], 100
	mov	r9d, 100
	mov	r8d, 100
	mov	edx, 500
	mov	ecx, 500
	call	randomSpawnEnemy
.L308:
	mov	eax, DWORD PTR 1300[rbp]
	cmp	DWORD PTR 264192[rbp], eax
	jge	.L309
	mov	eax, DWORD PTR 264200[rbp]
	mov	DWORD PTR 1300[rbp], eax
	mov	eax, DWORD PTR 264384[rbp]
	add	DWORD PTR 264816[rbp], eax
	mov	rax, QWORD PTR 264496[rbp]
	mov	QWORD PTR 48[rsp], rax
	mov	DWORD PTR 40[rsp], 10
	mov	DWORD PTR 32[rsp], 100
	mov	r9d, 100
	mov	r8d, 100
	mov	edx, 500
	mov	ecx, 500
	call	randomSpawnEnemy
.L309:
	cmp	DWORD PTR 264188[rbp], 0
	je	.L310
	mov	eax, DWORD PTR 264396[rbp]
	add	DWORD PTR 264816[rbp], eax
	mov	eax, DWORD PTR 264816[rbp]
	cdq
	idiv	DWORD PTR 264396[rbp]
	mov	DWORD PTR 264816[rbp], edx
	lea	rax, 1424[rbp]
	mov	ecx, DWORD PTR 264816[rbp]
	mov	rdx, rax
	call	level_get_name
	mov	eax, DWORD PTR 264816[rbp]
	lea	edx, 31[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 5
	mov	r8d, eax
	movsx	rax, r8d
	mov	edx, DWORD PTR 1360[rbp+rax*4]
	mov	eax, DWORD PTR 264816[rbp]
	and	eax, 31
	mov	r9d, 1
	mov	ecx, eax
	sal	r9d, cl
	mov	eax, r9d
	or	edx, eax
	movsx	rax, r8d
	mov	DWORD PTR 1360[rbp+rax*4], edx
	jmp	.L310
.L302:
	mov	BYTE PTR 1313[rbp], 0
	mov	BYTE PTR 1316[rbp], 0
.L310:
	mov	edx, DWORD PTR glob_vk_space[rip]
	mov	eax, DWORD PTR glob_vk_enter[rip]
	or	eax, edx
	test	eax, eax
	je	.L311
	mov	DWORD PTR 264812[rbp], 0
.L311:
	mov	eax, DWORD PTR 1296[rbp]
	mov	DWORD PTR 1304[rbp], eax
	mov	eax, DWORD PTR 1300[rbp]
	mov	DWORD PTR 1308[rbp], eax
	mov	DWORD PTR 264804[rbp], 0
	jmp	.L312
.L316:
	mov	rdx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 264804[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	mov	eax, DWORD PTR 12[rax]
	test	eax, eax
	je	.L313
	mov	rdx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 264804[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	movss	xmm1, DWORD PTR 4[rax]
	mov	rdx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 264804[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	movss	xmm0, DWORD PTR 8[rax]
	mov	rdx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 264804[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	addss	xmm0, xmm1
	movss	DWORD PTR 4[rax], xmm0
	mov	rdx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 264804[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	movss	xmm0, DWORD PTR 4[rax]
	pxor	xmm1, xmm1
	cvtsi2ss	xmm1, DWORD PTR 264688[rbp]
	comiss	xmm0, xmm1
	jbe	.L313
	call	rand
	mov	edx, eax
	movsx	rax, edx
	imul	rax, rax, 1374389535
	shr	rax, 32
	sar	eax, 5
	mov	ecx, edx
	sar	ecx, 31
	sub	eax, ecx
	imul	ecx, eax, 100
	mov	eax, edx
	sub	eax, ecx
	cmp	eax, 4
	jg	.L315
	mov	rdx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 264804[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	mov	DWORD PTR 12[rax], 0
	jmp	.L313
.L315:
	mov	ecx, DWORD PTR 264688[rbp]
	mov	edx, DWORD PTR 264692[rbp]
	mov	eax, DWORD PTR 264804[rbp]
	mov	r8d, ecx
	mov	ecx, eax
	call	createWaterParticle
.L313:
	add	DWORD PTR 264804[rbp], 1
.L312:
	mov	eax, 100
	cmp	DWORD PTR 264804[rbp], eax
	jl	.L316
	mov	eax, DWORD PTR 264452[rbp]
	add	DWORD PTR 264828[rbp], eax
	jmp	.L317
.L318:
	add	DWORD PTR 264832[rbp], 1
	mov	eax, DWORD PTR 264456[rbp]
	sub	DWORD PTR 264828[rbp], eax
.L317:
	mov	eax, DWORD PTR 264828[rbp]
	cmp	eax, DWORD PTR 264456[rbp]
	jge	.L318
	mov	eax, DWORD PTR 264832[rbp]
	cmp	eax, DWORD PTR 264460[rbp]
	setge	al
	movzx	eax, al
	mov	edx, DWORD PTR 264824[rbp]
	add	eax, edx
	movsx	rdx, eax
	imul	rdx, rdx, -1840700269
	shr	rdx, 32
	add	edx, eax
	sar	edx, 2
	mov	ecx, eax
	sar	ecx, 31
	sub	edx, ecx
	mov	DWORD PTR 264824[rbp], edx
	mov	ecx, DWORD PTR 264824[rbp]
	mov	edx, ecx
	sal	edx, 3
	sub	edx, ecx
	sub	eax, edx
	mov	DWORD PTR 264824[rbp], eax
	mov	eax, DWORD PTR 264832[rbp]
	cmp	eax, DWORD PTR 264460[rbp]
	setge	al
	movzx	eax, al
	mov	edx, DWORD PTR 264820[rbp]
	add	eax, edx
	movsx	rdx, eax
	imul	rdx, rdx, -1840700269
	shr	rdx, 32
	add	edx, eax
	sar	edx, 4
	mov	ecx, eax
	sar	ecx, 31
	sub	edx, ecx
	mov	DWORD PTR 264820[rbp], edx
	mov	edx, DWORD PTR 264820[rbp]
	imul	edx, edx, 28
	sub	eax, edx
	mov	DWORD PTR 264820[rbp], eax
	mov	eax, DWORD PTR 264832[rbp]
	cdq
	idiv	DWORD PTR 264460[rbp]
	mov	DWORD PTR 264832[rbp], edx
	mov	eax, DWORD PTR 264828[rbp]
	cdq
	idiv	DWORD PTR 264456[rbp]
	mov	DWORD PTR 264828[rbp], edx
	lea	rdx, 1355[rbp]
	lea	rax, 1220[rbp]
	mov	rcx, rax
	call	strcpy
	cmp	DWORD PTR 264360[rbp], 0
	js	.L319
	mov	eax, 43
	jmp	.L320
.L319:
	mov	eax, 45
.L320:
	mov	BYTE PTR 1220[rbp], al
	mov	eax, DWORD PTR 264360[rbp]
	movsx	rdx, eax
	imul	rdx, rdx, 1717986919
	shr	rdx, 32
	sar	edx, 2
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	add	eax, 48
	mov	BYTE PTR 1221[rbp], al
	mov	ecx, DWORD PTR 264360[rbp]
	movsx	rax, ecx
	imul	rax, rax, 1717986919
	shr	rax, 32
	mov	edx, eax
	sar	edx, 2
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	add	eax, eax
	sub	ecx, eax
	mov	edx, ecx
	mov	eax, edx
	add	eax, 48
	mov	BYTE PTR 1222[rbp], al
	mov	eax, 42
	mov	BYTE PTR 1223[rbp], al
	cmp	DWORD PTR 264364[rbp], 0
	jne	.L321
	mov	eax, 67
	jmp	.L322
.L321:
	mov	eax, 70
.L322:
	mov	BYTE PTR 1224[rbp], al
	mov	edx, 0
	mov	rax, QWORD PTR 264624[rbp]
	mov	rcx, rax
	call	draw_clear
	mov	edx, 16777215
	mov	rax, QWORD PTR 264624[rbp]
	mov	rcx, rax
	call	draw_set_color
	mov	edx, 33023
	mov	ecx, DWORD PTR 264684[rbp]
	mov	rax, QWORD PTR 264624[rbp]
	mov	DWORD PTR 40[rsp], edx
	mov	edx, DWORD PTR 264688[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, ecx
	mov	r8d, 0
	mov	edx, 0
	mov	rcx, rax
	call	draw_rectangle_color
	mov	ecx, DWORD PTR 264684[rbp]
	mov	rax, QWORD PTR 264624[rbp]
	mov	rdx, QWORD PTR 264504[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	edx, DWORD PTR 264688[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, ecx
	mov	r8d, 0
	mov	edx, 0
	mov	rcx, rax
	call	draw_image
	mov	ecx, 8388863
	mov	eax, DWORD PTR 264692[rbp]
	sub	eax, DWORD PTR 264684[rbp]
	mov	r8d, eax
	mov	edx, DWORD PTR 264684[rbp]
	mov	rax, QWORD PTR 264624[rbp]
	mov	DWORD PTR 40[rsp], ecx
	mov	ecx, DWORD PTR 264688[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	r9d, r8d
	mov	r8d, 0
	mov	rcx, rax
	call	draw_rectangle_color
	mov	edx, 33023
	mov	eax, DWORD PTR 264692[rbp]
	sub	eax, DWORD PTR 264684[rbp]
	mov	r8d, DWORD PTR 264692[rbp]
	mov	rcx, QWORD PTR 264624[rbp]
	mov	DWORD PTR 40[rsp], edx
	mov	edx, DWORD PTR 264688[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, r8d
	mov	r8d, 0
	mov	edx, eax
	call	draw_rectangle_color
	mov	eax, DWORD PTR 264692[rbp]
	sub	eax, DWORD PTR 264684[rbp]
	mov	r8d, DWORD PTR 264692[rbp]
	mov	rcx, QWORD PTR 264624[rbp]
	mov	rdx, QWORD PTR 264504[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	edx, DWORD PTR 264688[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, r8d
	mov	r8d, 0
	mov	edx, eax
	call	draw_image
	mov	DWORD PTR 264184[rbp], 0
	mov	eax, DWORD PTR 264652[rbp]
	mov	DWORD PTR 264180[rbp], eax
	mov	eax, DWORD PTR 264648[rbp]
	mov	DWORD PTR 264176[rbp], eax
	cmp	DWORD PTR 264812[rbp], 0
	jne	.L323
	mov	eax, DWORD PTR 264472[rbp]
	imul	eax, DWORD PTR 264648[rbp]
	mov	ecx, eax
	mov	eax, DWORD PTR 264476[rbp]
	imul	eax, DWORD PTR 264652[rbp]
	mov	r9d, eax
	mov	r10d, DWORD PTR 264176[rbp]
	mov	edx, DWORD PTR 264180[rbp]
	mov	rax, QWORD PTR 264624[rbp]
	mov	r8d, DWORD PTR 264184[rbp]
	mov	DWORD PTR 72[rsp], r8d
	mov	r8d, DWORD PTR 264472[rbp]
	mov	DWORD PTR 64[rsp], r8d
	mov	r8d, DWORD PTR 264476[rbp]
	mov	DWORD PTR 56[rsp], r8d
	lea	r8, .LC87[rip]
	mov	QWORD PTR 48[rsp], r8
	mov	r8, QWORD PTR 264480[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_text_color
	mov	eax, DWORD PTR 264472[rbp]
	imul	eax, DWORD PTR 264648[rbp]
	add	DWORD PTR 264176[rbp], eax
	mov	DWORD PTR 264172[rbp], 200
	mov	DWORD PTR 264168[rbp], 20
	mov	eax, DWORD PTR health[rip]
	imul	eax, DWORD PTR 264172[rbp]
	mov	edi, DWORD PTR maxHealth[rip]
	cdq
	idiv	edi
	mov	DWORD PTR 264164[rbp], eax
	mov	DWORD PTR 264160[rbp], 255
	mov	r9d, 0
	mov	edx, DWORD PTR 264176[rbp]
	mov	eax, DWORD PTR 264168[rbp]
	add	edx, eax
	mov	r8d, DWORD PTR 264172[rbp]
	mov	ecx, DWORD PTR 264176[rbp]
	mov	rax, QWORD PTR 264624[rbp]
	mov	DWORD PTR 40[rsp], r9d
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, r8d
	mov	r8d, ecx
	mov	edx, 0
	mov	rcx, rax
	call	draw_rectangle_color
	mov	edx, DWORD PTR 264176[rbp]
	mov	eax, DWORD PTR 264168[rbp]
	add	edx, eax
	mov	r9d, DWORD PTR 264164[rbp]
	mov	r8d, DWORD PTR 264176[rbp]
	mov	rax, QWORD PTR 264624[rbp]
	mov	ecx, DWORD PTR 264160[rbp]
	mov	DWORD PTR 40[rsp], ecx
	mov	DWORD PTR 32[rsp], edx
	mov	edx, 0
	mov	rcx, rax
	call	draw_rectangle_color
	mov	eax, DWORD PTR 264168[rbp]
	add	DWORD PTR 264176[rbp], eax
	mov	DWORD PTR 264156[rbp], 0
	mov	DWORD PTR 264152[rbp], 32
	mov	DWORD PTR 264800[rbp], 0
	jmp	.L324
.L325:
	add	DWORD PTR 264800[rbp], 1
.L324:
	cmp	DWORD PTR 264800[rbp], 3
	jle	.L325
.L323:
	mov	edx, DWORD PTR 264652[rbp]
	mov	eax, DWORD PTR 264668[rbp]
	add	eax, edx
	mov	DWORD PTR 264180[rbp], eax
	mov	eax, DWORD PTR 264648[rbp]
	mov	DWORD PTR 264176[rbp], eax
	cmp	DWORD PTR 264812[rbp], 0
	jne	.L326
	mov	rax, rsp
	mov	r13, rax
	lea	rax, .LC88[rip]
	mov	QWORD PTR 264144[rbp], rax
	mov	rax, QWORD PTR 264144[rbp]
	mov	rcx, rax
	call	strlen
	mov	rdx, rax
	sub	rdx, 1
	mov	QWORD PTR 264136[rbp], rdx
	mov	r14, rax
	mov	r15d, 0
	mov	QWORD PTR -48[rbp], rax
	mov	QWORD PTR -40[rbp], 0
	add	rax, 15
	shr	rax, 4
	sal	rax, 4
	call	___chkstk_ms
	sub	rsp, rax
	lea	rax, 80[rsp]
	add	rax, 0
	mov	QWORD PTR 264128[rbp], rax
	mov	rdx, QWORD PTR 264144[rbp]
	mov	rax, QWORD PTR 264128[rbp]
	mov	rcx, rax
	call	strcpy
	mov	eax, DWORD PTR 264816[rbp]
	mov	WORD PTR 264126[rbp], ax
	movzx	eax, WORD PTR 264126[rbp]
	shr	ax, 2
	movzx	eax, ax
	imul	eax, eax, 5243
	shr	eax, 16
	mov	ecx, eax
	shr	cx
	movzx	eax, cx
	imul	eax, eax, 52429
	shr	eax, 16
	mov	edx, eax
	shr	dx, 3
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	add	eax, eax
	sub	ecx, eax
	mov	edx, ecx
	mov	eax, edx
	lea	ebx, 48[rax]
	mov	rax, QWORD PTR 264128[rbp]
	mov	rdx, rax
	lea	rax, .LC89[rip]
	mov	rcx, rax
	call	string_pos
	mov	ecx, ebx
	mov	rdx, QWORD PTR 264128[rbp]
	cdqe
	mov	BYTE PTR [rdx+rax], cl
	movzx	eax, WORD PTR 264126[rbp]
	movzx	eax, ax
	imul	eax, eax, 52429
	shr	eax, 16
	mov	ecx, eax
	shr	cx, 3
	movzx	eax, cx
	imul	eax, eax, 52429
	shr	eax, 16
	mov	edx, eax
	shr	dx, 3
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	add	eax, eax
	sub	ecx, eax
	mov	edx, ecx
	mov	eax, edx
	lea	ebx, 48[rax]
	mov	rax, QWORD PTR 264128[rbp]
	mov	rdx, rax
	lea	rax, .LC90[rip]
	mov	rcx, rax
	call	string_pos
	mov	ecx, ebx
	mov	rdx, QWORD PTR 264128[rbp]
	cdqe
	mov	BYTE PTR [rdx+rax], cl
	movzx	ecx, WORD PTR 264126[rbp]
	movzx	eax, cx
	imul	eax, eax, 52429
	shr	eax, 16
	mov	edx, eax
	shr	dx, 3
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	add	eax, eax
	sub	ecx, eax
	mov	edx, ecx
	mov	eax, edx
	lea	ebx, 48[rax]
	mov	rax, QWORD PTR 264128[rbp]
	mov	rdx, rax
	lea	rax, .LC91[rip]
	mov	rcx, rax
	call	string_pos
	mov	ecx, ebx
	mov	rdx, QWORD PTR 264128[rbp]
	cdqe
	mov	BYTE PTR [rdx+rax], cl
	mov	eax, DWORD PTR 264472[rbp]
	imul	eax, DWORD PTR 264648[rbp]
	mov	ecx, eax
	mov	eax, DWORD PTR 264476[rbp]
	imul	eax, DWORD PTR 264652[rbp]
	mov	r9d, eax
	mov	r10d, DWORD PTR 264176[rbp]
	mov	edx, DWORD PTR 264180[rbp]
	mov	rax, QWORD PTR 264624[rbp]
	mov	r8d, DWORD PTR 264184[rbp]
	mov	DWORD PTR 72[rsp], r8d
	mov	r8d, DWORD PTR 264472[rbp]
	mov	DWORD PTR 64[rsp], r8d
	mov	r8d, DWORD PTR 264476[rbp]
	mov	DWORD PTR 56[rsp], r8d
	mov	r8, QWORD PTR 264128[rbp]
	mov	QWORD PTR 48[rsp], r8
	mov	r8, QWORD PTR 264480[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_text_color
	mov	eax, DWORD PTR 264472[rbp]
	imul	eax, DWORD PTR 264648[rbp]
	mov	ecx, eax
	mov	eax, DWORD PTR 264476[rbp]
	imul	eax, DWORD PTR 264652[rbp]
	mov	r9d, eax
	mov	eax, DWORD PTR 264472[rbp]
	imul	eax, DWORD PTR 264648[rbp]
	mov	edx, DWORD PTR 264176[rbp]
	lea	r10d, [rax+rdx]
	mov	edx, DWORD PTR 264180[rbp]
	mov	rax, QWORD PTR 264624[rbp]
	mov	r8d, DWORD PTR 264184[rbp]
	mov	DWORD PTR 72[rsp], r8d
	mov	r8d, DWORD PTR 264472[rbp]
	mov	DWORD PTR 64[rsp], r8d
	mov	r8d, DWORD PTR 264476[rbp]
	mov	DWORD PTR 56[rsp], r8d
	lea	r8, 1424[rbp]
	mov	QWORD PTR 48[rsp], r8
	mov	r8, QWORD PTR 264480[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_text_color
	mov	eax, DWORD PTR 264180[rbp]
	mov	DWORD PTR 264120[rbp], eax
	mov	eax, DWORD PTR 264472[rbp]
	imul	eax, DWORD PTR 264648[rbp]
	lea	edx, [rax+rax]
	mov	eax, DWORD PTR 264176[rbp]
	add	eax, edx
	mov	DWORD PTR 264116[rbp], eax
	mov	eax, DWORD PTR 264120[rbp]
	add	eax, 256
	mov	DWORD PTR 264112[rbp], eax
	mov	eax, DWORD PTR 264116[rbp]
	add	eax, 256
	mov	DWORD PTR 264108[rbp], eax
	mov	r9d, DWORD PTR 264112[rbp]
	mov	r8d, DWORD PTR 264116[rbp]
	mov	edx, DWORD PTR 264120[rbp]
	mov	rax, QWORD PTR 264624[rbp]
	mov	rcx, QWORD PTR 264376[rbp]
	mov	QWORD PTR 40[rsp], rcx
	mov	ecx, DWORD PTR 264108[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_image
	mov	DWORD PTR 264796[rbp], 0
	jmp	.L327
.L329:
	mov	edx, DWORD PTR 264796[rbp]
	mov	eax, edx
	sar	eax, 31
	shr	eax, 27
	add	edx, eax
	and	edx, 31
	sub	edx, eax
	mov	ecx, edx
	mov	eax, DWORD PTR 264796[rbp]
	lea	edx, 31[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 5
	cdqe
	mov	eax, DWORD PTR 1360[rbp+rax*4]
	mov	edx, ecx
	mov	ecx, eax
	call	BG
	test	eax, eax
	jne	.L328
	mov	eax, DWORD PTR 264796[rbp]
	lea	edx, 15[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 4
	add	eax, 1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC92[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 264108[rbp]
	pxor	xmm5, xmm5
	cvtsi2sd	xmm5, DWORD PTR 264116[rbp]
	movq	rax, xmm5
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	lerp
	cvttsd2si	ebx, xmm0
	mov	edx, DWORD PTR 264796[rbp]
	mov	eax, edx
	sar	eax, 31
	shr	eax, 28
	add	edx, eax
	and	edx, 15
	sub	edx, eax
	mov	eax, edx
	add	eax, 1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC92[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 264112[rbp]
	pxor	xmm3, xmm3
	cvtsi2sd	xmm3, DWORD PTR 264120[rbp]
	movq	rax, xmm3
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	lerp
	cvttsd2si	edi, xmm0
	mov	eax, DWORD PTR 264796[rbp]
	lea	edx, 15[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 4
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC92[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 264108[rbp]
	pxor	xmm4, xmm4
	cvtsi2sd	xmm4, DWORD PTR 264116[rbp]
	movq	rax, xmm4
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	lerp
	cvttsd2si	esi, xmm0
	mov	edx, DWORD PTR 264796[rbp]
	mov	eax, edx
	sar	eax, 31
	shr	eax, 28
	add	edx, eax
	and	edx, 15
	sub	edx, eax
	mov	eax, edx
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC92[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 264112[rbp]
	pxor	xmm5, xmm5
	cvtsi2sd	xmm5, DWORD PTR 264120[rbp]
	movq	rax, xmm5
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	lerp
	cvttsd2si	eax, xmm0
	mov	rcx, QWORD PTR 264624[rbp]
	mov	rdx, QWORD PTR 264368[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	DWORD PTR 32[rsp], ebx
	mov	r9d, edi
	mov	r8d, esi
	mov	edx, eax
	call	draw_image
.L328:
	add	DWORD PTR 264796[rbp], 1
.L327:
	cmp	DWORD PTR 264796[rbp], 255
	jle	.L329
	movzx	eax, WORD PTR 264126[rbp]
	mov	r8d, 0
	mov	edx, 4
	mov	ecx, eax
	call	BGG
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC92[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 264112[rbp]
	pxor	xmm3, xmm3
	cvtsi2sd	xmm3, DWORD PTR 264120[rbp]
	movq	rax, xmm3
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	lerp
	cvttsd2si	eax, xmm0
	mov	DWORD PTR 264104[rbp], eax
	mov	ecx, 255
	mov	eax, DWORD PTR 264104[rbp]
	lea	r9d, 1[rax]
	mov	eax, DWORD PTR 264104[rbp]
	lea	edx, -1[rax]
	mov	r8d, DWORD PTR 264116[rbp]
	mov	rax, QWORD PTR 264624[rbp]
	mov	DWORD PTR 40[rsp], ecx
	mov	ecx, DWORD PTR 264108[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_rectangle_color
	movzx	eax, WORD PTR 264126[rbp]
	mov	r8d, 1
	mov	edx, 4
	mov	ecx, eax
	call	BGG
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC92[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 264108[rbp]
	pxor	xmm4, xmm4
	cvtsi2sd	xmm4, DWORD PTR 264116[rbp]
	movq	rax, xmm4
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	lerp
	cvttsd2si	eax, xmm0
	mov	DWORD PTR 264100[rbp], eax
	mov	r10d, 255
	mov	eax, DWORD PTR 264100[rbp]
	lea	ecx, 1[rax]
	mov	eax, DWORD PTR 264100[rbp]
	lea	r8d, -1[rax]
	mov	r9d, DWORD PTR 264112[rbp]
	mov	edx, DWORD PTR 264120[rbp]
	mov	rax, QWORD PTR 264624[rbp]
	mov	DWORD PTR 40[rsp], r10d
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_rectangle_color
	movzx	eax, WORD PTR 264126[rbp]
	shr	ax, 8
	test	ax, ax
	jne	.L330
	mov	esi, 255
	movzx	eax, WORD PTR 264126[rbp]
	mov	r8d, 1
	mov	edx, 4
	mov	ecx, eax
	call	BGG
	add	eax, 1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC92[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 264108[rbp]
	pxor	xmm5, xmm5
	cvtsi2sd	xmm5, DWORD PTR 264116[rbp]
	movq	rax, xmm5
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	lerp
	cvttsd2si	ebx, xmm0
	movzx	eax, WORD PTR 264126[rbp]
	mov	r8d, 0
	mov	edx, 4
	mov	ecx, eax
	call	BGG
	add	eax, 1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC92[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 264112[rbp]
	pxor	xmm3, xmm3
	cvtsi2sd	xmm3, DWORD PTR 264120[rbp]
	movq	rax, xmm3
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	lerp
	cvttsd2si	ecx, xmm0
	mov	r8d, DWORD PTR 264100[rbp]
	mov	edx, DWORD PTR 264104[rbp]
	mov	rax, QWORD PTR 264624[rbp]
	mov	DWORD PTR 40[rsp], esi
	mov	DWORD PTR 32[rsp], ebx
	mov	r9d, ecx
	mov	rcx, rax
	call	draw_rectangle_color
.L330:
	mov	DWORD PTR 264792[rbp], 0
	mov	eax, DWORD PTR 264648[rbp]
	sal	eax, 5
	mov	edx, eax
	mov	eax, DWORD PTR 264108[rbp]
	add	eax, edx
	mov	DWORD PTR 264096[rbp], eax
	mov	edx, DWORD PTR 264184[rbp]
	mov	rax, QWORD PTR 264624[rbp]
	mov	rcx, rax
	call	draw_set_color
	mov	DWORD PTR 264788[rbp], 0
	jmp	.L331
.L334:
	mov	edx, DWORD PTR 264832[rbp]
	movsx	rax, edx
	imul	rax, rax, 1717986919
	shr	rax, 32
	mov	ecx, eax
	sar	ecx, 2
	mov	eax, edx
	sar	eax, 31
	sub	ecx, eax
	mov	eax, ecx
	sal	eax, 2
	add	eax, ecx
	add	eax, eax
	mov	ecx, edx
	sub	ecx, eax
	mov	eax, DWORD PTR 264832[rbp]
	movsx	rdx, eax
	imul	rdx, rdx, 1717986919
	shr	rdx, 32
	sar	edx, 2
	sar	eax, 31
	sub	edx, eax
	mov	r8d, edx
	movsx	rax, r8d
	imul	rax, rax, 715827883
	shr	rax, 32
	mov	rdx, rax
	mov	eax, r8d
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	add	eax, eax
	add	eax, edx
	add	eax, eax
	mov	edx, r8d
	sub	edx, eax
	mov	eax, DWORD PTR 264832[rbp]
	movsx	r8, eax
	imul	r8, r8, -2004318071
	shr	r8, 32
	add	r8d, eax
	sar	r8d, 5
	sar	eax, 31
	mov	r9d, r8d
	sub	r9d, eax
	movsx	rax, r9d
	imul	rax, rax, 1717986919
	shr	rax, 32
	mov	r8d, eax
	sar	r8d, 2
	mov	eax, r9d
	sar	eax, 31
	sub	r8d, eax
	mov	eax, r8d
	sal	eax, 2
	add	eax, r8d
	add	eax, eax
	sub	r9d, eax
	mov	r8d, r9d
	mov	eax, DWORD PTR 264832[rbp]
	movsx	r9, eax
	imul	r9, r9, 458129845
	shr	r9, 32
	sar	r9d, 6
	sar	eax, 31
	mov	r10d, r9d
	sub	r10d, eax
	mov	eax, DWORD PTR 264788[rbp]
	mov	DWORD PTR 40[rsp], ecx
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, 737
	mov	edx, r10d
	mov	ecx, eax
	call	mux_int
	mov	DWORD PTR 264064[rbp], eax
	cmp	DWORD PTR 264788[rbp], 2
	je	.L332
	mov	eax, DWORD PTR 264064[rbp]
	sal	eax, 4
	mov	ecx, eax
	mov	eax, DWORD PTR 264788[rbp]
	add	eax, 1
	imul	eax, DWORD PTR 264652[rbp]
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR 264180[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 264792[rbp]
	lea	r9d, [rdx+rax]
	mov	eax, DWORD PTR 264788[rbp]
	imul	eax, DWORD PTR 264652[rbp]
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR 264180[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 264792[rbp]
	add	edx, eax
	mov	r8d, DWORD PTR 264108[rbp]
	mov	rax, QWORD PTR 264624[rbp]
	mov	DWORD PTR 72[rsp], 32
	mov	DWORD PTR 64[rsp], 16
	mov	DWORD PTR 56[rsp], 0
	mov	DWORD PTR 48[rsp], ecx
	mov	rcx, QWORD PTR 264464[rbp]
	mov	QWORD PTR 40[rsp], rcx
	mov	ecx, DWORD PTR 264096[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_image_part
	mov	eax, DWORD PTR 264652[rbp]
	add	DWORD PTR 264792[rbp], eax
	jmp	.L333
.L332:
	mov	eax, DWORD PTR 264472[rbp]
	imul	eax, DWORD PTR 264648[rbp]
	mov	ecx, eax
	mov	eax, DWORD PTR 264476[rbp]
	imul	eax, DWORD PTR 264652[rbp]
	mov	r9d, eax
	mov	eax, DWORD PTR 264652[rbp]
	sal	eax, 5
	mov	edx, eax
	mov	eax, DWORD PTR 264180[rbp]
	add	edx, eax
	mov	r10d, DWORD PTR 264108[rbp]
	mov	rax, QWORD PTR 264624[rbp]
	mov	r8d, DWORD PTR 264184[rbp]
	mov	DWORD PTR 72[rsp], r8d
	mov	r8d, DWORD PTR 264472[rbp]
	mov	DWORD PTR 64[rsp], r8d
	mov	r8d, DWORD PTR 264476[rbp]
	mov	DWORD PTR 56[rsp], r8d
	lea	r8, .LC93[rip]
	mov	QWORD PTR 48[rsp], r8
	mov	r8, QWORD PTR 264480[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_text_color
.L333:
	add	DWORD PTR 264788[rbp], 1
.L331:
	cmp	DWORD PTR 264788[rbp], 4
	jle	.L334
	mov	edx, 16777215
	mov	rax, QWORD PTR 264624[rbp]
	mov	rcx, rax
	call	draw_set_color
	mov	DWORD PTR 264092[rbp], 0
	mov	eax, DWORD PTR 264832[rbp]
	mov	DWORD PTR 32[rsp], 59
	mov	r9d, 5
	mov	r8d, 0
	mov	edx, 0
	mov	ecx, eax
	call	clock_is_between
	test	eax, eax
	je	.L335
	mov	DWORD PTR 264092[rbp], 0
.L335:
	mov	eax, DWORD PTR 264832[rbp]
	mov	DWORD PTR 32[rsp], 59
	mov	r9d, 11
	mov	r8d, 0
	mov	edx, 6
	mov	ecx, eax
	call	clock_is_between
	test	eax, eax
	je	.L336
	mov	DWORD PTR 264092[rbp], 1
.L336:
	mov	eax, DWORD PTR 264832[rbp]
	mov	DWORD PTR 32[rsp], 59
	mov	r9d, 17
	mov	r8d, 0
	mov	edx, 12
	mov	ecx, eax
	call	clock_is_between
	test	eax, eax
	je	.L337
	mov	DWORD PTR 264092[rbp], 2
.L337:
	mov	eax, DWORD PTR 264832[rbp]
	mov	DWORD PTR 32[rsp], 59
	mov	r9d, 23
	mov	r8d, 0
	mov	edx, 18
	mov	ecx, eax
	call	clock_is_between
	test	eax, eax
	je	.L338
	mov	DWORD PTR 264092[rbp], 3
.L338:
	movsd	xmm0, QWORD PTR .LC94[rip]
	movsd	QWORD PTR 264080[rbp], xmm0
	mov	r10d, 255
	mov	edx, DWORD PTR 264096[rbp]
	mov	eax, DWORD PTR 264648[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 264472[rbp]
	imul	eax, DWORD PTR 264648[rbp]
	lea	ecx, [rdx+rax]
	mov	eax, DWORD PTR 264476[rbp]
	imul	eax, DWORD PTR 264824[rbp]
	imul	eax, DWORD PTR 264652[rbp]
	mov	edx, DWORD PTR 264180[rbp]
	add	edx, eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 264824[rbp]
	movapd	xmm1, xmm0
	mulsd	xmm1, QWORD PTR 264080[rbp]
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 264652[rbp]
	mulsd	xmm0, xmm1
	cvttsd2si	eax, xmm0
	add	edx, eax
	mov	eax, DWORD PTR 264476[rbp]
	imul	eax, DWORD PTR 264652[rbp]
	lea	r9d, [rdx+rax]
	mov	edx, DWORD PTR 264096[rbp]
	mov	eax, DWORD PTR 264648[rbp]
	lea	r8d, [rdx+rax]
	mov	eax, DWORD PTR 264476[rbp]
	imul	eax, DWORD PTR 264824[rbp]
	imul	eax, DWORD PTR 264652[rbp]
	mov	edx, DWORD PTR 264180[rbp]
	add	edx, eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 264824[rbp]
	movapd	xmm1, xmm0
	mulsd	xmm1, QWORD PTR 264080[rbp]
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 264652[rbp]
	mulsd	xmm0, xmm1
	cvttsd2si	eax, xmm0
	add	edx, eax
	mov	rax, QWORD PTR 264624[rbp]
	mov	DWORD PTR 40[rsp], r10d
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_rectangle_color
	mov	DWORD PTR 264784[rbp], 0
	jmp	.L339
.L344:
	cmp	DWORD PTR 264784[rbp], 6
	jne	.L340
	mov	eax, 255
	jmp	.L341
.L340:
	mov	eax, 0
.L341:
	mov	DWORD PTR 264068[rbp], eax
	mov	eax, DWORD PTR 264784[rbp]
	cmp	eax, DWORD PTR 264824[rbp]
	jne	.L342
	mov	eax, 16777215
	jmp	.L343
.L342:
	mov	eax, DWORD PTR 264068[rbp]
.L343:
	mov	DWORD PTR 264068[rbp], eax
	mov	eax, DWORD PTR 264784[rbp]
	cdqe
	mov	rdx, QWORD PTR 264408[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	mov	BYTE PTR 1182[rbp], al
	mov	eax, DWORD PTR 264472[rbp]
	imul	eax, DWORD PTR 264648[rbp]
	mov	ecx, eax
	mov	eax, DWORD PTR 264476[rbp]
	imul	eax, DWORD PTR 264652[rbp]
	mov	r9d, eax
	mov	edx, DWORD PTR 264096[rbp]
	mov	eax, DWORD PTR 264648[rbp]
	lea	r10d, [rdx+rax]
	mov	eax, DWORD PTR 264476[rbp]
	imul	eax, DWORD PTR 264784[rbp]
	imul	eax, DWORD PTR 264652[rbp]
	mov	edx, DWORD PTR 264180[rbp]
	add	edx, eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 264784[rbp]
	movapd	xmm1, xmm0
	mulsd	xmm1, QWORD PTR 264080[rbp]
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 264652[rbp]
	mulsd	xmm0, xmm1
	cvttsd2si	eax, xmm0
	add	edx, eax
	mov	rax, QWORD PTR 264624[rbp]
	mov	r8d, DWORD PTR 264068[rbp]
	mov	DWORD PTR 72[rsp], r8d
	mov	r8d, DWORD PTR 264472[rbp]
	mov	DWORD PTR 64[rsp], r8d
	mov	r8d, DWORD PTR 264476[rbp]
	mov	DWORD PTR 56[rsp], r8d
	lea	r8, 1182[rbp]
	mov	QWORD PTR 48[rsp], r8
	mov	r8, QWORD PTR 264480[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_text_color
	add	DWORD PTR 264784[rbp], 1
.L339:
	cmp	DWORD PTR 264784[rbp], 6
	jle	.L344
	mov	eax, DWORD PTR 264820[rbp]
	add	eax, 1
	movsx	rdx, eax
	imul	rdx, rdx, 1717986919
	shr	rdx, 32
	sar	edx, 2
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	add	eax, 48
	mov	BYTE PTR 263591[rbp], al
	mov	eax, DWORD PTR 264820[rbp]
	lea	ecx, 1[rax]
	movsx	rax, ecx
	imul	rax, rax, 1717986919
	shr	rax, 32
	mov	edx, eax
	sar	edx, 2
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	add	eax, eax
	sub	ecx, eax
	mov	edx, ecx
	mov	eax, edx
	add	eax, 48
	mov	BYTE PTR 263592[rbp], al
	mov	eax, DWORD PTR 264820[rbp]
	lea	ecx, 1[rax]
	movsx	rax, ecx
	imul	rax, rax, 1717986919
	shr	rax, 32
	mov	edx, eax
	sar	edx, 3
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 2
	sub	ecx, eax
	mov	edx, ecx
	cmp	edx, 3
	jg	.L345
	mov	eax, DWORD PTR 264820[rbp]
	lea	edx, 1[rax]
	movsx	rax, edx
	imul	rax, rax, 1717986919
	shr	rax, 32
	mov	ecx, eax
	sar	ecx, 3
	mov	eax, edx
	sar	eax, 31
	sub	ecx, eax
	mov	eax, ecx
	sal	eax, 2
	add	eax, ecx
	sal	eax, 2
	mov	ecx, edx
	sub	ecx, eax
	mov	DWORD PTR 32[rsp], 14
	mov	r9d, 10
	mov	r8d, 15
	mov	edx, 16
	call	mux_int
	add	eax, 100
	jmp	.L346
.L345:
	mov	eax, 116
.L346:
	mov	BYTE PTR 263593[rbp], al
	mov	eax, DWORD PTR 264820[rbp]
	lea	ecx, 1[rax]
	movsx	rax, ecx
	imul	rax, rax, 1717986919
	shr	rax, 32
	mov	edx, eax
	sar	edx, 3
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 2
	sub	ecx, eax
	mov	edx, ecx
	cmp	edx, 3
	jg	.L347
	mov	eax, DWORD PTR 264820[rbp]
	lea	edx, 1[rax]
	movsx	rax, edx
	imul	rax, rax, 1717986919
	shr	rax, 32
	mov	ecx, eax
	sar	ecx, 3
	mov	eax, edx
	sar	eax, 31
	sub	ecx, eax
	mov	eax, ecx
	sal	eax, 2
	add	eax, ecx
	sal	eax, 2
	mov	ecx, edx
	sub	ecx, eax
	mov	DWORD PTR 32[rsp], 0
	mov	r9d, 0
	mov	r8d, 16
	mov	edx, 4
	call	mux_int
	add	eax, 100
	jmp	.L348
.L347:
	mov	eax, 104
.L348:
	mov	BYTE PTR 263594[rbp], al
	mov	r10d, 16711680
	mov	edx, DWORD PTR 264096[rbp]
	mov	eax, DWORD PTR 264648[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 264472[rbp]
	imul	eax, DWORD PTR 264648[rbp]
	lea	ecx, [rdx+rax]
	mov	eax, DWORD PTR 264476[rbp]
	imul	eax, DWORD PTR 264652[rbp]
	lea	edx, 0[0+rax*8]
	mov	eax, DWORD PTR 264180[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 264476[rbp]
	imul	eax, DWORD PTR 264652[rbp]
	sal	eax, 2
	lea	r9d, [rdx+rax]
	mov	edx, DWORD PTR 264096[rbp]
	mov	eax, DWORD PTR 264648[rbp]
	lea	r8d, [rdx+rax]
	mov	eax, DWORD PTR 264476[rbp]
	imul	eax, DWORD PTR 264652[rbp]
	lea	edx, 0[0+rax*8]
	mov	eax, DWORD PTR 264180[rbp]
	add	edx, eax
	mov	rax, QWORD PTR 264624[rbp]
	mov	DWORD PTR 40[rsp], r10d
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_rectangle_color
	mov	r8d, 16776960
	mov	eax, DWORD PTR 264472[rbp]
	imul	eax, DWORD PTR 264648[rbp]
	mov	ecx, eax
	mov	eax, DWORD PTR 264476[rbp]
	imul	eax, DWORD PTR 264652[rbp]
	mov	r9d, eax
	mov	edx, DWORD PTR 264096[rbp]
	mov	eax, DWORD PTR 264648[rbp]
	lea	r10d, [rdx+rax]
	mov	eax, DWORD PTR 264476[rbp]
	imul	eax, DWORD PTR 264652[rbp]
	lea	edx, 0[0+rax*8]
	mov	eax, DWORD PTR 264180[rbp]
	add	edx, eax
	mov	rax, QWORD PTR 264624[rbp]
	mov	DWORD PTR 72[rsp], r8d
	mov	r8d, DWORD PTR 264472[rbp]
	mov	DWORD PTR 64[rsp], r8d
	mov	r8d, DWORD PTR 264476[rbp]
	mov	DWORD PTR 56[rsp], r8d
	lea	r8, 263591[rbp]
	mov	QWORD PTR 48[rsp], r8
	mov	r8, QWORD PTR 264480[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_text_color
	mov	edx, DWORD PTR 264096[rbp]
	mov	eax, DWORD PTR 264648[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 264472[rbp]
	imul	eax, DWORD PTR 264648[rbp]
	add	eax, edx
	mov	DWORD PTR 264076[rbp], eax
	mov	edx, DWORD PTR 264648[rbp]
	mov	eax, edx
	add	eax, eax
	add	eax, edx
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR 264076[rbp]
	add	eax, edx
	mov	DWORD PTR 264072[rbp], eax
	mov	eax, DWORD PTR 264652[rbp]
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR 264180[rbp]
	lea	r9d, [rdx+rax]
	mov	r8d, DWORD PTR 264076[rbp]
	mov	edx, DWORD PTR 264180[rbp]
	mov	rax, QWORD PTR 264624[rbp]
	mov	rcx, QWORD PTR 264352[rbp]
	mov	QWORD PTR 40[rsp], rcx
	mov	ecx, DWORD PTR 264072[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_image
	mov	eax, DWORD PTR 264472[rbp]
	imul	eax, DWORD PTR 264648[rbp]
	mov	ebx, eax
	mov	eax, DWORD PTR 264476[rbp]
	imul	eax, DWORD PTR 264652[rbp]
	mov	esi, eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 264072[rbp]
	pxor	xmm4, xmm4
	cvtsi2sd	xmm4, DWORD PTR 264076[rbp]
	movq	rax, xmm4
	movsd	xmm1, QWORD PTR .LC95[rip]
	movapd	xmm2, xmm1
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	lerp
	cvttsd2si	r8d, xmm0
	mov	eax, DWORD PTR 264180[rbp]
	lea	edx, 48[rax]
	mov	rax, QWORD PTR 264624[rbp]
	mov	ecx, DWORD PTR 264184[rbp]
	mov	DWORD PTR 72[rsp], ecx
	mov	ecx, DWORD PTR 264472[rbp]
	mov	DWORD PTR 64[rsp], ecx
	mov	ecx, DWORD PTR 264476[rbp]
	mov	DWORD PTR 56[rsp], ecx
	lea	rcx, 1220[rbp]
	mov	QWORD PTR 48[rsp], rcx
	mov	rcx, QWORD PTR 264480[rbp]
	mov	QWORD PTR 40[rsp], rcx
	mov	DWORD PTR 32[rsp], ebx
	mov	r9d, esi
	mov	rcx, rax
	call	draw_text_color
	mov	rsp, r13
.L326:
	mov	eax, DWORD PTR 264656[rbp]
	mov	DWORD PTR 264060[rbp], eax
	call	get_timer
	lea	edx, 15[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 4
	mov	r8d, eax
	mov	edx, 0
	mov	ecx, 0
	call	make_color_hsv
	mov	DWORD PTR 264056[rbp], eax
	mov	DWORD PTR 264780[rbp], 0
	jmp	.L349
.L364:
	mov	DWORD PTR 264776[rbp], 0
	jmp	.L350
.L363:
	mov	DWORD PTR 264772[rbp], 0
	jmp	.L351
.L362:
	mov	eax, DWORD PTR 264776[rbp]
	imul	eax, DWORD PTR 264660[rbp]
	mov	edx, DWORD PTR 264772[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 264780[rbp]
	imul	eax, DWORD PTR 264388[rbp]
	add	eax, edx
	mov	DWORD PTR 263836[rbp], eax
	mov	eax, DWORD PTR 264772[rbp]
	imul	eax, DWORD PTR 264652[rbp]
	imul	eax, DWORD PTR 264656[rbp]
	mov	edx, DWORD PTR 264684[rbp]
	add	eax, edx
	mov	DWORD PTR 263832[rbp], eax
	mov	eax, DWORD PTR 264776[rbp]
	imul	eax, DWORD PTR 264648[rbp]
	imul	eax, DWORD PTR 264656[rbp]
	mov	edx, DWORD PTR 264680[rbp]
	add	eax, edx
	mov	DWORD PTR 263828[rbp], eax
	mov	eax, DWORD PTR 264772[rbp]
	add	eax, 1
	imul	eax, DWORD PTR 264652[rbp]
	imul	eax, DWORD PTR 264656[rbp]
	mov	edx, DWORD PTR 264684[rbp]
	add	eax, edx
	mov	DWORD PTR 263824[rbp], eax
	mov	eax, DWORD PTR 264776[rbp]
	add	eax, 1
	imul	eax, DWORD PTR 264648[rbp]
	imul	eax, DWORD PTR 264656[rbp]
	mov	edx, DWORD PTR 264680[rbp]
	add	eax, edx
	mov	DWORD PTR 263820[rbp], eax
	mov	eax, DWORD PTR 264404[rbp]
	imul	eax, DWORD PTR 264816[rbp]
	mov	edx, DWORD PTR 263836[rbp]
	add	eax, edx
	mov	DWORD PTR 263816[rbp], eax
	mov	eax, DWORD PTR 263816[rbp]
	cdqe
	movzx	eax, BYTE PTR 1440[rbp+rax]
	movzx	eax, al
	mov	DWORD PTR 263812[rbp], eax
	cmp	DWORD PTR 264780[rbp], 0
	jne	.L352
	mov	r9d, DWORD PTR 263824[rbp]
	mov	r8d, DWORD PTR 263828[rbp]
	mov	edx, DWORD PTR 263832[rbp]
	mov	rax, QWORD PTR 264624[rbp]
	mov	ecx, DWORD PTR 264056[rbp]
	mov	DWORD PTR 40[rsp], ecx
	mov	ecx, DWORD PTR 263820[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_rectangle_color
	mov	eax, DWORD PTR 263812[rbp]
	cdq
	idiv	DWORD PTR 264660[rbp]
	imul	eax, DWORD PTR 264060[rbp]
	mov	r8d, eax
	mov	eax, DWORD PTR 263812[rbp]
	cdq
	idiv	DWORD PTR 264660[rbp]
	mov	eax, edx
	imul	eax, DWORD PTR 264060[rbp]
	mov	ecx, eax
	mov	r11d, DWORD PTR 263824[rbp]
	mov	r10d, DWORD PTR 263828[rbp]
	mov	edx, DWORD PTR 263832[rbp]
	mov	rax, QWORD PTR 264624[rbp]
	mov	r9d, DWORD PTR 264060[rbp]
	mov	DWORD PTR 72[rsp], r9d
	mov	r9d, DWORD PTR 264060[rbp]
	mov	DWORD PTR 64[rsp], r9d
	mov	DWORD PTR 56[rsp], r8d
	mov	DWORD PTR 48[rsp], ecx
	mov	rcx, QWORD PTR 264512[rbp]
	mov	QWORD PTR 40[rsp], rcx
	mov	ecx, DWORD PTR 263820[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	r9d, r11d
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_image_part
	jmp	.L353
.L352:
	cmp	DWORD PTR 264780[rbp], 1
	jne	.L353
	cmp	DWORD PTR 263812[rbp], 15
	jle	.L354
	cmp	DWORD PTR 263812[rbp], 31
	jg	.L354
	mov	DWORD PTR 263808[rbp], 16
	cmp	DWORD PTR 263812[rbp], 17
	jg	.L355
	mov	eax, 60
	jmp	.L356
.L355:
	mov	eax, 120
.L356:
	mov	DWORD PTR 263804[rbp], eax
	call	get_timer
	mov	DWORD PTR 263800[rbp], eax
	cmp	DWORD PTR 263812[rbp], 16
	jne	.L357
	mov	rax, QWORD PTR 264544[rbp]
	mov	QWORD PTR 264760[rbp], rax
	jmp	.L358
.L357:
	cmp	DWORD PTR 263812[rbp], 17
	jne	.L359
	mov	rax, QWORD PTR 264528[rbp]
	mov	QWORD PTR 264760[rbp], rax
	jmp	.L358
.L359:
	cmp	DWORD PTR 263812[rbp], 18
	jne	.L360
	mov	rax, QWORD PTR 264536[rbp]
	mov	QWORD PTR 264760[rbp], rax
	jmp	.L358
.L360:
	cmp	DWORD PTR 263812[rbp], 19
	jne	.L361
	mov	rax, QWORD PTR 264520[rbp]
	mov	QWORD PTR 264760[rbp], rax
	jmp	.L358
.L361:
	mov	rax, QWORD PTR 264544[rbp]
	mov	QWORD PTR 264760[rbp], rax
.L358:
	mov	eax, DWORD PTR 263800[rbp]
	cdq
	idiv	DWORD PTR 263804[rbp]
	cdq
	idiv	DWORD PTR 263808[rbp]
	mov	eax, edx
	imul	eax, DWORD PTR 264060[rbp]
	mov	ecx, eax
	mov	r9d, DWORD PTR 263824[rbp]
	mov	r10d, DWORD PTR 263828[rbp]
	mov	edx, DWORD PTR 263832[rbp]
	mov	rax, QWORD PTR 264624[rbp]
	mov	r8d, DWORD PTR 264060[rbp]
	mov	DWORD PTR 72[rsp], r8d
	mov	r8d, DWORD PTR 264060[rbp]
	mov	DWORD PTR 64[rsp], r8d
	mov	DWORD PTR 56[rsp], 0
	mov	DWORD PTR 48[rsp], ecx
	mov	rcx, QWORD PTR 264760[rbp]
	mov	QWORD PTR 40[rsp], rcx
	mov	ecx, DWORD PTR 263820[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_image_part
	jmp	.L353
.L354:
	cmp	DWORD PTR 263812[rbp], 0
	je	.L353
	add	DWORD PTR 263812[rbp], 256
	mov	eax, DWORD PTR 263812[rbp]
	cdq
	idiv	DWORD PTR 264660[rbp]
	imul	eax, DWORD PTR 264060[rbp]
	mov	r8d, eax
	mov	eax, DWORD PTR 263812[rbp]
	cdq
	idiv	DWORD PTR 264660[rbp]
	mov	eax, edx
	imul	eax, DWORD PTR 264060[rbp]
	mov	ecx, eax
	mov	r11d, DWORD PTR 263824[rbp]
	mov	r10d, DWORD PTR 263828[rbp]
	mov	edx, DWORD PTR 263832[rbp]
	mov	rax, QWORD PTR 264624[rbp]
	mov	r9d, DWORD PTR 264060[rbp]
	mov	DWORD PTR 72[rsp], r9d
	mov	r9d, DWORD PTR 264060[rbp]
	mov	DWORD PTR 64[rsp], r9d
	mov	DWORD PTR 56[rsp], r8d
	mov	DWORD PTR 48[rsp], ecx
	mov	rcx, QWORD PTR 264512[rbp]
	mov	QWORD PTR 40[rsp], rcx
	mov	ecx, DWORD PTR 263820[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	r9d, r11d
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_image_part
.L353:
	add	DWORD PTR 264772[rbp], 1
.L351:
	mov	eax, DWORD PTR 264772[rbp]
	cmp	eax, DWORD PTR 264660[rbp]
	jl	.L362
	add	DWORD PTR 264776[rbp], 1
.L350:
	mov	eax, DWORD PTR 264776[rbp]
	cmp	eax, DWORD PTR 264660[rbp]
	jl	.L363
	add	DWORD PTR 264780[rbp], 1
.L349:
	mov	eax, DWORD PTR 264780[rbp]
	cmp	eax, DWORD PTR 264392[rbp]
	jl	.L364
	movzx	eax, BYTE PTR 1312[rbp]
	movzx	eax, al
	imul	eax, DWORD PTR 264060[rbp]
	mov	edx, eax
	movzx	eax, BYTE PTR 1317[rbp]
	movzx	eax, al
	imul	edx, eax
	movzx	eax, BYTE PTR 1316[rbp]
	movzx	eax, al
	imul	eax, DWORD PTR 264060[rbp]
	lea	r8d, [rdx+rax]
	mov	edx, DWORD PTR 1300[rbp]
	mov	eax, DWORD PTR 264060[rbp]
	imul	eax, DWORD PTR 264648[rbp]
	lea	ecx, [rdx+rax]
	mov	edx, DWORD PTR 1296[rbp]
	mov	eax, DWORD PTR 264060[rbp]
	imul	eax, DWORD PTR 264652[rbp]
	lea	r11d, [rdx+rax]
	mov	r10d, DWORD PTR 1300[rbp]
	mov	edx, DWORD PTR 1296[rbp]
	mov	rax, QWORD PTR 264624[rbp]
	mov	r9d, DWORD PTR 264060[rbp]
	mov	DWORD PTR 72[rsp], r9d
	mov	r9d, DWORD PTR 264060[rbp]
	mov	DWORD PTR 64[rsp], r9d
	mov	DWORD PTR 56[rsp], 0
	mov	DWORD PTR 48[rsp], r8d
	mov	r8, QWORD PTR 264488[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r9d, r11d
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_image_part
	cmp	DWORD PTR 264840[rbp], 0
	jle	.L365
	mov	eax, DWORD PTR 1296[rbp]
	add	eax, 60
	mov	DWORD PTR 263712[rbp], eax
	mov	eax, DWORD PTR 1300[rbp]
	sub	eax, 120
	mov	DWORD PTR 263716[rbp], eax
	mov	rax, QWORD PTR 264624[rbp]
	mov	DWORD PTR 32[rsp], 255
	mov	r9d, 255
	mov	r8d, 255
	mov	edx, 255
	mov	rcx, rax
	call	SDL_SetRenderDrawColor
	mov	rdx, QWORD PTR 264600[rbp]
	mov	rax, QWORD PTR 264624[rbp]
	mov	rcx, rax
	call	SDL_RenderFillRect
	mov	rax, QWORD PTR 264624[rbp]
	mov	DWORD PTR 32[rsp], 255
	mov	r9d, 255
	mov	r8d, 255
	mov	edx, 255
	mov	rcx, rax
	call	SDL_SetRenderDrawColor
	mov	rax, QWORD PTR 264600[rbp]
	mov	ecx, DWORD PTR 4[rax]
	mov	rax, QWORD PTR 264600[rbp]
	mov	eax, DWORD PTR 12[rax]
	lea	edx, 3[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 2
	add	ecx, eax
	mov	rax, QWORD PTR 264600[rbp]
	mov	eax, DWORD PTR [rax]
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax
	mov	rax, QWORD PTR 264600[rbp]
	mov	eax, DWORD PTR 8[rax]
	pxor	xmm2, xmm2
	cvtsi2sd	xmm2, eax
	movsd	xmm0, QWORD PTR .LC96[rip]
	mulsd	xmm0, xmm2
	addsd	xmm0, xmm1
	cvttsd2si	r8d, xmm0
	mov	eax, DWORD PTR 1300[rbp]
	lea	r10d, -15[rax]
	mov	eax, DWORD PTR 1296[rbp]
	lea	edx, 45[rax]
	mov	rax, QWORD PTR 264624[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	r9d, r8d
	mov	r8d, r10d
	mov	rcx, rax
	call	SDL_RenderDrawLine
	mov	rax, QWORD PTR 264600[rbp]
	mov	edx, DWORD PTR 4[rax]
	mov	rax, QWORD PTR 264600[rbp]
	mov	eax, DWORD PTR 12[rax]
	lea	ecx, [rdx+rax]
	mov	rax, QWORD PTR 264600[rbp]
	mov	eax, DWORD PTR [rax]
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax
	mov	rax, QWORD PTR 264600[rbp]
	mov	eax, DWORD PTR 8[rax]
	pxor	xmm2, xmm2
	cvtsi2sd	xmm2, eax
	movsd	xmm0, QWORD PTR .LC97[rip]
	mulsd	xmm0, xmm2
	addsd	xmm0, xmm1
	cvttsd2si	r8d, xmm0
	mov	eax, DWORD PTR 1300[rbp]
	lea	r10d, -15[rax]
	mov	eax, DWORD PTR 1296[rbp]
	lea	edx, 45[rax]
	mov	rax, QWORD PTR 264624[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	r9d, r8d
	mov	r8d, r10d
	mov	rcx, rax
	call	SDL_RenderDrawLine
	mov	DWORD PTR 1178[rbp], 0
	mov	rax, QWORD PTR 264600[rbp]
	mov	eax, DWORD PTR 8[rax]
	sub	eax, 10
	mov	DWORD PTR 264052[rbp], eax
	mov	r8d, DWORD PTR 264052[rbp]
	mov	ecx, DWORD PTR 1178[rbp]
	mov	rdx, QWORD PTR 264608[rbp]
	mov	rax, QWORD PTR 264584[rbp]
	mov	r9d, r8d
	mov	r8d, ecx
	mov	rcx, rax
	call	TTF_RenderText_Blended_Wrapped
	mov	QWORD PTR 264752[rbp], rax
	cmp	QWORD PTR 264752[rbp], 0
	jne	.L366
	mov	edx, DWORD PTR 1178[rbp]
	mov	rax, QWORD PTR 264584[rbp]
	mov	r8d, edx
	lea	rdx, .LC98[rip]
	mov	rcx, rax
	call	TTF_RenderText_Solid
	mov	QWORD PTR 264752[rbp], rax
.L366:
	mov	rax, QWORD PTR 264752[rbp]
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR 264048[rbp], eax
	mov	rax, QWORD PTR 264752[rbp]
	mov	eax, DWORD PTR 20[rax]
	mov	DWORD PTR 264044[rbp], eax
	mov	rax, QWORD PTR 264600[rbp]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR 264600[rbp]
	mov	eax, DWORD PTR 8[rax]
	sub	eax, DWORD PTR 264048[rbp]
	mov	ecx, eax
	shr	ecx, 31
	add	eax, ecx
	sar	eax
	add	eax, edx
	mov	DWORD PTR 264040[rbp], eax
	mov	rax, QWORD PTR 264600[rbp]
	mov	edx, DWORD PTR 4[rax]
	mov	rax, QWORD PTR 264600[rbp]
	mov	eax, DWORD PTR 12[rax]
	sub	eax, DWORD PTR 264044[rbp]
	mov	ecx, eax
	shr	ecx, 31
	add	eax, ecx
	sar	eax
	add	eax, edx
	mov	DWORD PTR 264036[rbp], eax
	mov	eax, DWORD PTR 264040[rbp]
	mov	DWORD PTR 1152[rbp], eax
	mov	eax, DWORD PTR 264036[rbp]
	mov	DWORD PTR 1156[rbp], eax
	mov	eax, DWORD PTR 264048[rbp]
	mov	DWORD PTR 1160[rbp], eax
	mov	eax, DWORD PTR 264044[rbp]
	mov	DWORD PTR 1164[rbp], eax
	mov	rdx, QWORD PTR 264752[rbp]
	mov	rax, QWORD PTR 264624[rbp]
	mov	rcx, rax
	call	SDL_CreateTextureFromSurface
	mov	QWORD PTR 264024[rbp], rax
	lea	rcx, 1152[rbp]
	mov	rdx, QWORD PTR 264024[rbp]
	mov	rax, QWORD PTR 264624[rbp]
	mov	r9, rcx
	mov	r8d, 0
	mov	rcx, rax
	call	SDL_RenderCopy
	mov	rax, QWORD PTR 264752[rbp]
	mov	rcx, rax
	call	SDL_FreeSurface
	mov	rax, QWORD PTR 264024[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
.L365:
	mov	DWORD PTR 264748[rbp], 0
	jmp	.L367
.L376:
	mov	eax, DWORD PTR 264748[rbp]
	cdqe
	sal	rax, 5
	mov	rdx, rax
	lea	rax, enemies[rip]
	add	rax, rdx
	mov	QWORD PTR 263856[rbp], rax
	mov	rax, QWORD PTR 263856[rbp]
	mov	eax, DWORD PTR 16[rax]
	test	eax, eax
	jle	.L368
	mov	edx, DWORD PTR 1296[rbp]
	mov	rax, QWORD PTR 263856[rbp]
	mov	eax, DWORD PTR [rax]
	sub	edx, eax
	pxor	xmm0, xmm0
	cvtsi2ss	xmm0, edx
	movss	DWORD PTR 264744[rbp], xmm0
	mov	edx, DWORD PTR 1300[rbp]
	mov	rax, QWORD PTR 263856[rbp]
	mov	eax, DWORD PTR 4[rax]
	sub	edx, eax
	pxor	xmm0, xmm0
	cvtsi2ss	xmm0, edx
	movss	DWORD PTR 264740[rbp], xmm0
	mov	rax, QWORD PTR 263856[rbp]
	mov	eax, DWORD PTR 4[rax]
	pxor	xmm2, xmm2
	cvtsi2ss	xmm2, eax
	mov	rax, QWORD PTR 263856[rbp]
	mov	eax, DWORD PTR [rax]
	pxor	xmm1, xmm1
	cvtsi2ss	xmm1, eax
	mov	eax, DWORD PTR 1300[rbp]
	pxor	xmm0, xmm0
	cvtsi2ss	xmm0, eax
	mov	eax, DWORD PTR 1296[rbp]
	pxor	xmm5, xmm5
	cvtsi2ss	xmm5, eax
	movd	eax, xmm5
	movaps	xmm3, xmm2
	movaps	xmm2, xmm1
	movaps	xmm1, xmm0
	movd	xmm0, eax
	call	distance
	movd	eax, xmm0
	mov	DWORD PTR 263852[rbp], eax
	movss	xmm0, DWORD PTR 263852[rbp]
	comiss	xmm0, DWORD PTR .LC99[rip]
	jbe	.L369
	pxor	xmm0, xmm0
	ucomiss	xmm0, DWORD PTR 263852[rbp]
	jp	.L406
	pxor	xmm0, xmm0
	ucomiss	xmm0, DWORD PTR 263852[rbp]
	je	.L371
.L406:
	movss	xmm0, DWORD PTR 264744[rbp]
	divss	xmm0, DWORD PTR 263852[rbp]
	movss	DWORD PTR 264744[rbp], xmm0
	movss	xmm0, DWORD PTR 264740[rbp]
	divss	xmm0, DWORD PTR 263852[rbp]
	movss	DWORD PTR 264740[rbp], xmm0
.L371:
	movzx	eax, BYTE PTR quizOn[rip]
	xor	eax, 1
	test	al, al
	je	.L369
	movss	xmm0, DWORD PTR .LC100[rip]
	movss	DWORD PTR 263848[rbp], xmm0
	mov	rax, QWORD PTR 263856[rbp]
	mov	eax, DWORD PTR [rax]
	pxor	xmm1, xmm1
	cvtsi2ss	xmm1, eax
	movss	xmm0, DWORD PTR 264744[rbp]
	mulss	xmm0, DWORD PTR 263848[rbp]
	addss	xmm0, xmm1
	cvttss2si	eax, xmm0
	mov	rdx, QWORD PTR 263856[rbp]
	mov	DWORD PTR [rdx], eax
	mov	rax, QWORD PTR 263856[rbp]
	mov	eax, DWORD PTR 4[rax]
	pxor	xmm1, xmm1
	cvtsi2ss	xmm1, eax
	movss	xmm0, DWORD PTR 264740[rbp]
	mulss	xmm0, DWORD PTR 263848[rbp]
	addss	xmm0, xmm1
	cvttss2si	eax, xmm0
	mov	rdx, QWORD PTR 263856[rbp]
	mov	DWORD PTR 4[rdx], eax
.L369:
	mov	rax, QWORD PTR 264624[rbp]
	mov	DWORD PTR 32[rsp], 255
	mov	r9d, 0
	mov	r8d, 0
	mov	edx, 255
	mov	rcx, rax
	call	SDL_SetRenderDrawColor
	mov	rax, QWORD PTR 263856[rbp]
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR 1136[rbp], eax
	mov	rax, QWORD PTR 263856[rbp]
	mov	eax, DWORD PTR 4[rax]
	mov	DWORD PTR 1140[rbp], eax
	mov	rax, QWORD PTR 263856[rbp]
	mov	eax, DWORD PTR 8[rax]
	mov	DWORD PTR 1144[rbp], eax
	mov	rax, QWORD PTR 263856[rbp]
	mov	eax, DWORD PTR 12[rax]
	mov	DWORD PTR 1148[rbp], eax
	mov	rax, QWORD PTR 263856[rbp]
	mov	r8, QWORD PTR 24[rax]
	mov	rax, QWORD PTR 263856[rbp]
	mov	edx, DWORD PTR 4[rax]
	mov	rax, QWORD PTR 263856[rbp]
	mov	eax, DWORD PTR 12[rax]
	lea	ecx, [rdx+rax]
	mov	rax, QWORD PTR 263856[rbp]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR 263856[rbp]
	mov	eax, DWORD PTR 8[rax]
	lea	r9d, [rdx+rax]
	mov	rax, QWORD PTR 263856[rbp]
	mov	r10d, DWORD PTR 4[rax]
	mov	rax, QWORD PTR 263856[rbp]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR 264624[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_image
	mov	rax, QWORD PTR playerHitbox[rip]
	mov	rdx, QWORD PTR playerHitbox[rip+8]
	mov	QWORD PTR -16[rbp], rax
	mov	QWORD PTR -8[rbp], rdx
	mov	rax, QWORD PTR 1136[rbp]
	mov	rdx, QWORD PTR 1144[rbp]
	mov	QWORD PTR -32[rbp], rax
	mov	QWORD PTR -24[rbp], rdx
	lea	rdx, -32[rbp]
	lea	rax, -16[rbp]
	mov	rcx, rax
	call	checkCollision
	test	eax, eax
	je	.L368
	lea	rax, .LC101[rip]
	mov	rcx, rax
	call	puts
	mov	rax, QWORD PTR 263856[rbp]
	mov	eax, DWORD PTR 20[rax]
	mov	DWORD PTR 263844[rbp], eax
	mov	eax, DWORD PTR 263844[rbp]
	mov	ecx, eax
	call	damageMe
	mov	DWORD PTR 263840[rbp], 50
	movss	xmm0, DWORD PTR 264744[rbp]
	movss	DWORD PTR 264736[rbp], xmm0
	movss	xmm0, DWORD PTR 264740[rbp]
	movss	DWORD PTR 264732[rbp], xmm0
	pxor	xmm0, xmm0
	ucomiss	xmm0, DWORD PTR 263852[rbp]
	jp	.L407
	pxor	xmm0, xmm0
	ucomiss	xmm0, DWORD PTR 263852[rbp]
	je	.L374
.L407:
	movss	xmm0, DWORD PTR 264736[rbp]
	divss	xmm0, DWORD PTR 263852[rbp]
	movss	DWORD PTR 264736[rbp], xmm0
	movss	xmm0, DWORD PTR 264732[rbp]
	divss	xmm0, DWORD PTR 263852[rbp]
	movss	DWORD PTR 264732[rbp], xmm0
.L374:
	mov	rax, QWORD PTR 263856[rbp]
	mov	eax, DWORD PTR [rax]
	pxor	xmm0, xmm0
	cvtsi2ss	xmm0, eax
	pxor	xmm1, xmm1
	cvtsi2ss	xmm1, DWORD PTR 263840[rbp]
	mulss	xmm1, DWORD PTR 264736[rbp]
	subss	xmm0, xmm1
	cvttss2si	eax, xmm0
	mov	rdx, QWORD PTR 263856[rbp]
	mov	DWORD PTR [rdx], eax
	mov	rax, QWORD PTR 263856[rbp]
	mov	eax, DWORD PTR 4[rax]
	pxor	xmm0, xmm0
	cvtsi2ss	xmm0, eax
	pxor	xmm1, xmm1
	cvtsi2ss	xmm1, DWORD PTR 263840[rbp]
	mulss	xmm1, DWORD PTR 264732[rbp]
	subss	xmm0, xmm1
	cvttss2si	eax, xmm0
	mov	rdx, QWORD PTR 263856[rbp]
	mov	DWORD PTR 4[rdx], eax
.L368:
	add	DWORD PTR 264748[rbp], 1
.L367:
	cmp	DWORD PTR 264748[rbp], 249
	jle	.L376
	mov	rax, QWORD PTR globalEnemy[rip]
	test	rax, rax
	je	.L377
	mov	rax, QWORD PTR globalEnemy[rip]
	mov	eax, DWORD PTR 16[rax]
	test	eax, eax
	jg	.L377
	mov	rax, QWORD PTR globalEnemy[rip]
	mov	rcx, rax
	call	resetEnemy
.L377:
	cmp	DWORD PTR 264816[rbp], 2
	jne	.L378
	movzx	eax, BYTE PTR quiz2Called[rip]
	xor	eax, 1
	test	al, al
	je	.L378
	lea	rax, .LC102[rip]
	mov	QWORD PTR quizQuestion[rip], rax
	lea	rax, .LC103[rip]
	mov	QWORD PTR answerA[rip], rax
	lea	rax, .LC104[rip]
	mov	QWORD PTR answerB[rip], rax
	lea	rax, .LC105[rip]
	mov	QWORD PTR answerC[rip], rax
	mov	BYTE PTR quiz2Called[rip], 1
	mov	BYTE PTR quizOn[rip], 1
	mov	DWORD PTR correctAnswer[rip], 2
	mov	BYTE PTR 1318[rbp], 0
	mov	BYTE PTR quizLoopOn[rip], 1
.L378:
	cmp	DWORD PTR 264816[rbp], 3
	jne	.L379
	movzx	eax, BYTE PTR quiz3Called[rip]
	xor	eax, 1
	test	al, al
	je	.L379
	lea	rax, .LC106[rip]
	mov	QWORD PTR quizQuestion[rip], rax
	lea	rax, .LC107[rip]
	mov	QWORD PTR answerA[rip], rax
	lea	rax, .LC108[rip]
	mov	QWORD PTR answerB[rip], rax
	lea	rax, .LC109[rip]
	mov	QWORD PTR answerC[rip], rax
	mov	BYTE PTR quiz3Called[rip], 1
	mov	BYTE PTR quizOn[rip], 1
	mov	DWORD PTR correctAnswer[rip], 1
	mov	BYTE PTR 1318[rbp], 0
	mov	BYTE PTR quizLoopOn[rip], 1
	lea	rax, .LC23[rip]
	mov	QWORD PTR quizInfo[rip], rax
.L379:
	movzx	eax, BYTE PTR quizLoopOn[rip]
	test	al, al
	je	.L380
	mov	eax, DWORD PTR quizQNum[rip]
	cmp	eax, 1
	jne	.L381
	mov	eax, DWORD PTR userAnswer[rip]
	test	eax, eax
	je	.L380
	mov	edx, DWORD PTR userAnswer[rip]
	mov	eax, DWORD PTR correctAnswer[rip]
	cmp	edx, eax
	jne	.L382
	lea	rax, .LC110[rip]
	mov	QWORD PTR quizInfo[rip], rax
	lea	rax, quizInfoHolder[rip]
	mov	QWORD PTR 56[rsp], rax
	lea	rax, correctAnswer[rip]
	mov	QWORD PTR 48[rsp], rax
	lea	rax, userAnswer[rip]
	mov	QWORD PTR 40[rsp], rax
	lea	rax, answerC[rip]
	mov	QWORD PTR 32[rsp], rax
	lea	r9, answerB[rip]
	lea	r8, answerA[rip]
	lea	rax, quizQuestion[rip]
	mov	rdx, rax
	lea	rax, .LC111[rip]
	mov	rcx, rax
	call	updateQuizDataFromRandomLine
	mov	eax, DWORD PTR quizQNum[rip]
	add	eax, 1
	mov	DWORD PTR quizQNum[rip], eax
	add	DWORD PTR 264836[rbp], 500
	jmp	.L380
.L382:
	lea	rax, .LC112[rip]
	mov	QWORD PTR quizInfo[rip], rax
	lea	rax, quizInfoHolder[rip]
	mov	QWORD PTR 56[rsp], rax
	lea	rax, correctAnswer[rip]
	mov	QWORD PTR 48[rsp], rax
	lea	rax, userAnswer[rip]
	mov	QWORD PTR 40[rsp], rax
	lea	rax, answerC[rip]
	mov	QWORD PTR 32[rsp], rax
	lea	r9, answerB[rip]
	lea	r8, answerA[rip]
	lea	rax, quizQuestion[rip]
	mov	rdx, rax
	lea	rax, .LC111[rip]
	mov	rcx, rax
	call	updateQuizDataFromRandomLine
	mov	eax, DWORD PTR quizQNum[rip]
	add	eax, 1
	mov	DWORD PTR quizQNum[rip], eax
	jmp	.L380
.L381:
	mov	eax, DWORD PTR quizQNum[rip]
	cmp	eax, 2
	jne	.L383
	mov	eax, DWORD PTR userAnswer[rip]
	test	eax, eax
	je	.L380
	mov	edx, DWORD PTR userAnswer[rip]
	mov	eax, DWORD PTR correctAnswer[rip]
	cmp	edx, eax
	jne	.L384
	lea	rax, .LC113[rip]
	mov	QWORD PTR quizInfo[rip], rax
	lea	rax, quizInfoHolder[rip]
	mov	QWORD PTR 56[rsp], rax
	lea	rax, correctAnswer[rip]
	mov	QWORD PTR 48[rsp], rax
	lea	rax, userAnswer[rip]
	mov	QWORD PTR 40[rsp], rax
	lea	rax, answerC[rip]
	mov	QWORD PTR 32[rsp], rax
	lea	r9, answerB[rip]
	lea	r8, answerA[rip]
	lea	rax, quizQuestion[rip]
	mov	rdx, rax
	lea	rax, .LC111[rip]
	mov	rcx, rax
	call	updateQuizDataFromRandomLine
	mov	eax, DWORD PTR quizQNum[rip]
	add	eax, 1
	mov	DWORD PTR quizQNum[rip], eax
	add	DWORD PTR 264836[rbp], 500
	jmp	.L380
.L384:
	lea	rax, .LC112[rip]
	mov	QWORD PTR quizInfo[rip], rax
	lea	rax, quizInfoHolder[rip]
	mov	QWORD PTR 56[rsp], rax
	lea	rax, correctAnswer[rip]
	mov	QWORD PTR 48[rsp], rax
	lea	rax, userAnswer[rip]
	mov	QWORD PTR 40[rsp], rax
	lea	rax, answerC[rip]
	mov	QWORD PTR 32[rsp], rax
	lea	r9, answerB[rip]
	lea	r8, answerA[rip]
	lea	rax, quizQuestion[rip]
	mov	rdx, rax
	lea	rax, .LC111[rip]
	mov	rcx, rax
	call	updateQuizDataFromRandomLine
	mov	eax, DWORD PTR quizQNum[rip]
	add	eax, 1
	mov	DWORD PTR quizQNum[rip], eax
	jmp	.L380
.L383:
	mov	eax, DWORD PTR quizQNum[rip]
	cmp	eax, 3
	jne	.L385
	mov	eax, DWORD PTR userAnswer[rip]
	test	eax, eax
	je	.L380
	mov	edx, DWORD PTR userAnswer[rip]
	mov	eax, DWORD PTR correctAnswer[rip]
	cmp	edx, eax
	jne	.L386
	lea	rax, .LC113[rip]
	mov	QWORD PTR quizInfo[rip], rax
	lea	rax, quizInfoHolder[rip]
	mov	QWORD PTR 56[rsp], rax
	lea	rax, correctAnswer[rip]
	mov	QWORD PTR 48[rsp], rax
	lea	rax, userAnswer[rip]
	mov	QWORD PTR 40[rsp], rax
	lea	rax, answerC[rip]
	mov	QWORD PTR 32[rsp], rax
	lea	r9, answerB[rip]
	lea	r8, answerA[rip]
	lea	rax, quizQuestion[rip]
	mov	rdx, rax
	lea	rax, .LC111[rip]
	mov	rcx, rax
	call	updateQuizDataFromRandomLine
	mov	eax, DWORD PTR quizQNum[rip]
	add	eax, 1
	mov	DWORD PTR quizQNum[rip], eax
	add	DWORD PTR 264836[rbp], 500
	jmp	.L380
.L386:
	lea	rax, .LC112[rip]
	mov	QWORD PTR quizInfo[rip], rax
	lea	rax, quizInfoHolder[rip]
	mov	QWORD PTR 56[rsp], rax
	lea	rax, correctAnswer[rip]
	mov	QWORD PTR 48[rsp], rax
	lea	rax, userAnswer[rip]
	mov	QWORD PTR 40[rsp], rax
	lea	rax, answerC[rip]
	mov	QWORD PTR 32[rsp], rax
	lea	r9, answerB[rip]
	lea	r8, answerA[rip]
	lea	rax, quizQuestion[rip]
	mov	rdx, rax
	lea	rax, .LC111[rip]
	mov	rcx, rax
	call	updateQuizDataFromRandomLine
	mov	eax, DWORD PTR quizQNum[rip]
	add	eax, 1
	mov	DWORD PTR quizQNum[rip], eax
	jmp	.L380
.L385:
	mov	DWORD PTR quizQNum[rip], 4
	lea	rax, .LC114[rip]
	mov	QWORD PTR quizQuestion[rip], rax
	lea	rax, .LC115[rip]
	mov	QWORD PTR answerA[rip], rax
	lea	rax, .LC23[rip]
	mov	QWORD PTR answerB[rip], rax
	lea	rax, .LC23[rip]
	mov	QWORD PTR answerC[rip], rax
	mov	eax, DWORD PTR userAnswer[rip]
	test	eax, eax
	je	.L380
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 1
	je	.L387
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 2
	je	.L387
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 3
	jne	.L380
.L387:
	mov	BYTE PTR quizOn[rip], 0
	mov	BYTE PTR 1318[rbp], 12
	mov	DWORD PTR quizQNum[rip], 1
	lea	rax, .LC23[rip]
	mov	QWORD PTR quizInfo[rip], rax
	mov	DWORD PTR userAnswer[rip], 0
	mov	BYTE PTR quizLoopOn[rip], 0
.L380:
	movzx	eax, BYTE PTR quizOn[rip]
	test	al, al
	je	.L388
	mov	DWORD PTR 1132[rbp], 0
	mov	BYTE PTR 1132[rbp], -56
	mov	BYTE PTR 1133[rbp], -56
	mov	BYTE PTR 1134[rbp], -56
	movzx	eax, BYTE PTR 1134[rbp]
	movzx	r8d, al
	movzx	eax, BYTE PTR 1133[rbp]
	movzx	edx, al
	movzx	eax, BYTE PTR 1132[rbp]
	movzx	eax, al
	mov	rcx, QWORD PTR 264624[rbp]
	mov	DWORD PTR 32[rsp], 255
	mov	r9d, r8d
	mov	r8d, edx
	mov	edx, eax
	call	SDL_SetRenderDrawColor
	mov	DWORD PTR 264020[rbp], 400
	mov	DWORD PTR 264016[rbp], 200
	mov	eax, 800
	sub	eax, DWORD PTR 264020[rbp]
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	add	eax, 300
	mov	DWORD PTR 264012[rbp], eax
	mov	eax, 600
	sub	eax, DWORD PTR 264016[rbp]
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	mov	DWORD PTR 264008[rbp], eax
	mov	eax, DWORD PTR 264012[rbp]
	mov	DWORD PTR 1104[rbp], eax
	mov	eax, DWORD PTR 264008[rbp]
	mov	DWORD PTR 1108[rbp], eax
	mov	eax, DWORD PTR 264020[rbp]
	mov	DWORD PTR 1112[rbp], eax
	mov	eax, DWORD PTR 264016[rbp]
	mov	DWORD PTR 1116[rbp], eax
	lea	rax, 1104[rbp]
	mov	rcx, QWORD PTR 264624[rbp]
	mov	rdx, rax
	call	SDL_RenderFillRect
	mov	DWORD PTR 1100[rbp], 0
	mov	BYTE PTR 1102[rbp], -1
	mov	eax, DWORD PTR 264020[rbp]
	sub	eax, 20
	mov	DWORD PTR 264004[rbp], eax
	mov	r8d, DWORD PTR 264004[rbp]
	mov	rdx, QWORD PTR quizHeader[rip]
	mov	ecx, DWORD PTR 1100[rbp]
	mov	rax, QWORD PTR 264584[rbp]
	mov	r9d, r8d
	mov	r8d, ecx
	mov	rcx, rax
	call	TTF_RenderText_Blended_Wrapped
	mov	QWORD PTR 263992[rbp], rax
	mov	rdx, QWORD PTR 263992[rbp]
	mov	rax, QWORD PTR 264624[rbp]
	mov	rcx, rax
	call	SDL_CreateTextureFromSurface
	mov	QWORD PTR 263984[rbp], rax
	mov	rax, QWORD PTR 263992[rbp]
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR 263980[rbp], eax
	mov	rax, QWORD PTR 263992[rbp]
	mov	eax, DWORD PTR 20[rax]
	mov	DWORD PTR 263976[rbp], eax
	mov	eax, DWORD PTR 264020[rbp]
	sub	eax, DWORD PTR 263980[rbp]
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	mov	edx, eax
	mov	eax, DWORD PTR 264012[rbp]
	add	eax, edx
	mov	DWORD PTR 263972[rbp], eax
	mov	eax, DWORD PTR 264008[rbp]
	add	eax, 10
	mov	DWORD PTR 263968[rbp], eax
	mov	eax, DWORD PTR 263972[rbp]
	mov	DWORD PTR 1072[rbp], eax
	mov	eax, DWORD PTR 263968[rbp]
	mov	DWORD PTR 1076[rbp], eax
	mov	eax, DWORD PTR 263980[rbp]
	mov	DWORD PTR 1080[rbp], eax
	mov	eax, DWORD PTR 263976[rbp]
	mov	DWORD PTR 1084[rbp], eax
	lea	rcx, 1072[rbp]
	mov	rdx, QWORD PTR 263984[rbp]
	mov	rax, QWORD PTR 264624[rbp]
	mov	r9, rcx
	mov	r8d, 0
	mov	rcx, rax
	call	SDL_RenderCopy
	mov	rax, QWORD PTR 263992[rbp]
	mov	rcx, rax
	call	SDL_FreeSurface
	mov	rax, QWORD PTR 263984[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	r9, QWORD PTR answerC[rip]
	mov	r8, QWORD PTR answerB[rip]
	mov	rcx, QWORD PTR answerA[rip]
	mov	rdx, QWORD PTR quizQuestion[rip]
	mov	r10, QWORD PTR quizInfo[rip]
	mov	rax, rbp
	mov	QWORD PTR 56[rsp], r9
	mov	QWORD PTR 48[rsp], r8
	mov	QWORD PTR 40[rsp], rcx
	mov	QWORD PTR 32[rsp], rdx
	mov	r9, r10
	lea	r8, .LC116[rip]
	mov	edx, 1024
	mov	rcx, rax
	call	snprintf
	mov	DWORD PTR 1068[rbp], 0
	mov	eax, DWORD PTR 264020[rbp]
	sub	eax, 20
	mov	DWORD PTR 263964[rbp], eax
	mov	r8d, DWORD PTR 263964[rbp]
	mov	edx, DWORD PTR 1068[rbp]
	mov	rax, rbp
	mov	rcx, QWORD PTR 264584[rbp]
	mov	r9d, r8d
	mov	r8d, edx
	mov	rdx, rax
	call	TTF_RenderText_Blended_Wrapped
	mov	QWORD PTR 263952[rbp], rax
	cmp	QWORD PTR 263952[rbp], 0
	jne	.L389
	call	SDL_GetError
	mov	rdx, rax
	lea	rax, .LC117[rip]
	mov	rcx, rax
	call	printf
	jmp	.L228
.L389:
	mov	rdx, QWORD PTR 263952[rbp]
	mov	rax, QWORD PTR 264624[rbp]
	mov	rcx, rax
	call	SDL_CreateTextureFromSurface
	mov	QWORD PTR 263944[rbp], rax
	cmp	QWORD PTR 263944[rbp], 0
	jne	.L391
	call	SDL_GetError
	mov	rdx, rax
	lea	rax, .LC118[rip]
	mov	rcx, rax
	call	printf
	mov	rax, QWORD PTR 263952[rbp]
	mov	rcx, rax
	call	SDL_FreeSurface
	jmp	.L228
.L391:
	mov	rax, QWORD PTR 263952[rbp]
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR 263940[rbp], eax
	mov	rax, QWORD PTR 263952[rbp]
	mov	eax, DWORD PTR 20[rax]
	mov	DWORD PTR 263936[rbp], eax
	mov	eax, DWORD PTR 264020[rbp]
	sub	eax, DWORD PTR 263940[rbp]
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	mov	edx, eax
	mov	eax, DWORD PTR 264012[rbp]
	add	eax, edx
	mov	DWORD PTR 263932[rbp], eax
	mov	eax, DWORD PTR 264016[rbp]
	sub	eax, DWORD PTR 263936[rbp]
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	mov	edx, eax
	mov	eax, DWORD PTR 264008[rbp]
	add	eax, edx
	mov	DWORD PTR 263928[rbp], eax
	mov	eax, DWORD PTR 263932[rbp]
	mov	DWORD PTR 1040[rbp], eax
	mov	eax, DWORD PTR 263928[rbp]
	mov	DWORD PTR 1044[rbp], eax
	mov	eax, DWORD PTR 263940[rbp]
	mov	DWORD PTR 1048[rbp], eax
	mov	eax, DWORD PTR 263936[rbp]
	mov	DWORD PTR 1052[rbp], eax
	lea	rcx, 1040[rbp]
	mov	rdx, QWORD PTR 263944[rbp]
	mov	rax, QWORD PTR 264624[rbp]
	mov	r9, rcx
	mov	r8d, 0
	mov	rcx, rax
	call	SDL_RenderCopy
	mov	rax, QWORD PTR 263952[rbp]
	mov	rcx, rax
	call	SDL_FreeSurface
	mov	rax, QWORD PTR 263944[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
.L388:
	mov	DWORD PTR 264728[rbp], 0
	jmp	.L392
.L394:
	mov	rdx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 264728[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	mov	eax, DWORD PTR 12[rax]
	test	eax, eax
	je	.L393
	mov	rdx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 264728[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	movss	xmm1, DWORD PTR 4[rax]
	movss	xmm0, DWORD PTR .LC119[rip]
	addss	xmm0, xmm1
	cvttss2si	edx, xmm0
	mov	rcx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 264728[rbp]
	cdqe
	sal	rax, 4
	add	rax, rcx
	movss	xmm1, DWORD PTR [rax]
	movss	xmm0, DWORD PTR .LC120[rip]
	addss	xmm0, xmm1
	cvttss2si	r9d, xmm0
	mov	rcx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 264728[rbp]
	cdqe
	sal	rax, 4
	add	rax, rcx
	movss	xmm0, DWORD PTR 4[rax]
	cvttss2si	r10d, xmm0
	mov	rcx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 264728[rbp]
	cdqe
	sal	rax, 4
	add	rax, rcx
	movss	xmm0, DWORD PTR [rax]
	cvttss2si	eax, xmm0
	mov	rcx, QWORD PTR 264624[rbp]
	mov	r8, QWORD PTR 264544[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], edx
	mov	r8d, r10d
	mov	edx, eax
	call	draw_image
.L393:
	add	DWORD PTR 264728[rbp], 1
.L392:
	mov	eax, 100
	cmp	DWORD PTR 264728[rbp], eax
	jl	.L394
	cmp	DWORD PTR 264812[rbp], 0
	je	.L395
	mov	eax, DWORD PTR 264652[rbp]
	sal	eax, 6
	mov	DWORD PTR 263924[rbp], eax
	mov	ecx, DWORD PTR 264692[rbp]
	mov	rax, QWORD PTR 264624[rbp]
	mov	DWORD PTR 40[rsp], 0
	mov	edx, DWORD PTR 264688[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, ecx
	mov	r8d, 0
	mov	edx, 0
	mov	rcx, rax
	call	draw_rectangle_color
	mov	edx, DWORD PTR 264668[rbp]
	mov	eax, DWORD PTR 263924[rbp]
	lea	r9d, [rdx+rax]
	mov	eax, DWORD PTR 264684[rbp]
	sub	eax, DWORD PTR 263924[rbp]
	mov	r8d, DWORD PTR 264680[rbp]
	mov	rcx, QWORD PTR 264624[rbp]
	mov	rdx, QWORD PTR 264312[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	edx, DWORD PTR 264664[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	edx, eax
	call	draw_image
	mov	DWORD PTR 263920[rbp], 16
	call	draw_get_color
	mov	DWORD PTR 263916[rbp], eax
	call	get_timer
	mov	DWORD PTR 263912[rbp], eax
	mov	eax, DWORD PTR 263912[rbp]
	movsx	rdx, eax
	imul	rdx, rdx, 1717986919
	shr	rdx, 32
	mov	ecx, edx
	sar	ecx, 2
	cdq
	mov	eax, ecx
	sub	eax, edx
	movsx	rdx, eax
	imul	rdx, rdx, -1240768329
	shr	rdx, 32
	add	edx, eax
	sar	edx, 8
	mov	ecx, eax
	sar	ecx, 31
	sub	edx, ecx
	mov	DWORD PTR 263908[rbp], edx
	mov	edx, DWORD PTR 263908[rbp]
	imul	edx, edx, 360
	sub	eax, edx
	mov	DWORD PTR 263908[rbp], eax
	mov	eax, DWORD PTR 263912[rbp]
	movsx	rdx, eax
	imul	rdx, rdx, 1717986919
	shr	rdx, 32
	mov	ecx, edx
	sar	ecx, 2
	cdq
	mov	eax, ecx
	sub	eax, edx
	movsx	rdx, eax
	imul	rdx, rdx, -1240768329
	shr	rdx, 32
	add	edx, eax
	sar	edx, 8
	mov	ecx, eax
	sar	ecx, 31
	sub	edx, ecx
	imul	ecx, edx, 360
	sub	eax, ecx
	mov	edx, eax
	pxor	xmm3, xmm3
	cvtsi2sd	xmm3, edx
	movq	rax, xmm3
	movq	xmm0, rax
	call	dcos
	movsd	xmm1, QWORD PTR .LC121[rip]
	mulsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC122[rip]
	addsd	xmm0, xmm1
	cvttsd2si	eax, xmm0
	mov	DWORD PTR 263904[rbp], eax
	mov	eax, DWORD PTR 263912[rbp]
	movsx	rdx, eax
	imul	rdx, rdx, 1717986919
	shr	rdx, 32
	sar	edx, 2
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	sar	eax, 31
	shr	eax, 24
	add	edx, eax
	movzx	edx, dl
	sub	edx, eax
	mov	DWORD PTR 263900[rbp], edx
	mov	DWORD PTR 264724[rbp], 0
	jmp	.L396
.L397:
	mov	eax, DWORD PTR 263920[rbp]
	neg	eax
	imul	eax, DWORD PTR 264652[rbp]
	pxor	xmm6, xmm6
	cvtsi2sd	xmm6, eax
	pxor	xmm4, xmm4
	cvtsi2sd	xmm4, DWORD PTR 263908[rbp]
	movq	rax, xmm4
	movq	xmm0, rax
	call	dcos
	mulsd	xmm6, xmm0
	mov	eax, DWORD PTR 264724[rbp]
	imul	eax, DWORD PTR 264652[rbp]
	pxor	xmm7, xmm7
	cvtsi2sd	xmm7, eax
	pxor	xmm5, xmm5
	cvtsi2sd	xmm5, DWORD PTR 263908[rbp]
	movq	rax, xmm5
	movq	xmm0, rax
	call	dcos
	mulsd	xmm0, xmm7
	addsd	xmm0, xmm6
	cvttsd2si	eax, xmm0
	mov	DWORD PTR 263884[rbp], eax
	mov	eax, DWORD PTR 263920[rbp]
	neg	eax
	imul	eax, DWORD PTR 264648[rbp]
	pxor	xmm6, xmm6
	cvtsi2sd	xmm6, eax
	pxor	xmm3, xmm3
	cvtsi2sd	xmm3, DWORD PTR 263904[rbp]
	movq	rax, xmm3
	movq	xmm0, rax
	call	dsin
	mulsd	xmm6, xmm0
	mov	eax, DWORD PTR 264724[rbp]
	imul	eax, DWORD PTR 264648[rbp]
	pxor	xmm7, xmm7
	cvtsi2sd	xmm7, eax
	pxor	xmm4, xmm4
	cvtsi2sd	xmm4, DWORD PTR 263904[rbp]
	movq	rax, xmm4
	movq	xmm0, rax
	call	dsin
	mulsd	xmm0, xmm7
	addsd	xmm0, xmm6
	cvttsd2si	eax, xmm0
	mov	DWORD PTR 263880[rbp], eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 264724[rbp]
	mov	eax, DWORD PTR 263920[rbp]
	sub	eax, 1
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	movsd	xmm0, QWORD PTR .LC123[rip]
	movapd	xmm1, xmm0
	mov	rax, QWORD PTR .LC124[rip]
	movq	xmm0, rax
	call	lerp
	cvttsd2si	edx, xmm0
	mov	eax, DWORD PTR 263900[rbp]
	mov	r8d, edx
	mov	edx, 32
	mov	ecx, eax
	call	make_color_hsv
	mov	edx, eax
	mov	rax, QWORD PTR 264624[rbp]
	mov	rcx, rax
	call	draw_set_color
	mov	edx, DWORD PTR 264664[rbp]
	mov	eax, DWORD PTR 263880[rbp]
	lea	ecx, [rdx+rax]
	mov	edx, DWORD PTR 264668[rbp]
	mov	eax, DWORD PTR 263924[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 263884[rbp]
	lea	r9d, [rdx+rax]
	mov	edx, DWORD PTR 264680[rbp]
	mov	eax, DWORD PTR 263880[rbp]
	lea	r10d, [rdx+rax]
	mov	eax, DWORD PTR 264684[rbp]
	sub	eax, DWORD PTR 263924[rbp]
	mov	edx, DWORD PTR 263884[rbp]
	add	edx, eax
	mov	rax, QWORD PTR 264624[rbp]
	mov	r8, QWORD PTR 264304[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_image
	add	DWORD PTR 264724[rbp], 1
.L396:
	mov	eax, DWORD PTR 264724[rbp]
	cmp	eax, DWORD PTR 263920[rbp]
	jl	.L397
	mov	edx, DWORD PTR 264668[rbp]
	mov	eax, DWORD PTR 263924[rbp]
	lea	r9d, [rdx+rax]
	mov	eax, DWORD PTR 264684[rbp]
	sub	eax, DWORD PTR 263924[rbp]
	mov	r8d, DWORD PTR 264680[rbp]
	mov	rcx, QWORD PTR 264624[rbp]
	mov	rdx, QWORD PTR 264296[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	edx, DWORD PTR 264664[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	edx, eax
	call	draw_image
	mov	edx, DWORD PTR 263916[rbp]
	mov	rax, QWORD PTR 264624[rbp]
	mov	rcx, rax
	call	draw_set_color
	mov	DWORD PTR 263896[rbp], 384
	mov	DWORD PTR 263892[rbp], 32
	mov	eax, DWORD PTR 263912[rbp]
	movsx	rdx, eax
	imul	rdx, rdx, -2004318071
	shr	rdx, 32
	add	edx, eax
	sar	edx, 5
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	sar	eax, 31
	shr	eax, 29
	add	edx, eax
	and	edx, 7
	sub	edx, eax
	mov	eax, edx
	cmp	eax, 3
	jle	.L398
	mov	r8d, 65535
	mov	eax, DWORD PTR 264472[rbp]
	imul	eax, DWORD PTR 264648[rbp]
	mov	ecx, eax
	mov	eax, DWORD PTR 264476[rbp]
	imul	eax, DWORD PTR 264652[rbp]
	mov	r9d, eax
	mov	r10d, DWORD PTR 263892[rbp]
	mov	edx, DWORD PTR 263896[rbp]
	mov	rax, QWORD PTR 264624[rbp]
	mov	DWORD PTR 72[rsp], r8d
	mov	r8d, DWORD PTR 264472[rbp]
	mov	DWORD PTR 64[rsp], r8d
	mov	r8d, DWORD PTR 264476[rbp]
	mov	DWORD PTR 56[rsp], r8d
	mov	r8, QWORD PTR 264288[rbp]
	mov	QWORD PTR 48[rsp], r8
	mov	r8, QWORD PTR 264480[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_text_color
.L398:
	mov	DWORD PTR 263896[rbp], 64
	mov	DWORD PTR 263892[rbp], 8
	mov	eax, DWORD PTR 264272[rbp]
	mov	DWORD PTR 263920[rbp], eax
	mov	DWORD PTR 264720[rbp], 0
	jmp	.L399
.L400:
	mov	eax, DWORD PTR 264648[rbp]
	sal	eax, 3
	pxor	xmm6, xmm6
	cvtsi2sd	xmm6, eax
	mov	eax, DWORD PTR 263912[rbp]
	movsx	rdx, eax
	imul	rdx, rdx, 1717986919
	shr	rdx, 32
	mov	ecx, edx
	sar	ecx, 2
	cdq
	mov	eax, ecx
	sub	eax, edx
	movsx	rdx, eax
	imul	rdx, rdx, -1240768329
	shr	rdx, 32
	add	edx, eax
	sar	edx, 8
	mov	ecx, eax
	sar	ecx, 31
	sub	edx, ecx
	imul	ecx, edx, 360
	sub	eax, ecx
	mov	edx, eax
	pxor	xmm7, xmm7
	cvtsi2sd	xmm7, edx
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 264720[rbp]
	mov	eax, DWORD PTR 263920[rbp]
	sub	eax, 1
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	movsd	xmm0, QWORD PTR .LC125[rip]
	movapd	xmm1, xmm0
	mov	rax, QWORD PTR .LC124[rip]
	movq	xmm0, rax
	call	lerp
	addsd	xmm7, xmm0
	movq	rax, xmm7
	movq	xmm0, rax
	call	dcos
	mulsd	xmm0, xmm6
	cvttsd2si	eax, xmm0
	mov	DWORD PTR 263888[rbp], eax
	mov	eax, DWORD PTR 264720[rbp]
	cdqe
	mov	rdx, QWORD PTR 264280[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	mov	BYTE PTR 1038[rbp], al
	mov	r8d, 16777215
	mov	eax, DWORD PTR 264472[rbp]
	imul	eax, DWORD PTR 264648[rbp]
	mov	ecx, eax
	mov	eax, DWORD PTR 264476[rbp]
	imul	eax, DWORD PTR 264652[rbp]
	mov	r9d, eax
	mov	edx, DWORD PTR 264680[rbp]
	mov	eax, DWORD PTR 264672[rbp]
	add	eax, edx
	sub	eax, DWORD PTR 263892[rbp]
	mov	edx, DWORD PTR 263888[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 264472[rbp]
	imul	eax, DWORD PTR 264648[rbp]
	sub	edx, eax
	mov	r10d, edx
	mov	eax, DWORD PTR 264476[rbp]
	imul	eax, DWORD PTR 264652[rbp]
	imul	eax, DWORD PTR 264720[rbp]
	mov	edx, DWORD PTR 263896[rbp]
	add	edx, eax
	mov	rax, QWORD PTR 264624[rbp]
	mov	DWORD PTR 72[rsp], r8d
	mov	r8d, DWORD PTR 264472[rbp]
	mov	DWORD PTR 64[rsp], r8d
	mov	r8d, DWORD PTR 264476[rbp]
	mov	DWORD PTR 56[rsp], r8d
	lea	r8, 1038[rbp]
	mov	QWORD PTR 48[rsp], r8
	mov	r8, QWORD PTR 264480[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_text_color
	add	DWORD PTR 264720[rbp], 1
.L399:
	mov	eax, DWORD PTR 264720[rbp]
	cmp	eax, DWORD PTR 263920[rbp]
	jl	.L400
.L395:
	mov	rax, QWORD PTR 264624[rbp]
	mov	DWORD PTR 32[rsp], 255
	mov	r9d, 0
	mov	r8d, 0
	mov	edx, 0
	mov	rcx, rax
	call	SDL_SetRenderDrawColor
	mov	edx, DWORD PTR 264836[rbp]
	lea	rax, 1200[rbp]
	mov	r9d, edx
	lea	r8, .LC126[rip]
	mov	edx, 20
	mov	rcx, rax
	call	snprintf
	mov	edx, DWORD PTR 263596[rbp]
	lea	rax, 1200[rbp]
	mov	rcx, QWORD PTR 264584[rbp]
	mov	r8d, edx
	mov	rdx, rax
	call	TTF_RenderText_Solid
	mov	QWORD PTR 263872[rbp], rax
	mov	rdx, QWORD PTR 263872[rbp]
	mov	rax, QWORD PTR 264624[rbp]
	mov	rcx, rax
	call	SDL_CreateTextureFromSurface
	mov	QWORD PTR 263864[rbp], rax
	mov	DWORD PTR 1184[rbp], 10
	mov	DWORD PTR 1188[rbp], 720
	mov	rax, QWORD PTR 263872[rbp]
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR 1192[rbp], eax
	mov	rax, QWORD PTR 263872[rbp]
	mov	eax, DWORD PTR 20[rax]
	mov	DWORD PTR 1196[rbp], eax
	lea	rcx, 1184[rbp]
	mov	rdx, QWORD PTR 263864[rbp]
	mov	rax, QWORD PTR 264624[rbp]
	mov	r9, rcx
	mov	r8d, 0
	mov	rcx, rax
	call	SDL_RenderCopy
	mov	rax, QWORD PTR 263872[rbp]
	mov	rcx, rax
	call	SDL_FreeSurface
	mov	rax, QWORD PTR 263864[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 264624[rbp]
	mov	rcx, rax
	call	SDL_RenderPresent
	mov	ecx, 16
	call	SDL_Delay
.L230:
	cmp	DWORD PTR 264808[rbp], 0
	jne	.L231
	lea	rax, .LC127[rip]
	mov	rcx, rax
	call	puts
	mov	rax, QWORD PTR waterParticles[rip]
	mov	rcx, rax
	call	free
	mov	rax, QWORD PTR 264584[rbp]
	mov	rcx, rax
	call	TTF_CloseFont
	mov	rax, QWORD PTR 264560[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 264552[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 264544[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 264536[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 264528[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 264520[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 264512[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 264376[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 264368[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 264488[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 264312[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 264304[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 264296[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 264480[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 264464[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 264352[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 264504[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 264336[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 264496[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	call	IMG_Quit
	mov	eax, DWORD PTR 264324[rbp]
	mov	ecx, eax
	call	SDL_CloseAudioDevice
	mov	rax, QWORD PTR 1256[rbp]
	mov	rcx, rax
	call	SDL_FreeWAV
	mov	rax, QWORD PTR 264624[rbp]
	mov	rcx, rax
	call	SDL_DestroyRenderer
	mov	rax, QWORD PTR 264632[rbp]
	mov	rcx, rax
	call	SDL_DestroyWindow
	call	SDL_Quit
	mov	ecx, 500
	call	SDL_Delay
	mov	eax, 0
	jmp	.L216
.L221:
	call	SDL_GetError
	mov	rbx, rax
	mov	ecx, 2
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	rcx, rax
	mov	rax, QWORD PTR 264696[rbp]
	mov	r9, rbx
	mov	r8, rax
	lea	rax, .LC128[rip]
	mov	rdx, rax
	call	fprintf
	call	SDL_Quit
	mov	ecx, 1
	call	exit
.L216:
	mov	rsp, r12
	jmp	.L214
.L228:
	mov	rsp, r12
.L214:
	movaps	xmm6, XMMWORD PTR 264848[rbp]
	movaps	xmm7, XMMWORD PTR 264864[rbp]
	lea	rsp, 264888[rbp]
	pop	rbx
	pop	rsi
	pop	rdi
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
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
	.align 4
.LC14:
	.long	1085538304
	.align 4
.LC16:
	.long	-1028390912
	.align 4
.LC17:
	.long	1127481344
	.align 4
.LC18:
	.long	1119092736
	.align 4
.LC19:
	.long	1045220557
	.align 8
.LC20:
	.long	-858993459
	.long	1073532108
	.align 8
.LC21:
	.long	0
	.long	1077936128
	.align 8
.LC92:
	.long	0
	.long	1076887552
	.align 8
.LC94:
	.long	0
	.long	1072693248
	.align 8
.LC95:
	.long	0
	.long	1070596096
	.align 8
.LC96:
	.long	-1717986918
	.long	1069128089
	.align 8
.LC97:
	.long	858993459
	.long	1070805811
	.align 4
.LC99:
	.long	1121714176
	.align 4
.LC100:
	.long	1073741824
	.align 4
.LC119:
	.long	1097859072
	.align 4
.LC120:
	.long	1084227584
	.align 8
.LC121:
	.long	0
	.long	1079164928
	.align 8
.LC122:
	.long	0
	.long	1079410688
	.align 8
.LC123:
	.long	0
	.long	1081073664
	.align 8
.LC124:
	.long	0
	.long	0
	.align 8
.LC125:
	.long	0
	.long	1082556416
	.ident	"GCC: (x86_64-posix-seh-rev2, Built by MinGW-W64 project) 12.2.0"
	.def	SDL_FillRect;	.scl	2;	.type	32;	.endef
	.def	SDL_GetError;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	SDL_Quit;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	SDL_SetRenderDrawColor;	.scl	2;	.type	32;	.endef
	.def	SDL_RenderClear;	.scl	2;	.type	32;	.endef
	.def	SDL_RenderFillRect;	.scl	2;	.type	32;	.endef
	.def	SDL_SetTextureColorMod;	.scl	2;	.type	32;	.endef
	.def	SDL_RenderCopy;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	cos;	.scl	2;	.type	32;	.endef
	.def	sin;	.scl	2;	.type	32;	.endef
	.def	SDL_GetTicks64;	.scl	2;	.type	32;	.endef
	.def	atan2;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	fread;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	fseek;	.scl	2;	.type	32;	.endef
	.def	fgetc;	.scl	2;	.type	32;	.endef
	.def	pow;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	fgets;	.scl	2;	.type	32;	.endef
	.def	rand;	.scl	2;	.type	32;	.endef
	.def	srand;	.scl	2;	.type	32;	.endef
	.def	sqrt;	.scl	2;	.type	32;	.endef
	.def	SDL_QueryTexture;	.scl	2;	.type	32;	.endef
	.def	cosf;	.scl	2;	.type	32;	.endef
	.def	sinf;	.scl	2;	.type	32;	.endef
	.def	SDL_RenderCopyEx;	.scl	2;	.type	32;	.endef
	.def	SDL_RenderPresent;	.scl	2;	.type	32;	.endef
	.def	SDL_Delay;	.scl	2;	.type	32;	.endef
	.def	SDL_memcpy;	.scl	2;	.type	32;	.endef
	.def	rewind;	.scl	2;	.type	32;	.endef
	.def	strtok;	.scl	2;	.type	32;	.endef
	.def	sscanf;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	strdup;	.scl	2;	.type	32;	.endef
	.def	atoi;	.scl	2;	.type	32;	.endef
	.def	SDL_GetVersion;	.scl	2;	.type	32;	.endef
	.def	SDL_Log;	.scl	2;	.type	32;	.endef
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	SDL_Init;	.scl	2;	.type	32;	.endef
	.def	SDL_CreateWindow;	.scl	2;	.type	32;	.endef
	.def	snprintf;	.scl	2;	.type	32;	.endef
	.def	SDL_CreateRenderer;	.scl	2;	.type	32;	.endef
	.def	SDL_GetWindowSurface;	.scl	2;	.type	32;	.endef
	.def	TTF_Init;	.scl	2;	.type	32;	.endef
	.def	TTF_OpenFont;	.scl	2;	.type	32;	.endef
	.def	IMG_Init;	.scl	2;	.type	32;	.endef
	.def	IMG_LoadTexture;	.scl	2;	.type	32;	.endef
	.def	SDL_RWFromFile;	.scl	2;	.type	32;	.endef
	.def	SDL_LoadWAV_RW;	.scl	2;	.type	32;	.endef
	.def	SDL_OpenAudioDevice;	.scl	2;	.type	32;	.endef
	.def	SDL_FreeWAV;	.scl	2;	.type	32;	.endef
	.def	SDL_QueueAudio;	.scl	2;	.type	32;	.endef
	.def	SDL_PauseAudioDevice;	.scl	2;	.type	32;	.endef
	.def	SDL_PollEvent;	.scl	2;	.type	32;	.endef
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	SDL_RenderDrawLine;	.scl	2;	.type	32;	.endef
	.def	TTF_RenderText_Blended_Wrapped;	.scl	2;	.type	32;	.endef
	.def	TTF_RenderText_Solid;	.scl	2;	.type	32;	.endef
	.def	SDL_CreateTextureFromSurface;	.scl	2;	.type	32;	.endef
	.def	SDL_FreeSurface;	.scl	2;	.type	32;	.endef
	.def	SDL_DestroyTexture;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	TTF_CloseFont;	.scl	2;	.type	32;	.endef
	.def	IMG_Quit;	.scl	2;	.type	32;	.endef
	.def	SDL_CloseAudioDevice;	.scl	2;	.type	32;	.endef
	.def	SDL_DestroyRenderer;	.scl	2;	.type	32;	.endef
	.def	SDL_DestroyWindow;	.scl	2;	.type	32;	.endef
