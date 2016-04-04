class Keyword(object):
    def __init__(self, name, opCode, numArgs):
        self.name = name
        self.opCode = opCode
        self.numArgs = numArgs

# mapping of keywords to op codes
KEYWORDS = {
    'NOP':   Keyword('NOP',   0b00000, 0), # no operation
    'MVRRC': Keyword('MVRRC', 0b00001, 1), # move register to RC
    'MVCRC': Keyword('MVCRC', 0b00010, 1), # move constant to RC
    'MVRCR': Keyword('MVRCR', 0b00011, 1), # move RC to register
    'MVRRA': Keyword('MVRRA', 0b00100, 1), # move register to RA
    # 'LD': 0b00101, (not implemented)
    # 'ST': 0b00110, (not implemented)
    'NOT':   Keyword('NOT',   0b00111, 1), # not
    'AND':   Keyword('AND',   0b01000, 1), # and
}
