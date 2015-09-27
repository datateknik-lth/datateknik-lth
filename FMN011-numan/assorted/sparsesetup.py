#!/usr/bin/env python

"""sparsesetup.py: Port of the matlab program 2.1 'sparsesetup.m'"""

__author__      = "Ragnar Mellbin"

import numpy as np
import scipy.sparse as sparse

def sparsesetup(n) -> []:
    e = np.ones(n)
    n2= n/2
    a = sparse.spdiags([-e, 3*e, -e],np.r_[-1:2],n,n).toarray()
    c = sparse.spdiags([e/2],0,n,n).toarray()
    c = np.fliplr(c)
    a = a + c
    a[n2,n2-1] = -1
    a[n2-1,n2] = -1
    b = np.zeros(n)
    b[0]=2.5
    b[n-1]=2.5
    b[1:n-1]=1.5
    b[n2-1:n2+1]=1
    return[a,b]
