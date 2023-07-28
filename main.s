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
	jge	.L137
	mov	edx, DWORD PTR -16[rbp]
	mov	eax, DWORD PTR -8[rbp]
	add	edx, eax
	mov	eax, DWORD PTR -32[rbp]
	cmp	edx, eax
	jle	.L137
	mov	edx, DWORD PTR -12[rbp]
	mov	ecx, DWORD PTR -28[rbp]
	mov	eax, DWORD PTR -20[rbp]
	add	eax, ecx
	cmp	edx, eax
	jge	.L137
	mov	edx, DWORD PTR -12[rbp]
	mov	eax, DWORD PTR -4[rbp]
	add	edx, eax
	mov	eax, DWORD PTR -28[rbp]
	cmp	edx, eax
	jle	.L137
	mov	eax, 1
	jmp	.L139
.L137:
	mov	eax, 0
.L139:
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
	jne	.L141
	mov	rax, QWORD PTR 16[rbp]
	mov	eax, DWORD PTR 32[rax]
	sub	DWORD PTR -8[rbp], eax
	jmp	.L142
.L141:
	mov	rax, QWORD PTR 16[rbp]
	movzx	eax, BYTE PTR 16[rax]
	cmp	al, 1
	jne	.L143
	mov	rax, QWORD PTR 16[rbp]
	mov	eax, DWORD PTR 28[rax]
	add	DWORD PTR -4[rbp], eax
	jmp	.L142
.L143:
	mov	rax, QWORD PTR 16[rbp]
	movzx	eax, BYTE PTR 16[rax]
	cmp	al, 2
	jne	.L144
	mov	rax, QWORD PTR 16[rbp]
	mov	eax, DWORD PTR 32[rax]
	add	DWORD PTR -8[rbp], eax
	jmp	.L142
.L144:
	mov	rax, QWORD PTR 16[rbp]
	movzx	eax, BYTE PTR 16[rax]
	cmp	al, 3
	jne	.L142
	mov	rax, QWORD PTR 16[rbp]
	mov	eax, DWORD PTR 28[rax]
	sub	DWORD PTR -4[rbp], eax
.L142:
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
	mov	QWORD PTR 24[rbp], rdx
	lea	rax, -16[rbp]
	mov	rcx, QWORD PTR 16[rbp]
	mov	rdx, rax
	call	calculateAttackHitbox
	mov	rax, QWORD PTR 24[rbp]
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR -32[rbp], eax
	mov	rax, QWORD PTR 24[rbp]
	mov	eax, DWORD PTR 4[rax]
	mov	DWORD PTR -28[rbp], eax
	mov	rax, QWORD PTR 24[rbp]
	mov	eax, DWORD PTR 8[rax]
	mov	DWORD PTR -24[rbp], eax
	mov	rax, QWORD PTR 24[rbp]
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
	je	.L147
	lea	rax, .LC13[rip]
	mov	rcx, rax
	call	puts
	mov	rax, QWORD PTR 24[rbp]
	mov	edx, DWORD PTR 16[rax]
	mov	rax, QWORD PTR 16[rbp]
	mov	eax, DWORD PTR 24[rax]
	sub	edx, eax
	mov	rax, QWORD PTR 24[rbp]
	mov	DWORD PTR 16[rax], edx
.L147:
	nop
	add	rsp, 96
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
	jb	.L149
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR 12[rax], 0
.L149:
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
	jl	.L155
	mov	eax, DWORD PTR 16[rbp]
	cmp	eax, DWORD PTR -8[rbp]
	jg	.L155
	mov	eax, 1
	jmp	.L157
.L155:
	mov	eax, 0
.L157:
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
	movsd	xmm0, QWORD PTR .LC14[rip]
	mulsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC15[rip]
	addsd	xmm0, xmm1
	movq	rax, xmm0
	movq	xmm0, rax
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC16:
	.ascii "Compiled with SDL version %u.%u.%u ...\12\0"
	.align 8
.LC17:
	.ascii "Linked against SDL version %u.%u.%u.\12\0"
	.align 8
.LC18:
	.ascii "Failed to allocate memory for water particles\12\0"
.LC19:
	.ascii "SDL init error:%s\12\0"
.LC20:
	.ascii "COSC345 - Game\0"
.LC21:
	.ascii "Window error\0"
.LC22:
	.ascii "Render error\0"
.LC23:
	.ascii "Surface error\0"
	.align 8
.LC24:
	.ascii "SDL_ttf could not initialize! TTF_Error: %s\12\0"
.LC25:
	.ascii "font.ttf\0"
	.align 8
.LC26:
	.ascii "Failed to load font! SDL_ttf Error: %s\12\0"
	.align 8
.LC27:
	.ascii "Renderer could not be created! SDL_Error: %s\12\0"
.LC28:
	.ascii "img/spr_grass.png\0"
.LC29:
	.ascii "img/spr_sand.png\0"
.LC30:
	.ascii "img/spr_water_strip16.png\0"
.LC31:
	.ascii "img/spr_lava_strip16.png\0"
.LC32:
	.ascii "tiled/tileset.png\0"
.LC33:
	.ascii "img/hudshade.png\0"
.LC34:
	.ascii "img/player_strip8.png\0"
.LC35:
	.ascii "img/ascii_strip96.png\0"
.LC36:
	.ascii "img/clock1_strip10.png\0"
.LC37:
	.ascii "Night\0"
.LC38:
	.ascii "Morning\0"
.LC39:
	.ascii "Day\0"
.LC40:
	.ascii "Evening\0"
.LC41:
	.ascii "img/dunedin-map.png\0"
.LC42:
	.ascii "img/spr_map_unknown.png\0"
.LC43:
	.ascii "img/spr_thermometer.png\0"
.LC44:
	.ascii "img/spr_nutrients_strip4.png\0"
.LC45:
	.ascii "music.wav\0"
.LC46:
	.ascii "Failed to load WAV file: %s\12\0"
	.align 8
.LC47:
	.ascii "Failed to open audio device: %s\12\0"
.LC48:
	.ascii "img/logo1a.png\0"
.LC49:
	.ascii "img/logo1b.png\0"
.LC50:
	.ascii "img/logo1c.png\0"
.LC51:
	.ascii "Press SPACE to continue.\0"
	.align 8
.LC52:
	.ascii "(C) 2023 - Thomas, Sean, Matthew, Nicholas - COSC345\0"
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
	.ascii "LVL: XYZ/255\0"
.LC62:
	.ascii "X\0"
.LC63:
	.ascii "Y\0"
.LC64:
	.ascii "Z\0"
.LC66:
	.ascii ":\0"
.LC70:
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
	mov	eax, 67048
	call	___chkstk_ms
	sub	rsp, rax
	.seh_stackalloc	67048
	lea	rbp, 128[rsp]
	.seh_setframe	rbp, 128
	movaps	XMMWORD PTR 66880[rbp], xmm6
	.seh_savexmm	xmm6, 67008
	movaps	XMMWORD PTR 66896[rbp], xmm7
	.seh_savexmm	xmm7, 67024
	.seh_endprologue
	mov	DWORD PTR 66992[rbp], ecx
	mov	QWORD PTR 67000[rbp], rdx
	mov	rax, rsp
	mov	r12, rax
	mov	QWORD PTR 66784[rbp], 256
	mov	rax, QWORD PTR 66784[rbp]
	sub	rax, 1
	mov	QWORD PTR 66776[rbp], rax
	mov	rax, QWORD PTR 66784[rbp]
	mov	r10, rax
	mov	r11d, 0
	mov	rax, QWORD PTR 66784[rbp]
	mov	r8, rax
	mov	r9d, 0
	mov	rax, QWORD PTR 66784[rbp]
	add	rax, 15
	shr	rax, 4
	sal	rax, 4
	call	___chkstk_ms
	sub	rsp, rax
	lea	rax, 80[rsp]
	add	rax, 0
	mov	QWORD PTR 66768[rbp], rax
	mov	BYTE PTR 93[rbp], 2
	mov	BYTE PTR 94[rbp], 28
	mov	BYTE PTR 95[rbp], 1
	lea	rax, 90[rbp]
	mov	rcx, rax
	call	SDL_GetVersion
	movzx	eax, BYTE PTR 95[rbp]
	movzx	ecx, al
	movzx	eax, BYTE PTR 94[rbp]
	movzx	edx, al
	movzx	eax, BYTE PTR 93[rbp]
	movzx	eax, al
	mov	r9d, ecx
	mov	r8d, edx
	mov	edx, eax
	lea	rax, .LC16[rip]
	mov	rcx, rax
	call	SDL_Log
	movzx	eax, BYTE PTR 92[rbp]
	movzx	ecx, al
	movzx	eax, BYTE PTR 91[rbp]
	movzx	edx, al
	movzx	eax, BYTE PTR 90[rbp]
	movzx	eax, al
	mov	r9d, ecx
	mov	r8d, edx
	mov	edx, eax
	lea	rax, .LC17[rip]
	mov	rcx, rax
	call	SDL_Log
	mov	DWORD PTR 66764[rbp], 1366
	mov	DWORD PTR 66760[rbp], 768
	mov	eax, DWORD PTR 66764[rbp]
	sub	eax, DWORD PTR 66760[rbp]
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	mov	DWORD PTR 66756[rbp], eax
	mov	DWORD PTR 66752[rbp], 0
	mov	eax, DWORD PTR 66760[rbp]
	mov	DWORD PTR 66748[rbp], eax
	mov	eax, DWORD PTR 66760[rbp]
	mov	DWORD PTR 66744[rbp], eax
	mov	edx, DWORD PTR 66756[rbp]
	mov	eax, DWORD PTR 66748[rbp]
	add	eax, edx
	mov	DWORD PTR 66740[rbp], eax
	mov	edx, DWORD PTR 66752[rbp]
	mov	eax, DWORD PTR 66744[rbp]
	add	eax, edx
	mov	DWORD PTR 66736[rbp], eax
	mov	DWORD PTR 66732[rbp], 16
	mov	DWORD PTR 66728[rbp], 16
	mov	eax, DWORD PTR 66732[rbp]
	mov	ecx, eax
	call	sqr
	mov	esi, eax
	mov	eax, DWORD PTR 66760[rbp]
	cdq
	idiv	esi
	mov	DWORD PTR 66724[rbp], eax
	mov	eax, DWORD PTR 66724[rbp]
	mov	DWORD PTR 66720[rbp], eax
	mov	eax, 100
	cdqe
	sal	rax, 4
	mov	rcx, rax
	call	malloc
	mov	QWORD PTR waterParticles[rip], rax
	mov	rax, QWORD PTR waterParticles[rip]
	test	rax, rax
	jne	.L161
	mov	ecx, 2
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	r9, rax
	mov	r8d, 46
	mov	edx, 1
	lea	rax, .LC18[rip]
	mov	rcx, rax
	call	fwrite
	mov	eax, 1
	jmp	.L162
.L161:
	mov	ecx, 0
	call	time
	mov	ecx, eax
	call	srand
	mov	DWORD PTR 66876[rbp], 0
	jmp	.L163
.L164:
	mov	ecx, DWORD PTR 66760[rbp]
	mov	edx, DWORD PTR 66764[rbp]
	mov	eax, DWORD PTR 66876[rbp]
	mov	r8d, ecx
	mov	ecx, eax
	call	createWaterParticle
	add	DWORD PTR 66876[rbp], 1
.L163:
	mov	eax, 100
	cmp	DWORD PTR 66876[rbp], eax
	jl	.L164
	mov	DWORD PTR 66716[rbp], 62001
	mov	eax, DWORD PTR 66716[rbp]
	mov	ecx, eax
	call	SDL_Init
	test	eax, eax
	je	.L165
	call	SDL_GetError
	mov	rdx, rax
	lea	rax, .LC19[rip]
	mov	rcx, rax
	call	printf
	mov	eax, -1
	jmp	.L162
.L165:
	mov	edx, DWORD PTR 66764[rbp]
	mov	DWORD PTR 40[rsp], 0
	mov	eax, DWORD PTR 66760[rbp]
	mov	DWORD PTR 32[rsp], eax
	mov	r9d, edx
	mov	r8d, 536805376
	mov	edx, 536805376
	lea	rax, .LC20[rip]
	mov	rcx, rax
	call	SDL_CreateWindow
	mov	QWORD PTR 66704[rbp], rax
	cmp	QWORD PTR 66704[rbp], 0
	jne	.L166
	mov	rdx, QWORD PTR 66784[rbp]
	mov	rax, QWORD PTR 66768[rbp]
	lea	r8, .LC21[rip]
	mov	rcx, rax
	call	snprintf
	jmp	.L167
.L166:
	mov	rax, QWORD PTR 66704[rbp]
	mov	r8d, 4
	mov	edx, -1
	mov	rcx, rax
	call	SDL_CreateRenderer
	mov	QWORD PTR 66696[rbp], rax
	cmp	QWORD PTR 66696[rbp], 0
	jne	.L168
	mov	rdx, QWORD PTR 66784[rbp]
	mov	rax, QWORD PTR 66768[rbp]
	lea	r8, .LC22[rip]
	mov	rcx, rax
	call	snprintf
	jmp	.L167
.L168:
	mov	rax, QWORD PTR 66704[rbp]
	mov	rcx, rax
	call	SDL_GetWindowSurface
	mov	QWORD PTR 66688[rbp], rax
	cmp	QWORD PTR 66688[rbp], 0
	jne	.L169
	mov	rdx, QWORD PTR 66784[rbp]
	mov	rax, QWORD PTR 66768[rbp]
	lea	r8, .LC23[rip]
	mov	rcx, rax
	call	snprintf
	jmp	.L167
.L169:
	mov	DWORD PTR 65952[rbp], 800
	mov	DWORD PTR 65956[rbp], 100
	mov	DWORD PTR 65960[rbp], 100
	mov	DWORD PTR 65964[rbp], 100
	movabs	rax, 2338613357913204068
	mov	QWORD PTR 65840[rbp], rax
	movabs	rax, 28542640894207341
	mov	QWORD PTR 65848[rbp], rax
	mov	QWORD PTR 65856[rbp], 0
	mov	QWORD PTR 65864[rbp], 0
	mov	QWORD PTR 65872[rbp], 0
	mov	QWORD PTR 65880[rbp], 0
	mov	QWORD PTR 65888[rbp], 0
	mov	QWORD PTR 65896[rbp], 0
	mov	QWORD PTR 65904[rbp], 0
	mov	QWORD PTR 65912[rbp], 0
	mov	QWORD PTR 65920[rbp], 0
	mov	QWORD PTR 65928[rbp], 0
	mov	DWORD PTR 65936[rbp], 0
	lea	rax, 65840[rbp]
	mov	QWORD PTR 66680[rbp], rax
	lea	rax, 65952[rbp]
	mov	QWORD PTR 66672[rbp], rax
	mov	DWORD PTR 66872[rbp], 0
	call	TTF_Init
	cmp	eax, -1
	jne	.L170
	call	SDL_GetError
	mov	rdx, rax
	lea	rax, .LC24[rip]
	mov	rcx, rax
	call	printf
	mov	eax, 1
	jmp	.L162
.L170:
	mov	edx, 12
	lea	rax, .LC25[rip]
	mov	rcx, rax
	call	TTF_OpenFont
	mov	QWORD PTR 66664[rbp], rax
	cmp	QWORD PTR 66664[rbp], 0
	jne	.L171
	call	SDL_GetError
	mov	rdx, rax
	lea	rax, .LC26[rip]
	mov	rcx, rax
	call	printf
	mov	eax, 1
	jmp	.L162
.L171:
	mov	DWORD PTR 66660[rbp], 0
	mov	DWORD PTR 66868[rbp], 0
	mov	BYTE PTR 65836[rbp], 0
	mov	BYTE PTR 65837[rbp], 0
	mov	BYTE PTR 65838[rbp], 0
	mov	BYTE PTR 65839[rbp], -1
	mov	rax, QWORD PTR 66704[rbp]
	mov	r8d, 2
	mov	edx, -1
	mov	rcx, rax
	call	SDL_CreateRenderer
	mov	QWORD PTR 66648[rbp], rax
	cmp	QWORD PTR 66696[rbp], 0
	jne	.L172
	call	SDL_GetError
	mov	rdx, rax
	lea	rax, .LC27[rip]
	mov	rcx, rax
	call	printf
.L172:
	mov	ecx, 2
	call	IMG_Init
	mov	rax, QWORD PTR 66696[rbp]
	lea	rdx, .LC28[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66640[rbp], rax
	mov	rax, QWORD PTR 66696[rbp]
	lea	rdx, .LC29[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66632[rbp], rax
	mov	rax, QWORD PTR 66696[rbp]
	lea	rdx, .LC30[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66624[rbp], rax
	mov	rax, QWORD PTR 66696[rbp]
	lea	rdx, .LC31[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66616[rbp], rax
	mov	rax, QWORD PTR 66696[rbp]
	lea	rdx, .LC32[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66608[rbp], rax
	mov	rax, QWORD PTR 66696[rbp]
	lea	rdx, .LC33[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66600[rbp], rax
	mov	rax, QWORD PTR 66696[rbp]
	lea	rdx, .LC34[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66592[rbp], rax
	mov	rax, QWORD PTR 66696[rbp]
	lea	rdx, .LC35[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66584[rbp], rax
	mov	DWORD PTR 66580[rbp], 8
	mov	DWORD PTR 66576[rbp], 24
	mov	rax, QWORD PTR 66696[rbp]
	lea	rdx, .LC36[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66568[rbp], rax
	mov	DWORD PTR 66564[rbp], 1440
	mov	DWORD PTR 66864[rbp], 0
	mov	DWORD PTR 66860[rbp], 0
	mov	DWORD PTR 66560[rbp], 57
	mov	DWORD PTR 66556[rbp], 60
	lea	rax, .LC37[rip]
	mov	QWORD PTR 66544[rbp], rax
	lea	rax, .LC38[rip]
	mov	QWORD PTR 66536[rbp], rax
	lea	rax, .LC39[rip]
	mov	QWORD PTR 66528[rbp], rax
	lea	rax, .LC40[rip]
	mov	QWORD PTR 66520[rbp], rax
	mov	eax, DWORD PTR 66732[rbp]
	mov	ecx, eax
	call	sqr
	mov	DWORD PTR 66516[rbp], eax
	mov	DWORD PTR 66512[rbp], 256
	mov	DWORD PTR 66856[rbp], 0
	lea	rax, .LC5[rip]
	mov	rdx, rax
	lea	rax, .LC8[rip]
	mov	rcx, rax
	call	fopen
	mov	QWORD PTR 66504[rbp], rax
	mov	DWORD PTR 66852[rbp], 0
	jmp	.L173
.L174:
	mov	eax, DWORD PTR 66852[rbp]
	cdqe
	mov	BYTE PTR 288[rbp+rax], 0
	add	DWORD PTR 66852[rbp], 1
.L173:
	mov	eax, DWORD PTR 66516[rbp]
	imul	eax, DWORD PTR 66512[rbp]
	cmp	DWORD PTR 66852[rbp], eax
	jl	.L174
	mov	rdx, QWORD PTR 66504[rbp]
	lea	rax, 288[rbp]
	mov	r9, rdx
	mov	r8d, 1
	mov	edx, 65536
	mov	rcx, rax
	call	fread
	mov	rax, QWORD PTR 66504[rbp]
	mov	rcx, rax
	call	fclose
	mov	rax, QWORD PTR 66696[rbp]
	lea	rdx, .LC41[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66496[rbp], rax
	mov	rax, QWORD PTR 66696[rbp]
	lea	rdx, .LC42[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66488[rbp], rax
	lea	rax, 272[rbp]
	mov	ecx, DWORD PTR 66856[rbp]
	mov	rdx, rax
	call	level_get_name
	mov	eax, DWORD PTR 66856[rbp]
	and	eax, 31
	mov	edx, 1
	mov	ecx, eax
	sal	edx, cl
	mov	ecx, edx
	mov	eax, DWORD PTR 66856[rbp]
	lea	edx, 31[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 5
	mov	edx, ecx
	cdqe
	mov	DWORD PTR 240[rbp+rax*4], edx
	mov	DWORD PTR 66484[rbp], 0
	mov	DWORD PTR 66480[rbp], 10
	mov	eax, 42
	mov	BYTE PTR 238[rbp], al
	mov	rax, QWORD PTR 66696[rbp]
	lea	rdx, .LC43[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66472[rbp], rax
	mov	BYTE PTR 66471[rbp], -128
	mov	eax, DWORD PTR 66724[rbp]
	imul	eax, DWORD PTR 66728[rbp]
	lea	edx, 0[0+rax*8]
	mov	eax, DWORD PTR 66756[rbp]
	add	eax, edx
	mov	DWORD PTR 192[rbp], eax
	mov	eax, DWORD PTR 66720[rbp]
	imul	eax, DWORD PTR 66728[rbp]
	lea	edx, 0[0+rax*8]
	mov	eax, DWORD PTR 66752[rbp]
	add	eax, edx
	mov	DWORD PTR 196[rbp], eax
	mov	BYTE PTR 208[rbp], 0
	mov	BYTE PTR 209[rbp], 0
	mov	BYTE PTR 210[rbp], 1
	mov	BYTE PTR 211[rbp], 12
	mov	BYTE PTR 212[rbp], 0
	mov	BYTE PTR 213[rbp], 2
	mov	BYTE PTR 214[rbp], 12
	mov	DWORD PTR 224[rbp], 15
	mov	DWORD PTR 220[rbp], 100
	mov	DWORD PTR 216[rbp], 50
	lea	rax, 160[rbp]
	mov	DWORD PTR 48[rsp], 10
	mov	DWORD PTR 40[rsp], 100
	mov	DWORD PTR 32[rsp], 100
	mov	r9d, 100
	mov	r8d, 500
	mov	edx, 500
	mov	rcx, rax
	call	initEnemy
	mov	rax, QWORD PTR 66696[rbp]
	lea	rdx, .LC44[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66456[rbp], rax
	lea	rax, .LC45[rip]
	mov	QWORD PTR 66448[rbp], rax
	mov	rax, QWORD PTR 66448[rbp]
	lea	rdx, .LC5[rip]
	mov	rcx, rax
	call	SDL_RWFromFile
	mov	rcx, rax
	lea	r8, 120[rbp]
	lea	rdx, 128[rbp]
	lea	rax, 116[rbp]
	mov	QWORD PTR 32[rsp], rax
	mov	r9, r8
	mov	r8, rdx
	mov	edx, 1
	call	SDL_LoadWAV_RW
	test	rax, rax
	jne	.L175
	call	SDL_GetError
	mov	rdx, rax
	lea	rax, .LC46[rip]
	mov	rcx, rax
	call	printf
	jmp	.L176
.L175:
	mov	rax, QWORD PTR 120[rbp]
	mov	QWORD PTR 96[rbp], rax
	mov	eax, DWORD PTR 116[rbp]
	mov	DWORD PTR 104[rbp], eax
	mov	DWORD PTR 108[rbp], 0
	lea	rax, audioCallback[rip]
	mov	QWORD PTR 144[rbp], rax
	lea	rax, 96[rbp]
	mov	QWORD PTR 152[rbp], rax
	lea	rax, 128[rbp]
	mov	DWORD PTR 32[rsp], 0
	mov	r9d, 0
	mov	r8, rax
	mov	edx, 0
	mov	ecx, 0
	call	SDL_OpenAudioDevice
	mov	DWORD PTR 66444[rbp], eax
	cmp	DWORD PTR 66444[rbp], 0
	jne	.L177
	call	SDL_GetError
	mov	rdx, rax
	lea	rax, .LC47[rip]
	mov	rcx, rax
	call	printf
	mov	rax, QWORD PTR 120[rbp]
	mov	rcx, rax
	call	SDL_FreeWAV
	jmp	.L176
.L177:
	mov	ecx, DWORD PTR 116[rbp]
	mov	rdx, QWORD PTR 120[rbp]
	mov	eax, DWORD PTR 66444[rbp]
	mov	r8d, ecx
	mov	ecx, eax
	call	SDL_QueueAudio
	mov	eax, DWORD PTR 66444[rbp]
	mov	edx, 0
	mov	ecx, eax
	call	SDL_PauseAudioDevice
	mov	DWORD PTR 66848[rbp], 1
	mov	rax, QWORD PTR 66696[rbp]
	lea	rdx, .LC48[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66432[rbp], rax
	mov	rax, QWORD PTR 66696[rbp]
	lea	rdx, .LC49[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66424[rbp], rax
	mov	rax, QWORD PTR 66696[rbp]
	lea	rdx, .LC50[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66416[rbp], rax
	lea	rax, .LC51[rip]
	mov	QWORD PTR 66408[rbp], rax
	lea	rax, .LC52[rip]
	mov	QWORD PTR 66400[rbp], rax
	mov	rax, QWORD PTR 66408[rbp]
	mov	rcx, rax
	call	strlen
	mov	DWORD PTR 66396[rbp], eax
	mov	rax, QWORD PTR 66400[rbp]
	mov	rcx, rax
	call	strlen
	mov	DWORD PTR 66392[rbp], eax
	mov	DWORD PTR 66844[rbp], 1
	lea	rax, .LC53[rip]
	mov	rcx, rax
	call	puts
	jmp	.L178
.L230:
	mov	eax, DWORD PTR 65968[rbp]
	cmp	eax, 769
	je	.L180
	cmp	eax, 769
	ja	.L179
	cmp	eax, 256
	je	.L181
	cmp	eax, 768
	je	.L182
	jmp	.L179
.L181:
	mov	DWORD PTR 66844[rbp], 0
	jmp	.L179
.L182:
	mov	DWORD PTR 66036[rbp], 1
	mov	eax, DWORD PTR 65988[rbp]
	cmp	eax, 57
	jg	.L183
	cmp	eax, 27
	jge	.L184
	jmp	.L179
.L206:
	sub	eax, 1073741883
	cmp	eax, 29
	ja	.L179
	mov	eax, eax
	lea	rdx, 0[0+rax*4]
	lea	rax, .L187[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cdqe
	lea	rdx, .L187[rip]
	add	rax, rdx
	jmp	rax
	.section .rdata,"dr"
	.align 4
.L187:
	.long	.L192-.L187
	.long	.L179-.L187
	.long	.L179-.L187
	.long	.L179-.L187
	.long	.L179-.L187
	.long	.L179-.L187
	.long	.L179-.L187
	.long	.L179-.L187
	.long	.L179-.L187
	.long	.L179-.L187
	.long	.L179-.L187
	.long	.L179-.L187
	.long	.L179-.L187
	.long	.L179-.L187
	.long	.L179-.L187
	.long	.L179-.L187
	.long	.L179-.L187
	.long	.L179-.L187
	.long	.L179-.L187
	.long	.L179-.L187
	.long	.L191-.L187
	.long	.L190-.L187
	.long	.L189-.L187
	.long	.L188-.L187
	.long	.L179-.L187
	.long	.L179-.L187
	.long	.L179-.L187
	.long	.L179-.L187
	.long	.L179-.L187
	.long	.L186-.L187
	.text
.L184:
	sub	eax, 27
	cmp	eax, 30
	ja	.L179
	mov	eax, eax
	lea	rdx, 0[0+rax*4]
	lea	rax, .L194[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cdqe
	lea	rdx, .L194[rip]
	add	rax, rdx
	jmp	rax
	.section .rdata,"dr"
	.align 4
.L194:
	.long	.L205-.L194
	.long	.L179-.L194
	.long	.L179-.L194
	.long	.L179-.L194
	.long	.L179-.L194
	.long	.L204-.L194
	.long	.L179-.L194
	.long	.L179-.L194
	.long	.L179-.L194
	.long	.L179-.L194
	.long	.L179-.L194
	.long	.L179-.L194
	.long	.L179-.L194
	.long	.L179-.L194
	.long	.L179-.L194
	.long	.L179-.L194
	.long	.L179-.L194
	.long	.L179-.L194
	.long	.L179-.L194
	.long	.L179-.L194
	.long	.L179-.L194
	.long	.L203-.L194
	.long	.L202-.L194
	.long	.L201-.L194
	.long	.L200-.L194
	.long	.L199-.L194
	.long	.L198-.L194
	.long	.L197-.L194
	.long	.L196-.L194
	.long	.L195-.L194
	.long	.L193-.L194
	.text
.L183:
	cmp	eax, 1073741912
	jg	.L179
	cmp	eax, 1073741883
	jge	.L206
	jmp	.L179
.L205:
	mov	DWORD PTR 66844[rbp], 0
	jmp	.L185
.L191:
	mov	eax, DWORD PTR 66036[rbp]
	mov	DWORD PTR glob_vk_right[rip], eax
	jmp	.L185
.L190:
	mov	eax, DWORD PTR 66036[rbp]
	mov	DWORD PTR glob_vk_left[rip], eax
	jmp	.L185
.L188:
	mov	eax, DWORD PTR 66036[rbp]
	mov	DWORD PTR glob_vk_up[rip], eax
	jmp	.L185
.L189:
	mov	eax, DWORD PTR 66036[rbp]
	mov	DWORD PTR glob_vk_down[rip], eax
	jmp	.L185
.L204:
	mov	eax, DWORD PTR 66036[rbp]
	mov	DWORD PTR glob_vk_space[rip], eax
	jmp	.L185
.L186:
	mov	eax, DWORD PTR 66036[rbp]
	mov	DWORD PTR glob_vk_enter[rip], eax
	jmp	.L185
.L192:
	mov	eax, DWORD PTR 66036[rbp]
	mov	DWORD PTR glob_vk_f2[rip], eax
	jmp	.L185
.L203:
	mov	eax, DWORD PTR 66036[rbp]
	mov	DWORD PTR glob_vk_0[rip], eax
	jmp	.L185
.L202:
	mov	eax, DWORD PTR 66036[rbp]
	mov	DWORD PTR glob_vk_1[rip], eax
	jmp	.L185
.L201:
	mov	eax, DWORD PTR 66036[rbp]
	mov	DWORD PTR glob_vk_2[rip], eax
	jmp	.L185
.L200:
	mov	eax, DWORD PTR 66036[rbp]
	mov	DWORD PTR glob_vk_3[rip], eax
	jmp	.L185
.L199:
	mov	eax, DWORD PTR 66036[rbp]
	mov	DWORD PTR glob_vk_4[rip], eax
	jmp	.L185
.L198:
	mov	eax, DWORD PTR 66036[rbp]
	mov	DWORD PTR glob_vk_5[rip], eax
	jmp	.L185
.L197:
	mov	eax, DWORD PTR 66036[rbp]
	mov	DWORD PTR glob_vk_6[rip], eax
	jmp	.L185
.L196:
	mov	eax, DWORD PTR 66036[rbp]
	mov	DWORD PTR glob_vk_7[rip], eax
	jmp	.L185
.L195:
	mov	eax, DWORD PTR 66036[rbp]
	mov	DWORD PTR glob_vk_8[rip], eax
	jmp	.L185
.L193:
	mov	eax, DWORD PTR 66036[rbp]
	mov	DWORD PTR glob_vk_9[rip], eax
	nop
.L185:
	jmp	.L179
.L180:
	mov	DWORD PTR 66040[rbp], 0
	mov	eax, DWORD PTR 65988[rbp]
	cmp	eax, 57
	jg	.L207
	cmp	eax, 32
	jge	.L208
	jmp	.L307
.L229:
	sub	eax, 1073741883
	cmp	eax, 29
	ja	.L307
	mov	eax, eax
	lea	rdx, 0[0+rax*4]
	lea	rax, .L211[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cdqe
	lea	rdx, .L211[rip]
	add	rax, rdx
	jmp	rax
	.section .rdata,"dr"
	.align 4
.L211:
	.long	.L216-.L211
	.long	.L307-.L211
	.long	.L307-.L211
	.long	.L307-.L211
	.long	.L307-.L211
	.long	.L307-.L211
	.long	.L307-.L211
	.long	.L307-.L211
	.long	.L307-.L211
	.long	.L307-.L211
	.long	.L307-.L211
	.long	.L307-.L211
	.long	.L307-.L211
	.long	.L307-.L211
	.long	.L307-.L211
	.long	.L307-.L211
	.long	.L307-.L211
	.long	.L307-.L211
	.long	.L307-.L211
	.long	.L307-.L211
	.long	.L215-.L211
	.long	.L214-.L211
	.long	.L213-.L211
	.long	.L212-.L211
	.long	.L307-.L211
	.long	.L307-.L211
	.long	.L307-.L211
	.long	.L307-.L211
	.long	.L307-.L211
	.long	.L210-.L211
	.text
.L208:
	sub	eax, 32
	cmp	eax, 25
	ja	.L307
	mov	eax, eax
	lea	rdx, 0[0+rax*4]
	lea	rax, .L218[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cdqe
	lea	rdx, .L218[rip]
	add	rax, rdx
	jmp	rax
	.section .rdata,"dr"
	.align 4
.L218:
	.long	.L228-.L218
	.long	.L307-.L218
	.long	.L307-.L218
	.long	.L307-.L218
	.long	.L307-.L218
	.long	.L307-.L218
	.long	.L307-.L218
	.long	.L307-.L218
	.long	.L307-.L218
	.long	.L307-.L218
	.long	.L307-.L218
	.long	.L307-.L218
	.long	.L307-.L218
	.long	.L307-.L218
	.long	.L307-.L218
	.long	.L307-.L218
	.long	.L227-.L218
	.long	.L226-.L218
	.long	.L225-.L218
	.long	.L224-.L218
	.long	.L223-.L218
	.long	.L222-.L218
	.long	.L221-.L218
	.long	.L220-.L218
	.long	.L219-.L218
	.long	.L217-.L218
	.text
.L207:
	cmp	eax, 1073741912
	jg	.L307
	cmp	eax, 1073741883
	jge	.L229
	jmp	.L307
.L215:
	mov	eax, DWORD PTR 66040[rbp]
	mov	DWORD PTR glob_vk_right[rip], eax
	jmp	.L209
.L214:
	mov	eax, DWORD PTR 66040[rbp]
	mov	DWORD PTR glob_vk_left[rip], eax
	jmp	.L209
.L212:
	mov	eax, DWORD PTR 66040[rbp]
	mov	DWORD PTR glob_vk_up[rip], eax
	jmp	.L209
.L213:
	mov	eax, DWORD PTR 66040[rbp]
	mov	DWORD PTR glob_vk_down[rip], eax
	jmp	.L209
.L228:
	mov	eax, DWORD PTR 66040[rbp]
	mov	DWORD PTR glob_vk_space[rip], eax
	jmp	.L209
.L210:
	mov	eax, DWORD PTR 66040[rbp]
	mov	DWORD PTR glob_vk_enter[rip], eax
	jmp	.L209
.L216:
	mov	eax, DWORD PTR 66040[rbp]
	mov	DWORD PTR glob_vk_f2[rip], eax
	jmp	.L209
.L227:
	mov	eax, DWORD PTR 66040[rbp]
	mov	DWORD PTR glob_vk_0[rip], eax
	jmp	.L209
.L226:
	mov	eax, DWORD PTR 66040[rbp]
	mov	DWORD PTR glob_vk_1[rip], eax
	jmp	.L209
.L225:
	mov	eax, DWORD PTR 66040[rbp]
	mov	DWORD PTR glob_vk_2[rip], eax
	jmp	.L209
.L224:
	mov	eax, DWORD PTR 66040[rbp]
	mov	DWORD PTR glob_vk_3[rip], eax
	jmp	.L209
.L223:
	mov	eax, DWORD PTR 66040[rbp]
	mov	DWORD PTR glob_vk_4[rip], eax
	jmp	.L209
.L222:
	mov	eax, DWORD PTR 66040[rbp]
	mov	DWORD PTR glob_vk_5[rip], eax
	jmp	.L209
.L221:
	mov	eax, DWORD PTR 66040[rbp]
	mov	DWORD PTR glob_vk_6[rip], eax
	jmp	.L209
.L220:
	mov	eax, DWORD PTR 66040[rbp]
	mov	DWORD PTR glob_vk_7[rip], eax
	jmp	.L209
.L219:
	mov	eax, DWORD PTR 66040[rbp]
	mov	DWORD PTR glob_vk_8[rip], eax
	jmp	.L209
.L217:
	mov	eax, DWORD PTR 66040[rbp]
	mov	DWORD PTR glob_vk_9[rip], eax
	nop
.L209:
.L307:
	nop
.L179:
	lea	rax, 65968[rbp]
	mov	rcx, rax
	call	SDL_PollEvent
	test	eax, eax
	jne	.L230
	mov	eax, DWORD PTR glob_vk_f2[rip]
	test	eax, eax
	je	.L231
	lea	rax, .LC54[rip]
	mov	rcx, rax
	call	puts
	call	dev_tiled_to_leveldata
	lea	rax, .LC55[rip]
	mov	rcx, rax
	call	puts
.L231:
	mov	eax, DWORD PTR glob_vk_7[rip]
	test	eax, eax
	je	.L232
	lea	rdx, 160[rbp]
	lea	rax, 192[rbp]
	mov	rcx, rax
	call	attack
.L232:
	mov	eax, DWORD PTR glob_vk_0[rip]
	test	eax, eax
	je	.L233
	mov	DWORD PTR glob_vk_0[rip], 0
	mov	eax, DWORD PTR waterOn[rip]
	test	eax, eax
	jne	.L234
	mov	DWORD PTR waterOn[rip], 1
	call	activateAllWaterParticles
	jmp	.L233
.L234:
	mov	DWORD PTR waterOn[rip], 0
	call	deactivateAllWaterParticles
.L233:
	mov	eax, DWORD PTR glob_vk_9[rip]
	test	eax, eax
	je	.L235
	mov	DWORD PTR glob_vk_9[rip], 0
	cmp	DWORD PTR 66872[rbp], 0
	jne	.L236
	mov	DWORD PTR 66872[rbp], 1
	lea	rax, 65840[rbp]
	movabs	rdi, 3184362091757007472
	mov	QWORD PTR [rax], rdi
	movabs	rdi, 14685297085393969
	mov	QWORD PTR 6[rax], rdi
	jmp	.L235
.L236:
	mov	DWORD PTR 66872[rbp], 0
.L235:
	mov	eax, DWORD PTR glob_vk_1[rip]
	test	eax, eax
	je	.L237
	mov	DWORD PTR glob_vk_1[rip], 0
	cmp	DWORD PTR 66872[rbp], 1
	jne	.L237
	lea	rax, .LC56[rip]
	mov	QWORD PTR 66384[rbp], rax
	mov	QWORD PTR 66376[rbp], 99
	mov	rcx, QWORD PTR 66376[rbp]
	mov	rdx, QWORD PTR 66384[rbp]
	lea	rax, 65840[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	strncpy
	lea	rax, 65840[rbp]
	mov	rdx, QWORD PTR 66376[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	add	DWORD PTR 66868[rbp], 50
.L237:
	mov	eax, DWORD PTR glob_vk_2[rip]
	test	eax, eax
	je	.L238
	mov	DWORD PTR glob_vk_2[rip], 0
	cmp	DWORD PTR 66872[rbp], 1
	jne	.L238
	lea	rax, .LC57[rip]
	mov	QWORD PTR 66368[rbp], rax
	mov	QWORD PTR 66360[rbp], 99
	mov	rcx, QWORD PTR 66360[rbp]
	mov	rdx, QWORD PTR 66368[rbp]
	lea	rax, 65840[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	strncpy
	lea	rax, 65840[rbp]
	mov	rdx, QWORD PTR 66360[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	add	DWORD PTR 66868[rbp], 50
.L238:
	mov	eax, DWORD PTR glob_vk_3[rip]
	test	eax, eax
	je	.L239
	mov	DWORD PTR glob_vk_3[rip], 0
	cmp	DWORD PTR 66872[rbp], 1
	jne	.L239
	lea	rax, .LC58[rip]
	mov	QWORD PTR 66352[rbp], rax
	mov	QWORD PTR 66344[rbp], 99
	mov	rcx, QWORD PTR 66344[rbp]
	mov	rdx, QWORD PTR 66352[rbp]
	lea	rax, 65840[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	strncpy
	lea	rax, 65840[rbp]
	mov	rdx, QWORD PTR 66344[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	add	DWORD PTR 66868[rbp], 50
.L239:
	mov	eax, DWORD PTR glob_vk_4[rip]
	test	eax, eax
	je	.L240
	mov	DWORD PTR glob_vk_4[rip], 0
	cmp	DWORD PTR 66872[rbp], 1
	jne	.L240
	lea	rax, .LC59[rip]
	mov	QWORD PTR 66336[rbp], rax
	mov	QWORD PTR 66328[rbp], 99
	mov	rcx, QWORD PTR 66328[rbp]
	mov	rdx, QWORD PTR 66336[rbp]
	lea	rax, 65840[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	strncpy
	lea	rax, 65840[rbp]
	mov	rdx, QWORD PTR 66328[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	add	DWORD PTR 66868[rbp], 50
.L240:
	mov	eax, DWORD PTR glob_vk_5[rip]
	test	eax, eax
	je	.L241
	mov	DWORD PTR glob_vk_5[rip], 0
	mov	ecx, 10
	call	damageMe
.L241:
	mov	eax, DWORD PTR glob_vk_6[rip]
	test	eax, eax
	je	.L242
	mov	DWORD PTR glob_vk_6[rip], 0
	mov	ecx, 10
	call	healMe
.L242:
	mov	eax, DWORD PTR glob_vk_right[rip]
	test	eax, eax
	je	.L243
	mov	BYTE PTR 208[rbp], 0
	mov	edx, DWORD PTR 192[rbp]
	movzx	eax, BYTE PTR 214[rbp]
	movzx	eax, al
	add	eax, edx
	mov	DWORD PTR 192[rbp], eax
.L243:
	mov	eax, DWORD PTR glob_vk_up[rip]
	test	eax, eax
	je	.L244
	mov	BYTE PTR 208[rbp], 1
	mov	edx, DWORD PTR 196[rbp]
	movzx	eax, BYTE PTR 214[rbp]
	movzx	eax, al
	sub	edx, eax
	mov	DWORD PTR 196[rbp], edx
.L244:
	mov	eax, DWORD PTR glob_vk_left[rip]
	test	eax, eax
	je	.L245
	mov	BYTE PTR 208[rbp], 2
	mov	edx, DWORD PTR 192[rbp]
	movzx	eax, BYTE PTR 214[rbp]
	movzx	eax, al
	sub	edx, eax
	mov	DWORD PTR 192[rbp], edx
.L245:
	mov	eax, DWORD PTR glob_vk_down[rip]
	test	eax, eax
	je	.L246
	mov	BYTE PTR 208[rbp], 3
	mov	edx, DWORD PTR 196[rbp]
	movzx	eax, BYTE PTR 214[rbp]
	movzx	eax, al
	add	eax, edx
	mov	DWORD PTR 196[rbp], eax
.L246:
	mov	edx, DWORD PTR glob_vk_right[rip]
	mov	eax, DWORD PTR glob_vk_left[rip]
	or	edx, eax
	mov	eax, DWORD PTR glob_vk_up[rip]
	or	edx, eax
	mov	eax, DWORD PTR glob_vk_down[rip]
	or	eax, edx
	test	eax, eax
	je	.L247
	movzx	edx, BYTE PTR 209[rbp]
	movzx	eax, BYTE PTR 210[rbp]
	add	eax, edx
	mov	BYTE PTR 209[rbp], al
	movzx	ecx, BYTE PTR 212[rbp]
	movzx	edx, BYTE PTR 209[rbp]
	movzx	eax, BYTE PTR 211[rbp]
	cmp	dl, al
	setnb	al
	add	eax, ecx
	mov	BYTE PTR 212[rbp], al
	movzx	eax, BYTE PTR 209[rbp]
	movzx	edx, BYTE PTR 211[rbp]
	movzx	eax, al
	div	dl
	movzx	eax, ah
	mov	BYTE PTR 209[rbp], al
	movzx	eax, BYTE PTR 212[rbp]
	movzx	edx, BYTE PTR 213[rbp]
	movzx	eax, al
	div	dl
	movzx	eax, ah
	mov	BYTE PTR 212[rbp], al
	mov	eax, DWORD PTR 66728[rbp]
	imul	eax, DWORD PTR 66724[rbp]
	mov	edx, DWORD PTR 66740[rbp]
	sub	edx, eax
	mov	DWORD PTR 66324[rbp], edx
	mov	eax, DWORD PTR 66752[rbp]
	mov	DWORD PTR 66320[rbp], eax
	mov	eax, DWORD PTR 66756[rbp]
	mov	DWORD PTR 66316[rbp], eax
	mov	eax, DWORD PTR 66728[rbp]
	imul	eax, DWORD PTR 66720[rbp]
	mov	edx, DWORD PTR 66736[rbp]
	sub	edx, eax
	mov	DWORD PTR 66312[rbp], edx
	mov	DWORD PTR 66308[rbp], 0
	mov	eax, DWORD PTR 192[rbp]
	cmp	DWORD PTR 66324[rbp], eax
	jl	.L248
	mov	eax, DWORD PTR 196[rbp]
	cmp	DWORD PTR 66312[rbp], eax
	jl	.L248
	mov	eax, DWORD PTR 192[rbp]
	cmp	DWORD PTR 66316[rbp], eax
	jg	.L248
	mov	eax, DWORD PTR 196[rbp]
	cmp	DWORD PTR 66320[rbp], eax
	jle	.L249
.L248:
	mov	eax, 1
	jmp	.L250
.L249:
	mov	eax, 0
.L250:
	mov	DWORD PTR 66308[rbp], eax
	mov	eax, DWORD PTR 192[rbp]
	cmp	DWORD PTR 66324[rbp], eax
	jge	.L251
	mov	eax, DWORD PTR 66316[rbp]
	mov	DWORD PTR 192[rbp], eax
	add	DWORD PTR 66856[rbp], 1
.L251:
	mov	eax, DWORD PTR 196[rbp]
	cmp	DWORD PTR 66320[rbp], eax
	jle	.L252
	mov	eax, DWORD PTR 66312[rbp]
	mov	DWORD PTR 196[rbp], eax
	pxor	xmm3, xmm3
	cvtsi2sd	xmm3, DWORD PTR 66512[rbp]
	movq	rax, xmm3
	movq	xmm0, rax
	call	sqrt
	cvttsd2si	eax, xmm0
	sub	DWORD PTR 66856[rbp], eax
.L252:
	mov	eax, DWORD PTR 192[rbp]
	cmp	DWORD PTR 66316[rbp], eax
	jle	.L253
	mov	eax, DWORD PTR 66324[rbp]
	mov	DWORD PTR 192[rbp], eax
	sub	DWORD PTR 66856[rbp], 1
.L253:
	mov	eax, DWORD PTR 196[rbp]
	cmp	DWORD PTR 66312[rbp], eax
	jge	.L254
	mov	eax, DWORD PTR 66320[rbp]
	mov	DWORD PTR 196[rbp], eax
	pxor	xmm4, xmm4
	cvtsi2sd	xmm4, DWORD PTR 66512[rbp]
	movq	rax, xmm4
	movq	xmm0, rax
	call	sqrt
	cvttsd2si	eax, xmm0
	add	DWORD PTR 66856[rbp], eax
.L254:
	cmp	DWORD PTR 66308[rbp], 0
	je	.L255
	mov	eax, DWORD PTR 66512[rbp]
	add	DWORD PTR 66856[rbp], eax
	mov	eax, DWORD PTR 66856[rbp]
	cdq
	idiv	DWORD PTR 66512[rbp]
	mov	DWORD PTR 66856[rbp], edx
	lea	rax, 272[rbp]
	mov	ecx, DWORD PTR 66856[rbp]
	mov	rdx, rax
	call	level_get_name
	mov	eax, DWORD PTR 66856[rbp]
	lea	edx, 31[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 5
	mov	r8d, eax
	movsx	rax, r8d
	mov	edx, DWORD PTR 240[rbp+rax*4]
	mov	eax, DWORD PTR 66856[rbp]
	and	eax, 31
	mov	r9d, 1
	mov	ecx, eax
	sal	r9d, cl
	mov	eax, r9d
	or	edx, eax
	movsx	rax, r8d
	mov	DWORD PTR 240[rbp+rax*4], edx
	jmp	.L255
.L247:
	mov	BYTE PTR 209[rbp], 0
	mov	BYTE PTR 212[rbp], 0
.L255:
	mov	edx, DWORD PTR glob_vk_space[rip]
	mov	eax, DWORD PTR glob_vk_enter[rip]
	or	eax, edx
	test	eax, eax
	je	.L256
	mov	DWORD PTR 66848[rbp], 0
.L256:
	mov	eax, DWORD PTR 192[rbp]
	mov	DWORD PTR 200[rbp], eax
	mov	eax, DWORD PTR 196[rbp]
	mov	DWORD PTR 204[rbp], eax
	mov	DWORD PTR 66840[rbp], 0
	jmp	.L257
.L261:
	mov	rdx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 66840[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	mov	eax, DWORD PTR 12[rax]
	test	eax, eax
	je	.L258
	mov	rdx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 66840[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	movss	xmm1, DWORD PTR 4[rax]
	mov	rdx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 66840[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	movss	xmm0, DWORD PTR 8[rax]
	mov	rdx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 66840[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	addss	xmm0, xmm1
	movss	DWORD PTR 4[rax], xmm0
	mov	rdx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 66840[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	movss	xmm0, DWORD PTR 4[rax]
	pxor	xmm1, xmm1
	cvtsi2ss	xmm1, DWORD PTR 66760[rbp]
	comiss	xmm0, xmm1
	jbe	.L258
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
	jg	.L260
	mov	rdx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 66840[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	mov	DWORD PTR 12[rax], 0
	jmp	.L258
.L260:
	mov	ecx, DWORD PTR 66760[rbp]
	mov	edx, DWORD PTR 66764[rbp]
	mov	eax, DWORD PTR 66840[rbp]
	mov	r8d, ecx
	mov	ecx, eax
	call	createWaterParticle
.L258:
	add	DWORD PTR 66840[rbp], 1
.L257:
	mov	eax, 100
	cmp	DWORD PTR 66840[rbp], eax
	jl	.L261
	mov	eax, DWORD PTR 66556[rbp]
	add	DWORD PTR 66860[rbp], eax
	mov	eax, DWORD PTR 66860[rbp]
	cmp	eax, DWORD PTR 66560[rbp]
	setge	al
	movzx	eax, al
	add	DWORD PTR 66864[rbp], eax
	mov	eax, DWORD PTR 66864[rbp]
	cdq
	idiv	DWORD PTR 66564[rbp]
	mov	DWORD PTR 66864[rbp], edx
	mov	eax, DWORD PTR 66860[rbp]
	cdq
	idiv	DWORD PTR 66560[rbp]
	mov	DWORD PTR 66860[rbp], edx
	lea	rdx, 235[rbp]
	lea	rax, 84[rbp]
	mov	rcx, rax
	call	strcpy
	cmp	DWORD PTR 66480[rbp], 0
	js	.L262
	mov	eax, 43
	jmp	.L263
.L262:
	mov	eax, 45
.L263:
	mov	BYTE PTR 84[rbp], al
	mov	eax, DWORD PTR 66480[rbp]
	movsx	rdx, eax
	imul	rdx, rdx, 1717986919
	shr	rdx, 32
	sar	edx, 2
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	add	eax, 48
	mov	BYTE PTR 85[rbp], al
	mov	ecx, DWORD PTR 66480[rbp]
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
	mov	BYTE PTR 86[rbp], al
	mov	eax, 42
	mov	BYTE PTR 87[rbp], al
	cmp	DWORD PTR 66484[rbp], 0
	jne	.L264
	mov	eax, 67
	jmp	.L265
.L264:
	mov	eax, 70
.L265:
	mov	BYTE PTR 88[rbp], al
	mov	edx, 0
	mov	rax, QWORD PTR 66696[rbp]
	mov	rcx, rax
	call	draw_clear
	mov	edx, 16777215
	mov	rax, QWORD PTR 66696[rbp]
	mov	rcx, rax
	call	draw_set_color
	mov	edx, 33023
	mov	ecx, DWORD PTR 66756[rbp]
	mov	rax, QWORD PTR 66696[rbp]
	mov	DWORD PTR 40[rsp], edx
	mov	edx, DWORD PTR 66760[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, ecx
	mov	r8d, 0
	mov	edx, 0
	mov	rcx, rax
	call	draw_rectangle_color
	mov	ecx, DWORD PTR 66756[rbp]
	mov	rax, QWORD PTR 66696[rbp]
	mov	rdx, QWORD PTR 66600[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	edx, DWORD PTR 66760[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, ecx
	mov	r8d, 0
	mov	edx, 0
	mov	rcx, rax
	call	draw_image
	mov	ecx, 8388863
	mov	eax, DWORD PTR 66764[rbp]
	sub	eax, DWORD PTR 66756[rbp]
	mov	r8d, eax
	mov	edx, DWORD PTR 66756[rbp]
	mov	rax, QWORD PTR 66696[rbp]
	mov	DWORD PTR 40[rsp], ecx
	mov	ecx, DWORD PTR 66760[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	r9d, r8d
	mov	r8d, 0
	mov	rcx, rax
	call	draw_rectangle_color
	mov	edx, 33023
	mov	eax, DWORD PTR 66764[rbp]
	sub	eax, DWORD PTR 66756[rbp]
	mov	r8d, DWORD PTR 66764[rbp]
	mov	rcx, QWORD PTR 66696[rbp]
	mov	DWORD PTR 40[rsp], edx
	mov	edx, DWORD PTR 66760[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, r8d
	mov	r8d, 0
	mov	edx, eax
	call	draw_rectangle_color
	mov	eax, DWORD PTR 66764[rbp]
	sub	eax, DWORD PTR 66756[rbp]
	mov	r8d, DWORD PTR 66764[rbp]
	mov	rcx, QWORD PTR 66696[rbp]
	mov	rdx, QWORD PTR 66600[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	edx, DWORD PTR 66760[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, r8d
	mov	r8d, 0
	mov	edx, eax
	call	draw_image
	mov	DWORD PTR 66304[rbp], 0
	mov	eax, DWORD PTR 66724[rbp]
	mov	DWORD PTR 66300[rbp], eax
	mov	eax, DWORD PTR 66720[rbp]
	mov	DWORD PTR 66296[rbp], eax
	cmp	DWORD PTR 66848[rbp], 0
	jne	.L266
	mov	eax, DWORD PTR 66576[rbp]
	imul	eax, DWORD PTR 66720[rbp]
	mov	ecx, eax
	mov	eax, DWORD PTR 66580[rbp]
	imul	eax, DWORD PTR 66724[rbp]
	mov	r9d, eax
	mov	r10d, DWORD PTR 66296[rbp]
	mov	edx, DWORD PTR 66300[rbp]
	mov	rax, QWORD PTR 66696[rbp]
	mov	r8d, DWORD PTR 66304[rbp]
	mov	DWORD PTR 72[rsp], r8d
	mov	r8d, DWORD PTR 66576[rbp]
	mov	DWORD PTR 64[rsp], r8d
	mov	r8d, DWORD PTR 66580[rbp]
	mov	DWORD PTR 56[rsp], r8d
	lea	r8, .LC60[rip]
	mov	QWORD PTR 48[rsp], r8
	mov	r8, QWORD PTR 66584[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_text_color
	mov	eax, DWORD PTR 66576[rbp]
	imul	eax, DWORD PTR 66720[rbp]
	add	DWORD PTR 66296[rbp], eax
	mov	DWORD PTR 66292[rbp], 200
	mov	DWORD PTR 66288[rbp], 20
	mov	eax, DWORD PTR health[rip]
	imul	eax, DWORD PTR 66292[rbp]
	mov	edi, DWORD PTR maxHealth[rip]
	cdq
	idiv	edi
	mov	DWORD PTR 66284[rbp], eax
	mov	DWORD PTR 66280[rbp], 255
	mov	r9d, 0
	mov	edx, DWORD PTR 66296[rbp]
	mov	eax, DWORD PTR 66288[rbp]
	add	edx, eax
	mov	r8d, DWORD PTR 66292[rbp]
	mov	ecx, DWORD PTR 66296[rbp]
	mov	rax, QWORD PTR 66696[rbp]
	mov	DWORD PTR 40[rsp], r9d
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, r8d
	mov	r8d, ecx
	mov	edx, 0
	mov	rcx, rax
	call	draw_rectangle_color
	mov	edx, DWORD PTR 66296[rbp]
	mov	eax, DWORD PTR 66288[rbp]
	add	edx, eax
	mov	r9d, DWORD PTR 66284[rbp]
	mov	r8d, DWORD PTR 66296[rbp]
	mov	rax, QWORD PTR 66696[rbp]
	mov	ecx, DWORD PTR 66280[rbp]
	mov	DWORD PTR 40[rsp], ecx
	mov	DWORD PTR 32[rsp], edx
	mov	edx, 0
	mov	rcx, rax
	call	draw_rectangle_color
	mov	eax, DWORD PTR 66288[rbp]
	add	DWORD PTR 66296[rbp], eax
	mov	DWORD PTR 66276[rbp], 0
	mov	DWORD PTR 66272[rbp], 32
	mov	DWORD PTR 66836[rbp], 0
	jmp	.L267
.L268:
	add	DWORD PTR 66836[rbp], 1
.L267:
	cmp	DWORD PTR 66836[rbp], 3
	jle	.L268
.L266:
	mov	edx, DWORD PTR 66724[rbp]
	mov	eax, DWORD PTR 66740[rbp]
	add	eax, edx
	mov	DWORD PTR 66300[rbp], eax
	mov	eax, DWORD PTR 66720[rbp]
	mov	DWORD PTR 66296[rbp], eax
	cmp	DWORD PTR 66848[rbp], 0
	jne	.L269
	mov	rax, rsp
	mov	r13, rax
	lea	rax, .LC61[rip]
	mov	QWORD PTR 66264[rbp], rax
	mov	rax, QWORD PTR 66264[rbp]
	mov	rcx, rax
	call	strlen
	mov	rdx, rax
	sub	rdx, 1
	mov	QWORD PTR 66256[rbp], rdx
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
	mov	QWORD PTR 66248[rbp], rax
	mov	rdx, QWORD PTR 66264[rbp]
	mov	rax, QWORD PTR 66248[rbp]
	mov	rcx, rax
	call	strcpy
	mov	eax, DWORD PTR 66856[rbp]
	mov	BYTE PTR 66247[rbp], al
	movzx	eax, BYTE PTR 66247[rbp]
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
	mov	rax, QWORD PTR 66248[rbp]
	mov	rdx, rax
	lea	rax, .LC62[rip]
	mov	rcx, rax
	call	string_pos
	mov	ecx, ebx
	mov	rdx, QWORD PTR 66248[rbp]
	cdqe
	mov	BYTE PTR [rdx+rax], cl
	movzx	eax, BYTE PTR 66247[rbp]
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
	mov	rax, QWORD PTR 66248[rbp]
	mov	rdx, rax
	lea	rax, .LC63[rip]
	mov	rcx, rax
	call	string_pos
	mov	ecx, ebx
	mov	rdx, QWORD PTR 66248[rbp]
	cdqe
	mov	BYTE PTR [rdx+rax], cl
	movzx	ecx, BYTE PTR 66247[rbp]
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
	mov	rax, QWORD PTR 66248[rbp]
	mov	rdx, rax
	lea	rax, .LC64[rip]
	mov	rcx, rax
	call	string_pos
	mov	ecx, ebx
	mov	rdx, QWORD PTR 66248[rbp]
	cdqe
	mov	BYTE PTR [rdx+rax], cl
	mov	eax, DWORD PTR 66576[rbp]
	imul	eax, DWORD PTR 66720[rbp]
	mov	ecx, eax
	mov	eax, DWORD PTR 66580[rbp]
	imul	eax, DWORD PTR 66724[rbp]
	mov	r9d, eax
	mov	r10d, DWORD PTR 66296[rbp]
	mov	edx, DWORD PTR 66300[rbp]
	mov	rax, QWORD PTR 66696[rbp]
	mov	r8d, DWORD PTR 66304[rbp]
	mov	DWORD PTR 72[rsp], r8d
	mov	r8d, DWORD PTR 66576[rbp]
	mov	DWORD PTR 64[rsp], r8d
	mov	r8d, DWORD PTR 66580[rbp]
	mov	DWORD PTR 56[rsp], r8d
	mov	r8, QWORD PTR 66248[rbp]
	mov	QWORD PTR 48[rsp], r8
	mov	r8, QWORD PTR 66584[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_text_color
	mov	eax, DWORD PTR 66576[rbp]
	imul	eax, DWORD PTR 66720[rbp]
	mov	ecx, eax
	mov	eax, DWORD PTR 66580[rbp]
	imul	eax, DWORD PTR 66724[rbp]
	mov	r9d, eax
	mov	eax, DWORD PTR 66576[rbp]
	imul	eax, DWORD PTR 66720[rbp]
	mov	edx, DWORD PTR 66296[rbp]
	lea	r10d, [rax+rdx]
	mov	edx, DWORD PTR 66300[rbp]
	mov	rax, QWORD PTR 66696[rbp]
	mov	r8d, DWORD PTR 66304[rbp]
	mov	DWORD PTR 72[rsp], r8d
	mov	r8d, DWORD PTR 66576[rbp]
	mov	DWORD PTR 64[rsp], r8d
	mov	r8d, DWORD PTR 66580[rbp]
	mov	DWORD PTR 56[rsp], r8d
	lea	r8, 272[rbp]
	mov	QWORD PTR 48[rsp], r8
	mov	r8, QWORD PTR 66584[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_text_color
	mov	eax, DWORD PTR 66300[rbp]
	mov	DWORD PTR 66240[rbp], eax
	mov	eax, DWORD PTR 66576[rbp]
	imul	eax, DWORD PTR 66720[rbp]
	lea	edx, [rax+rax]
	mov	eax, DWORD PTR 66296[rbp]
	add	eax, edx
	mov	DWORD PTR 66236[rbp], eax
	mov	eax, DWORD PTR 66240[rbp]
	add	eax, 256
	mov	DWORD PTR 66232[rbp], eax
	mov	eax, DWORD PTR 66236[rbp]
	add	eax, 256
	mov	DWORD PTR 66228[rbp], eax
	mov	r9d, DWORD PTR 66232[rbp]
	mov	r8d, DWORD PTR 66236[rbp]
	mov	edx, DWORD PTR 66240[rbp]
	mov	rax, QWORD PTR 66696[rbp]
	mov	rcx, QWORD PTR 66496[rbp]
	mov	QWORD PTR 40[rsp], rcx
	mov	ecx, DWORD PTR 66228[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_image
	mov	DWORD PTR 66832[rbp], 0
	jmp	.L270
.L272:
	mov	edx, DWORD PTR 66832[rbp]
	mov	eax, edx
	sar	eax, 31
	shr	eax, 27
	add	edx, eax
	and	edx, 31
	sub	edx, eax
	mov	ecx, edx
	mov	eax, DWORD PTR 66832[rbp]
	lea	edx, 31[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 5
	cdqe
	mov	eax, DWORD PTR 240[rbp+rax*4]
	mov	edx, ecx
	mov	ecx, eax
	call	BG
	test	eax, eax
	jne	.L271
	mov	eax, DWORD PTR 66832[rbp]
	lea	edx, 15[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 4
	add	eax, 1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC65[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 66228[rbp]
	pxor	xmm5, xmm5
	cvtsi2sd	xmm5, DWORD PTR 66236[rbp]
	movq	rax, xmm5
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	lerp
	cvttsd2si	ebx, xmm0
	mov	edx, DWORD PTR 66832[rbp]
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
	movsd	xmm1, QWORD PTR .LC65[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 66232[rbp]
	pxor	xmm3, xmm3
	cvtsi2sd	xmm3, DWORD PTR 66240[rbp]
	movq	rax, xmm3
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	lerp
	cvttsd2si	edi, xmm0
	mov	eax, DWORD PTR 66832[rbp]
	lea	edx, 15[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 4
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC65[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 66228[rbp]
	pxor	xmm4, xmm4
	cvtsi2sd	xmm4, DWORD PTR 66236[rbp]
	movq	rax, xmm4
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	lerp
	cvttsd2si	esi, xmm0
	mov	edx, DWORD PTR 66832[rbp]
	mov	eax, edx
	sar	eax, 31
	shr	eax, 28
	add	edx, eax
	and	edx, 15
	sub	edx, eax
	mov	eax, edx
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC65[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 66232[rbp]
	pxor	xmm5, xmm5
	cvtsi2sd	xmm5, DWORD PTR 66240[rbp]
	movq	rax, xmm5
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	lerp
	cvttsd2si	eax, xmm0
	mov	rcx, QWORD PTR 66696[rbp]
	mov	rdx, QWORD PTR 66488[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	DWORD PTR 32[rsp], ebx
	mov	r9d, edi
	mov	r8d, esi
	mov	edx, eax
	call	draw_image
.L271:
	add	DWORD PTR 66832[rbp], 1
.L270:
	cmp	DWORD PTR 66832[rbp], 255
	jle	.L272
	movzx	eax, BYTE PTR 66247[rbp]
	mov	r8d, 0
	mov	edx, 4
	mov	ecx, eax
	call	BGG
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC65[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 66232[rbp]
	pxor	xmm3, xmm3
	cvtsi2sd	xmm3, DWORD PTR 66240[rbp]
	movq	rax, xmm3
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	lerp
	cvttsd2si	eax, xmm0
	mov	DWORD PTR 66224[rbp], eax
	mov	ecx, 255
	mov	eax, DWORD PTR 66224[rbp]
	lea	r9d, 1[rax]
	mov	eax, DWORD PTR 66224[rbp]
	lea	edx, -1[rax]
	mov	r8d, DWORD PTR 66236[rbp]
	mov	rax, QWORD PTR 66696[rbp]
	mov	DWORD PTR 40[rsp], ecx
	mov	ecx, DWORD PTR 66228[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_rectangle_color
	movzx	eax, BYTE PTR 66247[rbp]
	mov	r8d, 1
	mov	edx, 4
	mov	ecx, eax
	call	BGG
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC65[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 66228[rbp]
	pxor	xmm4, xmm4
	cvtsi2sd	xmm4, DWORD PTR 66236[rbp]
	movq	rax, xmm4
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	lerp
	cvttsd2si	eax, xmm0
	mov	DWORD PTR 66220[rbp], eax
	mov	r10d, 255
	mov	eax, DWORD PTR 66220[rbp]
	lea	ecx, 1[rax]
	mov	eax, DWORD PTR 66220[rbp]
	lea	r8d, -1[rax]
	mov	r9d, DWORD PTR 66232[rbp]
	mov	edx, DWORD PTR 66240[rbp]
	mov	rax, QWORD PTR 66696[rbp]
	mov	DWORD PTR 40[rsp], r10d
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_rectangle_color
	mov	esi, 255
	movzx	eax, BYTE PTR 66247[rbp]
	mov	r8d, 1
	mov	edx, 4
	mov	ecx, eax
	call	BGG
	add	eax, 1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC65[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 66228[rbp]
	pxor	xmm5, xmm5
	cvtsi2sd	xmm5, DWORD PTR 66236[rbp]
	movq	rax, xmm5
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	lerp
	cvttsd2si	ebx, xmm0
	movzx	eax, BYTE PTR 66247[rbp]
	mov	r8d, 0
	mov	edx, 4
	mov	ecx, eax
	call	BGG
	add	eax, 1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC65[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 66232[rbp]
	pxor	xmm7, xmm7
	cvtsi2sd	xmm7, DWORD PTR 66240[rbp]
	movq	rax, xmm7
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	lerp
	cvttsd2si	ecx, xmm0
	mov	r8d, DWORD PTR 66220[rbp]
	mov	edx, DWORD PTR 66224[rbp]
	mov	rax, QWORD PTR 66696[rbp]
	mov	DWORD PTR 40[rsp], esi
	mov	DWORD PTR 32[rsp], ebx
	mov	r9d, ecx
	mov	rcx, rax
	call	draw_rectangle_color
	mov	DWORD PTR 66828[rbp], 0
	mov	eax, DWORD PTR 66720[rbp]
	sal	eax, 5
	mov	edx, eax
	mov	eax, DWORD PTR 66228[rbp]
	add	eax, edx
	mov	DWORD PTR 66216[rbp], eax
	mov	edx, DWORD PTR 66304[rbp]
	mov	rax, QWORD PTR 66696[rbp]
	mov	rcx, rax
	call	draw_set_color
	mov	DWORD PTR 66824[rbp], 0
	jmp	.L273
.L276:
	mov	edx, DWORD PTR 66864[rbp]
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
	mov	eax, DWORD PTR 66864[rbp]
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
	mov	eax, DWORD PTR 66864[rbp]
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
	mov	eax, DWORD PTR 66864[rbp]
	movsx	r9, eax
	imul	r9, r9, 458129845
	shr	r9, 32
	sar	r9d, 6
	sar	eax, 31
	mov	r10d, r9d
	sub	r10d, eax
	mov	eax, DWORD PTR 66824[rbp]
	mov	DWORD PTR 40[rsp], ecx
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, 737
	mov	edx, r10d
	mov	ecx, eax
	call	mux_int
	mov	DWORD PTR 66200[rbp], eax
	cmp	DWORD PTR 66824[rbp], 2
	je	.L274
	mov	eax, DWORD PTR 66200[rbp]
	sal	eax, 4
	mov	ecx, eax
	mov	eax, DWORD PTR 66824[rbp]
	add	eax, 1
	imul	eax, DWORD PTR 66724[rbp]
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR 66300[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 66828[rbp]
	lea	r9d, [rdx+rax]
	mov	eax, DWORD PTR 66824[rbp]
	imul	eax, DWORD PTR 66724[rbp]
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR 66300[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 66828[rbp]
	add	edx, eax
	mov	r8d, DWORD PTR 66228[rbp]
	mov	rax, QWORD PTR 66696[rbp]
	mov	DWORD PTR 72[rsp], 32
	mov	DWORD PTR 64[rsp], 16
	mov	DWORD PTR 56[rsp], 0
	mov	DWORD PTR 48[rsp], ecx
	mov	rcx, QWORD PTR 66568[rbp]
	mov	QWORD PTR 40[rsp], rcx
	mov	ecx, DWORD PTR 66216[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_image_part
	mov	eax, DWORD PTR 66724[rbp]
	add	DWORD PTR 66828[rbp], eax
	jmp	.L275
.L274:
	mov	eax, DWORD PTR 66576[rbp]
	imul	eax, DWORD PTR 66720[rbp]
	mov	ecx, eax
	mov	eax, DWORD PTR 66580[rbp]
	imul	eax, DWORD PTR 66724[rbp]
	mov	r9d, eax
	mov	eax, DWORD PTR 66724[rbp]
	sal	eax, 5
	mov	edx, eax
	mov	eax, DWORD PTR 66300[rbp]
	add	edx, eax
	mov	r10d, DWORD PTR 66228[rbp]
	mov	rax, QWORD PTR 66696[rbp]
	mov	r8d, DWORD PTR 66304[rbp]
	mov	DWORD PTR 72[rsp], r8d
	mov	r8d, DWORD PTR 66576[rbp]
	mov	DWORD PTR 64[rsp], r8d
	mov	r8d, DWORD PTR 66580[rbp]
	mov	DWORD PTR 56[rsp], r8d
	lea	r8, .LC66[rip]
	mov	QWORD PTR 48[rsp], r8
	mov	r8, QWORD PTR 66584[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_text_color
.L275:
	add	DWORD PTR 66824[rbp], 1
.L273:
	cmp	DWORD PTR 66824[rbp], 4
	jle	.L276
	mov	edx, 16777215
	mov	rax, QWORD PTR 66696[rbp]
	mov	rcx, rax
	call	draw_set_color
	mov	DWORD PTR 66212[rbp], 0
	mov	eax, DWORD PTR 66864[rbp]
	mov	DWORD PTR 32[rsp], 59
	mov	r9d, 5
	mov	r8d, 0
	mov	edx, 0
	mov	ecx, eax
	call	clock_is_between
	test	eax, eax
	je	.L277
	mov	DWORD PTR 66212[rbp], 0
.L277:
	mov	eax, DWORD PTR 66864[rbp]
	mov	DWORD PTR 32[rsp], 59
	mov	r9d, 11
	mov	r8d, 0
	mov	edx, 6
	mov	ecx, eax
	call	clock_is_between
	test	eax, eax
	je	.L278
	mov	DWORD PTR 66212[rbp], 1
.L278:
	mov	eax, DWORD PTR 66864[rbp]
	mov	DWORD PTR 32[rsp], 59
	mov	r9d, 17
	mov	r8d, 0
	mov	edx, 12
	mov	ecx, eax
	call	clock_is_between
	test	eax, eax
	je	.L279
	mov	DWORD PTR 66212[rbp], 2
.L279:
	mov	eax, DWORD PTR 66864[rbp]
	mov	DWORD PTR 32[rsp], 59
	mov	r9d, 23
	mov	r8d, 0
	mov	edx, 18
	mov	ecx, eax
	call	clock_is_between
	test	eax, eax
	je	.L280
	mov	DWORD PTR 66212[rbp], 3
.L280:
	mov	edx, DWORD PTR 66216[rbp]
	mov	eax, DWORD PTR 66720[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 66576[rbp]
	imul	eax, DWORD PTR 66720[rbp]
	add	eax, edx
	mov	DWORD PTR 66208[rbp], eax
	mov	edx, DWORD PTR 66720[rbp]
	mov	eax, edx
	add	eax, eax
	add	eax, edx
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR 66208[rbp]
	add	eax, edx
	mov	DWORD PTR 66204[rbp], eax
	mov	eax, DWORD PTR 66724[rbp]
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR 66300[rbp]
	lea	r9d, [rdx+rax]
	mov	r8d, DWORD PTR 66208[rbp]
	mov	edx, DWORD PTR 66300[rbp]
	mov	rax, QWORD PTR 66696[rbp]
	mov	rcx, QWORD PTR 66472[rbp]
	mov	QWORD PTR 40[rsp], rcx
	mov	ecx, DWORD PTR 66204[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_image
	mov	eax, DWORD PTR 66576[rbp]
	imul	eax, DWORD PTR 66720[rbp]
	mov	ebx, eax
	mov	eax, DWORD PTR 66580[rbp]
	imul	eax, DWORD PTR 66724[rbp]
	mov	esi, eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 66204[rbp]
	pxor	xmm3, xmm3
	cvtsi2sd	xmm3, DWORD PTR 66208[rbp]
	movq	rax, xmm3
	movsd	xmm1, QWORD PTR .LC67[rip]
	movapd	xmm2, xmm1
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	lerp
	cvttsd2si	r8d, xmm0
	mov	eax, DWORD PTR 66300[rbp]
	lea	edx, 48[rax]
	mov	rax, QWORD PTR 66696[rbp]
	mov	ecx, DWORD PTR 66304[rbp]
	mov	DWORD PTR 72[rsp], ecx
	mov	ecx, DWORD PTR 66576[rbp]
	mov	DWORD PTR 64[rsp], ecx
	mov	ecx, DWORD PTR 66580[rbp]
	mov	DWORD PTR 56[rsp], ecx
	lea	rcx, 84[rbp]
	mov	QWORD PTR 48[rsp], rcx
	mov	rcx, QWORD PTR 66584[rbp]
	mov	QWORD PTR 40[rsp], rcx
	mov	DWORD PTR 32[rsp], ebx
	mov	r9d, esi
	mov	rcx, rax
	call	draw_text_color
	mov	rsp, r13
.L269:
	mov	eax, DWORD PTR 66728[rbp]
	mov	DWORD PTR 66196[rbp], eax
	mov	DWORD PTR 66820[rbp], 0
	jmp	.L281
.L291:
	mov	DWORD PTR 66816[rbp], 0
	jmp	.L282
.L290:
	mov	eax, DWORD PTR 66820[rbp]
	imul	eax, DWORD PTR 66732[rbp]
	mov	edx, DWORD PTR 66816[rbp]
	add	eax, edx
	mov	DWORD PTR 66084[rbp], eax
	mov	eax, DWORD PTR 66816[rbp]
	imul	eax, DWORD PTR 66724[rbp]
	imul	eax, DWORD PTR 66728[rbp]
	mov	edx, DWORD PTR 66756[rbp]
	add	eax, edx
	mov	DWORD PTR 66080[rbp], eax
	mov	eax, DWORD PTR 66820[rbp]
	imul	eax, DWORD PTR 66720[rbp]
	imul	eax, DWORD PTR 66728[rbp]
	mov	edx, DWORD PTR 66752[rbp]
	add	eax, edx
	mov	DWORD PTR 66076[rbp], eax
	mov	eax, DWORD PTR 66816[rbp]
	add	eax, 1
	imul	eax, DWORD PTR 66724[rbp]
	imul	eax, DWORD PTR 66728[rbp]
	mov	edx, DWORD PTR 66756[rbp]
	add	eax, edx
	mov	DWORD PTR 66072[rbp], eax
	mov	eax, DWORD PTR 66820[rbp]
	add	eax, 1
	imul	eax, DWORD PTR 66720[rbp]
	imul	eax, DWORD PTR 66728[rbp]
	mov	edx, DWORD PTR 66752[rbp]
	add	eax, edx
	mov	DWORD PTR 66068[rbp], eax
	mov	r9d, 16711680
	mov	r8d, 65280
	mov	r10d, 255
	mov	ecx, DWORD PTR 66084[rbp]
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
	mov	DWORD PTR 66064[rbp], eax
	mov	r9d, DWORD PTR 66072[rbp]
	mov	r8d, DWORD PTR 66076[rbp]
	mov	edx, DWORD PTR 66080[rbp]
	mov	rax, QWORD PTR 66696[rbp]
	mov	ecx, DWORD PTR 66064[rbp]
	mov	DWORD PTR 40[rsp], ecx
	mov	ecx, DWORD PTR 66068[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_rectangle_color
	mov	eax, DWORD PTR 66516[rbp]
	imul	eax, DWORD PTR 66856[rbp]
	mov	edx, DWORD PTR 66084[rbp]
	add	eax, edx
	mov	DWORD PTR 66060[rbp], eax
	mov	eax, DWORD PTR 66060[rbp]
	cdqe
	movzx	eax, BYTE PTR 288[rbp+rax]
	movzx	eax, al
	mov	DWORD PTR 66056[rbp], eax
	cmp	DWORD PTR 66056[rbp], 143
	jle	.L283
	cmp	DWORD PTR 66056[rbp], 159
	jg	.L283
	mov	DWORD PTR 66052[rbp], 16
	cmp	DWORD PTR 66056[rbp], 144
	jne	.L284
	mov	eax, 60
	jmp	.L285
.L284:
	mov	eax, 120
.L285:
	mov	DWORD PTR 66048[rbp], eax
	call	get_timer
	mov	DWORD PTR 66044[rbp], eax
	cmp	DWORD PTR 66056[rbp], 144
	jne	.L286
	mov	rax, QWORD PTR 66624[rbp]
	mov	QWORD PTR 66808[rbp], rax
	jmp	.L287
.L286:
	cmp	DWORD PTR 66056[rbp], 148
	jne	.L288
	mov	rax, QWORD PTR 66616[rbp]
	mov	QWORD PTR 66808[rbp], rax
	jmp	.L287
.L288:
	mov	rax, QWORD PTR 66624[rbp]
	mov	QWORD PTR 66808[rbp], rax
.L287:
	mov	eax, DWORD PTR 66044[rbp]
	cdq
	idiv	DWORD PTR 66048[rbp]
	cdq
	idiv	DWORD PTR 66052[rbp]
	mov	eax, edx
	imul	eax, DWORD PTR 66196[rbp]
	mov	ecx, eax
	mov	r9d, DWORD PTR 66072[rbp]
	mov	r10d, DWORD PTR 66076[rbp]
	mov	edx, DWORD PTR 66080[rbp]
	mov	rax, QWORD PTR 66696[rbp]
	mov	r8d, DWORD PTR 66196[rbp]
	mov	DWORD PTR 72[rsp], r8d
	mov	r8d, DWORD PTR 66196[rbp]
	mov	DWORD PTR 64[rsp], r8d
	mov	DWORD PTR 56[rsp], 0
	mov	DWORD PTR 48[rsp], ecx
	mov	rcx, QWORD PTR 66808[rbp]
	mov	QWORD PTR 40[rsp], rcx
	mov	ecx, DWORD PTR 66068[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_image_part
	jmp	.L289
.L283:
	mov	eax, DWORD PTR 66056[rbp]
	cdq
	idiv	DWORD PTR 66732[rbp]
	imul	eax, DWORD PTR 66196[rbp]
	mov	r8d, eax
	mov	eax, DWORD PTR 66056[rbp]
	cdq
	idiv	DWORD PTR 66732[rbp]
	mov	eax, edx
	imul	eax, DWORD PTR 66196[rbp]
	mov	ecx, eax
	mov	r11d, DWORD PTR 66072[rbp]
	mov	r10d, DWORD PTR 66076[rbp]
	mov	edx, DWORD PTR 66080[rbp]
	mov	rax, QWORD PTR 66696[rbp]
	mov	r9d, DWORD PTR 66196[rbp]
	mov	DWORD PTR 72[rsp], r9d
	mov	r9d, DWORD PTR 66196[rbp]
	mov	DWORD PTR 64[rsp], r9d
	mov	DWORD PTR 56[rsp], r8d
	mov	DWORD PTR 48[rsp], ecx
	mov	rcx, QWORD PTR 66608[rbp]
	mov	QWORD PTR 40[rsp], rcx
	mov	ecx, DWORD PTR 66068[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	r9d, r11d
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_image_part
.L289:
	add	DWORD PTR 66816[rbp], 1
.L282:
	mov	eax, DWORD PTR 66816[rbp]
	cmp	eax, DWORD PTR 66732[rbp]
	jl	.L290
	add	DWORD PTR 66820[rbp], 1
.L281:
	mov	eax, DWORD PTR 66820[rbp]
	cmp	eax, DWORD PTR 66732[rbp]
	jl	.L291
	movzx	eax, BYTE PTR 208[rbp]
	movzx	eax, al
	imul	eax, DWORD PTR 66196[rbp]
	mov	edx, eax
	movzx	eax, BYTE PTR 213[rbp]
	movzx	eax, al
	imul	edx, eax
	movzx	eax, BYTE PTR 212[rbp]
	movzx	eax, al
	imul	eax, DWORD PTR 66196[rbp]
	lea	r8d, [rdx+rax]
	mov	edx, DWORD PTR 196[rbp]
	mov	eax, DWORD PTR 66196[rbp]
	imul	eax, DWORD PTR 66720[rbp]
	lea	ecx, [rdx+rax]
	mov	edx, DWORD PTR 192[rbp]
	mov	eax, DWORD PTR 66196[rbp]
	imul	eax, DWORD PTR 66724[rbp]
	lea	r11d, [rdx+rax]
	mov	r10d, DWORD PTR 196[rbp]
	mov	edx, DWORD PTR 192[rbp]
	mov	rax, QWORD PTR 66696[rbp]
	mov	r9d, DWORD PTR 66196[rbp]
	mov	DWORD PTR 72[rsp], r9d
	mov	r9d, DWORD PTR 66196[rbp]
	mov	DWORD PTR 64[rsp], r9d
	mov	DWORD PTR 56[rsp], 0
	mov	DWORD PTR 48[rsp], r8d
	mov	r8, QWORD PTR 66592[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r9d, r11d
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_image_part
	cmp	DWORD PTR 66872[rbp], 0
	jle	.L292
	mov	eax, DWORD PTR 192[rbp]
	add	eax, 60
	mov	DWORD PTR 65952[rbp], eax
	mov	eax, DWORD PTR 196[rbp]
	sub	eax, 120
	mov	DWORD PTR 65956[rbp], eax
	mov	rax, QWORD PTR 66696[rbp]
	mov	DWORD PTR 32[rsp], 255
	mov	r9d, 255
	mov	r8d, 255
	mov	edx, 255
	mov	rcx, rax
	call	SDL_SetRenderDrawColor
	mov	rdx, QWORD PTR 66672[rbp]
	mov	rax, QWORD PTR 66696[rbp]
	mov	rcx, rax
	call	SDL_RenderFillRect
	mov	rax, QWORD PTR 66696[rbp]
	mov	DWORD PTR 32[rsp], 255
	mov	r9d, 255
	mov	r8d, 255
	mov	edx, 255
	mov	rcx, rax
	call	SDL_SetRenderDrawColor
	mov	rax, QWORD PTR 66672[rbp]
	mov	ecx, DWORD PTR 4[rax]
	mov	rax, QWORD PTR 66672[rbp]
	mov	eax, DWORD PTR 12[rax]
	lea	edx, 3[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 2
	add	ecx, eax
	mov	rax, QWORD PTR 66672[rbp]
	mov	eax, DWORD PTR [rax]
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax
	mov	rax, QWORD PTR 66672[rbp]
	mov	eax, DWORD PTR 8[rax]
	pxor	xmm2, xmm2
	cvtsi2sd	xmm2, eax
	movsd	xmm0, QWORD PTR .LC68[rip]
	mulsd	xmm0, xmm2
	addsd	xmm0, xmm1
	cvttsd2si	r8d, xmm0
	mov	eax, DWORD PTR 196[rbp]
	lea	r10d, -15[rax]
	mov	eax, DWORD PTR 192[rbp]
	lea	edx, 45[rax]
	mov	rax, QWORD PTR 66696[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	r9d, r8d
	mov	r8d, r10d
	mov	rcx, rax
	call	SDL_RenderDrawLine
	mov	rax, QWORD PTR 66672[rbp]
	mov	edx, DWORD PTR 4[rax]
	mov	rax, QWORD PTR 66672[rbp]
	mov	eax, DWORD PTR 12[rax]
	lea	ecx, [rdx+rax]
	mov	rax, QWORD PTR 66672[rbp]
	mov	eax, DWORD PTR [rax]
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax
	mov	rax, QWORD PTR 66672[rbp]
	mov	eax, DWORD PTR 8[rax]
	pxor	xmm2, xmm2
	cvtsi2sd	xmm2, eax
	movsd	xmm0, QWORD PTR .LC69[rip]
	mulsd	xmm0, xmm2
	addsd	xmm0, xmm1
	cvttsd2si	r8d, xmm0
	mov	eax, DWORD PTR 196[rbp]
	lea	r10d, -15[rax]
	mov	eax, DWORD PTR 192[rbp]
	lea	edx, 45[rax]
	mov	rax, QWORD PTR 66696[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	r9d, r8d
	mov	r8d, r10d
	mov	rcx, rax
	call	SDL_RenderDrawLine
	mov	DWORD PTR 44[rbp], 0
	mov	rax, QWORD PTR 66672[rbp]
	mov	eax, DWORD PTR 8[rax]
	sub	eax, 10
	mov	DWORD PTR 66192[rbp], eax
	mov	r8d, DWORD PTR 66192[rbp]
	mov	ecx, DWORD PTR 44[rbp]
	mov	rdx, QWORD PTR 66680[rbp]
	mov	rax, QWORD PTR 66664[rbp]
	mov	r9d, r8d
	mov	r8d, ecx
	mov	rcx, rax
	call	TTF_RenderText_Blended_Wrapped
	mov	QWORD PTR 66800[rbp], rax
	cmp	QWORD PTR 66800[rbp], 0
	jne	.L293
	mov	edx, DWORD PTR 44[rbp]
	mov	rax, QWORD PTR 66664[rbp]
	mov	r8d, edx
	lea	rdx, .LC70[rip]
	mov	rcx, rax
	call	TTF_RenderText_Solid
	mov	QWORD PTR 66800[rbp], rax
.L293:
	mov	rax, QWORD PTR 66800[rbp]
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR 66188[rbp], eax
	mov	rax, QWORD PTR 66800[rbp]
	mov	eax, DWORD PTR 20[rax]
	mov	DWORD PTR 66184[rbp], eax
	mov	rax, QWORD PTR 66672[rbp]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR 66672[rbp]
	mov	eax, DWORD PTR 8[rax]
	sub	eax, DWORD PTR 66188[rbp]
	mov	ecx, eax
	shr	ecx, 31
	add	eax, ecx
	sar	eax
	add	eax, edx
	mov	DWORD PTR 66180[rbp], eax
	mov	rax, QWORD PTR 66672[rbp]
	mov	edx, DWORD PTR 4[rax]
	mov	rax, QWORD PTR 66672[rbp]
	mov	eax, DWORD PTR 12[rax]
	sub	eax, DWORD PTR 66184[rbp]
	mov	ecx, eax
	shr	ecx, 31
	add	eax, ecx
	sar	eax
	add	eax, edx
	mov	DWORD PTR 66176[rbp], eax
	mov	eax, DWORD PTR 66180[rbp]
	mov	DWORD PTR 16[rbp], eax
	mov	eax, DWORD PTR 66176[rbp]
	mov	DWORD PTR 20[rbp], eax
	mov	eax, DWORD PTR 66188[rbp]
	mov	DWORD PTR 24[rbp], eax
	mov	eax, DWORD PTR 66184[rbp]
	mov	DWORD PTR 28[rbp], eax
	mov	rdx, QWORD PTR 66800[rbp]
	mov	rax, QWORD PTR 66696[rbp]
	mov	rcx, rax
	call	SDL_CreateTextureFromSurface
	mov	QWORD PTR 66168[rbp], rax
	lea	rcx, 16[rbp]
	mov	rdx, QWORD PTR 66168[rbp]
	mov	rax, QWORD PTR 66696[rbp]
	mov	r9, rcx
	mov	r8d, 0
	mov	rcx, rax
	call	SDL_RenderCopy
	mov	rax, QWORD PTR 66800[rbp]
	mov	rcx, rax
	call	SDL_FreeSurface
	mov	rax, QWORD PTR 66168[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
.L292:
	mov	DWORD PTR 66796[rbp], 0
	jmp	.L294
.L296:
	mov	rdx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 66796[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	mov	eax, DWORD PTR 12[rax]
	test	eax, eax
	je	.L295
	mov	rdx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 66796[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	movss	xmm1, DWORD PTR 4[rax]
	movss	xmm0, DWORD PTR .LC71[rip]
	addss	xmm0, xmm1
	cvttss2si	edx, xmm0
	mov	rcx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 66796[rbp]
	cdqe
	sal	rax, 4
	add	rax, rcx
	movss	xmm1, DWORD PTR [rax]
	movss	xmm0, DWORD PTR .LC72[rip]
	addss	xmm0, xmm1
	cvttss2si	r9d, xmm0
	mov	rcx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 66796[rbp]
	cdqe
	sal	rax, 4
	add	rax, rcx
	movss	xmm0, DWORD PTR 4[rax]
	cvttss2si	r10d, xmm0
	mov	rcx, QWORD PTR waterParticles[rip]
	mov	eax, DWORD PTR 66796[rbp]
	cdqe
	sal	rax, 4
	add	rax, rcx
	movss	xmm0, DWORD PTR [rax]
	cvttss2si	eax, xmm0
	mov	rcx, QWORD PTR 66696[rbp]
	mov	r8, QWORD PTR 66624[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], edx
	mov	r8d, r10d
	mov	edx, eax
	call	draw_image
.L295:
	add	DWORD PTR 66796[rbp], 1
.L294:
	mov	eax, 100
	cmp	DWORD PTR 66796[rbp], eax
	jl	.L296
	mov	eax, DWORD PTR 176[rbp]
	test	eax, eax
	jle	.L297
	mov	rax, QWORD PTR 66696[rbp]
	mov	DWORD PTR 32[rsp], 255
	mov	r9d, 0
	mov	r8d, 0
	mov	edx, 255
	mov	rcx, rax
	call	SDL_SetRenderDrawColor
	mov	eax, DWORD PTR 160[rbp]
	mov	DWORD PTR 0[rbp], eax
	mov	eax, DWORD PTR 164[rbp]
	mov	DWORD PTR 4[rbp], eax
	mov	eax, DWORD PTR 168[rbp]
	mov	DWORD PTR 8[rbp], eax
	mov	eax, DWORD PTR 172[rbp]
	mov	DWORD PTR 12[rbp], eax
	mov	rax, rbp
	mov	rcx, QWORD PTR 66696[rbp]
	mov	rdx, rax
	call	SDL_RenderFillRect
.L297:
	cmp	DWORD PTR 66848[rbp], 0
	je	.L298
	mov	eax, DWORD PTR 66724[rbp]
	sal	eax, 6
	mov	DWORD PTR 66164[rbp], eax
	mov	ecx, DWORD PTR 66764[rbp]
	mov	rax, QWORD PTR 66696[rbp]
	mov	DWORD PTR 40[rsp], 0
	mov	edx, DWORD PTR 66760[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, ecx
	mov	r8d, 0
	mov	edx, 0
	mov	rcx, rax
	call	draw_rectangle_color
	mov	edx, DWORD PTR 66740[rbp]
	mov	eax, DWORD PTR 66164[rbp]
	lea	r9d, [rdx+rax]
	mov	eax, DWORD PTR 66756[rbp]
	sub	eax, DWORD PTR 66164[rbp]
	mov	r8d, DWORD PTR 66752[rbp]
	mov	rcx, QWORD PTR 66696[rbp]
	mov	rdx, QWORD PTR 66432[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	edx, DWORD PTR 66736[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	edx, eax
	call	draw_image
	mov	DWORD PTR 66160[rbp], 16
	call	draw_get_color
	mov	DWORD PTR 66156[rbp], eax
	call	get_timer
	mov	DWORD PTR 66152[rbp], eax
	mov	eax, DWORD PTR 66152[rbp]
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
	mov	DWORD PTR 66148[rbp], edx
	mov	edx, DWORD PTR 66148[rbp]
	imul	edx, edx, 360
	sub	eax, edx
	mov	DWORD PTR 66148[rbp], eax
	mov	eax, DWORD PTR 66152[rbp]
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
	movsd	xmm1, QWORD PTR .LC73[rip]
	mulsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC74[rip]
	addsd	xmm0, xmm1
	cvttsd2si	eax, xmm0
	mov	DWORD PTR 66144[rbp], eax
	mov	eax, DWORD PTR 66152[rbp]
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
	mov	DWORD PTR 66140[rbp], edx
	mov	DWORD PTR 66792[rbp], 0
	jmp	.L299
.L300:
	mov	eax, DWORD PTR 66160[rbp]
	neg	eax
	imul	eax, DWORD PTR 66724[rbp]
	pxor	xmm6, xmm6
	cvtsi2sd	xmm6, eax
	pxor	xmm5, xmm5
	cvtsi2sd	xmm5, DWORD PTR 66148[rbp]
	movq	rax, xmm5
	movq	xmm0, rax
	call	dcos
	mulsd	xmm6, xmm0
	mov	eax, DWORD PTR 66792[rbp]
	imul	eax, DWORD PTR 66724[rbp]
	pxor	xmm7, xmm7
	cvtsi2sd	xmm7, eax
	pxor	xmm3, xmm3
	cvtsi2sd	xmm3, DWORD PTR 66148[rbp]
	movq	rax, xmm3
	movq	xmm0, rax
	call	dcos
	mulsd	xmm0, xmm7
	addsd	xmm0, xmm6
	cvttsd2si	eax, xmm0
	mov	DWORD PTR 66128[rbp], eax
	mov	eax, DWORD PTR 66160[rbp]
	neg	eax
	imul	eax, DWORD PTR 66720[rbp]
	pxor	xmm6, xmm6
	cvtsi2sd	xmm6, eax
	pxor	xmm7, xmm7
	cvtsi2sd	xmm7, DWORD PTR 66144[rbp]
	movq	rax, xmm7
	movq	xmm0, rax
	call	dsin
	mulsd	xmm6, xmm0
	mov	eax, DWORD PTR 66792[rbp]
	imul	eax, DWORD PTR 66720[rbp]
	pxor	xmm7, xmm7
	cvtsi2sd	xmm7, eax
	pxor	xmm4, xmm4
	cvtsi2sd	xmm4, DWORD PTR 66144[rbp]
	movq	rax, xmm4
	movq	xmm0, rax
	call	dsin
	mulsd	xmm0, xmm7
	addsd	xmm0, xmm6
	cvttsd2si	eax, xmm0
	mov	DWORD PTR 66124[rbp], eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR 66792[rbp]
	mov	eax, DWORD PTR 66160[rbp]
	sub	eax, 1
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	movsd	xmm0, QWORD PTR .LC75[rip]
	movapd	xmm1, xmm0
	mov	rax, QWORD PTR .LC76[rip]
	movq	xmm0, rax
	call	lerp
	cvttsd2si	edx, xmm0
	mov	eax, DWORD PTR 66140[rbp]
	mov	r8d, edx
	mov	edx, 32
	mov	ecx, eax
	call	make_color_hsv
	mov	edx, eax
	mov	rax, QWORD PTR 66696[rbp]
	mov	rcx, rax
	call	draw_set_color
	mov	edx, DWORD PTR 66736[rbp]
	mov	eax, DWORD PTR 66124[rbp]
	lea	ecx, [rdx+rax]
	mov	edx, DWORD PTR 66740[rbp]
	mov	eax, DWORD PTR 66164[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 66128[rbp]
	lea	r9d, [rdx+rax]
	mov	edx, DWORD PTR 66752[rbp]
	mov	eax, DWORD PTR 66124[rbp]
	lea	r10d, [rdx+rax]
	mov	eax, DWORD PTR 66756[rbp]
	sub	eax, DWORD PTR 66164[rbp]
	mov	edx, DWORD PTR 66128[rbp]
	add	edx, eax
	mov	rax, QWORD PTR 66696[rbp]
	mov	r8, QWORD PTR 66424[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_image
	add	DWORD PTR 66792[rbp], 1
.L299:
	mov	eax, DWORD PTR 66792[rbp]
	cmp	eax, DWORD PTR 66160[rbp]
	jl	.L300
	mov	edx, DWORD PTR 66740[rbp]
	mov	eax, DWORD PTR 66164[rbp]
	lea	r9d, [rdx+rax]
	mov	eax, DWORD PTR 66756[rbp]
	sub	eax, DWORD PTR 66164[rbp]
	mov	r8d, DWORD PTR 66752[rbp]
	mov	rcx, QWORD PTR 66696[rbp]
	mov	rdx, QWORD PTR 66416[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	edx, DWORD PTR 66736[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	edx, eax
	call	draw_image
	mov	edx, DWORD PTR 66156[rbp]
	mov	rax, QWORD PTR 66696[rbp]
	mov	rcx, rax
	call	draw_set_color
	mov	DWORD PTR 66136[rbp], 384
	mov	DWORD PTR 66132[rbp], 32
	mov	eax, DWORD PTR 66152[rbp]
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
	jle	.L301
	mov	r8d, 65535
	mov	eax, DWORD PTR 66576[rbp]
	imul	eax, DWORD PTR 66720[rbp]
	mov	ecx, eax
	mov	eax, DWORD PTR 66580[rbp]
	imul	eax, DWORD PTR 66724[rbp]
	mov	r9d, eax
	mov	r10d, DWORD PTR 66132[rbp]
	mov	edx, DWORD PTR 66136[rbp]
	mov	rax, QWORD PTR 66696[rbp]
	mov	DWORD PTR 72[rsp], r8d
	mov	r8d, DWORD PTR 66576[rbp]
	mov	DWORD PTR 64[rsp], r8d
	mov	r8d, DWORD PTR 66580[rbp]
	mov	DWORD PTR 56[rsp], r8d
	mov	r8, QWORD PTR 66408[rbp]
	mov	QWORD PTR 48[rsp], r8
	mov	r8, QWORD PTR 66584[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_text_color
.L301:
	mov	DWORD PTR 66136[rbp], 64
	mov	DWORD PTR 66132[rbp], 8
	mov	r8d, 16777215
	mov	eax, DWORD PTR 66576[rbp]
	imul	eax, DWORD PTR 66720[rbp]
	mov	ecx, eax
	mov	eax, DWORD PTR 66580[rbp]
	imul	eax, DWORD PTR 66724[rbp]
	mov	r9d, eax
	mov	edx, DWORD PTR 66752[rbp]
	mov	eax, DWORD PTR 66744[rbp]
	add	eax, edx
	sub	eax, DWORD PTR 66132[rbp]
	mov	edx, eax
	mov	eax, DWORD PTR 66576[rbp]
	imul	eax, DWORD PTR 66720[rbp]
	sub	edx, eax
	mov	r10d, edx
	mov	edx, DWORD PTR 66136[rbp]
	mov	rax, QWORD PTR 66696[rbp]
	mov	DWORD PTR 72[rsp], r8d
	mov	r8d, DWORD PTR 66576[rbp]
	mov	DWORD PTR 64[rsp], r8d
	mov	r8d, DWORD PTR 66580[rbp]
	mov	DWORD PTR 56[rsp], r8d
	mov	r8, QWORD PTR 66400[rbp]
	mov	QWORD PTR 48[rsp], r8
	mov	r8, QWORD PTR 66584[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_text_color
.L298:
	cmp	DWORD PTR 66872[rbp], 0
	jle	.L302
	mov	rax, QWORD PTR 66696[rbp]
	mov	DWORD PTR 32[rsp], 255
	mov	r9d, 255
	mov	r8d, 255
	mov	edx, 255
	mov	rcx, rax
	call	SDL_SetRenderDrawColor
	lea	rax, 65952[rbp]
	mov	rcx, QWORD PTR 66696[rbp]
	mov	rdx, rax
	call	SDL_RenderFillRect
	mov	DWORD PTR -4[rbp], 0
	mov	BYTE PTR -4[rbp], -1
	mov	ecx, DWORD PTR -4[rbp]
	mov	rdx, QWORD PTR 66680[rbp]
	mov	rax, QWORD PTR 66664[rbp]
	mov	r8d, ecx
	mov	rcx, rax
	call	TTF_RenderText_Solid
	mov	QWORD PTR 66112[rbp], rax
	mov	rdx, QWORD PTR 66112[rbp]
	mov	rax, QWORD PTR 66696[rbp]
	mov	rcx, rax
	call	SDL_CreateTextureFromSurface
	mov	QWORD PTR 66104[rbp], rax
	mov	ecx, DWORD PTR 65952[rbp]
	mov	r8d, DWORD PTR 65960[rbp]
	mov	rax, QWORD PTR 66112[rbp]
	mov	edx, DWORD PTR 16[rax]
	mov	eax, r8d
	sub	eax, edx
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	add	eax, ecx
	mov	DWORD PTR -32[rbp], eax
	mov	ecx, DWORD PTR 65956[rbp]
	mov	r8d, DWORD PTR 65964[rbp]
	mov	rax, QWORD PTR 66112[rbp]
	mov	edx, DWORD PTR 20[rax]
	mov	eax, r8d
	sub	eax, edx
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	add	eax, ecx
	mov	DWORD PTR -28[rbp], eax
	mov	rax, QWORD PTR 66112[rbp]
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR -24[rbp], eax
	mov	rax, QWORD PTR 66112[rbp]
	mov	eax, DWORD PTR 20[rax]
	mov	DWORD PTR -20[rbp], eax
	lea	rcx, -32[rbp]
	mov	rdx, QWORD PTR 66104[rbp]
	mov	rax, QWORD PTR 66696[rbp]
	mov	r9, rcx
	mov	r8d, 0
	mov	rcx, rax
	call	SDL_RenderCopy
	mov	rax, QWORD PTR 66112[rbp]
	mov	rcx, rax
	call	SDL_FreeSurface
	mov	rax, QWORD PTR 66104[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
.L302:
	mov	rax, QWORD PTR 66696[rbp]
	mov	DWORD PTR 32[rsp], 255
	mov	r9d, 0
	mov	r8d, 0
	mov	edx, 0
	mov	rcx, rax
	call	SDL_SetRenderDrawColor
	mov	edx, DWORD PTR 66868[rbp]
	lea	rax, 64[rbp]
	mov	r9d, edx
	lea	r8, .LC77[rip]
	mov	edx, 20
	mov	rcx, rax
	call	snprintf
	mov	edx, DWORD PTR 65836[rbp]
	lea	rax, 64[rbp]
	mov	rcx, QWORD PTR 66664[rbp]
	mov	r8d, edx
	mov	rdx, rax
	call	TTF_RenderText_Solid
	mov	QWORD PTR 66096[rbp], rax
	mov	rdx, QWORD PTR 66096[rbp]
	mov	rax, QWORD PTR 66696[rbp]
	mov	rcx, rax
	call	SDL_CreateTextureFromSurface
	mov	QWORD PTR 66088[rbp], rax
	mov	DWORD PTR 48[rbp], 10
	mov	DWORD PTR 52[rbp], 720
	mov	rax, QWORD PTR 66096[rbp]
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR 56[rbp], eax
	mov	rax, QWORD PTR 66096[rbp]
	mov	eax, DWORD PTR 20[rax]
	mov	DWORD PTR 60[rbp], eax
	lea	rcx, 48[rbp]
	mov	rdx, QWORD PTR 66088[rbp]
	mov	rax, QWORD PTR 66696[rbp]
	mov	r9, rcx
	mov	r8d, 0
	mov	rcx, rax
	call	SDL_RenderCopy
	mov	rax, QWORD PTR 66096[rbp]
	mov	rcx, rax
	call	SDL_FreeSurface
	mov	rax, QWORD PTR 66088[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66696[rbp]
	mov	rcx, rax
	call	SDL_RenderPresent
	mov	ecx, 16
	call	SDL_Delay
.L178:
	cmp	DWORD PTR 66844[rbp], 0
	jne	.L179
	lea	rax, .LC78[rip]
	mov	rcx, rax
	call	puts
	mov	rax, QWORD PTR waterParticles[rip]
	mov	rcx, rax
	call	free
	mov	rax, QWORD PTR 66664[rbp]
	mov	rcx, rax
	call	TTF_CloseFont
	mov	rax, QWORD PTR 66640[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66632[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66624[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66616[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66608[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66496[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66488[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66592[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66432[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66424[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66416[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66584[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66568[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66472[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66600[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66456[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	call	IMG_Quit
	mov	eax, DWORD PTR 66444[rbp]
	mov	ecx, eax
	call	SDL_CloseAudioDevice
	mov	rax, QWORD PTR 120[rbp]
	mov	rcx, rax
	call	SDL_FreeWAV
	mov	rax, QWORD PTR 66696[rbp]
	mov	rcx, rax
	call	SDL_DestroyRenderer
	mov	rax, QWORD PTR 66704[rbp]
	mov	rcx, rax
	call	SDL_DestroyWindow
	call	SDL_Quit
	mov	ecx, 500
	call	SDL_Delay
	mov	eax, 0
	jmp	.L162
.L167:
	call	SDL_GetError
	mov	rbx, rax
	mov	ecx, 2
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	rcx, rax
	mov	rax, QWORD PTR 66768[rbp]
	mov	r9, rbx
	mov	r8, rax
	lea	rax, .LC79[rip]
	mov	rdx, rax
	call	fprintf
	call	SDL_Quit
	mov	ecx, 1
	call	exit
.L162:
	mov	rsp, r12
	jmp	.L160
.L176:
	mov	rsp, r12
.L160:
	movaps	xmm6, XMMWORD PTR 66880[rbp]
	movaps	xmm7, XMMWORD PTR 66896[rbp]
	lea	rsp, 66920[rbp]
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
	.align 8
.LC14:
	.long	-858993459
	.long	1073532108
	.align 8
.LC15:
	.long	0
	.long	1077936128
	.align 8
.LC65:
	.long	0
	.long	1076887552
	.align 8
.LC67:
	.long	0
	.long	1070596096
	.align 8
.LC68:
	.long	-1717986918
	.long	1069128089
	.align 8
.LC69:
	.long	858993459
	.long	1070805811
	.align 4
.LC71:
	.long	1097859072
	.align 4
.LC72:
	.long	1084227584
	.align 8
.LC73:
	.long	0
	.long	1079164928
	.align 8
.LC74:
	.long	0
	.long	1079410688
	.align 8
.LC75:
	.long	0
	.long	1081073664
	.align 8
.LC76:
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
	.def	SDL_RenderPresent;	.scl	2;	.type	32;	.endef
	.def	SDL_Delay;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	TTF_CloseFont;	.scl	2;	.type	32;	.endef
	.def	IMG_Quit;	.scl	2;	.type	32;	.endef
	.def	SDL_CloseAudioDevice;	.scl	2;	.type	32;	.endef
	.def	SDL_DestroyRenderer;	.scl	2;	.type	32;	.endef
	.def	SDL_DestroyWindow;	.scl	2;	.type	32;	.endef
