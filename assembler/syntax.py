MIN_CONST = 0
MAX_CONST = 7

class Keyword(object):
    ARG_TYPE_NONE  = 0
    ARG_TYPE_REG   = 1
    ARG_TYPE_CONST = 2

    def __init__(self, name, opCode, numArgs, argType):
        self.name = name
        self.opCode = opCode
        self.numArgs = numArgs
        self.argType = argType

# mapping of keywords to op codes
KEYWORDS = {
    'NOP':   Keyword('NOP',   0b00000, 0, Keyword.ARG_TYPE_NONE), # no operation
    'MVRRC': Keyword('MVRRC', 0b00001, 1, Keyword.ARG_TYPE_REG), # move register to RC
    'MVCRC': Keyword('MVCRC', 0b00010, 1, Keyword.ARG_TYPE_CONST), # move constant to RC
    'MVRCR': Keyword('MVRCR', 0b00011, 1, Keyword.ARG_TYPE_REG), # move RC to register
    'MVRRA': Keyword('MVRRA', 0b00100, 1, Keyword.ARG_TYPE_REG), # move register to RA
    # 'LD': 0b00101, (not implemented)
    # 'ST': 0b00110, (not implemented)
    'NOT':   Keyword('NOT',   0b00111, 1, Keyword.ARG_TYPE_REG), # not
    'AND':   Keyword('AND',   0b01000, 1, Keyword.ARG_TYPE_REG), # and
}
