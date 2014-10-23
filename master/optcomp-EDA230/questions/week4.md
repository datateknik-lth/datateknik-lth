1.  Operator Strength Reduction
2.  A graph of connected variables
3.  See bellow
4.  A variable defined by a multiplication of an induction variable and a
    region constant is found. The multiplication is then replaced by an
    addition
5.  The purpose of linear functon test replacement is to replace the bound
    calculation of a loop thus eliminating the need for an index. OSR would
    in this case have replaced the dereferencing by a pointer incrementation
    as bellow:

    After OSR:
    ```c
    float *p = &a[0];
    for (i = 0; i < 100; i++) {
        s += *p;
        p++;
    }
    ```
    After linear function test replacement:
    ```c
    floar *p = &a[0];
    floar *u = &a[0];
    while (p < u) {
        s += *p;
        p++;
    }
    ```
    As noted above, this eliminates the need for an index.

6.  A vertex  is control dependent on vertex u if:
    1.  there exists a non-null path from u to v and v post dominates every
        vertex on the path after u
    2.  v does not strictly post dominate u
7.  After the CFG has been created a DFS from start vertex s is performed,
    all unvisited vertices are deleted. Then all statements which cannot
    effect program output is deleted. This is performed with a live analysis:

    * All statements which directly affect output are marked as prelive
    * Their operands mark additional statements as live and so forth
    * Reads are marked prelive, otherwise the input would get out of sync

    When a branch statement is marked live, the operands deciding the branch
    should also be marked live.

    The Simplify function takes the analysed code and removes vertices which
    aren't live. As such, it needs to update the edges to and from the live 
    vertices surrounding the dead vertex.
    The procedure also needs to handle the updating of PHI functions.
    When a vertex is bypassed the function also recreates the dominator tree.


Terminology
===========

## Region ##
Is a strongly conneced component in the control flow graph G

## Region constant ##
Is either a compile-time constant, or a variable whose definition strictly
dominates every vertex in the region

## Induction variable ##
A variable is an induction variable with respect to a region if within the
region it is only incremented or decremented by a region constant

## Strongly connected component ##
A set of vertices S, such that for every `u,v belonging to S` there is a path
between `u` and `v`.

## Tarjan's Algorithm ##
Do a DFS of the CFG and push each discovered node to a stack S, when an already
visited node is encountered this node becomes the lowlink of all the nodes on
the stack S. This is then considered a SCC.

If there are more nodes after this, repeat the above. The result is then a
separate SCC.
