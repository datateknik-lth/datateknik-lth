This is a binary tree, implementing Functor type class.

> data BinTree a = EmptyNode | Node a (BinTree a) (BinTree a) deriving Show

What Functor does is let you use fmap on the tree structure. Good, we like
mapping.

> instance Functor BinTree where
>   fmap _ EmptyNode = EmptyNode
>   fmap f (Node a b c) = Node (f a) (fmap f b) (fmap f c)

Using the type is easy:

let tree = Node "root" (EmptyNode) (Node "child right" EmptyNode EmptyNode)

This creates a tree structure with a root node and a right child with no children.
Mapping is then done by:

fmap (++"!!!") tree

Which gives you a "shouting tree".
