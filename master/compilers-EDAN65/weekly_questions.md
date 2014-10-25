Summary Questions
=================

## Compiler Phases ##

* Lexical analysis
* Syntactic analysis
* Semantic analysis

Attributed AST

* Intermediate code generation
* Optimization
* Target code generation


## Terminology ##
*   *Lexeme* is a string corresponding to a token
*   *Token* is a symbolic name
*   *Parse tree* a tree that spans all tokens
*   *AST* a tree with only the essential structure and tokens
*   *Formal language* all strings you can form from the language
*   *Ambiguous lexical definition* when regexps overlap, to prevent this:
    longest match and rule priority
*   *LL* left-to-right scan leftmost derivation  - builds top down
*   *LR* left-to-right scan rightmost derivation - builds bottom up
*   *LR-item* states in a DFA (i.e. that which is on the stack)
*   *LR-state* where you're reading right now in the parsing, represented by dot
*   *Shift-reduce* when you don't know if you should shift or reduce
    *   are resolved by using precedence rules
*   *Reduce-reduce* when you don't know which production you should use to
    reduce
*   LR vs LALR (look-ahead LR): LR produces large tables, thus LALR is used
    in practice
*   GLR - generalised LR, can parse any grammar, including ambiguous grammars
*   *Expression problem*: the goal is to define a datatype by cases, where one
    can add new cases to the datatype and new functions over the datatype,
    without recompiling existing code, and while retaining static type safety
    * In functional programming it is easy to extend functionality but not types
    * In OO-programming it is easy to add types but not extend functionality
*   Visitor pattern: each node to be visited has an accept method that accepts
    a visitor and a data object

    ```java
    public interface Visitor {
        public Object visit(ASTNode node, Object data);
    }

    public Object ASTNode.accept(Visitor visitor, Object data) {
        return visitor.visit(this, data);
    }

    ```

    the visitor class then performs some operation on each node. For instance a
    PrintVisitor might print the AST
*   *Qualified access* "typ a.b()" alltså metodanrop - Andree Ekroth
*   *Demand evaluation* lazy val, values are cached
*   *Intrinsic attriutes* internal attributes like ID - constructed when
    building the AST
*   Side-effects are not allowed in equations, since the equations are cached

## Left factoring ##

```
Exp         -> Name Params | Name
<=>

Exp         -> Name OptParams
OptParams   -> Params
OptParams   -> epsilong
```
