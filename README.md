# iptables_open
open a port and add a rule on iptables ex: 1337 

# BUILD
```shell
nasm -f elf32 iptables_open.asm -o iptables_open.o
ld -m elf_i386 -o iptables_open iptables_open.o
```
