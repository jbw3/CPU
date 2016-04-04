import syntax

class CodeGenerator(object):
    def __init__(self, args):
        self.args = args

    def generate(self, expressions):
        with open(self.args.output_file, 'w') as f:
            for exp in expressions:
                # look up keyword
                kw = syntax.KEYWORDS[exp[0]]
                symbolBin = kw.opCode << 3
                symbolStr = '{:02X}'.format(symbolBin)

                f.write(symbolStr)
                f.write('\n')
