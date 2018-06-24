#!/usr/bin/env python3.6
import argparse


def DNA(input, output):
    """
    Solves the first rosalind problem (add more details...)

    :param input: Path to input file
    :param output: Path to output file
    :return:
    """
    pass


def main():
    """
    Runs the main routine of pipeline...
    """
    parser = argparse.ArgumentParser(description='Solve all of the rosalind problems...')
    # Positional argument
    parser.add_argument('problem',
                        help='Rosalind problem ID')
    parser.add_argument('-i', '--input',
                        help='Path to input file',
                        required=True)
    parser.add_argument('-o', '--output',
                        help='Path to output file',
                        default="output.txt")
    parser.add_argument('--debug',
                        help='prints args',
                        action='store_true')
    args = parser.parse_args()

    if args.debug:
        print(args)

    if args.problem == 'DNA':
        DNA(args.input, args.output)


if __name__ == '__main__':
    main()


