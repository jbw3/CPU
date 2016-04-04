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
                keyword = expression[0]

                # check if the first token in the expression is a valid keyword
                if keyword not in syntax.KEYWORDS.keys():
                    print('ERROR: "{}" is not a valid keyword'.format(expression[0]))
                    return False

                # check if the keyword has the right number of arguments
                numArgs = len(expression) - 1
                expectedArgs = syntax.KEYWORDS[keyword].numArgs
                if numArgs != expectedArgs:
                    print('ERROR: "{}" expects {} argument{}, got {}'.format(keyword,
                                                                             expectedArgs,
                                                                             '' if expectedArgs == 1 else 's',
                                                                             numArgs))
                    return False

                # check the argument
                if numArgs == 1:
                    arg = expression[1]
                    if re.search('^R[0-7]$', arg) is None:
                        print('ERROR: invalid register "{}"'.format(arg))
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
