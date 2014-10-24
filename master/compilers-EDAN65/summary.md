Summary
=======

## Ambiguos grammars ##

Introduce new non-terminals to mitigate the ambiguity.

Ambiguous:
```
Expr    -> Expr "+" Expr
Expr    -> Expr "*" Expr
Expr    -> INT
Expr    -> "(" Expr ")"
```
To make unambiguous, introduce new non terminals for each ambiguity. I.e. one
for a member of the addition and one for the multiplication. The above in an
unambiguous way becomes:

```
Expr    -> Term   ("+" Term)*
Term    -> Factor ("*" Factor)*
Factor  -> INT | "(" Expr ")"
```
One thing to remember is that the factor now has the highest precedence, then
the term, then the expression.

## Computing nullable, FIRST, FOLLOW ##

* A non-terminal is *nullable* if it contains the epsilon production.
* *FIRST* is a set of the first terminals in the productions for the
  non-terminal.
* *FOLLOW* is the set of terminals that can follow the non-terminal production.


## Constructing an LL(1) table ##
To construct the table, look at each production and compute the token set *FIRST*
then add the production `p_i` under the terminals.

If the non-terminal is nullable, then compute the *FOLLOW* set and add the
productions under those terminals.

Example:

```
p1: S -> T $
p2: T -> ID
p3: T -> "(" L ")"
p4: L ->  T R
p5: R -> "," L
p6: R -> epsilon
 _______________________________________________________
| Nonterminal | Nullable | FIRST        | FOLLOW        |
 -------------------------------------------------------
|     S       |  false   | { ID, "(" }  |               |
|     T       |  false   | { ID, "(" }  | { $, "," }    |
|     L       |  false   | { ID, "(" }  | { ")" }       |
|     R       |  true    | { "," }      | { ")" }       |
 -------------------------------------------------------
 ______________________________
|   | ID | "(" | ")" | "," | $ |
 ------------------------------
| S | p1 | p1  |     |     |   |
| T | p2 | p3  |     |     |   |
| L | p4 | p4  |     |     |   |
| R |    |     | p6  | p5  |   |
 ------------------------------
```

## Removing common prefixes ##

In the following example the Element productions share an indirect common prefix

```
Graph       -> ElementList
ElementList -> Element ElementList
ElementList -> epsilon
Element     -> Node
Element     -> Edge
Node        -> ID
Edge        -> ID "(" ID "->" ID ")"
```

To eliminate the common prefix we have to get rid of Node and Edge's sharing of
ID as the first terminal. This is done like so:

```
Graph       -> ElementList
ElementList -> Element ElementList
ElementList -> epsilon
Element     -> ID ElementRest
ElementRest -> "(" ID "->" ID ")"
ElementRest -> epsilon
```

The conflicting productions are merged.

## Collection attributes ##

```
coll T A.c() [new T()] with m;
```

*   Where T is the type
*   A.c() is the location attribute
*   [new T()] is a fresh object of type T
*   m is the collection method which should be a one argument method in T

### Contribution attributes ###

```
B contributes T to A.c() for A-ref
```

*   Where B is the contributing node
*   T is the value contributed to the collection method
*   A.c() is the collection attribute
*   A-ref is a reference to A. This can be propagated down via an inherited
    method
