from LexicalAnalyzer import LexicalAnalyzer
from SyntaxAnalyzer import SyntaxAnalyzer
from CodeGenerator import CodeGenerator

class Assembler(object):
    def __init__(self, args):
        self.args = args

    def process(self):
        ''' Process the assembly code '''

        lexicalAnalyzer = LexicalAnalyzer(self.args)
        syntaxAnalyzer = SyntaxAnalyzer(self.args)
        codeGenerator = CodeGenerator(self.args)

        # lexical analysis
        ok = lexicalAnalyzer.analyze()
        if not ok:
            return False

        # syntax analysis
        ok = syntaxAnalyzer.analyze(lexicalAnalyzer.tokens)
        if not ok:
            return False

        # code generation
        ok = codeGenerator.generate(syntaxAnalyzer.expressions)
        if not ok:
            return False

        return True
