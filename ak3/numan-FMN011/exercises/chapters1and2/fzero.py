#!/usr/bin/env python

"""fzero.py: 1.5 C5"""

__author__      = "Ragnar Mellbin"

import numpy as np
import scipy.optimize as optimize

def func(x):
	return 1/x

print("Using the bisection method on 1/x with inpurt parameters [-2, 1] returns:")
print(optimize.bisect(func, -2, 1))
print("Which is kinda zero, i suppose.")
