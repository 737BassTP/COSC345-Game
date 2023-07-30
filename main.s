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
	lea	rbp, 128[rsp]
	.seh_setframe	rbp, 128
	.seh_endprologue
	mov	rbx, rcx
	mov	rcx, QWORD PTR [rbx]
	mov	rbx, QWORD PTR 8[rbx]
	mov	QWORD PTR -112[rbp], rcx
	mov	QWORD PTR -104[rbp], rbx
	mov	rbx, rdx
	mov	rax, QWORD PTR [rbx]
	mov	rdx, QWORD PTR 8[rbx]
	mov	QWORD PTR -128[rbp], rax
	mov	QWORD PTR -120[rbp], rdx
	mov	edx, DWORD PTR -112[rbp]
	mov	ecx, DWORD PTR -128[rbp]
	mov	eax, DWORD PTR -120[rbp]
	add	eax, ecx
	cmp	edx, eax
	jge	.L136
	mov	edx, DWORD PTR -112[rbp]
	mov	eax, DWORD PTR -104[rbp]
	add	edx, eax
	mov	eax, DWORD PTR -128[rbp]
	cmp	edx, eax
	jle	.L136
	mov	edx, DWORD PTR -108[rbp]
	mov	ecx, DWORD PTR -124[rbp]
	mov	eax, DWORD PTR -116[rbp]
	add	eax, ecx
	cmp	edx, eax
	jge	.L136
	mov	edx, DWORD PTR -108[rbp]
	mov	eax, DWORD PTR -100[rbp]
	add	edx, eax
	mov	eax, DWORD PTR -124[rbp]
	cmp	edx, eax
	jle	.L136
	mov	eax, 1
	jmp	.L138
.L136:
	mov	eax, 0
.L138:
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
	jne	.L140
	mov	rax, QWORD PTR 16[rbp]
	mov	eax, DWORD PTR 32[rax]
	sub	DWORD PTR -8[rbp], eax
	jmp	.L141
.L140:
	mov	rax, QWORD PTR 16[rbp]
	movzx	eax, BYTE PTR 16[rax]
	cmp	al, 1
	jne	.L142
	mov	rax, QWORD PTR 16[rbp]
	mov	eax, DWORD PTR 28[rax]
	add	DWORD PTR -4[rbp], eax
	jmp	.L141
.L142:
	mov	rax, QWORD PTR 16[rbp]
	movzx	eax, BYTE PTR 16[rax]
	cmp	al, 2
	jne	.L143
	mov	rax, QWORD PTR 16[rbp]
	mov	eax, DWORD PTR 32[rax]
	add	DWORD PTR -8[rbp], eax
	jmp	.L141
.L143:
	mov	rax, QWORD PTR 16[rbp]
	movzx	eax, BYTE PTR 16[rax]
	cmp	al, 3
	jne	.L141
	mov	rax, QWORD PTR 16[rbp]
	mov	eax, DWORD PTR 28[rax]
	sub	DWORD PTR -4[rbp], eax
.L141:
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
	je	.L147
	lea	rax, -16[rbp]
	mov	rdx, rax
	mov	rcx, QWORD PTR 16[rbp]
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
	je	.L147
	lea	rcx, .LC13[rip]
	call	puts
	mov	rax, QWORD PTR globalEnemy[rip]
	mov	ecx, DWORD PTR 16[rax]
	mov	rax, QWORD PTR 16[rbp]
	mov	edx, DWORD PTR 24[rax]
	mov	rax, QWORD PTR globalEnemy[rip]
	sub	ecx, edx
	mov	edx, ecx
	mov	DWORD PTR 16[rax], edx
.L147:
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
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 144
	.seh_stackalloc	144
	movaps	XMMWORD PTR -16[rbp], xmm6
	.seh_savexmm	xmm6, 128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	movss	xmm0, DWORD PTR .LC14[rip]
	movss	DWORD PTR -28[rbp], xmm0
	pxor	xmm0, xmm0
	movss	DWORD PTR -20[rbp], xmm0
	mov	rax, QWORD PTR 32[rbp]
	movzx	eax, BYTE PTR 16[rax]
	test	al, al
	jne	.L149
	pxor	xmm0, xmm0
	movss	DWORD PTR -20[rbp], xmm0
	jmp	.L150
.L149:
	mov	rax, QWORD PTR 32[rbp]
	movzx	eax, BYTE PTR 16[rax]
	cmp	al, 1
	jne	.L151
	movss	xmm0, DWORD PTR .LC16[rip]
	movss	DWORD PTR -20[rbp], xmm0
	jmp	.L150
.L151:
	mov	rax, QWORD PTR 32[rbp]
	movzx	eax, BYTE PTR 16[rax]
	cmp	al, 2
	jne	.L152
	movss	xmm0, DWORD PTR .LC17[rip]
	movss	DWORD PTR -20[rbp], xmm0
	jmp	.L150
.L152:
	mov	rax, QWORD PTR 32[rbp]
	movzx	eax, BYTE PTR 16[rax]
	cmp	al, 3
	jne	.L150
	movss	xmm0, DWORD PTR .LC18[rip]
	movss	DWORD PTR -20[rbp], xmm0
.L150:
	lea	rdx, -60[rbp]
	mov	rcx, QWORD PTR 24[rbp]
	lea	rax, -64[rbp]
	mov	QWORD PTR 32[rsp], rax
	mov	r9, rdx
	mov	r8d, 0
	mov	edx, 0
	call	SDL_QueryTexture
	mov	eax, DWORD PTR -60[rbp]
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	mov	DWORD PTR -60[rbp], eax
	mov	eax, DWORD PTR -64[rbp]
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	mov	DWORD PTR -64[rbp], eax
	movss	xmm0, DWORD PTR .LC19[rip]
	movss	DWORD PTR -32[rbp], xmm0
	mov	DWORD PTR -36[rbp], 20
	mov	DWORD PTR -24[rbp], 0
	jmp	.L153
.L155:
	cvtsi2ss	xmm0, DWORD PTR -24[rbp]
	mulss	xmm0, DWORD PTR -28[rbp]
	movss	xmm1, DWORD PTR -20[rbp]
	addss	xmm0, xmm1
	movss	DWORD PTR -40[rbp], xmm0
	cvtsi2ss	xmm6, DWORD PTR -36[rbp]
	cvtss2sd	xmm1, DWORD PTR -40[rbp]
	movsd	xmm0, QWORD PTR .LC2[rip]
	mulsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC1[rip]
	divsd	xmm0, xmm1
	cvtsd2ss	xmm0, xmm0
	call	cosf
	mulss	xmm0, xmm6
	cvttss2si	eax, xmm0
	mov	DWORD PTR -44[rbp], eax
	cvtsi2ss	xmm6, DWORD PTR -36[rbp]
	cvtss2sd	xmm1, DWORD PTR -40[rbp]
	movsd	xmm0, QWORD PTR .LC2[rip]
	mulsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC1[rip]
	divsd	xmm0, xmm1
	cvtsd2ss	xmm0, xmm0
	call	sinf
	mulss	xmm0, xmm6
	cvttss2si	eax, xmm0
	mov	DWORD PTR -48[rbp], eax
	mov	eax, DWORD PTR -60[rbp]
	add	eax, eax
	cvtsi2ss	xmm0, eax
	mulss	xmm0, DWORD PTR -32[rbp]
	cvttss2si	eax, xmm0
	mov	DWORD PTR -52[rbp], eax
	mov	eax, DWORD PTR -64[rbp]
	add	eax, eax
	cvtsi2ss	xmm0, eax
	mulss	xmm0, DWORD PTR -32[rbp]
	cvttss2si	eax, xmm0
	mov	DWORD PTR -56[rbp], eax
	mov	eax, DWORD PTR -52[rbp]
	mov	DWORD PTR -72[rbp], eax
	mov	eax, DWORD PTR -56[rbp]
	mov	DWORD PTR -68[rbp], eax
	mov	rax, QWORD PTR 32[rbp]
	mov	edx, DWORD PTR [rax]
	mov	eax, DWORD PTR -60[rbp]
	sub	edx, eax
	mov	eax, DWORD PTR -44[rbp]
	add	eax, edx
	add	eax, 120
	mov	DWORD PTR -80[rbp], eax
	mov	rax, QWORD PTR 32[rbp]
	movzx	eax, BYTE PTR 16[rax]
	test	al, al
	jne	.L154
	mov	eax, DWORD PTR -80[rbp]
	add	eax, 20
	mov	DWORD PTR -80[rbp], eax
	mov	eax, DWORD PTR -76[rbp]
	add	eax, 5
	mov	DWORD PTR -76[rbp], eax
.L154:
	mov	rax, QWORD PTR 32[rbp]
	mov	edx, DWORD PTR 4[rax]
	mov	eax, DWORD PTR -64[rbp]
	sub	edx, eax
	mov	eax, DWORD PTR -48[rbp]
	add	eax, edx
	add	eax, 40
	mov	DWORD PTR -76[rbp], eax
	cvtss2sd	xmm0, DWORD PTR -40[rbp]
	lea	rdx, -80[rbp]
	mov	rax, QWORD PTR 24[rbp]
	mov	DWORD PTR 48[rsp], 0
	mov	QWORD PTR 40[rsp], 0
	movsd	QWORD PTR 32[rsp], xmm0
	mov	r9, rdx
	mov	r8d, 0
	mov	rdx, rax
	mov	rcx, QWORD PTR 16[rbp]
	call	SDL_RenderCopyEx
	mov	rcx, QWORD PTR 16[rbp]
	call	SDL_RenderPresent
	mov	ecx, 10
	call	SDL_Delay
	add	DWORD PTR -24[rbp], 1
.L153:
	cmp	DWORD PTR -24[rbp], 7
	jle	.L155
	nop
	movaps	xmm6, XMMWORD PTR -16[rbp]
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
	jb	.L157
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR 12[rax], 0
.L157:
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
	jl	.L163
	mov	eax, DWORD PTR 16[rbp]
	cmp	eax, DWORD PTR -8[rbp]
	jg	.L163
	mov	eax, 1
	jmp	.L165
.L163:
	mov	eax, 0
.L165:
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
.LC102:
	.ascii "Score: %d\0"
.LC103:
	.ascii "...exited main loop.\0"
.LC104:
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
	mov	eax, 67432
	call	___chkstk_ms
	sub	rsp, rax
	.seh_stackalloc	67432
	lea	rbp, 128[rsp]
	.seh_setframe	rbp, 128
	movaps	XMMWORD PTR 67264[rbp], xmm6
	.seh_savexmm	xmm6, 67392
	movaps	XMMWORD PTR 67280[rbp], xmm7
	.seh_savexmm	xmm7, 67408
	.seh_endprologue
	mov	DWORD PTR 67376[rbp], ecx
	mov	QWORD PTR 67384[rbp], rdx
	mov	rax, rsp
	mov	r12, rax
	mov	QWORD PTR 67160[rbp], 256
	mov	rax, QWORD PTR 67160[rbp]
	sub	rax, 1
	mov	QWORD PTR 67152[rbp], rax
	mov	rax, QWORD PTR 67160[rbp]
	mov	r10, rax
	mov	r11d, 0
	mov	rax, QWORD PTR 67160[rbp]
	mov	r8, rax
	mov	r9d, 0
	mov	rax, QWORD PTR 67160[rbp]
	add	rax, 15
	shr	rax, 4
	sal	rax, 4
	call	___chkstk_ms
	sub	rsp, rax
	lea	rax, 80[rsp]
	add	rax, 0
	mov	QWORD PTR 67144[rbp], rax
	mov	BYTE PTR 413[rbp], 2
	mov	BYTE PTR 414[rbp], 28
	mov	BYTE PTR 415[rbp], 1
	lea	rax, 410[rbp]
	mov	rcx, rax
	call	SDL_GetVersion
	movzx	eax, BYTE PTR 415[rbp]
	movzx	ecx, al
	movzx	eax, BYTE PTR 414[rbp]
	movzx	edx, al
	movzx	eax, BYTE PTR 413[rbp]
	movzx	eax, al
	mov	r9d, ecx
	mov	r8d, edx
	mov	edx, eax
	lea	rcx, .LC26[rip]
	call	SDL_Log
	movzx	eax, BYTE PTR 412[rbp]
	movzx	ecx, al
	movzx	eax, BYTE PTR 411[rbp]
	movzx	edx, al
	movzx	eax, BYTE PTR 410[rbp]
	movzx	eax, al
	mov	r9d, ecx
	mov	r8d, edx
	mov	edx, eax
	lea	rcx, .LC27[rip]
	call	SDL_Log
	mov	DWORD PTR 67140[rbp], 1366
	mov	DWORD PTR 67136[rbp], 768
	mov	eax, DWORD PTR 67140[rbp]
	sub	eax, DWORD PTR 67136[rbp]
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	mov	DWORD PTR 67132[rbp], eax
	mov	DWORD PTR 67128[rbp], 0
	mov	eax, DWORD PTR 67136[rbp]
	mov	DWORD PTR 67124[rbp], eax
	mov	eax, DWORD PTR 67136[rbp]
	mov	DWORD PTR 67120[rbp], eax
	mov	edx, DWORD PTR 67132[rbp]
	mov	eax, DWORD PTR 67124[rbp]
	add	eax, edx
	mov	DWORD PTR 67116[rbp], eax
	mov	edx, DWORD PTR 67128[rbp]
	mov	eax, DWORD PTR 67120[rbp]
	add	eax, edx
	mov	DWORD PTR 67112[rbp], eax
	mov	DWORD PTR 67108[rbp], 16
	mov	DWORD PTR 67104[rbp], 16
	mov	eax, DWORD PTR 67108[rbp]
	mov	ecx, eax
	call	sqr
	mov	edi, eax
	mov	eax, DWORD PTR 67136[rbp]
	cdq
	idiv	edi
	mov	DWORD PTR 67100[rbp], eax
	mov	eax, DWORD PTR 67100[rbp]
	mov	DWORD PTR 67096[rbp], eax
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
	jne	.L169
	mov	ecx, 2
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	r9, rax
	mov	r8d, 46
	mov	edx, 1
	lea	rcx, .LC28[rip]
	call	fwrite
	mov	eax, 1
	jmp	.L170
.L169:
	mov	ecx, 0
	call	time
	mov	ecx, eax
	call	srand
	mov	DWORD PTR 67244[rbp], 0
	jmp	.L171
.L172:
	mov	ecx, DWORD PTR 67136[rbp]
	mov	edx, DWORD PTR 67140[rbp]
	mov	eax, DWORD PTR 67244[rbp]
	mov	r8d, ecx
	mov	ecx, eax
	call	createWaterParticle
	add	DWORD PTR 67244[rbp], 1
.L171:
	mov	eax, 100
	cmp	DWORD PTR 67244[rbp], eax
	jl	.L172
	mov	DWORD PTR 67092[rbp], 62001
	mov	eax, DWORD PTR 67092[rbp]
	mov	ecx, eax
	call	SDL_Init
	test	eax, eax
	je	.L173
	call	SDL_GetError
	mov	rdx, rax
	lea	rcx, .LC29[rip]
	call	printf
	mov	eax, -1
	jmp	.L170
.L173:
	mov	edx, DWORD PTR 67140[rbp]
	mov	DWORD PTR 40[rsp], 0
	mov	eax, DWORD PTR 67136[rbp]
	mov	DWORD PTR 32[rsp], eax
	mov	r9d, edx
	mov	r8d, 536805376
	mov	edx, 536805376
	lea	rcx, .LC30[rip]
	call	SDL_CreateWindow
	mov	QWORD PTR 67080[rbp], rax
	cmp	QWORD PTR 67080[rbp], 0
	jne	.L174
	mov	rax, QWORD PTR 67144[rbp]
	mov	rdx, QWORD PTR 67160[rbp]
	lea	r8, .LC31[rip]
	mov	rcx, rax
	call	snprintf
	jmp	.L175
.L174:
	mov	rax, QWORD PTR 67080[rbp]
	mov	r8d, 4
	mov	edx, -1
	mov	rcx, rax
	call	SDL_CreateRenderer
	mov	QWORD PTR 67072[rbp], rax
	cmp	QWORD PTR 67072[rbp], 0
	jne	.L176
	mov	rax, QWORD PTR 67144[rbp]
	mov	rdx, QWORD PTR 67160[rbp]
	lea	r8, .LC32[rip]
	mov	rcx, rax
	call	snprintf
	jmp	.L175
.L176:
	mov	rax, QWORD PTR 67080[rbp]
	mov	rcx, rax
	call	SDL_GetWindowSurface
	mov	QWORD PTR 67064[rbp], rax
	cmp	QWORD PTR 67064[rbp], 0
	jne	.L177
	mov	rax, QWORD PTR 67144[rbp]
	mov	rdx, QWORD PTR 67160[rbp]
	lea	r8, .LC33[rip]
	mov	rcx, rax
	call	snprintf
	jmp	.L175
.L177:
	mov	DWORD PTR 66272[rbp], 800
	mov	DWORD PTR 66276[rbp], 100
	mov	DWORD PTR 66280[rbp], 100
	mov	DWORD PTR 66284[rbp], 100
	movabs	rax, 2338613357913204068
	mov	QWORD PTR 66160[rbp], rax
	movabs	rax, 28542640894207341
	mov	QWORD PTR 66168[rbp], rax
	lea	rdx, 66176[rbp]
	mov	eax, 0
	mov	ecx, 10
	mov	rdi, rdx
	rep stosq
	mov	rdx, rdi
	mov	DWORD PTR [rdx], eax
	add	rdx, 4
	lea	rax, 66160[rbp]
	mov	QWORD PTR 67056[rbp], rax
	lea	rax, 66272[rbp]
	mov	QWORD PTR 67048[rbp], rax
	mov	DWORD PTR 67240[rbp], 0
	mov	DWORD PTR 67044[rbp], 0
	call	TTF_Init
	cmp	eax, -1
	jne	.L178
	call	SDL_GetError
	mov	rdx, rax
	lea	rcx, .LC34[rip]
	call	printf
	mov	eax, 1
	jmp	.L170
.L178:
	mov	edx, 12
	lea	rcx, .LC35[rip]
	call	TTF_OpenFont
	mov	QWORD PTR 67032[rbp], rax
	cmp	QWORD PTR 67032[rbp], 0
	jne	.L179
	call	SDL_GetError
	mov	rdx, rax
	lea	rcx, .LC36[rip]
	call	printf
	mov	eax, 1
	jmp	.L170
.L179:
	mov	DWORD PTR 67028[rbp], 0
	mov	DWORD PTR 67248[rbp], 0
	mov	BYTE PTR 66156[rbp], 0
	mov	BYTE PTR 66157[rbp], 0
	mov	BYTE PTR 66158[rbp], 0
	mov	BYTE PTR 66159[rbp], -1
	mov	rax, QWORD PTR 67080[rbp]
	mov	r8d, 2
	mov	edx, -1
	mov	rcx, rax
	call	SDL_CreateRenderer
	mov	QWORD PTR 67016[rbp], rax
	cmp	QWORD PTR 67072[rbp], 0
	jne	.L180
	call	SDL_GetError
	mov	rdx, rax
	lea	rcx, .LC37[rip]
	call	printf
.L180:
	mov	ecx, 2
	call	IMG_Init
	mov	rax, QWORD PTR 67072[rbp]
	lea	rdx, .LC38[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 67008[rbp], rax
	mov	rax, QWORD PTR 67072[rbp]
	lea	rdx, .LC39[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 67000[rbp], rax
	mov	rax, QWORD PTR 67072[rbp]
	lea	rdx, .LC40[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66992[rbp], rax
	mov	rax, QWORD PTR 67072[rbp]
	lea	rdx, .LC41[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66984[rbp], rax
	mov	rax, QWORD PTR 67072[rbp]
	lea	rdx, .LC42[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66976[rbp], rax
	mov	rax, QWORD PTR 67072[rbp]
	lea	rdx, .LC43[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66968[rbp], rax
	mov	rax, QWORD PTR 67072[rbp]
	lea	rdx, .LC44[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66960[rbp], rax
	mov	rax, QWORD PTR 67072[rbp]
	lea	rdx, .LC45[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66952[rbp], rax
	mov	rax, QWORD PTR 67072[rbp]
	lea	rdx, .LC46[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66944[rbp], rax
	mov	DWORD PTR 66940[rbp], 8
	mov	DWORD PTR 66936[rbp], 24
	mov	rax, QWORD PTR 67072[rbp]
	lea	rdx, .LC47[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66928[rbp], rax
	mov	DWORD PTR 66924[rbp], 1440
	mov	DWORD PTR 67252[rbp], 0
	mov	DWORD PTR 67256[rbp], 0
	mov	DWORD PTR 66920[rbp], 57
	mov	DWORD PTR 66916[rbp], 60
	lea	rax, .LC48[rip]
	mov	QWORD PTR 66904[rbp], rax
	lea	rax, .LC49[rip]
	mov	QWORD PTR 66896[rbp], rax
	lea	rax, .LC50[rip]
	mov	QWORD PTR 66888[rbp], rax
	lea	rax, .LC51[rip]
	mov	QWORD PTR 66880[rbp], rax
	mov	eax, DWORD PTR 67108[rbp]
	mov	ecx, eax
	call	sqr
	mov	DWORD PTR 66876[rbp], eax
	mov	DWORD PTR 66872[rbp], 256
	mov	DWORD PTR 67260[rbp], 0
	lea	rdx, .LC5[rip]
	lea	rcx, .LC8[rip]
	call	fopen
	mov	QWORD PTR 66864[rbp], rax
	mov	DWORD PTR 67236[rbp], 0
	jmp	.L181
.L182:
	mov	eax, DWORD PTR 67236[rbp]
	cdqe
	mov	BYTE PTR 608[rbp+rax], 0
	add	DWORD PTR 67236[rbp], 1
.L181:
	mov	eax, DWORD PTR 66876[rbp]
	imul	eax, DWORD PTR 66872[rbp]
	cmp	DWORD PTR 67236[rbp], eax
	jl	.L182
	mov	rdx, QWORD PTR 66864[rbp]
	lea	rax, 608[rbp]
	mov	r9, rdx
	mov	r8d, 1
	mov	edx, 65536
	mov	rcx, rax
	call	fread
	mov	rax, QWORD PTR 66864[rbp]
	mov	rcx, rax
	call	fclose
	mov	rax, QWORD PTR 67072[rbp]
	lea	rdx, .LC52[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66856[rbp], rax
	mov	rax, QWORD PTR 67072[rbp]
	lea	rdx, .LC53[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66848[rbp], rax
	lea	rax, 592[rbp]
	mov	ecx, DWORD PTR 67260[rbp]
	mov	rdx, rax
	call	level_get_name
	mov	edx, DWORD PTR 67260[rbp]
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
	mov	eax, DWORD PTR 67260[rbp]
	lea	edx, 31[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 5
	mov	edx, ecx
	cdqe
	mov	DWORD PTR 560[rbp+rax*4], edx
	mov	DWORD PTR 66844[rbp], 0
	mov	DWORD PTR 66840[rbp], 10
	mov	eax, 42
	mov	BYTE PTR 558[rbp], al
	mov	rax, QWORD PTR 67072[rbp]
	lea	rdx, .LC54[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66832[rbp], rax
	mov	BYTE PTR 66831[rbp], -128
	mov	eax, DWORD PTR 67100[rbp]
	imul	eax, DWORD PTR 67104[rbp]
	lea	edx, 0[0+rax*8]
	mov	eax, DWORD PTR 67132[rbp]
	add	eax, edx
	mov	DWORD PTR 512[rbp], eax
	mov	eax, DWORD PTR 67096[rbp]
	imul	eax, DWORD PTR 67104[rbp]
	lea	edx, 0[0+rax*8]
	mov	eax, DWORD PTR 67128[rbp]
	add	eax, edx
	mov	DWORD PTR 516[rbp], eax
	mov	BYTE PTR 528[rbp], 0
	mov	BYTE PTR 529[rbp], 0
	mov	BYTE PTR 530[rbp], 1
	mov	BYTE PTR 531[rbp], 12
	mov	BYTE PTR 532[rbp], 0
	mov	BYTE PTR 533[rbp], 2
	mov	BYTE PTR 534[rbp], 12
	mov	DWORD PTR 544[rbp], 50
	mov	DWORD PTR 540[rbp], 100
	mov	DWORD PTR 536[rbp], 50
	lea	rax, 480[rbp]
	mov	DWORD PTR 48[rsp], 10
	mov	DWORD PTR 40[rsp], 100
	mov	DWORD PTR 32[rsp], 100
	mov	r9d, 100
	mov	r8d, 500
	mov	edx, 500
	mov	rcx, rax
	call	initEnemy
	lea	rax, 480[rbp]
	mov	QWORD PTR globalEnemy[rip], rax
	mov	rax, QWORD PTR 67072[rbp]
	lea	rdx, .LC55[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66816[rbp], rax
	lea	rax, .LC56[rip]
	mov	QWORD PTR 66808[rbp], rax
	mov	rax, QWORD PTR 66808[rbp]
	lea	rdx, .LC5[rip]
	mov	rcx, rax
	call	SDL_RWFromFile
	mov	r10, rax
	lea	rcx, 440[rbp]
	lea	rdx, 448[rbp]
	lea	rax, 436[rbp]
	mov	QWORD PTR 32[rsp], rax
	mov	r9, rcx
	mov	r8, rdx
	mov	edx, 1
	mov	rcx, r10
	call	SDL_LoadWAV_RW
	test	rax, rax
	jne	.L183
	call	SDL_GetError
	mov	rdx, rax
	lea	rcx, .LC57[rip]
	call	printf
	jmp	.L184
.L183:
	mov	rax, QWORD PTR 440[rbp]
	mov	QWORD PTR 416[rbp], rax
	mov	eax, DWORD PTR 436[rbp]
	mov	DWORD PTR 424[rbp], eax
	mov	DWORD PTR 428[rbp], 0
	lea	rax, audioCallback[rip]
	mov	QWORD PTR 464[rbp], rax
	lea	rax, 416[rbp]
	mov	QWORD PTR 472[rbp], rax
	lea	rax, 448[rbp]
	mov	DWORD PTR 32[rsp], 0
	mov	r9d, 0
	mov	r8, rax
	mov	edx, 0
	mov	ecx, 0
	call	SDL_OpenAudioDevice
	mov	DWORD PTR 66804[rbp], eax
	cmp	DWORD PTR 66804[rbp], 0
	jne	.L185
	call	SDL_GetError
	mov	rdx, rax
	lea	rcx, .LC58[rip]
	call	printf
	mov	rax, QWORD PTR 440[rbp]
	mov	rcx, rax
	call	SDL_FreeWAV
	jmp	.L184
.L185:
	mov	ecx, DWORD PTR 436[rbp]
	mov	rdx, QWORD PTR 440[rbp]
	mov	eax, DWORD PTR 66804[rbp]
	mov	r8d, ecx
	mov	ecx, eax
	call	SDL_QueueAudio
	mov	eax, DWORD PTR 66804[rbp]
	mov	edx, 0
	mov	ecx, eax
	call	SDL_PauseAudioDevice
	mov	DWORD PTR 67232[rbp], 1
	mov	rax, QWORD PTR 67072[rbp]
	lea	rdx, .LC59[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66792[rbp], rax
	mov	rax, QWORD PTR 67072[rbp]
	lea	rdx, .LC60[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66784[rbp], rax
	mov	rax, QWORD PTR 67072[rbp]
	lea	rdx, .LC61[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 66776[rbp], rax
	lea	rax, .LC62[rip]
	mov	QWORD PTR 66768[rbp], rax
	lea	rax, .LC63[rip]
	mov	QWORD PTR 66760[rbp], rax
	mov	rax, QWORD PTR 66768[rbp]
	mov	rcx, rax
	call	strlen
	mov	DWORD PTR 66756[rbp], eax
	mov	rax, QWORD PTR 66760[rbp]
	mov	rcx, rax
	call	strlen
	mov	DWORD PTR 66752[rbp], eax
	mov	DWORD PTR 67228[rbp], 1
	lea	rcx, .LC64[rip]
	call	puts
	jmp	.L186
.L233:
	mov	eax, DWORD PTR 66288[rbp]
	cmp	eax, 768
	je	.L188
	cmp	eax, 769
	je	.L189
	cmp	eax, 256
	jne	.L187
	mov	DWORD PTR 67228[rbp], 0
	jmp	.L187
.L188:
	mov	DWORD PTR 66748[rbp], 1
	mov	eax, DWORD PTR 66308[rbp]
	cmp	eax, 54
	je	.L190
	cmp	eax, 54
	jg	.L191
	cmp	eax, 49
	je	.L192
	cmp	eax, 49
	jg	.L193
	cmp	eax, 32
	je	.L194
	cmp	eax, 48
	je	.L195
	cmp	eax, 27
	je	.L196
	jmp	.L187
.L193:
	cmp	eax, 51
	je	.L198
	cmp	eax, 51
	jl	.L199
	cmp	eax, 52
	je	.L200
	cmp	eax, 53
	je	.L201
	jmp	.L187
.L191:
	cmp	eax, 1073741903
	je	.L202
	cmp	eax, 1073741903
	jg	.L203
	cmp	eax, 56
	je	.L204
	cmp	eax, 56
	jl	.L205
	cmp	eax, 57
	je	.L206
	cmp	eax, 1073741883
	je	.L207
	jmp	.L187
.L203:
	cmp	eax, 1073741905
	je	.L208
	cmp	eax, 1073741905
	jl	.L209
	cmp	eax, 1073741906
	je	.L210
	cmp	eax, 1073741912
	je	.L211
	jmp	.L187
.L196:
	mov	DWORD PTR 67228[rbp], 0
	jmp	.L197
.L202:
	mov	eax, DWORD PTR 66748[rbp]
	mov	DWORD PTR glob_vk_right[rip], eax
	jmp	.L197
.L209:
	mov	eax, DWORD PTR 66748[rbp]
	mov	DWORD PTR glob_vk_left[rip], eax
	jmp	.L197
.L210:
	mov	eax, DWORD PTR 66748[rbp]
	mov	DWORD PTR glob_vk_up[rip], eax
	jmp	.L197
.L208:
	mov	eax, DWORD PTR 66748[rbp]
	mov	DWORD PTR glob_vk_down[rip], eax
	jmp	.L197
.L194:
	mov	eax, DWORD PTR 66748[rbp]
	mov	DWORD PTR glob_vk_space[rip], eax
	jmp	.L197
.L211:
	mov	eax, DWORD PTR 66748[rbp]
	mov	DWORD PTR glob_vk_enter[rip], eax
	jmp	.L197
.L207:
	mov	eax, DWORD PTR 66748[rbp]
	mov	DWORD PTR glob_vk_f2[rip], eax
	jmp	.L197
.L195:
	mov	eax, DWORD PTR 66748[rbp]
	mov	DWORD PTR glob_vk_0[rip], eax
	jmp	.L197
.L192:
	mov	eax, DWORD PTR 66748[rbp]
	mov	DWORD PTR glob_vk_1[rip], eax
	jmp	.L197
.L199:
	mov	eax, DWORD PTR 66748[rbp]
	mov	DWORD PTR glob_vk_2[rip], eax
	jmp	.L197
.L198:
	mov	eax, DWORD PTR 66748[rbp]
	mov	DWORD PTR glob_vk_3[rip], eax
	jmp	.L197
.L200:
	mov	eax, DWORD PTR 66748[rbp]
	mov	DWORD PTR glob_vk_4[rip], eax
	jmp	.L197
.L201:
	mov	eax, DWORD PTR 66748[rbp]
	mov	DWORD PTR glob_vk_5[rip], eax
	jmp	.L197
.L190:
	mov	eax, DWORD PTR 66748[rbp]
	mov	DWORD PTR glob_vk_6[rip], eax
	jmp	.L197
.L205:
	mov	eax, DWORD PTR 66748[rbp]
	mov	DWORD PTR glob_vk_7[rip], eax
	jmp	.L197
.L204:
	mov	eax, DWORD PTR 66748[rbp]
	mov	DWORD PTR glob_vk_8[rip], eax
	jmp	.L197
.L206:
	mov	eax, DWORD PTR 66748[rbp]
	mov	DWORD PTR glob_vk_9[rip], eax
	nop
.L197:
	jmp	.L187
.L189:
	mov	DWORD PTR 66744[rbp], 0
	mov	eax, DWORD PTR 66308[rbp]
	cmp	eax, 55
	je	.L212
	cmp	eax, 55
	jg	.L213
	cmp	eax, 50
	je	.L214
	cmp	eax, 50
	jg	.L215
	cmp	eax, 48
	je	.L216
	cmp	eax, 48
	jg	.L217
	cmp	eax, 32
	je	.L218
	jmp	.L331
.L215:
	cmp	eax, 52
	je	.L220
	cmp	eax, 52
	jl	.L221
	cmp	eax, 53
	je	.L222
	cmp	eax, 54
	je	.L223
	jmp	.L331
.L213:
	cmp	eax, 1073741903
	je	.L224
	cmp	eax, 1073741903
	jg	.L225
	cmp	eax, 57
	je	.L226
	cmp	eax, 57
	jl	.L227
	cmp	eax, 1073741883
	je	.L228
	jmp	.L331
.L225:
	cmp	eax, 1073741905
	je	.L229
	cmp	eax, 1073741905
	jl	.L230
	cmp	eax, 1073741906
	je	.L231
	cmp	eax, 1073741912
	je	.L232
	jmp	.L331
.L224:
	mov	eax, DWORD PTR 66744[rbp]
	mov	DWORD PTR glob_vk_right[rip], eax
	jmp	.L219
.L230:
	mov	eax, DWORD PTR 66744[rbp]
	mov	DWORD PTR glob_vk_left[rip], eax
	jmp	.L219
.L231:
	mov	eax, DWORD PTR 66744[rbp]
	mov	DWORD PTR glob_vk_up[rip], eax
	jmp	.L219
.L229:
	mov	eax, DWORD PTR 66744[rbp]
	mov	DWORD PTR glob_vk_down[rip], eax
	jmp	.L219
.L218:
	mov	eax, DWORD PTR 66744[rbp]
	mov	DWORD PTR glob_vk_space[rip], eax
	jmp	.L219
.L232:
	mov	eax, DWORD PTR 66744[rbp]
	mov	DWORD PTR glob_vk_enter[rip], eax
	jmp	.L219
.L228:
	mov	eax, DWORD PTR 66744[rbp]
	mov	DWORD PTR glob_vk_f2[rip], eax
	jmp	.L219
.L216:
	mov	eax, DWORD PTR 66744[rbp]
	mov	DWORD PTR glob_vk_0[rip], eax
	jmp	.L219
.L217:
	mov	eax, DWORD PTR 66744[rbp]
	mov	DWORD PTR glob_vk_1[rip], eax
	jmp	.L219
.L214:
	mov	eax, DWORD PTR 66744[rbp]
	mov	DWORD PTR glob_vk_2[rip], eax
	jmp	.L219
.L221:
	mov	eax, DWORD PTR 66744[rbp]
	mov	DWORD PTR glob_vk_3[rip], eax
	jmp	.L219
.L220:
	mov	eax, DWORD PTR 66744[rbp]
	mov	DWORD PTR glob_vk_4[rip], eax
	jmp	.L219
.L222:
	mov	eax, DWORD PTR 66744[rbp]
	mov	DWORD PTR glob_vk_5[rip], eax
	jmp	.L219
.L223:
	mov	eax, DWORD PTR 66744[rbp]
	mov	DWORD PTR glob_vk_6[rip], eax
	jmp	.L219
.L212:
	mov	eax, DWORD PTR 66744[rbp]
	mov	DWORD PTR glob_vk_7[rip], eax
	jmp	.L219
.L227:
	mov	eax, DWORD PTR 66744[rbp]
	mov	DWORD PTR glob_vk_8[rip], eax
	jmp	.L219
.L226:
	mov	eax, DWORD PTR 66744[rbp]
	mov	DWORD PTR glob_vk_9[rip], eax
	nop
.L219:
.L331:
	nop
.L187:
	lea	rax, 66288[rbp]
	mov	rcx, rax
	call	SDL_PollEvent
	test	eax, eax
	jne	.L233
	mov	eax, DWORD PTR glob_vk_f2[rip]
	test	eax, eax
	je	.L234
	lea	rcx, .LC65[rip]
	call	puts
	call	dev_tiled_to_leveldata
	lea	rcx, .LC66[rip]
	call	puts
.L234:
	mov	eax, DWORD PTR glob_vk_7[rip]
	test	eax, eax
	je	.L235
	mov	DWORD PTR glob_vk_7[rip], 0
	lea	rax, 512[rbp]
	mov	rcx, rax
	call	attack
	lea	rcx, 512[rbp]
	mov	rdx, QWORD PTR 66992[rbp]
	mov	rax, QWORD PTR 67072[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	renderWeaponSwing
.L235:
	mov	eax, DWORD PTR glob_vk_8[rip]
	test	eax, eax
	je	.L236
	mov	DWORD PTR glob_vk_8[rip], 0
	movzx	eax, BYTE PTR quizOn[rip]
	xor	eax, 1
	test	al, al
	je	.L237
	mov	BYTE PTR quizOn[rip], 1
	mov	DWORD PTR quizOn1[rip], 1
	lea	rcx, .LC67[rip]
	call	printf
	jmp	.L236
.L237:
	mov	BYTE PTR quizOn[rip], 0
	mov	DWORD PTR quizOn1[rip], 0
.L236:
	mov	eax, DWORD PTR glob_vk_0[rip]
	test	eax, eax
	je	.L238
	mov	DWORD PTR glob_vk_0[rip], 0
	mov	eax, DWORD PTR waterOn[rip]
	test	eax, eax
	jne	.L239
	mov	DWORD PTR waterOn[rip], 1
	call	activateAllWaterParticles
	jmp	.L238
.L239:
	mov	DWORD PTR waterOn[rip], 0
	call	deactivateAllWaterParticles
.L238:
	mov	eax, DWORD PTR glob_vk_9[rip]
	test	eax, eax
	je	.L240
	mov	DWORD PTR glob_vk_9[rip], 0
	cmp	DWORD PTR 67240[rbp], 0
	jne	.L241
	mov	DWORD PTR 67240[rbp], 1
	lea	rax, 66160[rbp]
	movabs	rdi, 3184362091757007472
	mov	QWORD PTR [rax], rdi
	mov	DWORD PTR 8[rax], 741551154
	mov	WORD PTR 12[rax], 52
	jmp	.L240
.L241:
	mov	DWORD PTR 67240[rbp], 0
.L240:
	mov	eax, DWORD PTR glob_vk_1[rip]
	test	eax, eax
	je	.L242
	mov	DWORD PTR glob_vk_1[rip], 0
	cmp	DWORD PTR 67240[rbp], 1
	jne	.L243
	lea	rax, .LC68[rip]
	mov	QWORD PTR 66736[rbp], rax
	mov	QWORD PTR 66728[rbp], 99
	mov	rcx, QWORD PTR 66728[rbp]
	mov	rdx, QWORD PTR 66736[rbp]
	lea	rax, 66160[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	strncpy
	lea	rax, 66160[rbp]
	mov	rdx, QWORD PTR 66728[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	add	DWORD PTR 67248[rbp], 50
	jmp	.L242
.L243:
	mov	eax, DWORD PTR quizOn1[rip]
	test	eax, eax
	je	.L242
	mov	DWORD PTR userAnswer[rip], 1
	mov	eax, DWORD PTR userAnswer[rip]
	mov	edx, eax
	lea	rcx, .LC69[rip]
	call	printf
.L242:
	mov	eax, DWORD PTR glob_vk_2[rip]
	test	eax, eax
	je	.L244
	mov	DWORD PTR glob_vk_2[rip], 0
	cmp	DWORD PTR 67240[rbp], 1
	jne	.L245
	lea	rax, .LC70[rip]
	mov	QWORD PTR 66720[rbp], rax
	mov	QWORD PTR 66712[rbp], 99
	mov	rcx, QWORD PTR 66712[rbp]
	mov	rdx, QWORD PTR 66720[rbp]
	lea	rax, 66160[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	strncpy
	lea	rax, 66160[rbp]
	mov	rdx, QWORD PTR 66712[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	add	DWORD PTR 67248[rbp], 50
	jmp	.L244
.L245:
	mov	eax, DWORD PTR quizOn1[rip]
	test	eax, eax
	je	.L244
	mov	DWORD PTR userAnswer[rip], 2
.L244:
	mov	eax, DWORD PTR glob_vk_3[rip]
	test	eax, eax
	je	.L246
	mov	DWORD PTR glob_vk_3[rip], 0
	cmp	DWORD PTR 67240[rbp], 1
	jne	.L247
	lea	rax, .LC71[rip]
	mov	QWORD PTR 66704[rbp], rax
	mov	QWORD PTR 66696[rbp], 99
	mov	rcx, QWORD PTR 66696[rbp]
	mov	rdx, QWORD PTR 66704[rbp]
	lea	rax, 66160[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	strncpy
	lea	rax, 66160[rbp]
	mov	rdx, QWORD PTR 66696[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	add	DWORD PTR 67248[rbp], 50
	jmp	.L246
.L247:
	mov	eax, DWORD PTR quizOn1[rip]
	test	eax, eax
	je	.L246
	mov	DWORD PTR userAnswer[rip], 3
.L246:
	mov	eax, DWORD PTR glob_vk_4[rip]
	test	eax, eax
	je	.L248
	mov	DWORD PTR glob_vk_4[rip], 0
	cmp	DWORD PTR 67240[rbp], 1
	jne	.L248
	lea	rax, .LC72[rip]
	mov	QWORD PTR 66688[rbp], rax
	mov	QWORD PTR 66680[rbp], 99
	mov	rcx, QWORD PTR 66680[rbp]
	mov	rdx, QWORD PTR 66688[rbp]
	lea	rax, 66160[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	strncpy
	lea	rax, 66160[rbp]
	mov	rdx, QWORD PTR 66680[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	add	DWORD PTR 67248[rbp], 50
.L248:
	mov	eax, DWORD PTR glob_vk_5[rip]
	test	eax, eax
	je	.L249
	mov	DWORD PTR glob_vk_5[rip], 0
	mov	ecx, 10
	call	damageMe
.L249:
	mov	eax, DWORD PTR glob_vk_6[rip]
	test	eax, eax
	je	.L250
	mov	DWORD PTR glob_vk_6[rip], 0
	mov	ecx, 10
	call	healMe
.L250:
	mov	eax, DWORD PTR glob_vk_right[rip]
	test	eax, eax
	je	.L251
	mov	BYTE PTR 528[rbp], 0
	mov	edx, DWORD PTR 512[rbp]
	movzx	eax, BYTE PTR 534[rbp]
	movzx	eax, al
	add	eax, edx
	mov	DWORD PTR 512[rbp], eax
.L251:
	mov	eax, DWORD PTR glob_vk_up[rip]
	test	eax, eax
	je	.L252
	mov	BYTE PTR 528[rbp], 1
	mov	edx, DWORD PTR 516[rbp]
	movzx	eax, BYTE PTR 534[rbp]
	movzx	eax, al
	sub	edx, eax
	mov	eax, edx
	mov	DWORD PTR 516[rbp], eax
.L252:
	mov	eax, DWORD PTR glob_vk_left[rip]
	test	eax, eax
	je	.L253
	mov	BYTE PTR 528[rbp], 2
	mov	edx, DWORD PTR 512[rbp]
	movzx	eax, BYTE PTR 534[rbp]
	movzx	eax, al
	sub	edx, eax
	mov	eax, edx
	mov	DWORD PTR 512[rbp], eax
.L253:
	mov	eax, DWORD PTR glob_vk_down[rip]
	test	eax, eax
	je	.L254
	mov	BYTE PTR 528[rbp], 3
	mov	edx, DWORD PTR 516[rbp]
	movzx	eax, BYTE PTR 534[rbp]
	movzx	eax, al
	add	eax, edx
	mov	DWORD PTR 516[rbp], eax
.L254:
	mov	edx, DWORD PTR glob_vk_right[rip]
	mov	eax, DWORD PTR glob_vk_left[rip]
	or	edx, eax
	mov	eax, DWORD PTR glob_vk_up[rip]
	or	edx, eax
	mov	eax, DWORD PTR glob_vk_down[rip]
	or	eax, edx
	test	eax, eax
	je	.L255
	movzx	edx, BYTE PTR 529[rbp]
	movzx	eax, BYTE PTR 530[rbp]
	add	eax, edx
	mov	BYTE PTR 529[rbp], al
	movzx	eax, BYTE PTR 532[rbp]
	movzx	ecx, BYTE PTR 529[rbp]
	movzx	edx, BYTE PTR 531[rbp]
	cmp	cl, dl
	setnb	dl
	add	eax, edx
	mov	BYTE PTR 532[rbp], al
	movzx	eax, BYTE PTR 529[rbp]
	movzx	edx, BYTE PTR 531[rbp]
	movzx	eax, al
	div	dl
	movzx	eax, ah
	mov	BYTE PTR 529[rbp], al
	movzx	eax, BYTE PTR 532[rbp]
	movzx	edx, BYTE PTR 533[rbp]
	movzx	eax, al
	div	dl
	movzx	eax, ah
	mov	BYTE PTR 532[rbp], al
	mov	eax, DWORD PTR 67104[rbp]
	imul	eax, DWORD PTR 67100[rbp]
	mov	edx, DWORD PTR 67116[rbp]
	sub	edx, eax
	mov	eax, edx
	mov	DWORD PTR 66676[rbp], eax
	mov	eax, DWORD PTR 67128[rbp]
	mov	DWORD PTR 66672[rbp], eax
	mov	eax, DWORD PTR 67132[rbp]
	mov	DWORD PTR 66668[rbp], eax
	mov	eax, DWORD PTR 67104[rbp]
	imul	eax, DWORD PTR 67096[rbp]
	mov	edx, DWORD PTR 67112[rbp]
	sub	edx, eax
	mov	eax, edx
	mov	DWORD PTR 66664[rbp], eax
	mov	DWORD PTR 66660[rbp], 0
	mov	eax, DWORD PTR 512[rbp]
	cmp	DWORD PTR 66676[rbp], eax
	jl	.L256
	mov	eax, DWORD PTR 516[rbp]
	cmp	DWORD PTR 66664[rbp], eax
	jl	.L256
	mov	eax, DWORD PTR 512[rbp]
	cmp	DWORD PTR 66668[rbp], eax
	jg	.L256
	mov	eax, DWORD PTR 516[rbp]
	cmp	DWORD PTR 66672[rbp], eax
	jle	.L257
.L256:
	mov	eax, 1
	jmp	.L258
.L257:
	mov	eax, 0
.L258:
	mov	DWORD PTR 66660[rbp], eax
	mov	eax, DWORD PTR 512[rbp]
	cmp	DWORD PTR 66676[rbp], eax
	jge	.L259
	mov	eax, DWORD PTR 66668[rbp]
	mov	DWORD PTR 512[rbp], eax
	add	DWORD PTR 67260[rbp], 1
.L259:
	mov	eax, DWORD PTR 516[rbp]
	cmp	DWORD PTR 66672[rbp], eax
	jle	.L260
	mov	eax, DWORD PTR 66664[rbp]
	mov	DWORD PTR 516[rbp], eax
	cvtsi2sd	xmm0, DWORD PTR 66872[rbp]
	call	sqrt
	cvttsd2si	eax, xmm0
	sub	DWORD PTR 67260[rbp], eax
.L260:
	mov	eax, DWORD PTR 512[rbp]
	cmp	DWORD PTR 66668[rbp], eax
	jle	.L261
	mov	eax, DWORD PTR 66676[rbp]
	mov	DWORD PTR 512[rbp], eax
	sub	DWORD PTR 67260[rbp], 1
.L261:
	mov	eax, DWORD PTR 516[rbp]
	cmp	DWORD PTR 66664[rbp], eax
	jge	.L262
	mov	eax, DWORD PTR 66672[rbp]
	mov	DWORD PTR 516[rbp], eax
	cvtsi2sd	xmm0, DWORD PTR 66872[rbp]
	call	sqrt
	cvttsd2si	eax, xmm0
	add	DWORD PTR 67260[rbp], eax
.L262:
	cmp	DWORD PTR 66660[rbp], 0
	je	.L264
	mov	eax, DWORD PTR 66872[rbp]
	add	DWORD PTR 67260[rbp], eax
	mov	eax, DWORD PTR 67260[rbp]
	cdq
	idiv	DWORD PTR 66872[rbp]
	mov	DWORD PTR 67260[rbp], edx
	lea	rax, 592[rbp]
	mov	ecx, DWORD PTR 67260[rbp]
	mov	rdx, rax
	call	level_get_name
	mov	eax, DWORD PTR 67260[rbp]
	lea	edx, 31[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 5
	mov	r9d, eax
	movsx	rax, r9d
	mov	r8d, DWORD PTR 560[rbp+rax*4]
	mov	edx, DWORD PTR 67260[rbp]
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
	mov	DWORD PTR 560[rbp+rax*4], edx
	jmp	.L264
.L255:
	mov	BYTE PTR 529[rbp], 0
	mov	BYTE PTR 532[rbp], 0
.L264:
	mov	edx, DWORD PTR glob_vk_space[rip]
	mov	eax, DWORD PTR glob_vk_enter[rip]
	or	eax, edx
	test	eax, eax
	je	.L265
	mov	DWORD PTR 67232[rbp], 0
.L265:
	mov	eax, DWORD PTR 512[rbp]
	mov	DWORD PTR 520[rbp], eax
	mov	eax, DWORD PTR 516[rbp]
	mov	DWORD PTR 524[rbp], eax
	mov	DWORD PTR 67224[rbp], 0
	jmp	.L266
.L270:
	lea	rax, waterParticles[rip]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR 67224[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	mov	eax, DWORD PTR 12[rax]
	test	eax, eax
	je	.L267
	lea	rax, waterParticles[rip]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR 67224[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	movss	xmm1, DWORD PTR 4[rax]
	lea	rax, waterParticles[rip]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR 67224[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	movss	xmm0, DWORD PTR 8[rax]
	lea	rax, waterParticles[rip]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR 67224[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	addss	xmm0, xmm1
	movss	DWORD PTR 4[rax], xmm0
	lea	rax, waterParticles[rip]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR 67224[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	movss	xmm0, DWORD PTR 4[rax]
	cvtsi2ss	xmm1, DWORD PTR 67136[rbp]
	comiss	xmm0, xmm1
	jbe	.L267
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
	jg	.L269
	lea	rax, waterParticles[rip]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR 67224[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	mov	DWORD PTR 12[rax], 0
	jmp	.L267
.L269:
	mov	ecx, DWORD PTR 67136[rbp]
	mov	edx, DWORD PTR 67140[rbp]
	mov	eax, DWORD PTR 67224[rbp]
	mov	r8d, ecx
	mov	ecx, eax
	call	createWaterParticle
.L267:
	add	DWORD PTR 67224[rbp], 1
.L266:
	mov	eax, 100
	cmp	DWORD PTR 67224[rbp], eax
	jl	.L270
	mov	eax, DWORD PTR 66916[rbp]
	add	DWORD PTR 67256[rbp], eax
	mov	eax, DWORD PTR 67256[rbp]
	cmp	eax, DWORD PTR 66920[rbp]
	setge	al
	movzx	eax, al
	add	DWORD PTR 67252[rbp], eax
	mov	eax, DWORD PTR 67252[rbp]
	cdq
	idiv	DWORD PTR 66924[rbp]
	mov	DWORD PTR 67252[rbp], edx
	mov	eax, DWORD PTR 67256[rbp]
	cdq
	idiv	DWORD PTR 66920[rbp]
	mov	DWORD PTR 67256[rbp], edx
	lea	rdx, 555[rbp]
	lea	rax, 404[rbp]
	mov	rcx, rax
	call	strcpy
	cmp	DWORD PTR 66840[rbp], 0
	js	.L271
	mov	eax, 43
	jmp	.L272
.L271:
	mov	eax, 45
.L272:
	mov	BYTE PTR 404[rbp], al
	mov	ecx, DWORD PTR 66840[rbp]
	mov	edx, 1717986919
	mov	eax, ecx
	imul	edx
	sar	edx, 2
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	add	eax, 48
	mov	BYTE PTR 405[rbp], al
	mov	ecx, DWORD PTR 66840[rbp]
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
	mov	BYTE PTR 406[rbp], al
	mov	eax, 42
	mov	BYTE PTR 407[rbp], al
	cmp	DWORD PTR 66844[rbp], 0
	jne	.L273
	mov	eax, 67
	jmp	.L274
.L273:
	mov	eax, 70
.L274:
	mov	BYTE PTR 408[rbp], al
	mov	edx, 0
	mov	rax, QWORD PTR 67072[rbp]
	mov	rcx, rax
	call	draw_clear
	mov	edx, 16777215
	mov	rax, QWORD PTR 67072[rbp]
	mov	rcx, rax
	call	draw_set_color
	mov	edx, 33023
	mov	ecx, DWORD PTR 67132[rbp]
	mov	rax, QWORD PTR 67072[rbp]
	mov	DWORD PTR 40[rsp], edx
	mov	edx, DWORD PTR 67136[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, ecx
	mov	r8d, 0
	mov	edx, 0
	mov	rcx, rax
	call	draw_rectangle_color
	mov	ecx, DWORD PTR 67132[rbp]
	mov	rax, QWORD PTR 67072[rbp]
	mov	rdx, QWORD PTR 66968[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	edx, DWORD PTR 67136[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, ecx
	mov	r8d, 0
	mov	edx, 0
	mov	rcx, rax
	call	draw_image
	mov	r8d, 8388863
	mov	eax, DWORD PTR 67140[rbp]
	sub	eax, DWORD PTR 67132[rbp]
	mov	ecx, eax
	mov	edx, DWORD PTR 67132[rbp]
	mov	rax, QWORD PTR 67072[rbp]
	mov	DWORD PTR 40[rsp], r8d
	mov	r8d, DWORD PTR 67136[rbp]
	mov	DWORD PTR 32[rsp], r8d
	mov	r9d, ecx
	mov	r8d, 0
	mov	rcx, rax
	call	draw_rectangle_color
	mov	edx, 33023
	mov	eax, DWORD PTR 67140[rbp]
	sub	eax, DWORD PTR 67132[rbp]
	mov	r8d, DWORD PTR 67140[rbp]
	mov	rcx, QWORD PTR 67072[rbp]
	mov	DWORD PTR 40[rsp], edx
	mov	edx, DWORD PTR 67136[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, r8d
	mov	r8d, 0
	mov	edx, eax
	call	draw_rectangle_color
	mov	eax, DWORD PTR 67140[rbp]
	sub	eax, DWORD PTR 67132[rbp]
	mov	r8d, DWORD PTR 67140[rbp]
	mov	rcx, QWORD PTR 67072[rbp]
	mov	rdx, QWORD PTR 66968[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	edx, DWORD PTR 67136[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, r8d
	mov	r8d, 0
	mov	edx, eax
	call	draw_image
	mov	DWORD PTR 66656[rbp], 0
	mov	eax, DWORD PTR 67100[rbp]
	mov	DWORD PTR 66652[rbp], eax
	mov	eax, DWORD PTR 67096[rbp]
	mov	DWORD PTR 66648[rbp], eax
	cmp	DWORD PTR 67232[rbp], 0
	jne	.L275
	mov	eax, DWORD PTR 66936[rbp]
	imul	eax, DWORD PTR 67096[rbp]
	mov	edx, DWORD PTR 66940[rbp]
	imul	edx, DWORD PTR 67100[rbp]
	mov	r8d, edx
	mov	r10d, DWORD PTR 66648[rbp]
	mov	edx, DWORD PTR 66652[rbp]
	mov	rcx, QWORD PTR 67072[rbp]
	mov	r9d, DWORD PTR 66656[rbp]
	mov	DWORD PTR 72[rsp], r9d
	mov	r9d, DWORD PTR 66936[rbp]
	mov	DWORD PTR 64[rsp], r9d
	mov	r9d, DWORD PTR 66940[rbp]
	mov	DWORD PTR 56[rsp], r9d
	lea	r9, .LC73[rip]
	mov	QWORD PTR 48[rsp], r9
	mov	r9, QWORD PTR 66944[rbp]
	mov	QWORD PTR 40[rsp], r9
	mov	DWORD PTR 32[rsp], eax
	mov	r9d, r8d
	mov	r8d, r10d
	call	draw_text_color
	mov	eax, DWORD PTR 66936[rbp]
	imul	eax, DWORD PTR 67096[rbp]
	add	DWORD PTR 66648[rbp], eax
	mov	DWORD PTR 66644[rbp], 200
	mov	DWORD PTR 66640[rbp], 20
	mov	eax, DWORD PTR health[rip]
	imul	eax, DWORD PTR 66644[rbp]
	mov	esi, DWORD PTR maxHealth[rip]
	cdq
	idiv	esi
	mov	DWORD PTR 66636[rbp], eax
	mov	DWORD PTR 66632[rbp], 255
	mov	r9d, 0
	mov	edx, DWORD PTR 66648[rbp]
	mov	eax, DWORD PTR 66640[rbp]
	add	edx, eax
	mov	r8d, DWORD PTR 66644[rbp]
	mov	ecx, DWORD PTR 66648[rbp]
	mov	rax, QWORD PTR 67072[rbp]
	mov	DWORD PTR 40[rsp], r9d
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, r8d
	mov	r8d, ecx
	mov	edx, 0
	mov	rcx, rax
	call	draw_rectangle_color
	mov	edx, DWORD PTR 66648[rbp]
	mov	eax, DWORD PTR 66640[rbp]
	add	edx, eax
	mov	r9d, DWORD PTR 66636[rbp]
	mov	r8d, DWORD PTR 66648[rbp]
	mov	rax, QWORD PTR 67072[rbp]
	mov	ecx, DWORD PTR 66632[rbp]
	mov	DWORD PTR 40[rsp], ecx
	mov	DWORD PTR 32[rsp], edx
	mov	edx, 0
	mov	rcx, rax
	call	draw_rectangle_color
	mov	eax, DWORD PTR 66640[rbp]
	add	DWORD PTR 66648[rbp], eax
	mov	DWORD PTR 66628[rbp], 0
	mov	DWORD PTR 66624[rbp], 32
	mov	DWORD PTR 67220[rbp], 0
	jmp	.L276
.L277:
	add	DWORD PTR 67220[rbp], 1
.L276:
	cmp	DWORD PTR 67220[rbp], 3
	jle	.L277
.L275:
	mov	edx, DWORD PTR 67100[rbp]
	mov	eax, DWORD PTR 67116[rbp]
	add	eax, edx
	mov	DWORD PTR 66652[rbp], eax
	mov	eax, DWORD PTR 67096[rbp]
	mov	DWORD PTR 66648[rbp], eax
	cmp	DWORD PTR 67232[rbp], 0
	jne	.L278
	mov	rax, rsp
	mov	r15, rax
	lea	rax, .LC74[rip]
	mov	QWORD PTR 66616[rbp], rax
	mov	rax, QWORD PTR 66616[rbp]
	mov	rcx, rax
	call	strlen
	mov	rdx, rax
	sub	rdx, 1
	mov	QWORD PTR 66608[rbp], rdx
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
	mov	QWORD PTR 66600[rbp], rax
	mov	rax, QWORD PTR 66600[rbp]
	mov	rdx, QWORD PTR 66616[rbp]
	mov	rcx, rax
	call	strcpy
	mov	eax, DWORD PTR 67260[rbp]
	mov	BYTE PTR 66599[rbp], al
	movzx	eax, BYTE PTR 66599[rbp]
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
	mov	rax, QWORD PTR 66600[rbp]
	mov	rdx, rax
	lea	rcx, .LC75[rip]
	call	string_pos
	mov	ecx, ebx
	mov	rdx, QWORD PTR 66600[rbp]
	cdqe
	mov	BYTE PTR [rdx+rax], cl
	movzx	eax, BYTE PTR 66599[rbp]
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
	mov	rax, QWORD PTR 66600[rbp]
	mov	rdx, rax
	lea	rcx, .LC76[rip]
	call	string_pos
	mov	ecx, ebx
	mov	rdx, QWORD PTR 66600[rbp]
	cdqe
	mov	BYTE PTR [rdx+rax], cl
	movzx	ecx, BYTE PTR 66599[rbp]
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
	mov	rax, QWORD PTR 66600[rbp]
	mov	rdx, rax
	lea	rcx, .LC77[rip]
	call	string_pos
	mov	ecx, ebx
	mov	rdx, QWORD PTR 66600[rbp]
	cdqe
	mov	BYTE PTR [rdx+rax], cl
	mov	r9, QWORD PTR 66600[rbp]
	mov	eax, DWORD PTR 66936[rbp]
	imul	eax, DWORD PTR 67096[rbp]
	mov	edx, DWORD PTR 66940[rbp]
	imul	edx, DWORD PTR 67100[rbp]
	mov	r8d, edx
	mov	r11d, DWORD PTR 66648[rbp]
	mov	edx, DWORD PTR 66652[rbp]
	mov	rcx, QWORD PTR 67072[rbp]
	mov	r10d, DWORD PTR 66656[rbp]
	mov	DWORD PTR 72[rsp], r10d
	mov	r10d, DWORD PTR 66936[rbp]
	mov	DWORD PTR 64[rsp], r10d
	mov	r10d, DWORD PTR 66940[rbp]
	mov	DWORD PTR 56[rsp], r10d
	mov	QWORD PTR 48[rsp], r9
	mov	r9, QWORD PTR 66944[rbp]
	mov	QWORD PTR 40[rsp], r9
	mov	DWORD PTR 32[rsp], eax
	mov	r9d, r8d
	mov	r8d, r11d
	call	draw_text_color
	mov	eax, DWORD PTR 66936[rbp]
	imul	eax, DWORD PTR 67096[rbp]
	mov	edx, DWORD PTR 66940[rbp]
	imul	edx, DWORD PTR 67100[rbp]
	mov	r8d, edx
	mov	edx, DWORD PTR 66936[rbp]
	imul	edx, DWORD PTR 67096[rbp]
	mov	ecx, DWORD PTR 66648[rbp]
	lea	r11d, [rdx+rcx]
	mov	r10d, DWORD PTR 66652[rbp]
	mov	rcx, QWORD PTR 67072[rbp]
	mov	edx, DWORD PTR 66656[rbp]
	mov	DWORD PTR 72[rsp], edx
	mov	edx, DWORD PTR 66936[rbp]
	mov	DWORD PTR 64[rsp], edx
	mov	edx, DWORD PTR 66940[rbp]
	mov	DWORD PTR 56[rsp], edx
	lea	rdx, 592[rbp]
	mov	QWORD PTR 48[rsp], rdx
	mov	rdx, QWORD PTR 66944[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	DWORD PTR 32[rsp], eax
	mov	r9d, r8d
	mov	r8d, r11d
	mov	edx, r10d
	call	draw_text_color
	mov	eax, DWORD PTR 66652[rbp]
	mov	DWORD PTR 66592[rbp], eax
	mov	eax, DWORD PTR 66936[rbp]
	imul	eax, DWORD PTR 67096[rbp]
	lea	edx, [rax+rax]
	mov	eax, DWORD PTR 66648[rbp]
	add	eax, edx
	mov	DWORD PTR 66588[rbp], eax
	mov	eax, DWORD PTR 66592[rbp]
	add	eax, 256
	mov	DWORD PTR 66584[rbp], eax
	mov	eax, DWORD PTR 66588[rbp]
	add	eax, 256
	mov	DWORD PTR 66580[rbp], eax
	mov	r9d, DWORD PTR 66584[rbp]
	mov	r8d, DWORD PTR 66588[rbp]
	mov	edx, DWORD PTR 66592[rbp]
	mov	rax, QWORD PTR 67072[rbp]
	mov	rcx, QWORD PTR 66856[rbp]
	mov	QWORD PTR 40[rsp], rcx
	mov	ecx, DWORD PTR 66580[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_image
	mov	DWORD PTR 67216[rbp], 0
	jmp	.L279
.L281:
	mov	edx, DWORD PTR 67216[rbp]
	mov	eax, edx
	sar	eax, 31
	shr	eax, 27
	add	edx, eax
	and	edx, 31
	sub	edx, eax
	mov	eax, edx
	mov	ecx, eax
	mov	eax, DWORD PTR 67216[rbp]
	lea	edx, 31[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 5
	cdqe
	mov	eax, DWORD PTR 560[rbp+rax*4]
	mov	edx, ecx
	mov	ecx, eax
	call	BG
	test	eax, eax
	jne	.L280
	mov	eax, DWORD PTR 67216[rbp]
	lea	edx, 15[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 4
	add	eax, 1
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC78[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	cvtsi2sd	xmm1, DWORD PTR 66580[rbp]
	cvtsi2sd	xmm0, DWORD PTR 66588[rbp]
	call	lerp
	cvttsd2si	ebx, xmm0
	mov	edx, DWORD PTR 67216[rbp]
	mov	eax, edx
	sar	eax, 31
	shr	eax, 28
	add	edx, eax
	and	edx, 15
	sub	edx, eax
	mov	eax, edx
	add	eax, 1
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC78[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	cvtsi2sd	xmm1, DWORD PTR 66584[rbp]
	cvtsi2sd	xmm0, DWORD PTR 66592[rbp]
	call	lerp
	cvttsd2si	edi, xmm0
	mov	eax, DWORD PTR 67216[rbp]
	lea	edx, 15[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 4
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC78[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	cvtsi2sd	xmm1, DWORD PTR 66580[rbp]
	cvtsi2sd	xmm0, DWORD PTR 66588[rbp]
	call	lerp
	cvttsd2si	esi, xmm0
	mov	edx, DWORD PTR 67216[rbp]
	mov	eax, edx
	sar	eax, 31
	shr	eax, 28
	add	edx, eax
	and	edx, 15
	sub	edx, eax
	mov	eax, edx
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC78[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	cvtsi2sd	xmm1, DWORD PTR 66584[rbp]
	cvtsi2sd	xmm0, DWORD PTR 66592[rbp]
	call	lerp
	cvttsd2si	eax, xmm0
	mov	rcx, QWORD PTR 67072[rbp]
	mov	rdx, QWORD PTR 66848[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	DWORD PTR 32[rsp], ebx
	mov	r9d, edi
	mov	r8d, esi
	mov	edx, eax
	call	draw_image
.L280:
	add	DWORD PTR 67216[rbp], 1
.L279:
	cmp	DWORD PTR 67216[rbp], 255
	jle	.L281
	movzx	eax, BYTE PTR 66599[rbp]
	mov	r8d, 0
	mov	edx, 4
	mov	ecx, eax
	call	BGG
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC78[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	cvtsi2sd	xmm1, DWORD PTR 66584[rbp]
	cvtsi2sd	xmm0, DWORD PTR 66592[rbp]
	call	lerp
	cvttsd2si	eax, xmm0
	mov	DWORD PTR 66576[rbp], eax
	mov	ecx, 255
	mov	eax, DWORD PTR 66576[rbp]
	lea	r9d, 1[rax]
	mov	eax, DWORD PTR 66576[rbp]
	lea	edx, -1[rax]
	mov	r8d, DWORD PTR 66588[rbp]
	mov	rax, QWORD PTR 67072[rbp]
	mov	DWORD PTR 40[rsp], ecx
	mov	ecx, DWORD PTR 66580[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_rectangle_color
	movzx	eax, BYTE PTR 66599[rbp]
	mov	r8d, 1
	mov	edx, 4
	mov	ecx, eax
	call	BGG
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC78[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	cvtsi2sd	xmm1, DWORD PTR 66580[rbp]
	cvtsi2sd	xmm0, DWORD PTR 66588[rbp]
	call	lerp
	cvttsd2si	eax, xmm0
	mov	DWORD PTR 66572[rbp], eax
	mov	r10d, 255
	mov	eax, DWORD PTR 66572[rbp]
	lea	ecx, 1[rax]
	mov	eax, DWORD PTR 66572[rbp]
	lea	r8d, -1[rax]
	mov	r9d, DWORD PTR 66584[rbp]
	mov	edx, DWORD PTR 66592[rbp]
	mov	rax, QWORD PTR 67072[rbp]
	mov	DWORD PTR 40[rsp], r10d
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_rectangle_color
	mov	esi, 255
	movzx	eax, BYTE PTR 66599[rbp]
	mov	r8d, 1
	mov	edx, 4
	mov	ecx, eax
	call	BGG
	add	eax, 1
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC78[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	cvtsi2sd	xmm1, DWORD PTR 66580[rbp]
	cvtsi2sd	xmm0, DWORD PTR 66588[rbp]
	call	lerp
	cvttsd2si	ebx, xmm0
	movzx	eax, BYTE PTR 66599[rbp]
	mov	r8d, 0
	mov	edx, 4
	mov	ecx, eax
	call	BGG
	add	eax, 1
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC78[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	cvtsi2sd	xmm1, DWORD PTR 66584[rbp]
	cvtsi2sd	xmm0, DWORD PTR 66592[rbp]
	call	lerp
	cvttsd2si	ecx, xmm0
	mov	r8d, DWORD PTR 66572[rbp]
	mov	edx, DWORD PTR 66576[rbp]
	mov	rax, QWORD PTR 67072[rbp]
	mov	DWORD PTR 40[rsp], esi
	mov	DWORD PTR 32[rsp], ebx
	mov	r9d, ecx
	mov	rcx, rax
	call	draw_rectangle_color
	mov	DWORD PTR 67212[rbp], 0
	mov	eax, DWORD PTR 67096[rbp]
	sal	eax, 5
	mov	edx, eax
	mov	eax, DWORD PTR 66580[rbp]
	add	eax, edx
	mov	DWORD PTR 66568[rbp], eax
	mov	edx, DWORD PTR 66656[rbp]
	mov	rax, QWORD PTR 67072[rbp]
	mov	rcx, rax
	call	draw_set_color
	mov	DWORD PTR 67208[rbp], 0
	jmp	.L282
.L285:
	mov	ecx, DWORD PTR 67252[rbp]
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
	mov	ecx, DWORD PTR 67252[rbp]
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
	mov	r9d, DWORD PTR 67252[rbp]
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
	mov	r9d, DWORD PTR 67252[rbp]
	mov	edx, 458129845
	mov	eax, r9d
	imul	edx
	sar	edx, 6
	mov	eax, r9d
	sar	eax, 31
	sub	edx, eax
	mov	eax, DWORD PTR 67208[rbp]
	mov	DWORD PTR 40[rsp], r8d
	mov	DWORD PTR 32[rsp], ecx
	mov	r9d, 737
	mov	r8d, r10d
	mov	ecx, eax
	call	mux_int
	mov	DWORD PTR 66564[rbp], eax
	cmp	DWORD PTR 67208[rbp], 2
	je	.L283
	mov	eax, DWORD PTR 66564[rbp]
	sal	eax, 4
	mov	ecx, eax
	mov	eax, DWORD PTR 67208[rbp]
	add	eax, 1
	imul	eax, DWORD PTR 67100[rbp]
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR 66652[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 67212[rbp]
	lea	r9d, [rdx+rax]
	mov	eax, DWORD PTR 67208[rbp]
	imul	eax, DWORD PTR 67100[rbp]
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR 66652[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 67212[rbp]
	add	edx, eax
	mov	r8d, DWORD PTR 66580[rbp]
	mov	rax, QWORD PTR 67072[rbp]
	mov	DWORD PTR 72[rsp], 32
	mov	DWORD PTR 64[rsp], 16
	mov	DWORD PTR 56[rsp], 0
	mov	DWORD PTR 48[rsp], ecx
	mov	rcx, QWORD PTR 66928[rbp]
	mov	QWORD PTR 40[rsp], rcx
	mov	ecx, DWORD PTR 66568[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_image_part
	mov	eax, DWORD PTR 67100[rbp]
	add	DWORD PTR 67212[rbp], eax
	jmp	.L284
.L283:
	mov	eax, DWORD PTR 66936[rbp]
	imul	eax, DWORD PTR 67096[rbp]
	mov	edx, DWORD PTR 66940[rbp]
	imul	edx, DWORD PTR 67100[rbp]
	mov	r8d, edx
	mov	edx, DWORD PTR 67100[rbp]
	mov	ecx, edx
	sal	ecx, 5
	mov	edx, DWORD PTR 66652[rbp]
	add	edx, ecx
	mov	r10d, DWORD PTR 66580[rbp]
	mov	rcx, QWORD PTR 67072[rbp]
	mov	r9d, DWORD PTR 66656[rbp]
	mov	DWORD PTR 72[rsp], r9d
	mov	r9d, DWORD PTR 66936[rbp]
	mov	DWORD PTR 64[rsp], r9d
	mov	r9d, DWORD PTR 66940[rbp]
	mov	DWORD PTR 56[rsp], r9d
	lea	r9, .LC79[rip]
	mov	QWORD PTR 48[rsp], r9
	mov	r9, QWORD PTR 66944[rbp]
	mov	QWORD PTR 40[rsp], r9
	mov	DWORD PTR 32[rsp], eax
	mov	r9d, r8d
	mov	r8d, r10d
	call	draw_text_color
.L284:
	add	DWORD PTR 67208[rbp], 1
.L282:
	cmp	DWORD PTR 67208[rbp], 4
	jle	.L285
	mov	edx, 16777215
	mov	rax, QWORD PTR 67072[rbp]
	mov	rcx, rax
	call	draw_set_color
	mov	DWORD PTR 66560[rbp], 0
	mov	eax, DWORD PTR 67252[rbp]
	mov	DWORD PTR 32[rsp], 59
	mov	r9d, 5
	mov	r8d, 0
	mov	edx, 0
	mov	ecx, eax
	call	clock_is_between
	test	eax, eax
	je	.L286
	mov	DWORD PTR 66560[rbp], 0
.L286:
	mov	eax, DWORD PTR 67252[rbp]
	mov	DWORD PTR 32[rsp], 59
	mov	r9d, 11
	mov	r8d, 0
	mov	edx, 6
	mov	ecx, eax
	call	clock_is_between
	test	eax, eax
	je	.L287
	mov	DWORD PTR 66560[rbp], 1
.L287:
	mov	eax, DWORD PTR 67252[rbp]
	mov	DWORD PTR 32[rsp], 59
	mov	r9d, 17
	mov	r8d, 0
	mov	edx, 12
	mov	ecx, eax
	call	clock_is_between
	test	eax, eax
	je	.L288
	mov	DWORD PTR 66560[rbp], 2
.L288:
	mov	eax, DWORD PTR 67252[rbp]
	mov	DWORD PTR 32[rsp], 59
	mov	r9d, 23
	mov	r8d, 0
	mov	edx, 18
	mov	ecx, eax
	call	clock_is_between
	test	eax, eax
	je	.L289
	mov	DWORD PTR 66560[rbp], 3
.L289:
	mov	edx, DWORD PTR 66568[rbp]
	mov	eax, DWORD PTR 67096[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 66936[rbp]
	imul	eax, DWORD PTR 67096[rbp]
	add	eax, edx
	mov	DWORD PTR 66556[rbp], eax
	mov	edx, DWORD PTR 67096[rbp]
	mov	eax, edx
	add	eax, eax
	add	eax, edx
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR 66556[rbp]
	add	eax, edx
	mov	DWORD PTR 66552[rbp], eax
	mov	eax, DWORD PTR 67100[rbp]
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR 66652[rbp]
	lea	r9d, [rdx+rax]
	mov	r8d, DWORD PTR 66556[rbp]
	mov	edx, DWORD PTR 66652[rbp]
	mov	rax, QWORD PTR 67072[rbp]
	mov	rcx, QWORD PTR 66832[rbp]
	mov	QWORD PTR 40[rsp], rcx
	mov	ecx, DWORD PTR 66552[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_image
	mov	eax, DWORD PTR 66936[rbp]
	imul	eax, DWORD PTR 67096[rbp]
	mov	ebx, eax
	mov	eax, DWORD PTR 66940[rbp]
	imul	eax, DWORD PTR 67100[rbp]
	mov	esi, eax
	cvtsi2sd	xmm1, DWORD PTR 66552[rbp]
	cvtsi2sd	xmm0, DWORD PTR 66556[rbp]
	movsd	xmm2, QWORD PTR .LC80[rip]
	call	lerp
	cvttsd2si	r8d, xmm0
	mov	eax, DWORD PTR 66652[rbp]
	lea	edx, 48[rax]
	mov	rcx, QWORD PTR 67072[rbp]
	mov	eax, DWORD PTR 66656[rbp]
	mov	DWORD PTR 72[rsp], eax
	mov	eax, DWORD PTR 66936[rbp]
	mov	DWORD PTR 64[rsp], eax
	mov	eax, DWORD PTR 66940[rbp]
	mov	DWORD PTR 56[rsp], eax
	lea	rax, 404[rbp]
	mov	QWORD PTR 48[rsp], rax
	mov	rax, QWORD PTR 66944[rbp]
	mov	QWORD PTR 40[rsp], rax
	mov	DWORD PTR 32[rsp], ebx
	mov	r9d, esi
	call	draw_text_color
	mov	rsp, r15
.L278:
	mov	eax, DWORD PTR 67104[rbp]
	mov	DWORD PTR 66548[rbp], eax
	mov	DWORD PTR 67204[rbp], 0
	jmp	.L290
.L300:
	mov	DWORD PTR 67200[rbp], 0
	jmp	.L291
.L299:
	mov	eax, DWORD PTR 67204[rbp]
	imul	eax, DWORD PTR 67108[rbp]
	mov	edx, DWORD PTR 67200[rbp]
	add	eax, edx
	mov	DWORD PTR 66544[rbp], eax
	mov	eax, DWORD PTR 67200[rbp]
	imul	eax, DWORD PTR 67100[rbp]
	imul	eax, DWORD PTR 67104[rbp]
	mov	edx, DWORD PTR 67132[rbp]
	add	eax, edx
	mov	DWORD PTR 66540[rbp], eax
	mov	eax, DWORD PTR 67204[rbp]
	imul	eax, DWORD PTR 67096[rbp]
	imul	eax, DWORD PTR 67104[rbp]
	mov	edx, DWORD PTR 67128[rbp]
	add	eax, edx
	mov	DWORD PTR 66536[rbp], eax
	mov	eax, DWORD PTR 67200[rbp]
	add	eax, 1
	imul	eax, DWORD PTR 67100[rbp]
	imul	eax, DWORD PTR 67104[rbp]
	mov	edx, DWORD PTR 67132[rbp]
	add	eax, edx
	mov	DWORD PTR 66532[rbp], eax
	mov	eax, DWORD PTR 67204[rbp]
	add	eax, 1
	imul	eax, DWORD PTR 67096[rbp]
	imul	eax, DWORD PTR 67104[rbp]
	mov	edx, DWORD PTR 67128[rbp]
	add	eax, edx
	mov	DWORD PTR 66528[rbp], eax
	mov	r9d, 16711680
	mov	r8d, 65280
	mov	r10d, 255
	mov	ecx, DWORD PTR 66544[rbp]
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
	mov	DWORD PTR 66524[rbp], eax
	mov	r9d, DWORD PTR 66532[rbp]
	mov	r8d, DWORD PTR 66536[rbp]
	mov	edx, DWORD PTR 66540[rbp]
	mov	rax, QWORD PTR 67072[rbp]
	mov	ecx, DWORD PTR 66524[rbp]
	mov	DWORD PTR 40[rsp], ecx
	mov	ecx, DWORD PTR 66528[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_rectangle_color
	mov	eax, DWORD PTR 66876[rbp]
	imul	eax, DWORD PTR 67260[rbp]
	mov	edx, DWORD PTR 66544[rbp]
	add	eax, edx
	mov	DWORD PTR 66520[rbp], eax
	mov	eax, DWORD PTR 66520[rbp]
	cdqe
	movzx	eax, BYTE PTR 608[rbp+rax]
	movzx	eax, al
	mov	DWORD PTR 66516[rbp], eax
	cmp	DWORD PTR 66516[rbp], 143
	jle	.L292
	cmp	DWORD PTR 66516[rbp], 159
	jg	.L292
	mov	DWORD PTR 66512[rbp], 16
	cmp	DWORD PTR 66516[rbp], 144
	jne	.L293
	mov	eax, 60
	jmp	.L294
.L293:
	mov	eax, 120
.L294:
	mov	DWORD PTR 66508[rbp], eax
	call	get_timer
	mov	DWORD PTR 66504[rbp], eax
	cmp	DWORD PTR 66516[rbp], 144
	jne	.L295
	mov	rax, QWORD PTR 66992[rbp]
	mov	QWORD PTR 67192[rbp], rax
	jmp	.L296
.L295:
	cmp	DWORD PTR 66516[rbp], 148
	jne	.L297
	mov	rax, QWORD PTR 66984[rbp]
	mov	QWORD PTR 67192[rbp], rax
	jmp	.L296
.L297:
	mov	rax, QWORD PTR 66992[rbp]
	mov	QWORD PTR 67192[rbp], rax
.L296:
	mov	eax, DWORD PTR 66504[rbp]
	cdq
	idiv	DWORD PTR 66508[rbp]
	cdq
	idiv	DWORD PTR 66512[rbp]
	mov	eax, edx
	imul	eax, DWORD PTR 66548[rbp]
	mov	r9d, DWORD PTR 66532[rbp]
	mov	r10d, DWORD PTR 66536[rbp]
	mov	edx, DWORD PTR 66540[rbp]
	mov	rcx, QWORD PTR 67072[rbp]
	mov	r8d, DWORD PTR 66548[rbp]
	mov	DWORD PTR 72[rsp], r8d
	mov	r8d, DWORD PTR 66548[rbp]
	mov	DWORD PTR 64[rsp], r8d
	mov	DWORD PTR 56[rsp], 0
	mov	DWORD PTR 48[rsp], eax
	mov	rax, QWORD PTR 67192[rbp]
	mov	QWORD PTR 40[rsp], rax
	mov	eax, DWORD PTR 66528[rbp]
	mov	DWORD PTR 32[rsp], eax
	mov	r8d, r10d
	call	draw_image_part
	jmp	.L298
.L292:
	mov	eax, DWORD PTR 66516[rbp]
	cdq
	idiv	DWORD PTR 67108[rbp]
	imul	eax, DWORD PTR 66548[rbp]
	mov	ecx, eax
	mov	eax, DWORD PTR 66516[rbp]
	cdq
	idiv	DWORD PTR 67108[rbp]
	mov	eax, edx
	imul	eax, DWORD PTR 66548[rbp]
	mov	r9d, DWORD PTR 66532[rbp]
	mov	r11d, DWORD PTR 66536[rbp]
	mov	edx, DWORD PTR 66540[rbp]
	mov	r10, QWORD PTR 67072[rbp]
	mov	r8d, DWORD PTR 66548[rbp]
	mov	DWORD PTR 72[rsp], r8d
	mov	r8d, DWORD PTR 66548[rbp]
	mov	DWORD PTR 64[rsp], r8d
	mov	DWORD PTR 56[rsp], ecx
	mov	DWORD PTR 48[rsp], eax
	mov	rax, QWORD PTR 66976[rbp]
	mov	QWORD PTR 40[rsp], rax
	mov	eax, DWORD PTR 66528[rbp]
	mov	DWORD PTR 32[rsp], eax
	mov	r8d, r11d
	mov	rcx, r10
	call	draw_image_part
.L298:
	add	DWORD PTR 67200[rbp], 1
.L291:
	mov	eax, DWORD PTR 67200[rbp]
	cmp	eax, DWORD PTR 67108[rbp]
	jl	.L299
	add	DWORD PTR 67204[rbp], 1
.L290:
	mov	eax, DWORD PTR 67204[rbp]
	cmp	eax, DWORD PTR 67108[rbp]
	jl	.L300
	movzx	eax, BYTE PTR 528[rbp]
	movzx	eax, al
	imul	eax, DWORD PTR 66548[rbp]
	mov	edx, eax
	movzx	eax, BYTE PTR 533[rbp]
	movzx	eax, al
	imul	edx, eax
	movzx	eax, BYTE PTR 532[rbp]
	movzx	eax, al
	imul	eax, DWORD PTR 66548[rbp]
	lea	r8d, [rdx+rax]
	mov	edx, DWORD PTR 516[rbp]
	mov	eax, DWORD PTR 66548[rbp]
	imul	eax, DWORD PTR 67096[rbp]
	lea	ecx, [rdx+rax]
	mov	edx, DWORD PTR 512[rbp]
	mov	eax, DWORD PTR 66548[rbp]
	imul	eax, DWORD PTR 67100[rbp]
	lea	r11d, [rdx+rax]
	mov	r10d, DWORD PTR 516[rbp]
	mov	edx, DWORD PTR 512[rbp]
	mov	rax, QWORD PTR 67072[rbp]
	mov	r9d, DWORD PTR 66548[rbp]
	mov	DWORD PTR 72[rsp], r9d
	mov	r9d, DWORD PTR 66548[rbp]
	mov	DWORD PTR 64[rsp], r9d
	mov	DWORD PTR 56[rsp], 0
	mov	DWORD PTR 48[rsp], r8d
	mov	r8, QWORD PTR 66952[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r9d, r11d
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_image_part
	cmp	DWORD PTR 67240[rbp], 0
	jle	.L301
	mov	eax, DWORD PTR 512[rbp]
	add	eax, 60
	mov	DWORD PTR 66272[rbp], eax
	mov	eax, DWORD PTR 516[rbp]
	sub	eax, 120
	mov	DWORD PTR 66276[rbp], eax
	mov	rax, QWORD PTR 67072[rbp]
	mov	DWORD PTR 32[rsp], 255
	mov	r9d, 255
	mov	r8d, 255
	mov	edx, 255
	mov	rcx, rax
	call	SDL_SetRenderDrawColor
	mov	rdx, QWORD PTR 67048[rbp]
	mov	rax, QWORD PTR 67072[rbp]
	mov	rcx, rax
	call	SDL_RenderFillRect
	mov	rax, QWORD PTR 67072[rbp]
	mov	DWORD PTR 32[rsp], 255
	mov	r9d, 255
	mov	r8d, 255
	mov	edx, 255
	mov	rcx, rax
	call	SDL_SetRenderDrawColor
	mov	rax, QWORD PTR 67048[rbp]
	mov	ecx, DWORD PTR 4[rax]
	mov	rax, QWORD PTR 67048[rbp]
	mov	eax, DWORD PTR 12[rax]
	lea	edx, 3[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 2
	lea	r8d, [rcx+rax]
	mov	rax, QWORD PTR 67048[rbp]
	mov	eax, DWORD PTR [rax]
	cvtsi2sd	xmm1, eax
	mov	rax, QWORD PTR 67048[rbp]
	mov	eax, DWORD PTR 8[rax]
	cvtsi2sd	xmm2, eax
	movsd	xmm0, QWORD PTR .LC81[rip]
	mulsd	xmm0, xmm2
	addsd	xmm0, xmm1
	cvttsd2si	ecx, xmm0
	mov	eax, DWORD PTR 516[rbp]
	lea	r10d, -15[rax]
	mov	eax, DWORD PTR 512[rbp]
	lea	edx, 45[rax]
	mov	rax, QWORD PTR 67072[rbp]
	mov	DWORD PTR 32[rsp], r8d
	mov	r9d, ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	SDL_RenderDrawLine
	mov	rax, QWORD PTR 67048[rbp]
	mov	edx, DWORD PTR 4[rax]
	mov	rax, QWORD PTR 67048[rbp]
	mov	eax, DWORD PTR 12[rax]
	lea	r8d, [rdx+rax]
	mov	rax, QWORD PTR 67048[rbp]
	mov	eax, DWORD PTR [rax]
	cvtsi2sd	xmm1, eax
	mov	rax, QWORD PTR 67048[rbp]
	mov	eax, DWORD PTR 8[rax]
	cvtsi2sd	xmm2, eax
	movsd	xmm0, QWORD PTR .LC82[rip]
	mulsd	xmm0, xmm2
	addsd	xmm0, xmm1
	cvttsd2si	ecx, xmm0
	mov	eax, DWORD PTR 516[rbp]
	lea	r10d, -15[rax]
	mov	eax, DWORD PTR 512[rbp]
	lea	edx, 45[rax]
	mov	rax, QWORD PTR 67072[rbp]
	mov	DWORD PTR 32[rsp], r8d
	mov	r9d, ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	SDL_RenderDrawLine
	mov	DWORD PTR 364[rbp], 0
	mov	rax, QWORD PTR 67048[rbp]
	mov	eax, DWORD PTR 8[rax]
	sub	eax, 10
	mov	DWORD PTR 66500[rbp], eax
	mov	r8d, DWORD PTR 66500[rbp]
	mov	ecx, DWORD PTR 364[rbp]
	mov	rdx, QWORD PTR 67056[rbp]
	mov	rax, QWORD PTR 67032[rbp]
	mov	r9d, r8d
	mov	r8d, ecx
	mov	rcx, rax
	call	TTF_RenderText_Blended_Wrapped
	mov	QWORD PTR 67184[rbp], rax
	cmp	QWORD PTR 67184[rbp], 0
	jne	.L302
	mov	edx, DWORD PTR 364[rbp]
	mov	rax, QWORD PTR 67032[rbp]
	mov	r8d, edx
	lea	rdx, .LC83[rip]
	mov	rcx, rax
	call	TTF_RenderText_Solid
	mov	QWORD PTR 67184[rbp], rax
.L302:
	mov	rax, QWORD PTR 67184[rbp]
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR 66496[rbp], eax
	mov	rax, QWORD PTR 67184[rbp]
	mov	eax, DWORD PTR 20[rax]
	mov	DWORD PTR 66492[rbp], eax
	mov	rax, QWORD PTR 67048[rbp]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR 67048[rbp]
	mov	eax, DWORD PTR 8[rax]
	sub	eax, DWORD PTR 66496[rbp]
	mov	ecx, eax
	shr	ecx, 31
	add	eax, ecx
	sar	eax
	add	eax, edx
	mov	DWORD PTR 66488[rbp], eax
	mov	rax, QWORD PTR 67048[rbp]
	mov	edx, DWORD PTR 4[rax]
	mov	rax, QWORD PTR 67048[rbp]
	mov	eax, DWORD PTR 12[rax]
	sub	eax, DWORD PTR 66492[rbp]
	mov	ecx, eax
	shr	ecx, 31
	add	eax, ecx
	sar	eax
	add	eax, edx
	mov	DWORD PTR 66484[rbp], eax
	mov	eax, DWORD PTR 66488[rbp]
	mov	DWORD PTR 336[rbp], eax
	mov	eax, DWORD PTR 66484[rbp]
	mov	DWORD PTR 340[rbp], eax
	mov	eax, DWORD PTR 66496[rbp]
	mov	DWORD PTR 344[rbp], eax
	mov	eax, DWORD PTR 66492[rbp]
	mov	DWORD PTR 348[rbp], eax
	mov	rdx, QWORD PTR 67184[rbp]
	mov	rax, QWORD PTR 67072[rbp]
	mov	rcx, rax
	call	SDL_CreateTextureFromSurface
	mov	QWORD PTR 66472[rbp], rax
	lea	rcx, 336[rbp]
	mov	rdx, QWORD PTR 66472[rbp]
	mov	rax, QWORD PTR 67072[rbp]
	mov	r9, rcx
	mov	r8d, 0
	mov	rcx, rax
	call	SDL_RenderCopy
	mov	rax, QWORD PTR 67184[rbp]
	mov	rcx, rax
	call	SDL_FreeSurface
	mov	rax, QWORD PTR 66472[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
.L301:
	mov	eax, DWORD PTR quizOn1[rip]
	cmp	eax, 1
	jne	.L303
	mov	eax, DWORD PTR quiz1Num[rip]
	cmp	eax, 1
	jne	.L304
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 1
	jne	.L305
	lea	rax, .LC84[rip]
	mov	QWORD PTR quizQuestion[rip], rax
	lea	rax, .LC85[rip]
	mov	QWORD PTR answerA[rip], rax
	lea	rax, .LC86[rip]
	mov	QWORD PTR answerB[rip], rax
	lea	rax, .LC87[rip]
	mov	QWORD PTR answerC[rip], rax
	mov	DWORD PTR userAnswer[rip], 0
	add	DWORD PTR 67248[rbp], 500
	mov	eax, DWORD PTR quiz1Num[rip]
	add	eax, 1
	mov	DWORD PTR quiz1Num[rip], eax
.L305:
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 2
	jne	.L306
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
.L306:
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 3
	jne	.L303
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
	jmp	.L303
.L304:
	mov	eax, DWORD PTR quiz1Num[rip]
	cmp	eax, 2
	jne	.L308
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 1
	jne	.L309
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
.L309:
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 2
	jne	.L310
	lea	rax, .LC91[rip]
	mov	QWORD PTR quizQuestion[rip], rax
	lea	rax, .LC90[rip]
	mov	QWORD PTR answerA[rip], rax
	lea	rax, .LC90[rip]
	mov	QWORD PTR answerB[rip], rax
	lea	rax, .LC90[rip]
	mov	QWORD PTR answerC[rip], rax
	mov	DWORD PTR userAnswer[rip], 0
	add	DWORD PTR 67248[rbp], 500
	mov	eax, DWORD PTR quiz1Num[rip]
	add	eax, 1
	mov	DWORD PTR quiz1Num[rip], eax
.L310:
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 3
	jne	.L303
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
	jmp	.L303
.L308:
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
	jne	.L312
	mov	DWORD PTR quizOn1[rip], 0
	mov	BYTE PTR quizOn[rip], 0
.L312:
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 2
	jne	.L313
	mov	DWORD PTR quizOn1[rip], 0
	mov	BYTE PTR quizOn[rip], 0
.L313:
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 3
	jne	.L303
	mov	DWORD PTR quizOn1[rip], 0
	mov	BYTE PTR quizOn[rip], 0
.L303:
	movzx	eax, BYTE PTR quizOn[rip]
	test	al, al
	je	.L314
	mov	DWORD PTR 332[rbp], 0
	mov	BYTE PTR 332[rbp], -56
	mov	BYTE PTR 333[rbp], -56
	mov	BYTE PTR 334[rbp], -56
	movzx	eax, BYTE PTR 334[rbp]
	movzx	r8d, al
	movzx	eax, BYTE PTR 333[rbp]
	movzx	edx, al
	movzx	eax, BYTE PTR 332[rbp]
	movzx	eax, al
	mov	rcx, QWORD PTR 67072[rbp]
	mov	DWORD PTR 32[rsp], 255
	mov	r9d, r8d
	mov	r8d, edx
	mov	edx, eax
	call	SDL_SetRenderDrawColor
	mov	DWORD PTR 66468[rbp], 400
	mov	DWORD PTR 66464[rbp], 200
	mov	eax, 800
	sub	eax, DWORD PTR 66468[rbp]
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	add	eax, 300
	mov	DWORD PTR 66460[rbp], eax
	mov	eax, 600
	sub	eax, DWORD PTR 66464[rbp]
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	mov	DWORD PTR 66456[rbp], eax
	mov	eax, DWORD PTR 66460[rbp]
	mov	DWORD PTR 304[rbp], eax
	mov	eax, DWORD PTR 66456[rbp]
	mov	DWORD PTR 308[rbp], eax
	mov	eax, DWORD PTR 66468[rbp]
	mov	DWORD PTR 312[rbp], eax
	mov	eax, DWORD PTR 66464[rbp]
	mov	DWORD PTR 316[rbp], eax
	lea	rax, 304[rbp]
	mov	rcx, QWORD PTR 67072[rbp]
	mov	rdx, rax
	call	SDL_RenderFillRect
	mov	DWORD PTR 300[rbp], 0
	mov	eax, DWORD PTR 66468[rbp]
	sub	eax, 20
	mov	DWORD PTR 66452[rbp], eax
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
	mov	r8d, DWORD PTR 66452[rbp]
	mov	edx, DWORD PTR 300[rbp]
	lea	rax, -32[rbp]
	mov	rcx, QWORD PTR 67032[rbp]
	mov	r9d, r8d
	mov	r8d, edx
	mov	rdx, rax
	call	TTF_RenderText_Blended_Wrapped
	mov	QWORD PTR 66440[rbp], rax
	mov	rdx, QWORD PTR 66440[rbp]
	mov	rax, QWORD PTR 67072[rbp]
	mov	rcx, rax
	call	SDL_CreateTextureFromSurface
	mov	QWORD PTR 66432[rbp], rax
	mov	rax, QWORD PTR 66440[rbp]
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR 66428[rbp], eax
	mov	rax, QWORD PTR 66440[rbp]
	mov	eax, DWORD PTR 20[rax]
	mov	DWORD PTR 66424[rbp], eax
	mov	eax, DWORD PTR 66468[rbp]
	sub	eax, DWORD PTR 66428[rbp]
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	mov	edx, eax
	mov	eax, DWORD PTR 66460[rbp]
	add	eax, edx
	mov	DWORD PTR 66420[rbp], eax
	mov	eax, DWORD PTR 66464[rbp]
	sub	eax, DWORD PTR 66424[rbp]
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	mov	edx, eax
	mov	eax, DWORD PTR 66456[rbp]
	add	eax, edx
	mov	DWORD PTR 66416[rbp], eax
	mov	eax, DWORD PTR 66420[rbp]
	mov	DWORD PTR 272[rbp], eax
	mov	eax, DWORD PTR 66416[rbp]
	mov	DWORD PTR 276[rbp], eax
	mov	eax, DWORD PTR 66428[rbp]
	mov	DWORD PTR 280[rbp], eax
	mov	eax, DWORD PTR 66424[rbp]
	mov	DWORD PTR 284[rbp], eax
	lea	rcx, 272[rbp]
	mov	rdx, QWORD PTR 66432[rbp]
	mov	rax, QWORD PTR 67072[rbp]
	mov	r9, rcx
	mov	r8d, 0
	mov	rcx, rax
	call	SDL_RenderCopy
	mov	rax, QWORD PTR 66440[rbp]
	mov	rcx, rax
	call	SDL_FreeSurface
	mov	rax, QWORD PTR 66432[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
.L314:
	mov	DWORD PTR 67180[rbp], 0
	jmp	.L315
.L317:
	lea	rax, waterParticles[rip]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR 67180[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	mov	eax, DWORD PTR 12[rax]
	test	eax, eax
	je	.L316
	lea	rax, waterParticles[rip]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR 67180[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	movss	xmm1, DWORD PTR 4[rax]
	movss	xmm0, DWORD PTR .LC95[rip]
	addss	xmm0, xmm1
	cvttss2si	edx, xmm0
	lea	rax, waterParticles[rip]
	mov	rcx, QWORD PTR [rax]
	mov	eax, DWORD PTR 67180[rbp]
	cdqe
	sal	rax, 4
	add	rax, rcx
	movss	xmm1, DWORD PTR [rax]
	movss	xmm0, DWORD PTR .LC96[rip]
	addss	xmm0, xmm1
	cvttss2si	r9d, xmm0
	lea	rax, waterParticles[rip]
	mov	rcx, QWORD PTR [rax]
	mov	eax, DWORD PTR 67180[rbp]
	cdqe
	sal	rax, 4
	add	rax, rcx
	movss	xmm0, DWORD PTR 4[rax]
	cvttss2si	r8d, xmm0
	lea	rax, waterParticles[rip]
	mov	rcx, QWORD PTR [rax]
	mov	eax, DWORD PTR 67180[rbp]
	cdqe
	sal	rax, 4
	add	rax, rcx
	movss	xmm0, DWORD PTR [rax]
	cvttss2si	eax, xmm0
	mov	rcx, QWORD PTR 67072[rbp]
	mov	r10, QWORD PTR 66992[rbp]
	mov	QWORD PTR 40[rsp], r10
	mov	DWORD PTR 32[rsp], edx
	mov	edx, eax
	call	draw_image
.L316:
	add	DWORD PTR 67180[rbp], 1
.L315:
	mov	eax, 100
	cmp	DWORD PTR 67180[rbp], eax
	jl	.L317
	mov	rax, QWORD PTR globalEnemy[rip]
	test	rax, rax
	je	.L318
	mov	rax, QWORD PTR globalEnemy[rip]
	mov	eax, DWORD PTR 16[rax]
	test	eax, eax
	jle	.L318
	mov	rax, QWORD PTR 67072[rbp]
	mov	DWORD PTR 32[rsp], 255
	mov	r9d, 0
	mov	r8d, 0
	mov	edx, 255
	mov	rcx, rax
	call	SDL_SetRenderDrawColor
	mov	rax, QWORD PTR globalEnemy[rip]
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR 256[rbp], eax
	mov	rax, QWORD PTR globalEnemy[rip]
	mov	eax, DWORD PTR 4[rax]
	mov	DWORD PTR 260[rbp], eax
	mov	rax, QWORD PTR globalEnemy[rip]
	mov	eax, DWORD PTR 8[rax]
	mov	DWORD PTR 264[rbp], eax
	mov	rax, QWORD PTR globalEnemy[rip]
	mov	eax, DWORD PTR 12[rax]
	mov	DWORD PTR 268[rbp], eax
	lea	rax, 256[rbp]
	mov	rcx, QWORD PTR 67072[rbp]
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
	mov	rax, QWORD PTR 67072[rbp]
	mov	r8, QWORD PTR 66960[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_image
.L318:
	mov	rax, QWORD PTR globalEnemy[rip]
	test	rax, rax
	je	.L319
	mov	rax, QWORD PTR globalEnemy[rip]
	mov	eax, DWORD PTR 16[rax]
	test	eax, eax
	jg	.L319
	mov	rax, QWORD PTR globalEnemy[rip]
	mov	rcx, rax
	call	resetEnemy
.L319:
	cmp	DWORD PTR 67232[rbp], 0
	je	.L330
	mov	eax, DWORD PTR 67100[rbp]
	sal	eax, 6
	mov	DWORD PTR 66412[rbp], eax
	mov	ecx, DWORD PTR 67140[rbp]
	mov	rax, QWORD PTR 67072[rbp]
	mov	DWORD PTR 40[rsp], 0
	mov	edx, DWORD PTR 67136[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, ecx
	mov	r8d, 0
	mov	edx, 0
	mov	rcx, rax
	call	draw_rectangle_color
	mov	edx, DWORD PTR 67116[rbp]
	mov	eax, DWORD PTR 66412[rbp]
	lea	r9d, [rdx+rax]
	mov	eax, DWORD PTR 67132[rbp]
	sub	eax, DWORD PTR 66412[rbp]
	mov	r8d, DWORD PTR 67128[rbp]
	mov	rcx, QWORD PTR 67072[rbp]
	mov	rdx, QWORD PTR 66792[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	edx, DWORD PTR 67112[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	edx, eax
	call	draw_image
	mov	DWORD PTR 66408[rbp], 16
	call	draw_get_color
	mov	DWORD PTR 66404[rbp], eax
	call	get_timer
	mov	DWORD PTR 66400[rbp], eax
	mov	ecx, DWORD PTR 66400[rbp]
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
	mov	DWORD PTR 66396[rbp], edx
	mov	edx, DWORD PTR 66396[rbp]
	imul	edx, edx, 360
	sub	eax, edx
	mov	DWORD PTR 66396[rbp], eax
	mov	ecx, DWORD PTR 66400[rbp]
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
	movsd	xmm0, QWORD PTR .LC97[rip]
	mulsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC98[rip]
	addsd	xmm0, xmm1
	cvttsd2si	eax, xmm0
	mov	DWORD PTR 66392[rbp], eax
	mov	ecx, DWORD PTR 66400[rbp]
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
	mov	DWORD PTR 66388[rbp], eax
	mov	DWORD PTR 67176[rbp], 0
	jmp	.L321
.L322:
	mov	eax, DWORD PTR 66408[rbp]
	neg	eax
	imul	eax, DWORD PTR 67100[rbp]
	cvtsi2sd	xmm6, eax
	cvtsi2sd	xmm0, DWORD PTR 66396[rbp]
	call	dcos
	mulsd	xmm6, xmm0
	mov	eax, DWORD PTR 67176[rbp]
	imul	eax, DWORD PTR 67100[rbp]
	cvtsi2sd	xmm7, eax
	cvtsi2sd	xmm0, DWORD PTR 66396[rbp]
	call	dcos
	mulsd	xmm0, xmm7
	addsd	xmm0, xmm6
	cvttsd2si	eax, xmm0
	mov	DWORD PTR 66384[rbp], eax
	mov	eax, DWORD PTR 66408[rbp]
	neg	eax
	imul	eax, DWORD PTR 67096[rbp]
	cvtsi2sd	xmm6, eax
	cvtsi2sd	xmm0, DWORD PTR 66392[rbp]
	call	dsin
	mulsd	xmm6, xmm0
	mov	eax, DWORD PTR 67176[rbp]
	imul	eax, DWORD PTR 67096[rbp]
	cvtsi2sd	xmm7, eax
	cvtsi2sd	xmm0, DWORD PTR 66392[rbp]
	call	dsin
	mulsd	xmm0, xmm7
	addsd	xmm0, xmm6
	cvttsd2si	eax, xmm0
	mov	DWORD PTR 66380[rbp], eax
	cvtsi2sd	xmm0, DWORD PTR 67176[rbp]
	mov	eax, DWORD PTR 66408[rbp]
	sub	eax, 1
	cvtsi2sd	xmm1, eax
	divsd	xmm0, xmm1
	movapd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC99[rip]
	movapd	xmm2, xmm1
	movapd	xmm1, xmm0
	pxor	xmm0, xmm0
	call	lerp
	cvttsd2si	edx, xmm0
	mov	eax, DWORD PTR 66388[rbp]
	mov	r8d, edx
	mov	edx, 32
	mov	ecx, eax
	call	make_color_hsv
	mov	edx, eax
	mov	rax, QWORD PTR 67072[rbp]
	mov	rcx, rax
	call	draw_set_color
	mov	edx, DWORD PTR 67112[rbp]
	mov	eax, DWORD PTR 66380[rbp]
	lea	ecx, [rdx+rax]
	mov	edx, DWORD PTR 67116[rbp]
	mov	eax, DWORD PTR 66412[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 66384[rbp]
	lea	r9d, [rdx+rax]
	mov	edx, DWORD PTR 67128[rbp]
	mov	eax, DWORD PTR 66380[rbp]
	lea	r10d, [rdx+rax]
	mov	eax, DWORD PTR 67132[rbp]
	sub	eax, DWORD PTR 66412[rbp]
	mov	edx, DWORD PTR 66384[rbp]
	add	edx, eax
	mov	rax, QWORD PTR 67072[rbp]
	mov	r8, QWORD PTR 66784[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_image
	add	DWORD PTR 67176[rbp], 1
.L321:
	mov	eax, DWORD PTR 67176[rbp]
	cmp	eax, DWORD PTR 66408[rbp]
	jl	.L322
	mov	edx, DWORD PTR 67116[rbp]
	mov	eax, DWORD PTR 66412[rbp]
	lea	r9d, [rdx+rax]
	mov	eax, DWORD PTR 67132[rbp]
	sub	eax, DWORD PTR 66412[rbp]
	mov	r8d, DWORD PTR 67128[rbp]
	mov	rcx, QWORD PTR 67072[rbp]
	mov	rdx, QWORD PTR 66776[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	edx, DWORD PTR 67112[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	edx, eax
	call	draw_image
	mov	edx, DWORD PTR 66404[rbp]
	mov	rax, QWORD PTR 67072[rbp]
	mov	rcx, rax
	call	draw_set_color
	mov	DWORD PTR 66376[rbp], 384
	mov	DWORD PTR 66372[rbp], 32
	mov	ecx, DWORD PTR 66400[rbp]
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
	jle	.L323
	mov	r9d, 65535
	mov	eax, DWORD PTR 66936[rbp]
	imul	eax, DWORD PTR 67096[rbp]
	mov	edx, DWORD PTR 66940[rbp]
	imul	edx, DWORD PTR 67100[rbp]
	mov	r8d, edx
	mov	r10d, DWORD PTR 66372[rbp]
	mov	edx, DWORD PTR 66376[rbp]
	mov	rcx, QWORD PTR 67072[rbp]
	mov	DWORD PTR 72[rsp], r9d
	mov	r9d, DWORD PTR 66936[rbp]
	mov	DWORD PTR 64[rsp], r9d
	mov	r9d, DWORD PTR 66940[rbp]
	mov	DWORD PTR 56[rsp], r9d
	mov	r9, QWORD PTR 66768[rbp]
	mov	QWORD PTR 48[rsp], r9
	mov	r9, QWORD PTR 66944[rbp]
	mov	QWORD PTR 40[rsp], r9
	mov	DWORD PTR 32[rsp], eax
	mov	r9d, r8d
	mov	r8d, r10d
	call	draw_text_color
.L323:
	mov	DWORD PTR 66376[rbp], 64
	mov	DWORD PTR 66372[rbp], 8
	mov	eax, DWORD PTR 66752[rbp]
	mov	DWORD PTR 66408[rbp], eax
	mov	DWORD PTR 67172[rbp], 0
	jmp	.L324
.L325:
	mov	eax, DWORD PTR 67096[rbp]
	sal	eax, 3
	cvtsi2sd	xmm6, eax
	mov	ecx, DWORD PTR 66400[rbp]
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
	cvtsi2sd	xmm7, edx
	cvtsi2sd	xmm0, DWORD PTR 67172[rbp]
	mov	eax, DWORD PTR 66408[rbp]
	sub	eax, 1
	cvtsi2sd	xmm1, eax
	divsd	xmm0, xmm1
	movapd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC101[rip]
	movapd	xmm2, xmm1
	movapd	xmm1, xmm0
	pxor	xmm0, xmm0
	call	lerp
	addsd	xmm0, xmm7
	call	dcos
	mulsd	xmm0, xmm6
	cvttsd2si	eax, xmm0
	mov	DWORD PTR 66368[rbp], eax
	mov	eax, DWORD PTR 67172[rbp]
	cdqe
	mov	rdx, QWORD PTR 66760[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	mov	BYTE PTR 254[rbp], al
	mov	r9d, 16777215
	mov	eax, DWORD PTR 66936[rbp]
	imul	eax, DWORD PTR 67096[rbp]
	mov	edx, DWORD PTR 66940[rbp]
	imul	edx, DWORD PTR 67100[rbp]
	mov	r8d, edx
	mov	ecx, DWORD PTR 67128[rbp]
	mov	edx, DWORD PTR 67120[rbp]
	add	edx, ecx
	sub	edx, DWORD PTR 66372[rbp]
	mov	ecx, DWORD PTR 66368[rbp]
	add	ecx, edx
	mov	edx, DWORD PTR 66936[rbp]
	imul	edx, DWORD PTR 67096[rbp]
	sub	ecx, edx
	mov	r11d, ecx
	mov	edx, DWORD PTR 66940[rbp]
	imul	edx, DWORD PTR 67100[rbp]
	imul	edx, DWORD PTR 67172[rbp]
	mov	ecx, DWORD PTR 66376[rbp]
	lea	r10d, [rdx+rcx]
	mov	rcx, QWORD PTR 67072[rbp]
	mov	DWORD PTR 72[rsp], r9d
	mov	edx, DWORD PTR 66936[rbp]
	mov	DWORD PTR 64[rsp], edx
	mov	edx, DWORD PTR 66940[rbp]
	mov	DWORD PTR 56[rsp], edx
	lea	rdx, 254[rbp]
	mov	QWORD PTR 48[rsp], rdx
	mov	rdx, QWORD PTR 66944[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	DWORD PTR 32[rsp], eax
	mov	r9d, r8d
	mov	r8d, r11d
	mov	edx, r10d
	call	draw_text_color
	add	DWORD PTR 67172[rbp], 1
.L324:
	mov	eax, DWORD PTR 67172[rbp]
	cmp	eax, DWORD PTR 66408[rbp]
	jl	.L325
.L330:
	mov	rax, QWORD PTR 67072[rbp]
	mov	DWORD PTR 32[rsp], 255
	mov	r9d, 0
	mov	r8d, 0
	mov	edx, 0
	mov	rcx, rax
	call	SDL_SetRenderDrawColor
	mov	edx, DWORD PTR 67248[rbp]
	lea	rax, 384[rbp]
	mov	r9d, edx
	lea	r8, .LC102[rip]
	mov	edx, 20
	mov	rcx, rax
	call	snprintf
	mov	edx, DWORD PTR 66156[rbp]
	lea	rax, 384[rbp]
	mov	rcx, QWORD PTR 67032[rbp]
	mov	r8d, edx
	mov	rdx, rax
	call	TTF_RenderText_Solid
	mov	QWORD PTR 66360[rbp], rax
	mov	rdx, QWORD PTR 66360[rbp]
	mov	rax, QWORD PTR 67072[rbp]
	mov	rcx, rax
	call	SDL_CreateTextureFromSurface
	mov	QWORD PTR 66352[rbp], rax
	mov	DWORD PTR 368[rbp], 10
	mov	DWORD PTR 372[rbp], 720
	mov	rax, QWORD PTR 66360[rbp]
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR 376[rbp], eax
	mov	rax, QWORD PTR 66360[rbp]
	mov	eax, DWORD PTR 20[rax]
	mov	DWORD PTR 380[rbp], eax
	lea	rcx, 368[rbp]
	mov	rdx, QWORD PTR 66352[rbp]
	mov	rax, QWORD PTR 67072[rbp]
	mov	r9, rcx
	mov	r8d, 0
	mov	rcx, rax
	call	SDL_RenderCopy
	mov	rax, QWORD PTR 66360[rbp]
	mov	rcx, rax
	call	SDL_FreeSurface
	mov	rax, QWORD PTR 66352[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 67072[rbp]
	mov	rcx, rax
	call	SDL_RenderPresent
	mov	ecx, 16
	call	SDL_Delay
.L186:
	cmp	DWORD PTR 67228[rbp], 0
	jne	.L187
	lea	rcx, .LC103[rip]
	call	puts
	lea	rax, waterParticles[rip]
	mov	rax, QWORD PTR [rax]
	mov	rcx, rax
	call	free
	mov	rax, QWORD PTR 67032[rbp]
	mov	rcx, rax
	call	TTF_CloseFont
	mov	rax, QWORD PTR 67008[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 67000[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66992[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66984[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66976[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66856[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66848[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66952[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66792[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66784[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66776[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66944[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66928[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66832[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66968[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66816[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 66960[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	call	IMG_Quit
	mov	eax, DWORD PTR 66804[rbp]
	mov	ecx, eax
	call	SDL_CloseAudioDevice
	mov	rax, QWORD PTR 440[rbp]
	mov	rcx, rax
	call	SDL_FreeWAV
	mov	rax, QWORD PTR 67072[rbp]
	mov	rcx, rax
	call	SDL_DestroyRenderer
	mov	rax, QWORD PTR 67080[rbp]
	mov	rcx, rax
	call	SDL_DestroyWindow
	call	SDL_Quit
	mov	ecx, 500
	call	SDL_Delay
	mov	eax, 0
	jmp	.L170
.L175:
	call	SDL_GetError
	mov	rsi, rax
	mov	rbx, QWORD PTR 67144[rbp]
	mov	ecx, 2
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	r9, rsi
	mov	r8, rbx
	lea	rdx, .LC104[rip]
	mov	rcx, rax
	call	fprintf
	call	SDL_Quit
	mov	ecx, 1
	call	exit
.L170:
	mov	rsp, r12
	jmp	.L168
.L184:
	mov	rsp, r12
.L168:
	movaps	xmm6, XMMWORD PTR 67264[rbp]
	movaps	xmm7, XMMWORD PTR 67280[rbp]
	lea	rsp, 67304[rbp]
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
.LC101:
	.long	0
	.long	1082556416
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
	.def	free;	.scl	2;	.type	32;	.endef
	.def	TTF_CloseFont;	.scl	2;	.type	32;	.endef
	.def	IMG_Quit;	.scl	2;	.type	32;	.endef
	.def	SDL_CloseAudioDevice;	.scl	2;	.type	32;	.endef
	.def	SDL_DestroyRenderer;	.scl	2;	.type	32;	.endef
	.def	SDL_DestroyWindow;	.scl	2;	.type	32;	.endef
