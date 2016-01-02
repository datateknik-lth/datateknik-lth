-- EDAN40 tenta 19.12.2011

-- QUESTION 1

-- :type map (const (++))
map (const (++)) :: [a] -> [[a1] -> [a1] -> [a1]]

-- :type const (map (++))
const (map (++)) :: b -> [[a]] -> [[a] -> [a]]

-- QUESTION 2

-- currying, uncurrying, why

-- taken from Prelude:

-- curry converts an uncurried function to a curried function;
-- uncurry converts a curried function to a function on pairs.

curry            :: ((a, b) -> c) -> a -> b -> c
curry f x y      =  f (x, y)

uncurry          :: (a -> b -> c) -> ((a, b) -> c)
uncurry f p      =  f (fst p) (snd p)

-- QUESTION 3

--type and value of

do [1, 2, 3, 4]; "curry"

-- type is [Char] (i.e. String)
-- value is "currycurrycurrycurry"

do [1, 2, 3, 4]; return "uncurry"

-- type is [[Char]] (i.e. [String])
-- value is ["uncurry", "uncurry", "uncurry", "uncurry"]

-- A possible explanation:

-- do [1, 2, 3, 4]; return "uncurry"
-- is equivalent to
-- [1, 2, 3, 4] >> return "uncurry"
-- or to
-- [1, 2, 3, 4] >>= \_ -> return "uncurry"
-- As the type of bind is
-- (>>=) :: m a -> (a -> m b) -> m b
-- and of return is
-- return :: a -> m a
-- and as the first argument of bind is [1, 2, 3, 4] then the monad in our case must be the List monad.
-- Therefore
-- return x = [x]
-- (>>=) xs f = concat (map f xs)
-- and thus for our values we get
-- concat (map (const ["uncurry"]) [1, 2, 3, 4])

-- QUESTION 4

-- What does the following function do?

c a = (a \\) . (a \\)
-- where
(\\) = foldl (flip delete)
-- and
delete x [] = []
delete x (y:ys)
  | x == y    = ys
  | otherwise = y:(delete x ys)

-- list intersection with list a (or: finding those elements of a list that belong to list a)

-- QUESTION 5

-- f x y = (5 + x) / y
f = (/) . (5+)

-- g x y = x y
g = ($)
--or 
g = id

-- QUESTION 6

-- define Tree type, keeping Integer values in all nodes
-- define predicate subTree t1 t2

-- a binary tree case. Can be done differently, of course

data Tree = Leaf Integer | Node Tree Integer Tree

subTree :: Tree -> Tree -> Bool
subTree (Leaf i) t = inTree i t
subTree (Node t1 i t2) (Leaf j) = False
subTree (Node t1 i t2) (Node t3 j t4) = 
   ((i == j) && (subTree t1 t3) && (subTree t2 t4)) ||
   subTree (Node t1 i t2) t3 ||
   subTree (Node t1 i t2) t4

inTree :: Integer -> Tree -> Bool
inTree i (Leaf j) = (i == j)
inTree i (Node t1 j t2) = (i == j) || inTree i t1 || inTree i t2