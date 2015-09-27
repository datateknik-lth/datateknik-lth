1.  Depth-first-search
2.  A vertex dominates another vertex if it is only reachable through it.
3.  a.  Successor  - arch between u and v, meaning v is a successor to u
        succ(u) the set of vertices found after u where there is an arc between
        u and v
4.  a.  ancestor in tree
    b.  can't be an ancestor to itself
    c.  descendant in tree
    d.  can't be a descendant to itself
5.  Monotonic, i.e. either it doesn't change or the set of dominators decreases,
    resulting in termination
6.  Immediate predecessor in DT
7.  Remove w, compare two dominators, remove the one which dominates the other,
    repeat untill one left
8.  Semidominator is 
