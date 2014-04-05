#!/usr/bin/env python

"""secant.py: 1.5 C4"""

__author__      = "Ragnar Mellbin"

import numpy as np
import matplotlib.pyplot as plt

def secant(polynom, x0, x1, root, verbose) -> []:
	a=(1+np.sqrt(5))/2
	linear = []
	superlinear = []
	if verbose:
		print("Errors:")
	while True:
		divisor = (np.polyval(polynom,x1)-np.polyval(polynom,x0))
		if(divisor == 0):
			break
		x2=x1-(np.polyval(polynom, x1)*(x1-x0))/(np.polyval(polynom,x1)-np.polyval(polynom,x0))
		ei=np.absolute(root-x0)
		eii=np.absolute(root-x1)	
		if verbose: 
			print(ei)
		linear.append(eii/ei);
		superlinear.append(eii/ei**a)
		x0=x1
		x1=x2
	
	linearquota=np.divide(np.diff(linear),linear[1:])
	superlinearquota=np.divide(np.diff(superlinear),superlinear[1:])
	if verbose:
		print(eii)
		print("Superlinear constants:")
		print(superlinear)
		print("Div")
		print(superlinearquota)
		print("Normated diff:")
		print(linear)
		print("Normated diff:")
		print(linearquota)
		if(np.linalg.norm(linearquota[-5:-2]) < np.linalg.norm(superlinearquota[-5:-2])):
			print("Linear convergence")
		else:
			print("Superlinear convergence")
	return [x2]


polynom = [54, 45, -102, -69, 35, 16, -4]

print("With numpy.roots:")
roots = np.roots(polynom)
print(roots)

print("With secant method:")
print(secant(polynom, -1.45, -1.2, roots[0], True))
print(secant(polynom, 1.13, 1.21, roots[1], True))
print(secant(polynom, -0.8, -0.5, roots[2], True))
print(secant(polynom, 0.4, 0.55, roots[4], True))
print(secant(polynom, 0.15, 0.25, roots[5], True))

x = np.linspace (-1.45, 1.2, 200)
y= np.polyval(polynom, x)
plt.figure()
plt.plot(x,y)
plt.grid()
plt.show()
