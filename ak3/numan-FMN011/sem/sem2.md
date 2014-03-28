# Solutions to Seminar 2
1.  a)  false, ``Ax = b --> x = A^-1 * b``
    b)  true, ``col(s) = rows(S^-1)``
    c)  true, because: eigenvalue is zero, singular || by gauss one col can be zeroed out
    d)  true, because of how matrix multiplication works
    e)  true, ``rows indep => A singular => col indep``
    f)  false, PA permutes rows, AP permutes cols
    g)  true, ``||x||_1 is sum, ||x||_inf`` is only the largest
    h)  false, matrix = {{0,0},{1,0}} has determinant zero, but norm 1
    i)  false, ``S=S^T, V=V^T -> (SV)^T = V^T * S^T = V*S``
    j)  true, ``||A|| * ||A^-1||``
    k)  false, one solution, infinite or none are the only possibilities
    l)  false, but true if you allow their row permutations
    m)  ``PA=LU`` L and U are both non invertible or both invertivle
2.  a)  nothing, ordering of the rows is the ordering of the equations, if
        permuted the order of solutions changes as well
    b)  not a big deal, if the columns change the order of the solution changes
    c)  ``Ax = b => MAx = Mb``, x remains the same. If multiplied by a singular
        the amount of solutions is infinite, but one of them is the original
3.  a)  4
    b)  6 (largest abs of elem in first col)
    c)  if scaled partial 5 (largest for its row)
4.  ``A^-1 * B = X => B = AX``
5.  b, the first one is multiplying xx^T == matrix then multiplying matrices.
    The second one is multiplying a vector by a vector.
6.  Its transpose
7.  ``PU=LU => A^T * P^T = U^T * L^T => A^T * P^T * P = U^T * L^T * P => A^T*x = U^T*L^T*Px = b``
    Meaning, if you have the LU for A, you can use it for its transpose
8.  a)  ``k(D) = max|lambda_i|/min|lambda_i| = 10^10 / 10^-10 = 10^20``, Ill cond
    b)  ``k(D)=1`` the best!
    c)  ``k(D)=1`` the best!
    d)  ``k(A) = ||A|| * ||A^-1|| = 6*1.5*10^7 ~= 10^8``, because inf norm:
        ``6/4*10^7 = 1.5*10^7``, might loose 8 digits of accuracy
9.  no, ``res = A*x_hat - b`` if the matrix is well conditioned and the residual
    is small, the solution is accurate
10. for several runs, b
11. first and second are solvable, but last one can not be made strictly
    diagonally dominant. This means that the last one is possibly not
    solvable with GS
12. Solve with ``r_k``... don't get
