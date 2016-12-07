# 16-bit CPU


## Registers

* 16 Registers (R0 - R15)
* R0 is status register
* R1 is stack pointer


## Instruction Types

* Register-Register
* Register-Immediate
* Regoster-Register-Immediate
* Jump

## Instructions

| Instruction     | Operation             | Description              |
|-----------------|-----------------------|--------------------------|
| NOP\*           |                       | no operation             |
| MOV Ra, Rb\*    | Ra <- Rb              | move Rb to Ra            |
| NOT Ra, Rb\*    | Ra <- ~Rb             | not                      |
| AND Ra, Rb\*    | Ra <- Ra & Rb         | and                      |
| OR Ra, Rb\*     | Ra <- Ra \| Rb        | or                       |
| XOR Ra, Rb\*    | Ra <- Ra ^ Rb         | xor                      |
| SHLL Ra, Rb\*   | Ra <- Ra << Rb        | shift left logical       |
| SHRL Ra, Rb\*   | Ra <- Ra >> Rb        | shift right logical      |
| SHRA Ra, Rb\*   | Ra <- Ra >> Rb        | shift right arithmetic   |
| ADD Ra, Rb\*    | Ra <- Ra + Rb         | add                      |
| ADDC Ra, Rb\*   | Ra <- Ra + Rb + C     | add with carry           |
| ADDI Ra, X\*    | Ra <- Ra + X          | add immediate            |
| SUB Ra, Rb\*    | Ra <- Ra - Rb         | subtract                 |
| SUBB Ra, Rb\*   | Ra <- Ra - Rb - B     | subtract with borrow     |
| SUBI Ra, X\*    | Ra <- Ra - X          | subtract immediate       |
| MUL Ra, Rb\*    | Ra <- Ra * Rb         | multiply                 |
| LD\*            |                       | load                     |
| ST\*            |                       | store                    |
| PUSH\*          |                       | push to stack            |
| POP\*           |                       | pop from stack           |

\*Not yet implemented
