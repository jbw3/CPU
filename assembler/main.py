from Assembler import Assembler

def parseArgs():
    import argparse

    parser = argparse.ArgumentParser()
    parser.add_argument('file', help='the assembly file to parse')
    parser.add_argument('-o', dest='output_file', default='out.txt', help='the output file')

    args = parser.parse_args()

    return args

def main():
    args = parseArgs()

    assembler = Assembler(args)
    assembler.process()

if __name__ == '__main__':
    main()
