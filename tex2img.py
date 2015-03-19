#!/bin/env python3

# Originally by James Gregson
# http://jamesgregson.blogspot.se/2013/06/latex-formulas-as-images-using-python.html

import os, requests
import argparse

def formula_as_file(formula, file, negate=False):
    tfile = file
    if negate:
        tfile = 'tmp_cog.png'
    r = requests.get( 'http://latex.codecogs.com/png.latex?\dpi{300} \huge %s' % formula )
    f = open( tfile, 'wb' )
    f.write( r.content )
    f.close()
    if negate:
        os.system( 'convert tmp.png -channel RGB -negate -colorspace rgb %s' %file )
        os.remove('tmp_cog.png')

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("code", help="The LaTeX math code you would like converted to an image")
    parser.add_argument("out", help="The output image (png)")
    args = parser.parse_args()
    formula_as_file(args.code, args.out)
