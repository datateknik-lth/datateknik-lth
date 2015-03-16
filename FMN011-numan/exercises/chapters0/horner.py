#!/usr/bin/env python

"""horner.py: Horner's method 0.1 C2"""

__author__      = "Ragnar Mellbin"

from matbase import *

def horner(polynom, x) -> float:
	b=0
	for a in np.nditer(polynom[::-1]):
		b=a+b*x
	return b

polynom = np.ones(100)
polynom [1::2]=-1
x=1.00001

#for a in np.nditer(polynom):
#	print(a)

#Basic Horner
print("Basic Horner gives: ")
eval = horner(polynom,x)
print(eval)
print()

#Seperated Horner
negpolynom = np.copy(polynom)
polynom[1::2]=0
negpolynom[::2]=0

#for a in np.nditer(negpolynom):
#	print(a)
#for a in np.nditer(polynom):
#	print(a)

sum = horner(polynom,x)+horner(negpolynom,x)
print("Seperated Horner gives: ")
print(sum)
print()

print("Diff: ")
print(sum-eval)

