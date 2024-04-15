section .bss
        result resb 1
section .text
        global _start

_start:
        mov ecx, 7
        mov eax, ecx
        sub eax, 1

        call multiply
        call label

        label:
        sub eax, 1
        jz exit
        call multiply
        add ecx, 1
        loop label

        multiply:
        imul ecx, eax   
        ret
        exit:
        mov [result], ecx
        mov eax,1
        int 0x80
