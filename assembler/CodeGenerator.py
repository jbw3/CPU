import syntax

class CodeGenerator(object):
    def __init__(self, args):
        self.args = args

    def generate(self, expressions):
        with open(self.args.output_file, 'w') as f:
            symbolCount = 0

            for exp in expressions:
                # look up keyword
                kw = syntax.KEYWORDS[exp[0]]

                symbolBin = kw.opCode << 3
                if kw.numArgs == 1:
                    # get the register number
                    reg = exp[1]
                    regNum = int(reg[1])
                    symbolBin |= regNum

                # convert symbol from binary to string
                symbolStr = '{:02X}'.format(symbolBin)

                f.write(symbolStr)
                f.write('\n')

                symbolCount += 1

            # fill the rest of the file with NOPs
            while symbolCount < 256:
                f.write('00\n')
                symbolCount += 1
