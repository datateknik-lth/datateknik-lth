A (somewhat?) balanced and unordered Tree using three constructors.

> data Tree a = EmptyTree | Branch (Tree a) (Tree a) | Leaf a
>             deriving(Show, Eq)

Tree is a Functor.

> instance Functor Tree where
>   fmap _ EmptyTree = EmptyTree
>   fmap f (Leaf x) = Leaf (f x)
>   fmap f (Branch l r) = Branch (fmap f l) (fmap f r)

Insert a value in a Tree, keep the Tree balanced
by depth.

> insert :: Ord a => a -> Tree a -> Tree a
> insert x EmptyTree = Leaf x
> insert x r@(Leaf _) = Branch (Leaf x) r
> insert x (Branch l r)
>   | depth l < depth r = Branch (insert x l) r
>   | otherwise = Branch l (insert x r)

Calculate the maximum depth in a Tree.

> depth :: Tree a -> Int
> depth EmptyTree = 0
> depth (Leaf _) = 1
> depth (Branch l r) = 1 + (depth l `max` depth r)

The Tree is a beautiful understandable Monad.

> instance Monad Tree where
>   return x = Leaf x
>   
>   EmptyTree >>= _ = EmptyTree
>   Leaf x >>= f = f x
>   Branch l r >>= f = Branch (l >>= f) (r >>= f)

The Monad laws:

1. Left identity
return a >>= f = f a

*Main> return 1 >>= Leaf
Leaf 1

2. Right identity
m >>= return = m

*Main> Leaf 1 >>= return
Leaf 1

3. Associativity
(m >>= f) >>= g = m >>= (\x -> f x >>= g)

*Main> let m = Leaf 1
*Main> let f = \x -> Leaf (x+2)
*Main> (m >>= f) >>= g
Leaf 6
*Main> (m >>= f) >>= g
Leaf 6
