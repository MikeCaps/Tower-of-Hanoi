

towerOfHanoi:
        push    {fp, lr}
        add     fp, sp, #4
        sub     sp, sp, #8
        str     r0, [fp, #-8]
        mov     r0, r1
        mov     r1, r2
        mov     r2, r3
        mov     r3, r0
        strb    r3, [fp, #-9]
        mov     r3, r1
        strb    r3, [fp, #-10]
        mov     r3, r2
        strb    r3, [fp, #-11]
        ldr     r3, [fp, #-8]
        cmp     r3, #1
        bne     .L1
        ldrb    r2, [fp, #-9]   @ zero_extendqisi2
        ldrb    r3, [fp, #-10]  @ zero_extendqisi2
        ldr     r1, [fp, #-8]
        ldr     r0, .L3
        bl      printf
        b       .L2
.L1:
        ldr     r3, [fp, #-8]
        sub     r0, r3, #1
        ldrb    r3, [fp, #-10]  @ zero_extendqisi2
        ldrb    r2, [fp, #-11]  @ zero_extendqisi2
        ldrb    r1, [fp, #-9]   @ zero_extendqisi2
        bl      towerOfHanoi
        ldrb    r2, [fp, #-9]   @ zero_extendqisi2
        ldrb    r3, [fp, #-10]  @ zero_extendqisi2
        ldr     r1, [fp, #-8]
        ldr     r0, .L3
        bl      printf
        ldr     r3, [fp, #-8]
        sub     r0, r3, #1
        ldrb    r3, [fp, #-9]   @ zero_extendqisi2
        ldrb    r2, [fp, #-10]  @ zero_extendqisi2
        ldrb    r1, [fp, #-11]  @ zero_extendqisi2
        bl      towerOfHanoi
.L2:
        nop
        sub     sp, fp, #4
        pop     {fp, pc}
.L3:
        .word   .LC0
printf:
	ldr 	r4, [sp]
	lsr	r4, #24
	ldr	r5, =A
	str	r4, [r5]	@variable A

	ldr 	r4, [sp]
	lsl	r4, #8
	lsr	r4, #24		
	ldr	r5, =C
	str	r4, [r5]	@variable C

	ldr 	r4, [sp]
	lsl	r4, #16
	lsr	r4, #24		@variable B
	ldr	r5, =B
	str	r4, [r5]



	mov r6, r0
	mov r7, r1

LDR 	R1, =MoveDisk	
MOV	R0, #1		
SWI 	0x69		

	ldr r1, [sp, #4]
MOV 	R0,#1	 	
SWI 	0x6b		

LDR 	R1, =FromPole	
MOV	R0, #1		
SWI 	0x69		

LDR 	R1, =A	
mov 	r0, #1
swi 	0x69


LDR 	R1, =ToPole	
MOV	R0, #1		
SWI 	0x69		

LDR 	R1, =C		
mov r0, #1
swi 0x69

LDR 	R1, =NL		
MOV	R0, #1		
SWI 	0x69		

	mov r0, r6
	mov r1, r7







        str     fp, [sp, #-4]!
        add     fp, sp, #0
        sub     sp, sp, #20
        str     r0, [fp, #-8]
        str     r1, [fp, #-12]
        mov     r1, r2
        mov     r2, r3
        mov     r3, r1
        strb    r3, [fp, #-13]
        mov     r3, r2
        strb    r3, [fp, #-14]
        nop
        add     sp, fp, #0
        ldr     fp, [sp], #4

        bx      lr
main:
        push    {fp, lr}
        add     fp, sp, #4
        mov     r3, #66
        mov     r2, #67
        mov     r1, #65
        mov     r0, #3
        bl      towerOfHanoi
        nop
        pop     {fp, pc}

.data
.LC0: .ascii  "Move disk %d from rod %c to rod %c\012\000"
.data
MoveDisk:	.ascii "Move disk \0"
FromPole: 	.ascii " from rod \0"
ToPole:		.ascii " to rod \0"
.align
A:		.word 0
.align
B:		.word 0
.align
C:		.word 0
NL:		.ascii "\n"
