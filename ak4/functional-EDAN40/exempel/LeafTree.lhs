A simplistic Tree using three constructors.

> data Tree a = EmptyTree | Branch (Tree a) (Tree a) | Leaf a
>             deriving(Show, Eq)

Tree is a Functor.

> instance Functor Tree where
>   fmap _ EmptyTree = EmptyTree
>   fmap f (Leaf x) = Leaf (f x)
>   fmap f (Branch l r) = Branch (fmap f l) (fmap f r)



