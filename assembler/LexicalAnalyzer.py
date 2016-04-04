class LexicalAnalyzer(object):
    def __init__(self, args):
        self.args = args
        self._tokens = []

    def analyze(self):
        with open(self.args.file, 'r') as f:
            line = f.readline()
            while line != '':
                line = line.strip()
                if line != '':
                    self._tokens += self.parseLine(line)
                    self._tokens.append('\n')
                line = f.readline()

        return True

    def parseLine(self, line):
        return line.split()

    @property
    def tokens(self):
        return self._tokens
