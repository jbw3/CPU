from __future__ import print_function
import re
import syntax

class SyntaxAnalyzer(object):
    def __init__(self, args):
        self.args = args
        self._expressions = []

    def analyze(self, tokens):
        expression = []
        for token in tokens:
            # a newline token denotes the end of an assembly expression
            if token == '\n':
                insName = expression[0]

                # check if the first token in the expression is a valid instruction
                if insName not in syntax.INSTRUCTIONS.keys():
                    print('ERROR: "{}" is not a valid instruction'.format(expression[0]))
                    return False

                ins = syntax.INSTRUCTIONS[insName]

                # check if the instruction has the right number of arguments
                numArgs = len(expression) - 1
                expectedArgs = ins.numArgs
                if numArgs != expectedArgs:
                    print('ERROR: "{}" expects {} argument{}, got {}'.format(insName,
                                                                             expectedArgs,
                                                                             '' if expectedArgs == 1 else 's',
                                                                             numArgs))
                    return False

                # check the argument
                if numArgs == 1:
                    arg = expression[1]
                    if ins.argType == syntax.Instruction.ARG_TYPE_REG and re.search('^R[0-7]$', arg) is None:
                        print('ERROR: invalid register "{}"'.format(arg))
                        return False
                    elif ins.argType == syntax.Instruction.ARG_TYPE_CONST:
                        try:
                            c = int(arg)
                        except ValueError:
                            print('ERROR: constant value "{}" is not a number'.format(arg))
                            return False
                        else:
                            if c < syntax.MIN_CONST or c > syntax.MAX_CONST:
                                print('ERROR: constant value "{}" is outside the valid range ({} - {})'.format(arg,
                                                                                                               syntax.MIN_CONST,
                                                                                                               syntax.MAX_CONST))
                                return False

                self._expressions.append(expression)
                expression = []
            else:
                # add uppercase token to expression
                expression.append(token.upper())

        return True

    @property
    def expressions(self):
        return self._expressions
