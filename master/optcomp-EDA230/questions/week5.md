1.   
2.
3.  The instruction scheduler tries to rearrange the code so that many
    expressions are computed concurrently. By computing expressions
    concurrently, however, more registers are needed resulting in what's
    called *register pressure*.
4.  How - see book 233
    Why - avoid pipeline stalls
5.  `(sigma(v) + i) mod II`
6.  Loop's can use their own indices

Terminology
===========

## Matrix distance ##

Let's say we have the following:

```c
float a[N][M], b[N][M], c[N][M];

void foo()
{
    int     i, j;
    
    for (i = 2; i < 100; i++) {
        for (j = 2 + 3 * i; j < 1000; j++) {
            a[ i ][ j ] = [ i - 2 ][ j + 3 ];
            b[ i ][ j ] = [ i     ][ j - 2 ];
            c[ i ][ j ] = [ i + 1 ][ j + 2 ];
        }
    }
}
```

Finding the distance matrix of the loop above is done as follows.
We start of with calculating the distance vector for the `a` vector.

```
IA + a0 = JB + b0

where

A   = [1 0; 0 1]
a0  = [0 0]

B   = [1 0; 0 1]
b0  = [-2 3]
```

We then re-write `IA + a0 = JB + b0` to:

```
[I J][A; -B] = [i1 j1 i2 j2][A; -B] = b0 - a0
```

For the `a` vector this results in:

```
             [  1  0 ]
[i1 j1 i2 j2]|  0  1 | = [-2 3] - [0 0]
             | -1  0 | 
             [  0 -1 ]

```

Which in turn gives us:

```
(i1 - i2, j1 - j2) = (-2, 3)

if I = (t1, t2) =>

i1 - i2 = -2 => i2 = t1 + 2
j1 - j2 =  3 => j2 = t2 - 3

=>

J = (t1 + 2, t2 - 3)

=>

d_a = (2, -3)
```

In the case of the last vector's distance vector `d_c` we get a vector
that's negative when first examined. However we want a vector that's
lexicographically positive. As such we must check whether `I-J` or `J-I`
gives a positive distance vector. In this case `J - I` gives a positive
vector `d_c = (1, 2)`.

### TIP! ###
If both `(x, y)` are positive then the read occurs before the write.

Hyperplane Method
=================
The Hyperplane Method is a way to enable parallel execution of all loops
except the outermost. Given a perfect loop nest `L` and a distance matrix
`D`, the method finds a `m x m` unimodular matrix `U`, this matrix carries
all the dependencies in the outermost loop `L1`. All inner loops `L2..Lm`
can be executed in parallel, as long as all elements in the first column
are `>= 1`. 

Determine `U` by using the following system, where it is required that the
first column is (for all elements) `>= 1`.
`d1 x u >= 1` .... `dn x u >= 1`, where `u = (u1, u2... um)`, the first
column of `U`.

U can be determined by 
```
                                 | u1 1 0 0 |
U = [ u; [ I_(m-1); zeroes ] ] = | u2 0 1 0 |
                                 | u3 0 0 1 |
                                 | um 0 0 0 |
```
