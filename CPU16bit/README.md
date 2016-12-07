# 16-bit CPU


## Registers

* 16 Registers (R0 - R15)
* R0 is status register
* R1 is stack pointer


## Instruction Types

* Register-Register (RR)
* Register-Immediate (RI)
* Register-Register-Immediate (RRI)
* Jump (J)

## Instructions

| Instruction     | Operation             | Type | Description              |
|-----------------|-----------------------|------|--------------------------|
| NOP\*           |                       | RR   | no operation             |
| MOV Ra, Rb\*    | Ra <- Rb              | RR   | move Rb to Ra            |
| NOT Ra, Rb\*    | Ra <- ~Rb             | RR   | not                      |
| AND Ra, Rb\*    | Ra <- Ra & Rb         | RR   | and                      |
| OR Ra, Rb\*     | Ra <- Ra \| Rb        | RR   | or                       |
| XOR Ra, Rb\*    | Ra <- Ra ^ Rb         | RR   | xor                      |
| SHLL Ra, Rb\*   | Ra <- Ra << Rb        | RR   | shift left logical       |
| SHRL Ra, Rb\*   | Ra <- Ra >> Rb        | RR   | shift right logical      |
| SHRA Ra, Rb\*   | Ra <- Ra >> Rb        | RR   | shift right arithmetic   |
| ADD Ra, Rb\*    | Ra <- Ra + Rb         | RR   | add                      |
| ADDC Ra, Rb\*   | Ra <- Ra + Rb + C     | RR   | add with carry           |
| ADDI Ra, X\*    | Ra <- Ra + X          | RR   | add immediate            |
| SUB Ra, Rb\*    | Ra <- Ra - Rb         | RR   | subtract                 |
| SUBB Ra, Rb\*   | Ra <- Ra - Rb - B     | RR   | subtract with borrow     |
| SUBI Ra, X\*    | Ra <- Ra - X          | RR   | subtract immediate       |
| MUL Ra, Rb\*    | Ra <- Ra * Rb         | RR   | multiply                 |
| LD\*            |                       | RRI  | load                     |
| ST\*            |                       | RRI  | store                    |
| PUSH\*          |                       | RI   | push to stack            |
| POP\*           |                       | RI   | pop from stack           |
| JMP X\*         | PC <- X               | J    | jump to absolute address |

\*Not yet implemented
