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
    'NOP':   Instruction('NOP',   0b00000, 0, Instruction.ARG_TYPE_NONE), # no operation
    'MVRX': Instruction('MVRX', 0b00001, 1, Instruction.ARG_TYPE_REG), # move register to R0
    'MVC': Instruction('MVC', 0b00010, 1, Instruction.ARG_TYPE_CONST), # move constant to R0
    'MVR0': Instruction('MVR0', 0b00011, 1, Instruction.ARG_TYPE_REG), # move R0 to register
    # 'MVRRA': Instruction('MVRRA', 0b00100, 1, Instruction.ARG_TYPE_REG), # move register to RA
    # 'LD': 0b00101, (not implemented)
    # 'ST': 0b00110, (not implemented)
    'NOT':   Instruction('NOT',   0b00111, 1, Instruction.ARG_TYPE_REG), # not
    'AND':   Instruction('AND',   0b01000, 1, Instruction.ARG_TYPE_REG), # and
    'OR':    Instruction('OR',    0b01001, 1, Instruction.ARG_TYPE_REG), # or
    'XOR':   Instruction('XOR',   0b01010, 1, Instruction.ARG_TYPE_REG), # xor
    'ADD':   Instruction('ADD',   0b01011, 1, Instruction.ARG_TYPE_REG), # add
    'SUB':   Instruction('SUB',   0b01100, 1, Instruction.ARG_TYPE_REG), # sub
}
