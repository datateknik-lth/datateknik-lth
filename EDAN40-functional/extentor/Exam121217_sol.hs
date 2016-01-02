--EDAN40 tenta 17.12.2012

-- QUESTION 1
-- point-free form

-- f x y = 3 + y / x
h = flip (/)
g = (3.0+) -- to take care of fractional results of h
-- we would like something like f = g . h
-- but we need to take care of both args to (/), so
f = curry (g . (uncurry h))
-- or, without help functions
f1 = curry ((3.0+) . (uncurry (flip (/))))
-- or, eg.
f2 = curry $ (3.0+) . (uncurry  $ flip (/))
-- to skip some brackets

-- g x y = [y z | z <- [1..x]]
h1 = flip take $ iterate (+1) 1
h2 = flip map 
g = h2 . h1
-- or, without help functions
g1 = flip map . (flip take $ iterate (+1) 1)


-- QUESTION 2
-- types

(.)(:) :: (a -> b) -> a -> [b] -> [b]
-- (:(.)) type error
((.):) :: [(b -> c) -> (a -> b) -> a -> c] -> [(b -> c) -> (a -> b) -> a -> c]
((:):) :: [a -> [a] -> [a]] -> [a -> [a] -> [a]]
(.)(.) :: (a -> b -> c) -> a -> (a1 -> b) -> a1 -> c

-- QUESTION 3
-- spark, seq, pseq, par (Lecture 10, Parallelism)

-- Spark: a potential to create a thread
seq, pseq, par :: a -> b -> b
-- seq: suggests evaluation of its first arg (up to WHNF), returns the second
-- pseq: forces evaluation of the first arg first, then returns the second
-- par: like seq, but evaluation of the first arg may be done in parallel with returning the second

-- QUESTION 4
-- fmap, do, bind
fmap :: Functor f => (a -> b) -> f a -> f b
-- m is a monadic object (a list, a Maybe, ...)

fmap f m = do x <- m 
              return (f x)
-- translate into bind
fmap f m = m >>= \x -> return (f x)
-- or
fmap f m = m >>= (return . f)

-- QUESTION 5
-- equivalence of two list comprehensions

-- result-wise YES
-- computation-wise NOT NECESSARILY, but possibly

-- QUESTION 6
-- define Tree type, keeping String values in all nodes
-- define predicate subTree t1 t2

-- a binary tree case. Can be done differently, of course

data Tree = Leaf String | Node Tree String Tree

subTree :: Tree -> Tree -> Bool
subTree (Leaf s) t = inTree s t
subTree (Node t1 s1 t2) (Leaf s2) = False
subTree (Node t1 s1 t2) (Node t3 s2 t4) = 
   ((s1 == s2) && (subTree t1 t3) && (subTree t2 t4)) ||
   subTree (Node t1 s1 t2) t3 ||
   subTree (Node t1 s1 t2) t4

inTree :: String -> Tree -> Bool
inTree s1 (Leaf s2) = (s1 == s2)
inTree s1 (Node t1 s2 t2) = (s1 == s2) || inTree s1 t1 || inTree s1 t2
