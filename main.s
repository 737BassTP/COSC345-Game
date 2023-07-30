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
	push	rbp
	.seh_pushreg	rbp
	push	rbx
	.seh_pushreg	rbx
	mov	eax, 131208
	call	___chkstk_ms
	sub	rsp, rax
	.seh_stackalloc	131208
	lea	rbp, 128[rsp]
	.seh_setframe	rbp, 128
	.seh_endprologue
	lea	rax, .LC4[rip]
	mov	rcx, rax
	call	puts
	mov	DWORD PTR glob_vk_f2[rip], 0
	lea	rax, .LC5[rip]
	mov	rdx, rax
	lea	rax, .LC6[rip]
	mov	rcx, rax
	call	fopen
	mov	QWORD PTR 131040[rbp], rax
	lea	rax, .LC7[rip]
	mov	rdx, rax
	lea	rax, .LC8[rip]
	mov	rcx, rax
	call	fopen
	mov	QWORD PTR 131032[rbp], rax
	mov	DWORD PTR 131028[rbp], 2
	mov	DWORD PTR 131024[rbp], 65536
	mov	eax, DWORD PTR 131028[rbp]
	sal	eax, 16
	mov	DWORD PTR 131020[rbp], eax
	mov	DWORD PTR 131068[rbp], 0
	jmp	.L101
.L102:
	mov	eax, DWORD PTR 131068[rbp]
	cdqe
	mov	BYTE PTR -80[rbp+rax], 0
	add	DWORD PTR 131068[rbp], 1
.L101:
	mov	eax, DWORD PTR 131068[rbp]
	cmp	eax, DWORD PTR 131020[rbp]
	jl	.L102
	mov	rax, QWORD PTR 131040[rbp]
	mov	r8d, 0
	mov	edx, 503
	mov	rcx, rax
	call	fseek
	mov	eax, 44
	mov	BYTE PTR 131019[rbp], al
	mov	DWORD PTR 131064[rbp], 0
	mov	DWORD PTR 131012[rbp], 0
	mov	DWORD PTR 131008[rbp], 0
	mov	DWORD PTR 131004[rbp], 0
	mov	DWORD PTR 131056[rbp], 0
	jmp	.L103
.L111:
	mov	rax, QWORD PTR 131040[rbp]
	mov	rcx, rax
	call	fgetc
	mov	DWORD PTR 131064[rbp], eax
	mov	DWORD PTR 131052[rbp], 0
	jmp	.L104
.L105:
	mov	eax, DWORD PTR 131052[rbp]
	cdqe
	mov	BYTE PTR -83[rbp+rax], 48
	add	DWORD PTR 131052[rbp], 1
.L104:
	cmp	DWORD PTR 131052[rbp], 2
	jle	.L105
	jmp	.L106
.L107:
	mov	rax, QWORD PTR 131040[rbp]
	mov	rcx, rax
	call	fgetc
	mov	DWORD PTR 131064[rbp], eax
.L106:
	cmp	DWORD PTR 131064[rbp], 13
	je	.L107
	cmp	DWORD PTR 131064[rbp], 10
	je	.L107
	mov	eax, DWORD PTR 131064[rbp]
	mov	BYTE PTR -81[rbp], al
	mov	rax, QWORD PTR 131040[rbp]
	mov	rcx, rax
	call	fgetc
	mov	DWORD PTR 131064[rbp], eax
	movzx	eax, BYTE PTR 131019[rbp]
	cmp	DWORD PTR 131064[rbp], eax
	je	.L108
	movzx	eax, BYTE PTR -81[rbp]
	mov	BYTE PTR -82[rbp], al
	mov	eax, DWORD PTR 131064[rbp]
	mov	BYTE PTR -81[rbp], al
	mov	rax, QWORD PTR 131040[rbp]
	mov	rcx, rax
	call	fgetc
	mov	DWORD PTR 131064[rbp], eax
	movzx	eax, BYTE PTR 131019[rbp]
	cmp	DWORD PTR 131064[rbp], eax
	je	.L108
	movzx	eax, BYTE PTR -82[rbp]
	mov	BYTE PTR -83[rbp], al
	movzx	eax, BYTE PTR -81[rbp]
	mov	BYTE PTR -82[rbp], al
	mov	eax, DWORD PTR 131064[rbp]
	mov	BYTE PTR -81[rbp], al
	mov	rax, QWORD PTR 131040[rbp]
	mov	rcx, rax
	call	fgetc
.L108:
	mov	BYTE PTR 131063[rbp], 0
	mov	DWORD PTR 131048[rbp], 0
	jmp	.L109
.L110:
	mov	eax, DWORD PTR 131048[rbp]
	cdqe
	movzx	eax, BYTE PTR -83[rbp+rax]
	movzx	eax, al
	lea	ebx, -48[rax]
	mov	eax, 2
	sub	eax, DWORD PTR 131048[rbp]
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	mov	rax, QWORD PTR .LC9[rip]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	pow
	cvttsd2si	eax, xmm0
	movzx	eax, al
	imul	eax, ebx
	add	BYTE PTR 131063[rbp], al
	add	DWORD PTR 131048[rbp], 1
.L109:
	cmp	DWORD PTR 131048[rbp], 2
	jle	.L110
	movzx	edx, BYTE PTR 131063[rbp]
	mov	ecx, DWORD PTR 131024[rbp]
	mov	eax, DWORD PTR 131056[rbp]
	mov	r9d, edx
	mov	r8d, ecx
	mov	edx, eax
	lea	rax, .LC10[rip]
	mov	rcx, rax
	call	printf
	sub	BYTE PTR 131063[rbp], 1
	mov	eax, DWORD PTR 131056[rbp]
	sar	eax, 12
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR 131056[rbp]
	sar	eax, 4
	and	eax, 15
	add	eax, edx
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR 131056[rbp]
	sar	eax, 8
	and	eax, 15
	add	eax, edx
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR 131056[rbp]
	and	eax, 15
	add	eax, edx
	movsx	rdx, eax
	movzx	eax, BYTE PTR 131063[rbp]
	mov	BYTE PTR -80[rbp+rdx], al
	add	DWORD PTR 131056[rbp], 1
.L103:
	mov	eax, DWORD PTR 131056[rbp]
	cmp	eax, DWORD PTR 131024[rbp]
	jl	.L111
	mov	BYTE PTR 131063[rbp], 0
	mov	DWORD PTR 131012[rbp], 0
	mov	DWORD PTR 131000[rbp], 0
	nop
	mov	eax, DWORD PTR 131000[rbp]
	cmp	eax, DWORD PTR 131024[rbp]
	mov	eax, DWORD PTR 131020[rbp]
	movsx	rdx, eax
	mov	rcx, QWORD PTR 131032[rbp]
	lea	rax, -80[rbp]
	mov	r9, rcx
	mov	r8d, 1
	mov	rcx, rax
	call	fwrite
	mov	rax, QWORD PTR 131040[rbp]
	mov	rcx, rax
	call	fclose
	mov	rax, QWORD PTR 131032[rbp]
	mov	rcx, rax
	call	fclose
	nop
	add	rsp, 131208
	pop	rbx
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
	nop
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
	lea	rax, .LC5[rip]
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
	jmp	.L117
.L118:
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 24[rbp]
	mov	r8, rdx
	mov	edx, 16
	mov	rcx, rax
	call	fgets
	sub	DWORD PTR -4[rbp], 1
.L117:
	cmp	DWORD PTR -4[rbp], 0
	jg	.L118
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
	jmp	.L122
.L123:
	mov	rdx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	mov	DWORD PTR 12[rax], 1
	add	DWORD PTR -4[rbp], 1
.L122:
	mov	eax, 100
	cmp	DWORD PTR -4[rbp], eax
	jl	.L123
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
	jmp	.L125
.L126:
	mov	rdx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	mov	DWORD PTR 12[rax], 0
	add	DWORD PTR -4[rbp], 1
.L125:
	mov	eax, 100
	cmp	DWORD PTR -4[rbp], eax
	jl	.L126
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
	.text
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
	jg	.L128
	mov	DWORD PTR health[rip], 0
	jmp	.L130
.L128:
	mov	eax, DWORD PTR health[rip]
	sub	eax, DWORD PTR 16[rbp]
	mov	DWORD PTR health[rip], eax
.L130:
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
	jl	.L132
	mov	DWORD PTR health[rip], 100
	jmp	.L134
.L132:
	mov	edx, DWORD PTR health[rip]
	mov	eax, DWORD PTR 16[rbp]
	add	eax, edx
	mov	DWORD PTR health[rip], eax
.L134:
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
	jge	.L138
	mov	edx, DWORD PTR -16[rbp]
	mov	eax, DWORD PTR -8[rbp]
	add	edx, eax
	mov	eax, DWORD PTR -32[rbp]
	cmp	edx, eax
	jle	.L138
	mov	edx, DWORD PTR -12[rbp]
	mov	ecx, DWORD PTR -28[rbp]
	mov	eax, DWORD PTR -20[rbp]
	add	eax, ecx
	cmp	edx, eax
	jge	.L138
	mov	edx, DWORD PTR -12[rbp]
	mov	eax, DWORD PTR -4[rbp]
	add	edx, eax
	mov	eax, DWORD PTR -28[rbp]
	cmp	edx, eax
	jle	.L138
	mov	eax, 1
	jmp	.L140
.L138:
	mov	eax, 0
.L140:
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
	test	al, al
	jne	.L142
	mov	rax, QWORD PTR 16[rbp]
	mov	eax, DWORD PTR 32[rax]
	sub	DWORD PTR -8[rbp], eax
	jmp	.L143
.L142:
	mov	rax, QWORD PTR 16[rbp]
	movzx	eax, BYTE PTR 16[rax]
	cmp	al, 1
	jne	.L144
	mov	rax, QWORD PTR 16[rbp]
	mov	eax, DWORD PTR 28[rax]
	add	DWORD PTR -4[rbp], eax
	jmp	.L143
.L144:
	mov	rax, QWORD PTR 16[rbp]
	movzx	eax, BYTE PTR 16[rax]
	cmp	al, 2
	jne	.L145
	mov	rax, QWORD PTR 16[rbp]
	mov	eax, DWORD PTR 32[rax]
	add	DWORD PTR -8[rbp], eax
	jmp	.L143
.L145:
	mov	rax, QWORD PTR 16[rbp]
	movzx	eax, BYTE PTR 16[rax]
	cmp	al, 3
	jne	.L143
	mov	rax, QWORD PTR 16[rbp]
	mov	eax, DWORD PTR 28[rax]
	sub	DWORD PTR -4[rbp], eax
.L143:
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
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR globalEnemy[rip]
	test	rax, rax
	je	.L149
	lea	rax, -16[rbp]
	mov	rcx, QWORD PTR 16[rbp]
	mov	rdx, rax
	call	calculateAttackHitbox
	mov	rax, QWORD PTR globalEnemy[rip]
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR -32[rbp], eax
	mov	rax, QWORD PTR globalEnemy[rip]
	mov	eax, DWORD PTR 4[rax]
	mov	DWORD PTR -28[rbp], eax
	mov	rax, QWORD PTR globalEnemy[rip]
	mov	eax, DWORD PTR 8[rax]
	mov	DWORD PTR -24[rbp], eax
	mov	rax, QWORD PTR globalEnemy[rip]
	mov	eax, DWORD PTR 12[rax]
	mov	DWORD PTR -20[rbp], eax
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR -48[rbp], rax
	mov	QWORD PTR -40[rbp], rdx
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	QWORD PTR -64[rbp], rax
	mov	QWORD PTR -56[rbp], rdx
	lea	rdx, -64[rbp]
	lea	rax, -48[rbp]
	mov	rcx, rax
	call	checkCollision
	test	eax, eax
	je	.L149
	lea	rax, .LC13[rip]
	mov	rcx, rax
	call	puts
	mov	rax, QWORD PTR globalEnemy[rip]
	mov	edx, DWORD PTR 16[rax]
	mov	rax, QWORD PTR 16[rbp]
	mov	ecx, DWORD PTR 24[rax]
	mov	rax, QWORD PTR globalEnemy[rip]
	sub	edx, ecx
	mov	DWORD PTR 16[rax], edx
.L149:
	nop
	add	rsp, 96
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
	jne	.L151
	pxor	xmm0, xmm0
	movss	DWORD PTR -4[rbp], xmm0
	jmp	.L152
.L151:
	mov	rax, QWORD PTR 48[rbp]
	movzx	eax, BYTE PTR 16[rax]
	cmp	al, 1
	jne	.L153
	movss	xmm0, DWORD PTR .LC16[rip]
	movss	DWORD PTR -4[rbp], xmm0
	jmp	.L152
.L153:
	mov	rax, QWORD PTR 48[rbp]
	movzx	eax, BYTE PTR 16[rax]
	cmp	al, 2
	jne	.L154
	movss	xmm0, DWORD PTR .LC17[rip]
	movss	DWORD PTR -4[rbp], xmm0
	jmp	.L152
.L154:
	mov	rax, QWORD PTR 48[rbp]
	movzx	eax, BYTE PTR 16[rax]
	cmp	al, 3
	jne	.L152
	movss	xmm0, DWORD PTR .LC18[rip]
	movss	DWORD PTR -4[rbp], xmm0
.L152:
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
	jmp	.L155
.L157:
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
	jne	.L156
	mov	eax, DWORD PTR -64[rbp]
	add	eax, 20
	mov	DWORD PTR -64[rbp], eax
	mov	eax, DWORD PTR -60[rbp]
	add	eax, 5
	mov	DWORD PTR -60[rbp], eax
.L156:
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
.L155:
	cmp	DWORD PTR -8[rbp], 7
	jle	.L157
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
	jb	.L159
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR 12[rax], 0
.L159:
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
	jl	.L165
	mov	eax, DWORD PTR 16[rbp]
	cmp	eax, DWORD PTR -8[rbp]
	jg	.L165
	mov	eax, 1
	jmp	.L167
.L165:
	mov	eax, 0
.L167:
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
	.globl	quizQuestion
	.section .rdata,"dr"
	.align 8
.LC22:
	.ascii "What is the capital of France?\0"
	.data
	.align 8
quizQuestion:
	.quad	.LC22
	.globl	answerA
	.section .rdata,"dr"
.LC23:
	.ascii "A) Paris\0"
	.data
	.align 8
answerA:
	.quad	.LC23
	.globl	answerB
	.section .rdata,"dr"
.LC24:
	.ascii "B) London\0"
	.data
	.align 8
answerB:
	.quad	.LC24
	.globl	answerC
	.section .rdata,"dr"
.LC25:
	.ascii "C) Berlin\0"
	.data
	.align 8
answerC:
	.quad	.LC25
	.globl	userAnswer
	.bss
	.align 4
userAnswer:
	.space 4
	.globl	quizOn1
	.align 4
quizOn1:
	.space 4
	.globl	quizOn
quizOn:
	.space 1
	.globl	quiz1Num
	.data
	.align 4
quiz1Num:
	.long	1
	.section .rdata,"dr"
	.align 8
.LC26:
	.ascii "Compiled with SDL version %u.%u.%u ...\12\0"
	.align 8
.LC27:
	.ascii "Linked against SDL version %u.%u.%u.\12\0"
	.align 8
.LC28:
	.ascii "Failed to allocate memory for water particles\12\0"
.LC29:
	.ascii "SDL init error:%s\12\0"
.LC30:
	.ascii "COSC345 - Game\0"
.LC31:
	.ascii "Window error\0"
.LC32:
	.ascii "Render error\0"
.LC33:
	.ascii "Surface error\0"
	.align 8
.LC34:
	.ascii "SDL_ttf could not initialize! TTF_Error: %s\12\0"
.LC35:
	.ascii "font.ttf\0"
	.align 8
.LC36:
	.ascii "Failed to load font! SDL_ttf Error: %s\12\0"
	.align 8
.LC37:
	.ascii "Renderer could not be created! SDL_Error: %s\12\0"
.LC38:
	.ascii "img/spr_grass.png\0"
.LC39:
	.ascii "img/spr_sand.png\0"
.LC40:
	.ascii "img/spr_water_strip16.png\0"
.LC41:
	.ascii "img/spr_lava_strip16.png\0"
.LC42:
	.ascii "tiled/tileset.png\0"
.LC43:
	.ascii "img/hudshade.png\0"
.LC44:
	.ascii "img/spr_enemy1.png\0"
.LC45:
	.ascii "img/player_strip8.png\0"
.LC46:
	.ascii "img/ascii_strip96.png\0"
.LC47:
	.ascii "img/clock1_strip10.png\0"
.LC48:
	.ascii "Night\0"
.LC49:
	.ascii "Morning\0"
.LC50:
	.ascii "Day\0"
.LC51:
	.ascii "Evening\0"
.LC52:
	.ascii "img/dunedin-map.png\0"
.LC53:
	.ascii "img/spr_map_unknown.png\0"
.LC54:
	.ascii "img/spr_thermometer.png\0"
.LC55:
	.ascii "img/spr_nutrients_strip4.png\0"
.LC56:
	.ascii "music.wav\0"
.LC57:
	.ascii "Failed to load WAV file: %s\12\0"
	.align 8
.LC58:
	.ascii "Failed to open audio device: %s\12\0"
.LC59:
	.ascii "img/logo1a.png\0"
.LC60:
	.ascii "img/logo1b.png\0"
.LC61:
	.ascii "img/logo1c.png\0"
.LC62:
	.ascii "Press SPACE to continue.\0"
	.align 8
.LC63:
	.ascii "(C) 2023 - Thomas, Sean, Matthew, Nicholas - COSC345\0"
.LC64:
	.ascii "Entering main loop...\0"
.LC65:
	.ascii "F2 started!\0"
.LC66:
	.ascii "F2 finished!\0"
.LC67:
	.ascii "quiz on\0"
	.align 8
.LC68:
	.ascii "you pressed 1, good job. Lets test the limit\0"
	.align 8
.LC69:
	.ascii "The value of the userAnswer is: %d\12\0"
	.align 8
.LC70:
	.ascii "you pressed 2, good job. Lets test the limit woo\0"
.LC71:
	.ascii "you pressed 3\0"
	.align 8
.LC72:
	.ascii "you pressed 4, good job. Lets test the limit woo\0"
.LC73:
	.ascii "HEALTH:\0"
.LC74:
	.ascii "LVL: XYZ/255\0"
.LC75:
	.ascii "X\0"
.LC76:
	.ascii "Y\0"
.LC77:
	.ascii "Z\0"
.LC79:
	.ascii ":\0"
.LC83:
	.ascii "Error: Text Rendering Failed\0"
	.align 8
.LC84:
	.ascii "That is correct\12What is Seans name?\0"
.LC85:
	.ascii "Bradley\0"
.LC86:
	.ascii "Sean\0"
.LC87:
	.ascii "John\0"
	.align 8
.LC88:
	.ascii "That is false\12 next question\12What is Seans name?\0"
	.align 8
.LC89:
	.ascii "That is false\12Thank you for playing\0"
.LC90:
	.ascii "\0"
	.align 8
.LC91:
	.ascii "That is correct\12Thank you for playing\0"
.LC92:
	.ascii "Thank you for playing\0"
.LC93:
	.ascii "press 1 2 or 3 to exit\0"
.LC94:
	.ascii "%s\12%s\12%s\12%s\0"
.LC101:
	.ascii "Score: %d\0"
.LC102:
	.ascii "...exited main loop.\0"
.LC103:
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
	mov	eax, 67384
	call	___chkstk_ms
	sub	rsp, rax
	.seh_stackalloc	67384
	lea	rbp, 128[rsp]
	.seh_setframe	rbp, 128
	movaps	XMMWORD PTR 67216[rbp], xmm6
	.seh_savexmm	xmm6, 67344
	movaps	XMMWORD PTR 67232[rbp], xmm7
	.seh_savexmm	xmm7, 67360
	.seh_endprologue
	mov	DWORD PTR 67328[rbp], ecx
	mov	QWORD PTR 67336[rbp], rdx
	mov	rax, rsp
	mov	r12, rax
	mov	QWORD PTR 67120[rbp], 256
	mov	rax, QWORD PTR 67120[rbp]
	sub	rax, 1
	mov	QWORD PTR 67112[rbp], rax
	mov	rax, QWORD PTR 67120[rbp]
	mov	r10, rax
	mov	r11d, 0
	mov	rax, QWORD PTR 67120[rbp]
	mov	r8, rax
	mov	r9d, 0
	mov	rax, QWORD PTR 67120[rbp]
	add	rax, 15
	shr	rax, 4
	sal	rax, 4
	call	___chkstk_ms
	sub	rsp, rax
	lea	rax, 80[rsp]
	add	rax, 0
	mov	QWORD PTR 67104[rbp], rax
	mov	BYTE PTR 381[rbp], 2
	mov	BYTE PTR 382[rbp], 28
	mov	BYTE PTR 383[rbp], 1
	lea	rax, 378[rbp]
	mov	rcx, rax
	call	SDL_GetVersion
	movzx	eax, BYTE PTR 383[rbp]
	movzx	ecx, al
	movzx	eax, BYTE PTR 382[rbp]
	movzx	edx, al
	movzx	eax, BYTE PTR 381[rbp]
	movzx	eax, al
	mov	r9d, ecx
	mov	r8d, edx
	mov	edx, eax
	lea	rax, .LC26[rip]
	mov	rcx, rax
	call	SDL_Log
	movzx	eax, BYTE PTR 380[rbp]
	movzx	ecx, al
	movzx	eax, BYTE PTR 379[rbp]
	movzx	edx, al
	movzx	eax, BYTE PTR 378[rbp]
	movzx	eax, al
	mov	r9d, ecx
	mov	r8d, edx
	mov	edx, eax
	lea	rax, .LC27[rip]
	mov	rcx, rax
	call	SDL_Log
	mov	DWORD PTR 67100[rbp], 1366
	mov	DWORD PTR 67096[rbp], 768
	mov	eax, DWORD PTR 67100[rbp]
	sub	eax, DWORD PTR 67096[rbp]
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	mov	DWORD PTR 67092[rbp], eax
	mov	DWORD PTR 67088[rbp], 0
	mov	eax, DWORD PTR 67096[rbp]
	mov	DWORD PTR 67084[rbp], eax
	mov	eax, DWORD PTR 67096[rbp]
	mov	DWORD PTR 67080[rbp], eax
	mov	edx, DWORD PTR 67092[rbp]
	mov	eax, DWORD PTR 67084[rbp]
	add	eax, edx
	mov	DWORD PTR 67076[rbp], eax
	mov	edx, DWORD PTR 67088[rbp]
	mov	eax, DWORD PTR 67080[rbp]
	add	eax, edx
	mov	DWORD PTR 67072[rbp], eax
	mov	DWORD PTR 67068[rbp], 16
	mov	DWORD PTR 67064[rbp], 16
	mov	eax, DWORD PTR 67068[rbp]
	mov	ecx, eax
	call	sqr
	mov	esi, eax
	mov	eax, DWORD PTR 67096[rbp]
	cdq
	idiv	esi
	mov	DWORD PTR 67060[rbp], eax
	mov	eax, DWORD PTR 67060[rbp]
	mov	DWORD PTR 67056[rbp], eax
	mov	eax, 100
	cdqe
	sal	rax, 4
	mov	rcx, rax
	call	malloc
	mov	QWORD PTR waterParticles[rip], rax
	mov	rax, QWORD PTR waterParticles[rip]
	test	rax, rax
	jne	.L171
	mov	ecx, 2
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	r9, rax
	mov	r8d, 46
	mov	edx, 1
	lea	rax, .LC28[rip]
	mov	rcx, rax
	call	fwrite
	mov	eax, 1
	jmp	.L172
.L171:
	mov	ecx, 0
	call	time
	mov	ecx, eax
	call	srand
	mov	DWORD PTR 67212[rbp], 0
	jmp	.L173
.L174:
	mov	ecx, DWORD PTR 67096[rbp]
	mov	edx, DWORD PTR 67100[rbp]
	mov	eax, DWORD PTR 67212[rbp]
	mov	r8d, ecx
	mov	ecx, eax
	call	createWaterParticle
	add	DWORD PTR 67212[rbp], 1
.L173:
	mov	eax, 100
	cmp	DWORD PTR 67212[rbp], eax
	jl	.L174
	mov	DWORD PTR 67052[rbp], 62001
	mov	eax, DWORD PTR 67052[rbp]
	mov	ecx, eax
	call	SDL_Init
	test	eax, eax
	je	.L175
	call	SDL_GetError
	mov	rdx, rax
	lea	rax, .LC29[rip]
	mov	rcx, rax
	call	printf
	mov	eax, -1
	jmp	.L172
.L175:
	mov	edx, DWORD PTR 67100[rbp]
	mov	DWORD PTR 40[rsp], 0
	mov	eax, DWORD PTR 67096[rbp]
	mov	DWORD PTR 32[rsp], eax
	mov	r9d, edx
	mov	r8d, 536805376
	mov	edx, 536805376
	lea	rax, .LC30[rip]
	mov	rcx, rax
	call	SDL_CreateWindow
	mov	QWORD PTR 67040[rbp], rax
	cmp	QWORD PTR 67040[rbp], 0
	jne	.L176
	mov	rdx, QWORD PTR 67120[rbp]
	mov	rax, QWORD PTR 67104[rbp]
	lea	r8, .LC31[rip]
	mov	rcx, rax
	call	snprintf
	jmp	.L177
.L176:
	mov	rax, QWORD PTR 67040[rbp]
	mov	r8d, 4
	mov	edx, -1
	mov	rcx, rax
	call	SDL_CreateRenderer
	mov	QWORD PTR 67032[rbp], rax
	cmp	QWORD PTR 67032[rbp], 0
	jne	.L178
	mov	rdx, QWORD PTR 67120[rbp]
	mov	rax, QWORD PTR 67104[rbp]
	lea	r8, .LC32[rip]
	mov	rcx, rax
	call	snprintf
	jmp	.L177
.L178:
	mov	rax, QWORD PTR 67040[rbp]
	mov	rcx, rax
	call	SDL_GetWindowSurface
	mov	QWORD PTR 67024[rbp], rax
	cmp	QWORD PTR 67024[rbp], 0
	jne	.L179
	mov	rdx, QWORD PTR 67120[rbp]
	mov	rax, QWORD PTR 67104[rbp]
	lea	r8, .LC33[rip]
	mov	rcx, rax
	call	snprintf
	jmp	.L177
.L179:
	mov	DWORD PTR 66240[rbp], 800
	mov	DWORD PTR 66244[rbp], 100
	mov	DWORD PTR 66248[rbp], 100
	mov	DWORD PTR 66252[rbp], 100
	movabs	rax, 2338613357913204068
	mov	QWORD PTR 66128[rbp], rax
	movabs	rax, 28542640894207341
	mov	QWORD PTR 66136[rbp], rax
	mov	QWORD PTR 66144[rbp], 0
	mov	QWORD PTR 66152[rbp], 0
	mov	QWORD PTR 66160[rbp], 0
	mov	QWORD PTR 66168[rbp], 0
	mov	QWORD PTR 66176[rbp], 0
	mov	QWORD PTR 66184[rbp], 0
	mov	QWORD PTR 66192[rbp], 0
	mov	QWORD PTR 66200[rbp], 0
	mov	QWORD PTR 66208[rbp], 0
	mov	QWORD PTR 66216[rbp], 0
	mov	DWORD PTR 66224[rbp], 0
	lea	rax, 66128[rbp]
	mov	QWORD PTR 67016[rbp], rax
	lea	rax, 66240[rbp]
	mov	QWORD PTR 67008[rbp], rax
	mov	DWORD PTR 67208[rbp], 0
	mov	DWORD PTR 67004[rbp], 0
	call	TTF_Init
	cmp	eax, -1
	jne	.L180
	call	SDL_GetError
	mov	rdx, rax
	lea	rax, .LC34[rip]
	mov	rcx, rax
	call	printf
	mov	eax, 1
	jmp	.L172
.L180:
	mov	edx, 12
	lea	rax, .LC35[rip]
	mov	rcx, rax
	call	TTF_OpenFont
	mov	QWORD PTR 66992[rbp], rax
	cmp	QWORD PTR 66992[rbp], 0
	jne	.L181
	call	SDL_GetError
	mov	rdx, rax
	lea	rax, .LC36[rip]
	mov	rcx, rax
	call	printf
	mov	eax, 1
	jmp	.L172
.L181:
	mov	DWORD PTR 66988[rbp], 0
	mov	DWORD PTR 67204[rbp], 0
	mov	BYTE PTR 66124[rbp], 0
	mov	BYTE PTR 66125[rbp], 0
	mov	BYTE PTR 66126[rbp], 0
	mov	BYTE PTR 66127[rbp], -1
	mov	rax, QWORD PTR 67040[rbp]
	mov	r8d, 2
	mov	edx, -1
	mov	rcx, rax
	call	SDL_CreateRenderer
	mov	QWORD PTR 66976[rbp], rax
	cmp	QWORD PTR 67032[rbp], 0
	jne	.L182
	call	SDL_GetError
	mov	rdx, rax
	lea	rax, .LC37[rip]
	mov	rcx, rax
	call	printf
.L182:
	mov	ecx, 2
	call	IMG_Init
	mov	rax, QWORD PTR 67032[rbp]
	lea	rdx, .LC38[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66968[rbp], rax
	mov	rax, QWORD PTR 67032[rbp]
	lea	rdx, .LC39[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66960[rbp], rax
	mov	rax, QWORD PTR 67032[rbp]
	lea	rdx, .LC40[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66952[rbp], rax
	mov	rax, QWORD PTR 67032[rbp]
	lea	rdx, .LC41[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66944[rbp], rax
	mov	rax, QWORD PTR 67032[rbp]
	lea	rdx, .LC42[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66936[rbp], rax
	mov	rax, QWORD PTR 67032[rbp]
	lea	rdx, .LC43[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66928[rbp], rax
	mov	rax, QWORD PTR 67032[rbp]
	lea	rdx, .LC44[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66920[rbp], rax
	mov	rax, QWORD PTR 67032[rbp]
	lea	rdx, .LC45[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66912[rbp], rax
	mov	rax, QWORD PTR 67032[rbp]
	lea	rdx, .LC46[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66904[rbp], rax
	mov	DWORD PTR 66900[rbp], 8
	mov	DWORD PTR 66896[rbp], 24
	mov	rax, QWORD PTR 67032[rbp]
	lea	rdx, .LC47[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66888[rbp], rax
	mov	DWORD PTR 66884[rbp], 1440
	mov	DWORD PTR 67200[rbp], 0
	mov	DWORD PTR 67196[rbp], 0
	mov	DWORD PTR 66880[rbp], 57
	mov	DWORD PTR 66876[rbp], 60
	lea	rax, .LC48[rip]
	mov	QWORD PTR 66864[rbp], rax
	lea	rax, .LC49[rip]
	mov	QWORD PTR 66856[rbp], rax
	lea	rax, .LC50[rip]
	mov	QWORD PTR 66848[rbp], rax
	lea	rax, .LC51[rip]
	mov	QWORD PTR 66840[rbp], rax
	mov	eax, DWORD PTR 67068[rbp]
	mov	ecx, eax
	call	sqr
	mov	DWORD PTR 66836[rbp], eax
	mov	DWORD PTR 66832[rbp], 256
	mov	DWORD PTR 67192[rbp], 0
	lea	rax, .LC5[rip]
	mov	rdx, rax
	lea	rax, .LC8[rip]
	mov	rcx, rax
	call	fopen
	mov	QWORD PTR 66824[rbp], rax
	mov	DWORD PTR 67188[rbp], 0
	jmp	.L183
.L184:
	mov	eax, DWORD PTR 67188[rbp]
	cdqe
	mov	BYTE PTR 576[rbp+rax], 0
	add	DWORD PTR 67188[rbp], 1
.L183:
	mov	eax, DWORD PTR 66836[rbp]
	imul	eax, DWORD PTR 66832[rbp]
	cmp	DWORD PTR 67188[rbp], eax
	jl	.L184
	mov	rdx, QWORD PTR 66824[rbp]
	lea	rax, 576[rbp]
	mov	r9, rdx
	mov	r8d, 1
	mov	edx, 65536
	mov	rcx, rax
	call	fread
	mov	rax, QWORD PTR 66824[rbp]
	mov	rcx, rax
	call	fclose
	mov	rax, QWORD PTR 67032[rbp]
	lea	rdx, .LC52[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66816[rbp], rax
	mov	rax, QWORD PTR 67032[rbp]
	lea	rdx, .LC53[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66808[rbp], rax
	lea	rax, 560[rbp]
	mov	ecx, DWORD PTR 67192[rbp]
	mov	rdx, rax
	call	level_get_name
	mov	eax, DWORD PTR 67192[rbp]
	and	eax, 31
	mov	edx, 1
	mov	ecx, eax
	sal	edx, cl
	mov	ecx, edx
	mov	eax, DWORD PTR 67192[rbp]
	lea	edx, 31[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 5
	mov	edx, ecx
	cdqe
	mov	DWORD PTR 528[rbp+rax*4], edx
	mov	DWORD PTR 66804[rbp], 0
	mov	DWORD PTR 66800[rbp], 10
	mov	eax, 42
	mov	BYTE PTR 526[rbp], al
	mov	rax, QWORD PTR 67032[rbp]
	lea	rdx, .LC54[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66792[rbp], rax
	mov	BYTE PTR 66791[rbp], -128
	mov	eax, DWORD PTR 67060[rbp]
	imul	eax, DWORD PTR 67064[rbp]
	lea	edx, 0[0+rax*8]
	mov	eax, DWORD PTR 67092[rbp]
	add	eax, edx
	mov	DWORD PTR 480[rbp], eax
	mov	eax, DWORD PTR 67056[rbp]
	imul	eax, DWORD PTR 67064[rbp]
	lea	edx, 0[0+rax*8]
	mov	eax, DWORD PTR 67088[rbp]
	add	eax, edx
	mov	DWORD PTR 484[rbp], eax
	mov	BYTE PTR 496[rbp], 0
	mov	BYTE PTR 497[rbp], 0
	mov	BYTE PTR 498[rbp], 1
	mov	BYTE PTR 499[rbp], 12
	mov	BYTE PTR 500[rbp], 0
	mov	BYTE PTR 501[rbp], 2
	mov	BYTE PTR 502[rbp], 12
	mov	DWORD PTR 512[rbp], 50
	mov	DWORD PTR 508[rbp], 100
	mov	DWORD PTR 504[rbp], 50
	lea	rax, 448[rbp]
	mov	DWORD PTR 48[rsp], 10
	mov	DWORD PTR 40[rsp], 100
	mov	DWORD PTR 32[rsp], 100
	mov	r9d, 100
	mov	r8d, 500
	mov	edx, 500
	mov	rcx, rax
	call	initEnemy
	lea	rax, 448[rbp]
	mov	QWORD PTR globalEnemy[rip], rax
	mov	rax, QWORD PTR 67032[rbp]
	lea	rdx, .LC55[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66776[rbp], rax
	lea	rax, .LC56[rip]
	mov	QWORD PTR 66768[rbp], rax
	mov	rax, QWORD PTR 66768[rbp]
	lea	rdx, .LC5[rip]
	mov	rcx, rax
	call	SDL_RWFromFile
	mov	rcx, rax
	lea	r8, 408[rbp]
	lea	rdx, 416[rbp]
	lea	rax, 404[rbp]
	mov	QWORD PTR 32[rsp], rax
	mov	r9, r8
	mov	r8, rdx
	mov	edx, 1
	call	SDL_LoadWAV_RW
	test	rax, rax
	jne	.L185
	call	SDL_GetError
	mov	rdx, rax
	lea	rax, .LC57[rip]
	mov	rcx, rax
	call	printf
	jmp	.L186
.L185:
	mov	rax, QWORD PTR 408[rbp]
	mov	QWORD PTR 384[rbp], rax
	mov	eax, DWORD PTR 404[rbp]
	mov	DWORD PTR 392[rbp], eax
	mov	DWORD PTR 396[rbp], 0
	lea	rax, audioCallback[rip]
	mov	QWORD PTR 432[rbp], rax
	lea	rax, 384[rbp]
	mov	QWORD PTR 440[rbp], rax
	lea	rax, 416[rbp]
	mov	DWORD PTR 32[rsp], 0
	mov	r9d, 0
	mov	r8, rax
	mov	edx, 0
	mov	ecx, 0
	call	SDL_OpenAudioDevice
	mov	DWORD PTR 66764[rbp], eax
	cmp	DWORD PTR 66764[rbp], 0
	jne	.L187
	call	SDL_GetError
	mov	rdx, rax
	lea	rax, .LC58[rip]
	mov	rcx, rax
	call	printf
	mov	rax, QWORD PTR 408[rbp]
	mov	rcx, rax
	call	SDL_FreeWAV
	jmp	.L186
.L187:
	mov	ecx, DWORD PTR 404[rbp]
	mov	rdx, QWORD PTR 408[rbp]
	mov	eax, DWORD PTR 66764[rbp]
	mov	r8d, ecx
	mov	ecx, eax
	call	SDL_QueueAudio
	mov	eax, DWORD PTR 66764[rbp]
	mov	edx, 0
	mov	ecx, eax
	call	SDL_PauseAudioDevice
	mov	DWORD PTR 67184[rbp], 1
	mov	rax, QWORD PTR 67032[rbp]
	lea	rdx, .LC59[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66752[rbp], rax
	mov	rax, QWORD PTR 67032[rbp]
	lea	rdx, .LC60[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66744[rbp], rax
	mov	rax, QWORD PTR 67032[rbp]
	lea	rdx, .LC61[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66736[rbp], rax
	lea	rax, .LC62[rip]
	mov	QWORD PTR 66728[rbp], rax
	lea	rax, .LC63[rip]
	mov	QWORD PTR 66720[rbp], rax
	mov	rax, QWORD PTR 66728[rbp]
	mov	rcx, rax
	call	strlen
	mov	DWORD PTR 66716[rbp], eax
	mov	rax, QWORD PTR 66720[rbp]
	mov	rcx, rax
	call	strlen
	mov	DWORD PTR 66712[rbp], eax
	mov	DWORD PTR 67180[rbp], 1
	lea	rax, .LC64[rip]
	mov	rcx, rax
	call	puts
	jmp	.L188
.L240:
	mov	eax, DWORD PTR 66256[rbp]
	cmp	eax, 769
	je	.L190
	cmp	eax, 769
	ja	.L189
	cmp	eax, 256
	je	.L191
	cmp	eax, 768
	je	.L192
	jmp	.L189
.L191:
	mov	DWORD PTR 67180[rbp], 0
	jmp	.L189
.L192:
	mov	DWORD PTR 66316[rbp], 1
	mov	eax, DWORD PTR 66276[rbp]
	cmp	eax, 57
	jg	.L193
	cmp	eax, 27
	jge	.L194
	jmp	.L189
.L216:
	sub	eax, 1073741883
	cmp	eax, 29
	ja	.L189
	mov	eax, eax
	lea	rdx, 0[0+rax*4]
	lea	rax, .L197[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cdqe
	lea	rdx, .L197[rip]
	add	rax, rdx
	jmp	rax
	.section .rdata,"dr"
	.align 4
.L197:
	.long	.L202-.L197
	.long	.L189-.L197
	.long	.L189-.L197
	.long	.L189-.L197
	.long	.L189-.L197
	.long	.L189-.L197
	.long	.L189-.L197
	.long	.L189-.L197
	.long	.L189-.L197
	.long	.L189-.L197
	.long	.L189-.L197
	.long	.L189-.L197
	.long	.L189-.L197
	.long	.L189-.L197
	.long	.L189-.L197
	.long	.L189-.L197
	.long	.L189-.L197
	.long	.L189-.L197
	.long	.L189-.L197
	.long	.L189-.L197
	.long	.L201-.L197
	.long	.L200-.L197
	.long	.L199-.L197
	.long	.L198-.L197
	.long	.L189-.L197
	.long	.L189-.L197
	.long	.L189-.L197
	.long	.L189-.L197
	.long	.L189-.L197
	.long	.L196-.L197
	.text
.L194:
	sub	eax, 27
	cmp	eax, 30
	ja	.L189
	mov	eax, eax
	lea	rdx, 0[0+rax*4]
	lea	rax, .L204[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cdqe
	lea	rdx, .L204[rip]
	add	rax, rdx
	jmp	rax
	.section .rdata,"dr"
	.align 4
.L204:
	.long	.L215-.L204
	.long	.L189-.L204
	.long	.L189-.L204
	.long	.L189-.L204
	.long	.L189-.L204
	.long	.L214-.L204
	.long	.L189-.L204
	.long	.L189-.L204
	.long	.L189-.L204
	.long	.L189-.L204
	.long	.L189-.L204
	.long	.L189-.L204
	.long	.L189-.L204
	.long	.L189-.L204
	.long	.L189-.L204
	.long	.L189-.L204
	.long	.L189-.L204
	.long	.L189-.L204
	.long	.L189-.L204
	.long	.L189-.L204
	.long	.L189-.L204
	.long	.L213-.L204
	.long	.L212-.L204
	.long	.L211-.L204
	.long	.L210-.L204
	.long	.L209-.L204
	.long	.L208-.L204
	.long	.L207-.L204
	.long	.L206-.L204
	.long	.L205-.L204
	.long	.L203-.L204
	.text
.L193:
	cmp	eax, 1073741912
	jg	.L189
	cmp	eax, 1073741883
	jge	.L216
	jmp	.L189
.L215:
	mov	DWORD PTR 67180[rbp], 0
	jmp	.L195
.L201:
	mov	eax, DWORD PTR 66316[rbp]
	mov	DWORD PTR glob_vk_right[rip], eax
	jmp	.L195
.L200:
	mov	eax, DWORD PTR 66316[rbp]
	mov	DWORD PTR glob_vk_left[rip], eax
	jmp	.L195
.L198:
	mov	eax, DWORD PTR 66316[rbp]
	mov	DWORD PTR glob_vk_up[rip], eax
	jmp	.L195
.L199:
	mov	eax, DWORD PTR 66316[rbp]
	mov	DWORD PTR glob_vk_down[rip], eax
	jmp	.L195
.L214:
	mov	eax, DWORD PTR 66316[rbp]
	mov	DWORD PTR glob_vk_space[rip], eax
	jmp	.L195
.L196:
	mov	eax, DWORD PTR 66316[rbp]
	mov	DWORD PTR glob_vk_enter[rip], eax
	jmp	.L195
.L202:
	mov	eax, DWORD PTR 66316[rbp]
	mov	DWORD PTR glob_vk_f2[rip], eax
	jmp	.L195
.L213:
	mov	eax, DWORD PTR 66316[rbp]
	mov	DWORD PTR glob_vk_0[rip], eax
	jmp	.L195
.L212:
	mov	eax, DWORD PTR 66316[rbp]
	mov	DWORD PTR glob_vk_1[rip], eax
	jmp	.L195
.L211:
	mov	eax, DWORD PTR 66316[rbp]
	mov	DWORD PTR glob_vk_2[rip], eax
	jmp	.L195
.L210:
	mov	eax, DWORD PTR 66316[rbp]
	mov	DWORD PTR glob_vk_3[rip], eax
	jmp	.L195
.L209:
	mov	eax, DWORD PTR 66316[rbp]
	mov	DWORD PTR glob_vk_4[rip], eax
	jmp	.L195
.L208:
	mov	eax, DWORD PTR 66316[rbp]
	mov	DWORD PTR glob_vk_5[rip], eax
	jmp	.L195
.L207:
	mov	eax, DWORD PTR 66316[rbp]
	mov	DWORD PTR glob_vk_6[rip], eax
	jmp	.L195
.L206:
	mov	eax, DWORD PTR 66316[rbp]
	mov	DWORD PTR glob_vk_7[rip], eax
	jmp	.L195
.L205:
	mov	eax, DWORD PTR 66316[rbp]
	mov	DWORD PTR glob_vk_8[rip], eax
	jmp	.L195
.L203:
	mov	eax, DWORD PTR 66316[rbp]
	mov	DWORD PTR glob_vk_9[rip], eax
	nop
.L195:
	jmp	.L189
.L190:
	mov	DWORD PTR 66320[rbp], 0
	mov	eax, DWORD PTR 66276[rbp]
	cmp	eax, 57
	jg	.L217
	cmp	eax, 32
	jge	.L218
	jmp	.L332
.L239:
	sub	eax, 1073741883
	cmp	eax, 29
	ja	.L332
	mov	eax, eax
	lea	rdx, 0[0+rax*4]
	lea	rax, .L221[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cdqe
	lea	rdx, .L221[rip]
	add	rax, rdx
	jmp	rax
	.section .rdata,"dr"
	.align 4
.L221:
	.long	.L226-.L221
	.long	.L332-.L221
	.long	.L332-.L221
	.long	.L332-.L221
	.long	.L332-.L221
	.long	.L332-.L221
	.long	.L332-.L221
	.long	.L332-.L221
	.long	.L332-.L221
	.long	.L332-.L221
	.long	.L332-.L221
	.long	.L332-.L221
	.long	.L332-.L221
	.long	.L332-.L221
	.long	.L332-.L221
	.long	.L332-.L221
	.long	.L332-.L221
	.long	.L332-.L221
	.long	.L332-.L221
	.long	.L332-.L221
	.long	.L225-.L221
	.long	.L224-.L221
	.long	.L223-.L221
	.long	.L222-.L221
	.long	.L332-.L221
	.long	.L332-.L221
	.long	.L332-.L221
	.long	.L332-.L221
	.long	.L332-.L221
	.long	.L220-.L221
	.text
.L218:
	sub	eax, 32
	cmp	eax, 25
	ja	.L332
	mov	eax, eax
	lea	rdx, 0[0+rax*4]
	lea	rax, .L228[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cdqe
	lea	rdx, .L228[rip]
	add	rax, rdx
	jmp	rax
	.section .rdata,"dr"
	.align 4
.L228:
	.long	.L238-.L228
	.long	.L332-.L228
	.long	.L332-.L228
	.long	.L332-.L228
	.long	.L332-.L228
	.long	.L332-.L228
	.long	.L332-.L228
	.long	.L332-.L228
	.long	.L332-.L228
	.long	.L332-.L228
	.long	.L332-.L228
	.long	.L332-.L228
	.long	.L332-.L228
	.long	.L332-.L228
	.long	.L332-.L228
	.long	.L332-.L228
	.long	.L237-.L228
	.long	.L236-.L228
	.long	.L235-.L228
	.long	.L234-.L228
	.long	.L233-.L228
	.long	.L232-.L228
	.long	.L231-.L228
	.long	.L230-.L228
	.long	.L229-.L228
	.long	.L227-.L228
	.text
.L217:
	cmp	eax, 1073741912
	jg	.L332
	cmp	eax, 1073741883
	jge	.L239
	jmp	.L332
.L225:
	mov	eax, DWORD PTR 66320[rbp]
	mov	DWORD PTR glob_vk_right[rip], eax
	jmp	.L219
.L224:
	mov	eax, DWORD PTR 66320[rbp]
	mov	DWORD PTR glob_vk_left[rip], eax
	jmp	.L219
.L222:
	mov	eax, DWORD PTR 66320[rbp]
	mov	DWORD PTR glob_vk_up[rip], eax
	jmp	.L219
.L223:
	mov	eax, DWORD PTR 66320[rbp]
	mov	DWORD PTR glob_vk_down[rip], eax
	jmp	.L219
.L238:
	mov	eax, DWORD PTR 66320[rbp]
	mov	DWORD PTR glob_vk_space[rip], eax
	jmp	.L219
.L220:
	mov	eax, DWORD PTR 66320[rbp]
	mov	DWORD PTR glob_vk_enter[rip], eax
	jmp	.L219
.L226:
	mov	eax, DWORD PTR 66320[rbp]
	mov	DWORD PTR glob_vk_f2[rip], eax
	jmp	.L219
.L237:
	mov	eax, DWORD PTR 66320[rbp]
	mov	DWORD PTR glob_vk_0[rip], eax
	jmp	.L219
.L236:
	mov	eax, DWORD PTR 66320[rbp]
	mov	DWORD PTR glob_vk_1[rip], eax
	jmp	.L219
.L235:
	mov	eax, DWORD PTR 66320[rbp]
	mov	DWORD PTR glob_vk_2[rip], eax
	jmp	.L219
.L234:
	mov	eax, DWORD PTR 66320[rbp]
	mov	DWORD PTR glob_vk_3[rip], eax
	jmp	.L219
.L233:
	mov	eax, DWORD PTR 66320[rbp]
	mov	DWORD PTR glob_vk_4[rip], eax
	jmp	.L219
.L232:
	mov	eax, DWORD PTR 66320[rbp]
	mov	DWORD PTR glob_vk_5[rip], eax
	jmp	.L219
.L231:
	mov	eax, DWORD PTR 66320[rbp]
	mov	DWORD PTR glob_vk_6[rip], eax
	jmp	.L219
.L230:
	mov	eax, DWORD PTR 66320[rbp]
	mov	DWORD PTR glob_vk_7[rip], eax
	jmp	.L219
.L229:
	mov	eax, DWORD PTR 66320[rbp]
	mov	DWORD PTR glob_vk_8[rip], eax
	jmp	.L219
.L227:
	mov	eax, DWORD PTR 66320[rbp]
	mov	DWORD PTR glob_vk_9[rip], eax
	nop
.L219:
.L332:
	nop
.L189:
	lea	rax, 66256[rbp]
	mov	rcx, rax
	call	SDL_PollEvent
	test	eax, eax
	jne	.L240
	mov	eax, DWORD PTR glob_vk_f2[rip]
	test	eax, eax
	je	.L241
	lea	rax, .LC65[rip]
	mov	rcx, rax
	call	puts
	call	dev_tiled_to_leveldata
	lea	rax, .LC66[rip]
	mov	rcx, rax
	call	puts
.L241:
	mov	eax, DWORD PTR glob_vk_7[rip]
	test	eax, eax
	je	.L242
	mov	DWORD PTR glob_vk_7[rip], 0
	lea	rax, 480[rbp]
	mov	rcx, rax
	call	attack
	lea	rcx, 480[rbp]
	mov	rdx, QWORD PTR 66952[rbp]
	mov	rax, QWORD PTR 67032[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	renderWeaponSwing
.L242:
	mov	eax, DWORD PTR glob_vk_8[rip]
	test	eax, eax
	je	.L243
	mov	DWORD PTR glob_vk_8[rip], 0
	movzx	eax, BYTE PTR quizOn[rip]
	xor	eax, 1
	test	al, al
	je	.L244
	mov	BYTE PTR quizOn[rip], 1
	mov	DWORD PTR quizOn1[rip], 1
	lea	rax, .LC67[rip]
	mov	rcx, rax
	call	printf
	jmp	.L243
.L244:
	mov	BYTE PTR quizOn[rip], 0
	mov	DWORD PTR quizOn1[rip], 0
.L243:
	mov	eax, DWORD PTR glob_vk_0[rip]
	test	eax, eax
	je	.L245
	mov	DWORD PTR glob_vk_0[rip], 0
	mov	eax, DWORD PTR waterOn[rip]
	test	eax, eax
	jne	.L246
	mov	DWORD PTR waterOn[rip], 1
	call	activateAllWaterParticles
	jmp	.L245
.L246:
	mov	DWORD PTR waterOn[rip], 0
	call	deactivateAllWaterParticles
.L245:
	mov	eax, DWORD PTR glob_vk_9[rip]
	test	eax, eax
	je	.L247
	mov	DWORD PTR glob_vk_9[rip], 0
	cmp	DWORD PTR 67208[rbp], 0
	jne	.L248
	mov	DWORD PTR 67208[rbp], 1
	lea	rax, 66128[rbp]
	movabs	rdi, 3184362091757007472
	mov	QWORD PTR [rax], rdi
	movabs	rdi, 14685297085393969
	mov	QWORD PTR 6[rax], rdi
	jmp	.L247
.L248:
	mov	DWORD PTR 67208[rbp], 0
.L247:
	mov	eax, DWORD PTR glob_vk_1[rip]
	test	eax, eax
	je	.L249
	mov	DWORD PTR glob_vk_1[rip], 0
	cmp	DWORD PTR 67208[rbp], 1
	jne	.L250
	lea	rax, .LC68[rip]
	mov	QWORD PTR 66704[rbp], rax
	mov	QWORD PTR 66696[rbp], 99
	mov	rcx, QWORD PTR 66696[rbp]
	mov	rdx, QWORD PTR 66704[rbp]
	lea	rax, 66128[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	strncpy
	lea	rax, 66128[rbp]
	mov	rdx, QWORD PTR 66696[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	add	DWORD PTR 67204[rbp], 50
	jmp	.L249
.L250:
	mov	eax, DWORD PTR quizOn1[rip]
	test	eax, eax
	je	.L249
	mov	DWORD PTR userAnswer[rip], 1
	mov	eax, DWORD PTR userAnswer[rip]
	mov	edx, eax
	lea	rax, .LC69[rip]
	mov	rcx, rax
	call	printf
.L249:
	mov	eax, DWORD PTR glob_vk_2[rip]
	test	eax, eax
	je	.L251
	mov	DWORD PTR glob_vk_2[rip], 0
	cmp	DWORD PTR 67208[rbp], 1
	jne	.L252
	lea	rax, .LC70[rip]
	mov	QWORD PTR 66688[rbp], rax
	mov	QWORD PTR 66680[rbp], 99
	mov	rcx, QWORD PTR 66680[rbp]
	mov	rdx, QWORD PTR 66688[rbp]
	lea	rax, 66128[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	strncpy
	lea	rax, 66128[rbp]
	mov	rdx, QWORD PTR 66680[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	add	DWORD PTR 67204[rbp], 50
	jmp	.L251
.L252:
	mov	eax, DWORD PTR quizOn1[rip]
	test	eax, eax
	je	.L251
	mov	DWORD PTR userAnswer[rip], 2
.L251:
	mov	eax, DWORD PTR glob_vk_3[rip]
	test	eax, eax
	je	.L253
	mov	DWORD PTR glob_vk_3[rip], 0
	cmp	DWORD PTR 67208[rbp], 1
	jne	.L254
	lea	rax, .LC71[rip]
	mov	QWORD PTR 66672[rbp], rax
	mov	QWORD PTR 66664[rbp], 99
	mov	rcx, QWORD PTR 66664[rbp]
	mov	rdx, QWORD PTR 66672[rbp]
	lea	rax, 66128[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	strncpy
	lea	rax, 66128[rbp]
	mov	rdx, QWORD PTR 66664[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	add	DWORD PTR 67204[rbp], 50
	jmp	.L253
.L254:
	mov	eax, DWORD PTR quizOn1[rip]
	test	eax, eax
	je	.L253
	mov	DWORD PTR userAnswer[rip], 3
.L253:
	mov	eax, DWORD PTR glob_vk_4[rip]
	test	eax, eax
	je	.L255
	mov	DWORD PTR glob_vk_4[rip], 0
	cmp	DWORD PTR 67208[rbp], 1
	jne	.L255
	lea	rax, .LC72[rip]
	mov	QWORD PTR 66656[rbp], rax
	mov	QWORD PTR 66648[rbp], 99
	mov	rcx, QWORD PTR 66648[rbp]
	mov	rdx, QWORD PTR 66656[rbp]
	lea	rax, 66128[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	strncpy
	lea	rax, 66128[rbp]
	mov	rdx, QWORD PTR 66648[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	add	DWORD PTR 67204[rbp], 50
.L255:
	mov	eax, DWORD PTR glob_vk_5[rip]
	test	eax, eax
	je	.L256
	mov	DWORD PTR glob_vk_5[rip], 0
	mov	ecx, 10
	call	damageMe
.L256:
	mov	eax, DWORD PTR glob_vk_6[rip]
	test	eax, eax
	je	.L257
	mov	DWORD PTR glob_vk_6[rip], 0
	mov	ecx, 10
	call	healMe
.L257:
	mov	eax, DWORD PTR glob_vk_right[rip]
	test	eax, eax
	je	.L258
	mov	BYTE PTR 496[rbp], 0
	mov	edx, DWORD PTR 480[rbp]
	movzx	eax, BYTE PTR 502[rbp]
	movzx	eax, al
	add	eax, edx
	mov	DWORD PTR 480[rbp], eax
.L258:
	mov	eax, DWORD PTR glob_vk_up[rip]
	test	eax, eax
	je	.L259
	mov	BYTE PTR 496[rbp], 1
	mov	edx, DWORD PTR 484[rbp]
	movzx	eax, BYTE PTR 502[rbp]
	movzx	eax, al
	sub	edx, eax
	mov	DWORD PTR 484[rbp], edx
.L259:
	mov	eax, DWORD PTR glob_vk_left[rip]
	test	eax, eax
	je	.L260
	mov	BYTE PTR 496[rbp], 2
	mov	edx, DWORD PTR 480[rbp]
	movzx	eax, BYTE PTR 502[rbp]
	movzx	eax, al
	sub	edx, eax
	mov	DWORD PTR 480[rbp], edx
.L260:
	mov	eax, DWORD PTR glob_vk_down[rip]
	test	eax, eax
	je	.L261
	mov	BYTE PTR 496[rbp], 3
	mov	edx, DWORD PTR 484[rbp]
	movzx	eax, BYTE PTR 502[rbp]
	movzx	eax, al
	add	eax, edx
	mov	DWORD PTR 484[rbp], eax
.L261:
	mov	edx, DWORD PTR glob_vk_right[rip]
	mov	eax, DWORD PTR glob_vk_left[rip]
	or	edx, eax
	mov	eax, DWORD PTR glob_vk_up[rip]
	or	edx, eax
	mov	eax, DWORD PTR glob_vk_down[rip]
	or	eax, edx
	test	eax, eax
	je	.L262
	movzx	edx, BYTE PTR 497[rbp]
	movzx	eax, BYTE PTR 498[rbp]
	add	eax, edx
	mov	BYTE PTR 497[rbp], al
	movzx	ecx, BYTE PTR 500[rbp]
	movzx	edx, BYTE PTR 497[rbp]
	movzx	eax, BYTE PTR 499[rbp]
	cmp	dl, al
	setnb	al
	add	eax, ecx
	mov	BYTE PTR 500[rbp], al
	movzx	eax, BYTE PTR 497[rbp]
	movzx	edx, BYTE PTR 499[rbp]
	movzx	eax, al
	div	dl
	movzx	eax, ah
	mov	BYTE PTR 497[rbp], al
	movzx	eax, BYTE PTR 500[rbp]
	movzx	edx, BYTE PTR 501[rbp]
	movzx	eax, al
	div	dl
	movzx	eax, ah
	mov	BYTE PTR 500[rbp], al
	mov	eax, DWORD PTR 67064[rbp]
	imul	eax, DWORD PTR 67060[rbp]
	mov	edx, DWORD PTR 67076[rbp]
	sub	edx, eax
	mov	DWORD PTR 66644[rbp], edx
	mov	eax, DWORD PTR 67088[rbp]
	mov	DWORD PTR 66640[rbp], eax
	mov	eax, DWORD PTR 67092[rbp]
	mov	DWORD PTR 66636[rbp], eax
	mov	eax, DWORD PTR 67064[rbp]
	imul	eax, DWORD PTR 67056[rbp]
	mov	edx, DWORD PTR 67072[rbp]
	sub	edx, eax
	mov	DWORD PTR 66632[rbp], edx
	mov	DWORD PTR 66628[rbp], 0
	mov	eax, DWORD PTR 480[rbp]
	cmp	DWORD PTR 66644[rbp], eax
	jl	.L263
	mov	eax, DWORD PTR 484[rbp]
	cmp	DWORD PTR 66632[rbp], eax
	jl	.L263
	mov	eax, DWORD PTR 480[rbp]
	cmp	DWORD PTR 66636[rbp], eax
	jg	.L263
	mov	eax, DWORD PTR 484[rbp]
	cmp	DWORD PTR 66640[rbp], eax
	jle	.L264
.L263:
	mov	eax, 1
	jmp	.L265
.L264:
	mov	eax, 0
.L265:
	mov	DWORD PTR 66628[rbp], eax
	mov	eax, DWORD PTR 480[rbp]
	cmp	DWORD PTR 66644[rbp], eax
	jge	.L266
	mov	eax, DWORD PTR 66636[rbp]
	mov	DWORD PTR 480[rbp], eax
	add	DWORD PTR 67192[rbp], 1
.L266:
	mov	eax, DWORD PTR 484[rbp]
	cmp	DWORD PTR 66640[rbp], eax
	jle	.L267
	mov	eax, DWORD PTR 66632[rbp]
	mov	DWORD PTR 484[rbp], eax
	pxor	xmm3, xmm3
	cvtsi2sd	xmm3, DWORD PTR 66832[rbp]
	movq	rax, xmm3
	movq	xmm0, rax
	call	sqrt
	cvttsd2si	eax, xmm0
	sub	DWORD PTR 67192[rbp], eax
.L267:
	mov	eax, DWORD PTR 480[rbp]
	cmp	DWORD PTR 66636[rbp], eax
	jle	.L268
	mov	eax, DWORD PTR 66644[rbp]
	mov	DWORD PTR 480[rbp], eax
	sub	DWORD PTR 67192[rbp], 1
.L268:
	mov	eax, DWORD PTR 484[rbp]
	cmp	DWORD PTR 66632[rbp], eax
	jge	.L269
	mov	eax, DWORD PTR 66640[rbp]
	mov	DWORD PTR 484[rbp], eax
	pxor	xmm4, xmm4
	cvtsi2sd	xmm4, DWORD PTR 66832[rbp]
	movq	rax, xmm4
	movq	xmm0, rax
	call	sqrt
	cvttsd2si	eax, xmm0
	add	DWORD PTR 67192[rbp], eax
.L269:
	cmp	DWORD PTR 66628[rbp], 0
	je	.L270
	mov	eax, DWORD PTR 66832[rbp]
	add	DWORD PTR 67192[rbp], eax
	mov	eax, DWORD PTR 67192[rbp]
	cdq
	idiv	DWORD PTR 66832[rbp]
	mov	DWORD PTR 67192[rbp], edx
	lea	rax, 560[rbp]
	mov	ecx, DWORD PTR 67192[rbp]
	mov	rdx, rax
	call	level_get_name
	mov	eax, DWORD PTR 67192[rbp]
	lea	edx, 31[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 5
	mov	r8d, eax
	movsx	rax, r8d
	mov	edx, DWORD PTR 528[rbp+rax*4]
	mov	eax, DWORD PTR 67192[rbp]
	and	eax, 31
	mov	r9d, 1
	mov	ecx, eax
	sal	r9d, cl
	mov	eax, r9d
	or	edx, eax
	movsx	rax, r8d
	mov	DWORD PTR 528[rbp+rax*4], edx
	jmp	.L270
.L262:
	mov	BYTE PTR 497[rbp], 0
	mov	BYTE PTR 500[rbp], 0
.L270:
	mov	edx, DWORD PTR glob_vk_space[rip]
	mov	eax, DWORD PTR glob_vk_enter[rip]
	or	eax, edx
	test	eax, eax
	je	.L271
	mov	DWORD PTR 67184[rbp], 0
.L271:
	mov	eax, DWORD PTR 480[rbp]
	mov	DWORD PTR 488[rbp], eax
	mov	eax, DWORD PTR 484[rbp]
	mov	DWORD PTR 492[rbp], eax
	mov	DWORD PTR 67176[rbp], 0
	jmp	.L272
.L276:
	mov	rdx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 67176[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	mov	eax, DWORD PTR 12[rax]
	test	eax, eax
	je	.L273
	mov	rdx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 67176[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	movss	xmm1, DWORD PTR 4[rax]
	mov	rdx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 67176[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	movss	xmm0, DWORD PTR 8[rax]
	mov	rdx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 67176[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	addss	xmm0, xmm1
	movss	DWORD PTR 4[rax], xmm0
	mov	rdx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 67176[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	movss	xmm0, DWORD PTR 4[rax]
	pxor	xmm1, xmm1
	cvtsi2ss	xmm1, DWORD PTR 67096[rbp]
	comiss	xmm0, xmm1
	jbe	.L273
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
	jg	.L275
	mov	rdx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 67176[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	mov	DWORD PTR 12[rax], 0
	jmp	.L273
.L275:
	mov	ecx, DWORD PTR 67096[rbp]
	mov	edx, DWORD PTR 67100[rbp]
	mov	eax, DWORD PTR 67176[rbp]
	mov	r8d, ecx
	mov	ecx, eax
	call	createWaterParticle
.L273:
	add	DWORD PTR 67176[rbp], 1
.L272:
	mov	eax, 100
	cmp	DWORD PTR 67176[rbp], eax
	jl	.L276
	mov	eax, DWORD PTR 66876[rbp]
	add	DWORD PTR 67196[rbp], eax
	mov	eax, DWORD PTR 67196[rbp]
	cmp	eax, DWORD PTR 66880[rbp]
	setge	al
	movzx	eax, al
	add	DWORD PTR 67200[rbp], eax
	mov	eax, DWORD PTR 67200[rbp]
	cdq
	idiv	DWORD PTR 66884[rbp]
	mov	DWORD PTR 67200[rbp], edx
	mov	eax, DWORD PTR 67196[rbp]
	cdq
	idiv	DWORD PTR 66880[rbp]
	mov	DWORD PTR 67196[rbp], edx
	lea	rdx, 523[rbp]
	lea	rax, 372[rbp]
	mov	rcx, rax
	call	strcpy
	cmp	DWORD PTR 66800[rbp], 0
	js	.L277
	mov	eax, 43
	jmp	.L278
.L277:
	mov	eax, 45
.L278:
	mov	BYTE PTR 372[rbp], al
	mov	eax, DWORD PTR 66800[rbp]
	movsx	rdx, eax
	imul	rdx, rdx, 1717986919
	shr	rdx, 32
	sar	edx, 2
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	add	eax, 48
	mov	BYTE PTR 373[rbp], al
	mov	ecx, DWORD PTR 66800[rbp]
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
	mov	BYTE PTR 374[rbp], al
	mov	eax, 42
	mov	BYTE PTR 375[rbp], al
	cmp	DWORD PTR 66804[rbp], 0
	jne	.L279
	mov	eax, 67
	jmp	.L280
.L279:
	mov	eax, 70
.L280:
	mov	BYTE PTR 376[rbp], al
	mov	edx, 0
	mov	rax, QWORD PTR 67032[rbp]
	mov	rcx, rax
	call	draw_clear
	mov	edx, 16777215
	mov	rax, QWORD PTR 67032[rbp]
	mov	rcx, rax
	call	draw_set_color
	mov	edx, 33023
	mov	ecx, DWORD PTR 67092[rbp]
	mov	rax, QWORD PTR 67032[rbp]
	mov	DWORD PTR 40[rsp], edx
	mov	edx, DWORD PTR 67096[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, ecx
	mov	r8d, 0
	mov	edx, 0
	mov	rcx, rax
	call	draw_rectangle_color
	mov	ecx, DWORD PTR 67092[rbp]
	mov	rax, QWORD PTR 67032[rbp]
	mov	rdx, QWORD PTR 66928[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	edx, DWORD PTR 67096[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, ecx
	mov	r8d, 0
	mov	edx, 0
	mov	rcx, rax
	call	draw_image
	mov	ecx, 8388863
	mov	eax, DWORD PTR 67100[rbp]
	sub	eax, DWORD PTR 67092[rbp]
	mov	r8d, eax
	mov	edx, DWORD PTR 67092[rbp]
	mov	rax, QWORD PTR 67032[rbp]
	mov	DWORD PTR 40[rsp], ecx
	mov	ecx, DWORD PTR 67096[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	r9d, r8d
	mov	r8d, 0
	mov	rcx, rax
	call	draw_rectangle_color
	mov	edx, 33023
	mov	eax, DWORD PTR 67100[rbp]
	sub	eax, DWORD PTR 67092[rbp]
	mov	r8d, DWORD PTR 67100[rbp]
	mov	rcx, QWORD PTR 67032[rbp]
	mov	DWORD PTR 40[rsp], edx
	mov	edx, DWORD PTR 67096[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, r8d
	mov	r8d, 0
	mov	edx, eax
	call	draw_rectangle_color
	mov	eax, DWORD PTR 67100[rbp]
	sub	eax, DWORD PTR 67092[rbp]
	mov	r8d, DWORD PTR 67100[rbp]
	mov	rcx, QWORD PTR 67032[rbp]
	mov	rdx, QWORD PTR 66928[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	edx, DWORD PTR 67096[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, r8d
	mov	r8d, 0
	mov	edx, eax
	call	draw_image
	mov	DWORD PTR 66624[rbp], 0
	mov	eax, DWORD PTR 67060[rbp]
	mov	DWORD PTR 66620[rbp], eax
	mov	eax, DWORD PTR 67056[rbp]
	mov	DWORD PTR 66616[rbp], eax
	cmp	DWORD PTR 67184[rbp], 0
	jne	.L281
	mov	eax, DWORD PTR 66896[rbp]
	imul	eax, DWORD PTR 67056[rbp]
	mov	ecx, eax
	mov	eax, DWORD PTR 66900[rbp]
	imul	eax, DWORD PTR 67060[rbp]
	mov	r9d, eax
	mov	r10d, DWORD PTR 66616[rbp]
	mov	edx, DWORD PTR 66620[rbp]
	mov	rax, QWORD PTR 67032[rbp]
	mov	r8d, DWORD PTR 66624[rbp]
	mov	DWORD PTR 72[rsp], r8d
	mov	r8d, DWORD PTR 66896[rbp]
	mov	DWORD PTR 64[rsp], r8d
	mov	r8d, DWORD PTR 66900[rbp]
	mov	DWORD PTR 56[rsp], r8d
	lea	r8, .LC73[rip]
	mov	QWORD PTR 48[rsp], r8
	mov	r8, QWORD PTR 66904[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_text_color
	mov	eax, DWORD PTR 66896[rbp]
	imul	eax, DWORD PTR 67056[rbp]
	add	DWORD PTR 66616[rbp], eax
	mov	DWORD PTR 66612[rbp], 200
	mov	DWORD PTR 66608[rbp], 20
	mov	eax, DWORD PTR health[rip]
	imul	eax, DWORD PTR 66612[rbp]
	mov	edi, DWORD PTR maxHealth[rip]
	cdq
	idiv	edi
	mov	DWORD PTR 66604[rbp], eax
	mov	DWORD PTR 66600[rbp], 255
	mov	r9d, 0
	mov	edx, DWORD PTR 66616[rbp]
	mov	eax, DWORD PTR 66608[rbp]
	add	edx, eax
	mov	r8d, DWORD PTR 66612[rbp]
	mov	ecx, DWORD PTR 66616[rbp]
	mov	rax, QWORD PTR 67032[rbp]
	mov	DWORD PTR 40[rsp], r9d
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, r8d
	mov	r8d, ecx
	mov	edx, 0
	mov	rcx, rax
	call	draw_rectangle_color
	mov	edx, DWORD PTR 66616[rbp]
	mov	eax, DWORD PTR 66608[rbp]
	add	edx, eax
	mov	r9d, DWORD PTR 66604[rbp]
	mov	r8d, DWORD PTR 66616[rbp]
	mov	rax, QWORD PTR 67032[rbp]
	mov	ecx, DWORD PTR 66600[rbp]
	mov	DWORD PTR 40[rsp], ecx
	mov	DWORD PTR 32[rsp], edx
	mov	edx, 0
	mov	rcx, rax
	call	draw_rectangle_color
	mov	eax, DWORD PTR 66608[rbp]
	add	DWORD PTR 66616[rbp], eax
	mov	DWORD PTR 66596[rbp], 0
	mov	DWORD PTR 66592[rbp], 32
	mov	DWORD PTR 67172[rbp], 0
	jmp	.L282
.L283:
	add	DWORD PTR 67172[rbp], 1
.L282:
	cmp	DWORD PTR 67172[rbp], 3
	jle	.L283
.L281:
	mov	edx, DWORD PTR 67060[rbp]
	mov	eax, DWORD PTR 67076[rbp]
	add	eax, edx
	mov	DWORD PTR 66620[rbp], eax
	mov	eax, DWORD PTR 67056[rbp]
	mov	DWORD PTR 66616[rbp], eax
	cmp	DWORD PTR 67184[rbp], 0
	jne	.L284
	mov	rax, rsp
	mov	r13, rax
	lea	rax, .LC74[rip]
	mov	QWORD PTR 66584[rbp], rax
	mov	rax, QWORD PTR 66584[rbp]
	mov	rcx, rax
	call	strlen
	mov	rdx, rax
	sub	rdx, 1
	mov	QWORD PTR 66576[rbp], rdx
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
	mov	QWORD PTR 66568[rbp], rax
	mov	rdx, QWORD PTR 66584[rbp]
	mov	rax, QWORD PTR 66568[rbp]
	mov	rcx, rax
	call	strcpy
	mov	eax, DWORD PTR 67192[rbp]
	mov	BYTE PTR 66567[rbp], al
	movzx	eax, BYTE PTR 66567[rbp]
	mov	edx, 41
	mul	dl
	shr	ax, 8
	mov	ecx, eax
	shr	cl, 4
	mov	edx, -51
	mov	eax, edx
	mul	cl
	shr	ax, 8
	mov	edx, eax
	shr	dl, 3
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	add	eax, eax
	sub	ecx, eax
	mov	edx, ecx
	lea	ebx, 48[rdx]
	mov	rax, QWORD PTR 66568[rbp]
	mov	rdx, rax
	lea	rax, .LC75[rip]
	mov	rcx, rax
	call	string_pos
	mov	ecx, ebx
	mov	rdx, QWORD PTR 66568[rbp]
	cdqe
	mov	BYTE PTR [rdx+rax], cl
	movzx	eax, BYTE PTR 66567[rbp]
	mov	edx, -51
	mul	dl
	shr	ax, 8
	mov	ecx, eax
	shr	cl, 3
	mov	edx, -51
	mov	eax, edx
	mul	cl
	shr	ax, 8
	mov	edx, eax
	shr	dl, 3
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	add	eax, eax
	sub	ecx, eax
	mov	edx, ecx
	lea	ebx, 48[rdx]
	mov	rax, QWORD PTR 66568[rbp]
	mov	rdx, rax
	lea	rax, .LC76[rip]
	mov	rcx, rax
	call	string_pos
	mov	ecx, ebx
	mov	rdx, QWORD PTR 66568[rbp]
	cdqe
	mov	BYTE PTR [rdx+rax], cl
	movzx	ecx, BYTE PTR 66567[rbp]
	mov	edx, -51
	mov	eax, edx
	mul	cl
	shr	ax, 8
	mov	edx, eax
	shr	dl, 3
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	add	eax, eax
	sub	ecx, eax
	mov	edx, ecx
	lea	ebx, 48[rdx]
	mov	rax, QWORD PTR 66568[rbp]
	mov	rdx, rax
	lea	rax, .LC77[rip]
	mov	rcx, rax
	call	string_pos
	mov	ecx, ebx
	mov	rdx, QWORD PTR 66568[rbp]
	cdqe
	mov	BYTE PTR [rdx+rax], cl
	mov	eax, DWORD PTR 66896[rbp]
	imul	eax, DWORD PTR 67056[rbp]
	mov	ecx, eax
	mov	eax, DWORD PTR 66900[rbp]
	imul	eax, DWORD PTR 67060[rbp]
	mov	r9d, eax
	mov	r10d, DWORD PTR 66616[rbp]
	mov	edx, DWORD PTR 66620[rbp]
	mov	rax, QWORD PTR 67032[rbp]
	mov	r8d, DWORD PTR 66624[rbp]
	mov	DWORD PTR 72[rsp], r8d
	mov	r8d, DWORD PTR 66896[rbp]
	mov	DWORD PTR 64[rsp], r8d
	mov	r8d, DWORD PTR 66900[rbp]
	mov	DWORD PTR 56[rsp], r8d
	mov	r8, QWORD PTR 66568[rbp]
	mov	QWORD PTR 48[rsp], r8
	mov	r8, QWORD PTR 66904[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_text_color
	mov	eax, DWORD PTR 66896[rbp]
	imul	eax, DWORD PTR 67056[rbp]
	mov	ecx, eax
	mov	eax, DWORD PTR 66900[rbp]
	imul	eax, DWORD PTR 67060[rbp]
	mov	r9d, eax
	mov	eax, DWORD PTR 66896[rbp]
	imul	eax, DWORD PTR 67056[rbp]
	mov	edx, DWORD PTR 66616[rbp]
	lea	r10d, [rax+rdx]
	mov	edx, DWORD PTR 66620[rbp]
	mov	rax, QWORD PTR 67032[rbp]
	mov	r8d, DWORD PTR 66624[rbp]
	mov	DWORD PTR 72[rsp], r8d
	mov	r8d, DWORD PTR 66896[rbp]
	mov	DWORD PTR 64[rsp], r8d
	mov	r8d, DWORD PTR 66900[rbp]
	mov	DWORD PTR 56[rsp], r8d
	lea	r8, 560[rbp]
	mov	QWORD PTR 48[rsp], r8
	mov	r8, QWORD PTR 66904[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_text_color
	mov	eax, DWORD PTR 66620[rbp]
	mov	DWORD PTR 66560[rbp], eax
	mov	eax, DWORD PTR 66896[rbp]
	imul	eax, DWORD PTR 67056[rbp]
	lea	edx, [rax+rax]
	mov	eax, DWORD PTR 66616[rbp]
	add	eax, edx
	mov	DWORD PTR 66556[rbp], eax
	mov	eax, DWORD PTR 66560[rbp]
	add	eax, 256
	mov	DWORD PTR 66552[rbp], eax
	mov	eax, DWORD PTR 66556[rbp]
	add	eax, 256
	mov	DWORD PTR 66548[rbp], eax
	mov	r9d, DWORD PTR 66552[rbp]
	mov	r8d, DWORD PTR 66556[rbp]
	mov	edx, DWORD PTR 66560[rbp]
	mov	rax, QWORD PTR 67032[rbp]
	mov	rcx, QWORD PTR 66816[rbp]
	mov	QWORD PTR 40[rsp], rcx
	mov	ecx, DWORD PTR 66548[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_image
	mov	DWORD PTR 67168[rbp], 0
	jmp	.L285
.L287:
	mov	edx, DWORD PTR 67168[rbp]
	mov	eax, edx
	sar	eax, 31
	shr	eax, 27
	add	edx, eax
	and	edx, 31
	sub	edx, eax
	mov	ecx, edx
	mov	eax, DWORD PTR 67168[rbp]
	lea	edx, 31[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 5
	cdqe
	mov	eax, DWORD PTR 528[rbp+rax*4]
	mov	edx, ecx
	mov	ecx, eax
	call	BG
	test	eax, eax
	jne	.L286
	mov	eax, DWORD PTR 67168[rbp]
	lea	edx, 15[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 4
	add	eax, 1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC78[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 66548[rbp]
	pxor	xmm5, xmm5
	cvtsi2sd	xmm5, DWORD PTR 66556[rbp]
	movq	rax, xmm5
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	lerp
	cvttsd2si	ebx, xmm0
	mov	edx, DWORD PTR 67168[rbp]
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
	movsd	xmm1, QWORD PTR .LC78[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 66552[rbp]
	pxor	xmm3, xmm3
	cvtsi2sd	xmm3, DWORD PTR 66560[rbp]
	movq	rax, xmm3
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	lerp
	cvttsd2si	edi, xmm0
	mov	eax, DWORD PTR 67168[rbp]
	lea	edx, 15[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 4
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC78[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 66548[rbp]
	pxor	xmm4, xmm4
	cvtsi2sd	xmm4, DWORD PTR 66556[rbp]
	movq	rax, xmm4
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	lerp
	cvttsd2si	esi, xmm0
	mov	edx, DWORD PTR 67168[rbp]
	mov	eax, edx
	sar	eax, 31
	shr	eax, 28
	add	edx, eax
	and	edx, 15
	sub	edx, eax
	mov	eax, edx
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC78[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 66552[rbp]
	pxor	xmm5, xmm5
	cvtsi2sd	xmm5, DWORD PTR 66560[rbp]
	movq	rax, xmm5
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	lerp
	cvttsd2si	eax, xmm0
	mov	rcx, QWORD PTR 67032[rbp]
	mov	rdx, QWORD PTR 66808[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	DWORD PTR 32[rsp], ebx
	mov	r9d, edi
	mov	r8d, esi
	mov	edx, eax
	call	draw_image
.L286:
	add	DWORD PTR 67168[rbp], 1
.L285:
	cmp	DWORD PTR 67168[rbp], 255
	jle	.L287
	movzx	eax, BYTE PTR 66567[rbp]
	mov	r8d, 0
	mov	edx, 4
	mov	ecx, eax
	call	BGG
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC78[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 66552[rbp]
	pxor	xmm3, xmm3
	cvtsi2sd	xmm3, DWORD PTR 66560[rbp]
	movq	rax, xmm3
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	lerp
	cvttsd2si	eax, xmm0
	mov	DWORD PTR 66544[rbp], eax
	mov	ecx, 255
	mov	eax, DWORD PTR 66544[rbp]
	lea	r9d, 1[rax]
	mov	eax, DWORD PTR 66544[rbp]
	lea	edx, -1[rax]
	mov	r8d, DWORD PTR 66556[rbp]
	mov	rax, QWORD PTR 67032[rbp]
	mov	DWORD PTR 40[rsp], ecx
	mov	ecx, DWORD PTR 66548[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_rectangle_color
	movzx	eax, BYTE PTR 66567[rbp]
	mov	r8d, 1
	mov	edx, 4
	mov	ecx, eax
	call	BGG
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC78[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 66548[rbp]
	pxor	xmm4, xmm4
	cvtsi2sd	xmm4, DWORD PTR 66556[rbp]
	movq	rax, xmm4
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	lerp
	cvttsd2si	eax, xmm0
	mov	DWORD PTR 66540[rbp], eax
	mov	r10d, 255
	mov	eax, DWORD PTR 66540[rbp]
	lea	ecx, 1[rax]
	mov	eax, DWORD PTR 66540[rbp]
	lea	r8d, -1[rax]
	mov	r9d, DWORD PTR 66552[rbp]
	mov	edx, DWORD PTR 66560[rbp]
	mov	rax, QWORD PTR 67032[rbp]
	mov	DWORD PTR 40[rsp], r10d
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_rectangle_color
	mov	esi, 255
	movzx	eax, BYTE PTR 66567[rbp]
	mov	r8d, 1
	mov	edx, 4
	mov	ecx, eax
	call	BGG
	add	eax, 1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC78[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 66548[rbp]
	pxor	xmm5, xmm5
	cvtsi2sd	xmm5, DWORD PTR 66556[rbp]
	movq	rax, xmm5
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	lerp
	cvttsd2si	ebx, xmm0
	movzx	eax, BYTE PTR 66567[rbp]
	mov	r8d, 0
	mov	edx, 4
	mov	ecx, eax
	call	BGG
	add	eax, 1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC78[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 66552[rbp]
	pxor	xmm7, xmm7
	cvtsi2sd	xmm7, DWORD PTR 66560[rbp]
	movq	rax, xmm7
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	lerp
	cvttsd2si	ecx, xmm0
	mov	r8d, DWORD PTR 66540[rbp]
	mov	edx, DWORD PTR 66544[rbp]
	mov	rax, QWORD PTR 67032[rbp]
	mov	DWORD PTR 40[rsp], esi
	mov	DWORD PTR 32[rsp], ebx
	mov	r9d, ecx
	mov	rcx, rax
	call	draw_rectangle_color
	mov	DWORD PTR 67164[rbp], 0
	mov	eax, DWORD PTR 67056[rbp]
	sal	eax, 5
	mov	edx, eax
	mov	eax, DWORD PTR 66548[rbp]
	add	eax, edx
	mov	DWORD PTR 66536[rbp], eax
	mov	edx, DWORD PTR 66624[rbp]
	mov	rax, QWORD PTR 67032[rbp]
	mov	rcx, rax
	call	draw_set_color
	mov	DWORD PTR 67160[rbp], 0
	jmp	.L288
.L291:
	mov	edx, DWORD PTR 67200[rbp]
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
	mov	eax, DWORD PTR 67200[rbp]
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
	mov	eax, DWORD PTR 67200[rbp]
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
	mov	eax, DWORD PTR 67200[rbp]
	movsx	r9, eax
	imul	r9, r9, 458129845
	shr	r9, 32
	sar	r9d, 6
	sar	eax, 31
	mov	r10d, r9d
	sub	r10d, eax
	mov	eax, DWORD PTR 67160[rbp]
	mov	DWORD PTR 40[rsp], ecx
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, 737
	mov	edx, r10d
	mov	ecx, eax
	call	mux_int
	mov	DWORD PTR 66520[rbp], eax
	cmp	DWORD PTR 67160[rbp], 2
	je	.L289
	mov	eax, DWORD PTR 66520[rbp]
	sal	eax, 4
	mov	ecx, eax
	mov	eax, DWORD PTR 67160[rbp]
	add	eax, 1
	imul	eax, DWORD PTR 67060[rbp]
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR 66620[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 67164[rbp]
	lea	r9d, [rdx+rax]
	mov	eax, DWORD PTR 67160[rbp]
	imul	eax, DWORD PTR 67060[rbp]
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR 66620[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 67164[rbp]
	add	edx, eax
	mov	r8d, DWORD PTR 66548[rbp]
	mov	rax, QWORD PTR 67032[rbp]
	mov	DWORD PTR 72[rsp], 32
	mov	DWORD PTR 64[rsp], 16
	mov	DWORD PTR 56[rsp], 0
	mov	DWORD PTR 48[rsp], ecx
	mov	rcx, QWORD PTR 66888[rbp]
	mov	QWORD PTR 40[rsp], rcx
	mov	ecx, DWORD PTR 66536[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_image_part
	mov	eax, DWORD PTR 67060[rbp]
	add	DWORD PTR 67164[rbp], eax
	jmp	.L290
.L289:
	mov	eax, DWORD PTR 66896[rbp]
	imul	eax, DWORD PTR 67056[rbp]
	mov	ecx, eax
	mov	eax, DWORD PTR 66900[rbp]
	imul	eax, DWORD PTR 67060[rbp]
	mov	r9d, eax
	mov	eax, DWORD PTR 67060[rbp]
	sal	eax, 5
	mov	edx, eax
	mov	eax, DWORD PTR 66620[rbp]
	add	edx, eax
	mov	r10d, DWORD PTR 66548[rbp]
	mov	rax, QWORD PTR 67032[rbp]
	mov	r8d, DWORD PTR 66624[rbp]
	mov	DWORD PTR 72[rsp], r8d
	mov	r8d, DWORD PTR 66896[rbp]
	mov	DWORD PTR 64[rsp], r8d
	mov	r8d, DWORD PTR 66900[rbp]
	mov	DWORD PTR 56[rsp], r8d
	lea	r8, .LC79[rip]
	mov	QWORD PTR 48[rsp], r8
	mov	r8, QWORD PTR 66904[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_text_color
.L290:
	add	DWORD PTR 67160[rbp], 1
.L288:
	cmp	DWORD PTR 67160[rbp], 4
	jle	.L291
	mov	edx, 16777215
	mov	rax, QWORD PTR 67032[rbp]
	mov	rcx, rax
	call	draw_set_color
	mov	DWORD PTR 66532[rbp], 0
	mov	eax, DWORD PTR 67200[rbp]
	mov	DWORD PTR 32[rsp], 59
	mov	r9d, 5
	mov	r8d, 0
	mov	edx, 0
	mov	ecx, eax
	call	clock_is_between
	test	eax, eax
	je	.L292
	mov	DWORD PTR 66532[rbp], 0
.L292:
	mov	eax, DWORD PTR 67200[rbp]
	mov	DWORD PTR 32[rsp], 59
	mov	r9d, 11
	mov	r8d, 0
	mov	edx, 6
	mov	ecx, eax
	call	clock_is_between
	test	eax, eax
	je	.L293
	mov	DWORD PTR 66532[rbp], 1
.L293:
	mov	eax, DWORD PTR 67200[rbp]
	mov	DWORD PTR 32[rsp], 59
	mov	r9d, 17
	mov	r8d, 0
	mov	edx, 12
	mov	ecx, eax
	call	clock_is_between
	test	eax, eax
	je	.L294
	mov	DWORD PTR 66532[rbp], 2
.L294:
	mov	eax, DWORD PTR 67200[rbp]
	mov	DWORD PTR 32[rsp], 59
	mov	r9d, 23
	mov	r8d, 0
	mov	edx, 18
	mov	ecx, eax
	call	clock_is_between
	test	eax, eax
	je	.L295
	mov	DWORD PTR 66532[rbp], 3
.L295:
	mov	edx, DWORD PTR 66536[rbp]
	mov	eax, DWORD PTR 67056[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 66896[rbp]
	imul	eax, DWORD PTR 67056[rbp]
	add	eax, edx
	mov	DWORD PTR 66528[rbp], eax
	mov	edx, DWORD PTR 67056[rbp]
	mov	eax, edx
	add	eax, eax
	add	eax, edx
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR 66528[rbp]
	add	eax, edx
	mov	DWORD PTR 66524[rbp], eax
	mov	eax, DWORD PTR 67060[rbp]
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR 66620[rbp]
	lea	r9d, [rdx+rax]
	mov	r8d, DWORD PTR 66528[rbp]
	mov	edx, DWORD PTR 66620[rbp]
	mov	rax, QWORD PTR 67032[rbp]
	mov	rcx, QWORD PTR 66792[rbp]
	mov	QWORD PTR 40[rsp], rcx
	mov	ecx, DWORD PTR 66524[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_image
	mov	eax, DWORD PTR 66896[rbp]
	imul	eax, DWORD PTR 67056[rbp]
	mov	ebx, eax
	mov	eax, DWORD PTR 66900[rbp]
	imul	eax, DWORD PTR 67060[rbp]
	mov	esi, eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 66524[rbp]
	pxor	xmm3, xmm3
	cvtsi2sd	xmm3, DWORD PTR 66528[rbp]
	movq	rax, xmm3
	movsd	xmm1, QWORD PTR .LC80[rip]
	movapd	xmm2, xmm1
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	lerp
	cvttsd2si	r8d, xmm0
	mov	eax, DWORD PTR 66620[rbp]
	lea	edx, 48[rax]
	mov	rax, QWORD PTR 67032[rbp]
	mov	ecx, DWORD PTR 66624[rbp]
	mov	DWORD PTR 72[rsp], ecx
	mov	ecx, DWORD PTR 66896[rbp]
	mov	DWORD PTR 64[rsp], ecx
	mov	ecx, DWORD PTR 66900[rbp]
	mov	DWORD PTR 56[rsp], ecx
	lea	rcx, 372[rbp]
	mov	QWORD PTR 48[rsp], rcx
	mov	rcx, QWORD PTR 66904[rbp]
	mov	QWORD PTR 40[rsp], rcx
	mov	DWORD PTR 32[rsp], ebx
	mov	r9d, esi
	mov	rcx, rax
	call	draw_text_color
	mov	rsp, r13
.L284:
	mov	eax, DWORD PTR 67064[rbp]
	mov	DWORD PTR 66516[rbp], eax
	mov	DWORD PTR 67156[rbp], 0
	jmp	.L296
.L306:
	mov	DWORD PTR 67152[rbp], 0
	jmp	.L297
.L305:
	mov	eax, DWORD PTR 67156[rbp]
	imul	eax, DWORD PTR 67068[rbp]
	mov	edx, DWORD PTR 67152[rbp]
	add	eax, edx
	mov	DWORD PTR 66364[rbp], eax
	mov	eax, DWORD PTR 67152[rbp]
	imul	eax, DWORD PTR 67060[rbp]
	imul	eax, DWORD PTR 67064[rbp]
	mov	edx, DWORD PTR 67092[rbp]
	add	eax, edx
	mov	DWORD PTR 66360[rbp], eax
	mov	eax, DWORD PTR 67156[rbp]
	imul	eax, DWORD PTR 67056[rbp]
	imul	eax, DWORD PTR 67064[rbp]
	mov	edx, DWORD PTR 67088[rbp]
	add	eax, edx
	mov	DWORD PTR 66356[rbp], eax
	mov	eax, DWORD PTR 67152[rbp]
	add	eax, 1
	imul	eax, DWORD PTR 67060[rbp]
	imul	eax, DWORD PTR 67064[rbp]
	mov	edx, DWORD PTR 67092[rbp]
	add	eax, edx
	mov	DWORD PTR 66352[rbp], eax
	mov	eax, DWORD PTR 67156[rbp]
	add	eax, 1
	imul	eax, DWORD PTR 67056[rbp]
	imul	eax, DWORD PTR 67064[rbp]
	mov	edx, DWORD PTR 67088[rbp]
	add	eax, edx
	mov	DWORD PTR 66348[rbp], eax
	mov	r9d, 16711680
	mov	r8d, 65280
	mov	r10d, 255
	mov	ecx, DWORD PTR 66364[rbp]
	movsx	rax, ecx
	imul	rax, rax, 1431655766
	shr	rax, 32
	mov	edx, ecx
	sar	edx, 31
	sub	eax, edx
	mov	edx, eax
	add	edx, edx
	add	edx, eax
	mov	eax, ecx
	sub	eax, edx
	mov	edx, r10d
	mov	ecx, eax
	call	mux_int
	mov	DWORD PTR 66344[rbp], eax
	mov	r9d, DWORD PTR 66352[rbp]
	mov	r8d, DWORD PTR 66356[rbp]
	mov	edx, DWORD PTR 66360[rbp]
	mov	rax, QWORD PTR 67032[rbp]
	mov	ecx, DWORD PTR 66344[rbp]
	mov	DWORD PTR 40[rsp], ecx
	mov	ecx, DWORD PTR 66348[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_rectangle_color
	mov	eax, DWORD PTR 66836[rbp]
	imul	eax, DWORD PTR 67192[rbp]
	mov	edx, DWORD PTR 66364[rbp]
	add	eax, edx
	mov	DWORD PTR 66340[rbp], eax
	mov	eax, DWORD PTR 66340[rbp]
	cdqe
	movzx	eax, BYTE PTR 576[rbp+rax]
	movzx	eax, al
	mov	DWORD PTR 66336[rbp], eax
	cmp	DWORD PTR 66336[rbp], 143
	jle	.L298
	cmp	DWORD PTR 66336[rbp], 159
	jg	.L298
	mov	DWORD PTR 66332[rbp], 16
	cmp	DWORD PTR 66336[rbp], 144
	jne	.L299
	mov	eax, 60
	jmp	.L300
.L299:
	mov	eax, 120
.L300:
	mov	DWORD PTR 66328[rbp], eax
	call	get_timer
	mov	DWORD PTR 66324[rbp], eax
	cmp	DWORD PTR 66336[rbp], 144
	jne	.L301
	mov	rax, QWORD PTR 66952[rbp]
	mov	QWORD PTR 67144[rbp], rax
	jmp	.L302
.L301:
	cmp	DWORD PTR 66336[rbp], 148
	jne	.L303
	mov	rax, QWORD PTR 66944[rbp]
	mov	QWORD PTR 67144[rbp], rax
	jmp	.L302
.L303:
	mov	rax, QWORD PTR 66952[rbp]
	mov	QWORD PTR 67144[rbp], rax
.L302:
	mov	eax, DWORD PTR 66324[rbp]
	cdq
	idiv	DWORD PTR 66328[rbp]
	cdq
	idiv	DWORD PTR 66332[rbp]
	mov	eax, edx
	imul	eax, DWORD PTR 66516[rbp]
	mov	ecx, eax
	mov	r9d, DWORD PTR 66352[rbp]
	mov	r10d, DWORD PTR 66356[rbp]
	mov	edx, DWORD PTR 66360[rbp]
	mov	rax, QWORD PTR 67032[rbp]
	mov	r8d, DWORD PTR 66516[rbp]
	mov	DWORD PTR 72[rsp], r8d
	mov	r8d, DWORD PTR 66516[rbp]
	mov	DWORD PTR 64[rsp], r8d
	mov	DWORD PTR 56[rsp], 0
	mov	DWORD PTR 48[rsp], ecx
	mov	rcx, QWORD PTR 67144[rbp]
	mov	QWORD PTR 40[rsp], rcx
	mov	ecx, DWORD PTR 66348[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_image_part
	jmp	.L304
.L298:
	mov	eax, DWORD PTR 66336[rbp]
	cdq
	idiv	DWORD PTR 67068[rbp]
	imul	eax, DWORD PTR 66516[rbp]
	mov	r8d, eax
	mov	eax, DWORD PTR 66336[rbp]
	cdq
	idiv	DWORD PTR 67068[rbp]
	mov	eax, edx
	imul	eax, DWORD PTR 66516[rbp]
	mov	ecx, eax
	mov	r11d, DWORD PTR 66352[rbp]
	mov	r10d, DWORD PTR 66356[rbp]
	mov	edx, DWORD PTR 66360[rbp]
	mov	rax, QWORD PTR 67032[rbp]
	mov	r9d, DWORD PTR 66516[rbp]
	mov	DWORD PTR 72[rsp], r9d
	mov	r9d, DWORD PTR 66516[rbp]
	mov	DWORD PTR 64[rsp], r9d
	mov	DWORD PTR 56[rsp], r8d
	mov	DWORD PTR 48[rsp], ecx
	mov	rcx, QWORD PTR 66936[rbp]
	mov	QWORD PTR 40[rsp], rcx
	mov	ecx, DWORD PTR 66348[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	r9d, r11d
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_image_part
.L304:
	add	DWORD PTR 67152[rbp], 1
.L297:
	mov	eax, DWORD PTR 67152[rbp]
	cmp	eax, DWORD PTR 67068[rbp]
	jl	.L305
	add	DWORD PTR 67156[rbp], 1
.L296:
	mov	eax, DWORD PTR 67156[rbp]
	cmp	eax, DWORD PTR 67068[rbp]
	jl	.L306
	movzx	eax, BYTE PTR 496[rbp]
	movzx	eax, al
	imul	eax, DWORD PTR 66516[rbp]
	mov	edx, eax
	movzx	eax, BYTE PTR 501[rbp]
	movzx	eax, al
	imul	edx, eax
	movzx	eax, BYTE PTR 500[rbp]
	movzx	eax, al
	imul	eax, DWORD PTR 66516[rbp]
	lea	r8d, [rdx+rax]
	mov	edx, DWORD PTR 484[rbp]
	mov	eax, DWORD PTR 66516[rbp]
	imul	eax, DWORD PTR 67056[rbp]
	lea	ecx, [rdx+rax]
	mov	edx, DWORD PTR 480[rbp]
	mov	eax, DWORD PTR 66516[rbp]
	imul	eax, DWORD PTR 67060[rbp]
	lea	r11d, [rdx+rax]
	mov	r10d, DWORD PTR 484[rbp]
	mov	edx, DWORD PTR 480[rbp]
	mov	rax, QWORD PTR 67032[rbp]
	mov	r9d, DWORD PTR 66516[rbp]
	mov	DWORD PTR 72[rsp], r9d
	mov	r9d, DWORD PTR 66516[rbp]
	mov	DWORD PTR 64[rsp], r9d
	mov	DWORD PTR 56[rsp], 0
	mov	DWORD PTR 48[rsp], r8d
	mov	r8, QWORD PTR 66912[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r9d, r11d
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_image_part
	cmp	DWORD PTR 67208[rbp], 0
	jle	.L307
	mov	eax, DWORD PTR 480[rbp]
	add	eax, 60
	mov	DWORD PTR 66240[rbp], eax
	mov	eax, DWORD PTR 484[rbp]
	sub	eax, 120
	mov	DWORD PTR 66244[rbp], eax
	mov	rax, QWORD PTR 67032[rbp]
	mov	DWORD PTR 32[rsp], 255
	mov	r9d, 255
	mov	r8d, 255
	mov	edx, 255
	mov	rcx, rax
	call	SDL_SetRenderDrawColor
	mov	rdx, QWORD PTR 67008[rbp]
	mov	rax, QWORD PTR 67032[rbp]
	mov	rcx, rax
	call	SDL_RenderFillRect
	mov	rax, QWORD PTR 67032[rbp]
	mov	DWORD PTR 32[rsp], 255
	mov	r9d, 255
	mov	r8d, 255
	mov	edx, 255
	mov	rcx, rax
	call	SDL_SetRenderDrawColor
	mov	rax, QWORD PTR 67008[rbp]
	mov	ecx, DWORD PTR 4[rax]
	mov	rax, QWORD PTR 67008[rbp]
	mov	eax, DWORD PTR 12[rax]
	lea	edx, 3[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 2
	add	ecx, eax
	mov	rax, QWORD PTR 67008[rbp]
	mov	eax, DWORD PTR [rax]
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax
	mov	rax, QWORD PTR 67008[rbp]
	mov	eax, DWORD PTR 8[rax]
	pxor	xmm2, xmm2
	cvtsi2sd	xmm2, eax
	movsd	xmm0, QWORD PTR .LC81[rip]
	mulsd	xmm0, xmm2
	addsd	xmm0, xmm1
	cvttsd2si	r8d, xmm0
	mov	eax, DWORD PTR 484[rbp]
	lea	r10d, -15[rax]
	mov	eax, DWORD PTR 480[rbp]
	lea	edx, 45[rax]
	mov	rax, QWORD PTR 67032[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	r9d, r8d
	mov	r8d, r10d
	mov	rcx, rax
	call	SDL_RenderDrawLine
	mov	rax, QWORD PTR 67008[rbp]
	mov	edx, DWORD PTR 4[rax]
	mov	rax, QWORD PTR 67008[rbp]
	mov	eax, DWORD PTR 12[rax]
	lea	ecx, [rdx+rax]
	mov	rax, QWORD PTR 67008[rbp]
	mov	eax, DWORD PTR [rax]
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax
	mov	rax, QWORD PTR 67008[rbp]
	mov	eax, DWORD PTR 8[rax]
	pxor	xmm2, xmm2
	cvtsi2sd	xmm2, eax
	movsd	xmm0, QWORD PTR .LC82[rip]
	mulsd	xmm0, xmm2
	addsd	xmm0, xmm1
	cvttsd2si	r8d, xmm0
	mov	eax, DWORD PTR 484[rbp]
	lea	r10d, -15[rax]
	mov	eax, DWORD PTR 480[rbp]
	lea	edx, 45[rax]
	mov	rax, QWORD PTR 67032[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	r9d, r8d
	mov	r8d, r10d
	mov	rcx, rax
	call	SDL_RenderDrawLine
	mov	DWORD PTR 332[rbp], 0
	mov	rax, QWORD PTR 67008[rbp]
	mov	eax, DWORD PTR 8[rax]
	sub	eax, 10
	mov	DWORD PTR 66512[rbp], eax
	mov	r8d, DWORD PTR 66512[rbp]
	mov	ecx, DWORD PTR 332[rbp]
	mov	rdx, QWORD PTR 67016[rbp]
	mov	rax, QWORD PTR 66992[rbp]
	mov	r9d, r8d
	mov	r8d, ecx
	mov	rcx, rax
	call	TTF_RenderText_Blended_Wrapped
	mov	QWORD PTR 67136[rbp], rax
	cmp	QWORD PTR 67136[rbp], 0
	jne	.L308
	mov	edx, DWORD PTR 332[rbp]
	mov	rax, QWORD PTR 66992[rbp]
	mov	r8d, edx
	lea	rdx, .LC83[rip]
	mov	rcx, rax
	call	TTF_RenderText_Solid
	mov	QWORD PTR 67136[rbp], rax
.L308:
	mov	rax, QWORD PTR 67136[rbp]
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR 66508[rbp], eax
	mov	rax, QWORD PTR 67136[rbp]
	mov	eax, DWORD PTR 20[rax]
	mov	DWORD PTR 66504[rbp], eax
	mov	rax, QWORD PTR 67008[rbp]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR 67008[rbp]
	mov	eax, DWORD PTR 8[rax]
	sub	eax, DWORD PTR 66508[rbp]
	mov	ecx, eax
	shr	ecx, 31
	add	eax, ecx
	sar	eax
	add	eax, edx
	mov	DWORD PTR 66500[rbp], eax
	mov	rax, QWORD PTR 67008[rbp]
	mov	edx, DWORD PTR 4[rax]
	mov	rax, QWORD PTR 67008[rbp]
	mov	eax, DWORD PTR 12[rax]
	sub	eax, DWORD PTR 66504[rbp]
	mov	ecx, eax
	shr	ecx, 31
	add	eax, ecx
	sar	eax
	add	eax, edx
	mov	DWORD PTR 66496[rbp], eax
	mov	eax, DWORD PTR 66500[rbp]
	mov	DWORD PTR 304[rbp], eax
	mov	eax, DWORD PTR 66496[rbp]
	mov	DWORD PTR 308[rbp], eax
	mov	eax, DWORD PTR 66508[rbp]
	mov	DWORD PTR 312[rbp], eax
	mov	eax, DWORD PTR 66504[rbp]
	mov	DWORD PTR 316[rbp], eax
	mov	rdx, QWORD PTR 67136[rbp]
	mov	rax, QWORD PTR 67032[rbp]
	mov	rcx, rax
	call	SDL_CreateTextureFromSurface
	mov	QWORD PTR 66488[rbp], rax
	lea	rcx, 304[rbp]
	mov	rdx, QWORD PTR 66488[rbp]
	mov	rax, QWORD PTR 67032[rbp]
	mov	r9, rcx
	mov	r8d, 0
	mov	rcx, rax
	call	SDL_RenderCopy
	mov	rax, QWORD PTR 67136[rbp]
	mov	rcx, rax
	call	SDL_FreeSurface
	mov	rax, QWORD PTR 66488[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
.L307:
	mov	eax, DWORD PTR quizOn1[rip]
	cmp	eax, 1
	jne	.L309
	mov	eax, DWORD PTR quiz1Num[rip]
	cmp	eax, 1
	jne	.L310
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 1
	jne	.L311
	lea	rax, .LC84[rip]
	mov	QWORD PTR quizQuestion[rip], rax
	lea	rax, .LC85[rip]
	mov	QWORD PTR answerA[rip], rax
	lea	rax, .LC86[rip]
	mov	QWORD PTR answerB[rip], rax
	lea	rax, .LC87[rip]
	mov	QWORD PTR answerC[rip], rax
	mov	DWORD PTR userAnswer[rip], 0
	add	DWORD PTR 67204[rbp], 500
	mov	eax, DWORD PTR quiz1Num[rip]
	add	eax, 1
	mov	DWORD PTR quiz1Num[rip], eax
.L311:
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 2
	jne	.L312
	lea	rax, .LC88[rip]
	mov	QWORD PTR quizQuestion[rip], rax
	lea	rax, .LC85[rip]
	mov	QWORD PTR answerA[rip], rax
	lea	rax, .LC86[rip]
	mov	QWORD PTR answerB[rip], rax
	lea	rax, .LC87[rip]
	mov	QWORD PTR answerC[rip], rax
	mov	DWORD PTR userAnswer[rip], 0
	mov	eax, DWORD PTR quiz1Num[rip]
	add	eax, 1
	mov	DWORD PTR quiz1Num[rip], eax
.L312:
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 3
	jne	.L309
	lea	rax, .LC88[rip]
	mov	QWORD PTR quizQuestion[rip], rax
	lea	rax, .LC85[rip]
	mov	QWORD PTR answerA[rip], rax
	lea	rax, .LC86[rip]
	mov	QWORD PTR answerB[rip], rax
	lea	rax, .LC87[rip]
	mov	QWORD PTR answerC[rip], rax
	mov	DWORD PTR userAnswer[rip], 0
	mov	eax, DWORD PTR quiz1Num[rip]
	add	eax, 1
	mov	DWORD PTR quiz1Num[rip], eax
	jmp	.L309
.L310:
	mov	eax, DWORD PTR quiz1Num[rip]
	cmp	eax, 2
	jne	.L313
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 1
	jne	.L314
	lea	rax, .LC89[rip]
	mov	QWORD PTR quizQuestion[rip], rax
	lea	rax, .LC90[rip]
	mov	QWORD PTR answerA[rip], rax
	lea	rax, .LC90[rip]
	mov	QWORD PTR answerB[rip], rax
	lea	rax, .LC90[rip]
	mov	QWORD PTR answerC[rip], rax
	mov	DWORD PTR userAnswer[rip], 0
	mov	eax, DWORD PTR quiz1Num[rip]
	add	eax, 1
	mov	DWORD PTR quiz1Num[rip], eax
.L314:
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 2
	jne	.L315
	lea	rax, .LC91[rip]
	mov	QWORD PTR quizQuestion[rip], rax
	lea	rax, .LC90[rip]
	mov	QWORD PTR answerA[rip], rax
	lea	rax, .LC90[rip]
	mov	QWORD PTR answerB[rip], rax
	lea	rax, .LC90[rip]
	mov	QWORD PTR answerC[rip], rax
	mov	DWORD PTR userAnswer[rip], 0
	add	DWORD PTR 67204[rbp], 500
	mov	eax, DWORD PTR quiz1Num[rip]
	add	eax, 1
	mov	DWORD PTR quiz1Num[rip], eax
.L315:
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 3
	jne	.L309
	lea	rax, .LC91[rip]
	mov	QWORD PTR quizQuestion[rip], rax
	lea	rax, .LC90[rip]
	mov	QWORD PTR answerA[rip], rax
	lea	rax, .LC90[rip]
	mov	QWORD PTR answerB[rip], rax
	lea	rax, .LC90[rip]
	mov	QWORD PTR answerC[rip], rax
	mov	DWORD PTR userAnswer[rip], 0
	add	DWORD PTR 67204[rbp], 500
	mov	eax, DWORD PTR quiz1Num[rip]
	add	eax, 1
	mov	DWORD PTR quiz1Num[rip], eax
	jmp	.L309
.L313:
	mov	DWORD PTR quiz1Num[rip], 3
	lea	rax, .LC92[rip]
	mov	QWORD PTR quizQuestion[rip], rax
	lea	rax, .LC93[rip]
	mov	QWORD PTR answerA[rip], rax
	lea	rax, .LC90[rip]
	mov	QWORD PTR answerB[rip], rax
	lea	rax, .LC90[rip]
	mov	QWORD PTR answerC[rip], rax
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 1
	jne	.L316
	mov	DWORD PTR quizOn1[rip], 0
	mov	BYTE PTR quizOn[rip], 0
.L316:
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 2
	jne	.L317
	mov	DWORD PTR quizOn1[rip], 0
	mov	BYTE PTR quizOn[rip], 0
.L317:
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 3
	jne	.L309
	mov	DWORD PTR quizOn1[rip], 0
	mov	BYTE PTR quizOn[rip], 0
.L309:
	movzx	eax, BYTE PTR quizOn[rip]
	test	al, al
	je	.L318
	mov	DWORD PTR 300[rbp], 0
	mov	BYTE PTR 300[rbp], -56
	mov	BYTE PTR 301[rbp], -56
	mov	BYTE PTR 302[rbp], -56
	movzx	eax, BYTE PTR 302[rbp]
	movzx	r8d, al
	movzx	eax, BYTE PTR 301[rbp]
	movzx	edx, al
	movzx	eax, BYTE PTR 300[rbp]
	movzx	eax, al
	mov	rcx, QWORD PTR 67032[rbp]
	mov	DWORD PTR 32[rsp], 255
	mov	r9d, r8d
	mov	r8d, edx
	mov	edx, eax
	call	SDL_SetRenderDrawColor
	mov	DWORD PTR 66484[rbp], 400
	mov	DWORD PTR 66480[rbp], 200
	mov	eax, 800
	sub	eax, DWORD PTR 66484[rbp]
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	add	eax, 300
	mov	DWORD PTR 66476[rbp], eax
	mov	eax, 600
	sub	eax, DWORD PTR 66480[rbp]
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	mov	DWORD PTR 66472[rbp], eax
	mov	eax, DWORD PTR 66476[rbp]
	mov	DWORD PTR 272[rbp], eax
	mov	eax, DWORD PTR 66472[rbp]
	mov	DWORD PTR 276[rbp], eax
	mov	eax, DWORD PTR 66484[rbp]
	mov	DWORD PTR 280[rbp], eax
	mov	eax, DWORD PTR 66480[rbp]
	mov	DWORD PTR 284[rbp], eax
	lea	rax, 272[rbp]
	mov	rcx, QWORD PTR 67032[rbp]
	mov	rdx, rax
	call	SDL_RenderFillRect
	mov	DWORD PTR 268[rbp], 0
	mov	eax, DWORD PTR 66484[rbp]
	sub	eax, 20
	mov	DWORD PTR 66468[rbp], eax
	mov	r8, QWORD PTR answerC[rip]
	mov	rcx, QWORD PTR answerB[rip]
	mov	rdx, QWORD PTR answerA[rip]
	mov	r9, QWORD PTR quizQuestion[rip]
	lea	rax, -32[rbp]
	mov	QWORD PTR 48[rsp], r8
	mov	QWORD PTR 40[rsp], rcx
	mov	QWORD PTR 32[rsp], rdx
	lea	r8, .LC94[rip]
	mov	edx, 256
	mov	rcx, rax
	call	snprintf
	mov	r8d, DWORD PTR 66468[rbp]
	mov	edx, DWORD PTR 268[rbp]
	lea	rax, -32[rbp]
	mov	rcx, QWORD PTR 66992[rbp]
	mov	r9d, r8d
	mov	r8d, edx
	mov	rdx, rax
	call	TTF_RenderText_Blended_Wrapped
	mov	QWORD PTR 66456[rbp], rax
	mov	rdx, QWORD PTR 66456[rbp]
	mov	rax, QWORD PTR 67032[rbp]
	mov	rcx, rax
	call	SDL_CreateTextureFromSurface
	mov	QWORD PTR 66448[rbp], rax
	mov	rax, QWORD PTR 66456[rbp]
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR 66444[rbp], eax
	mov	rax, QWORD PTR 66456[rbp]
	mov	eax, DWORD PTR 20[rax]
	mov	DWORD PTR 66440[rbp], eax
	mov	eax, DWORD PTR 66484[rbp]
	sub	eax, DWORD PTR 66444[rbp]
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	mov	edx, eax
	mov	eax, DWORD PTR 66476[rbp]
	add	eax, edx
	mov	DWORD PTR 66436[rbp], eax
	mov	eax, DWORD PTR 66480[rbp]
	sub	eax, DWORD PTR 66440[rbp]
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	mov	edx, eax
	mov	eax, DWORD PTR 66472[rbp]
	add	eax, edx
	mov	DWORD PTR 66432[rbp], eax
	mov	eax, DWORD PTR 66436[rbp]
	mov	DWORD PTR 240[rbp], eax
	mov	eax, DWORD PTR 66432[rbp]
	mov	DWORD PTR 244[rbp], eax
	mov	eax, DWORD PTR 66444[rbp]
	mov	DWORD PTR 248[rbp], eax
	mov	eax, DWORD PTR 66440[rbp]
	mov	DWORD PTR 252[rbp], eax
	lea	rcx, 240[rbp]
	mov	rdx, QWORD PTR 66448[rbp]
	mov	rax, QWORD PTR 67032[rbp]
	mov	r9, rcx
	mov	r8d, 0
	mov	rcx, rax
	call	SDL_RenderCopy
	mov	rax, QWORD PTR 66456[rbp]
	mov	rcx, rax
	call	SDL_FreeSurface
	mov	rax, QWORD PTR 66448[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
.L318:
	mov	DWORD PTR 67132[rbp], 0
	jmp	.L319
.L321:
	mov	rdx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 67132[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	mov	eax, DWORD PTR 12[rax]
	test	eax, eax
	je	.L320
	mov	rdx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 67132[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	movss	xmm1, DWORD PTR 4[rax]
	movss	xmm0, DWORD PTR .LC95[rip]
	addss	xmm0, xmm1
	cvttss2si	edx, xmm0
	mov	rcx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 67132[rbp]
	cdqe
	sal	rax, 4
	add	rax, rcx
	movss	xmm1, DWORD PTR [rax]
	movss	xmm0, DWORD PTR .LC96[rip]
	addss	xmm0, xmm1
	cvttss2si	r9d, xmm0
	mov	rcx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 67132[rbp]
	cdqe
	sal	rax, 4
	add	rax, rcx
	movss	xmm0, DWORD PTR 4[rax]
	cvttss2si	r10d, xmm0
	mov	rcx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 67132[rbp]
	cdqe
	sal	rax, 4
	add	rax, rcx
	movss	xmm0, DWORD PTR [rax]
	cvttss2si	eax, xmm0
	mov	rcx, QWORD PTR 67032[rbp]
	mov	r8, QWORD PTR 66952[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], edx
	mov	r8d, r10d
	mov	edx, eax
	call	draw_image
.L320:
	add	DWORD PTR 67132[rbp], 1
.L319:
	mov	eax, 100
	cmp	DWORD PTR 67132[rbp], eax
	jl	.L321
	mov	rax, QWORD PTR globalEnemy[rip]
	test	rax, rax
	je	.L322
	mov	rax, QWORD PTR globalEnemy[rip]
	mov	eax, DWORD PTR 16[rax]
	test	eax, eax
	jle	.L322
	mov	rax, QWORD PTR 67032[rbp]
	mov	DWORD PTR 32[rsp], 255
	mov	r9d, 0
	mov	r8d, 0
	mov	edx, 255
	mov	rcx, rax
	call	SDL_SetRenderDrawColor
	mov	rax, QWORD PTR globalEnemy[rip]
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR 224[rbp], eax
	mov	rax, QWORD PTR globalEnemy[rip]
	mov	eax, DWORD PTR 4[rax]
	mov	DWORD PTR 228[rbp], eax
	mov	rax, QWORD PTR globalEnemy[rip]
	mov	eax, DWORD PTR 8[rax]
	mov	DWORD PTR 232[rbp], eax
	mov	rax, QWORD PTR globalEnemy[rip]
	mov	eax, DWORD PTR 12[rax]
	mov	DWORD PTR 236[rbp], eax
	lea	rax, 224[rbp]
	mov	rcx, QWORD PTR 67032[rbp]
	mov	rdx, rax
	call	SDL_RenderFillRect
	mov	rax, QWORD PTR globalEnemy[rip]
	mov	edx, DWORD PTR 4[rax]
	mov	rax, QWORD PTR globalEnemy[rip]
	mov	eax, DWORD PTR 12[rax]
	lea	ecx, [rdx+rax]
	mov	rax, QWORD PTR globalEnemy[rip]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR globalEnemy[rip]
	mov	eax, DWORD PTR 8[rax]
	lea	r9d, [rdx+rax]
	mov	rax, QWORD PTR globalEnemy[rip]
	mov	r10d, DWORD PTR 4[rax]
	mov	rax, QWORD PTR globalEnemy[rip]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR 67032[rbp]
	mov	r8, QWORD PTR 66920[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_image
.L322:
	mov	rax, QWORD PTR globalEnemy[rip]
	test	rax, rax
	je	.L323
	mov	rax, QWORD PTR globalEnemy[rip]
	mov	eax, DWORD PTR 16[rax]
	test	eax, eax
	jg	.L323
	mov	rax, QWORD PTR globalEnemy[rip]
	mov	rcx, rax
	call	resetEnemy
.L323:
	cmp	DWORD PTR 67184[rbp], 0
	je	.L324
	mov	eax, DWORD PTR 67060[rbp]
	sal	eax, 6
	mov	DWORD PTR 66428[rbp], eax
	mov	ecx, DWORD PTR 67100[rbp]
	mov	rax, QWORD PTR 67032[rbp]
	mov	DWORD PTR 40[rsp], 0
	mov	edx, DWORD PTR 67096[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, ecx
	mov	r8d, 0
	mov	edx, 0
	mov	rcx, rax
	call	draw_rectangle_color
	mov	edx, DWORD PTR 67076[rbp]
	mov	eax, DWORD PTR 66428[rbp]
	lea	r9d, [rdx+rax]
	mov	eax, DWORD PTR 67092[rbp]
	sub	eax, DWORD PTR 66428[rbp]
	mov	r8d, DWORD PTR 67088[rbp]
	mov	rcx, QWORD PTR 67032[rbp]
	mov	rdx, QWORD PTR 66752[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	edx, DWORD PTR 67072[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	edx, eax
	call	draw_image
	mov	DWORD PTR 66424[rbp], 16
	call	draw_get_color
	mov	DWORD PTR 66420[rbp], eax
	call	get_timer
	mov	DWORD PTR 66416[rbp], eax
	mov	eax, DWORD PTR 66416[rbp]
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
	mov	DWORD PTR 66412[rbp], edx
	mov	edx, DWORD PTR 66412[rbp]
	imul	edx, edx, 360
	sub	eax, edx
	mov	DWORD PTR 66412[rbp], eax
	mov	eax, DWORD PTR 66416[rbp]
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
	pxor	xmm4, xmm4
	cvtsi2sd	xmm4, edx
	movq	rax, xmm4
	movq	xmm0, rax
	call	dcos
	movsd	xmm1, QWORD PTR .LC97[rip]
	mulsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC98[rip]
	addsd	xmm0, xmm1
	cvttsd2si	eax, xmm0
	mov	DWORD PTR 66408[rbp], eax
	mov	eax, DWORD PTR 66416[rbp]
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
	mov	DWORD PTR 66404[rbp], edx
	mov	DWORD PTR 67128[rbp], 0
	jmp	.L325
.L326:
	mov	eax, DWORD PTR 66424[rbp]
	neg	eax
	imul	eax, DWORD PTR 67060[rbp]
	pxor	xmm6, xmm6
	cvtsi2sd	xmm6, eax
	pxor	xmm5, xmm5
	cvtsi2sd	xmm5, DWORD PTR 66412[rbp]
	movq	rax, xmm5
	movq	xmm0, rax
	call	dcos
	mulsd	xmm6, xmm0
	mov	eax, DWORD PTR 67128[rbp]
	imul	eax, DWORD PTR 67060[rbp]
	pxor	xmm7, xmm7
	cvtsi2sd	xmm7, eax
	pxor	xmm3, xmm3
	cvtsi2sd	xmm3, DWORD PTR 66412[rbp]
	movq	rax, xmm3
	movq	xmm0, rax
	call	dcos
	mulsd	xmm0, xmm7
	addsd	xmm0, xmm6
	cvttsd2si	eax, xmm0
	mov	DWORD PTR 66392[rbp], eax
	mov	eax, DWORD PTR 66424[rbp]
	neg	eax
	imul	eax, DWORD PTR 67056[rbp]
	pxor	xmm6, xmm6
	cvtsi2sd	xmm6, eax
	pxor	xmm7, xmm7
	cvtsi2sd	xmm7, DWORD PTR 66408[rbp]
	movq	rax, xmm7
	movq	xmm0, rax
	call	dsin
	mulsd	xmm6, xmm0
	mov	eax, DWORD PTR 67128[rbp]
	imul	eax, DWORD PTR 67056[rbp]
	pxor	xmm7, xmm7
	cvtsi2sd	xmm7, eax
	pxor	xmm4, xmm4
	cvtsi2sd	xmm4, DWORD PTR 66408[rbp]
	movq	rax, xmm4
	movq	xmm0, rax
	call	dsin
	mulsd	xmm0, xmm7
	addsd	xmm0, xmm6
	cvttsd2si	eax, xmm0
	mov	DWORD PTR 66388[rbp], eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 67128[rbp]
	mov	eax, DWORD PTR 66424[rbp]
	sub	eax, 1
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	movsd	xmm0, QWORD PTR .LC99[rip]
	movapd	xmm1, xmm0
	mov	rax, QWORD PTR .LC100[rip]
	movq	xmm0, rax
	call	lerp
	cvttsd2si	edx, xmm0
	mov	eax, DWORD PTR 66404[rbp]
	mov	r8d, edx
	mov	edx, 32
	mov	ecx, eax
	call	make_color_hsv
	mov	edx, eax
	mov	rax, QWORD PTR 67032[rbp]
	mov	rcx, rax
	call	draw_set_color
	mov	edx, DWORD PTR 67072[rbp]
	mov	eax, DWORD PTR 66388[rbp]
	lea	ecx, [rdx+rax]
	mov	edx, DWORD PTR 67076[rbp]
	mov	eax, DWORD PTR 66428[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 66392[rbp]
	lea	r9d, [rdx+rax]
	mov	edx, DWORD PTR 67088[rbp]
	mov	eax, DWORD PTR 66388[rbp]
	lea	r10d, [rdx+rax]
	mov	eax, DWORD PTR 67092[rbp]
	sub	eax, DWORD PTR 66428[rbp]
	mov	edx, DWORD PTR 66392[rbp]
	add	edx, eax
	mov	rax, QWORD PTR 67032[rbp]
	mov	r8, QWORD PTR 66744[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_image
	add	DWORD PTR 67128[rbp], 1
.L325:
	mov	eax, DWORD PTR 67128[rbp]
	cmp	eax, DWORD PTR 66424[rbp]
	jl	.L326
	mov	edx, DWORD PTR 67076[rbp]
	mov	eax, DWORD PTR 66428[rbp]
	lea	r9d, [rdx+rax]
	mov	eax, DWORD PTR 67092[rbp]
	sub	eax, DWORD PTR 66428[rbp]
	mov	r8d, DWORD PTR 67088[rbp]
	mov	rcx, QWORD PTR 67032[rbp]
	mov	rdx, QWORD PTR 66736[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	edx, DWORD PTR 67072[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	edx, eax
	call	draw_image
	mov	edx, DWORD PTR 66420[rbp]
	mov	rax, QWORD PTR 67032[rbp]
	mov	rcx, rax
	call	draw_set_color
	mov	DWORD PTR 66400[rbp], 384
	mov	DWORD PTR 66396[rbp], 32
	mov	eax, DWORD PTR 66416[rbp]
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
	jle	.L327
	mov	r8d, 65535
	mov	eax, DWORD PTR 66896[rbp]
	imul	eax, DWORD PTR 67056[rbp]
	mov	ecx, eax
	mov	eax, DWORD PTR 66900[rbp]
	imul	eax, DWORD PTR 67060[rbp]
	mov	r9d, eax
	mov	r10d, DWORD PTR 66396[rbp]
	mov	edx, DWORD PTR 66400[rbp]
	mov	rax, QWORD PTR 67032[rbp]
	mov	DWORD PTR 72[rsp], r8d
	mov	r8d, DWORD PTR 66896[rbp]
	mov	DWORD PTR 64[rsp], r8d
	mov	r8d, DWORD PTR 66900[rbp]
	mov	DWORD PTR 56[rsp], r8d
	mov	r8, QWORD PTR 66728[rbp]
	mov	QWORD PTR 48[rsp], r8
	mov	r8, QWORD PTR 66904[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_text_color
.L327:
	mov	DWORD PTR 66400[rbp], 64
	mov	DWORD PTR 66396[rbp], 8
	mov	r8d, 16777215
	mov	eax, DWORD PTR 66896[rbp]
	imul	eax, DWORD PTR 67056[rbp]
	mov	ecx, eax
	mov	eax, DWORD PTR 66900[rbp]
	imul	eax, DWORD PTR 67060[rbp]
	mov	r9d, eax
	mov	edx, DWORD PTR 67088[rbp]
	mov	eax, DWORD PTR 67080[rbp]
	add	eax, edx
	sub	eax, DWORD PTR 66396[rbp]
	mov	edx, eax
	mov	eax, DWORD PTR 66896[rbp]
	imul	eax, DWORD PTR 67056[rbp]
	sub	edx, eax
	mov	r10d, edx
	mov	edx, DWORD PTR 66400[rbp]
	mov	rax, QWORD PTR 67032[rbp]
	mov	DWORD PTR 72[rsp], r8d
	mov	r8d, DWORD PTR 66896[rbp]
	mov	DWORD PTR 64[rsp], r8d
	mov	r8d, DWORD PTR 66900[rbp]
	mov	DWORD PTR 56[rsp], r8d
	mov	r8, QWORD PTR 66720[rbp]
	mov	QWORD PTR 48[rsp], r8
	mov	r8, QWORD PTR 66904[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_text_color
.L324:
	mov	rax, QWORD PTR 67032[rbp]
	mov	DWORD PTR 32[rsp], 255
	mov	r9d, 0
	mov	r8d, 0
	mov	edx, 0
	mov	rcx, rax
	call	SDL_SetRenderDrawColor
	mov	edx, DWORD PTR 67204[rbp]
	lea	rax, 352[rbp]
	mov	r9d, edx
	lea	r8, .LC101[rip]
	mov	edx, 20
	mov	rcx, rax
	call	snprintf
	mov	edx, DWORD PTR 66124[rbp]
	lea	rax, 352[rbp]
	mov	rcx, QWORD PTR 66992[rbp]
	mov	r8d, edx
	mov	rdx, rax
	call	TTF_RenderText_Solid
	mov	QWORD PTR 66376[rbp], rax
	mov	rdx, QWORD PTR 66376[rbp]
	mov	rax, QWORD PTR 67032[rbp]
	mov	rcx, rax
	call	SDL_CreateTextureFromSurface
	mov	QWORD PTR 66368[rbp], rax
	mov	DWORD PTR 336[rbp], 10
	mov	DWORD PTR 340[rbp], 720
	mov	rax, QWORD PTR 66376[rbp]
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR 344[rbp], eax
	mov	rax, QWORD PTR 66376[rbp]
	mov	eax, DWORD PTR 20[rax]
	mov	DWORD PTR 348[rbp], eax
	lea	rcx, 336[rbp]
	mov	rdx, QWORD PTR 66368[rbp]
	mov	rax, QWORD PTR 67032[rbp]
	mov	r9, rcx
	mov	r8d, 0
	mov	rcx, rax
	call	SDL_RenderCopy
	mov	rax, QWORD PTR 66376[rbp]
	mov	rcx, rax
	call	SDL_FreeSurface
	mov	rax, QWORD PTR 66368[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 67032[rbp]
	mov	rcx, rax
	call	SDL_RenderPresent
	mov	ecx, 16
	call	SDL_Delay
.L188:
	cmp	DWORD PTR 67180[rbp], 0
	jne	.L189
	lea	rax, .LC102[rip]
	mov	rcx, rax
	call	puts
	mov	rax, QWORD PTR waterParticles[rip]
	mov	rcx, rax
	call	free
	mov	rax, QWORD PTR 66992[rbp]
	mov	rcx, rax
	call	TTF_CloseFont
	mov	rax, QWORD PTR 66968[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66960[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66952[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66944[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66936[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66816[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66808[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66912[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66752[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66744[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66736[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66904[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66888[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66792[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66928[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66776[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66920[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	call	IMG_Quit
	mov	eax, DWORD PTR 66764[rbp]
	mov	ecx, eax
	call	SDL_CloseAudioDevice
	mov	rax, QWORD PTR 408[rbp]
	mov	rcx, rax
	call	SDL_FreeWAV
	mov	rax, QWORD PTR 67032[rbp]
	mov	rcx, rax
	call	SDL_DestroyRenderer
	mov	rax, QWORD PTR 67040[rbp]
	mov	rcx, rax
	call	SDL_DestroyWindow
	call	SDL_Quit
	mov	ecx, 500
	call	SDL_Delay
	mov	eax, 0
	jmp	.L172
.L177:
	call	SDL_GetError
	mov	rbx, rax
	mov	ecx, 2
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	rcx, rax
	mov	rax, QWORD PTR 67104[rbp]
	mov	r9, rbx
	mov	r8, rax
	lea	rax, .LC103[rip]
	mov	rdx, rax
	call	fprintf
	call	SDL_Quit
	mov	ecx, 1
	call	exit
.L172:
	mov	rsp, r12
	jmp	.L170
.L186:
	mov	rsp, r12
.L170:
	movaps	xmm6, XMMWORD PTR 67216[rbp]
	movaps	xmm7, XMMWORD PTR 67232[rbp]
	lea	rsp, 67256[rbp]
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
.LC78:
	.long	0
	.long	1076887552
	.align 8
.LC80:
	.long	0
	.long	1070596096
	.align 8
.LC81:
	.long	-1717986918
	.long	1069128089
	.align 8
.LC82:
	.long	858993459
	.long	1070805811
	.align 4
.LC95:
	.long	1097859072
	.align 4
.LC96:
	.long	1084227584
	.align 8
.LC97:
	.long	0
	.long	1079164928
	.align 8
.LC98:
	.long	0
	.long	1079410688
	.align 8
.LC99:
	.long	0
	.long	1081073664
	.align 8
.LC100:
	.long	0
	.long	0
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
	.def	SDL_QueryTexture;	.scl	2;	.type	32;	.endef
	.def	cosf;	.scl	2;	.type	32;	.endef
	.def	sinf;	.scl	2;	.type	32;	.endef
	.def	SDL_RenderCopyEx;	.scl	2;	.type	32;	.endef
	.def	SDL_RenderPresent;	.scl	2;	.type	32;	.endef
	.def	SDL_Delay;	.scl	2;	.type	32;	.endef
	.def	SDL_memcpy;	.scl	2;	.type	32;	.endef
	.def	SDL_GetVersion;	.scl	2;	.type	32;	.endef
	.def	SDL_Log;	.scl	2;	.type	32;	.endef
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
	.def	free;	.scl	2;	.type	32;	.endef
	.def	TTF_CloseFont;	.scl	2;	.type	32;	.endef
	.def	IMG_Quit;	.scl	2;	.type	32;	.endef
	.def	SDL_CloseAudioDevice;	.scl	2;	.type	32;	.endef
	.def	SDL_DestroyRenderer;	.scl	2;	.type	32;	.endef
	.def	SDL_DestroyWindow;	.scl	2;	.type	32;	.endef
