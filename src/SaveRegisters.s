;******************** (C) COPYRIGHT 2015 TARUC *********************************
;* File Name          : AssemblyModule.s
;* Author             : Poh Tze Ven
;* Version            : Ver.0.1
;* Date               : 23-June-2015
;* Description        : Simple functions to demonstrates assembly-c callings.
;*******************************************************************************
;
;* Redistribution and use in source and binary forms, with or without modification,
;* are permitted provided that the following conditions are met:
;*   1. Redistributions of source code must retain the above copyright notice,
;*      this list of conditions and the following disclaimer.
;*   2. Redistributions in binary form must reproduce the above copyright notice,
;*      this list of conditions and the following disclaimer in the documentation
;*      and/or other materials provided with the distribution.
;*   3. Neither the name of STMicroelectronics nor the names of its contributors
;*      may be used to endorse or promote products derived from this software
;*      without specific prior written permission.
;*
;* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
;* AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
;* IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
;* DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
;* FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
;* DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
;* SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
;* CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
;* OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
;* OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
;
;*******************************************************************************
          PRESERVE8
          THUMB

          AREA    MyCode, CODE, READONLY
saveRegs  PROC
          EXPORT  saveRegs
          IMPORT  initTcb
          IMPORT  task1Tcb

          mov  r0,  #0x0A		; used to verify
          mov  r1,  #0x0B		; used to verify
          mov  r2, 	#0x0C		; used to verify
          mov  r3, 	#0x0D		; used to verify
          mov  r4, 	#0x0E		; used to verify
          mov  r5, 	#0x0F		; used to verify
          mov  r6, 	#0xAA		; used to verify
          mov  r7, 	#0xBB		; used to verify
          mov  r8, 	#0xCC		; used to verify
          mov  r9, 	#0xDD		; used to verify
          mov  r10,	#0xEE		; used to verify
          mov  r11, #0xFF		; used to verify
          mov  r12, #0xAAA  ; used to verify

          ldr  r5, =task1Tcb    ; load task1Tcb address in R5
          ldr  sp, [r5, #0x04]  ; load task1Tcb.sp[r1, #0x04] 0x20000418 into SP

          push  {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12}	; Push all register to stack, except R13

          ;   Decrement after
          ;   +-------+
          ;   |  r12  | 0x20000414
          ;   +-------+
          ;   |  r11  | 0x20000410
          ;   +-------+
          ;   |  r10  | 0x2000040C
          ;   +-------+
          ;   |  r9   | 0x20000408
          ;   +-------+
          ;   |  r8   | 0x20000404
          ;   +-------+
          ;   |  r7   | 0x20000400
          ;   +-------+
          ;   |  r6   | 0x200003FC
          ;   +-------+
          ;   |  r5   | 0x200003F8
          ;   +-------+
          ;   |  r4   | 0x200003F4
          ;   +-------+
          ;   |  r3   | 0x200003F0
          ;   +-------+
          ;   |  r2   | 0x200003EC
          ;   +-------+
          ;   |  r1   | 0x200003E8
          ;   +-------+
          ;   |  r0   | 0x200003E4
          ;   +-------+

          bx    lr  ; Return to our caller
          ENDP
          END
