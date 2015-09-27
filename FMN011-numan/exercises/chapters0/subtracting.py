#!/usr/bin/env python

"""subtracting.py: Subtracting numbers 0.4 C1"""

__author__      = "Ragnar Mellbin"

from matbase import *

def evaluate(f,x) -> []:
    awnsers = []
    for xi in np.nditer(x):
        awnsers.append(f(xi))
    return awnsers

def a1(x) -> float:
    return (1-(1/np.cos(x)))/((np.tan(x)**2))

def a2(x) -> float:
    return (-1)/((1/np.cos(x))+1)

def b1(x) -> float:
    return (1-(1-x)**3)/x

def b2(x) -> float:
    return x**2-3*x+3

x = np.logspace(-1,-14,14)

#A
a1result = evaluate(a1,x)
print("A1 gives: ")
for xi in a1result:
    print(xi)

a2result = evaluate(a2,x)
print("A2 gives: ")
for xi in a2result:
    print(xi)

print("Diff: ")
for i, xi in enumerate(x):
    print(a2result[i]-a1result[i])

#B

b1result = evaluate(b1,x)
print("B1 gives: ")
for xi in b1result:
    print(xi)

b2result = evaluate(b2,x)
print("B2 gives: ")
for xi in b2result:
    print(xi)

print("Diff: ")
for i, xi in enumerate(x):
    print(b2result[i]-b1result[i])

 
