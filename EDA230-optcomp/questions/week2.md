1.  A set of nodes 
2.  Unecessary to insert in all nodes
3.  `DF_local(w)` are the successors which you don't dominate
    `DF_up(w)` idom(w) does not dominate one of the nodes in the DF
4.  Definition in start node
5.  A critical edge is an arc whose tail vertex has multiple successors and
    whose head vertex has multiple predecessor. When translating from SSA form
    we need a safe place to place copy statements. Phi functions are replaced
    by inserting copy statements in the predecessor vertices. Thus we cannot
    have critical edges. 
6.  Copy statements are replaced by moves
7.  Appel & George
8.  If they are live at the same time
9.  They get the same color
10. Instead of spilling a node directly it is pushed to the stack as if it
    had fewer than K (number of colors) neighbors. When it is popped, it is
    checked if the node has less than K colored neighbors.

Terminology
===========

## Insertion of PHI functions ##
PHI function for x is inserted in union of `DF(v)` where `v` is a vertex where
x is assigned.

Using the iterative approach, if we have assignments in node 0, 2 and 7 we would
take the union of their dominator frontiers (in this case) 3, 4, and 6 resulting
in:

```
DF1(A) = { 3, 4, 6 }
A = { 0, 2, 7 }
```

For each of these we will take the union of their respective DF. I.e.

```
DF2(A + DF1(A)) =  DF(0) + DF(2) + DF(7) + DF(DF1(A))
```
Then iterate untill the set is unchanged.
