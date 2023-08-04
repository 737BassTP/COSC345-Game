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
	lea	rdx, .LC4[rip]
	lea	rcx, .LC5[rip]
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
	mov	r9, rdx
	mov	r8d, 1
	mov	rdx, rax
	mov	rcx, QWORD PTR 16[rbp]
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
	lea	rcx, .LC6[rip]
	call	puts
	mov	DWORD PTR glob_vk_f2[rip], 0
	lea	rdx, .LC4[rip]
	lea	rcx, .LC7[rip]
	call	fopen
	mov	QWORD PTR 262112[rbp], rax
	lea	rdx, .LC8[rip]
	lea	rcx, .LC5[rip]
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
	lea	rcx, .LC10[rip]
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
	mov	r9d, 2
	mov	r8d, 512
	mov	edx, 256
	mov	rcx, QWORD PTR 262176[rbp]
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
	lea	rdx, .LC4[rip]
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
	jmp	.L121
.L122:
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 24[rbp]
	mov	r8, rdx
	mov	edx, 16
	mov	rcx, rax
	call	fgets
	sub	DWORD PTR -4[rbp], 1
.L121:
	cmp	DWORD PTR -4[rbp], 0
	jg	.L122
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
	jmp	.L126
.L127:
	lea	rax, waterParticles[rip]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	mov	DWORD PTR 12[rax], 1
	add	DWORD PTR -4[rbp], 1
.L126:
	mov	eax, 100
	cmp	DWORD PTR -4[rbp], eax
	jl	.L127
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
	jmp	.L129
.L130:
	lea	rax, waterParticles[rip]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	mov	DWORD PTR 12[rax], 0
	add	DWORD PTR -4[rbp], 1
.L129:
	mov	eax, 100
	cmp	DWORD PTR -4[rbp], eax
	jl	.L130
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
	jg	.L132
	mov	DWORD PTR health[rip], 0
	jmp	.L134
.L132:
	mov	eax, DWORD PTR health[rip]
	sub	eax, DWORD PTR 16[rbp]
	mov	DWORD PTR health[rip], eax
.L134:
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
	jl	.L136
	mov	DWORD PTR health[rip], 100
	jmp	.L138
.L136:
	mov	edx, DWORD PTR health[rip]
	mov	eax, DWORD PTR 16[rbp]
	add	eax, edx
	mov	DWORD PTR health[rip], eax
.L138:
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
	jge	.L142
	mov	edx, DWORD PTR -112[rbp]
	mov	eax, DWORD PTR -104[rbp]
	add	edx, eax
	mov	eax, DWORD PTR -128[rbp]
	cmp	edx, eax
	jle	.L142
	mov	edx, DWORD PTR -108[rbp]
	mov	ecx, DWORD PTR -124[rbp]
	mov	eax, DWORD PTR -116[rbp]
	add	eax, ecx
	cmp	edx, eax
	jge	.L142
	mov	edx, DWORD PTR -108[rbp]
	mov	eax, DWORD PTR -100[rbp]
	add	edx, eax
	mov	eax, DWORD PTR -124[rbp]
	cmp	edx, eax
	jle	.L142
	mov	eax, 1
	jmp	.L144
.L142:
	mov	eax, 0
.L144:
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
	jne	.L146
	mov	rax, QWORD PTR 16[rbp]
	mov	eax, DWORD PTR 32[rax]
	sub	DWORD PTR -8[rbp], eax
	jmp	.L147
.L146:
	mov	rax, QWORD PTR 16[rbp]
	movzx	eax, BYTE PTR 16[rax]
	cmp	al, 1
	jne	.L148
	mov	rax, QWORD PTR 16[rbp]
	mov	eax, DWORD PTR 28[rax]
	add	DWORD PTR -4[rbp], eax
	jmp	.L147
.L148:
	mov	rax, QWORD PTR 16[rbp]
	movzx	eax, BYTE PTR 16[rax]
	cmp	al, 2
	jne	.L149
	mov	rax, QWORD PTR 16[rbp]
	mov	eax, DWORD PTR 32[rax]
	add	DWORD PTR -8[rbp], eax
	jmp	.L147
.L149:
	mov	rax, QWORD PTR 16[rbp]
	movzx	eax, BYTE PTR 16[rax]
	cmp	al, 3
	jne	.L147
	mov	rax, QWORD PTR 16[rbp]
	mov	eax, DWORD PTR 28[rax]
	sub	DWORD PTR -4[rbp], eax
.L147:
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
	je	.L153
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
	je	.L153
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
.L153:
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
	jne	.L155
	pxor	xmm0, xmm0
	movss	DWORD PTR -20[rbp], xmm0
	jmp	.L156
.L155:
	mov	rax, QWORD PTR 32[rbp]
	movzx	eax, BYTE PTR 16[rax]
	cmp	al, 1
	jne	.L157
	movss	xmm0, DWORD PTR .LC16[rip]
	movss	DWORD PTR -20[rbp], xmm0
	jmp	.L156
.L157:
	mov	rax, QWORD PTR 32[rbp]
	movzx	eax, BYTE PTR 16[rax]
	cmp	al, 2
	jne	.L158
	movss	xmm0, DWORD PTR .LC17[rip]
	movss	DWORD PTR -20[rbp], xmm0
	jmp	.L156
.L158:
	mov	rax, QWORD PTR 32[rbp]
	movzx	eax, BYTE PTR 16[rax]
	cmp	al, 3
	jne	.L156
	movss	xmm0, DWORD PTR .LC18[rip]
	movss	DWORD PTR -20[rbp], xmm0
.L156:
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
	jmp	.L159
.L161:
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
	jne	.L160
	mov	eax, DWORD PTR -80[rbp]
	add	eax, 20
	mov	DWORD PTR -80[rbp], eax
	mov	eax, DWORD PTR -76[rbp]
	add	eax, 5
	mov	DWORD PTR -76[rbp], eax
.L160:
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
.L159:
	cmp	DWORD PTR -24[rbp], 7
	jle	.L161
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
	jb	.L163
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR 12[rax], 0
.L163:
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
	jl	.L170
	mov	eax, DWORD PTR 16[rbp]
	cmp	eax, DWORD PTR -8[rbp]
	jg	.L170
	mov	eax, 1
	jmp	.L172
.L170:
	mov	eax, 0
.L172:
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
	.globl	quizOn
quizOn:
	.space 1
	.globl	quizOn1
	.align 4
quizOn1:
	.space 4
	.globl	quiz1QNum
	.data
	.align 4
quiz1QNum:
	.long	1
	.globl	quizOn2
	.bss
	.align 4
quizOn2:
	.space 4
	.globl	quiz2QNum
	.data
	.align 4
quiz2QNum:
	.long	1
	.globl	quiz2Called
	.bss
quiz2Called:
	.space 1
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
	.align 8
.LC42:
	.ascii "img/spr_water_shallow_strip16.png\0"
	.align 8
.LC43:
	.ascii "img/spr_lava_shallow_strip16.png\0"
.LC44:
	.ascii "tiled/tileset.png\0"
.LC45:
	.ascii "img/hudshade.png\0"
.LC46:
	.ascii "img/spr_enemy1.png\0"
.LC47:
	.ascii "img/player_strip8.png\0"
.LC48:
	.ascii "img/ascii_strip96.png\0"
.LC49:
	.ascii "img/clock1_strip10.png\0"
.LC50:
	.ascii "Night\0"
.LC51:
	.ascii "Morning\0"
.LC52:
	.ascii "Day\0"
.LC53:
	.ascii "Evening\0"
.LC54:
	.ascii "MTWTFSS\0"
.LC55:
	.ascii "img/dunedin-map.png\0"
.LC56:
	.ascii "img/spr_map_unknown.png\0"
.LC57:
	.ascii "img/spr_thermometer.png\0"
.LC58:
	.ascii "img/spr_nutrients_strip4.png\0"
.LC59:
	.ascii "music.wav\0"
.LC60:
	.ascii "Failed to load WAV file: %s\12\0"
	.align 8
.LC61:
	.ascii "Failed to open audio device: %s\12\0"
.LC62:
	.ascii "img/logo1a.png\0"
.LC63:
	.ascii "img/logo1b.png\0"
.LC64:
	.ascii "img/logo1c.png\0"
.LC65:
	.ascii "Press SPACE to continue.\0"
	.align 8
.LC66:
	.ascii "(C) 2023 - Thomas, Sean, Matthew, Nicholas - COSC345\0"
.LC67:
	.ascii "Entering main loop...\0"
.LC68:
	.ascii "F2 started!\0"
.LC69:
	.ascii "F2 finished!\0"
.LC70:
	.ascii "quiz on\0"
	.align 8
.LC71:
	.ascii "you pressed 1, good job. Lets test the limit\0"
	.align 8
.LC72:
	.ascii "you pressed 2, good job. Lets test the limit woo\0"
.LC73:
	.ascii "you pressed 3\0"
	.align 8
.LC74:
	.ascii "you pressed 4, good job. Lets test the limit woo\0"
.LC75:
	.ascii "HEALTH:\0"
.LC76:
	.ascii "Protein\0"
.LC77:
	.ascii "Carbs\0"
.LC78:
	.ascii "Fat\0"
.LC79:
	.ascii "Vitamin\0"
.LC80:
	.ascii "LVL: XYZ/511\0"
.LC81:
	.ascii "X\0"
.LC82:
	.ascii "Y\0"
.LC83:
	.ascii "Z\0"
.LC85:
	.ascii ":\0"
.LC90:
	.ascii "Error: Text Rendering Failed\0"
	.align 8
.LC91:
	.ascii "That is correct\12What is Seans name?\0"
.LC92:
	.ascii "Bradley\0"
.LC93:
	.ascii "Sean\0"
.LC94:
	.ascii "John\0"
	.align 8
.LC95:
	.ascii "That is false\12 next question\12What is Seans name?\0"
	.align 8
.LC96:
	.ascii "That is false\12Thank you for playing\0"
.LC97:
	.ascii "\0"
	.align 8
.LC98:
	.ascii "That is correct\12Thank you for playing\0"
.LC99:
	.ascii "Thank you for playing\0"
.LC100:
	.ascii "press 1 2 or 3 to exit\0"
	.align 8
.LC101:
	.ascii "Greetings wanderer\12Answer my riddle to pass through\12 Which of these macronutrients contains the most calories per gram\0"
.LC102:
	.ascii "1. Carbohydrate\0"
.LC103:
	.ascii "2. Fat\0"
.LC104:
	.ascii "3. Protein\0"
	.align 8
.LC105:
	.ascii "That is false\12 next question\12Which of these meats has the highest protein count per 100g??\0"
.LC106:
	.ascii "1. Rump Steak\0"
.LC107:
	.ascii "2. Skinned Chicken Breast\0"
.LC108:
	.ascii "3. Chocolate\0"
	.align 8
.LC109:
	.ascii "That is Correct, fat contains 9 calories per gram while protein and carbohydrates contain 4\12 next question\12Which of these meats has the highest protein count per 100g??\0"
	.align 8
.LC110:
	.ascii "That is false\12 next question\12Which of these meats has the highest protein count per 100g?\0"
	.align 8
.LC111:
	.ascii "That is correct\12There are 31g of protein per 100g of Chicken breast\12Thank you for playing\0"
.LC112:
	.ascii "%s\12%s\12%s\12%s\0"
.LC120:
	.ascii "Score: %d\0"
.LC121:
	.ascii "...exited main loop.\0"
.LC122:
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
	mov	eax, 264104
	call	___chkstk_ms
	sub	rsp, rax
	.seh_stackalloc	264104
	lea	rbp, 128[rsp]
	.seh_setframe	rbp, 128
	movaps	XMMWORD PTR 263936[rbp], xmm6
	.seh_savexmm	xmm6, 264064
	movaps	XMMWORD PTR 263952[rbp], xmm7
	.seh_savexmm	xmm7, 264080
	.seh_endprologue
	mov	DWORD PTR 264048[rbp], ecx
	mov	QWORD PTR 264056[rbp], rdx
	mov	rax, rsp
	mov	r12, rax
	mov	QWORD PTR 263816[rbp], 256
	mov	rax, QWORD PTR 263816[rbp]
	sub	rax, 1
	mov	QWORD PTR 263808[rbp], rax
	mov	rax, QWORD PTR 263816[rbp]
	mov	r10, rax
	mov	r11d, 0
	mov	rax, QWORD PTR 263816[rbp]
	mov	r8, rax
	mov	r9d, 0
	mov	rax, QWORD PTR 263816[rbp]
	add	rax, 15
	shr	rax, 4
	sal	rax, 4
	call	___chkstk_ms
	sub	rsp, rax
	lea	rax, 80[rsp]
	add	rax, 0
	mov	QWORD PTR 263800[rbp], rax
	mov	BYTE PTR 397[rbp], 2
	mov	BYTE PTR 398[rbp], 28
	mov	BYTE PTR 399[rbp], 1
	lea	rax, 394[rbp]
	mov	rcx, rax
	call	SDL_GetVersion
	movzx	eax, BYTE PTR 399[rbp]
	movzx	ecx, al
	movzx	eax, BYTE PTR 398[rbp]
	movzx	edx, al
	movzx	eax, BYTE PTR 397[rbp]
	movzx	eax, al
	mov	r9d, ecx
	mov	r8d, edx
	mov	edx, eax
	lea	rcx, .LC26[rip]
	call	SDL_Log
	movzx	eax, BYTE PTR 396[rbp]
	movzx	ecx, al
	movzx	eax, BYTE PTR 395[rbp]
	movzx	edx, al
	movzx	eax, BYTE PTR 394[rbp]
	movzx	eax, al
	mov	r9d, ecx
	mov	r8d, edx
	mov	edx, eax
	lea	rcx, .LC27[rip]
	call	SDL_Log
	mov	DWORD PTR 263796[rbp], 1366
	mov	DWORD PTR 263792[rbp], 768
	mov	eax, DWORD PTR 263796[rbp]
	sub	eax, DWORD PTR 263792[rbp]
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	mov	DWORD PTR 263788[rbp], eax
	mov	DWORD PTR 263784[rbp], 0
	mov	eax, DWORD PTR 263792[rbp]
	mov	DWORD PTR 263780[rbp], eax
	mov	eax, DWORD PTR 263792[rbp]
	mov	DWORD PTR 263776[rbp], eax
	mov	edx, DWORD PTR 263788[rbp]
	mov	eax, DWORD PTR 263780[rbp]
	add	eax, edx
	mov	DWORD PTR 263772[rbp], eax
	mov	edx, DWORD PTR 263784[rbp]
	mov	eax, DWORD PTR 263776[rbp]
	add	eax, edx
	mov	DWORD PTR 263768[rbp], eax
	mov	DWORD PTR 263764[rbp], 16
	mov	DWORD PTR 263760[rbp], 16
	mov	eax, DWORD PTR 263764[rbp]
	mov	ecx, eax
	call	sqr
	mov	edi, eax
	mov	eax, DWORD PTR 263792[rbp]
	cdq
	idiv	edi
	mov	DWORD PTR 263756[rbp], eax
	mov	eax, DWORD PTR 263756[rbp]
	mov	DWORD PTR 263752[rbp], eax
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
	jne	.L176
	mov	ecx, 2
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	r9, rax
	mov	r8d, 46
	mov	edx, 1
	lea	rcx, .LC28[rip]
	call	fwrite
	mov	eax, 1
	jmp	.L177
.L176:
	mov	ecx, 0
	call	time
	mov	ecx, eax
	call	srand
	mov	DWORD PTR 263924[rbp], 0
	jmp	.L178
.L179:
	mov	ecx, DWORD PTR 263792[rbp]
	mov	edx, DWORD PTR 263796[rbp]
	mov	eax, DWORD PTR 263924[rbp]
	mov	r8d, ecx
	mov	ecx, eax
	call	createWaterParticle
	add	DWORD PTR 263924[rbp], 1
.L178:
	mov	eax, 100
	cmp	DWORD PTR 263924[rbp], eax
	jl	.L179
	mov	DWORD PTR 263748[rbp], 62001
	mov	eax, DWORD PTR 263748[rbp]
	mov	ecx, eax
	call	SDL_Init
	test	eax, eax
	je	.L180
	call	SDL_GetError
	mov	rdx, rax
	lea	rcx, .LC29[rip]
	call	printf
	mov	eax, -1
	jmp	.L177
.L180:
	mov	edx, DWORD PTR 263796[rbp]
	mov	DWORD PTR 40[rsp], 0
	mov	eax, DWORD PTR 263792[rbp]
	mov	DWORD PTR 32[rsp], eax
	mov	r9d, edx
	mov	r8d, 536805376
	mov	edx, 536805376
	lea	rcx, .LC30[rip]
	call	SDL_CreateWindow
	mov	QWORD PTR 263736[rbp], rax
	cmp	QWORD PTR 263736[rbp], 0
	jne	.L181
	mov	rax, QWORD PTR 263800[rbp]
	mov	rdx, QWORD PTR 263816[rbp]
	lea	r8, .LC31[rip]
	mov	rcx, rax
	call	snprintf
	jmp	.L182
.L181:
	mov	rax, QWORD PTR 263736[rbp]
	mov	r8d, 4
	mov	edx, -1
	mov	rcx, rax
	call	SDL_CreateRenderer
	mov	QWORD PTR 263728[rbp], rax
	cmp	QWORD PTR 263728[rbp], 0
	jne	.L183
	mov	rax, QWORD PTR 263800[rbp]
	mov	rdx, QWORD PTR 263816[rbp]
	lea	r8, .LC32[rip]
	mov	rcx, rax
	call	snprintf
	jmp	.L182
.L183:
	mov	rax, QWORD PTR 263736[rbp]
	mov	rcx, rax
	call	SDL_GetWindowSurface
	mov	QWORD PTR 263720[rbp], rax
	cmp	QWORD PTR 263720[rbp], 0
	jne	.L184
	mov	rax, QWORD PTR 263800[rbp]
	mov	rdx, QWORD PTR 263816[rbp]
	lea	r8, .LC33[rip]
	mov	rcx, rax
	call	snprintf
	jmp	.L182
.L184:
	mov	DWORD PTR 262896[rbp], 800
	mov	DWORD PTR 262900[rbp], 100
	mov	DWORD PTR 262904[rbp], 100
	mov	DWORD PTR 262908[rbp], 100
	movabs	rax, 2338613357913204068
	mov	QWORD PTR 262784[rbp], rax
	movabs	rax, 28542640894207341
	mov	QWORD PTR 262792[rbp], rax
	lea	rdx, 262800[rbp]
	mov	eax, 0
	mov	ecx, 10
	mov	rdi, rdx
	rep stosq
	mov	rdx, rdi
	mov	DWORD PTR [rdx], eax
	add	rdx, 4
	lea	rax, 262784[rbp]
	mov	QWORD PTR 263712[rbp], rax
	lea	rax, 262896[rbp]
	mov	QWORD PTR 263704[rbp], rax
	mov	DWORD PTR 263928[rbp], 0
	mov	DWORD PTR 263700[rbp], 0
	call	TTF_Init
	cmp	eax, -1
	jne	.L185
	call	SDL_GetError
	mov	rdx, rax
	lea	rcx, .LC34[rip]
	call	printf
	mov	eax, 1
	jmp	.L177
.L185:
	mov	edx, 12
	lea	rcx, .LC35[rip]
	call	TTF_OpenFont
	mov	QWORD PTR 263688[rbp], rax
	cmp	QWORD PTR 263688[rbp], 0
	jne	.L186
	call	SDL_GetError
	mov	rdx, rax
	lea	rcx, .LC36[rip]
	call	printf
	mov	eax, 1
	jmp	.L177
.L186:
	mov	DWORD PTR 263684[rbp], 0
	mov	DWORD PTR 263932[rbp], 0
	mov	BYTE PTR 262780[rbp], 0
	mov	BYTE PTR 262781[rbp], 0
	mov	BYTE PTR 262782[rbp], 0
	mov	BYTE PTR 262783[rbp], -1
	mov	rax, QWORD PTR 263736[rbp]
	mov	r8d, 2
	mov	edx, -1
	mov	rcx, rax
	call	SDL_CreateRenderer
	mov	QWORD PTR 263672[rbp], rax
	cmp	QWORD PTR 263728[rbp], 0
	jne	.L187
	call	SDL_GetError
	mov	rdx, rax
	lea	rcx, .LC37[rip]
	call	printf
.L187:
	mov	ecx, 2
	call	IMG_Init
	mov	rax, QWORD PTR 263728[rbp]
	lea	rdx, .LC38[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 263664[rbp], rax
	mov	rax, QWORD PTR 263728[rbp]
	lea	rdx, .LC39[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 263656[rbp], rax
	mov	rax, QWORD PTR 263728[rbp]
	lea	rdx, .LC40[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 263648[rbp], rax
	mov	rax, QWORD PTR 263728[rbp]
	lea	rdx, .LC41[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 263640[rbp], rax
	mov	rax, QWORD PTR 263728[rbp]
	lea	rdx, .LC42[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 263632[rbp], rax
	mov	rax, QWORD PTR 263728[rbp]
	lea	rdx, .LC43[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 263624[rbp], rax
	mov	rax, QWORD PTR 263728[rbp]
	lea	rdx, .LC44[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 263616[rbp], rax
	mov	rax, QWORD PTR 263728[rbp]
	lea	rdx, .LC45[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 263608[rbp], rax
	mov	rax, QWORD PTR 263728[rbp]
	lea	rdx, .LC46[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 263600[rbp], rax
	mov	rax, QWORD PTR 263728[rbp]
	lea	rdx, .LC47[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 263592[rbp], rax
	mov	rax, QWORD PTR 263728[rbp]
	lea	rdx, .LC48[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 263584[rbp], rax
	mov	DWORD PTR 263580[rbp], 8
	mov	DWORD PTR 263576[rbp], 24
	mov	rax, QWORD PTR 263728[rbp]
	lea	rdx, .LC49[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 263568[rbp], rax
	mov	DWORD PTR 263564[rbp], 1440
	mov	DWORD PTR 263920[rbp], 0
	mov	DWORD PTR 263916[rbp], 0
	mov	DWORD PTR 263560[rbp], 57
	mov	DWORD PTR 263556[rbp], 60
	lea	rax, .LC50[rip]
	mov	QWORD PTR 263544[rbp], rax
	lea	rax, .LC51[rip]
	mov	QWORD PTR 263536[rbp], rax
	lea	rax, .LC52[rip]
	mov	QWORD PTR 263528[rbp], rax
	lea	rax, .LC53[rip]
	mov	QWORD PTR 263520[rbp], rax
	mov	DWORD PTR 263912[rbp], 0
	lea	rax, .LC54[rip]
	mov	QWORD PTR 263512[rbp], rax
	mov	DWORD PTR 263908[rbp], 0
	mov	eax, DWORD PTR 263764[rbp]
	mov	ecx, eax
	call	sqr
	mov	DWORD PTR 263508[rbp], eax
	mov	DWORD PTR 263504[rbp], 2
	mov	eax, DWORD PTR 263504[rbp]
	sal	eax, 8
	mov	DWORD PTR 263500[rbp], eax
	mov	DWORD PTR 263496[rbp], 2
	mov	DWORD PTR 263904[rbp], 0
	mov	r8d, DWORD PTR 263496[rbp]
	mov	ecx, DWORD PTR 263500[rbp]
	mov	edx, DWORD PTR 263508[rbp]
	lea	rax, 624[rbp]
	mov	r9d, r8d
	mov	r8d, ecx
	mov	rcx, rax
	call	level_load
	mov	DWORD PTR 263492[rbp], 131072
	mov	eax, DWORD PTR 263500[rbp]
	cdq
	idiv	DWORD PTR 263504[rbp]
	cvtsi2sd	xmm0, eax
	call	sqrt
	cvttsd2si	eax, xmm0
	mov	DWORD PTR 263488[rbp], eax
	mov	rax, QWORD PTR 263728[rbp]
	lea	rdx, .LC55[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 263480[rbp], rax
	mov	rax, QWORD PTR 263728[rbp]
	lea	rdx, .LC56[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 263472[rbp], rax
	lea	rax, 608[rbp]
	mov	ecx, DWORD PTR 263904[rbp]
	mov	rdx, rax
	call	level_get_name
	mov	edx, DWORD PTR 263904[rbp]
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
	mov	eax, DWORD PTR 263904[rbp]
	lea	edx, 31[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 5
	mov	edx, ecx
	cdqe
	mov	DWORD PTR 544[rbp+rax*4], edx
	mov	DWORD PTR 263468[rbp], 0
	mov	DWORD PTR 263464[rbp], 10
	mov	eax, 42
	mov	BYTE PTR 542[rbp], al
	mov	rax, QWORD PTR 263728[rbp]
	lea	rdx, .LC57[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 263456[rbp], rax
	mov	BYTE PTR 263455[rbp], -128
	mov	eax, DWORD PTR 263756[rbp]
	imul	eax, DWORD PTR 263760[rbp]
	lea	edx, 0[0+rax*8]
	mov	eax, DWORD PTR 263788[rbp]
	add	eax, edx
	mov	DWORD PTR 496[rbp], eax
	mov	eax, DWORD PTR 263752[rbp]
	imul	eax, DWORD PTR 263760[rbp]
	lea	edx, 0[0+rax*8]
	mov	eax, DWORD PTR 263784[rbp]
	add	eax, edx
	mov	DWORD PTR 500[rbp], eax
	mov	BYTE PTR 512[rbp], 0
	mov	BYTE PTR 513[rbp], 0
	mov	BYTE PTR 514[rbp], 1
	mov	BYTE PTR 515[rbp], 12
	mov	BYTE PTR 516[rbp], 0
	mov	BYTE PTR 517[rbp], 2
	mov	BYTE PTR 518[rbp], 12
	mov	DWORD PTR 528[rbp], 50
	mov	DWORD PTR 524[rbp], 100
	mov	DWORD PTR 520[rbp], 50
	lea	rax, 464[rbp]
	mov	DWORD PTR 48[rsp], 10
	mov	DWORD PTR 40[rsp], 100
	mov	DWORD PTR 32[rsp], 100
	mov	r9d, 100
	mov	r8d, 500
	mov	edx, 500
	mov	rcx, rax
	call	initEnemy
	lea	rax, 464[rbp]
	mov	QWORD PTR globalEnemy[rip], rax
	mov	rax, QWORD PTR 263728[rbp]
	lea	rdx, .LC58[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 263440[rbp], rax
	lea	rax, .LC59[rip]
	mov	QWORD PTR 263432[rbp], rax
	mov	rax, QWORD PTR 263432[rbp]
	lea	rdx, .LC4[rip]
	mov	rcx, rax
	call	SDL_RWFromFile
	mov	r10, rax
	lea	rcx, 424[rbp]
	lea	rdx, 432[rbp]
	lea	rax, 420[rbp]
	mov	QWORD PTR 32[rsp], rax
	mov	r9, rcx
	mov	r8, rdx
	mov	edx, 1
	mov	rcx, r10
	call	SDL_LoadWAV_RW
	test	rax, rax
	jne	.L188
	call	SDL_GetError
	mov	rdx, rax
	lea	rcx, .LC60[rip]
	call	printf
	jmp	.L189
.L188:
	mov	rax, QWORD PTR 424[rbp]
	mov	QWORD PTR 400[rbp], rax
	mov	eax, DWORD PTR 420[rbp]
	mov	DWORD PTR 408[rbp], eax
	mov	DWORD PTR 412[rbp], 0
	lea	rax, audioCallback[rip]
	mov	QWORD PTR 448[rbp], rax
	lea	rax, 400[rbp]
	mov	QWORD PTR 456[rbp], rax
	lea	rax, 432[rbp]
	mov	DWORD PTR 32[rsp], 0
	mov	r9d, 0
	mov	r8, rax
	mov	edx, 0
	mov	ecx, 0
	call	SDL_OpenAudioDevice
	mov	DWORD PTR 263428[rbp], eax
	cmp	DWORD PTR 263428[rbp], 0
	jne	.L190
	call	SDL_GetError
	mov	rdx, rax
	lea	rcx, .LC61[rip]
	call	printf
	mov	rax, QWORD PTR 424[rbp]
	mov	rcx, rax
	call	SDL_FreeWAV
	jmp	.L189
.L190:
	mov	ecx, DWORD PTR 420[rbp]
	mov	rdx, QWORD PTR 424[rbp]
	mov	eax, DWORD PTR 263428[rbp]
	mov	r8d, ecx
	mov	ecx, eax
	call	SDL_QueueAudio
	mov	eax, DWORD PTR 263428[rbp]
	mov	edx, 0
	mov	ecx, eax
	call	SDL_PauseAudioDevice
	mov	DWORD PTR 263900[rbp], 1
	mov	rax, QWORD PTR 263728[rbp]
	lea	rdx, .LC62[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 263416[rbp], rax
	mov	rax, QWORD PTR 263728[rbp]
	lea	rdx, .LC63[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 263408[rbp], rax
	mov	rax, QWORD PTR 263728[rbp]
	lea	rdx, .LC64[rip]
	mov	rcx, rax
	call	IMG_LoadTexture
	mov	QWORD PTR 263400[rbp], rax
	lea	rax, .LC65[rip]
	mov	QWORD PTR 263392[rbp], rax
	lea	rax, .LC66[rip]
	mov	QWORD PTR 263384[rbp], rax
	mov	rax, QWORD PTR 263392[rbp]
	mov	rcx, rax
	call	strlen
	mov	DWORD PTR 263380[rbp], eax
	mov	rax, QWORD PTR 263384[rbp]
	mov	rcx, rax
	call	strlen
	mov	DWORD PTR 263376[rbp], eax
	mov	DWORD PTR 263896[rbp], 1
	lea	rcx, .LC67[rip]
	call	puts
	jmp	.L191
.L238:
	mov	eax, DWORD PTR 262912[rbp]
	cmp	eax, 768
	je	.L193
	cmp	eax, 769
	je	.L194
	cmp	eax, 256
	jne	.L192
	mov	DWORD PTR 263896[rbp], 0
	jmp	.L192
.L193:
	mov	DWORD PTR 263372[rbp], 1
	mov	eax, DWORD PTR 262932[rbp]
	cmp	eax, 54
	je	.L195
	cmp	eax, 54
	jg	.L196
	cmp	eax, 49
	je	.L197
	cmp	eax, 49
	jg	.L198
	cmp	eax, 32
	je	.L199
	cmp	eax, 48
	je	.L200
	cmp	eax, 27
	je	.L201
	jmp	.L192
.L198:
	cmp	eax, 51
	je	.L203
	cmp	eax, 51
	jl	.L204
	cmp	eax, 52
	je	.L205
	cmp	eax, 53
	je	.L206
	jmp	.L192
.L196:
	cmp	eax, 1073741903
	je	.L207
	cmp	eax, 1073741903
	jg	.L208
	cmp	eax, 56
	je	.L209
	cmp	eax, 56
	jl	.L210
	cmp	eax, 57
	je	.L211
	cmp	eax, 1073741883
	je	.L212
	jmp	.L192
.L208:
	cmp	eax, 1073741905
	je	.L213
	cmp	eax, 1073741905
	jl	.L214
	cmp	eax, 1073741906
	je	.L215
	cmp	eax, 1073741912
	je	.L216
	jmp	.L192
.L201:
	mov	DWORD PTR 263896[rbp], 0
	jmp	.L202
.L207:
	mov	eax, DWORD PTR 263372[rbp]
	mov	DWORD PTR glob_vk_right[rip], eax
	jmp	.L202
.L214:
	mov	eax, DWORD PTR 263372[rbp]
	mov	DWORD PTR glob_vk_left[rip], eax
	jmp	.L202
.L215:
	mov	eax, DWORD PTR 263372[rbp]
	mov	DWORD PTR glob_vk_up[rip], eax
	jmp	.L202
.L213:
	mov	eax, DWORD PTR 263372[rbp]
	mov	DWORD PTR glob_vk_down[rip], eax
	jmp	.L202
.L199:
	mov	eax, DWORD PTR 263372[rbp]
	mov	DWORD PTR glob_vk_space[rip], eax
	jmp	.L202
.L216:
	mov	eax, DWORD PTR 263372[rbp]
	mov	DWORD PTR glob_vk_enter[rip], eax
	jmp	.L202
.L212:
	mov	eax, DWORD PTR 263372[rbp]
	mov	DWORD PTR glob_vk_f2[rip], eax
	jmp	.L202
.L200:
	mov	eax, DWORD PTR 263372[rbp]
	mov	DWORD PTR glob_vk_0[rip], eax
	jmp	.L202
.L197:
	mov	eax, DWORD PTR 263372[rbp]
	mov	DWORD PTR glob_vk_1[rip], eax
	jmp	.L202
.L204:
	mov	eax, DWORD PTR 263372[rbp]
	mov	DWORD PTR glob_vk_2[rip], eax
	jmp	.L202
.L203:
	mov	eax, DWORD PTR 263372[rbp]
	mov	DWORD PTR glob_vk_3[rip], eax
	jmp	.L202
.L205:
	mov	eax, DWORD PTR 263372[rbp]
	mov	DWORD PTR glob_vk_4[rip], eax
	jmp	.L202
.L206:
	mov	eax, DWORD PTR 263372[rbp]
	mov	DWORD PTR glob_vk_5[rip], eax
	jmp	.L202
.L195:
	mov	eax, DWORD PTR 263372[rbp]
	mov	DWORD PTR glob_vk_6[rip], eax
	jmp	.L202
.L210:
	mov	eax, DWORD PTR 263372[rbp]
	mov	DWORD PTR glob_vk_7[rip], eax
	jmp	.L202
.L209:
	mov	eax, DWORD PTR 263372[rbp]
	mov	DWORD PTR glob_vk_8[rip], eax
	jmp	.L202
.L211:
	mov	eax, DWORD PTR 263372[rbp]
	mov	DWORD PTR glob_vk_9[rip], eax
	nop
.L202:
	jmp	.L192
.L194:
	mov	DWORD PTR 263368[rbp], 0
	mov	eax, DWORD PTR 262932[rbp]
	cmp	eax, 55
	je	.L217
	cmp	eax, 55
	jg	.L218
	cmp	eax, 50
	je	.L219
	cmp	eax, 50
	jg	.L220
	cmp	eax, 48
	je	.L221
	cmp	eax, 48
	jg	.L222
	cmp	eax, 32
	je	.L223
	jmp	.L365
.L220:
	cmp	eax, 52
	je	.L225
	cmp	eax, 52
	jl	.L226
	cmp	eax, 53
	je	.L227
	cmp	eax, 54
	je	.L228
	jmp	.L365
.L218:
	cmp	eax, 1073741903
	je	.L229
	cmp	eax, 1073741903
	jg	.L230
	cmp	eax, 57
	je	.L231
	cmp	eax, 57
	jl	.L232
	cmp	eax, 1073741883
	je	.L233
	jmp	.L365
.L230:
	cmp	eax, 1073741905
	je	.L234
	cmp	eax, 1073741905
	jl	.L235
	cmp	eax, 1073741906
	je	.L236
	cmp	eax, 1073741912
	je	.L237
	jmp	.L365
.L229:
	mov	eax, DWORD PTR 263368[rbp]
	mov	DWORD PTR glob_vk_right[rip], eax
	jmp	.L224
.L235:
	mov	eax, DWORD PTR 263368[rbp]
	mov	DWORD PTR glob_vk_left[rip], eax
	jmp	.L224
.L236:
	mov	eax, DWORD PTR 263368[rbp]
	mov	DWORD PTR glob_vk_up[rip], eax
	jmp	.L224
.L234:
	mov	eax, DWORD PTR 263368[rbp]
	mov	DWORD PTR glob_vk_down[rip], eax
	jmp	.L224
.L223:
	mov	eax, DWORD PTR 263368[rbp]
	mov	DWORD PTR glob_vk_space[rip], eax
	jmp	.L224
.L237:
	mov	eax, DWORD PTR 263368[rbp]
	mov	DWORD PTR glob_vk_enter[rip], eax
	jmp	.L224
.L233:
	mov	eax, DWORD PTR 263368[rbp]
	mov	DWORD PTR glob_vk_f2[rip], eax
	jmp	.L224
.L221:
	mov	eax, DWORD PTR 263368[rbp]
	mov	DWORD PTR glob_vk_0[rip], eax
	jmp	.L224
.L222:
	mov	eax, DWORD PTR 263368[rbp]
	mov	DWORD PTR glob_vk_1[rip], eax
	jmp	.L224
.L219:
	mov	eax, DWORD PTR 263368[rbp]
	mov	DWORD PTR glob_vk_2[rip], eax
	jmp	.L224
.L226:
	mov	eax, DWORD PTR 263368[rbp]
	mov	DWORD PTR glob_vk_3[rip], eax
	jmp	.L224
.L225:
	mov	eax, DWORD PTR 263368[rbp]
	mov	DWORD PTR glob_vk_4[rip], eax
	jmp	.L224
.L227:
	mov	eax, DWORD PTR 263368[rbp]
	mov	DWORD PTR glob_vk_5[rip], eax
	jmp	.L224
.L228:
	mov	eax, DWORD PTR 263368[rbp]
	mov	DWORD PTR glob_vk_6[rip], eax
	jmp	.L224
.L217:
	mov	eax, DWORD PTR 263368[rbp]
	mov	DWORD PTR glob_vk_7[rip], eax
	jmp	.L224
.L232:
	mov	eax, DWORD PTR 263368[rbp]
	mov	DWORD PTR glob_vk_8[rip], eax
	jmp	.L224
.L231:
	mov	eax, DWORD PTR 263368[rbp]
	mov	DWORD PTR glob_vk_9[rip], eax
	nop
.L224:
.L365:
	nop
.L192:
	lea	rax, 262912[rbp]
	mov	rcx, rax
	call	SDL_PollEvent
	test	eax, eax
	jne	.L238
	mov	eax, DWORD PTR glob_vk_f2[rip]
	test	eax, eax
	je	.L239
	lea	rcx, .LC68[rip]
	call	puts
	lea	rax, 624[rbp]
	mov	rcx, rax
	call	dev_tiled_to_leveldata
	lea	rcx, .LC69[rip]
	call	puts
.L239:
	mov	eax, DWORD PTR glob_vk_7[rip]
	test	eax, eax
	je	.L240
	mov	DWORD PTR glob_vk_7[rip], 0
	lea	rax, 496[rbp]
	mov	rcx, rax
	call	attack
	lea	rcx, 496[rbp]
	mov	rdx, QWORD PTR 263648[rbp]
	mov	rax, QWORD PTR 263728[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	renderWeaponSwing
.L240:
	mov	eax, DWORD PTR glob_vk_8[rip]
	test	eax, eax
	je	.L241
	mov	DWORD PTR glob_vk_8[rip], 0
	movzx	eax, BYTE PTR quizOn[rip]
	xor	eax, 1
	test	al, al
	je	.L242
	mov	BYTE PTR quizOn[rip], 1
	mov	DWORD PTR quizOn1[rip], 1
	lea	rcx, .LC70[rip]
	call	printf
	jmp	.L241
.L242:
	mov	BYTE PTR quizOn[rip], 0
	mov	DWORD PTR quizOn1[rip], 0
.L241:
	mov	eax, DWORD PTR glob_vk_0[rip]
	test	eax, eax
	je	.L243
	mov	DWORD PTR glob_vk_0[rip], 0
	mov	eax, DWORD PTR waterOn[rip]
	test	eax, eax
	jne	.L244
	mov	DWORD PTR waterOn[rip], 1
	call	activateAllWaterParticles
	jmp	.L243
.L244:
	mov	DWORD PTR waterOn[rip], 0
	call	deactivateAllWaterParticles
.L243:
	mov	eax, DWORD PTR glob_vk_9[rip]
	test	eax, eax
	je	.L245
	mov	DWORD PTR glob_vk_9[rip], 0
	cmp	DWORD PTR 263928[rbp], 0
	jne	.L246
	mov	DWORD PTR 263928[rbp], 1
	lea	rax, 262784[rbp]
	movabs	rdi, 3184362091757007472
	mov	QWORD PTR [rax], rdi
	mov	DWORD PTR 8[rax], 741551154
	mov	WORD PTR 12[rax], 52
	jmp	.L245
.L246:
	mov	DWORD PTR 263928[rbp], 0
.L245:
	mov	eax, DWORD PTR glob_vk_1[rip]
	test	eax, eax
	je	.L247
	mov	DWORD PTR glob_vk_1[rip], 0
	cmp	DWORD PTR 263928[rbp], 1
	jne	.L248
	lea	rax, .LC71[rip]
	mov	QWORD PTR 263360[rbp], rax
	mov	QWORD PTR 263352[rbp], 99
	mov	rcx, QWORD PTR 263352[rbp]
	mov	rdx, QWORD PTR 263360[rbp]
	lea	rax, 262784[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	strncpy
	lea	rax, 262784[rbp]
	mov	rdx, QWORD PTR 263352[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	add	DWORD PTR 263932[rbp], 50
	jmp	.L247
.L248:
	movzx	eax, BYTE PTR quizOn[rip]
	test	al, al
	je	.L247
	mov	DWORD PTR userAnswer[rip], 1
.L247:
	mov	eax, DWORD PTR glob_vk_2[rip]
	test	eax, eax
	je	.L249
	mov	DWORD PTR glob_vk_2[rip], 0
	cmp	DWORD PTR 263928[rbp], 1
	jne	.L250
	lea	rax, .LC72[rip]
	mov	QWORD PTR 263344[rbp], rax
	mov	QWORD PTR 263336[rbp], 99
	mov	rcx, QWORD PTR 263336[rbp]
	mov	rdx, QWORD PTR 263344[rbp]
	lea	rax, 262784[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	strncpy
	lea	rax, 262784[rbp]
	mov	rdx, QWORD PTR 263336[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	add	DWORD PTR 263932[rbp], 50
	jmp	.L249
.L250:
	movzx	eax, BYTE PTR quizOn[rip]
	test	al, al
	je	.L249
	mov	DWORD PTR userAnswer[rip], 2
.L249:
	mov	eax, DWORD PTR glob_vk_3[rip]
	test	eax, eax
	je	.L251
	mov	DWORD PTR glob_vk_3[rip], 0
	cmp	DWORD PTR 263928[rbp], 1
	jne	.L252
	lea	rax, .LC73[rip]
	mov	QWORD PTR 263328[rbp], rax
	mov	QWORD PTR 263320[rbp], 99
	mov	rcx, QWORD PTR 263320[rbp]
	mov	rdx, QWORD PTR 263328[rbp]
	lea	rax, 262784[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	strncpy
	lea	rax, 262784[rbp]
	mov	rdx, QWORD PTR 263320[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	add	DWORD PTR 263932[rbp], 50
	jmp	.L251
.L252:
	movzx	eax, BYTE PTR quizOn[rip]
	test	al, al
	je	.L251
	mov	DWORD PTR userAnswer[rip], 3
.L251:
	mov	eax, DWORD PTR glob_vk_4[rip]
	test	eax, eax
	je	.L253
	mov	DWORD PTR glob_vk_4[rip], 0
	cmp	DWORD PTR 263928[rbp], 1
	jne	.L253
	lea	rax, .LC74[rip]
	mov	QWORD PTR 263312[rbp], rax
	mov	QWORD PTR 263304[rbp], 99
	mov	rcx, QWORD PTR 263304[rbp]
	mov	rdx, QWORD PTR 263312[rbp]
	lea	rax, 262784[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	strncpy
	lea	rax, 262784[rbp]
	mov	rdx, QWORD PTR 263304[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	add	DWORD PTR 263932[rbp], 50
.L253:
	mov	eax, DWORD PTR glob_vk_5[rip]
	test	eax, eax
	je	.L254
	mov	DWORD PTR glob_vk_5[rip], 0
	mov	ecx, 10
	call	damageMe
.L254:
	mov	eax, DWORD PTR glob_vk_6[rip]
	test	eax, eax
	je	.L255
	mov	DWORD PTR glob_vk_6[rip], 0
	mov	ecx, 10
	call	healMe
.L255:
	mov	eax, DWORD PTR glob_vk_right[rip]
	test	eax, eax
	je	.L256
	mov	BYTE PTR 512[rbp], 0
	mov	edx, DWORD PTR 496[rbp]
	movzx	eax, BYTE PTR 518[rbp]
	movzx	eax, al
	add	eax, edx
	mov	DWORD PTR 496[rbp], eax
.L256:
	mov	eax, DWORD PTR glob_vk_up[rip]
	test	eax, eax
	je	.L257
	mov	BYTE PTR 512[rbp], 1
	mov	edx, DWORD PTR 500[rbp]
	movzx	eax, BYTE PTR 518[rbp]
	movzx	eax, al
	sub	edx, eax
	mov	eax, edx
	mov	DWORD PTR 500[rbp], eax
.L257:
	mov	eax, DWORD PTR glob_vk_left[rip]
	test	eax, eax
	je	.L258
	mov	BYTE PTR 512[rbp], 2
	mov	edx, DWORD PTR 496[rbp]
	movzx	eax, BYTE PTR 518[rbp]
	movzx	eax, al
	sub	edx, eax
	mov	eax, edx
	mov	DWORD PTR 496[rbp], eax
.L258:
	mov	eax, DWORD PTR glob_vk_down[rip]
	test	eax, eax
	je	.L259
	mov	BYTE PTR 512[rbp], 3
	mov	edx, DWORD PTR 500[rbp]
	movzx	eax, BYTE PTR 518[rbp]
	movzx	eax, al
	add	eax, edx
	mov	DWORD PTR 500[rbp], eax
.L259:
	mov	edx, DWORD PTR glob_vk_right[rip]
	mov	eax, DWORD PTR glob_vk_left[rip]
	or	edx, eax
	mov	eax, DWORD PTR glob_vk_up[rip]
	or	edx, eax
	mov	eax, DWORD PTR glob_vk_down[rip]
	or	eax, edx
	test	eax, eax
	je	.L260
	movzx	edx, BYTE PTR 513[rbp]
	movzx	eax, BYTE PTR 514[rbp]
	add	eax, edx
	mov	BYTE PTR 513[rbp], al
	movzx	eax, BYTE PTR 516[rbp]
	movzx	ecx, BYTE PTR 513[rbp]
	movzx	edx, BYTE PTR 515[rbp]
	cmp	cl, dl
	setnb	dl
	add	eax, edx
	mov	BYTE PTR 516[rbp], al
	movzx	eax, BYTE PTR 513[rbp]
	movzx	edx, BYTE PTR 515[rbp]
	movzx	eax, al
	div	dl
	movzx	eax, ah
	mov	BYTE PTR 513[rbp], al
	movzx	eax, BYTE PTR 516[rbp]
	movzx	edx, BYTE PTR 517[rbp]
	movzx	eax, al
	div	dl
	movzx	eax, ah
	mov	BYTE PTR 516[rbp], al
	mov	eax, DWORD PTR 263760[rbp]
	imul	eax, DWORD PTR 263756[rbp]
	mov	edx, DWORD PTR 263772[rbp]
	sub	edx, eax
	mov	eax, edx
	mov	DWORD PTR 263300[rbp], eax
	mov	eax, DWORD PTR 263784[rbp]
	mov	DWORD PTR 263296[rbp], eax
	mov	eax, DWORD PTR 263788[rbp]
	mov	DWORD PTR 263292[rbp], eax
	mov	eax, DWORD PTR 263760[rbp]
	imul	eax, DWORD PTR 263752[rbp]
	mov	edx, DWORD PTR 263768[rbp]
	sub	edx, eax
	mov	eax, edx
	mov	DWORD PTR 263288[rbp], eax
	mov	DWORD PTR 263284[rbp], 0
	mov	eax, DWORD PTR 496[rbp]
	cmp	DWORD PTR 263300[rbp], eax
	jl	.L261
	mov	eax, DWORD PTR 500[rbp]
	cmp	DWORD PTR 263288[rbp], eax
	jl	.L261
	mov	eax, DWORD PTR 496[rbp]
	cmp	DWORD PTR 263292[rbp], eax
	jg	.L261
	mov	eax, DWORD PTR 500[rbp]
	cmp	DWORD PTR 263296[rbp], eax
	jle	.L262
.L261:
	mov	eax, 1
	jmp	.L263
.L262:
	mov	eax, 0
.L263:
	mov	DWORD PTR 263284[rbp], eax
	mov	eax, DWORD PTR 496[rbp]
	cmp	DWORD PTR 263300[rbp], eax
	jge	.L264
	mov	eax, DWORD PTR 263292[rbp]
	mov	DWORD PTR 496[rbp], eax
	add	DWORD PTR 263904[rbp], 1
.L264:
	mov	eax, DWORD PTR 500[rbp]
	cmp	DWORD PTR 263296[rbp], eax
	jle	.L265
	mov	eax, DWORD PTR 263288[rbp]
	mov	DWORD PTR 500[rbp], eax
	mov	eax, DWORD PTR 263488[rbp]
	sub	DWORD PTR 263904[rbp], eax
.L265:
	mov	eax, DWORD PTR 496[rbp]
	cmp	DWORD PTR 263292[rbp], eax
	jle	.L266
	mov	eax, DWORD PTR 263300[rbp]
	mov	DWORD PTR 496[rbp], eax
	sub	DWORD PTR 263904[rbp], 1
.L266:
	mov	eax, DWORD PTR 500[rbp]
	cmp	DWORD PTR 263288[rbp], eax
	jge	.L267
	mov	eax, DWORD PTR 263296[rbp]
	mov	DWORD PTR 500[rbp], eax
	mov	eax, DWORD PTR 263488[rbp]
	add	DWORD PTR 263904[rbp], eax
.L267:
	cmp	DWORD PTR 263284[rbp], 0
	je	.L269
	mov	eax, DWORD PTR 263500[rbp]
	add	DWORD PTR 263904[rbp], eax
	mov	eax, DWORD PTR 263904[rbp]
	cdq
	idiv	DWORD PTR 263500[rbp]
	mov	DWORD PTR 263904[rbp], edx
	lea	rax, 608[rbp]
	mov	ecx, DWORD PTR 263904[rbp]
	mov	rdx, rax
	call	level_get_name
	mov	eax, DWORD PTR 263904[rbp]
	lea	edx, 31[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 5
	mov	r9d, eax
	movsx	rax, r9d
	mov	r8d, DWORD PTR 544[rbp+rax*4]
	mov	edx, DWORD PTR 263904[rbp]
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
	mov	DWORD PTR 544[rbp+rax*4], edx
	jmp	.L269
.L260:
	mov	BYTE PTR 513[rbp], 0
	mov	BYTE PTR 516[rbp], 0
.L269:
	mov	edx, DWORD PTR glob_vk_space[rip]
	mov	eax, DWORD PTR glob_vk_enter[rip]
	or	eax, edx
	test	eax, eax
	je	.L270
	mov	DWORD PTR 263900[rbp], 0
.L270:
	mov	eax, DWORD PTR 496[rbp]
	mov	DWORD PTR 504[rbp], eax
	mov	eax, DWORD PTR 500[rbp]
	mov	DWORD PTR 508[rbp], eax
	mov	DWORD PTR 263892[rbp], 0
	jmp	.L271
.L275:
	lea	rax, waterParticles[rip]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR 263892[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	mov	eax, DWORD PTR 12[rax]
	test	eax, eax
	je	.L272
	lea	rax, waterParticles[rip]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR 263892[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	movss	xmm1, DWORD PTR 4[rax]
	lea	rax, waterParticles[rip]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR 263892[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	movss	xmm0, DWORD PTR 8[rax]
	lea	rax, waterParticles[rip]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR 263892[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	addss	xmm0, xmm1
	movss	DWORD PTR 4[rax], xmm0
	lea	rax, waterParticles[rip]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR 263892[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	movss	xmm0, DWORD PTR 4[rax]
	cvtsi2ss	xmm1, DWORD PTR 263792[rbp]
	comiss	xmm0, xmm1
	jbe	.L272
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
	jg	.L274
	lea	rax, waterParticles[rip]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR 263892[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	mov	DWORD PTR 12[rax], 0
	jmp	.L272
.L274:
	mov	ecx, DWORD PTR 263792[rbp]
	mov	edx, DWORD PTR 263796[rbp]
	mov	eax, DWORD PTR 263892[rbp]
	mov	r8d, ecx
	mov	ecx, eax
	call	createWaterParticle
.L272:
	add	DWORD PTR 263892[rbp], 1
.L271:
	mov	eax, 100
	cmp	DWORD PTR 263892[rbp], eax
	jl	.L275
	mov	eax, DWORD PTR 263556[rbp]
	add	DWORD PTR 263916[rbp], eax
	jmp	.L276
.L277:
	add	DWORD PTR 263920[rbp], 1
	mov	eax, DWORD PTR 263560[rbp]
	sub	DWORD PTR 263916[rbp], eax
.L276:
	mov	eax, DWORD PTR 263916[rbp]
	cmp	eax, DWORD PTR 263560[rbp]
	jge	.L277
	mov	eax, DWORD PTR 263920[rbp]
	cmp	eax, DWORD PTR 263564[rbp]
	setge	al
	movzx	eax, al
	mov	edx, DWORD PTR 263912[rbp]
	add	eax, edx
	movsx	rdx, eax
	imul	rdx, rdx, -1840700269
	shr	rdx, 32
	add	edx, eax
	mov	ecx, edx
	sar	ecx, 2
	cdq
	sub	ecx, edx
	mov	edx, ecx
	mov	DWORD PTR 263912[rbp], edx
	mov	ecx, DWORD PTR 263912[rbp]
	mov	edx, ecx
	sal	edx, 3
	sub	edx, ecx
	sub	eax, edx
	mov	DWORD PTR 263912[rbp], eax
	mov	eax, DWORD PTR 263920[rbp]
	cmp	eax, DWORD PTR 263564[rbp]
	setge	al
	movzx	eax, al
	mov	edx, DWORD PTR 263908[rbp]
	add	eax, edx
	movsx	rdx, eax
	imul	rdx, rdx, -1840700269
	shr	rdx, 32
	add	edx, eax
	mov	ecx, edx
	sar	ecx, 4
	cdq
	sub	ecx, edx
	mov	edx, ecx
	mov	DWORD PTR 263908[rbp], edx
	mov	edx, DWORD PTR 263908[rbp]
	imul	edx, edx, 28
	sub	eax, edx
	mov	DWORD PTR 263908[rbp], eax
	mov	eax, DWORD PTR 263920[rbp]
	cdq
	idiv	DWORD PTR 263564[rbp]
	mov	DWORD PTR 263920[rbp], edx
	mov	eax, DWORD PTR 263916[rbp]
	cdq
	idiv	DWORD PTR 263560[rbp]
	mov	DWORD PTR 263916[rbp], edx
	lea	rdx, 539[rbp]
	lea	rax, 388[rbp]
	mov	rcx, rax
	call	strcpy
	cmp	DWORD PTR 263464[rbp], 0
	js	.L278
	mov	eax, 43
	jmp	.L279
.L278:
	mov	eax, 45
.L279:
	mov	BYTE PTR 388[rbp], al
	mov	ecx, DWORD PTR 263464[rbp]
	mov	edx, 1717986919
	mov	eax, ecx
	imul	edx
	sar	edx, 2
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	add	eax, 48
	mov	BYTE PTR 389[rbp], al
	mov	ecx, DWORD PTR 263464[rbp]
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
	mov	BYTE PTR 390[rbp], al
	mov	eax, 42
	mov	BYTE PTR 391[rbp], al
	cmp	DWORD PTR 263468[rbp], 0
	jne	.L280
	mov	eax, 67
	jmp	.L281
.L280:
	mov	eax, 70
.L281:
	mov	BYTE PTR 392[rbp], al
	mov	edx, 0
	mov	rax, QWORD PTR 263728[rbp]
	mov	rcx, rax
	call	draw_clear
	mov	edx, 16777215
	mov	rax, QWORD PTR 263728[rbp]
	mov	rcx, rax
	call	draw_set_color
	mov	edx, 33023
	mov	ecx, DWORD PTR 263788[rbp]
	mov	rax, QWORD PTR 263728[rbp]
	mov	DWORD PTR 40[rsp], edx
	mov	edx, DWORD PTR 263792[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, ecx
	mov	r8d, 0
	mov	edx, 0
	mov	rcx, rax
	call	draw_rectangle_color
	mov	ecx, DWORD PTR 263788[rbp]
	mov	rax, QWORD PTR 263728[rbp]
	mov	rdx, QWORD PTR 263608[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	edx, DWORD PTR 263792[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, ecx
	mov	r8d, 0
	mov	edx, 0
	mov	rcx, rax
	call	draw_image
	mov	r8d, 8388863
	mov	eax, DWORD PTR 263796[rbp]
	sub	eax, DWORD PTR 263788[rbp]
	mov	ecx, eax
	mov	edx, DWORD PTR 263788[rbp]
	mov	rax, QWORD PTR 263728[rbp]
	mov	DWORD PTR 40[rsp], r8d
	mov	r8d, DWORD PTR 263792[rbp]
	mov	DWORD PTR 32[rsp], r8d
	mov	r9d, ecx
	mov	r8d, 0
	mov	rcx, rax
	call	draw_rectangle_color
	mov	edx, 33023
	mov	eax, DWORD PTR 263796[rbp]
	sub	eax, DWORD PTR 263788[rbp]
	mov	r8d, DWORD PTR 263796[rbp]
	mov	rcx, QWORD PTR 263728[rbp]
	mov	DWORD PTR 40[rsp], edx
	mov	edx, DWORD PTR 263792[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, r8d
	mov	r8d, 0
	mov	edx, eax
	call	draw_rectangle_color
	mov	eax, DWORD PTR 263796[rbp]
	sub	eax, DWORD PTR 263788[rbp]
	mov	r8d, DWORD PTR 263796[rbp]
	mov	rcx, QWORD PTR 263728[rbp]
	mov	rdx, QWORD PTR 263608[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	edx, DWORD PTR 263792[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, r8d
	mov	r8d, 0
	mov	edx, eax
	call	draw_image
	mov	DWORD PTR 263280[rbp], 0
	mov	eax, DWORD PTR 263756[rbp]
	mov	DWORD PTR 263276[rbp], eax
	mov	eax, DWORD PTR 263752[rbp]
	mov	DWORD PTR 263272[rbp], eax
	cmp	DWORD PTR 263900[rbp], 0
	jne	.L282
	mov	eax, DWORD PTR 263576[rbp]
	imul	eax, DWORD PTR 263752[rbp]
	mov	edx, DWORD PTR 263580[rbp]
	imul	edx, DWORD PTR 263756[rbp]
	mov	r8d, edx
	mov	r10d, DWORD PTR 263272[rbp]
	mov	edx, DWORD PTR 263276[rbp]
	mov	rcx, QWORD PTR 263728[rbp]
	mov	r9d, DWORD PTR 263280[rbp]
	mov	DWORD PTR 72[rsp], r9d
	mov	r9d, DWORD PTR 263576[rbp]
	mov	DWORD PTR 64[rsp], r9d
	mov	r9d, DWORD PTR 263580[rbp]
	mov	DWORD PTR 56[rsp], r9d
	lea	r9, .LC75[rip]
	mov	QWORD PTR 48[rsp], r9
	mov	r9, QWORD PTR 263584[rbp]
	mov	QWORD PTR 40[rsp], r9
	mov	DWORD PTR 32[rsp], eax
	mov	r9d, r8d
	mov	r8d, r10d
	call	draw_text_color
	mov	eax, DWORD PTR 263576[rbp]
	imul	eax, DWORD PTR 263752[rbp]
	add	DWORD PTR 263272[rbp], eax
	mov	DWORD PTR 263268[rbp], 200
	mov	DWORD PTR 263264[rbp], 20
	mov	eax, DWORD PTR health[rip]
	imul	eax, DWORD PTR 263268[rbp]
	mov	esi, DWORD PTR maxHealth[rip]
	cdq
	idiv	esi
	mov	DWORD PTR 263260[rbp], eax
	mov	DWORD PTR 263256[rbp], 255
	mov	r9d, 0
	mov	edx, DWORD PTR 263272[rbp]
	mov	eax, DWORD PTR 263264[rbp]
	add	edx, eax
	mov	r8d, DWORD PTR 263268[rbp]
	mov	ecx, DWORD PTR 263272[rbp]
	mov	rax, QWORD PTR 263728[rbp]
	mov	DWORD PTR 40[rsp], r9d
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, r8d
	mov	r8d, ecx
	mov	edx, 0
	mov	rcx, rax
	call	draw_rectangle_color
	mov	edx, DWORD PTR 263272[rbp]
	mov	eax, DWORD PTR 263264[rbp]
	add	edx, eax
	mov	r9d, DWORD PTR 263260[rbp]
	mov	r8d, DWORD PTR 263272[rbp]
	mov	rax, QWORD PTR 263728[rbp]
	mov	ecx, DWORD PTR 263256[rbp]
	mov	DWORD PTR 40[rsp], ecx
	mov	DWORD PTR 32[rsp], edx
	mov	edx, 0
	mov	rcx, rax
	call	draw_rectangle_color
	mov	eax, DWORD PTR 263264[rbp]
	add	DWORD PTR 263272[rbp], eax
	mov	DWORD PTR 263888[rbp], 0
	mov	DWORD PTR 263252[rbp], 32
	mov	DWORD PTR 263884[rbp], 0
	jmp	.L283
.L284:
	mov	eax, DWORD PTR 263884[rbp]
	imul	eax, DWORD PTR 263252[rbp]
	mov	ecx, DWORD PTR 263272[rbp]
	mov	edx, DWORD PTR 263888[rbp]
	add	ecx, edx
	mov	edx, DWORD PTR 263252[rbp]
	imul	edx, DWORD PTR 263752[rbp]
	lea	r8d, [rcx+rdx]
	mov	edx, DWORD PTR 263252[rbp]
	imul	edx, DWORD PTR 263756[rbp]
	mov	ecx, DWORD PTR 263276[rbp]
	lea	r11d, [rdx+rcx]
	mov	ecx, DWORD PTR 263272[rbp]
	mov	edx, DWORD PTR 263888[rbp]
	lea	r10d, [rcx+rdx]
	mov	edx, DWORD PTR 263276[rbp]
	mov	rcx, QWORD PTR 263728[rbp]
	mov	r9d, DWORD PTR 263252[rbp]
	mov	DWORD PTR 72[rsp], r9d
	mov	r9d, DWORD PTR 263252[rbp]
	mov	DWORD PTR 64[rsp], r9d
	mov	DWORD PTR 56[rsp], 0
	mov	DWORD PTR 48[rsp], eax
	mov	rax, QWORD PTR 263440[rbp]
	mov	QWORD PTR 40[rsp], rax
	mov	DWORD PTR 32[rsp], r8d
	mov	r9d, r11d
	mov	r8d, r10d
	call	draw_image_part
	mov	eax, DWORD PTR 263884[rbp]
	lea	rdx, .LC79[rip]
	mov	QWORD PTR 32[rsp], rdx
	lea	r9, .LC76[rip]
	lea	r8, .LC77[rip]
	lea	rdx, .LC78[rip]
	mov	ecx, eax
	call	mux_str
	mov	r11, rax
	mov	eax, DWORD PTR 263576[rbp]
	imul	eax, DWORD PTR 263752[rbp]
	mov	edx, eax
	mov	eax, DWORD PTR 263580[rbp]
	imul	eax, DWORD PTR 263756[rbp]
	mov	r8d, eax
	mov	ecx, DWORD PTR 263272[rbp]
	mov	eax, DWORD PTR 263888[rbp]
	add	ecx, eax
	mov	eax, DWORD PTR 263252[rbp]
	mov	r9d, eax
	shr	r9d, 31
	add	eax, r9d
	sar	eax
	lea	r10d, [rcx+rax]
	mov	eax, DWORD PTR 263252[rbp]
	imul	eax, DWORD PTR 263756[rbp]
	mov	ecx, DWORD PTR 263276[rbp]
	add	ecx, eax
	mov	rax, QWORD PTR 263728[rbp]
	mov	r9d, DWORD PTR 263280[rbp]
	mov	DWORD PTR 72[rsp], r9d
	mov	r9d, DWORD PTR 263576[rbp]
	mov	DWORD PTR 64[rsp], r9d
	mov	r9d, DWORD PTR 263580[rbp]
	mov	DWORD PTR 56[rsp], r9d
	mov	QWORD PTR 48[rsp], r11
	mov	r9, QWORD PTR 263584[rbp]
	mov	QWORD PTR 40[rsp], r9
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, r8d
	mov	r8d, r10d
	mov	edx, ecx
	mov	rcx, rax
	call	draw_text_color
	mov	eax, DWORD PTR 263252[rbp]
	imul	eax, DWORD PTR 263756[rbp]
	add	DWORD PTR 263888[rbp], eax
	add	DWORD PTR 263884[rbp], 1
.L283:
	cmp	DWORD PTR 263884[rbp], 3
	jle	.L284
.L282:
	mov	edx, DWORD PTR 263756[rbp]
	mov	eax, DWORD PTR 263772[rbp]
	add	eax, edx
	mov	DWORD PTR 263276[rbp], eax
	mov	eax, DWORD PTR 263752[rbp]
	mov	DWORD PTR 263272[rbp], eax
	cmp	DWORD PTR 263900[rbp], 0
	jne	.L285
	mov	rax, rsp
	mov	r15, rax
	lea	rax, .LC80[rip]
	mov	QWORD PTR 263240[rbp], rax
	mov	rax, QWORD PTR 263240[rbp]
	mov	rcx, rax
	call	strlen
	mov	rdx, rax
	sub	rdx, 1
	mov	QWORD PTR 263232[rbp], rdx
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
	mov	QWORD PTR 263224[rbp], rax
	mov	rax, QWORD PTR 263224[rbp]
	mov	rdx, QWORD PTR 263240[rbp]
	mov	rcx, rax
	call	strcpy
	mov	eax, DWORD PTR 263904[rbp]
	mov	WORD PTR 263222[rbp], ax
	movzx	eax, WORD PTR 263222[rbp]
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
	mov	rax, QWORD PTR 263224[rbp]
	mov	rdx, rax
	lea	rcx, .LC81[rip]
	call	string_pos
	mov	ecx, ebx
	mov	rdx, QWORD PTR 263224[rbp]
	cdqe
	mov	BYTE PTR [rdx+rax], cl
	movzx	eax, WORD PTR 263222[rbp]
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
	mov	rax, QWORD PTR 263224[rbp]
	mov	rdx, rax
	lea	rcx, .LC82[rip]
	call	string_pos
	mov	ecx, ebx
	mov	rdx, QWORD PTR 263224[rbp]
	cdqe
	mov	BYTE PTR [rdx+rax], cl
	movzx	ecx, WORD PTR 263222[rbp]
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
	mov	rax, QWORD PTR 263224[rbp]
	mov	rdx, rax
	lea	rcx, .LC83[rip]
	call	string_pos
	mov	ecx, ebx
	mov	rdx, QWORD PTR 263224[rbp]
	cdqe
	mov	BYTE PTR [rdx+rax], cl
	mov	r9, QWORD PTR 263224[rbp]
	mov	eax, DWORD PTR 263576[rbp]
	imul	eax, DWORD PTR 263752[rbp]
	mov	edx, DWORD PTR 263580[rbp]
	imul	edx, DWORD PTR 263756[rbp]
	mov	r8d, edx
	mov	r11d, DWORD PTR 263272[rbp]
	mov	edx, DWORD PTR 263276[rbp]
	mov	rcx, QWORD PTR 263728[rbp]
	mov	r10d, DWORD PTR 263280[rbp]
	mov	DWORD PTR 72[rsp], r10d
	mov	r10d, DWORD PTR 263576[rbp]
	mov	DWORD PTR 64[rsp], r10d
	mov	r10d, DWORD PTR 263580[rbp]
	mov	DWORD PTR 56[rsp], r10d
	mov	QWORD PTR 48[rsp], r9
	mov	r9, QWORD PTR 263584[rbp]
	mov	QWORD PTR 40[rsp], r9
	mov	DWORD PTR 32[rsp], eax
	mov	r9d, r8d
	mov	r8d, r11d
	call	draw_text_color
	mov	eax, DWORD PTR 263576[rbp]
	imul	eax, DWORD PTR 263752[rbp]
	mov	edx, DWORD PTR 263580[rbp]
	imul	edx, DWORD PTR 263756[rbp]
	mov	r8d, edx
	mov	edx, DWORD PTR 263576[rbp]
	imul	edx, DWORD PTR 263752[rbp]
	mov	ecx, DWORD PTR 263272[rbp]
	lea	r11d, [rdx+rcx]
	mov	r10d, DWORD PTR 263276[rbp]
	mov	rcx, QWORD PTR 263728[rbp]
	mov	edx, DWORD PTR 263280[rbp]
	mov	DWORD PTR 72[rsp], edx
	mov	edx, DWORD PTR 263576[rbp]
	mov	DWORD PTR 64[rsp], edx
	mov	edx, DWORD PTR 263580[rbp]
	mov	DWORD PTR 56[rsp], edx
	lea	rdx, 608[rbp]
	mov	QWORD PTR 48[rsp], rdx
	mov	rdx, QWORD PTR 263584[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	DWORD PTR 32[rsp], eax
	mov	r9d, r8d
	mov	r8d, r11d
	mov	edx, r10d
	call	draw_text_color
	mov	eax, DWORD PTR 263276[rbp]
	mov	DWORD PTR 263216[rbp], eax
	mov	eax, DWORD PTR 263576[rbp]
	imul	eax, DWORD PTR 263752[rbp]
	lea	edx, [rax+rax]
	mov	eax, DWORD PTR 263272[rbp]
	add	eax, edx
	mov	DWORD PTR 263212[rbp], eax
	mov	eax, DWORD PTR 263216[rbp]
	add	eax, 256
	mov	DWORD PTR 263208[rbp], eax
	mov	eax, DWORD PTR 263212[rbp]
	add	eax, 256
	mov	DWORD PTR 263204[rbp], eax
	mov	r9d, DWORD PTR 263208[rbp]
	mov	r8d, DWORD PTR 263212[rbp]
	mov	edx, DWORD PTR 263216[rbp]
	mov	rax, QWORD PTR 263728[rbp]
	mov	rcx, QWORD PTR 263480[rbp]
	mov	QWORD PTR 40[rsp], rcx
	mov	ecx, DWORD PTR 263204[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_image
	mov	DWORD PTR 263880[rbp], 0
	jmp	.L286
.L288:
	mov	edx, DWORD PTR 263880[rbp]
	mov	eax, edx
	sar	eax, 31
	shr	eax, 27
	add	edx, eax
	and	edx, 31
	sub	edx, eax
	mov	eax, edx
	mov	ecx, eax
	mov	eax, DWORD PTR 263880[rbp]
	lea	edx, 31[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 5
	cdqe
	mov	eax, DWORD PTR 544[rbp+rax*4]
	mov	edx, ecx
	mov	ecx, eax
	call	BG
	test	eax, eax
	jne	.L287
	mov	eax, DWORD PTR 263880[rbp]
	lea	edx, 15[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 4
	add	eax, 1
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC84[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	cvtsi2sd	xmm1, DWORD PTR 263204[rbp]
	cvtsi2sd	xmm0, DWORD PTR 263212[rbp]
	call	lerp
	cvttsd2si	ebx, xmm0
	mov	edx, DWORD PTR 263880[rbp]
	mov	eax, edx
	sar	eax, 31
	shr	eax, 28
	add	edx, eax
	and	edx, 15
	sub	edx, eax
	mov	eax, edx
	add	eax, 1
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC84[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	cvtsi2sd	xmm1, DWORD PTR 263208[rbp]
	cvtsi2sd	xmm0, DWORD PTR 263216[rbp]
	call	lerp
	cvttsd2si	edi, xmm0
	mov	eax, DWORD PTR 263880[rbp]
	lea	edx, 15[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 4
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC84[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	cvtsi2sd	xmm1, DWORD PTR 263204[rbp]
	cvtsi2sd	xmm0, DWORD PTR 263212[rbp]
	call	lerp
	cvttsd2si	esi, xmm0
	mov	edx, DWORD PTR 263880[rbp]
	mov	eax, edx
	sar	eax, 31
	shr	eax, 28
	add	edx, eax
	and	edx, 15
	sub	edx, eax
	mov	eax, edx
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC84[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	cvtsi2sd	xmm1, DWORD PTR 263208[rbp]
	cvtsi2sd	xmm0, DWORD PTR 263216[rbp]
	call	lerp
	cvttsd2si	eax, xmm0
	mov	rcx, QWORD PTR 263728[rbp]
	mov	rdx, QWORD PTR 263472[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	DWORD PTR 32[rsp], ebx
	mov	r9d, edi
	mov	r8d, esi
	mov	edx, eax
	call	draw_image
.L287:
	add	DWORD PTR 263880[rbp], 1
.L286:
	cmp	DWORD PTR 263880[rbp], 255
	jle	.L288
	movzx	eax, WORD PTR 263222[rbp]
	mov	r8d, 0
	mov	edx, 4
	mov	ecx, eax
	call	BGG
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC84[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	cvtsi2sd	xmm1, DWORD PTR 263208[rbp]
	cvtsi2sd	xmm0, DWORD PTR 263216[rbp]
	call	lerp
	cvttsd2si	eax, xmm0
	mov	DWORD PTR 263200[rbp], eax
	mov	ecx, 255
	mov	eax, DWORD PTR 263200[rbp]
	lea	r9d, 1[rax]
	mov	eax, DWORD PTR 263200[rbp]
	lea	edx, -1[rax]
	mov	r8d, DWORD PTR 263212[rbp]
	mov	rax, QWORD PTR 263728[rbp]
	mov	DWORD PTR 40[rsp], ecx
	mov	ecx, DWORD PTR 263204[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_rectangle_color
	movzx	eax, WORD PTR 263222[rbp]
	mov	r8d, 1
	mov	edx, 4
	mov	ecx, eax
	call	BGG
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC84[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	cvtsi2sd	xmm1, DWORD PTR 263204[rbp]
	cvtsi2sd	xmm0, DWORD PTR 263212[rbp]
	call	lerp
	cvttsd2si	eax, xmm0
	mov	DWORD PTR 263196[rbp], eax
	mov	r10d, 255
	mov	eax, DWORD PTR 263196[rbp]
	lea	ecx, 1[rax]
	mov	eax, DWORD PTR 263196[rbp]
	lea	r8d, -1[rax]
	mov	r9d, DWORD PTR 263208[rbp]
	mov	edx, DWORD PTR 263216[rbp]
	mov	rax, QWORD PTR 263728[rbp]
	mov	DWORD PTR 40[rsp], r10d
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_rectangle_color
	movzx	eax, WORD PTR 263222[rbp]
	shr	ax, 8
	test	ax, ax
	jne	.L289
	mov	esi, 255
	movzx	eax, WORD PTR 263222[rbp]
	mov	r8d, 1
	mov	edx, 4
	mov	ecx, eax
	call	BGG
	add	eax, 1
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC84[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	cvtsi2sd	xmm1, DWORD PTR 263204[rbp]
	cvtsi2sd	xmm0, DWORD PTR 263212[rbp]
	call	lerp
	cvttsd2si	ebx, xmm0
	movzx	eax, WORD PTR 263222[rbp]
	mov	r8d, 0
	mov	edx, 4
	mov	ecx, eax
	call	BGG
	add	eax, 1
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC84[rip]
	movapd	xmm2, xmm0
	divsd	xmm2, xmm1
	cvtsi2sd	xmm1, DWORD PTR 263208[rbp]
	cvtsi2sd	xmm0, DWORD PTR 263216[rbp]
	call	lerp
	cvttsd2si	ecx, xmm0
	mov	r8d, DWORD PTR 263196[rbp]
	mov	edx, DWORD PTR 263200[rbp]
	mov	rax, QWORD PTR 263728[rbp]
	mov	DWORD PTR 40[rsp], esi
	mov	DWORD PTR 32[rsp], ebx
	mov	r9d, ecx
	mov	rcx, rax
	call	draw_rectangle_color
.L289:
	mov	DWORD PTR 263876[rbp], 0
	mov	eax, DWORD PTR 263752[rbp]
	sal	eax, 5
	mov	edx, eax
	mov	eax, DWORD PTR 263204[rbp]
	add	eax, edx
	mov	DWORD PTR 263192[rbp], eax
	mov	edx, DWORD PTR 263280[rbp]
	mov	rax, QWORD PTR 263728[rbp]
	mov	rcx, rax
	call	draw_set_color
	mov	DWORD PTR 263872[rbp], 0
	jmp	.L290
.L293:
	mov	ecx, DWORD PTR 263920[rbp]
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
	mov	ecx, DWORD PTR 263920[rbp]
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
	mov	r9d, DWORD PTR 263920[rbp]
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
	mov	r9d, DWORD PTR 263920[rbp]
	mov	edx, 458129845
	mov	eax, r9d
	imul	edx
	sar	edx, 6
	mov	eax, r9d
	sar	eax, 31
	sub	edx, eax
	mov	eax, DWORD PTR 263872[rbp]
	mov	DWORD PTR 40[rsp], r8d
	mov	DWORD PTR 32[rsp], ecx
	mov	r9d, 737
	mov	r8d, r10d
	mov	ecx, eax
	call	mux_int
	mov	DWORD PTR 263188[rbp], eax
	cmp	DWORD PTR 263872[rbp], 2
	je	.L291
	mov	eax, DWORD PTR 263188[rbp]
	sal	eax, 4
	mov	ecx, eax
	mov	eax, DWORD PTR 263872[rbp]
	add	eax, 1
	imul	eax, DWORD PTR 263756[rbp]
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR 263276[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 263876[rbp]
	lea	r9d, [rdx+rax]
	mov	eax, DWORD PTR 263872[rbp]
	imul	eax, DWORD PTR 263756[rbp]
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR 263276[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 263876[rbp]
	add	edx, eax
	mov	r8d, DWORD PTR 263204[rbp]
	mov	rax, QWORD PTR 263728[rbp]
	mov	DWORD PTR 72[rsp], 32
	mov	DWORD PTR 64[rsp], 16
	mov	DWORD PTR 56[rsp], 0
	mov	DWORD PTR 48[rsp], ecx
	mov	rcx, QWORD PTR 263568[rbp]
	mov	QWORD PTR 40[rsp], rcx
	mov	ecx, DWORD PTR 263192[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_image_part
	mov	eax, DWORD PTR 263756[rbp]
	add	DWORD PTR 263876[rbp], eax
	jmp	.L292
.L291:
	mov	eax, DWORD PTR 263576[rbp]
	imul	eax, DWORD PTR 263752[rbp]
	mov	edx, DWORD PTR 263580[rbp]
	imul	edx, DWORD PTR 263756[rbp]
	mov	r8d, edx
	mov	edx, DWORD PTR 263756[rbp]
	mov	ecx, edx
	sal	ecx, 5
	mov	edx, DWORD PTR 263276[rbp]
	add	edx, ecx
	mov	r10d, DWORD PTR 263204[rbp]
	mov	rcx, QWORD PTR 263728[rbp]
	mov	r9d, DWORD PTR 263280[rbp]
	mov	DWORD PTR 72[rsp], r9d
	mov	r9d, DWORD PTR 263576[rbp]
	mov	DWORD PTR 64[rsp], r9d
	mov	r9d, DWORD PTR 263580[rbp]
	mov	DWORD PTR 56[rsp], r9d
	lea	r9, .LC85[rip]
	mov	QWORD PTR 48[rsp], r9
	mov	r9, QWORD PTR 263584[rbp]
	mov	QWORD PTR 40[rsp], r9
	mov	DWORD PTR 32[rsp], eax
	mov	r9d, r8d
	mov	r8d, r10d
	call	draw_text_color
.L292:
	add	DWORD PTR 263872[rbp], 1
.L290:
	cmp	DWORD PTR 263872[rbp], 4
	jle	.L293
	mov	edx, 16777215
	mov	rax, QWORD PTR 263728[rbp]
	mov	rcx, rax
	call	draw_set_color
	mov	DWORD PTR 263184[rbp], 0
	mov	eax, DWORD PTR 263920[rbp]
	mov	DWORD PTR 32[rsp], 59
	mov	r9d, 5
	mov	r8d, 0
	mov	edx, 0
	mov	ecx, eax
	call	clock_is_between
	test	eax, eax
	je	.L294
	mov	DWORD PTR 263184[rbp], 0
.L294:
	mov	eax, DWORD PTR 263920[rbp]
	mov	DWORD PTR 32[rsp], 59
	mov	r9d, 11
	mov	r8d, 0
	mov	edx, 6
	mov	ecx, eax
	call	clock_is_between
	test	eax, eax
	je	.L295
	mov	DWORD PTR 263184[rbp], 1
.L295:
	mov	eax, DWORD PTR 263920[rbp]
	mov	DWORD PTR 32[rsp], 59
	mov	r9d, 17
	mov	r8d, 0
	mov	edx, 12
	mov	ecx, eax
	call	clock_is_between
	test	eax, eax
	je	.L296
	mov	DWORD PTR 263184[rbp], 2
.L296:
	mov	eax, DWORD PTR 263920[rbp]
	mov	DWORD PTR 32[rsp], 59
	mov	r9d, 23
	mov	r8d, 0
	mov	edx, 18
	mov	ecx, eax
	call	clock_is_between
	test	eax, eax
	je	.L297
	mov	DWORD PTR 263184[rbp], 3
.L297:
	movsd	xmm0, QWORD PTR .LC86[rip]
	movsd	QWORD PTR 263176[rbp], xmm0
	mov	r10d, 255
	mov	edx, DWORD PTR 263192[rbp]
	mov	eax, DWORD PTR 263752[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 263576[rbp]
	imul	eax, DWORD PTR 263752[rbp]
	lea	ecx, [rdx+rax]
	mov	eax, DWORD PTR 263580[rbp]
	imul	eax, DWORD PTR 263912[rbp]
	imul	eax, DWORD PTR 263756[rbp]
	mov	edx, DWORD PTR 263276[rbp]
	add	edx, eax
	cvtsi2sd	xmm0, DWORD PTR 263912[rbp]
	movapd	xmm1, xmm0
	mulsd	xmm1, QWORD PTR 263176[rbp]
	cvtsi2sd	xmm0, DWORD PTR 263756[rbp]
	mulsd	xmm0, xmm1
	cvttsd2si	eax, xmm0
	add	edx, eax
	mov	eax, DWORD PTR 263580[rbp]
	imul	eax, DWORD PTR 263756[rbp]
	lea	r9d, [rdx+rax]
	mov	edx, DWORD PTR 263192[rbp]
	mov	eax, DWORD PTR 263752[rbp]
	lea	r8d, [rdx+rax]
	mov	eax, DWORD PTR 263580[rbp]
	imul	eax, DWORD PTR 263912[rbp]
	imul	eax, DWORD PTR 263756[rbp]
	mov	edx, DWORD PTR 263276[rbp]
	add	edx, eax
	cvtsi2sd	xmm0, DWORD PTR 263912[rbp]
	movapd	xmm1, xmm0
	mulsd	xmm1, QWORD PTR 263176[rbp]
	cvtsi2sd	xmm0, DWORD PTR 263756[rbp]
	mulsd	xmm0, xmm1
	cvttsd2si	eax, xmm0
	add	edx, eax
	mov	rax, QWORD PTR 263728[rbp]
	mov	DWORD PTR 40[rsp], r10d
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_rectangle_color
	mov	DWORD PTR 263868[rbp], 0
	jmp	.L298
.L303:
	cmp	DWORD PTR 263868[rbp], 6
	jne	.L299
	mov	eax, 255
	jmp	.L300
.L299:
	mov	eax, 0
.L300:
	mov	DWORD PTR 263172[rbp], eax
	mov	eax, DWORD PTR 263868[rbp]
	cmp	eax, DWORD PTR 263912[rbp]
	jne	.L301
	mov	eax, 16777215
	jmp	.L302
.L301:
	mov	eax, DWORD PTR 263172[rbp]
.L302:
	mov	DWORD PTR 263172[rbp], eax
	mov	eax, DWORD PTR 263868[rbp]
	cdqe
	mov	rdx, QWORD PTR 263512[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	mov	BYTE PTR 350[rbp], al
	mov	eax, DWORD PTR 263576[rbp]
	imul	eax, DWORD PTR 263752[rbp]
	mov	edx, DWORD PTR 263580[rbp]
	imul	edx, DWORD PTR 263756[rbp]
	mov	r8d, edx
	mov	ecx, DWORD PTR 263192[rbp]
	mov	edx, DWORD PTR 263752[rbp]
	lea	r11d, [rcx+rdx]
	mov	edx, DWORD PTR 263580[rbp]
	imul	edx, DWORD PTR 263868[rbp]
	imul	edx, DWORD PTR 263756[rbp]
	mov	ecx, DWORD PTR 263276[rbp]
	add	ecx, edx
	cvtsi2sd	xmm0, DWORD PTR 263868[rbp]
	movapd	xmm1, xmm0
	mulsd	xmm1, QWORD PTR 263176[rbp]
	cvtsi2sd	xmm0, DWORD PTR 263756[rbp]
	mulsd	xmm0, xmm1
	cvttsd2si	edx, xmm0
	lea	r10d, [rcx+rdx]
	mov	rcx, QWORD PTR 263728[rbp]
	mov	edx, DWORD PTR 263172[rbp]
	mov	DWORD PTR 72[rsp], edx
	mov	edx, DWORD PTR 263576[rbp]
	mov	DWORD PTR 64[rsp], edx
	mov	edx, DWORD PTR 263580[rbp]
	mov	DWORD PTR 56[rsp], edx
	lea	rdx, 350[rbp]
	mov	QWORD PTR 48[rsp], rdx
	mov	rdx, QWORD PTR 263584[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	DWORD PTR 32[rsp], eax
	mov	r9d, r8d
	mov	r8d, r11d
	mov	edx, r10d
	call	draw_text_color
	add	DWORD PTR 263868[rbp], 1
.L298:
	cmp	DWORD PTR 263868[rbp], 6
	jle	.L303
	mov	eax, DWORD PTR 263908[rbp]
	lea	ecx, 1[rax]
	mov	edx, 1717986919
	mov	eax, ecx
	imul	edx
	sar	edx, 2
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	add	eax, 48
	mov	BYTE PTR 262775[rbp], al
	mov	eax, DWORD PTR 263908[rbp]
	lea	ecx, 1[rax]
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
	mov	BYTE PTR 262776[rbp], al
	mov	eax, DWORD PTR 263908[rbp]
	lea	ecx, 1[rax]
	mov	edx, 1717986919
	mov	eax, ecx
	imul	edx
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
	jg	.L304
	mov	eax, DWORD PTR 263908[rbp]
	lea	r8d, 1[rax]
	mov	edx, 1717986919
	mov	eax, r8d
	imul	edx
	sar	edx, 3
	mov	eax, r8d
	sar	eax, 31
	mov	ecx, edx
	sub	ecx, eax
	mov	eax, ecx
	sal	eax, 2
	add	eax, ecx
	sal	eax, 2
	mov	ecx, r8d
	sub	ecx, eax
	mov	DWORD PTR 32[rsp], 14
	mov	r9d, 10
	mov	r8d, 15
	mov	edx, 16
	call	mux_int
	add	eax, 100
	jmp	.L305
.L304:
	mov	eax, 116
.L305:
	mov	BYTE PTR 262777[rbp], al
	mov	eax, DWORD PTR 263908[rbp]
	lea	ecx, 1[rax]
	mov	edx, 1717986919
	mov	eax, ecx
	imul	edx
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
	jg	.L306
	mov	eax, DWORD PTR 263908[rbp]
	lea	r8d, 1[rax]
	mov	edx, 1717986919
	mov	eax, r8d
	imul	edx
	sar	edx, 3
	mov	eax, r8d
	sar	eax, 31
	mov	ecx, edx
	sub	ecx, eax
	mov	eax, ecx
	sal	eax, 2
	add	eax, ecx
	sal	eax, 2
	mov	ecx, r8d
	sub	ecx, eax
	mov	DWORD PTR 32[rsp], 0
	mov	r9d, 0
	mov	r8d, 16
	mov	edx, 4
	call	mux_int
	add	eax, 100
	jmp	.L307
.L306:
	mov	eax, 104
.L307:
	mov	BYTE PTR 262778[rbp], al
	mov	r10d, 16711680
	mov	edx, DWORD PTR 263192[rbp]
	mov	eax, DWORD PTR 263752[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 263576[rbp]
	imul	eax, DWORD PTR 263752[rbp]
	lea	ecx, [rdx+rax]
	mov	eax, DWORD PTR 263580[rbp]
	imul	eax, DWORD PTR 263756[rbp]
	lea	edx, 0[0+rax*8]
	mov	eax, DWORD PTR 263276[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 263580[rbp]
	imul	eax, DWORD PTR 263756[rbp]
	sal	eax, 2
	lea	r9d, [rdx+rax]
	mov	edx, DWORD PTR 263192[rbp]
	mov	eax, DWORD PTR 263752[rbp]
	lea	r8d, [rdx+rax]
	mov	eax, DWORD PTR 263580[rbp]
	imul	eax, DWORD PTR 263756[rbp]
	lea	edx, 0[0+rax*8]
	mov	eax, DWORD PTR 263276[rbp]
	add	edx, eax
	mov	rax, QWORD PTR 263728[rbp]
	mov	DWORD PTR 40[rsp], r10d
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_rectangle_color
	mov	r9d, 16776960
	mov	eax, DWORD PTR 263576[rbp]
	imul	eax, DWORD PTR 263752[rbp]
	mov	edx, DWORD PTR 263580[rbp]
	imul	edx, DWORD PTR 263756[rbp]
	mov	r8d, edx
	mov	ecx, DWORD PTR 263192[rbp]
	mov	edx, DWORD PTR 263752[rbp]
	lea	r11d, [rcx+rdx]
	mov	edx, DWORD PTR 263580[rbp]
	imul	edx, DWORD PTR 263756[rbp]
	lea	ecx, 0[0+rdx*8]
	mov	edx, DWORD PTR 263276[rbp]
	lea	r10d, [rcx+rdx]
	mov	rcx, QWORD PTR 263728[rbp]
	mov	DWORD PTR 72[rsp], r9d
	mov	edx, DWORD PTR 263576[rbp]
	mov	DWORD PTR 64[rsp], edx
	mov	edx, DWORD PTR 263580[rbp]
	mov	DWORD PTR 56[rsp], edx
	lea	rdx, 262775[rbp]
	mov	QWORD PTR 48[rsp], rdx
	mov	rdx, QWORD PTR 263584[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	DWORD PTR 32[rsp], eax
	mov	r9d, r8d
	mov	r8d, r11d
	mov	edx, r10d
	call	draw_text_color
	mov	edx, DWORD PTR 263192[rbp]
	mov	eax, DWORD PTR 263752[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 263576[rbp]
	imul	eax, DWORD PTR 263752[rbp]
	add	eax, edx
	mov	DWORD PTR 263168[rbp], eax
	mov	edx, DWORD PTR 263752[rbp]
	mov	eax, edx
	add	eax, eax
	add	eax, edx
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR 263168[rbp]
	add	eax, edx
	mov	DWORD PTR 263164[rbp], eax
	mov	eax, DWORD PTR 263756[rbp]
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR 263276[rbp]
	lea	r9d, [rdx+rax]
	mov	r8d, DWORD PTR 263168[rbp]
	mov	edx, DWORD PTR 263276[rbp]
	mov	rax, QWORD PTR 263728[rbp]
	mov	rcx, QWORD PTR 263456[rbp]
	mov	QWORD PTR 40[rsp], rcx
	mov	ecx, DWORD PTR 263164[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_image
	mov	eax, DWORD PTR 263576[rbp]
	imul	eax, DWORD PTR 263752[rbp]
	mov	ebx, eax
	mov	eax, DWORD PTR 263580[rbp]
	imul	eax, DWORD PTR 263756[rbp]
	mov	esi, eax
	cvtsi2sd	xmm1, DWORD PTR 263164[rbp]
	cvtsi2sd	xmm0, DWORD PTR 263168[rbp]
	movsd	xmm2, QWORD PTR .LC87[rip]
	call	lerp
	cvttsd2si	r8d, xmm0
	mov	eax, DWORD PTR 263276[rbp]
	lea	edx, 48[rax]
	mov	rcx, QWORD PTR 263728[rbp]
	mov	eax, DWORD PTR 263280[rbp]
	mov	DWORD PTR 72[rsp], eax
	mov	eax, DWORD PTR 263576[rbp]
	mov	DWORD PTR 64[rsp], eax
	mov	eax, DWORD PTR 263580[rbp]
	mov	DWORD PTR 56[rsp], eax
	lea	rax, 388[rbp]
	mov	QWORD PTR 48[rsp], rax
	mov	rax, QWORD PTR 263584[rbp]
	mov	QWORD PTR 40[rsp], rax
	mov	DWORD PTR 32[rsp], ebx
	mov	r9d, esi
	call	draw_text_color
	mov	rsp, r15
.L285:
	mov	eax, DWORD PTR 263760[rbp]
	mov	DWORD PTR 263160[rbp], eax
	call	get_timer
	lea	edx, 15[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 4
	mov	r8d, eax
	mov	edx, 0
	mov	ecx, 0
	call	make_color_hsv
	mov	DWORD PTR 263156[rbp], eax
	mov	DWORD PTR 263864[rbp], 0
	jmp	.L308
.L323:
	mov	DWORD PTR 263860[rbp], 0
	jmp	.L309
.L322:
	mov	DWORD PTR 263856[rbp], 0
	jmp	.L310
.L321:
	mov	eax, DWORD PTR 263860[rbp]
	imul	eax, DWORD PTR 263764[rbp]
	mov	edx, DWORD PTR 263856[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 263864[rbp]
	imul	eax, DWORD PTR 263492[rbp]
	add	eax, edx
	mov	DWORD PTR 263152[rbp], eax
	mov	eax, DWORD PTR 263856[rbp]
	imul	eax, DWORD PTR 263756[rbp]
	imul	eax, DWORD PTR 263760[rbp]
	mov	edx, DWORD PTR 263788[rbp]
	add	eax, edx
	mov	DWORD PTR 263148[rbp], eax
	mov	eax, DWORD PTR 263860[rbp]
	imul	eax, DWORD PTR 263752[rbp]
	imul	eax, DWORD PTR 263760[rbp]
	mov	edx, DWORD PTR 263784[rbp]
	add	eax, edx
	mov	DWORD PTR 263144[rbp], eax
	mov	eax, DWORD PTR 263856[rbp]
	add	eax, 1
	imul	eax, DWORD PTR 263756[rbp]
	imul	eax, DWORD PTR 263760[rbp]
	mov	edx, DWORD PTR 263788[rbp]
	add	eax, edx
	mov	DWORD PTR 263140[rbp], eax
	mov	eax, DWORD PTR 263860[rbp]
	add	eax, 1
	imul	eax, DWORD PTR 263752[rbp]
	imul	eax, DWORD PTR 263760[rbp]
	mov	edx, DWORD PTR 263784[rbp]
	add	eax, edx
	mov	DWORD PTR 263136[rbp], eax
	mov	eax, DWORD PTR 263508[rbp]
	imul	eax, DWORD PTR 263904[rbp]
	mov	edx, DWORD PTR 263152[rbp]
	add	eax, edx
	mov	DWORD PTR 263132[rbp], eax
	mov	eax, DWORD PTR 263132[rbp]
	cdqe
	movzx	eax, BYTE PTR 624[rbp+rax]
	movzx	eax, al
	mov	DWORD PTR 263128[rbp], eax
	cmp	DWORD PTR 263864[rbp], 0
	jne	.L311
	mov	r9d, DWORD PTR 263140[rbp]
	mov	r8d, DWORD PTR 263144[rbp]
	mov	edx, DWORD PTR 263148[rbp]
	mov	rax, QWORD PTR 263728[rbp]
	mov	ecx, DWORD PTR 263156[rbp]
	mov	DWORD PTR 40[rsp], ecx
	mov	ecx, DWORD PTR 263136[rbp]
	mov	DWORD PTR 32[rsp], ecx
	mov	rcx, rax
	call	draw_rectangle_color
	mov	eax, DWORD PTR 263128[rbp]
	cdq
	idiv	DWORD PTR 263764[rbp]
	imul	eax, DWORD PTR 263160[rbp]
	mov	ecx, eax
	mov	eax, DWORD PTR 263128[rbp]
	cdq
	idiv	DWORD PTR 263764[rbp]
	mov	eax, edx
	imul	eax, DWORD PTR 263160[rbp]
	mov	r9d, DWORD PTR 263140[rbp]
	mov	r11d, DWORD PTR 263144[rbp]
	mov	edx, DWORD PTR 263148[rbp]
	mov	r10, QWORD PTR 263728[rbp]
	mov	r8d, DWORD PTR 263160[rbp]
	mov	DWORD PTR 72[rsp], r8d
	mov	r8d, DWORD PTR 263160[rbp]
	mov	DWORD PTR 64[rsp], r8d
	mov	DWORD PTR 56[rsp], ecx
	mov	DWORD PTR 48[rsp], eax
	mov	rax, QWORD PTR 263616[rbp]
	mov	QWORD PTR 40[rsp], rax
	mov	eax, DWORD PTR 263136[rbp]
	mov	DWORD PTR 32[rsp], eax
	mov	r8d, r11d
	mov	rcx, r10
	call	draw_image_part
	jmp	.L312
.L311:
	cmp	DWORD PTR 263864[rbp], 1
	jne	.L312
	cmp	DWORD PTR 263128[rbp], 15
	jle	.L313
	cmp	DWORD PTR 263128[rbp], 31
	jg	.L313
	mov	DWORD PTR 263124[rbp], 16
	cmp	DWORD PTR 263128[rbp], 17
	jg	.L314
	mov	eax, 60
	jmp	.L315
.L314:
	mov	eax, 120
.L315:
	mov	DWORD PTR 263120[rbp], eax
	call	get_timer
	mov	DWORD PTR 263116[rbp], eax
	cmp	DWORD PTR 263128[rbp], 16
	jne	.L316
	mov	rax, QWORD PTR 263648[rbp]
	mov	QWORD PTR 263848[rbp], rax
	jmp	.L317
.L316:
	cmp	DWORD PTR 263128[rbp], 17
	jne	.L318
	mov	rax, QWORD PTR 263632[rbp]
	mov	QWORD PTR 263848[rbp], rax
	jmp	.L317
.L318:
	cmp	DWORD PTR 263128[rbp], 18
	jne	.L319
	mov	rax, QWORD PTR 263640[rbp]
	mov	QWORD PTR 263848[rbp], rax
	jmp	.L317
.L319:
	cmp	DWORD PTR 263128[rbp], 19
	jne	.L320
	mov	rax, QWORD PTR 263624[rbp]
	mov	QWORD PTR 263848[rbp], rax
	jmp	.L317
.L320:
	mov	rax, QWORD PTR 263648[rbp]
	mov	QWORD PTR 263848[rbp], rax
.L317:
	mov	eax, DWORD PTR 263116[rbp]
	cdq
	idiv	DWORD PTR 263120[rbp]
	cdq
	idiv	DWORD PTR 263124[rbp]
	mov	eax, edx
	imul	eax, DWORD PTR 263160[rbp]
	mov	r9d, DWORD PTR 263140[rbp]
	mov	r10d, DWORD PTR 263144[rbp]
	mov	edx, DWORD PTR 263148[rbp]
	mov	rcx, QWORD PTR 263728[rbp]
	mov	r8d, DWORD PTR 263160[rbp]
	mov	DWORD PTR 72[rsp], r8d
	mov	r8d, DWORD PTR 263160[rbp]
	mov	DWORD PTR 64[rsp], r8d
	mov	DWORD PTR 56[rsp], 0
	mov	DWORD PTR 48[rsp], eax
	mov	rax, QWORD PTR 263848[rbp]
	mov	QWORD PTR 40[rsp], rax
	mov	eax, DWORD PTR 263136[rbp]
	mov	DWORD PTR 32[rsp], eax
	mov	r8d, r10d
	call	draw_image_part
	jmp	.L312
.L313:
	cmp	DWORD PTR 263128[rbp], 0
	je	.L312
	add	DWORD PTR 263128[rbp], 256
	mov	eax, DWORD PTR 263128[rbp]
	cdq
	idiv	DWORD PTR 263764[rbp]
	imul	eax, DWORD PTR 263160[rbp]
	mov	ecx, eax
	mov	eax, DWORD PTR 263128[rbp]
	cdq
	idiv	DWORD PTR 263764[rbp]
	mov	eax, edx
	imul	eax, DWORD PTR 263160[rbp]
	mov	r9d, DWORD PTR 263140[rbp]
	mov	r11d, DWORD PTR 263144[rbp]
	mov	edx, DWORD PTR 263148[rbp]
	mov	r10, QWORD PTR 263728[rbp]
	mov	r8d, DWORD PTR 263160[rbp]
	mov	DWORD PTR 72[rsp], r8d
	mov	r8d, DWORD PTR 263160[rbp]
	mov	DWORD PTR 64[rsp], r8d
	mov	DWORD PTR 56[rsp], ecx
	mov	DWORD PTR 48[rsp], eax
	mov	rax, QWORD PTR 263616[rbp]
	mov	QWORD PTR 40[rsp], rax
	mov	eax, DWORD PTR 263136[rbp]
	mov	DWORD PTR 32[rsp], eax
	mov	r8d, r11d
	mov	rcx, r10
	call	draw_image_part
.L312:
	add	DWORD PTR 263856[rbp], 1
.L310:
	mov	eax, DWORD PTR 263856[rbp]
	cmp	eax, DWORD PTR 263764[rbp]
	jl	.L321
	add	DWORD PTR 263860[rbp], 1
.L309:
	mov	eax, DWORD PTR 263860[rbp]
	cmp	eax, DWORD PTR 263764[rbp]
	jl	.L322
	add	DWORD PTR 263864[rbp], 1
.L308:
	mov	eax, DWORD PTR 263864[rbp]
	cmp	eax, DWORD PTR 263496[rbp]
	jl	.L323
	movzx	eax, BYTE PTR 512[rbp]
	movzx	eax, al
	imul	eax, DWORD PTR 263160[rbp]
	mov	edx, eax
	movzx	eax, BYTE PTR 517[rbp]
	movzx	eax, al
	imul	edx, eax
	movzx	eax, BYTE PTR 516[rbp]
	movzx	eax, al
	imul	eax, DWORD PTR 263160[rbp]
	lea	r8d, [rdx+rax]
	mov	edx, DWORD PTR 500[rbp]
	mov	eax, DWORD PTR 263160[rbp]
	imul	eax, DWORD PTR 263752[rbp]
	lea	ecx, [rdx+rax]
	mov	edx, DWORD PTR 496[rbp]
	mov	eax, DWORD PTR 263160[rbp]
	imul	eax, DWORD PTR 263756[rbp]
	lea	r11d, [rdx+rax]
	mov	r10d, DWORD PTR 500[rbp]
	mov	edx, DWORD PTR 496[rbp]
	mov	rax, QWORD PTR 263728[rbp]
	mov	r9d, DWORD PTR 263160[rbp]
	mov	DWORD PTR 72[rsp], r9d
	mov	r9d, DWORD PTR 263160[rbp]
	mov	DWORD PTR 64[rsp], r9d
	mov	DWORD PTR 56[rsp], 0
	mov	DWORD PTR 48[rsp], r8d
	mov	r8, QWORD PTR 263592[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r9d, r11d
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_image_part
	cmp	DWORD PTR 263928[rbp], 0
	jle	.L324
	mov	eax, DWORD PTR 496[rbp]
	add	eax, 60
	mov	DWORD PTR 262896[rbp], eax
	mov	eax, DWORD PTR 500[rbp]
	sub	eax, 120
	mov	DWORD PTR 262900[rbp], eax
	mov	rax, QWORD PTR 263728[rbp]
	mov	DWORD PTR 32[rsp], 255
	mov	r9d, 255
	mov	r8d, 255
	mov	edx, 255
	mov	rcx, rax
	call	SDL_SetRenderDrawColor
	mov	rdx, QWORD PTR 263704[rbp]
	mov	rax, QWORD PTR 263728[rbp]
	mov	rcx, rax
	call	SDL_RenderFillRect
	mov	rax, QWORD PTR 263728[rbp]
	mov	DWORD PTR 32[rsp], 255
	mov	r9d, 255
	mov	r8d, 255
	mov	edx, 255
	mov	rcx, rax
	call	SDL_SetRenderDrawColor
	mov	rax, QWORD PTR 263704[rbp]
	mov	ecx, DWORD PTR 4[rax]
	mov	rax, QWORD PTR 263704[rbp]
	mov	eax, DWORD PTR 12[rax]
	lea	edx, 3[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 2
	lea	r8d, [rcx+rax]
	mov	rax, QWORD PTR 263704[rbp]
	mov	eax, DWORD PTR [rax]
	cvtsi2sd	xmm1, eax
	mov	rax, QWORD PTR 263704[rbp]
	mov	eax, DWORD PTR 8[rax]
	cvtsi2sd	xmm2, eax
	movsd	xmm0, QWORD PTR .LC88[rip]
	mulsd	xmm0, xmm2
	addsd	xmm0, xmm1
	cvttsd2si	ecx, xmm0
	mov	eax, DWORD PTR 500[rbp]
	lea	r10d, -15[rax]
	mov	eax, DWORD PTR 496[rbp]
	lea	edx, 45[rax]
	mov	rax, QWORD PTR 263728[rbp]
	mov	DWORD PTR 32[rsp], r8d
	mov	r9d, ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	SDL_RenderDrawLine
	mov	rax, QWORD PTR 263704[rbp]
	mov	edx, DWORD PTR 4[rax]
	mov	rax, QWORD PTR 263704[rbp]
	mov	eax, DWORD PTR 12[rax]
	lea	r8d, [rdx+rax]
	mov	rax, QWORD PTR 263704[rbp]
	mov	eax, DWORD PTR [rax]
	cvtsi2sd	xmm1, eax
	mov	rax, QWORD PTR 263704[rbp]
	mov	eax, DWORD PTR 8[rax]
	cvtsi2sd	xmm2, eax
	movsd	xmm0, QWORD PTR .LC89[rip]
	mulsd	xmm0, xmm2
	addsd	xmm0, xmm1
	cvttsd2si	ecx, xmm0
	mov	eax, DWORD PTR 500[rbp]
	lea	r10d, -15[rax]
	mov	eax, DWORD PTR 496[rbp]
	lea	edx, 45[rax]
	mov	rax, QWORD PTR 263728[rbp]
	mov	DWORD PTR 32[rsp], r8d
	mov	r9d, ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	SDL_RenderDrawLine
	mov	DWORD PTR 346[rbp], 0
	mov	rax, QWORD PTR 263704[rbp]
	mov	eax, DWORD PTR 8[rax]
	sub	eax, 10
	mov	DWORD PTR 263112[rbp], eax
	mov	r8d, DWORD PTR 263112[rbp]
	mov	ecx, DWORD PTR 346[rbp]
	mov	rdx, QWORD PTR 263712[rbp]
	mov	rax, QWORD PTR 263688[rbp]
	mov	r9d, r8d
	mov	r8d, ecx
	mov	rcx, rax
	call	TTF_RenderText_Blended_Wrapped
	mov	QWORD PTR 263840[rbp], rax
	cmp	QWORD PTR 263840[rbp], 0
	jne	.L325
	mov	edx, DWORD PTR 346[rbp]
	mov	rax, QWORD PTR 263688[rbp]
	mov	r8d, edx
	lea	rdx, .LC90[rip]
	mov	rcx, rax
	call	TTF_RenderText_Solid
	mov	QWORD PTR 263840[rbp], rax
.L325:
	mov	rax, QWORD PTR 263840[rbp]
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR 263108[rbp], eax
	mov	rax, QWORD PTR 263840[rbp]
	mov	eax, DWORD PTR 20[rax]
	mov	DWORD PTR 263104[rbp], eax
	mov	rax, QWORD PTR 263704[rbp]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR 263704[rbp]
	mov	eax, DWORD PTR 8[rax]
	sub	eax, DWORD PTR 263108[rbp]
	mov	ecx, eax
	shr	ecx, 31
	add	eax, ecx
	sar	eax
	add	eax, edx
	mov	DWORD PTR 263100[rbp], eax
	mov	rax, QWORD PTR 263704[rbp]
	mov	edx, DWORD PTR 4[rax]
	mov	rax, QWORD PTR 263704[rbp]
	mov	eax, DWORD PTR 12[rax]
	sub	eax, DWORD PTR 263104[rbp]
	mov	ecx, eax
	shr	ecx, 31
	add	eax, ecx
	sar	eax
	add	eax, edx
	mov	DWORD PTR 263096[rbp], eax
	mov	eax, DWORD PTR 263100[rbp]
	mov	DWORD PTR 320[rbp], eax
	mov	eax, DWORD PTR 263096[rbp]
	mov	DWORD PTR 324[rbp], eax
	mov	eax, DWORD PTR 263108[rbp]
	mov	DWORD PTR 328[rbp], eax
	mov	eax, DWORD PTR 263104[rbp]
	mov	DWORD PTR 332[rbp], eax
	mov	rdx, QWORD PTR 263840[rbp]
	mov	rax, QWORD PTR 263728[rbp]
	mov	rcx, rax
	call	SDL_CreateTextureFromSurface
	mov	QWORD PTR 263088[rbp], rax
	lea	rcx, 320[rbp]
	mov	rdx, QWORD PTR 263088[rbp]
	mov	rax, QWORD PTR 263728[rbp]
	mov	r9, rcx
	mov	r8d, 0
	mov	rcx, rax
	call	SDL_RenderCopy
	mov	rax, QWORD PTR 263840[rbp]
	mov	rcx, rax
	call	SDL_FreeSurface
	mov	rax, QWORD PTR 263088[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
.L324:
	mov	eax, DWORD PTR quizOn1[rip]
	cmp	eax, 1
	jne	.L326
	mov	eax, DWORD PTR quiz1QNum[rip]
	cmp	eax, 1
	jne	.L327
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 1
	jne	.L328
	lea	rax, .LC91[rip]
	mov	QWORD PTR quizQuestion[rip], rax
	lea	rax, .LC92[rip]
	mov	QWORD PTR answerA[rip], rax
	lea	rax, .LC93[rip]
	mov	QWORD PTR answerB[rip], rax
	lea	rax, .LC94[rip]
	mov	QWORD PTR answerC[rip], rax
	mov	DWORD PTR userAnswer[rip], 0
	add	DWORD PTR 263932[rbp], 500
	mov	eax, DWORD PTR quiz1QNum[rip]
	add	eax, 1
	mov	DWORD PTR quiz1QNum[rip], eax
.L328:
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 2
	jne	.L329
	lea	rax, .LC95[rip]
	mov	QWORD PTR quizQuestion[rip], rax
	lea	rax, .LC92[rip]
	mov	QWORD PTR answerA[rip], rax
	lea	rax, .LC93[rip]
	mov	QWORD PTR answerB[rip], rax
	lea	rax, .LC94[rip]
	mov	QWORD PTR answerC[rip], rax
	mov	DWORD PTR userAnswer[rip], 0
	mov	eax, DWORD PTR quiz1QNum[rip]
	add	eax, 1
	mov	DWORD PTR quiz1QNum[rip], eax
.L329:
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 3
	jne	.L326
	lea	rax, .LC95[rip]
	mov	QWORD PTR quizQuestion[rip], rax
	lea	rax, .LC92[rip]
	mov	QWORD PTR answerA[rip], rax
	lea	rax, .LC93[rip]
	mov	QWORD PTR answerB[rip], rax
	lea	rax, .LC94[rip]
	mov	QWORD PTR answerC[rip], rax
	mov	DWORD PTR userAnswer[rip], 0
	mov	eax, DWORD PTR quiz1QNum[rip]
	add	eax, 1
	mov	DWORD PTR quiz1QNum[rip], eax
	jmp	.L326
.L327:
	mov	eax, DWORD PTR quiz1QNum[rip]
	cmp	eax, 2
	jne	.L326
	mov	eax, DWORD PTR userAnswer[rip]
	test	eax, eax
	jne	.L331
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 1
	jne	.L332
	lea	rax, .LC96[rip]
	mov	QWORD PTR quizQuestion[rip], rax
	lea	rax, .LC97[rip]
	mov	QWORD PTR answerA[rip], rax
	lea	rax, .LC97[rip]
	mov	QWORD PTR answerB[rip], rax
	lea	rax, .LC97[rip]
	mov	QWORD PTR answerC[rip], rax
	mov	DWORD PTR userAnswer[rip], 0
	mov	eax, DWORD PTR quiz1QNum[rip]
	add	eax, 1
	mov	DWORD PTR quiz1QNum[rip], eax
.L332:
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 2
	jne	.L333
	lea	rax, .LC98[rip]
	mov	QWORD PTR quizQuestion[rip], rax
	lea	rax, .LC97[rip]
	mov	QWORD PTR answerA[rip], rax
	lea	rax, .LC97[rip]
	mov	QWORD PTR answerB[rip], rax
	lea	rax, .LC97[rip]
	mov	QWORD PTR answerC[rip], rax
	mov	DWORD PTR userAnswer[rip], 0
	add	DWORD PTR 263932[rbp], 500
	mov	eax, DWORD PTR quiz1QNum[rip]
	add	eax, 1
	mov	DWORD PTR quiz1QNum[rip], eax
.L333:
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 3
	jne	.L326
	lea	rax, .LC96[rip]
	mov	QWORD PTR quizQuestion[rip], rax
	lea	rax, .LC97[rip]
	mov	QWORD PTR answerA[rip], rax
	lea	rax, .LC97[rip]
	mov	QWORD PTR answerB[rip], rax
	lea	rax, .LC97[rip]
	mov	QWORD PTR answerC[rip], rax
	mov	DWORD PTR userAnswer[rip], 0
	mov	eax, DWORD PTR quiz1QNum[rip]
	add	eax, 1
	mov	DWORD PTR quiz1QNum[rip], eax
	jmp	.L326
.L331:
	mov	DWORD PTR quiz1QNum[rip], 3
	lea	rax, .LC99[rip]
	mov	QWORD PTR quizQuestion[rip], rax
	lea	rax, .LC100[rip]
	mov	QWORD PTR answerA[rip], rax
	lea	rax, .LC97[rip]
	mov	QWORD PTR answerB[rip], rax
	lea	rax, .LC97[rip]
	mov	QWORD PTR answerC[rip], rax
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 1
	jne	.L335
	mov	DWORD PTR quizOn1[rip], 0
	mov	DWORD PTR userAnswer[rip], 0
	mov	BYTE PTR quizOn[rip], 0
.L335:
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 2
	jne	.L336
	mov	DWORD PTR quizOn1[rip], 0
	mov	DWORD PTR userAnswer[rip], 0
	mov	BYTE PTR quizOn[rip], 0
.L336:
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 3
	jne	.L326
	mov	DWORD PTR quizOn1[rip], 0
	mov	DWORD PTR userAnswer[rip], 0
	mov	BYTE PTR quizOn[rip], 0
.L326:
	cmp	DWORD PTR 263904[rbp], 2
	jne	.L337
	movzx	eax, BYTE PTR quiz2Called[rip]
	xor	eax, 1
	test	al, al
	je	.L338
	lea	rax, .LC101[rip]
	mov	QWORD PTR quizQuestion[rip], rax
	lea	rax, .LC102[rip]
	mov	QWORD PTR answerA[rip], rax
	lea	rax, .LC103[rip]
	mov	QWORD PTR answerB[rip], rax
	lea	rax, .LC104[rip]
	mov	QWORD PTR answerC[rip], rax
	mov	BYTE PTR quiz2Called[rip], 1
	mov	BYTE PTR quizOn[rip], 1
	mov	BYTE PTR 518[rbp], 0
.L338:
	mov	eax, DWORD PTR quiz2QNum[rip]
	cmp	eax, 1
	jne	.L339
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 1
	jne	.L340
	lea	rax, .LC105[rip]
	mov	QWORD PTR quizQuestion[rip], rax
	lea	rax, .LC106[rip]
	mov	QWORD PTR answerA[rip], rax
	lea	rax, .LC107[rip]
	mov	QWORD PTR answerB[rip], rax
	lea	rax, .LC108[rip]
	mov	QWORD PTR answerC[rip], rax
	mov	DWORD PTR userAnswer[rip], 0
	mov	eax, DWORD PTR quiz2QNum[rip]
	add	eax, 1
	mov	DWORD PTR quiz2QNum[rip], eax
.L340:
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 2
	jne	.L341
	lea	rax, .LC109[rip]
	mov	QWORD PTR quizQuestion[rip], rax
	lea	rax, .LC106[rip]
	mov	QWORD PTR answerA[rip], rax
	lea	rax, .LC107[rip]
	mov	QWORD PTR answerB[rip], rax
	lea	rax, .LC108[rip]
	mov	QWORD PTR answerC[rip], rax
	mov	DWORD PTR userAnswer[rip], 0
	add	DWORD PTR 263932[rbp], 500
	mov	eax, DWORD PTR quiz2QNum[rip]
	add	eax, 1
	mov	DWORD PTR quiz2QNum[rip], eax
.L341:
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 3
	jne	.L337
	lea	rax, .LC110[rip]
	mov	QWORD PTR quizQuestion[rip], rax
	lea	rax, .LC106[rip]
	mov	QWORD PTR answerA[rip], rax
	lea	rax, .LC107[rip]
	mov	QWORD PTR answerB[rip], rax
	lea	rax, .LC108[rip]
	mov	QWORD PTR answerC[rip], rax
	mov	DWORD PTR userAnswer[rip], 0
	mov	eax, DWORD PTR quiz2QNum[rip]
	add	eax, 1
	mov	DWORD PTR quiz2QNum[rip], eax
	jmp	.L337
.L339:
	mov	eax, DWORD PTR quiz2QNum[rip]
	cmp	eax, 2
	jne	.L343
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 1
	jne	.L344
	lea	rax, .LC96[rip]
	mov	QWORD PTR quizQuestion[rip], rax
	lea	rax, .LC97[rip]
	mov	QWORD PTR answerA[rip], rax
	lea	rax, .LC97[rip]
	mov	QWORD PTR answerB[rip], rax
	lea	rax, .LC97[rip]
	mov	QWORD PTR answerC[rip], rax
	mov	DWORD PTR userAnswer[rip], 0
	mov	eax, DWORD PTR quiz2QNum[rip]
	add	eax, 1
	mov	DWORD PTR quiz2QNum[rip], eax
.L344:
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 2
	jne	.L345
	lea	rax, .LC111[rip]
	mov	QWORD PTR quizQuestion[rip], rax
	lea	rax, .LC97[rip]
	mov	QWORD PTR answerA[rip], rax
	lea	rax, .LC97[rip]
	mov	QWORD PTR answerB[rip], rax
	lea	rax, .LC97[rip]
	mov	QWORD PTR answerC[rip], rax
	mov	DWORD PTR userAnswer[rip], 0
	add	DWORD PTR 263932[rbp], 500
	mov	eax, DWORD PTR quiz2QNum[rip]
	add	eax, 1
	mov	DWORD PTR quiz2QNum[rip], eax
.L345:
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 3
	jne	.L337
	lea	rax, .LC96[rip]
	mov	QWORD PTR quizQuestion[rip], rax
	lea	rax, .LC97[rip]
	mov	QWORD PTR answerA[rip], rax
	lea	rax, .LC97[rip]
	mov	QWORD PTR answerB[rip], rax
	lea	rax, .LC97[rip]
	mov	QWORD PTR answerC[rip], rax
	mov	DWORD PTR userAnswer[rip], 0
	mov	eax, DWORD PTR quiz2QNum[rip]
	add	eax, 1
	mov	DWORD PTR quiz2QNum[rip], eax
	jmp	.L337
.L343:
	mov	DWORD PTR quiz2QNum[rip], 3
	lea	rax, .LC100[rip]
	mov	QWORD PTR answerA[rip], rax
	lea	rax, .LC97[rip]
	mov	QWORD PTR answerB[rip], rax
	lea	rax, .LC97[rip]
	mov	QWORD PTR answerC[rip], rax
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 1
	jne	.L347
	mov	DWORD PTR quizOn2[rip], 0
	mov	BYTE PTR quizOn[rip], 0
	mov	BYTE PTR 518[rbp], 12
.L347:
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 2
	jne	.L348
	mov	DWORD PTR quizOn2[rip], 0
	mov	BYTE PTR quizOn[rip], 0
	mov	BYTE PTR 518[rbp], 12
.L348:
	mov	eax, DWORD PTR userAnswer[rip]
	cmp	eax, 3
	jne	.L337
	mov	DWORD PTR quizOn2[rip], 0
	mov	BYTE PTR quizOn[rip], 0
	mov	BYTE PTR 518[rbp], 12
.L337:
	movzx	eax, BYTE PTR quizOn[rip]
	test	al, al
	je	.L349
	mov	DWORD PTR 316[rbp], 0
	mov	BYTE PTR 316[rbp], -56
	mov	BYTE PTR 317[rbp], -56
	mov	BYTE PTR 318[rbp], -56
	movzx	eax, BYTE PTR 318[rbp]
	movzx	r8d, al
	movzx	eax, BYTE PTR 317[rbp]
	movzx	edx, al
	movzx	eax, BYTE PTR 316[rbp]
	movzx	eax, al
	mov	rcx, QWORD PTR 263728[rbp]
	mov	DWORD PTR 32[rsp], 255
	mov	r9d, r8d
	mov	r8d, edx
	mov	edx, eax
	call	SDL_SetRenderDrawColor
	mov	DWORD PTR 263084[rbp], 400
	mov	DWORD PTR 263080[rbp], 200
	mov	eax, 800
	sub	eax, DWORD PTR 263084[rbp]
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	add	eax, 300
	mov	DWORD PTR 263076[rbp], eax
	mov	eax, 600
	sub	eax, DWORD PTR 263080[rbp]
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	mov	DWORD PTR 263072[rbp], eax
	mov	eax, DWORD PTR 263076[rbp]
	mov	DWORD PTR 288[rbp], eax
	mov	eax, DWORD PTR 263072[rbp]
	mov	DWORD PTR 292[rbp], eax
	mov	eax, DWORD PTR 263084[rbp]
	mov	DWORD PTR 296[rbp], eax
	mov	eax, DWORD PTR 263080[rbp]
	mov	DWORD PTR 300[rbp], eax
	lea	rax, 288[rbp]
	mov	rcx, QWORD PTR 263728[rbp]
	mov	rdx, rax
	call	SDL_RenderFillRect
	mov	DWORD PTR 284[rbp], 0
	mov	eax, DWORD PTR 263084[rbp]
	sub	eax, 20
	mov	DWORD PTR 263068[rbp], eax
	mov	r8, QWORD PTR answerC[rip]
	mov	rcx, QWORD PTR answerB[rip]
	mov	rdx, QWORD PTR answerA[rip]
	mov	r9, QWORD PTR quizQuestion[rip]
	lea	rax, -32[rbp]
	mov	QWORD PTR 48[rsp], r8
	mov	QWORD PTR 40[rsp], rcx
	mov	QWORD PTR 32[rsp], rdx
	lea	r8, .LC112[rip]
	mov	edx, 256
	mov	rcx, rax
	call	snprintf
	mov	r8d, DWORD PTR 263068[rbp]
	mov	edx, DWORD PTR 284[rbp]
	lea	rax, -32[rbp]
	mov	rcx, QWORD PTR 263688[rbp]
	mov	r9d, r8d
	mov	r8d, edx
	mov	rdx, rax
	call	TTF_RenderText_Blended_Wrapped
	mov	QWORD PTR 263056[rbp], rax
	mov	rdx, QWORD PTR 263056[rbp]
	mov	rax, QWORD PTR 263728[rbp]
	mov	rcx, rax
	call	SDL_CreateTextureFromSurface
	mov	QWORD PTR 263048[rbp], rax
	mov	rax, QWORD PTR 263056[rbp]
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR 263044[rbp], eax
	mov	rax, QWORD PTR 263056[rbp]
	mov	eax, DWORD PTR 20[rax]
	mov	DWORD PTR 263040[rbp], eax
	mov	eax, DWORD PTR 263084[rbp]
	sub	eax, DWORD PTR 263044[rbp]
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	mov	edx, eax
	mov	eax, DWORD PTR 263076[rbp]
	add	eax, edx
	mov	DWORD PTR 263036[rbp], eax
	mov	eax, DWORD PTR 263080[rbp]
	sub	eax, DWORD PTR 263040[rbp]
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	mov	edx, eax
	mov	eax, DWORD PTR 263072[rbp]
	add	eax, edx
	mov	DWORD PTR 263032[rbp], eax
	mov	eax, DWORD PTR 263036[rbp]
	mov	DWORD PTR 256[rbp], eax
	mov	eax, DWORD PTR 263032[rbp]
	mov	DWORD PTR 260[rbp], eax
	mov	eax, DWORD PTR 263044[rbp]
	mov	DWORD PTR 264[rbp], eax
	mov	eax, DWORD PTR 263040[rbp]
	mov	DWORD PTR 268[rbp], eax
	lea	rcx, 256[rbp]
	mov	rdx, QWORD PTR 263048[rbp]
	mov	rax, QWORD PTR 263728[rbp]
	mov	r9, rcx
	mov	r8d, 0
	mov	rcx, rax
	call	SDL_RenderCopy
	mov	rax, QWORD PTR 263056[rbp]
	mov	rcx, rax
	call	SDL_FreeSurface
	mov	rax, QWORD PTR 263048[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
.L349:
	mov	DWORD PTR 263836[rbp], 0
	jmp	.L350
.L352:
	lea	rax, waterParticles[rip]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR 263836[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	mov	eax, DWORD PTR 12[rax]
	test	eax, eax
	je	.L351
	lea	rax, waterParticles[rip]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR 263836[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	movss	xmm1, DWORD PTR 4[rax]
	movss	xmm0, DWORD PTR .LC113[rip]
	addss	xmm0, xmm1
	cvttss2si	edx, xmm0
	lea	rax, waterParticles[rip]
	mov	rcx, QWORD PTR [rax]
	mov	eax, DWORD PTR 263836[rbp]
	cdqe
	sal	rax, 4
	add	rax, rcx
	movss	xmm1, DWORD PTR [rax]
	movss	xmm0, DWORD PTR .LC114[rip]
	addss	xmm0, xmm1
	cvttss2si	r9d, xmm0
	lea	rax, waterParticles[rip]
	mov	rcx, QWORD PTR [rax]
	mov	eax, DWORD PTR 263836[rbp]
	cdqe
	sal	rax, 4
	add	rax, rcx
	movss	xmm0, DWORD PTR 4[rax]
	cvttss2si	r8d, xmm0
	lea	rax, waterParticles[rip]
	mov	rcx, QWORD PTR [rax]
	mov	eax, DWORD PTR 263836[rbp]
	cdqe
	sal	rax, 4
	add	rax, rcx
	movss	xmm0, DWORD PTR [rax]
	cvttss2si	eax, xmm0
	mov	rcx, QWORD PTR 263728[rbp]
	mov	r10, QWORD PTR 263648[rbp]
	mov	QWORD PTR 40[rsp], r10
	mov	DWORD PTR 32[rsp], edx
	mov	edx, eax
	call	draw_image
.L351:
	add	DWORD PTR 263836[rbp], 1
.L350:
	mov	eax, 100
	cmp	DWORD PTR 263836[rbp], eax
	jl	.L352
	mov	rax, QWORD PTR globalEnemy[rip]
	test	rax, rax
	je	.L353
	mov	rax, QWORD PTR globalEnemy[rip]
	mov	eax, DWORD PTR 16[rax]
	test	eax, eax
	jle	.L353
	mov	rax, QWORD PTR 263728[rbp]
	mov	DWORD PTR 32[rsp], 255
	mov	r9d, 0
	mov	r8d, 0
	mov	edx, 255
	mov	rcx, rax
	call	SDL_SetRenderDrawColor
	mov	rax, QWORD PTR globalEnemy[rip]
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR 240[rbp], eax
	mov	rax, QWORD PTR globalEnemy[rip]
	mov	eax, DWORD PTR 4[rax]
	mov	DWORD PTR 244[rbp], eax
	mov	rax, QWORD PTR globalEnemy[rip]
	mov	eax, DWORD PTR 8[rax]
	mov	DWORD PTR 248[rbp], eax
	mov	rax, QWORD PTR globalEnemy[rip]
	mov	eax, DWORD PTR 12[rax]
	mov	DWORD PTR 252[rbp], eax
	lea	rax, 240[rbp]
	mov	rcx, QWORD PTR 263728[rbp]
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
	mov	rax, QWORD PTR 263728[rbp]
	mov	r8, QWORD PTR 263600[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_image
.L353:
	mov	rax, QWORD PTR globalEnemy[rip]
	test	rax, rax
	je	.L354
	mov	rax, QWORD PTR globalEnemy[rip]
	mov	eax, DWORD PTR 16[rax]
	test	eax, eax
	jg	.L354
	mov	rax, QWORD PTR globalEnemy[rip]
	mov	rcx, rax
	call	resetEnemy
.L354:
	cmp	DWORD PTR 263900[rbp], 0
	je	.L355
	mov	eax, DWORD PTR 263756[rbp]
	sal	eax, 6
	mov	DWORD PTR 263028[rbp], eax
	mov	ecx, DWORD PTR 263796[rbp]
	mov	rax, QWORD PTR 263728[rbp]
	mov	DWORD PTR 40[rsp], 0
	mov	edx, DWORD PTR 263792[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, ecx
	mov	r8d, 0
	mov	edx, 0
	mov	rcx, rax
	call	draw_rectangle_color
	mov	edx, DWORD PTR 263772[rbp]
	mov	eax, DWORD PTR 263028[rbp]
	lea	r9d, [rdx+rax]
	mov	eax, DWORD PTR 263788[rbp]
	sub	eax, DWORD PTR 263028[rbp]
	mov	r8d, DWORD PTR 263784[rbp]
	mov	rcx, QWORD PTR 263728[rbp]
	mov	rdx, QWORD PTR 263416[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	edx, DWORD PTR 263768[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	edx, eax
	call	draw_image
	mov	DWORD PTR 263024[rbp], 16
	call	draw_get_color
	mov	DWORD PTR 263020[rbp], eax
	call	get_timer
	mov	DWORD PTR 263016[rbp], eax
	mov	ecx, DWORD PTR 263016[rbp]
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
	mov	DWORD PTR 263012[rbp], edx
	mov	edx, DWORD PTR 263012[rbp]
	imul	edx, edx, 360
	sub	eax, edx
	mov	DWORD PTR 263012[rbp], eax
	mov	ecx, DWORD PTR 263016[rbp]
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
	movsd	xmm0, QWORD PTR .LC115[rip]
	mulsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC116[rip]
	addsd	xmm0, xmm1
	cvttsd2si	eax, xmm0
	mov	DWORD PTR 263008[rbp], eax
	mov	ecx, DWORD PTR 263016[rbp]
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
	mov	DWORD PTR 263004[rbp], eax
	mov	DWORD PTR 263832[rbp], 0
	jmp	.L356
.L357:
	mov	eax, DWORD PTR 263024[rbp]
	neg	eax
	imul	eax, DWORD PTR 263756[rbp]
	cvtsi2sd	xmm6, eax
	cvtsi2sd	xmm0, DWORD PTR 263012[rbp]
	call	dcos
	mulsd	xmm6, xmm0
	mov	eax, DWORD PTR 263832[rbp]
	imul	eax, DWORD PTR 263756[rbp]
	cvtsi2sd	xmm7, eax
	cvtsi2sd	xmm0, DWORD PTR 263012[rbp]
	call	dcos
	mulsd	xmm0, xmm7
	addsd	xmm0, xmm6
	cvttsd2si	eax, xmm0
	mov	DWORD PTR 263000[rbp], eax
	mov	eax, DWORD PTR 263024[rbp]
	neg	eax
	imul	eax, DWORD PTR 263752[rbp]
	cvtsi2sd	xmm6, eax
	cvtsi2sd	xmm0, DWORD PTR 263008[rbp]
	call	dsin
	mulsd	xmm6, xmm0
	mov	eax, DWORD PTR 263832[rbp]
	imul	eax, DWORD PTR 263752[rbp]
	cvtsi2sd	xmm7, eax
	cvtsi2sd	xmm0, DWORD PTR 263008[rbp]
	call	dsin
	mulsd	xmm0, xmm7
	addsd	xmm0, xmm6
	cvttsd2si	eax, xmm0
	mov	DWORD PTR 262996[rbp], eax
	cvtsi2sd	xmm0, DWORD PTR 263832[rbp]
	mov	eax, DWORD PTR 263024[rbp]
	sub	eax, 1
	cvtsi2sd	xmm1, eax
	divsd	xmm0, xmm1
	movapd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC117[rip]
	movapd	xmm2, xmm1
	movapd	xmm1, xmm0
	pxor	xmm0, xmm0
	call	lerp
	cvttsd2si	edx, xmm0
	mov	eax, DWORD PTR 263004[rbp]
	mov	r8d, edx
	mov	edx, 32
	mov	ecx, eax
	call	make_color_hsv
	mov	edx, eax
	mov	rax, QWORD PTR 263728[rbp]
	mov	rcx, rax
	call	draw_set_color
	mov	edx, DWORD PTR 263768[rbp]
	mov	eax, DWORD PTR 262996[rbp]
	lea	ecx, [rdx+rax]
	mov	edx, DWORD PTR 263772[rbp]
	mov	eax, DWORD PTR 263028[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 263000[rbp]
	lea	r9d, [rdx+rax]
	mov	edx, DWORD PTR 263784[rbp]
	mov	eax, DWORD PTR 262996[rbp]
	lea	r10d, [rdx+rax]
	mov	eax, DWORD PTR 263788[rbp]
	sub	eax, DWORD PTR 263028[rbp]
	mov	edx, DWORD PTR 263000[rbp]
	add	edx, eax
	mov	rax, QWORD PTR 263728[rbp]
	mov	r8, QWORD PTR 263408[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	DWORD PTR 32[rsp], ecx
	mov	r8d, r10d
	mov	rcx, rax
	call	draw_image
	add	DWORD PTR 263832[rbp], 1
.L356:
	mov	eax, DWORD PTR 263832[rbp]
	cmp	eax, DWORD PTR 263024[rbp]
	jl	.L357
	mov	edx, DWORD PTR 263772[rbp]
	mov	eax, DWORD PTR 263028[rbp]
	lea	r9d, [rdx+rax]
	mov	eax, DWORD PTR 263788[rbp]
	sub	eax, DWORD PTR 263028[rbp]
	mov	r8d, DWORD PTR 263784[rbp]
	mov	rcx, QWORD PTR 263728[rbp]
	mov	rdx, QWORD PTR 263400[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	edx, DWORD PTR 263768[rbp]
	mov	DWORD PTR 32[rsp], edx
	mov	edx, eax
	call	draw_image
	mov	edx, DWORD PTR 263020[rbp]
	mov	rax, QWORD PTR 263728[rbp]
	mov	rcx, rax
	call	draw_set_color
	mov	DWORD PTR 262992[rbp], 384
	mov	DWORD PTR 262988[rbp], 32
	mov	ecx, DWORD PTR 263016[rbp]
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
	jle	.L358
	mov	r9d, 65535
	mov	eax, DWORD PTR 263576[rbp]
	imul	eax, DWORD PTR 263752[rbp]
	mov	edx, DWORD PTR 263580[rbp]
	imul	edx, DWORD PTR 263756[rbp]
	mov	r8d, edx
	mov	r10d, DWORD PTR 262988[rbp]
	mov	edx, DWORD PTR 262992[rbp]
	mov	rcx, QWORD PTR 263728[rbp]
	mov	DWORD PTR 72[rsp], r9d
	mov	r9d, DWORD PTR 263576[rbp]
	mov	DWORD PTR 64[rsp], r9d
	mov	r9d, DWORD PTR 263580[rbp]
	mov	DWORD PTR 56[rsp], r9d
	mov	r9, QWORD PTR 263392[rbp]
	mov	QWORD PTR 48[rsp], r9
	mov	r9, QWORD PTR 263584[rbp]
	mov	QWORD PTR 40[rsp], r9
	mov	DWORD PTR 32[rsp], eax
	mov	r9d, r8d
	mov	r8d, r10d
	call	draw_text_color
.L358:
	mov	DWORD PTR 262992[rbp], 64
	mov	DWORD PTR 262988[rbp], 8
	mov	eax, DWORD PTR 263376[rbp]
	mov	DWORD PTR 263024[rbp], eax
	mov	DWORD PTR 263828[rbp], 0
	jmp	.L359
.L360:
	mov	eax, DWORD PTR 263752[rbp]
	sal	eax, 3
	cvtsi2sd	xmm6, eax
	mov	ecx, DWORD PTR 263016[rbp]
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
	cvtsi2sd	xmm0, DWORD PTR 263828[rbp]
	mov	eax, DWORD PTR 263024[rbp]
	sub	eax, 1
	cvtsi2sd	xmm1, eax
	divsd	xmm0, xmm1
	movapd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC119[rip]
	movapd	xmm2, xmm1
	movapd	xmm1, xmm0
	pxor	xmm0, xmm0
	call	lerp
	addsd	xmm0, xmm7
	call	dcos
	mulsd	xmm0, xmm6
	cvttsd2si	eax, xmm0
	mov	DWORD PTR 262984[rbp], eax
	mov	eax, DWORD PTR 263828[rbp]
	cdqe
	mov	rdx, QWORD PTR 263384[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	mov	BYTE PTR 238[rbp], al
	mov	r9d, 16777215
	mov	eax, DWORD PTR 263576[rbp]
	imul	eax, DWORD PTR 263752[rbp]
	mov	edx, DWORD PTR 263580[rbp]
	imul	edx, DWORD PTR 263756[rbp]
	mov	r8d, edx
	mov	ecx, DWORD PTR 263784[rbp]
	mov	edx, DWORD PTR 263776[rbp]
	add	edx, ecx
	sub	edx, DWORD PTR 262988[rbp]
	mov	ecx, DWORD PTR 262984[rbp]
	add	ecx, edx
	mov	edx, DWORD PTR 263576[rbp]
	imul	edx, DWORD PTR 263752[rbp]
	sub	ecx, edx
	mov	r11d, ecx
	mov	edx, DWORD PTR 263580[rbp]
	imul	edx, DWORD PTR 263756[rbp]
	imul	edx, DWORD PTR 263828[rbp]
	mov	ecx, DWORD PTR 262992[rbp]
	lea	r10d, [rdx+rcx]
	mov	rcx, QWORD PTR 263728[rbp]
	mov	DWORD PTR 72[rsp], r9d
	mov	edx, DWORD PTR 263576[rbp]
	mov	DWORD PTR 64[rsp], edx
	mov	edx, DWORD PTR 263580[rbp]
	mov	DWORD PTR 56[rsp], edx
	lea	rdx, 238[rbp]
	mov	QWORD PTR 48[rsp], rdx
	mov	rdx, QWORD PTR 263584[rbp]
	mov	QWORD PTR 40[rsp], rdx
	mov	DWORD PTR 32[rsp], eax
	mov	r9d, r8d
	mov	r8d, r11d
	mov	edx, r10d
	call	draw_text_color
	add	DWORD PTR 263828[rbp], 1
.L359:
	mov	eax, DWORD PTR 263828[rbp]
	cmp	eax, DWORD PTR 263024[rbp]
	jl	.L360
.L355:
	mov	rax, QWORD PTR 263728[rbp]
	mov	DWORD PTR 32[rsp], 255
	mov	r9d, 0
	mov	r8d, 0
	mov	edx, 0
	mov	rcx, rax
	call	SDL_SetRenderDrawColor
	mov	edx, DWORD PTR 263932[rbp]
	lea	rax, 368[rbp]
	mov	r9d, edx
	lea	r8, .LC120[rip]
	mov	edx, 20
	mov	rcx, rax
	call	snprintf
	mov	edx, DWORD PTR 262780[rbp]
	lea	rax, 368[rbp]
	mov	rcx, QWORD PTR 263688[rbp]
	mov	r8d, edx
	mov	rdx, rax
	call	TTF_RenderText_Solid
	mov	QWORD PTR 262976[rbp], rax
	mov	rdx, QWORD PTR 262976[rbp]
	mov	rax, QWORD PTR 263728[rbp]
	mov	rcx, rax
	call	SDL_CreateTextureFromSurface
	mov	QWORD PTR 262968[rbp], rax
	mov	DWORD PTR 352[rbp], 10
	mov	DWORD PTR 356[rbp], 720
	mov	rax, QWORD PTR 262976[rbp]
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR 360[rbp], eax
	mov	rax, QWORD PTR 262976[rbp]
	mov	eax, DWORD PTR 20[rax]
	mov	DWORD PTR 364[rbp], eax
	lea	rcx, 352[rbp]
	mov	rdx, QWORD PTR 262968[rbp]
	mov	rax, QWORD PTR 263728[rbp]
	mov	r9, rcx
	mov	r8d, 0
	mov	rcx, rax
	call	SDL_RenderCopy
	mov	rax, QWORD PTR 262976[rbp]
	mov	rcx, rax
	call	SDL_FreeSurface
	mov	rax, QWORD PTR 262968[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 263728[rbp]
	mov	rcx, rax
	call	SDL_RenderPresent
	mov	ecx, 16
	call	SDL_Delay
.L191:
	cmp	DWORD PTR 263896[rbp], 0
	jne	.L192
	lea	rcx, .LC121[rip]
	call	puts
	lea	rax, waterParticles[rip]
	mov	rax, QWORD PTR [rax]
	mov	rcx, rax
	call	free
	mov	rax, QWORD PTR 263688[rbp]
	mov	rcx, rax
	call	TTF_CloseFont
	mov	rax, QWORD PTR 263664[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 263656[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 263648[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 263640[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 263632[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 263624[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 263616[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 263480[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 263472[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 263592[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 263416[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 263408[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 263400[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 263584[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 263568[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 263456[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 263608[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 263440[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	mov	rax, QWORD PTR 263600[rbp]
	mov	rcx, rax
	call	SDL_DestroyTexture
	call	IMG_Quit
	mov	eax, DWORD PTR 263428[rbp]
	mov	ecx, eax
	call	SDL_CloseAudioDevice
	mov	rax, QWORD PTR 424[rbp]
	mov	rcx, rax
	call	SDL_FreeWAV
	mov	rax, QWORD PTR 263728[rbp]
	mov	rcx, rax
	call	SDL_DestroyRenderer
	mov	rax, QWORD PTR 263736[rbp]
	mov	rcx, rax
	call	SDL_DestroyWindow
	call	SDL_Quit
	mov	ecx, 500
	call	SDL_Delay
	mov	eax, 0
	jmp	.L177
.L182:
	call	SDL_GetError
	mov	rsi, rax
	mov	rbx, QWORD PTR 263800[rbp]
	mov	ecx, 2
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	r9, rsi
	mov	r8, rbx
	lea	rdx, .LC122[rip]
	mov	rcx, rax
	call	fprintf
	call	SDL_Quit
	mov	ecx, 1
	call	exit
.L177:
	mov	rsp, r12
	jmp	.L175
.L189:
	mov	rsp, r12
.L175:
	movaps	xmm6, XMMWORD PTR 263936[rbp]
	movaps	xmm7, XMMWORD PTR 263952[rbp]
	lea	rsp, 263976[rbp]
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
.LC84:
	.long	0
	.long	1076887552
	.align 8
.LC86:
	.long	0
	.long	1072693248
	.align 8
.LC87:
	.long	0
	.long	1070596096
	.align 8
.LC88:
	.long	-1717986918
	.long	1069128089
	.align 8
.LC89:
	.long	858993459
	.long	1070805811
	.align 4
.LC113:
	.long	1097859072
	.align 4
.LC114:
	.long	1084227584
	.align 8
.LC115:
	.long	0
	.long	1079164928
	.align 8
.LC116:
	.long	0
	.long	1079410688
	.align 8
.LC117:
	.long	0
	.long	1081073664
	.align 8
.LC119:
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
	.def	sqrt;	.scl	2;	.type	32;	.endef
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
