import syntax

class CodeGenerator(object):
    def __init__(self, args):
        self.args = args

    def generate(self, expressions):
        with open(self.args.output_file, 'w') as f:
            symbolCount = 0

            for exp in expressions:
                # look up instruction
                ins = syntax.INSTRUCTIONS[exp[0]]

                symbolBin = ins.opCode << 3
                if ins.numArgs == 1:
                    argNum = self.processArg(ins, exp[1])
                    symbolBin |= argNum

                # convert symbol from binary to string
                symbolStr = '{:02X}'.format(symbolBin)

                f.write(symbolStr)
                f.write('\n')

                symbolCount += 1

            # fill the rest of the file with NOPs
            while symbolCount < 256:
                f.write('00\n')
                symbolCount += 1

    def processArg(self, ins, arg):
        if ins.argType == syntax.Instruction.ARG_TYPE_REG:
            # get the register number
            reg = arg
            regNum = int(reg[1])
            return regNum

        elif ins.argType == syntax.Instruction.ARG_TYPE_CONST:
            return int(arg)

        # we should never get here
        raise 'Internal error in CodeGenerator.processArg()! Unknown arg type'
