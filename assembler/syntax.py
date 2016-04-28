# Instruction set definition for 8-bit CPU

MIN_CONST = 0
MAX_CONST = 7

class Instruction(object):
    ARG_TYPE_NONE  = 0
    ARG_TYPE_REG   = 1
    ARG_TYPE_CONST = 2

    def __init__(self, name, opCode, numArgs, argType):
        self.name = name
        self.opCode = opCode
        self.numArgs = numArgs
        self.argType = argType

# mapping of instructions to op codes
INSTRUCTIONS = {
    'NOP':   Instruction('NOP',  0b00000, 0, Instruction.ARG_TYPE_NONE), # no operation
    'MOV':   Instruction('MOV',  0b00001, 1, Instruction.ARG_TYPE_REG), # move register to R0
    'MOVI':  Instruction('MOVI', 0b00010, 1, Instruction.ARG_TYPE_CONST), # move constant to R0
    'MVR0':  Instruction('MVR0', 0b00011, 1, Instruction.ARG_TYPE_REG), # move R0 to register
    'NOT':   Instruction('NOT',  0b00100, 1, Instruction.ARG_TYPE_REG), # not
    'AND':   Instruction('AND',  0b00101, 1, Instruction.ARG_TYPE_REG), # and
    'OR':    Instruction('OR',   0b00110, 1, Instruction.ARG_TYPE_REG), # or
    'XOR':   Instruction('XOR',  0b00111, 1, Instruction.ARG_TYPE_REG), # xor
    'ADD':   Instruction('ADD',  0b01000, 1, Instruction.ARG_TYPE_REG), # add
    'SUB':   Instruction('SUB',  0b01001, 1, Instruction.ARG_TYPE_REG), # sub
    'SHLL':  Instruction('SHLL', 0b01010, 1, Instruction.ARG_TYPE_REG), # shift left logical
    'SHRL':  Instruction('SHRL', 0b01011, 1, Instruction.ARG_TYPE_REG), # shift right logical
    'SHRA':  Instruction('SHRA', 0b01100, 1, Instruction.ARG_TYPE_REG), # shift right arithmetic
    'JMP':   Instruction('JMP',  0b01101, 1, Instruction.ARG_TYPE_REG), # jump
    'BEZ':   Instruction('BEZ',  0b01110, 1, Instruction.ARG_TYPE_REG), # branch equal zero
    'BNEZ':  Instruction('BNEZ', 0b01111, 1, Instruction.ARG_TYPE_REG), # branch not equal zero
    'BGTZ':  Instruction('BGTZ', 0b10000, 1, Instruction.ARG_TYPE_REG), # branch greater than zero
    'BLTZ':  Instruction('BLTZ', 0b10001, 1, Instruction.ARG_TYPE_REG), # branch less than zero
}
