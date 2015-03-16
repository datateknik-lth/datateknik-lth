1.  Non-constant
2.  2
3.  We're interested in visting the arcs that are in the arc worklist.
4.  If a statements value changes from undef -> constant -> non constant
    its uses are added to the SSA worklist, these statements are then
    re-evaluated. Meaning that only the PHI functions need be evaluated when
    revisiting a vertex.
5.  When they have the same operator
6.  The `n log(n)` version uses a hashmap when entering a scope
7.  Whenever two different values reach a common point in the program
8.  A point q is down-safe with respect to a computation E, if E is fully
    anticipated at q.
9.  
10. 
11. `will_be_avail = can_be_avail && !later`
12. 

Terms
=====

## Partially anticipated ##
A computation *E* is partially anticipated at a point *p* if there is a path *P* from
*p* to a computation at a point *q* and *E* is preserved along *P*.
*Jonas's definition:* An expression is **anticipated** at a point *p* in the CFG if
it is certain that it will be evaluated with all operands having the same
value on all paths to *p*.

## Fully anticipated ##
A computation *E* is fully anticipated at a point *p* if it is partially anticipated
along every path from *p* to program exit.

## Down safe ##
A point *q* is down-safe with respect to a computation *E*, if *E* is **fully**
**anticipated** at *q*. Since *SSAPRE* is not allowed to to add computations which
wouldn't be there otherwise, the following code can't be optimized:
```
while (a < b) {
    i += x * y;
    a++;
}
```
Since the `while` loop might never run, this can be fixed by changing the
`while` into an `if` and `do-while`.

SSAPRE
======

1.  Insert Ф-functions. Ф is inserted at `DF+(R + A)`, where
    R is the set of vertices with real occurrences of E, and A is the set of
    vertices with assignments to an operand of E.
2.  Rename. All occurrences (real, Ф, and Ф-operand). Renaming uses the
    SSA-renaming algorithm. Ф-operands corresponding to another Ф-operand
    is set to **⊥**.
3.  Finalize1
    *   Downsafety: Ф is downsafe if there is a real occurrence of the
        computation after Ф but before the program exit or modification of
        the computation's value after the Ф function. SSAPRE may not add a
        computation which might not be used at all. I.e. in the following code,
        `x * y` might never be needed.
        ```
        while (a < b)  {
            i += x * y;
            a++;
        }
        ```
        This can be fixed by changing
        the `while` into an `if` and `do-while`.

    *   Availability: Find the Ф-functions where an expression safely can be
        made available, and then find the latest point to insert the expression
        (reduce live ranges). `can_be_available` is set to `false` if the
        Ф-function is not downsafe and has a **⊥** operand, this is
        propagated to every operand's definition. `later` is initially set to
        `can_be_available`, but if there exits an operand which is not
        **⊥** and has a real use, then it is set to false (and propagated
        to each operand).

    *   Modify: For each Ф-function which satisfy `will_be_available`
        (`can_be_avail && !later`), the expression is inserted at each incoming
        edge where the expression is not available.

4.  Finalize2: Set a `save` flag at each real occurrence that should save its
    computation.
