Proofs
======

Graph:

```
             [0]
              |
              v
             [1]
              |
              v
             [2]-. 
              |   \
              v    \
             [3]   [6]
              |     |
              v     v
             [4]   [7]
              |     /
              v    /
             [5]<-´
```

## dom(s) = { s } ##
Obvious

## All vertices 'w belonging to V' are dominated by s ##

Follows from dominance definition. If all paths from `s` to `w` contain `v`
then `v _>>_ w`

# Dominance is reflexive #
This follows directly from the definitions since any path (w0, w1, w2, ..., wk)
from s = w0 to w=wk includes w.
