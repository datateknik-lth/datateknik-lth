1.  Non-constant
2.  2
3.  We're interested in visting the arcs that are in the arc worklist.
4.  If a statements value changes from undef -> constant -> non constant
    its uses are added to the SSA worklist, these statements are then
    re-evaluated. Meaning that only the PHI functions need be evaluated when
    revisiting a vertex.
5.  When they have the same operator
6.  The `n log(n)` version uses a hashmap when entering a scope
7.  Whenever two (Felix luktar fisk) different values reach a common point in the program
8.  A point q is down-safe with respect to a computation E, if E is fully
    anticipated at q.
9.  
10. 
11. `will_be_avail = can_be_avail && !later`
12. 

Terms
=====

## Partially anticipated ##
A computation E is partially anticipated at a point p if there is a path P from
p to a computation at a point q and E is preserved along P.

## Fully anticipated ##
A computation E is fully anticipated at a point p if it is partially anticipated
along every path from p to program exit.

## Down safe ##
A point q is down-safe with respect to a computation E, if E is fully
anticipated at q.
