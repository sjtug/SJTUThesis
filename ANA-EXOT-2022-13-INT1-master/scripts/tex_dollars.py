#! /usr/bin/env python
# Script to replace $...$ and $$...$$ with \(...\) and \[...\]
# Note that this only works if $...$ is on one line.

# Copyright (C) 2002-2021 CERN for the benefit of the ATLAS collaboration

# Changes:
# 2018-10-30 Ian Brock (ian.brock@cern.ch): First version of script.

from __future__ import print_function

import sys, os
import glob
import re
import argparse

def main(args):
    DEBUG = args.debug

    nosubstitutions = ['tikzpicture' , 'verbatim', 'nosubblock']

    # Process all tex and bib filles or just the one specified
    if args.all:
        files = glob.glob('*.tex') + glob.glob('*.bib')
    else:
        files = [args.file]

    # Loop over files to process
    inNosubs = False
    for file in files:
        try:
            fin = open(file)
        except:
            sys.exit('Could not open ' + file)
        fout = open(file + '-new', 'w')
        print('Substitutung $ in', file)

        for line in fin:
            text = line.rstrip()
            if DEBUG > 1: print(text)

            # check for BEGIN of an environment that doesn't want substitutions
            if not inNosubs:
                for nosubstitute in nosubstitutions:
                    if re.match(r'\s*\\begin{\s*' + nosubstitute + '\s*}', text):
                        if DEBUG > 0: print('Nosub started:', text)
                        inNosubs = True

            # check for %\begin{nosubblock}
            if not inNosubs:
                for nosubstitute in nosubstitutions:
                    if re.match(r'\s*%\s*\\begin{\s*' + nosubstitute  + '\s*}', text):
                        if DEBUG > 0: print('Commented nosub started:', text)
                        inNosubs = True

            # check for END of an environment that doesn't want substitutions
            if inNosubs:
                for nosubstitute in nosubstitutions:
                    if re.match(r'\s*\\end{\s*' + nosubstitute + '\s*}', text):
                        if DEBUG > 0: print('Nosub ended:', text)
                        inNosubs = False

            # check for %\end{nosubblock}
            if inNosubs:
                for nosubstitute in nosubstitutions:
                    if re.match(r'\s*%\s*\\end{\s*' + nosubstitute + '\s*}', text):
                        if DEBUG > 0: print('Commented nosub ended:', text)
                        inNosubs = False

            # substitute $$.*$$ with \[.*\]
            if not inNosubs:
                p = re.compile(r'\$\$(.+?)\$\$')
                m = p.search(text)
                if DEBUG > 1: print(p, p.search(text))
                if m:
                    if DEBUG > 0: print('$$...$$ found:', text)
                    text = re.sub(p, '\[\g<1>\]', text)
                    if DEBUG > 1: print(text)

            # substitute $.*$ with \(.*\) 
            # note: this should not match $$.*$$
            if not inNosubs:
                p = re.compile(r'\$(.+?)\$')
                m = p.search(text)
                if DEBUG > 1: print(p, p.search(text))
                if m:
                    if DEBUG > 0: print('$...$ found:', text)
                    text = re.sub(p, '\(\g<1>\)', text)
                    if DEBUG > 1: print(text)

            # Count how many $ are left in the line
            m = re.search(r'\$', text)
            if not inNosubs and m:
                print('There is a $ left:', text)
            if not args.dummy: fout.write(text + '\n')
        fin.close()
        fout.close()
        # Overwrite original file
        if not args.dummy and args.overwrite:
            os.rename(file, file + '.bak')
            os.rename(file + '-new', file)

    return 0

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('-n', '--dummy', help='dummy run', action='store_true')
    parser.add_argument('-a', '--all', help='process alll tex and bib files', action='store_true')
    parser.add_argument('-d', '--debug', help='debug level', type=int, default=0)
    parser.add_argument('-f', '--file', help='filename to process')
    parser.add_argument('-o', '--overwrite', help='overwrite old file (old one renamed to file.bak)', action='store_true')
    args = parser.parse_args()

    returnCode = main(args)
