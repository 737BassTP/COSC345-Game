	.file	"main.c"
	.intel_syntax noprefix
	.text
	.def	snprintf;	.scl	3;	.type	32;	.endef
	.seh_proc	snprintf
snprintf:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	lea	rax, 40[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rcx, QWORD PTR -16[rbp]
	mov	rdx, QWORD PTR 32[rbp]
	mov	rax, QWORD PTR 24[rbp]
	mov	r9, rcx
	mov	r8, rdx
	mov	rdx, rax
	mov	rcx, QWORD PTR 16[rbp]
	call	__ms_vsnprintf
	mov	DWORD PTR -4[rbp], eax
	mov	eax, DWORD PTR -4[rbp]
	add	rsp, 48
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
	lea	rbp, 128[rsp]
	.seh_setframe	rbp, 128
	.seh_endprologue
	mov	QWORD PTR -64[rbp], rcx
	mov	r8d, -16777152
	mov	edx, 0
	mov	rcx, QWORD PTR -64[rbp]
	call	SDL_FillRect
	test	eax, eax
	jns	.L5
	call	SDL_GetError
	mov	rbx, rax
	mov	ecx, 2
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	r8, rbx
	lea	rdx, .LC0[rip]
	mov	rcx, rax
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
	mov	ecx, DWORD PTR 16[rbp]
	mov	edx, 799063683
	mov	eax, ecx
	imul	edx
	sar	edx, 3
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
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
	mov	edx, 255
	sub	edx, eax
	mov	eax, edx
	imul	eax, DWORD PTR 32[rbp]
	sar	eax, 8
	mov	BYTE PTR -7[rbp], al
	movzx	eax, BYTE PTR -5[rbp]
	mov	edx, 255
	sub	edx, eax
	mov	eax, edx
	imul	eax, DWORD PTR 24[rbp]
	sar	eax, 8
	mov	edx, 255
	sub	edx, eax
	mov	eax, edx
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
	movzx	r8d, al
	mov	eax, DWORD PTR 24[rbp]
	sar	eax, 8
	movzx	ecx, al
	mov	eax, DWORD PTR 24[rbp]
	movzx	eax, al
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, r8d
	mov	r8d, ecx
	mov	edx, eax
	mov	rcx, QWORD PTR 16[rbp]
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
	movzx	r8d, al
	mov	eax, DWORD PTR -4[rbp]
	sar	eax, 8
	movzx	ecx, al
	mov	eax, DWORD PTR -4[rbp]
	movzx	eax, al
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, r8d
	mov	r8d, ecx
	mov	edx, eax
	mov	rcx, QWORD PTR 16[rbp]
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
	mov	eax, DWORD PTR 24[rbp]
	mov	edx, eax
	mov	rcx, QWORD PTR 16[rbp]
	call	draw_set_color
	mov	rcx, QWORD PTR 16[rbp]
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
	mov	eax, DWORD PTR 32[rbp]
	mov	edx, eax
	mov	rcx, QWORD PTR 16[rbp]
	call	draw_set_alpha
	mov	eax, DWORD PTR 24[rbp]
	mov	edx, eax
	mov	rcx, QWORD PTR 16[rbp]
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
	mov	rdx, rax
	mov	rcx, QWORD PTR 16[rbp]
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
	mov	eax, DWORD PTR 56[rbp]
	mov	edx, eax
	mov	rcx, QWORD PTR 16[rbp]
	call	draw_set_color
	mov	r8d, DWORD PTR 40[rbp]
	mov	ecx, DWORD PTR 32[rbp]
	mov	eax, DWORD PTR 24[rbp]
	mov	edx, DWORD PTR 48[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, r8d
	mov	r8d, ecx
	mov	edx, eax
	mov	rcx, QWORD PTR 16[rbp]
	call	draw_rectangle
	mov	eax, DWORD PTR -4[rbp]
	mov	edx, eax
	mov	rcx, QWORD PTR 16[rbp]
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
	lea	rdx, -32[rbp]
	mov	rax, QWORD PTR 56[rbp]
	mov	r9, rdx
	mov	r8d, 0
	mov	rdx, rax
	mov	rcx, QWORD PTR 16[rbp]
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
	lea	rcx, -32[rbp]
	lea	rdx, -48[rbp]
	mov	rax, QWORD PTR 56[rbp]
	mov	r9, rcx
	mov	r8, rdx
	mov	rdx, rax
	mov	rcx, QWORD PTR 16[rbp]
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
	mov	ecx, DWORD PTR 32[rbp]
	mov	edx, DWORD PTR -8[rbp]
	add	ecx, edx
	mov	edx, DWORD PTR 48[rbp]
	add	ecx, edx
	mov	r8d, DWORD PTR 24[rbp]
	mov	edx, DWORD PTR -4[rbp]
	add	r8d, edx
	mov	edx, DWORD PTR 40[rbp]
	lea	r9d, [r8+rdx]
	mov	r8d, DWORD PTR 32[rbp]
	mov	edx, DWORD PTR -8[rbp]
	lea	r10d, [r8+rdx]
	mov	r8d, DWORD PTR 24[rbp]
	mov	edx, DWORD PTR -4[rbp]
	add	edx, r8d
	mov	r8d, DWORD PTR 80[rbp]
	mov	DWORD PTR 72[rsp], r8d
	mov	r8d, DWORD PTR 72[rbp]
	mov	DWORD PTR 64[rsp], r8d
	mov	DWORD PTR 56[rsp], 0
	mov	DWORD PTR 48[rsp], eax
	mov	rax, QWORD PTR 56[rbp]
	mov	QWORD PTR 40[rsp], rax
	mov	DWORD PTR 32[rsp], ecx
	mov	r8d, r10d
	mov	rcx, QWORD PTR 16[rbp]
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
	mov	eax, DWORD PTR 88[rbp]
	mov	edx, eax
	mov	rcx, QWORD PTR 16[rbp]
	call	draw_set_color
	mov	r8d, DWORD PTR 40[rbp]
	mov	ecx, DWORD PTR 32[rbp]
	mov	eax, DWORD PTR 24[rbp]
	mov	edx, DWORD PTR 80[rbp]
	mov	DWORD PTR 64[rsp], edx
	mov	edx, DWORD PTR 72[rbp]
	mov	DWORD PTR 56[rsp], edx
	mov	rdx, QWORD PTR 64[rbp]
	mov	QWORD PTR 48[rsp], rdx
	mov	rdx, QWORD PTR 56[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	edx, DWORD PTR 48[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, r8d
	mov	r8d, ecx
	mov	edx, eax
	mov	rcx, QWORD PTR 16[rbp]
	call	draw_text
	mov	eax, DWORD PTR -4[rbp]
	mov	edx, eax
	mov	rcx, QWORD PTR 16[rbp]
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
	imul	eax, DWORD PTR 16[rbp]
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
	movsd	xmm1, QWORD PTR .LC1[rip]
	divsd	xmm0, xmm1
	movapd	xmm1, xmm0
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
	movsd	xmm1, QWORD PTR .LC2[rip]
	divsd	xmm0, xmm1
	movapd	xmm1, xmm0
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
	movsd	xmm0, QWORD PTR 16[rbp]
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
	movsd	xmm0, QWORD PTR 16[rbp]
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
	mov	r8d, DWORD PTR 56[rbp]
	mov	ecx, DWORD PTR 48[rbp]
	mov	eax, DWORD PTR 24[rbp]
	mov	edx, DWORD PTR 72[rbp]
	mov	DWORD PTR 40[rsp], edx
	mov	edx, DWORD PTR 64[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, r8d
	mov	r8d, ecx
	mov	edx, eax
	mov	ecx, DWORD PTR 16[rbp]
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
	mov	r8d, DWORD PTR 56[rbp]
	mov	ecx, DWORD PTR 48[rbp]
	mov	eax, DWORD PTR 40[rbp]
	mov	edx, DWORD PTR 72[rbp]
	mov	DWORD PTR 40[rsp], edx
	mov	edx, DWORD PTR 64[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, r8d
	mov	r8d, ecx
	mov	edx, eax
	mov	ecx, DWORD PTR 16[rbp]
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
	cvtsi2sd	xmm1, DWORD PTR 24[rbp]
	cvtsi2sd	xmm0, DWORD PTR 16[rbp]
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
	mov	eax, DWORD PTR 24[rbp]
	mov	edx, DWORD PTR 16[rbp]
	mov	ecx, eax
	call	darctan2
	movapd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC3[rip]
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
	lea	rcx, .LC4[rip]
	call	puts
	mov	DWORD PTR glob_vk_f2[rip], 0
	lea	rdx, .LC5[rip]
	lea	rcx, .LC6[rip]
	call	fopen
	mov	QWORD PTR 131040[rbp], rax
	lea	rdx, .LC7[rip]
	lea	rcx, .LC8[rip]
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
	lea	rcx, .LC10[rip]
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
	lea	rdx, .LC5[rip]
	lea	rcx, .LC11[rip]
	call	fopen
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	mov	r8d, 0
	mov	edx, DWORD PTR 16[rbp]
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
	jmp	.L115
.L116:
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 24[rbp]
	mov	r8, rdx
	mov	edx, 16
	mov	rcx, rax
	call	fgets
	sub	DWORD PTR -4[rbp], 1
.L115:
	cmp	DWORD PTR -4[rbp], 0
	jg	.L116
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
	mov	ecx, eax
	mov	edx, 1427937179
	mov	eax, ecx
	imul	edx
	sar	edx, 8
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	imul	eax, eax, 770
	sub	ecx, eax
	mov	eax, ecx
	lea	ecx, 298[rax]
	lea	rax, waterParticles[rip]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR 16[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	cvtsi2ss	xmm0, ecx
	movss	DWORD PTR [rax], xmm0
	call	rand
	cdq
	idiv	DWORD PTR 32[rbp]
	mov	eax, edx
	neg	eax
	mov	ecx, eax
	lea	rax, waterParticles[rip]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR 16[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	cvtsi2ss	xmm0, ecx
	movss	DWORD PTR 4[rax], xmm0
	lea	rax, waterParticles[rip]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR 16[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	movss	xmm0, DWORD PTR .LC12[rip]
	movss	DWORD PTR 8[rax], xmm0
	lea	rax, waterParticles[rip]
	mov	rdx, QWORD PTR [rax]
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
	jmp	.L120
.L121:
	lea	rax, waterParticles[rip]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	mov	DWORD PTR 12[rax], 1
	add	DWORD PTR -4[rbp], 1
.L120:
	mov	eax, 100
	cmp	DWORD PTR -4[rbp], eax
	jl	.L121
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
	jmp	.L123
.L124:
	lea	rax, waterParticles[rip]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	mov	DWORD PTR 12[rax], 0
	add	DWORD PTR -4[rbp], 1
.L123:
	mov	eax, 100
	cmp	DWORD PTR -4[rbp], eax
	jl	.L124
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
	jg	.L126
	mov	DWORD PTR health[rip], 0
	jmp	.L128
.L126:
	mov	eax, DWORD PTR health[rip]
	sub	eax, DWORD PTR 16[rbp]
	mov	DWORD PTR health[rip], eax
.L128:
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
	jl	.L130
	mov	DWORD PTR health[rip], 100
	jmp	.L132
.L130:
	mov	edx, DWORD PTR health[rip]
	mov	eax, DWORD PTR 16[rbp]
	add	eax, edx
	mov	DWORD PTR health[rip], eax
.L132:
	nop
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
	jb	.L134
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR 12[rax], 0
.L134:
	mov	rax, QWORD PTR -8[rbp]
	mov	edx, DWORD PTR 8[rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 12[rax]
	sub	edx, eax
	mov	eax, edx
	mov	DWORD PTR -12[rbp], eax
	mov	eax, DWORD PTR 32[rbp]
	cmp	DWORD PTR -12[rbp], eax
	cmovbe	eax, DWORD PTR -12[rbp]
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
	mov	ecx, DWORD PTR 16[rbp]
	mov	edx, -2004318071
	mov	eax, ecx
	imul	edx
	lea	eax, [rdx+rcx]
	sar	eax, 5
	mov	edx, eax
	mov	eax, ecx
	sar	eax, 31
	mov	ecx, edx
	sub	ecx, eax
	mov	edx, 715827883
	mov	eax, ecx
	imul	edx
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
	mov	ecx, edx
	sar	ecx, 5
	cdq
	sub	ecx, edx
	mov	edx, ecx
	imul	edx, edx, 60
	sub	eax, edx
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
	mov	edx, 715827883
	mov	eax, ecx
	imul	edx
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
	imul	ecx, edx, 60
	mov	eax, DWORD PTR 32[rbp]
	movsx	rdx, eax
	imul	rdx, rdx, -2004318071
	shr	rdx, 32
	add	edx, eax
	sar	edx, 5
	mov	r8d, edx
	cdq
	sub	r8d, edx
	mov	edx, r8d
	imul	edx, edx, 60
	sub	eax, edx
	mov	edx, eax
	lea	eax, [rcx+rdx]
	mov	DWORD PTR -4[rbp], eax
	mov	ecx, DWORD PTR 40[rbp]
	mov	edx, 715827883
	mov	eax, ecx
	imul	edx
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
	imul	ecx, edx, 60
	mov	eax, DWORD PTR 48[rbp]
	movsx	rdx, eax
	imul	rdx, rdx, -2004318071
	shr	rdx, 32
	add	edx, eax
	sar	edx, 5
	mov	r8d, edx
	cdq
	sub	r8d, edx
	mov	edx, r8d
	imul	edx, edx, 60
	sub	eax, edx
	mov	edx, eax
	lea	eax, [rcx+rdx]
	mov	DWORD PTR -8[rbp], eax
	mov	eax, DWORD PTR 16[rbp]
	cmp	eax, DWORD PTR -4[rbp]
	jl	.L140
	mov	eax, DWORD PTR 16[rbp]
	cmp	eax, DWORD PTR -8[rbp]
	jg	.L140
	mov	eax, 1
	jmp	.L142
.L140:
	mov	eax, 0
.L142:
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
	cvtsi2sd	xmm1, DWORD PTR 16[rbp]
	movsd	xmm0, QWORD PTR .LC13[rip]
	mulsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC14[rip]
	addsd	xmm0, xmm1
	movq	rax, xmm0
	movq	xmm0, rax
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC15:
	.ascii "Compiled with SDL version %u.%u.%u ...\12\0"
	.align 8
.LC16:
	.ascii "Linked against SDL version %u.%u.%u.\12\0"
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
	.align 8
.LC23:
	.ascii "SDL_ttf could not initialize! TTF_Error: %s\12\0"
.LC24:
	.ascii "font.ttf\0"
	.align 8
.LC25:
	.ascii "Failed to load font! SDL_ttf Error: %s\12\0"
	.align 8
.LC26:
	.ascii "Renderer could not be created! SDL_Error: %s\12\0"
.LC27:
	.ascii "img/spr_grass.png\0"
.LC28:
	.ascii "img/spr_sand.png\0"
.LC29:
	.ascii "img/spr_water_strip16.png\0"
.LC30:
	.ascii "img/spr_lava_strip16.png\0"
.LC31:
	.ascii "tiled/tileset.png\0"
.LC32:
	.ascii "img/hudshade.png\0"
.LC33:
	.ascii "img/player_strip8.png\0"
.LC34:
	.ascii "img/ascii_strip96.png\0"
.LC35:
	.ascii "img/clock1_strip10.png\0"
.LC36:
	.ascii "Night\0"
.LC37:
	.ascii "Morning\0"
.LC38:
	.ascii "Day\0"
.LC39:
	.ascii "Evening\0"
.LC40:
	.ascii "img/dunedin-map.png\0"
.LC41:
	.ascii "img/spr_map_unknown.png\0"
.LC42:
	.ascii "img/spr_thermometer.png\0"
.LC43:
	.ascii "img/spr_nutrients_strip4.png\0"
.LC44:
	.ascii "music.wav\0"
.LC45:
	.ascii "Failed to load WAV file: %s\12\0"
	.align 8
.LC46:
	.ascii "Failed to open audio device: %s\12\0"
.LC47:
	.ascii "img/logo1a.png\0"
.LC48:
	.ascii "img/logo1b.png\0"
.LC49:
	.ascii "img/logo1c.png\0"
.LC50:
	.ascii "Press SPACE to continue.\0"
	.align 8
.LC51:
	.ascii "(C) 2023 - Thomas, Sean, Matthew, Nicholas - COSC345\0"
.LC52:
	.ascii "Entering main loop...\0"
.LC53:
	.ascii "F2 started!\0"
.LC54:
	.ascii "F2 finished!\0"
	.align 8
.LC55:
	.ascii "you pressed 1, good job. Lets test the limit\0"
	.align 8
.LC56:
	.ascii "you pressed 2, good job. Lets test the limit woo\0"
.LC57:
	.ascii "you pressed 3\0"
	.align 8
.LC58:
	.ascii "you pressed 4, good job. Lets test the limit woo\0"
.LC59:
	.ascii "HEALTH:\0"
.LC60:
	.ascii "Protein\0"
.LC61:
	.ascii "Carbs\0"
.LC62:
	.ascii "Fat\0"
.LC63:
	.ascii "Vitamin\0"
.LC64:
	.ascii "LVL: XYZ/255\0"
.LC65:
	.ascii "X\0"
.LC66:
	.ascii "Y\0"
.LC67:
	.ascii "Z\0"
.LC69:
	.ascii ":\0"
.LC73:
	.ascii "Error: Text Rendering Failed\0"
.LC80:
	.ascii "Score: %d\0"
.LC81:
	.ascii "...exited main loop.\0"
.LC82:
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
	mov	eax, 66984
	call	___chkstk_ms
	sub	rsp, rax
	.seh_stackalloc	66984
	lea	rbp, 128[rsp]
	.seh_setframe	rbp, 128
	movaps	XMMWORD PTR 66816[rbp], xmm6
	.seh_savexmm	xmm6, 66944
	movaps	XMMWORD PTR 66832[rbp], xmm7
	.seh_savexmm	xmm7, 66960
	.seh_endprologue
	mov	DWORD PTR 66928[rbp], ecx
	mov	QWORD PTR 66936[rbp], rdx
	mov	rax, rsp
	mov	r12, rax
	mov	QWORD PTR 66712[rbp], 256
	mov	rax, QWORD PTR 66712[rbp]
	sub	rax, 1
	mov	QWORD PTR 66704[rbp], rax
	mov	rax, QWORD PTR 66712[rbp]
	mov	r10, rax
	mov	r11d, 0
	mov	rax, QWORD PTR 66712[rbp]
	mov	r8, rax
	mov	r9d, 0
	mov	rax, QWORD PTR 66712[rbp]
	add	rax, 15
	shr	rax, 4
	sal	rax, 4
	call	___chkstk_ms
	sub	rsp, rax
	lea	rax, 80[rsp]
	add	rax, 0
	mov	QWORD PTR 66696[rbp], rax
	mov	BYTE PTR 77[rbp], 2
	mov	BYTE PTR 78[rbp], 28
	mov	BYTE PTR 79[rbp], 1
	lea	rax, 74[rbp]
	mov	rcx, rax
	call	SDL_GetVersion
	movzx	eax, BYTE PTR 79[rbp]
	movzx	ecx, al
	movzx	eax, BYTE PTR 78[rbp]
	movzx	edx, al
	movzx	eax, BYTE PTR 77[rbp]
	movzx	eax, al
	mov	r9d, ecx
	mov	r8d, edx
	mov	edx, eax
	lea	rcx, .LC15[rip]
	call	SDL_Log
	movzx	eax, BYTE PTR 76[rbp]
	movzx	ecx, al
	movzx	eax, BYTE PTR 75[rbp]
	movzx	edx, al
	movzx	eax, BYTE PTR 74[rbp]
	movzx	eax, al
	mov	r9d, ecx
	mov	r8d, edx
	mov	edx, eax
	lea	rcx, .LC16[rip]
	call	SDL_Log
	mov	DWORD PTR 66692[rbp], 1366
	mov	DWORD PTR 66688[rbp], 768
	mov	eax, DWORD PTR 66692[rbp]
	sub	eax, DWORD PTR 66688[rbp]
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	mov	DWORD PTR 66684[rbp], eax
	mov	DWORD PTR 66680[rbp], 0
	mov	eax, DWORD PTR 66688[rbp]
	mov	DWORD PTR 66676[rbp], eax
	mov	eax, DWORD PTR 66688[rbp]
	mov	DWORD PTR 66672[rbp], eax
	mov	edx, DWORD PTR 66684[rbp]
	mov	eax, DWORD PTR 66676[rbp]
	add	eax, edx
	mov	DWORD PTR 66668[rbp], eax
	mov	edx, DWORD PTR 66680[rbp]
	mov	eax, DWORD PTR 66672[rbp]
	add	eax, edx
	mov	DWORD PTR 66664[rbp], eax
	mov	DWORD PTR 66660[rbp], 16
	mov	DWORD PTR 66656[rbp], 16
	mov	eax, DWORD PTR 66660[rbp]
	mov	ecx, eax
	call	sqr
	mov	edi, eax
	mov	eax, DWORD PTR 66688[rbp]
	cdq
	idiv	edi
	mov	DWORD PTR 66652[rbp], eax
	mov	eax, DWORD PTR 66652[rbp]
	mov	DWORD PTR 66648[rbp], eax
	mov	eax, 100
	cdqe
	sal	rax, 4
	mov	rcx, rax
	call	malloc
	mov	rdx, rax
	lea	rax, waterParticles[rip]
	mov	QWORD PTR [rax], rdx
	lea	rax, waterParticles[rip]
	mov	rax, QWORD PTR [rax]
	test	rax, rax
	jne	.L146
	mov	ecx, 2
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	r9, rax
	mov	r8d, 46
	mov	edx, 1
	lea	rcx, .LC17[rip]
	call	fwrite
	mov	eax, 1
	jmp	.L147
.L146:
	mov	ecx, 0
	call	time
	mov	ecx, eax
	call	srand
	mov	DWORD PTR 66804[rbp], 0
	jmp	.L148
.L149:
	mov	ecx, DWORD PTR 66688[rbp]
	mov	edx, DWORD PTR 66692[rbp]
	mov	eax, DWORD PTR 66804[rbp]
	mov	r8d, ecx
	mov	ecx, eax
	call	createWaterParticle
	add	DWORD PTR 66804[rbp], 1
.L148:
	mov	eax, 100
	cmp	DWORD PTR 66804[rbp], eax
	jl	.L149
	mov	DWORD PTR 66644[rbp], 62001
	mov	eax, DWORD PTR 66644[rbp]
	mov	ecx, eax
	call	SDL_Init
	test	eax, eax
	je	.L150
	call	SDL_GetError
	mov	rdx, rax
	lea	rcx, .LC18[rip]
	call	printf
	mov	eax, -1
	jmp	.L147
.L150:
	mov	edx, DWORD PTR 66692[rbp]
	mov	DWORD PTR 40[rsp], 0
	mov	eax, DWORD PTR 66688[rbp]
	mov	DWORD PTR 32[rsp], eax
	mov	r9d, edx
	mov	r8d, 536805376
	mov	edx, 536805376
	lea	rcx, .LC19[rip]
	call	SDL_CreateWindow
	mov	QWORD PTR 66632[rbp], rax
	cmp	QWORD PTR 66632[rbp], 0
	jne	.L151
	mov	rax, QWORD PTR 66696[rbp]
	mov	rdx, QWORD PTR 66712[rbp]
	lea	r8, .LC20[rip]
	mov	rcx, rax
	call	snprintf
	jmp	.L152
.L151:
	mov	rax, QWORD PTR 66632[rbp]
	mov	r8d, 4
	mov	edx, -1
	mov	rcx, rax
	call	SDL_CreateRenderer
	mov	QWORD PTR 66624[rbp], rax
	cmp	QWORD PTR 66624[rbp], 0
	jne	.L153
	mov	rax, QWORD PTR 66696[rbp]
	mov	rdx, QWORD PTR 66712[rbp]
	lea	r8, .LC21[rip]
	mov	rcx, rax
	call	snprintf
	jmp	.L152
.L153:
	mov	rax, QWORD PTR 66632[rbp]
	mov	rcx, rax
	call	SDL_GetWindowSurface
	mov	QWORD PTR 66616[rbp], rax
	cmp	QWORD PTR 66616[rbp], 0
	jne	.L154
	mov	rax, QWORD PTR 66696[rbp]
	mov	rdx, QWORD PTR 66712[rbp]
	lea	r8, .LC22[rip]
	mov	rcx, rax
	call	snprintf
	jmp	.L152
.L154:
	mov	DWORD PTR 65888[rbp], 800
	mov	DWORD PTR 65892[rbp], 100
	mov	DWORD PTR 65896[rbp], 100
	mov	DWORD PTR 65900[rbp], 100
	movabs	rax, 2338613357913204068
	mov	QWORD PTR 65776[rbp], rax
	movabs	rax, 28542640894207341
	mov	QWORD PTR 65784[rbp], rax
	lea	rdx, 65792[rbp]
	mov	eax, 0
	mov	ecx, 10
	mov	rdi, rdx
	rep stosq
	mov	rdx, rdi
	mov	DWORD PTR [rdx], eax
	add	rdx, 4
	lea	rax, 65776[rbp]
	mov	QWORD PTR 66608[rbp], rax
	lea	rax, 65888[rbp]
	mov	QWORD PTR 66600[rbp], rax
	mov	DWORD PTR 66808[rbp], 0
	call	TTF_Init
	cmp	eax, -1
	jne	.L155
	call	SDL_GetError
	mov	rdx, rax
	lea	rcx, .LC23[rip]
	call	printf
	mov	eax, 1
	jmp	.L147
.L155:
	mov	edx, 12
	lea	rcx, .LC24[rip]
	call	TTF_OpenFont
	mov	QWORD PTR 66592[rbp], rax
	cmp	QWORD PTR 66592[rbp], 0
	jne	.L156
	call	SDL_GetError
	mov	rdx, rax
	lea	rcx, .LC25[rip]
	call	printf
	mov	eax, 1
	jmp	.L147
.L156:
	mov	DWORD PTR 66588[rbp], 0
	mov	DWORD PTR 66812[rbp], 0
	mov	BYTE PTR 65772[rbp], 0
	mov	BYTE PTR 65773[rbp], 0
	mov	BYTE PTR 65774[rbp], 0
	mov	BYTE PTR 65775[rbp], -1
	mov	rax, QWORD PTR 66632[rbp]
	mov	r8d, 2
	mov	edx, -1
	mov	rcx, rax
	call	SDL_CreateRenderer
	mov	QWORD PTR 66576[rbp], rax
	cmp	QWORD PTR 66624[rbp], 0
	jne	.L157
	call	SDL_GetError
	mov	rdx, rax
	lea	rcx, .LC26[rip]
	call	printf
.L157:
	mov	ecx, 2
	call	IMG_Init
	mov	rax, QWORD PTR 66624[rbp]
	lea	rdx, .LC27[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66568[rbp], rax
	mov	rax, QWORD PTR 66624[rbp]
	lea	rdx, .LC28[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66560[rbp], rax
	mov	rax, QWORD PTR 66624[rbp]
	lea	rdx, .LC29[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66552[rbp], rax
	mov	rax, QWORD PTR 66624[rbp]
	lea	rdx, .LC30[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66544[rbp], rax
	mov	rax, QWORD PTR 66624[rbp]
	lea	rdx, .LC31[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66536[rbp], rax
	mov	rax, QWORD PTR 66624[rbp]
	lea	rdx, .LC32[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66528[rbp], rax
	mov	rax, QWORD PTR 66624[rbp]
	lea	rdx, .LC33[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66520[rbp], rax
	mov	rax, QWORD PTR 66624[rbp]
	lea	rdx, .LC34[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66512[rbp], rax
	mov	DWORD PTR 66508[rbp], 8
	mov	DWORD PTR 66504[rbp], 24
	mov	rax, QWORD PTR 66624[rbp]
	lea	rdx, .LC35[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66496[rbp], rax
	mov	DWORD PTR 66492[rbp], 1440
	mov	DWORD PTR 66800[rbp], 0
	mov	DWORD PTR 66796[rbp], 0
	mov	DWORD PTR 66488[rbp], 57
	mov	DWORD PTR 66484[rbp], 60
	lea	rax, .LC36[rip]
	mov	QWORD PTR 66472[rbp], rax
	lea	rax, .LC37[rip]
	mov	QWORD PTR 66464[rbp], rax
	lea	rax, .LC38[rip]
	mov	QWORD PTR 66456[rbp], rax
	lea	rax, .LC39[rip]
	mov	QWORD PTR 66448[rbp], rax
	mov	eax, DWORD PTR 66660[rbp]
	mov	ecx, eax
	call	sqr
	mov	DWORD PTR 66444[rbp], eax
	mov	DWORD PTR 66440[rbp], 256
	mov	DWORD PTR 66792[rbp], 0
	lea	rdx, .LC5[rip]
	lea	rcx, .LC8[rip]
	call	fopen
	mov	QWORD PTR 66432[rbp], rax
	mov	DWORD PTR 66788[rbp], 0
	jmp	.L158
.L159:
	mov	eax, DWORD PTR 66788[rbp]
	cdqe
	mov	BYTE PTR 224[rbp+rax], 0
	add	DWORD PTR 66788[rbp], 1
.L158:
	mov	eax, DWORD PTR 66444[rbp]
	imul	eax, DWORD PTR 66440[rbp]
	cmp	DWORD PTR 66788[rbp], eax
	jl	.L159
	mov	rdx, QWORD PTR 66432[rbp]
	lea	rax, 224[rbp]
	mov	r9, rdx
	mov	r8d, 1
	mov	edx, 65536
	mov	rcx, rax
	call	fread
	mov	rax, QWORD PTR 66432[rbp]
	mov	rcx, rax
	call	fclose
	mov	rax, QWORD PTR 66624[rbp]
	lea	rdx, .LC40[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66424[rbp], rax
	mov	rax, QWORD PTR 66624[rbp]
	lea	rdx, .LC41[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66416[rbp], rax
	lea	rax, 208[rbp]
	mov	ecx, DWORD PTR 66792[rbp]
	mov	rdx, rax
	call	level_get_name
	mov	edx, DWORD PTR 66792[rbp]
	mov	eax, edx
	sar	eax, 31
	shr	eax, 27
	add	edx, eax
	and	edx, 31
	sub	edx, eax
	mov	eax, edx
	mov	edx, 1
	mov	ecx, eax
	sal	edx, cl
	mov	ecx, edx
	mov	eax, DWORD PTR 66792[rbp]
	lea	edx, 31[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 5
	mov	edx, ecx
	cdqe
	mov	DWORD PTR 176[rbp+rax*4], edx
	mov	DWORD PTR 66412[rbp], 0
	mov	DWORD PTR 66408[rbp], 10
	mov	eax, 42
	mov	BYTE PTR 174[rbp], al
	mov	rax, QWORD PTR 66624[rbp]
	lea	rdx, .LC42[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66400[rbp], rax
	mov	BYTE PTR 66399[rbp], -128
	mov	eax, DWORD PTR 66652[rbp]
	imul	eax, DWORD PTR 66656[rbp]
	lea	edx, 0[0+rax*8]
	mov	eax, DWORD PTR 66684[rbp]
	add	eax, edx
	mov	DWORD PTR 144[rbp], eax
	mov	eax, DWORD PTR 66648[rbp]
	imul	eax, DWORD PTR 66656[rbp]
	lea	edx, 0[0+rax*8]
	mov	eax, DWORD PTR 66680[rbp]
	add	eax, edx
	mov	DWORD PTR 148[rbp], eax
	mov	BYTE PTR 160[rbp], 0
	mov	BYTE PTR 161[rbp], 0
	mov	BYTE PTR 162[rbp], 1
	mov	BYTE PTR 163[rbp], 12
	mov	BYTE PTR 164[rbp], 0
	mov	BYTE PTR 165[rbp], 2
	mov	BYTE PTR 166[rbp], 12
	mov	rax, QWORD PTR 66624[rbp]
	lea	rdx, .LC43[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66384[rbp], rax
	lea	rax, .LC44[rip]
	mov	QWORD PTR 66376[rbp], rax
	mov	rax, QWORD PTR 66376[rbp]
	lea	rdx, .LC5[rip]
	mov	rcx, rax
	call	SDL_RWFromFile
	mov	r10, rax
	lea	rcx, 104[rbp]
	lea	rdx, 112[rbp]
	lea	rax, 100[rbp]
	mov	QWORD PTR 32[rsp], rax
	mov	r9, rcx
	mov	r8, rdx
	mov	edx, 1
	mov	rcx, r10
	call	SDL_LoadWAV_RW
	test	rax, rax
	jne	.L160
	call	SDL_GetError
	mov	rdx, rax
	lea	rcx, .LC45[rip]
	call	printf
	jmp	.L161
.L160:
	mov	rax, QWORD PTR 104[rbp]
	mov	QWORD PTR 80[rbp], rax
	mov	eax, DWORD PTR 100[rbp]
	mov	DWORD PTR 88[rbp], eax
	mov	DWORD PTR 92[rbp], 0
	lea	rax, audioCallback[rip]
	mov	QWORD PTR 128[rbp], rax
	lea	rax, 80[rbp]
	mov	QWORD PTR 136[rbp], rax
	lea	rax, 112[rbp]
	mov	DWORD PTR 32[rsp], 0
	mov	r9d, 0
	mov	r8, rax
	mov	edx, 0
	mov	ecx, 0
	call	SDL_OpenAudioDevice
	mov	DWORD PTR 66372[rbp], eax
	cmp	DWORD PTR 66372[rbp], 0
	jne	.L162
	call	SDL_GetError
	mov	rdx, rax
	lea	rcx, .LC46[rip]
	call	printf
	mov	rax, QWORD PTR 104[rbp]
	mov	rcx, rax
	call	SDL_FreeWAV
	jmp	.L161
.L162:
	mov	ecx, DWORD PTR 100[rbp]
	mov	rdx, QWORD PTR 104[rbp]
	mov	eax, DWORD PTR 66372[rbp]
	mov	r8d, ecx
	mov	ecx, eax
	call	SDL_QueueAudio
	mov	eax, DWORD PTR 66372[rbp]
	mov	edx, 0
	mov	ecx, eax
	call	SDL_PauseAudioDevice
	mov	DWORD PTR 66784[rbp], 1
	mov	rax, QWORD PTR 66624[rbp]
	lea	rdx, .LC47[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66360[rbp], rax
	mov	rax, QWORD PTR 66624[rbp]
	lea	rdx, .LC48[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66352[rbp], rax
	mov	rax, QWORD PTR 66624[rbp]
	lea	rdx, .LC49[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66344[rbp], rax
	lea	rax, .LC50[rip]
	mov	QWORD PTR 66336[rbp], rax
	lea	rax, .LC51[rip]
	mov	QWORD PTR 66328[rbp], rax
	mov	rax, QWORD PTR 66336[rbp]
	mov	rcx, rax
	call	strlen
	mov	DWORD PTR 66324[rbp], eax
	mov	rax, QWORD PTR 66328[rbp]
	mov	rcx, rax
	call	strlen
	mov	DWORD PTR 66320[rbp], eax
	mov	DWORD PTR 66780[rbp], 1
	lea	rcx, .LC52[rip]
	call	puts
	jmp	.L163
.L210:
	mov	eax, DWORD PTR 65904[rbp]
	cmp	eax, 768
	je	.L165
	cmp	eax, 769
	je	.L166
	cmp	eax, 256
	jne	.L164
	mov	DWORD PTR 66780[rbp], 0
	jmp	.L164
.L165:
	mov	DWORD PTR 66316[rbp], 1
	mov	eax, DWORD PTR 65924[rbp]
	cmp	eax, 54
	je	.L167
	cmp	eax, 54
	jg	.L168
	cmp	eax, 49
	je	.L169
	cmp	eax, 49
	jg	.L170
	cmp	eax, 32
	je	.L171
	cmp	eax, 48
	je	.L172
	cmp	eax, 27
	je	.L173
	jmp	.L164
.L170:
	cmp	eax, 51
	je	.L175
	cmp	eax, 51
	jl	.L176
	cmp	eax, 52
	je	.L177
	cmp	eax, 53
	je	.L178
	jmp	.L164
.L168:
	cmp	eax, 1073741903
	je	.L179
	cmp	eax, 1073741903
	jg	.L180
	cmp	eax, 56
	je	.L181
	cmp	eax, 56
	jl	.L182
	cmp	eax, 57
	je	.L183
	cmp	eax, 1073741883
	je	.L184
	jmp	.L164
.L180:
	cmp	eax, 1073741905
	je	.L185
	cmp	eax, 1073741905
	jl	.L186
	cmp	eax, 1073741906
	je	.L187
	cmp	eax, 1073741912
	je	.L188
	jmp	.L164
.L173:
	mov	DWORD PTR 66780[rbp], 0
	jmp	.L174
.L179:
	mov	eax, DWORD PTR 66316[rbp]
	mov	DWORD PTR glob_vk_right[rip], eax
	jmp	.L174
.L186:
	mov	eax, DWORD PTR 66316[rbp]
	mov	DWORD PTR glob_vk_left[rip], eax
	jmp	.L174
.L187:
	mov	eax, DWORD PTR 66316[rbp]
	mov	DWORD PTR glob_vk_up[rip], eax
	jmp	.L174
.L185:
	mov	eax, DWORD PTR 66316[rbp]
	mov	DWORD PTR glob_vk_down[rip], eax
	jmp	.L174
.L171:
	mov	eax, DWORD PTR 66316[rbp]
	mov	DWORD PTR glob_vk_space[rip], eax
	jmp	.L174
.L188:
	mov	eax, DWORD PTR 66316[rbp]
	mov	DWORD PTR glob_vk_enter[rip], eax
	jmp	.L174
.L184:
	mov	eax, DWORD PTR 66316[rbp]
	mov	DWORD PTR glob_vk_f2[rip], eax
	jmp	.L174
.L172:
	mov	eax, DWORD PTR 66316[rbp]
	mov	DWORD PTR glob_vk_0[rip], eax
	jmp	.L174
.L169:
	mov	eax, DWORD PTR 66316[rbp]
	mov	DWORD PTR glob_vk_1[rip], eax
	jmp	.L174
.L176:
	mov	eax, DWORD PTR 66316[rbp]
	mov	DWORD PTR glob_vk_2[rip], eax
	jmp	.L174
.L175:
	mov	eax, DWORD PTR 66316[rbp]
	mov	DWORD PTR glob_vk_3[rip], eax
	jmp	.L174
.L177:
	mov	eax, DWORD PTR 66316[rbp]
	mov	DWORD PTR glob_vk_4[rip], eax
	jmp	.L174
.L178:
	mov	eax, DWORD PTR 66316[rbp]
	mov	DWORD PTR glob_vk_5[rip], eax
	jmp	.L174
.L167:
	mov	eax, DWORD PTR 66316[rbp]
	mov	DWORD PTR glob_vk_6[rip], eax
	jmp	.L174
.L182:
	mov	eax, DWORD PTR 66316[rbp]
	mov	DWORD PTR glob_vk_7[rip], eax
	jmp	.L174
.L181:
	mov	eax, DWORD PTR 66316[rbp]
	mov	DWORD PTR glob_vk_8[rip], eax
	jmp	.L174
.L183:
	mov	eax, DWORD PTR 66316[rbp]
	mov	DWORD PTR glob_vk_9[rip], eax
	nop
.L174:
	jmp	.L164
.L166:
	mov	DWORD PTR 66312[rbp], 0
	mov	eax, DWORD PTR 65924[rbp]
	cmp	eax, 55
	je	.L189
	cmp	eax, 55
	jg	.L190
	cmp	eax, 50
	je	.L191
	cmp	eax, 50
	jg	.L192
	cmp	eax, 48
	je	.L193
	cmp	eax, 48
	jg	.L194
	cmp	eax, 32
	je	.L195
	jmp	.L286
.L192:
	cmp	eax, 52
	je	.L197
	cmp	eax, 52
	jl	.L198
	cmp	eax, 53
	je	.L199
	cmp	eax, 54
	je	.L200
	jmp	.L286
.L190:
	cmp	eax, 1073741903
	je	.L201
	cmp	eax, 1073741903
	jg	.L202
	cmp	eax, 57
	je	.L203
	cmp	eax, 57
	jl	.L204
	cmp	eax, 1073741883
	je	.L205
	jmp	.L286
.L202:
	cmp	eax, 1073741905
	je	.L206
	cmp	eax, 1073741905
	jl	.L207
	cmp	eax, 1073741906
	je	.L208
	cmp	eax, 1073741912
	je	.L209
	jmp	.L286
.L201:
	mov	eax, DWORD PTR 66312[rbp]
	mov	DWORD PTR glob_vk_right[rip], eax
	jmp	.L196
.L207:
	mov	eax, DWORD PTR 66312[rbp]
	mov	DWORD PTR glob_vk_left[rip], eax
	jmp	.L196
.L208:
	mov	eax, DWORD PTR 66312[rbp]
	mov	DWORD PTR glob_vk_up[rip], eax
	jmp	.L196
.L206:
	mov	eax, DWORD PTR 66312[rbp]
	mov	DWORD PTR glob_vk_down[rip], eax
	jmp	.L196
.L195:
	mov	eax, DWORD PTR 66312[rbp]
	mov	DWORD PTR glob_vk_space[rip], eax
	jmp	.L196
.L209:
	mov	eax, DWORD PTR 66312[rbp]
	mov	DWORD PTR glob_vk_enter[rip], eax
	jmp	.L196
.L205:
	mov	eax, DWORD PTR 66312[rbp]
	mov	DWORD PTR glob_vk_f2[rip], eax
	jmp	.L196
.L193:
	mov	eax, DWORD PTR 66312[rbp]
	mov	DWORD PTR glob_vk_0[rip], eax
	jmp	.L196
.L194:
	mov	eax, DWORD PTR 66312[rbp]
	mov	DWORD PTR glob_vk_1[rip], eax
	jmp	.L196
.L191:
	mov	eax, DWORD PTR 66312[rbp]
	mov	DWORD PTR glob_vk_2[rip], eax
	jmp	.L196
.L198:
	mov	eax, DWORD PTR 66312[rbp]
	mov	DWORD PTR glob_vk_3[rip], eax
	jmp	.L196
.L197:
	mov	eax, DWORD PTR 66312[rbp]
	mov	DWORD PTR glob_vk_4[rip], eax
	jmp	.L196
.L199:
	mov	eax, DWORD PTR 66312[rbp]
	mov	DWORD PTR glob_vk_5[rip], eax
	jmp	.L196
.L200:
	mov	eax, DWORD PTR 66312[rbp]
	mov	DWORD PTR glob_vk_6[rip], eax
	jmp	.L196
.L189:
	mov	eax, DWORD PTR 66312[rbp]
	mov	DWORD PTR glob_vk_7[rip], eax
	jmp	.L196
.L204:
	mov	eax, DWORD PTR 66312[rbp]
	mov	DWORD PTR glob_vk_8[rip], eax
	jmp	.L196
.L203:
	mov	eax, DWORD PTR 66312[rbp]
	mov	DWORD PTR glob_vk_9[rip], eax
	nop
.L196:
.L286:
	nop
.L164:
	lea	rax, 65904[rbp]
	mov	rcx, rax
	call	SDL_PollEvent
	test	eax, eax
	jne	.L210
	mov	eax, DWORD PTR glob_vk_f2[rip]
	test	eax, eax
	je	.L211
	lea	rcx, .LC53[rip]
	call	puts
	call	dev_tiled_to_leveldata
	lea	rcx, .LC54[rip]
	call	puts
.L211:
	mov	eax, DWORD PTR glob_vk_0[rip]
	test	eax, eax
	je	.L212
	mov	DWORD PTR glob_vk_0[rip], 0
	mov	eax, DWORD PTR waterOn[rip]
	test	eax, eax
	jne	.L213
	mov	DWORD PTR waterOn[rip], 1
	call	activateAllWaterParticles
	jmp	.L212
.L213:
	mov	DWORD PTR waterOn[rip], 0
	call	deactivateAllWaterParticles
.L212:
	mov	eax, DWORD PTR glob_vk_9[rip]
	test	eax, eax
	je	.L214
	mov	DWORD PTR glob_vk_9[rip], 0
	cmp	DWORD PTR 66808[rbp], 0
	jne	.L215
	mov	DWORD PTR 66808[rbp], 1
	lea	rax, 65776[rbp]
	movabs	rdi, 3184362091757007472
	mov	QWORD PTR [rax], rdi
	mov	DWORD PTR 8[rax], 741551154
	mov	WORD PTR 12[rax], 52
	jmp	.L214
.L215:
	mov	DWORD PTR 66808[rbp], 0
.L214:
	mov	eax, DWORD PTR glob_vk_1[rip]
	test	eax, eax
	je	.L216
	mov	DWORD PTR glob_vk_1[rip], 0
	cmp	DWORD PTR 66808[rbp], 1
	jne	.L216
	lea	rax, .LC55[rip]
	mov	QWORD PTR 66304[rbp], rax
	mov	QWORD PTR 66296[rbp], 99
	mov	rcx, QWORD PTR 66296[rbp]
	mov	rdx, QWORD PTR 66304[rbp]
	lea	rax, 65776[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	strncpy
	lea	rax, 65776[rbp]
	mov	rdx, QWORD PTR 66296[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	add	DWORD PTR 66812[rbp], 50
.L216:
	mov	eax, DWORD PTR glob_vk_2[rip]
	test	eax, eax
	je	.L217
	mov	DWORD PTR glob_vk_2[rip], 0
	cmp	DWORD PTR 66808[rbp], 1
	jne	.L217
	lea	rax, .LC56[rip]
	mov	QWORD PTR 66288[rbp], rax
	mov	QWORD PTR 66280[rbp], 99
	mov	rcx, QWORD PTR 66280[rbp]
	mov	rdx, QWORD PTR 66288[rbp]
	lea	rax, 65776[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	strncpy
	lea	rax, 65776[rbp]
	mov	rdx, QWORD PTR 66280[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	add	DWORD PTR 66812[rbp], 50
.L217:
	mov	eax, DWORD PTR glob_vk_3[rip]
	test	eax, eax
	je	.L218
	mov	DWORD PTR glob_vk_3[rip], 0
	cmp	DWORD PTR 66808[rbp], 1
	jne	.L218
	lea	rax, .LC57[rip]
	mov	QWORD PTR 66272[rbp], rax
	mov	QWORD PTR 66264[rbp], 99
	mov	rcx, QWORD PTR 66264[rbp]
	mov	rdx, QWORD PTR 66272[rbp]
	lea	rax, 65776[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	strncpy
	lea	rax, 65776[rbp]
	mov	rdx, QWORD PTR 66264[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	add	DWORD PTR 66812[rbp], 50
.L218:
	mov	eax, DWORD PTR glob_vk_4[rip]
	test	eax, eax
	je	.L219
	mov	DWORD PTR glob_vk_4[rip], 0
	cmp	DWORD PTR 66808[rbp], 1
	jne	.L219
	lea	rax, .LC58[rip]
	mov	QWORD PTR 66256[rbp], rax
	mov	QWORD PTR 66248[rbp], 99
	mov	rcx, QWORD PTR 66248[rbp]
	mov	rdx, QWORD PTR 66256[rbp]
	lea	rax, 65776[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	strncpy
	lea	rax, 65776[rbp]
	mov	rdx, QWORD PTR 66248[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	add	DWORD PTR 66812[rbp], 50
.L219:
	mov	eax, DWORD PTR glob_vk_5[rip]
	test	eax, eax
	je	.L220
	mov	DWORD PTR glob_vk_5[rip], 0
	mov	ecx, 10
	call	damageMe
.L220:
	mov	eax, DWORD PTR glob_vk_6[rip]
	test	eax, eax
	je	.L221
	mov	DWORD PTR glob_vk_6[rip], 0
	mov	ecx, 10
	call	healMe
.L221:
	mov	eax, DWORD PTR glob_vk_right[rip]
	test	eax, eax
	je	.L222
	mov	BYTE PTR 160[rbp], 0
	mov	edx, DWORD PTR 144[rbp]
	movzx	eax, BYTE PTR 166[rbp]
	movzx	eax, al
	add	eax, edx
	mov	DWORD PTR 144[rbp], eax
.L222:
	mov	eax, DWORD PTR glob_vk_up[rip]
	test	eax, eax
	je	.L223
	mov	BYTE PTR 160[rbp], 1
	mov	edx, DWORD PTR 148[rbp]
	movzx	eax, BYTE PTR 166[rbp]
	movzx	eax, al
	sub	edx, eax
	mov	eax, edx
	mov	DWORD PTR 148[rbp], eax
.L223:
	mov	eax, DWORD PTR glob_vk_left[rip]
	test	eax, eax
	je	.L224
	mov	BYTE PTR 160[rbp], 2
	mov	edx, DWORD PTR 144[rbp]
	movzx	eax, BYTE PTR 166[rbp]
	movzx	eax, al
	sub	edx, eax
	mov	eax, edx
	mov	DWORD PTR 144[rbp], eax
.L224:
	mov	eax, DWORD PTR glob_vk_down[rip]
	test	eax, eax
	je	.L225
	mov	BYTE PTR 160[rbp], 3
	mov	edx, DWORD PTR 148[rbp]
	movzx	eax, BYTE PTR 166[rbp]
	movzx	eax, al
	add	eax, edx
	mov	DWORD PTR 148[rbp], eax
.L225:
	mov	edx, DWORD PTR glob_vk_right[rip]
	mov	eax, DWORD PTR glob_vk_left[rip]
	or	edx, eax
	mov	eax, DWORD PTR glob_vk_up[rip]
	or	edx, eax
	mov	eax, DWORD PTR glob_vk_down[rip]
	or	eax, edx
	test	eax, eax
	je	.L226
	movzx	edx, BYTE PTR 161[rbp]
	movzx	eax, BYTE PTR 162[rbp]
	add	eax, edx
	mov	BYTE PTR 161[rbp], al
	movzx	eax, BYTE PTR 164[rbp]
	movzx	ecx, BYTE PTR 161[rbp]
	movzx	edx, BYTE PTR 163[rbp]
	cmp	cl, dl
	setnb	dl
	add	eax, edx
	mov	BYTE PTR 164[rbp], al
	movzx	eax, BYTE PTR 161[rbp]
	movzx	edx, BYTE PTR 163[rbp]
	movzx	eax, al
	div	dl
	movzx	eax, ah
	mov	BYTE PTR 161[rbp], al
	movzx	eax, BYTE PTR 164[rbp]
	movzx	edx, BYTE PTR 165[rbp]
	movzx	eax, al
	div	dl
	movzx	eax, ah
	mov	BYTE PTR 164[rbp], al
	mov	eax, DWORD PTR 66656[rbp]
	imul	eax, DWORD PTR 66652[rbp]
	mov	edx, DWORD PTR 66668[rbp]
	sub	edx, eax
	mov	eax, edx
	mov	DWORD PTR 66244[rbp], eax
	mov	eax, DWORD PTR 66680[rbp]
	mov	DWORD PTR 66240[rbp], eax
	mov	eax, DWORD PTR 66684[rbp]
	mov	DWORD PTR 66236[rbp], eax
	mov	eax, DWORD PTR 66656[rbp]
	imul	eax, DWORD PTR 66648[rbp]
	mov	edx, DWORD PTR 66664[rbp]
	sub	edx, eax
	mov	eax, edx
	mov	DWORD PTR 66232[rbp], eax
	mov	DWORD PTR 66228[rbp], 0
	mov	eax, DWORD PTR 144[rbp]
	cmp	DWORD PTR 66244[rbp], eax
	jl	.L227
	mov	eax, DWORD PTR 148[rbp]
	cmp	DWORD PTR 66232[rbp], eax
	jl	.L227
	mov	eax, DWORD PTR 144[rbp]
	cmp	DWORD PTR 66236[rbp], eax
	jg	.L227
	mov	eax, DWORD PTR 148[rbp]
	cmp	DWORD PTR 66240[rbp], eax
	jle	.L228
.L227:
	mov	eax, 1
	jmp	.L229
.L228:
	mov	eax, 0
.L229:
	mov	DWORD PTR 66228[rbp], eax
	mov	eax, DWORD PTR 144[rbp]
	cmp	DWORD PTR 66244[rbp], eax
	jge	.L230
	mov	eax, DWORD PTR 66236[rbp]
	mov	DWORD PTR 144[rbp], eax
	add	DWORD PTR 66792[rbp], 1
.L230:
	mov	eax, DWORD PTR 148[rbp]
	cmp	DWORD PTR 66240[rbp], eax
	jle	.L231
	mov	eax, DWORD PTR 66232[rbp]
	mov	DWORD PTR 148[rbp], eax
	cvtsi2sd	xmm0, DWORD PTR 66440[rbp]
	call	sqrt
	cvttsd2si	eax, xmm0
	sub	DWORD PTR 66792[rbp], eax
.L231:
	mov	eax, DWORD PTR 144[rbp]
	cmp	DWORD PTR 66236[rbp], eax
	jle	.L232
	mov	eax, DWORD PTR 66244[rbp]
	mov	DWORD PTR 144[rbp], eax
	sub	DWORD PTR 66792[rbp], 1
.L232:
	mov	eax, DWORD PTR 148[rbp]
	cmp	DWORD PTR 66232[rbp], eax
	jge	.L233
	mov	eax, DWORD PTR 66240[rbp]
	mov	DWORD PTR 148[rbp], eax
	cvtsi2sd	xmm0, DWORD PTR 66440[rbp]
	call	sqrt
	cvttsd2si	eax, xmm0
	add	DWORD PTR 66792[rbp], eax
.L233:
	cmp	DWORD PTR 66228[rbp], 0
	je	.L235
	mov	eax, DWORD PTR 66440[rbp]
	add	DWORD PTR 66792[rbp], eax
	mov	eax, DWORD PTR 66792[rbp]
	cdq
	idiv	DWORD PTR 66440[rbp]
	mov	DWORD PTR 66792[rbp], edx
	lea	rax, 208[rbp]
	mov	ecx, DWORD PTR 66792[rbp]
	mov	rdx, rax
	call	level_get_name
	mov	eax, DWORD PTR 66792[rbp]
	lea	edx, 31[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 5
	mov	r9d, eax
	movsx	rax, r9d
	mov	r8d, DWORD PTR 176[rbp+rax*4]
	mov	edx, DWORD PTR 66792[rbp]
	mov	eax, edx
	sar	eax, 31
	shr	eax, 27
	add	edx, eax
	and	edx, 31
	sub	edx, eax
	mov	eax, edx
	mov	edx, 1
	mov	ecx, eax
	sal	edx, cl
	mov	eax, edx
	mov	edx, r8d
	or	edx, eax
	movsx	rax, r9d
	mov	DWORD PTR 176[rbp+rax*4], edx
	jmp	.L235
.L226:
	mov	BYTE PTR 161[rbp], 0
	mov	BYTE PTR 164[rbp], 0
.L235:
	mov	edx, DWORD PTR glob_vk_space[rip]
	mov	eax, DWORD PTR glob_vk_enter[rip]
	or	eax, edx
	test	eax, eax
	je	.L236
	mov	DWORD PTR 66784[rbp], 0
.L236:
	mov	eax, DWORD PTR 144[rbp]
	mov	DWORD PTR 152[rbp], eax
	mov	eax, DWORD PTR 148[rbp]
	mov	DWORD PTR 156[rbp], eax
	mov	DWORD PTR 66776[rbp], 0
	jmp	.L237
.L241:
	lea	rax, waterParticles[rip]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR 66776[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	mov	eax, DWORD PTR 12[rax]
	test	eax, eax
	je	.L238
	lea	rax, waterParticles[rip]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR 66776[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	movss	xmm1, DWORD PTR 4[rax]
	lea	rax, waterParticles[rip]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR 66776[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	movss	xmm0, DWORD PTR 8[rax]
	lea	rax, waterParticles[rip]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR 66776[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	addss	xmm0, xmm1
	movss	DWORD PTR 4[rax], xmm0
	lea	rax, waterParticles[rip]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR 66776[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	movss	xmm0, DWORD PTR 4[rax]
	cvtsi2ss	xmm1, DWORD PTR 66688[rbp]
	comiss	xmm0, xmm1
	jbe	.L238
	call	rand
	mov	ecx, eax
	mov	edx, 1374389535
	mov	eax, ecx
	imul	edx
	sar	edx, 5
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	imul	eax, eax, 100
	sub	ecx, eax
	mov	eax, ecx
	cmp	eax, 4
	jg	.L240
	lea	rax, waterParticles[rip]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR 66776[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	mov	DWORD PTR 12[rax], 0
	jmp	.L238
.L240:
	mov	ecx, DWORD PTR 66688[rbp]
	mov	edx, DWORD PTR 66692[rbp]
	mov	eax, DWORD PTR 66776[rbp]
	mov	r8d, ecx
	mov	ecx, eax
	call	createWaterParticle
.L238:
	add	DWORD PTR 66776[rbp], 1
.L237:
	mov	eax, 100
	cmp	DWORD PTR 66776[rbp], eax
	jl	.L241
	mov	eax, DWORD PTR 66484[rbp]
	add	DWORD PTR 66796[rbp], eax
	mov	eax, DWORD PTR 66796[rbp]
	cmp	eax, DWORD PTR 66488[rbp]
	setge	al
	movzx	eax, al
	add	DWORD PTR 66800[rbp], eax
	mov	eax, DWORD PTR 66800[rbp]
	cdq
	idiv	DWORD PTR 66492[rbp]
	mov	DWORD PTR 66800[rbp], edx
	mov	eax, DWORD PTR 66796[rbp]
	cdq
	idiv	DWORD PTR 66488[rbp]
	mov	DWORD PTR 66796[rbp], edx
	lea	rdx, 171[rbp]
	lea	rax, 68[rbp]
	mov	rcx, rax
	call	strcpy
	cmp	DWORD PTR 66408[rbp], 0
	js	.L242
	mov	eax, 43
	jmp	.L243
.L242:
	mov	eax, 45
.L243:
	mov	BYTE PTR 68[rbp], al
	mov	ecx, DWORD PTR 66408[rbp]
	mov	edx, 1717986919
	mov	eax, ecx
	imul	edx
	sar	edx, 2
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	add	eax, 48
	mov	BYTE PTR 69[rbp], al
	mov	ecx, DWORD PTR 66408[rbp]
	mov	edx, 1717986919
	mov	eax, ecx
	imul	edx
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
	mov	BYTE PTR 70[rbp], al
	mov	eax, 42
	mov	BYTE PTR 71[rbp], al
	cmp	DWORD PTR 66412[rbp], 0
	jne	.L244
	mov	eax, 67
	jmp	.L245
.L244:
	mov	eax, 70
.L245:
	mov	BYTE PTR 72[rbp], al
	mov	edx, 0
	mov	rax, QWORD PTR 66624[rbp]
	mov	rcx, rax
	call	draw_clear
	mov	edx, 16777215
	mov	rax, QWORD PTR 66624[rbp]
	mov	rcx, rax
	call	draw_set_color
	mov	edx, 33023
	mov	ecx, DWORD PTR 66684[rbp]
	mov	rax, QWORD PTR 66624[rbp]
	mov	DWORD PTR 40[rsp], edx
	mov	edx, DWORD PTR 66688[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, ecx
	mov	r8d, 0
	mov	edx, 0
	mov	rcx, rax
	call	draw_rectangle_color
	mov	ecx, DWORD PTR 66684[rbp]
	mov	rax, QWORD PTR 66624[rbp]
	mov	rdx, QWORD PTR 66528[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	edx, DWORD PTR 66688[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, ecx
	mov	r8d, 0
	mov	edx, 0
	mov	rcx, rax
	call	draw_image
	mov	r8d, 8388863
	mov	eax, DWORD PTR 66692[rbp]
	sub	eax, DWORD PTR 66684[rbp]
	mov	ecx, eax
	mov	edx, DWORD PTR 66684[rbp]
	mov	rax, QWORD PTR 66624[rbp]
	mov	DWORD PTR 40[rsp], r8d
	mov	r8d, DWORD PTR 66688[rbp]
	mov	DWORD PTR 32[rsp], r8d
	mov	r9d, ecx
	mov	r8d, 0
	mov	rcx, rax
	call	draw_rectangle_color
	mov	edx, 33023
	mov	eax, DWORD PTR 66692[rbp]
	sub	eax, DWORD PTR 66684[rbp]
	mov	r8d, DWORD PTR 66692[rbp]
	mov	rcx, QWORD PTR 66624[rbp]
	mov	DWORD PTR 40[rsp], edx
	mov	edx, DWORD PTR 66688[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, r8d
	mov	r8d, 0
	mov	edx, eax
	call	draw_rectangle_color
	mov	eax, DWORD PTR 66692[rbp]
	sub	eax, DWORD PTR 66684[rbp]
	mov	r8d, DWORD PTR 66692[rbp]
	mov	rcx, QWORD PTR 66624[rbp]
	mov	rdx, QWORD PTR 66528[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	edx, DWORD PTR 66688[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, r8d
	mov	r8d, 0
	mov	edx, eax
	call	draw_image
	mov	DWORD PTR 66224[rbp], 0
	mov	eax, DWORD PTR 66652[rbp]
	mov	DWORD PTR 66220[rbp], eax
	mov	eax, DWORD PTR 66648[rbp]
	mov	DWORD PTR 66216[rbp], eax
	cmp	DWORD PTR 66784[rbp], 0
	jne	.L246
	mov	eax, DWORD PTR 66504[rbp]
	imul	eax, DWORD PTR 66648[rbp]
	mov	edx, DWORD PTR 66508[rbp]
	imul	edx, DWORD PTR 66652[rbp]
	mov	r8d, edx
	mov	r10d, DWORD PTR 66216[rbp]
	mov	edx, DWORD PTR 66220[rbp]
	mov	rcx, QWORD PTR 66624[rbp]
	mov	r9d, DWORD PTR 66224[rbp]
	mov	DWORD PTR 72[rsp], r9d
	mov	r9d, DWORD PTR 66504[rbp]
	mov	DWORD PTR 64[rsp], r9d
	mov	r9d, DWORD PTR 66508[rbp]
	mov	DWORD PTR 56[rsp], r9d
	lea	r9, .LC59[rip]
	mov	QWORD PTR 48[rsp], r9
	mov	r9, QWORD PTR 66512[rbp]
	mov	QWORD PTR 40[rsp], r9
	mov	DWORD PTR 32[rsp], eax
	mov	r9d, r8d
	mov	r8d, r10d
	call	draw_text_color
	mov	eax, DWORD PTR 66504[rbp]
	imul	eax, DWORD PTR 66648[rbp]
	add	DWORD PTR 66216[rbp], eax
	mov	DWORD PTR 66212[rbp], 200
	mov	DWORD PTR 66208[rbp], 20
	mov	eax, DWORD PTR health[rip]
	imul	eax, DWORD PTR 66212[rbp]
	mov	esi, DWORD PTR maxHealth[rip]
	cdq
	idiv	esi
	mov	DWORD PTR 66204[rbp], eax
	mov	DWORD PTR 66200[rbp], 255
	mov	r9d, 0
	mov	edx, DWORD PTR 66216[rbp]
	mov	eax, DWORD PTR 66208[rbp]
	add	edx, eax
	mov	r8d, DWORD PTR 66212[rbp]
	mov	ecx, DWORD PTR 66216[rbp]
	mov	rax, QWORD PTR 66624[rbp]
	mov	DWORD PTR 40[rsp], r9d
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, r8d
	mov	r8d, ecx
	mov	edx, 0
	mov	rcx, rax
	call	draw_rectangle_color
	mov	edx, DWORD PTR 66216[rbp]
	mov	eax, DWORD PTR 66208[rbp]
	add	edx, eax
	mov	r9d, DWORD PTR 66204[rbp]
	mov	r8d, DWORD PTR 66216[rbp]
	mov	rax, QWORD PTR 66624[rbp]
	mov	ecx, DWORD PTR 66200[rbp]
	mov	DWORD PTR 40[rsp], ecx
	mov	DWORD PTR 32[rsp], edx
	mov	edx, 0
	mov	rcx, rax
	call	draw_rectangle_color
	mov	eax, DWORD PTR 66208[rbp]
	add	DWORD PTR 66216[rbp], eax
	mov	DWORD PTR 66772[rbp], 0
	mov	DWORD PTR 66196[rbp], 32
	mov	DWORD PTR 66768[rbp], 0
	jmp	.L247
.L248:
	mov	eax, DWORD PTR 66768[rbp]
	imul	eax, DWORD PTR 66196[rbp]
	mov	ecx, DWORD PTR 66216[rbp]
	mov	edx, DWORD PTR 66772[rbp]
	add	ecx, edx
	mov	edx, DWORD PTR 66196[rbp]
	imul	edx, DWORD PTR 66648[rbp]
	lea	r8d, [rcx+rdx]
	mov	edx, DWORD PTR 66196[rbp]
	imul	edx, DWORD PTR 66652[rbp]
	mov	ecx, DWORD PTR 66220[rbp]
	lea	r11d, [rdx+rcx]
	mov	ecx, DWORD PTR 66216[rbp]
	mov	edx, DWORD PTR 66772[rbp]
	lea	r10d, [rcx+rdx]
	mov	edx, DWORD PTR 66220[rbp]
	mov	rcx, QWORD PTR 66624[rbp]
	mov	r9d, DWORD PTR 66196[rbp]
	mov	DWORD PTR 72[rsp], r9d
	mov	r9d, DWORD PTR 66196[rbp]
	mov	DWORD PTR 64[rsp], r9d
	mov	DWORD PTR 56[rsp], 0
	mov	DWORD PTR 48[rsp], eax
	mov	rax, QWORD PTR 66384[rbp]
	mov	QWORD PTR 40[rsp], rax
	mov	DWORD PTR 32[rsp], r8d
	mov	r9d, r11d
	mov	r8d, r10d
	call	draw_image_part
	mov	eax, DWORD PTR 66768[rbp]
	lea	rdx, .LC63[rip]
	mov	QWORD PTR 32[rsp], rdx
	lea	r9, .LC60[rip]
	lea	r8, .LC61[rip]
	lea	rdx, .LC62[rip]
	mov	ecx, eax
	call	mux_str
	mov	r11, rax
	mov	eax, DWORD PTR 66504[rbp]
	imul	eax, DWORD PTR 66648[rbp]
	mov	edx, eax
	mov	eax, DWORD PTR 66508[rbp]
	imul	eax, DWORD PTR 66652[rbp]
	mov	r8d, eax
	mov	ecx, DWORD PTR 66216[rbp]
	mov	eax, DWORD PTR 66772[rbp]
	add	ecx, eax
	mov	eax, DWORD PTR 66196[rbp]
	mov	r9d, eax
	shr	r9d, 31
	add	eax, r9d
	sar	eax
	lea	r10d, [rcx+rax]
	mov	eax, DWORD PTR 66196[rbp]
	imul	eax, DWORD PTR 66652[rbp]
	mov	ecx, DWORD PTR 66220[rbp]
	add	ecx, eax
	mov	rax, QWORD PTR 66624[rbp]
	mov	r9d, DWORD PTR 66224[rbp]
	mov	DWORD PTR 72[rsp], r9d
	mov	r9d, DWORD PTR 66504[rbp]
	mov	DWORD PTR 64[rsp], r9d
	mov	r9d, DWORD PTR 66508[rbp]
	mov	DWORD PTR 56[rsp], r9d
	mov	QWORD PTR 48[rsp], r11
	mov	r9, QWORD PTR 66512[rbp]
	mov	QWORD PTR 40[rsp], r9
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, r8d
	mov	r8d, r10d
	mov	edx, ecx
	mov	rcx, rax
	call	draw_text_color
	mov	eax, DWORD PTR 66196[rbp]
	imul	eax, DWORD PTR 66652[rbp]
	add	DWORD PTR 66772[rbp], eax
	add	DWORD PTR 66768[rbp], 1
.L247:
	cmp	DWORD PTR 66768[rbp], 3
	jle	.L248
.L246:
	mov	edx, DWORD PTR 66652[rbp]
	mov	eax, DWORD PTR 66668[rbp]
	add	eax, edx
	mov	DWORD PTR 66220[rbp], eax
	mov	eax, DWORD PTR 66648[rbp]
	mov	DWORD PTR 66216[rbp], eax
	cmp	DWORD PTR 66784[rbp], 0
	jne	.L249
	mov	rax, rsp
	mov	r15, rax
	lea	rax, .LC64[rip]
	mov	QWORD PTR 66184[rbp], rax
	mov	rax, QWORD PTR 66184[rbp]
	mov	rcx, rax
	call	strlen
	mov	rdx, rax
	sub	rdx, 1
	mov	QWORD PTR 66176[rbp], rdx
	mov	r13, rax
	mov	r14d, 0
	mov	QWORD PTR -48[rbp], rax
	mov	QWORD PTR -40[rbp], 0
	add	rax, 15
	shr	rax, 4
	sal	rax, 4
	call	___chkstk_ms
	sub	rsp, rax
	lea	rax, 80[rsp]
	add	rax, 0
	mov	QWORD PTR 66168[rbp], rax
	mov	rax, QWORD PTR 66168[rbp]
	mov	rdx, QWORD PTR 66184[rbp]
	mov	rcx, rax
	call	strcpy
	mov	eax, DWORD PTR 66792[rbp]
	mov	BYTE PTR 66167[rbp], al
	movzx	eax, BYTE PTR 66167[rbp]
	movzx	edx, al
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	add	eax, edx
	shr	ax, 8
	mov	ecx, eax
	shr	cl, 4
	movzx	edx, cl
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	add	eax, edx
	lea	edx, 0[0+rax*4]
	add	eax, edx
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
	mov	rax, QWORD PTR 66168[rbp]
	mov	rdx, rax
	lea	rcx, .LC65[rip]
	call	string_pos
	mov	ecx, ebx
	mov	rdx, QWORD PTR 66168[rbp]
	cdqe
	mov	BYTE PTR [rdx+rax], cl
	movzx	eax, BYTE PTR 66167[rbp]
	movzx	edx, al
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	add	eax, edx
	lea	edx, 0[0+rax*4]
	add	eax, edx
	shr	ax, 8
	mov	ecx, eax
	shr	cl, 3
	movzx	edx, cl
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	add	eax, edx
	lea	edx, 0[0+rax*4]
	add	eax, edx
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
	mov	rax, QWORD PTR 66168[rbp]
	mov	rdx, rax
	lea	rcx, .LC66[rip]
	call	string_pos
	mov	ecx, ebx
	mov	rdx, QWORD PTR 66168[rbp]
	cdqe
	mov	BYTE PTR [rdx+rax], cl
	movzx	ecx, BYTE PTR 66167[rbp]
	movzx	edx, cl
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	add	eax, edx
	lea	edx, 0[0+rax*4]
	add	eax, edx
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
	mov	rax, QWORD PTR 66168[rbp]
	mov	rdx, rax
	lea	rcx, .LC67[rip]
	call	string_pos
	mov	ecx, ebx
	mov	rdx, QWORD PTR 66168[rbp]
	cdqe
	mov	BYTE PTR [rdx+rax], cl
	mov	r9, QWORD PTR 66168[rbp]
	mov	eax, DWORD PTR 66504[rbp]
	imul	eax, DWORD PTR 66648[rbp]
	mov	edx, DWORD PTR 66508[rbp]
	imul	edx, DWORD PTR 66652[rbp]
	mov	r8d, edx
	mov	r11d, DWORD PTR 66216[rbp]
	mov	edx, DWORD PTR 66220[rbp]
	mov	rcx, QWORD PTR 66624[rbp]
	mov	r10d, DWORD PTR 66224[rbp]
	mov	DWORD PTR 72[rsp], r10d
	mov	r10d, DWORD PTR 66504[rbp]
	mov	DWORD PTR 64[rsp], r10d
	mov	r10d, DWORD PTR 66508[rbp]
	mov	DWORD PTR 56[rsp], r10d
	mov	QWORD PTR 48[rsp], r9
	mov	r9, QWORD PTR 66512[rbp]
	mov	QWORD PTR 40[rsp], r9
	mov	DWORD PTR 32[rsp], eax
	mov	r9d, r8d
	mov	r8d, r11d
	call	draw_text_color
	mov	eax, DWORD PTR 66504[rbp]
	imul	eax, DWORD PTR 66648[rbp]
	mov	edx, DWORD PTR 66508[rbp]
	imul	edx, DWORD PTR 66652[rbp]
	mov	r8d, edx
	mov	edx, DWORD PTR 66504[rbp]
	imul	edx, DWORD PTR 66648[rbp]
	mov	ecx, DWORD PTR 66216[rbp]
	lea	r11d, [rdx+rcx]
	mov	r10d, DWORD PTR 66220[rbp]
	mov	rcx, QWORD PTR 66624[rbp]
	mov	edx, DWORD PTR 66224[rbp]
	mov	DWORD PTR 72[rsp], edx
	mov	edx, DWORD PTR 66504[rbp]
	mov	DWORD PTR 64[rsp], edx
	mov	edx, DWORD PTR 66508[rbp]
	mov	DWORD PTR 56[rsp], edx
	lea	rdx, 208[rbp]
	mov	QWORD PTR 48[rsp], rdx
	mov	rdx, QWORD PTR 66512[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	DWORD PTR 32[rsp], eax
	mov	r9d, r8d
	mov	r8d, r11d
	mov	edx, r10d
	call	draw_text_color
	mov	eax, DWORD PTR 66220[rbp]
	mov	DWORD PTR 66160[rbp], eax
	mov	eax, DWORD PTR 66504[rbp]
	imul	eax, DWORD PTR 66648[rbp]
	lea	edx, [rax+rax]
	mov	eax, DWORD PTR 66216[rbp]
	add	eax, edx
	mov	DWORD PTR 66156[rbp], eax
	mov	eax, DWORD PTR 66160[rbp]
	add	eax, 256
	mov	DWORD PTR 66152[rbp], eax
	mov	eax, DWORD PTR 66156[rbp]
	add	eax, 256
	mov	DWORD PTR 66148[rbp], eax
	mov	r9d, DWORD PTR 66152[rbp]
	mov	r8d, DWORD PTR 66156[rbp]
	mov	edx, DWORD PTR 66160[rbp]
	mov	rax, QWORD PTR 66624[rbp]
	mov	rcx, QWORD PTR 66424[rbp]
	mov	QWORD PTR 40[rsp], rcx
	mov	ecx, DWORD PTR 66148[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_image
	mov	DWORD PTR 66764[rbp], 0
	jmp	.L250
.L252:
	mov	edx, DWORD PTR 66764[rbp]
	mov	eax, edx
	sar	eax, 31
	shr	eax, 27
	add	edx, eax
	and	edx, 31
	sub	edx, eax
	mov	eax, edx
	mov	ecx, eax
	mov	eax, DWORD PTR 66764[rbp]
	lea	edx, 31[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 5
	cdqe
	mov	eax, DWORD PTR 176[rbp+rax*4]
	mov	edx, ecx
	mov	ecx, eax
	call	BG
	test	eax, eax
	jne	.L251
	mov	eax, DWORD PTR 66764[rbp]
	lea	edx, 15[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 4
	add	eax, 1
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC68[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	cvtsi2sd	xmm1, DWORD PTR 66148[rbp]
	cvtsi2sd	xmm0, DWORD PTR 66156[rbp]
	call	lerp
	cvttsd2si	ebx, xmm0
	mov	edx, DWORD PTR 66764[rbp]
	mov	eax, edx
	sar	eax, 31
	shr	eax, 28
	add	edx, eax
	and	edx, 15
	sub	edx, eax
	mov	eax, edx
	add	eax, 1
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC68[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	cvtsi2sd	xmm1, DWORD PTR 66152[rbp]
	cvtsi2sd	xmm0, DWORD PTR 66160[rbp]
	call	lerp
	cvttsd2si	edi, xmm0
	mov	eax, DWORD PTR 66764[rbp]
	lea	edx, 15[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 4
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC68[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	cvtsi2sd	xmm1, DWORD PTR 66148[rbp]
	cvtsi2sd	xmm0, DWORD PTR 66156[rbp]
	call	lerp
	cvttsd2si	esi, xmm0
	mov	edx, DWORD PTR 66764[rbp]
	mov	eax, edx
	sar	eax, 31
	shr	eax, 28
	add	edx, eax
	and	edx, 15
	sub	edx, eax
	mov	eax, edx
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC68[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	cvtsi2sd	xmm1, DWORD PTR 66152[rbp]
	cvtsi2sd	xmm0, DWORD PTR 66160[rbp]
	call	lerp
	cvttsd2si	eax, xmm0
	mov	rcx, QWORD PTR 66624[rbp]
	mov	rdx, QWORD PTR 66416[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	DWORD PTR 32[rsp], ebx
	mov	r9d, edi
	mov	r8d, esi
	mov	edx, eax
	call	draw_image
.L251:
	add	DWORD PTR 66764[rbp], 1
.L250:
	cmp	DWORD PTR 66764[rbp], 255
	jle	.L252
	movzx	eax, BYTE PTR 66167[rbp]
	mov	r8d, 0
	mov	edx, 4
	mov	ecx, eax
	call	BGG
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC68[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	cvtsi2sd	xmm1, DWORD PTR 66152[rbp]
	cvtsi2sd	xmm0, DWORD PTR 66160[rbp]
	call	lerp
	cvttsd2si	eax, xmm0
	mov	DWORD PTR 66144[rbp], eax
	mov	ecx, 255
	mov	eax, DWORD PTR 66144[rbp]
	lea	r9d, 1[rax]
	mov	eax, DWORD PTR 66144[rbp]
	lea	edx, -1[rax]
	mov	r8d, DWORD PTR 66156[rbp]
	mov	rax, QWORD PTR 66624[rbp]
	mov	DWORD PTR 40[rsp], ecx
	mov	ecx, DWORD PTR 66148[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_rectangle_color
	movzx	eax, BYTE PTR 66167[rbp]
	mov	r8d, 1
	mov	edx, 4
	mov	ecx, eax
	call	BGG
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC68[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	cvtsi2sd	xmm1, DWORD PTR 66148[rbp]
	cvtsi2sd	xmm0, DWORD PTR 66156[rbp]
	call	lerp
	cvttsd2si	eax, xmm0
	mov	DWORD PTR 66140[rbp], eax
	mov	r10d, 255
	mov	eax, DWORD PTR 66140[rbp]
	lea	ecx, 1[rax]
	mov	eax, DWORD PTR 66140[rbp]
	lea	r8d, -1[rax]
	mov	r9d, DWORD PTR 66152[rbp]
	mov	edx, DWORD PTR 66160[rbp]
	mov	rax, QWORD PTR 66624[rbp]
	mov	DWORD PTR 40[rsp], r10d
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_rectangle_color
	mov	esi, 255
	movzx	eax, BYTE PTR 66167[rbp]
	mov	r8d, 1
	mov	edx, 4
	mov	ecx, eax
	call	BGG
	add	eax, 1
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC68[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	cvtsi2sd	xmm1, DWORD PTR 66148[rbp]
	cvtsi2sd	xmm0, DWORD PTR 66156[rbp]
	call	lerp
	cvttsd2si	ebx, xmm0
	movzx	eax, BYTE PTR 66167[rbp]
	mov	r8d, 0
	mov	edx, 4
	mov	ecx, eax
	call	BGG
	add	eax, 1
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC68[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	cvtsi2sd	xmm1, DWORD PTR 66152[rbp]
	cvtsi2sd	xmm0, DWORD PTR 66160[rbp]
	call	lerp
	cvttsd2si	ecx, xmm0
	mov	r8d, DWORD PTR 66140[rbp]
	mov	edx, DWORD PTR 66144[rbp]
	mov	rax, QWORD PTR 66624[rbp]
	mov	DWORD PTR 40[rsp], esi
	mov	DWORD PTR 32[rsp], ebx
	mov	r9d, ecx
	mov	rcx, rax
	call	draw_rectangle_color
	mov	DWORD PTR 66760[rbp], 0
	mov	eax, DWORD PTR 66648[rbp]
	sal	eax, 5
	mov	edx, eax
	mov	eax, DWORD PTR 66148[rbp]
	add	eax, edx
	mov	DWORD PTR 66136[rbp], eax
	mov	edx, DWORD PTR 66224[rbp]
	mov	rax, QWORD PTR 66624[rbp]
	mov	rcx, rax
	call	draw_set_color
	mov	DWORD PTR 66756[rbp], 0
	jmp	.L253
.L256:
	mov	ecx, DWORD PTR 66800[rbp]
	mov	edx, 1717986919
	mov	eax, ecx
	imul	edx
	sar	edx, 2
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	r8d, edx
	mov	eax, r8d
	sal	eax, 2
	add	eax, r8d
	add	eax, eax
	sub	ecx, eax
	mov	r8d, ecx
	mov	ecx, DWORD PTR 66800[rbp]
	mov	edx, 1717986919
	mov	eax, ecx
	imul	edx
	sar	edx, 2
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	r9d, edx
	mov	edx, 715827883
	mov	eax, r9d
	imul	edx
	mov	eax, r9d
	sar	eax, 31
	mov	ecx, edx
	sub	ecx, eax
	mov	eax, ecx
	add	eax, eax
	add	eax, ecx
	add	eax, eax
	mov	ecx, r9d
	sub	ecx, eax
	mov	r9d, DWORD PTR 66800[rbp]
	mov	edx, -2004318071
	mov	eax, r9d
	imul	edx
	lea	eax, [rdx+r9]
	sar	eax, 5
	mov	edx, eax
	mov	eax, r9d
	sar	eax, 31
	sub	edx, eax
	mov	r9d, edx
	mov	edx, 1717986919
	mov	eax, r9d
	imul	edx
	sar	edx, 2
	mov	eax, r9d
	sar	eax, 31
	sub	edx, eax
	mov	r10d, edx
	mov	eax, r10d
	sal	eax, 2
	add	eax, r10d
	add	eax, eax
	mov	r10d, r9d
	sub	r10d, eax
	mov	r9d, DWORD PTR 66800[rbp]
	mov	edx, 458129845
	mov	eax, r9d
	imul	edx
	sar	edx, 6
	mov	eax, r9d
	sar	eax, 31
	sub	edx, eax
	mov	eax, DWORD PTR 66756[rbp]
	mov	DWORD PTR 40[rsp], r8d
	mov	DWORD PTR 32[rsp], ecx
	mov	r9d, 737
	mov	r8d, r10d
	mov	ecx, eax
	call	mux_int
	mov	DWORD PTR 66132[rbp], eax
	cmp	DWORD PTR 66756[rbp], 2
	je	.L254
	mov	eax, DWORD PTR 66132[rbp]
	sal	eax, 4
	mov	ecx, eax
	mov	eax, DWORD PTR 66756[rbp]
	add	eax, 1
	imul	eax, DWORD PTR 66652[rbp]
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR 66220[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 66760[rbp]
	lea	r9d, [rdx+rax]
	mov	eax, DWORD PTR 66756[rbp]
	imul	eax, DWORD PTR 66652[rbp]
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR 66220[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 66760[rbp]
	add	edx, eax
	mov	r8d, DWORD PTR 66148[rbp]
	mov	rax, QWORD PTR 66624[rbp]
	mov	DWORD PTR 72[rsp], 32
	mov	DWORD PTR 64[rsp], 16
	mov	DWORD PTR 56[rsp], 0
	mov	DWORD PTR 48[rsp], ecx
	mov	rcx, QWORD PTR 66496[rbp]
	mov	QWORD PTR 40[rsp], rcx
	mov	ecx, DWORD PTR 66136[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_image_part
	mov	eax, DWORD PTR 66652[rbp]
	add	DWORD PTR 66760[rbp], eax
	jmp	.L255
.L254:
	mov	eax, DWORD PTR 66504[rbp]
	imul	eax, DWORD PTR 66648[rbp]
	mov	edx, DWORD PTR 66508[rbp]
	imul	edx, DWORD PTR 66652[rbp]
	mov	r8d, edx
	mov	edx, DWORD PTR 66652[rbp]
	mov	ecx, edx
	sal	ecx, 5
	mov	edx, DWORD PTR 66220[rbp]
	add	edx, ecx
	mov	r10d, DWORD PTR 66148[rbp]
	mov	rcx, QWORD PTR 66624[rbp]
	mov	r9d, DWORD PTR 66224[rbp]
	mov	DWORD PTR 72[rsp], r9d
	mov	r9d, DWORD PTR 66504[rbp]
	mov	DWORD PTR 64[rsp], r9d
	mov	r9d, DWORD PTR 66508[rbp]
	mov	DWORD PTR 56[rsp], r9d
	lea	r9, .LC69[rip]
	mov	QWORD PTR 48[rsp], r9
	mov	r9, QWORD PTR 66512[rbp]
	mov	QWORD PTR 40[rsp], r9
	mov	DWORD PTR 32[rsp], eax
	mov	r9d, r8d
	mov	r8d, r10d
	call	draw_text_color
.L255:
	add	DWORD PTR 66756[rbp], 1
.L253:
	cmp	DWORD PTR 66756[rbp], 4
	jle	.L256
	mov	edx, 16777215
	mov	rax, QWORD PTR 66624[rbp]
	mov	rcx, rax
	call	draw_set_color
	mov	DWORD PTR 66752[rbp], 0
	mov	eax, DWORD PTR 66800[rbp]
	mov	DWORD PTR 32[rsp], 59
	mov	r9d, 5
	mov	r8d, 0
	mov	edx, 0
	mov	ecx, eax
	call	clock_is_between
	test	eax, eax
	je	.L257
	mov	DWORD PTR 66752[rbp], 0
.L257:
	mov	eax, DWORD PTR 66800[rbp]
	mov	DWORD PTR 32[rsp], 59
	mov	r9d, 11
	mov	r8d, 0
	mov	edx, 6
	mov	ecx, eax
	call	clock_is_between
	test	eax, eax
	je	.L258
	mov	DWORD PTR 66752[rbp], 1
.L258:
	mov	eax, DWORD PTR 66800[rbp]
	mov	DWORD PTR 32[rsp], 59
	mov	r9d, 17
	mov	r8d, 0
	mov	edx, 12
	mov	ecx, eax
	call	clock_is_between
	test	eax, eax
	je	.L259
	mov	DWORD PTR 66752[rbp], 2
.L259:
	mov	eax, DWORD PTR 66800[rbp]
	mov	DWORD PTR 32[rsp], 59
	mov	r9d, 23
	mov	r8d, 0
	mov	edx, 18
	mov	ecx, eax
	call	clock_is_between
	test	eax, eax
	je	.L260
	mov	DWORD PTR 66752[rbp], 3
.L260:
	mov	r9, QWORD PTR 66456[rbp]
	mov	r8, QWORD PTR 66464[rbp]
	mov	rdx, QWORD PTR 66472[rbp]
	mov	eax, DWORD PTR 66752[rbp]
	mov	rcx, QWORD PTR 66448[rbp]
	mov	QWORD PTR 32[rsp], rcx
	mov	ecx, eax
	call	mux_str
	mov	r11, rax
	mov	eax, DWORD PTR 66504[rbp]
	imul	eax, DWORD PTR 66648[rbp]
	mov	edx, DWORD PTR 66508[rbp]
	imul	edx, DWORD PTR 66652[rbp]
	mov	r8d, edx
	mov	ecx, DWORD PTR 66136[rbp]
	mov	edx, DWORD PTR 66648[rbp]
	lea	r10d, [rcx+rdx]
	mov	edx, DWORD PTR 66220[rbp]
	mov	rcx, QWORD PTR 66624[rbp]
	mov	r9d, DWORD PTR 66224[rbp]
	mov	DWORD PTR 72[rsp], r9d
	mov	r9d, DWORD PTR 66504[rbp]
	mov	DWORD PTR 64[rsp], r9d
	mov	r9d, DWORD PTR 66508[rbp]
	mov	DWORD PTR 56[rsp], r9d
	mov	QWORD PTR 48[rsp], r11
	mov	r9, QWORD PTR 66512[rbp]
	mov	QWORD PTR 40[rsp], r9
	mov	DWORD PTR 32[rsp], eax
	mov	r9d, r8d
	mov	r8d, r10d
	call	draw_text_color
	mov	edx, DWORD PTR 66136[rbp]
	mov	eax, DWORD PTR 66648[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 66504[rbp]
	imul	eax, DWORD PTR 66648[rbp]
	add	eax, edx
	mov	DWORD PTR 66128[rbp], eax
	mov	edx, DWORD PTR 66648[rbp]
	mov	eax, edx
	add	eax, eax
	add	eax, edx
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR 66128[rbp]
	add	eax, edx
	mov	DWORD PTR 66124[rbp], eax
	mov	eax, DWORD PTR 66652[rbp]
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR 66220[rbp]
	lea	r9d, [rdx+rax]
	mov	r8d, DWORD PTR 66128[rbp]
	mov	edx, DWORD PTR 66220[rbp]
	mov	rax, QWORD PTR 66624[rbp]
	mov	rcx, QWORD PTR 66400[rbp]
	mov	QWORD PTR 40[rsp], rcx
	mov	ecx, DWORD PTR 66124[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_image
	mov	eax, DWORD PTR 66504[rbp]
	imul	eax, DWORD PTR 66648[rbp]
	mov	ebx, eax
	mov	eax, DWORD PTR 66508[rbp]
	imul	eax, DWORD PTR 66652[rbp]
	mov	esi, eax
	cvtsi2sd	xmm1, DWORD PTR 66124[rbp]
	cvtsi2sd	xmm0, DWORD PTR 66128[rbp]
	movsd	xmm2, QWORD PTR .LC70[rip]
	call	lerp
	cvttsd2si	r8d, xmm0
	mov	eax, DWORD PTR 66220[rbp]
	lea	edx, 48[rax]
	mov	rcx, QWORD PTR 66624[rbp]
	mov	eax, DWORD PTR 66224[rbp]
	mov	DWORD PTR 72[rsp], eax
	mov	eax, DWORD PTR 66504[rbp]
	mov	DWORD PTR 64[rsp], eax
	mov	eax, DWORD PTR 66508[rbp]
	mov	DWORD PTR 56[rsp], eax
	lea	rax, 68[rbp]
	mov	QWORD PTR 48[rsp], rax
	mov	rax, QWORD PTR 66512[rbp]
	mov	QWORD PTR 40[rsp], rax
	mov	DWORD PTR 32[rsp], ebx
	mov	r9d, esi
	call	draw_text_color
	mov	rsp, r15
.L249:
	mov	eax, DWORD PTR 66656[rbp]
	mov	DWORD PTR 66120[rbp], eax
	mov	DWORD PTR 66748[rbp], 0
	jmp	.L261
.L271:
	mov	DWORD PTR 66744[rbp], 0
	jmp	.L262
.L270:
	mov	eax, DWORD PTR 66748[rbp]
	imul	eax, DWORD PTR 66660[rbp]
	mov	edx, DWORD PTR 66744[rbp]
	add	eax, edx
	mov	DWORD PTR 66116[rbp], eax
	mov	eax, DWORD PTR 66744[rbp]
	imul	eax, DWORD PTR 66652[rbp]
	imul	eax, DWORD PTR 66656[rbp]
	mov	edx, DWORD PTR 66684[rbp]
	add	eax, edx
	mov	DWORD PTR 66112[rbp], eax
	mov	eax, DWORD PTR 66748[rbp]
	imul	eax, DWORD PTR 66648[rbp]
	imul	eax, DWORD PTR 66656[rbp]
	mov	edx, DWORD PTR 66680[rbp]
	add	eax, edx
	mov	DWORD PTR 66108[rbp], eax
	mov	eax, DWORD PTR 66744[rbp]
	add	eax, 1
	imul	eax, DWORD PTR 66652[rbp]
	imul	eax, DWORD PTR 66656[rbp]
	mov	edx, DWORD PTR 66684[rbp]
	add	eax, edx
	mov	DWORD PTR 66104[rbp], eax
	mov	eax, DWORD PTR 66748[rbp]
	add	eax, 1
	imul	eax, DWORD PTR 66648[rbp]
	imul	eax, DWORD PTR 66656[rbp]
	mov	edx, DWORD PTR 66680[rbp]
	add	eax, edx
	mov	DWORD PTR 66100[rbp], eax
	mov	r9d, 16711680
	mov	r8d, 65280
	mov	r10d, 255
	mov	ecx, DWORD PTR 66116[rbp]
	mov	edx, 1431655766
	mov	eax, ecx
	imul	edx
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	mov	edx, eax
	add	edx, edx
	add	edx, eax
	mov	eax, ecx
	sub	eax, edx
	mov	edx, r10d
	mov	ecx, eax
	call	mux_int
	mov	DWORD PTR 66096[rbp], eax
	mov	r9d, DWORD PTR 66104[rbp]
	mov	r8d, DWORD PTR 66108[rbp]
	mov	edx, DWORD PTR 66112[rbp]
	mov	rax, QWORD PTR 66624[rbp]
	mov	ecx, DWORD PTR 66096[rbp]
	mov	DWORD PTR 40[rsp], ecx
	mov	ecx, DWORD PTR 66100[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_rectangle_color
	mov	eax, DWORD PTR 66444[rbp]
	imul	eax, DWORD PTR 66792[rbp]
	mov	edx, DWORD PTR 66116[rbp]
	add	eax, edx
	mov	DWORD PTR 66092[rbp], eax
	mov	eax, DWORD PTR 66092[rbp]
	cdqe
	movzx	eax, BYTE PTR 224[rbp+rax]
	movzx	eax, al
	mov	DWORD PTR 66088[rbp], eax
	cmp	DWORD PTR 66088[rbp], 143
	jle	.L263
	cmp	DWORD PTR 66088[rbp], 159
	jg	.L263
	mov	DWORD PTR 66084[rbp], 16
	cmp	DWORD PTR 66088[rbp], 144
	jne	.L264
	mov	eax, 60
	jmp	.L265
.L264:
	mov	eax, 120
.L265:
	mov	DWORD PTR 66080[rbp], eax
	call	get_timer
	mov	DWORD PTR 66076[rbp], eax
	cmp	DWORD PTR 66088[rbp], 144
	jne	.L266
	mov	rax, QWORD PTR 66552[rbp]
	mov	QWORD PTR 66736[rbp], rax
	jmp	.L267
.L266:
	cmp	DWORD PTR 66088[rbp], 148
	jne	.L268
	mov	rax, QWORD PTR 66544[rbp]
	mov	QWORD PTR 66736[rbp], rax
	jmp	.L267
.L268:
	mov	rax, QWORD PTR 66552[rbp]
	mov	QWORD PTR 66736[rbp], rax
.L267:
	mov	eax, DWORD PTR 66076[rbp]
	cdq
	idiv	DWORD PTR 66080[rbp]
	cdq
	idiv	DWORD PTR 66084[rbp]
	mov	eax, edx
	imul	eax, DWORD PTR 66120[rbp]
	mov	r9d, DWORD PTR 66104[rbp]
	mov	r10d, DWORD PTR 66108[rbp]
	mov	edx, DWORD PTR 66112[rbp]
	mov	rcx, QWORD PTR 66624[rbp]
	mov	r8d, DWORD PTR 66120[rbp]
	mov	DWORD PTR 72[rsp], r8d
	mov	r8d, DWORD PTR 66120[rbp]
	mov	DWORD PTR 64[rsp], r8d
	mov	DWORD PTR 56[rsp], 0
	mov	DWORD PTR 48[rsp], eax
	mov	rax, QWORD PTR 66736[rbp]
	mov	QWORD PTR 40[rsp], rax
	mov	eax, DWORD PTR 66100[rbp]
	mov	DWORD PTR 32[rsp], eax
	mov	r8d, r10d
	call	draw_image_part
	jmp	.L269
.L263:
	mov	eax, DWORD PTR 66088[rbp]
	cdq
	idiv	DWORD PTR 66660[rbp]
	imul	eax, DWORD PTR 66120[rbp]
	mov	ecx, eax
	mov	eax, DWORD PTR 66088[rbp]
	cdq
	idiv	DWORD PTR 66660[rbp]
	mov	eax, edx
	imul	eax, DWORD PTR 66120[rbp]
	mov	r9d, DWORD PTR 66104[rbp]
	mov	r11d, DWORD PTR 66108[rbp]
	mov	edx, DWORD PTR 66112[rbp]
	mov	r10, QWORD PTR 66624[rbp]
	mov	r8d, DWORD PTR 66120[rbp]
	mov	DWORD PTR 72[rsp], r8d
	mov	r8d, DWORD PTR 66120[rbp]
	mov	DWORD PTR 64[rsp], r8d
	mov	DWORD PTR 56[rsp], ecx
	mov	DWORD PTR 48[rsp], eax
	mov	rax, QWORD PTR 66536[rbp]
	mov	QWORD PTR 40[rsp], rax
	mov	eax, DWORD PTR 66100[rbp]
	mov	DWORD PTR 32[rsp], eax
	mov	r8d, r11d
	mov	rcx, r10
	call	draw_image_part
.L269:
	add	DWORD PTR 66744[rbp], 1
.L262:
	mov	eax, DWORD PTR 66744[rbp]
	cmp	eax, DWORD PTR 66660[rbp]
	jl	.L270
	add	DWORD PTR 66748[rbp], 1
.L261:
	mov	eax, DWORD PTR 66748[rbp]
	cmp	eax, DWORD PTR 66660[rbp]
	jl	.L271
	movzx	eax, BYTE PTR 160[rbp]
	movzx	eax, al
	imul	eax, DWORD PTR 66120[rbp]
	mov	edx, eax
	movzx	eax, BYTE PTR 165[rbp]
	movzx	eax, al
	imul	edx, eax
	movzx	eax, BYTE PTR 164[rbp]
	movzx	eax, al
	imul	eax, DWORD PTR 66120[rbp]
	lea	r8d, [rdx+rax]
	mov	edx, DWORD PTR 148[rbp]
	mov	eax, DWORD PTR 66120[rbp]
	imul	eax, DWORD PTR 66648[rbp]
	lea	ecx, [rdx+rax]
	mov	edx, DWORD PTR 144[rbp]
	mov	eax, DWORD PTR 66120[rbp]
	imul	eax, DWORD PTR 66652[rbp]
	lea	r11d, [rdx+rax]
	mov	r10d, DWORD PTR 148[rbp]
	mov	edx, DWORD PTR 144[rbp]
	mov	rax, QWORD PTR 66624[rbp]
	mov	r9d, DWORD PTR 66120[rbp]
	mov	DWORD PTR 72[rsp], r9d
	mov	r9d, DWORD PTR 66120[rbp]
	mov	DWORD PTR 64[rsp], r9d
	mov	DWORD PTR 56[rsp], 0
	mov	DWORD PTR 48[rsp], r8d
	mov	r8, QWORD PTR 66520[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r9d, r11d
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_image_part
	cmp	DWORD PTR 66808[rbp], 0
	jle	.L272
	mov	eax, DWORD PTR 144[rbp]
	add	eax, 60
	mov	DWORD PTR 65888[rbp], eax
	mov	eax, DWORD PTR 148[rbp]
	sub	eax, 120
	mov	DWORD PTR 65892[rbp], eax
	mov	rax, QWORD PTR 66624[rbp]
	mov	DWORD PTR 32[rsp], 255
	mov	r9d, 255
	mov	r8d, 255
	mov	edx, 255
	mov	rcx, rax
	call	SDL_SetRenderDrawColor
	mov	rdx, QWORD PTR 66600[rbp]
	mov	rax, QWORD PTR 66624[rbp]
	mov	rcx, rax
	call	SDL_RenderFillRect
	mov	rax, QWORD PTR 66624[rbp]
	mov	DWORD PTR 32[rsp], 255
	mov	r9d, 255
	mov	r8d, 255
	mov	edx, 255
	mov	rcx, rax
	call	SDL_SetRenderDrawColor
	mov	rax, QWORD PTR 66600[rbp]
	mov	ecx, DWORD PTR 4[rax]
	mov	rax, QWORD PTR 66600[rbp]
	mov	eax, DWORD PTR 12[rax]
	lea	edx, 3[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 2
	lea	r8d, [rcx+rax]
	mov	rax, QWORD PTR 66600[rbp]
	mov	eax, DWORD PTR [rax]
	cvtsi2sd	xmm1, eax
	mov	rax, QWORD PTR 66600[rbp]
	mov	eax, DWORD PTR 8[rax]
	cvtsi2sd	xmm2, eax
	movsd	xmm0, QWORD PTR .LC71[rip]
	mulsd	xmm0, xmm2
	addsd	xmm0, xmm1
	cvttsd2si	ecx, xmm0
	mov	eax, DWORD PTR 148[rbp]
	lea	r10d, -15[rax]
	mov	eax, DWORD PTR 144[rbp]
	lea	edx, 45[rax]
	mov	rax, QWORD PTR 66624[rbp]
	mov	DWORD PTR 32[rsp], r8d
	mov	r9d, ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	SDL_RenderDrawLine
	mov	rax, QWORD PTR 66600[rbp]
	mov	edx, DWORD PTR 4[rax]
	mov	rax, QWORD PTR 66600[rbp]
	mov	eax, DWORD PTR 12[rax]
	lea	r8d, [rdx+rax]
	mov	rax, QWORD PTR 66600[rbp]
	mov	eax, DWORD PTR [rax]
	cvtsi2sd	xmm1, eax
	mov	rax, QWORD PTR 66600[rbp]
	mov	eax, DWORD PTR 8[rax]
	cvtsi2sd	xmm2, eax
	movsd	xmm0, QWORD PTR .LC72[rip]
	mulsd	xmm0, xmm2
	addsd	xmm0, xmm1
	cvttsd2si	ecx, xmm0
	mov	eax, DWORD PTR 148[rbp]
	lea	r10d, -15[rax]
	mov	eax, DWORD PTR 144[rbp]
	lea	edx, 45[rax]
	mov	rax, QWORD PTR 66624[rbp]
	mov	DWORD PTR 32[rsp], r8d
	mov	r9d, ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	SDL_RenderDrawLine
	mov	DWORD PTR 28[rbp], 0
	mov	rax, QWORD PTR 66600[rbp]
	mov	eax, DWORD PTR 8[rax]
	sub	eax, 10
	mov	DWORD PTR 66072[rbp], eax
	mov	r8d, DWORD PTR 66072[rbp]
	mov	ecx, DWORD PTR 28[rbp]
	mov	rdx, QWORD PTR 66608[rbp]
	mov	rax, QWORD PTR 66592[rbp]
	mov	r9d, r8d
	mov	r8d, ecx
	mov	rcx, rax
	call	TTF_RenderText_Blended_Wrapped
	mov	QWORD PTR 66728[rbp], rax
	cmp	QWORD PTR 66728[rbp], 0
	jne	.L273
	mov	edx, DWORD PTR 28[rbp]
	mov	rax, QWORD PTR 66592[rbp]
	mov	r8d, edx
	lea	rdx, .LC73[rip]
	mov	rcx, rax
	call	TTF_RenderText_Solid
	mov	QWORD PTR 66728[rbp], rax
.L273:
	mov	rax, QWORD PTR 66728[rbp]
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR 66068[rbp], eax
	mov	rax, QWORD PTR 66728[rbp]
	mov	eax, DWORD PTR 20[rax]
	mov	DWORD PTR 66064[rbp], eax
	mov	rax, QWORD PTR 66600[rbp]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR 66600[rbp]
	mov	eax, DWORD PTR 8[rax]
	sub	eax, DWORD PTR 66068[rbp]
	mov	ecx, eax
	shr	ecx, 31
	add	eax, ecx
	sar	eax
	add	eax, edx
	mov	DWORD PTR 66060[rbp], eax
	mov	rax, QWORD PTR 66600[rbp]
	mov	edx, DWORD PTR 4[rax]
	mov	rax, QWORD PTR 66600[rbp]
	mov	eax, DWORD PTR 12[rax]
	sub	eax, DWORD PTR 66064[rbp]
	mov	ecx, eax
	shr	ecx, 31
	add	eax, ecx
	sar	eax
	add	eax, edx
	mov	DWORD PTR 66056[rbp], eax
	mov	eax, DWORD PTR 66060[rbp]
	mov	DWORD PTR 0[rbp], eax
	mov	eax, DWORD PTR 66056[rbp]
	mov	DWORD PTR 4[rbp], eax
	mov	eax, DWORD PTR 66068[rbp]
	mov	DWORD PTR 8[rbp], eax
	mov	eax, DWORD PTR 66064[rbp]
	mov	DWORD PTR 12[rbp], eax
	mov	rdx, QWORD PTR 66728[rbp]
	mov	rax, QWORD PTR 66624[rbp]
	mov	rcx, rax
	call	SDL_CreateTextureFromSurface
	mov	QWORD PTR 66048[rbp], rax
	mov	rcx, rbp
	mov	rdx, QWORD PTR 66048[rbp]
	mov	rax, QWORD PTR 66624[rbp]
	mov	r9, rcx
	mov	r8d, 0
	mov	rcx, rax
	call	SDL_RenderCopy
	mov	rax, QWORD PTR 66728[rbp]
	mov	rcx, rax
	call	SDL_FreeSurface
	mov	rax, QWORD PTR 66048[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
.L272:
	mov	DWORD PTR 66724[rbp], 0
	jmp	.L274
.L276:
	lea	rax, waterParticles[rip]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR 66724[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	mov	eax, DWORD PTR 12[rax]
	test	eax, eax
	je	.L275
	lea	rax, waterParticles[rip]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR 66724[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	movss	xmm1, DWORD PTR 4[rax]
	movss	xmm0, DWORD PTR .LC74[rip]
	addss	xmm0, xmm1
	cvttss2si	edx, xmm0
	lea	rax, waterParticles[rip]
	mov	rcx, QWORD PTR [rax]
	mov	eax, DWORD PTR 66724[rbp]
	cdqe
	sal	rax, 4
	add	rax, rcx
	movss	xmm1, DWORD PTR [rax]
	movss	xmm0, DWORD PTR .LC75[rip]
	addss	xmm0, xmm1
	cvttss2si	r9d, xmm0
	lea	rax, waterParticles[rip]
	mov	rcx, QWORD PTR [rax]
	mov	eax, DWORD PTR 66724[rbp]
	cdqe
	sal	rax, 4
	add	rax, rcx
	movss	xmm0, DWORD PTR 4[rax]
	cvttss2si	r8d, xmm0
	lea	rax, waterParticles[rip]
	mov	rcx, QWORD PTR [rax]
	mov	eax, DWORD PTR 66724[rbp]
	cdqe
	sal	rax, 4
	add	rax, rcx
	movss	xmm0, DWORD PTR [rax]
	cvttss2si	eax, xmm0
	mov	rcx, QWORD PTR 66624[rbp]
	mov	r10, QWORD PTR 66552[rbp]
	mov	QWORD PTR 40[rsp], r10
	mov	DWORD PTR 32[rsp], edx
	mov	edx, eax
	call	draw_image
.L275:
	add	DWORD PTR 66724[rbp], 1
.L274:
	mov	eax, 100
	cmp	DWORD PTR 66724[rbp], eax
	jl	.L276
	cmp	DWORD PTR 66784[rbp], 0
	je	.L277
	mov	eax, DWORD PTR 66652[rbp]
	sal	eax, 6
	mov	DWORD PTR 66044[rbp], eax
	mov	ecx, DWORD PTR 66692[rbp]
	mov	rax, QWORD PTR 66624[rbp]
	mov	DWORD PTR 40[rsp], 0
	mov	edx, DWORD PTR 66688[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, ecx
	mov	r8d, 0
	mov	edx, 0
	mov	rcx, rax
	call	draw_rectangle_color
	mov	edx, DWORD PTR 66668[rbp]
	mov	eax, DWORD PTR 66044[rbp]
	lea	r9d, [rdx+rax]
	mov	eax, DWORD PTR 66684[rbp]
	sub	eax, DWORD PTR 66044[rbp]
	mov	r8d, DWORD PTR 66680[rbp]
	mov	rcx, QWORD PTR 66624[rbp]
	mov	rdx, QWORD PTR 66360[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	edx, DWORD PTR 66664[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	edx, eax
	call	draw_image
	mov	DWORD PTR 66040[rbp], 16
	call	draw_get_color
	mov	DWORD PTR 66036[rbp], eax
	call	get_timer
	mov	DWORD PTR 66032[rbp], eax
	mov	ecx, DWORD PTR 66032[rbp]
	mov	edx, 1717986919
	mov	eax, ecx
	imul	edx
	sar	edx, 2
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	movsx	rdx, eax
	imul	rdx, rdx, -1240768329
	shr	rdx, 32
	add	edx, eax
	mov	ecx, edx
	sar	ecx, 8
	cdq
	sub	ecx, edx
	mov	edx, ecx
	mov	DWORD PTR 66028[rbp], edx
	mov	edx, DWORD PTR 66028[rbp]
	imul	edx, edx, 360
	sub	eax, edx
	mov	DWORD PTR 66028[rbp], eax
	mov	ecx, DWORD PTR 66032[rbp]
	mov	edx, 1717986919
	mov	eax, ecx
	imul	edx
	sar	edx, 2
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	movsx	rdx, eax
	imul	rdx, rdx, -1240768329
	shr	rdx, 32
	add	edx, eax
	mov	ecx, edx
	sar	ecx, 8
	cdq
	sub	ecx, edx
	mov	edx, ecx
	imul	edx, edx, 360
	sub	eax, edx
	mov	edx, eax
	cvtsi2sd	xmm0, edx
	call	dcos
	movapd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC76[rip]
	mulsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC77[rip]
	addsd	xmm0, xmm1
	cvttsd2si	eax, xmm0
	mov	DWORD PTR 66024[rbp], eax
	mov	ecx, DWORD PTR 66032[rbp]
	mov	edx, 1717986919
	mov	eax, ecx
	imul	edx
	sar	edx, 2
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	sar	eax, 31
	shr	eax, 24
	add	edx, eax
	movzx	edx, dl
	sub	edx, eax
	mov	eax, edx
	mov	DWORD PTR 66020[rbp], eax
	mov	DWORD PTR 66720[rbp], 0
	jmp	.L278
.L279:
	mov	eax, DWORD PTR 66040[rbp]
	neg	eax
	imul	eax, DWORD PTR 66652[rbp]
	cvtsi2sd	xmm6, eax
	cvtsi2sd	xmm0, DWORD PTR 66028[rbp]
	call	dcos
	mulsd	xmm6, xmm0
	mov	eax, DWORD PTR 66720[rbp]
	imul	eax, DWORD PTR 66652[rbp]
	cvtsi2sd	xmm7, eax
	cvtsi2sd	xmm0, DWORD PTR 66028[rbp]
	call	dcos
	mulsd	xmm0, xmm7
	addsd	xmm0, xmm6
	cvttsd2si	eax, xmm0
	mov	DWORD PTR 66016[rbp], eax
	mov	eax, DWORD PTR 66040[rbp]
	neg	eax
	imul	eax, DWORD PTR 66648[rbp]
	cvtsi2sd	xmm6, eax
	cvtsi2sd	xmm0, DWORD PTR 66024[rbp]
	call	dsin
	mulsd	xmm6, xmm0
	mov	eax, DWORD PTR 66720[rbp]
	imul	eax, DWORD PTR 66648[rbp]
	cvtsi2sd	xmm7, eax
	cvtsi2sd	xmm0, DWORD PTR 66024[rbp]
	call	dsin
	mulsd	xmm0, xmm7
	addsd	xmm0, xmm6
	cvttsd2si	eax, xmm0
	mov	DWORD PTR 66012[rbp], eax
	cvtsi2sd	xmm0, DWORD PTR 66720[rbp]
	mov	eax, DWORD PTR 66040[rbp]
	sub	eax, 1
	cvtsi2sd	xmm1, eax
	divsd	xmm0, xmm1
	movapd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC78[rip]
	movapd	xmm2, xmm1
	movapd	xmm1, xmm0
	pxor	xmm0, xmm0
	call	lerp
	cvttsd2si	edx, xmm0
	mov	eax, DWORD PTR 66020[rbp]
	mov	r8d, edx
	mov	edx, 32
	mov	ecx, eax
	call	make_color_hsv
	mov	edx, eax
	mov	rax, QWORD PTR 66624[rbp]
	mov	rcx, rax
	call	draw_set_color
	mov	edx, DWORD PTR 66664[rbp]
	mov	eax, DWORD PTR 66012[rbp]
	lea	ecx, [rdx+rax]
	mov	edx, DWORD PTR 66668[rbp]
	mov	eax, DWORD PTR 66044[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 66016[rbp]
	lea	r9d, [rdx+rax]
	mov	edx, DWORD PTR 66680[rbp]
	mov	eax, DWORD PTR 66012[rbp]
	lea	r10d, [rdx+rax]
	mov	eax, DWORD PTR 66684[rbp]
	sub	eax, DWORD PTR 66044[rbp]
	mov	edx, DWORD PTR 66016[rbp]
	add	edx, eax
	mov	rax, QWORD PTR 66624[rbp]
	mov	r8, QWORD PTR 66352[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_image
	add	DWORD PTR 66720[rbp], 1
.L278:
	mov	eax, DWORD PTR 66720[rbp]
	cmp	eax, DWORD PTR 66040[rbp]
	jl	.L279
	mov	edx, DWORD PTR 66668[rbp]
	mov	eax, DWORD PTR 66044[rbp]
	lea	r9d, [rdx+rax]
	mov	eax, DWORD PTR 66684[rbp]
	sub	eax, DWORD PTR 66044[rbp]
	mov	r8d, DWORD PTR 66680[rbp]
	mov	rcx, QWORD PTR 66624[rbp]
	mov	rdx, QWORD PTR 66344[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	edx, DWORD PTR 66664[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	edx, eax
	call	draw_image
	mov	edx, DWORD PTR 66036[rbp]
	mov	rax, QWORD PTR 66624[rbp]
	mov	rcx, rax
	call	draw_set_color
	mov	DWORD PTR 66008[rbp], 384
	mov	DWORD PTR 66004[rbp], 32
	mov	ecx, DWORD PTR 66032[rbp]
	mov	edx, -2004318071
	mov	eax, ecx
	imul	edx
	lea	eax, [rdx+rcx]
	sar	eax, 5
	mov	edx, eax
	mov	eax, ecx
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
	jle	.L280
	mov	r9d, 65535
	mov	eax, DWORD PTR 66504[rbp]
	imul	eax, DWORD PTR 66648[rbp]
	mov	edx, DWORD PTR 66508[rbp]
	imul	edx, DWORD PTR 66652[rbp]
	mov	r8d, edx
	mov	r10d, DWORD PTR 66004[rbp]
	mov	edx, DWORD PTR 66008[rbp]
	mov	rcx, QWORD PTR 66624[rbp]
	mov	DWORD PTR 72[rsp], r9d
	mov	r9d, DWORD PTR 66504[rbp]
	mov	DWORD PTR 64[rsp], r9d
	mov	r9d, DWORD PTR 66508[rbp]
	mov	DWORD PTR 56[rsp], r9d
	mov	r9, QWORD PTR 66336[rbp]
	mov	QWORD PTR 48[rsp], r9
	mov	r9, QWORD PTR 66512[rbp]
	mov	QWORD PTR 40[rsp], r9
	mov	DWORD PTR 32[rsp], eax
	mov	r9d, r8d
	mov	r8d, r10d
	call	draw_text_color
.L280:
	mov	DWORD PTR 66008[rbp], 64
	mov	DWORD PTR 66004[rbp], 8
	mov	r9d, 16777215
	mov	eax, DWORD PTR 66504[rbp]
	imul	eax, DWORD PTR 66648[rbp]
	mov	edx, DWORD PTR 66508[rbp]
	imul	edx, DWORD PTR 66652[rbp]
	mov	r8d, edx
	mov	ecx, DWORD PTR 66680[rbp]
	mov	edx, DWORD PTR 66672[rbp]
	add	edx, ecx
	mov	ecx, edx
	sub	ecx, DWORD PTR 66004[rbp]
	mov	edx, DWORD PTR 66504[rbp]
	imul	edx, DWORD PTR 66648[rbp]
	sub	ecx, edx
	mov	r10d, ecx
	mov	edx, DWORD PTR 66008[rbp]
	mov	rcx, QWORD PTR 66624[rbp]
	mov	DWORD PTR 72[rsp], r9d
	mov	r9d, DWORD PTR 66504[rbp]
	mov	DWORD PTR 64[rsp], r9d
	mov	r9d, DWORD PTR 66508[rbp]
	mov	DWORD PTR 56[rsp], r9d
	mov	r9, QWORD PTR 66328[rbp]
	mov	QWORD PTR 48[rsp], r9
	mov	r9, QWORD PTR 66512[rbp]
	mov	QWORD PTR 40[rsp], r9
	mov	DWORD PTR 32[rsp], eax
	mov	r9d, r8d
	mov	r8d, r10d
	call	draw_text_color
.L277:
	cmp	DWORD PTR 66808[rbp], 0
	jle	.L281
	mov	rax, QWORD PTR 66624[rbp]
	mov	DWORD PTR 32[rsp], 255
	mov	r9d, 255
	mov	r8d, 255
	mov	edx, 255
	mov	rcx, rax
	call	SDL_SetRenderDrawColor
	lea	rax, 65888[rbp]
	mov	rcx, QWORD PTR 66624[rbp]
	mov	rdx, rax
	call	SDL_RenderFillRect
	mov	DWORD PTR -4[rbp], 0
	mov	BYTE PTR -4[rbp], -1
	mov	ecx, DWORD PTR -4[rbp]
	mov	rdx, QWORD PTR 66608[rbp]
	mov	rax, QWORD PTR 66592[rbp]
	mov	r8d, ecx
	mov	rcx, rax
	call	TTF_RenderText_Solid
	mov	QWORD PTR 65992[rbp], rax
	mov	rdx, QWORD PTR 65992[rbp]
	mov	rax, QWORD PTR 66624[rbp]
	mov	rcx, rax
	call	SDL_CreateTextureFromSurface
	mov	QWORD PTR 65984[rbp], rax
	mov	edx, DWORD PTR 65888[rbp]
	mov	ecx, DWORD PTR 65896[rbp]
	mov	rax, QWORD PTR 65992[rbp]
	mov	eax, DWORD PTR 16[rax]
	sub	ecx, eax
	mov	eax, ecx
	mov	ecx, eax
	shr	ecx, 31
	add	eax, ecx
	sar	eax
	add	eax, edx
	mov	DWORD PTR -32[rbp], eax
	mov	edx, DWORD PTR 65892[rbp]
	mov	ecx, DWORD PTR 65900[rbp]
	mov	rax, QWORD PTR 65992[rbp]
	mov	eax, DWORD PTR 20[rax]
	sub	ecx, eax
	mov	eax, ecx
	mov	ecx, eax
	shr	ecx, 31
	add	eax, ecx
	sar	eax
	add	eax, edx
	mov	DWORD PTR -28[rbp], eax
	mov	rax, QWORD PTR 65992[rbp]
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR -24[rbp], eax
	mov	rax, QWORD PTR 65992[rbp]
	mov	eax, DWORD PTR 20[rax]
	mov	DWORD PTR -20[rbp], eax
	lea	rcx, -32[rbp]
	mov	rdx, QWORD PTR 65984[rbp]
	mov	rax, QWORD PTR 66624[rbp]
	mov	r9, rcx
	mov	r8d, 0
	mov	rcx, rax
	call	SDL_RenderCopy
	mov	rax, QWORD PTR 65992[rbp]
	mov	rcx, rax
	call	SDL_FreeSurface
	mov	rax, QWORD PTR 65984[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
.L281:
	mov	rax, QWORD PTR 66624[rbp]
	mov	DWORD PTR 32[rsp], 255
	mov	r9d, 0
	mov	r8d, 0
	mov	edx, 0
	mov	rcx, rax
	call	SDL_SetRenderDrawColor
	mov	edx, DWORD PTR 66812[rbp]
	lea	rax, 48[rbp]
	mov	r9d, edx
	lea	r8, .LC80[rip]
	mov	edx, 20
	mov	rcx, rax
	call	snprintf
	mov	edx, DWORD PTR 65772[rbp]
	lea	rax, 48[rbp]
	mov	rcx, QWORD PTR 66592[rbp]
	mov	r8d, edx
	mov	rdx, rax
	call	TTF_RenderText_Solid
	mov	QWORD PTR 65976[rbp], rax
	mov	rdx, QWORD PTR 65976[rbp]
	mov	rax, QWORD PTR 66624[rbp]
	mov	rcx, rax
	call	SDL_CreateTextureFromSurface
	mov	QWORD PTR 65968[rbp], rax
	mov	DWORD PTR 32[rbp], 10
	mov	DWORD PTR 36[rbp], 720
	mov	rax, QWORD PTR 65976[rbp]
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR 40[rbp], eax
	mov	rax, QWORD PTR 65976[rbp]
	mov	eax, DWORD PTR 20[rax]
	mov	DWORD PTR 44[rbp], eax
	lea	rcx, 32[rbp]
	mov	rdx, QWORD PTR 65968[rbp]
	mov	rax, QWORD PTR 66624[rbp]
	mov	r9, rcx
	mov	r8d, 0
	mov	rcx, rax
	call	SDL_RenderCopy
	mov	rax, QWORD PTR 65976[rbp]
	mov	rcx, rax
	call	SDL_FreeSurface
	mov	rax, QWORD PTR 65968[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66624[rbp]
	mov	rcx, rax
	call	SDL_RenderPresent
	mov	ecx, 16
	call	SDL_Delay
.L163:
	cmp	DWORD PTR 66780[rbp], 0
	jne	.L164
	lea	rcx, .LC81[rip]
	call	puts
	lea	rax, waterParticles[rip]
	mov	rax, QWORD PTR [rax]
	mov	rcx, rax
	call	free
	mov	rax, QWORD PTR 66592[rbp]
	mov	rcx, rax
	call	TTF_CloseFont
	mov	rax, QWORD PTR 66568[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66560[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66552[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66544[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66536[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66424[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66416[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66520[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66360[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66352[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66344[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66512[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66496[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66400[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66528[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66384[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	call	IMG_Quit
	mov	eax, DWORD PTR 66372[rbp]
	mov	ecx, eax
	call	SDL_CloseAudioDevice
	mov	rax, QWORD PTR 104[rbp]
	mov	rcx, rax
	call	SDL_FreeWAV
	mov	rax, QWORD PTR 66624[rbp]
	mov	rcx, rax
	call	SDL_DestroyRenderer
	mov	rax, QWORD PTR 66632[rbp]
	mov	rcx, rax
	call	SDL_DestroyWindow
	call	SDL_Quit
	mov	ecx, 500
	call	SDL_Delay
	mov	eax, 0
	jmp	.L147
.L152:
	call	SDL_GetError
	mov	rsi, rax
	mov	rbx, QWORD PTR 66696[rbp]
	mov	ecx, 2
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	r9, rsi
	mov	r8, rbx
	lea	rdx, .LC82[rip]
	mov	rcx, rax
	call	fprintf
	call	SDL_Quit
	mov	ecx, 1
	call	exit
.L147:
	mov	rsp, r12
	jmp	.L145
.L161:
	mov	rsp, r12
.L145:
	movaps	xmm6, XMMWORD PTR 66816[rbp]
	movaps	xmm7, XMMWORD PTR 66832[rbp]
	lea	rsp, 66856[rbp]
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
.LC13:
	.long	-858993459
	.long	1073532108
	.align 8
.LC14:
	.long	0
	.long	1077936128
	.align 8
.LC68:
	.long	0
	.long	1076887552
	.align 8
.LC70:
	.long	0
	.long	1070596096
	.align 8
.LC71:
	.long	-1717986918
	.long	1069128089
	.align 8
.LC72:
	.long	858993459
	.long	1070805811
	.align 4
.LC74:
	.long	1097859072
	.align 4
.LC75:
	.long	1084227584
	.align 8
.LC76:
	.long	0
	.long	1079164928
	.align 8
.LC77:
	.long	0
	.long	1079410688
	.align 8
.LC78:
	.long	0
	.long	1081073664
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
