-- EDAN40 tenta 16.12.2010

-- QUESTION 1
-- f x = 5 + 8/x
f = (5+) . (8/)

-- g x y = 3*y + x
g = flip ((+) . (3*))

-- QUESTION 2
-- [ f x | x <- [ y+4 | y <-ys, y<5]]

h  = map (f . (+4)) . (filter (<5))

-- QUESTION 3
-- data Digits = Zero | One | Two | Three | Four | Six | Seven | Eight | Nine
-- smallDigits = [Zero .. Three]

data Digits = Zero | One | Two | Three | Four | Six | Seven | Eight | Nine 
     deriving Enum

-- QUESTION 4
-- pure: meaning, consequences

-- pure: no side effects (= depends only on the arguments, always same result for the same args)
-- consequences: easy analysis, predictability, but: no interaction with the outside world, no state, only immutable data structures


-- QUESTION 5
-- do "merry"; return "christmas"

-- type is [[Char]]
-- value is ["christmas","christmas","christmas","christmas","christmas"]

-- A possible explanation:

-- do "merry"; return "christmas"
-- is equivalent to
-- "merry" >> return "christmas"
-- or to
-- "merry" >>= \_ -> return "christmas"
-- As the type of bind is
-- (>>=) :: m a -> (a -> m b) -> m b
-- and of return is
-- return :: a -> m a
-- and as the first argument of bind is "merry" then the monad in our case must be the List monad.
-- Therefore
-- return x = [x]
-- (>>=) xs f = concat (map f xs)
-- and thus for our values we get
-- concat (map (const ["christmas"]) "merry")

-- QUESTION 6
-- (.)(:)
-- (.)(:) :: (a -> b) -> a -> [b] -> [b]

-- (:(.))
-- type error

-- ((.):)
-- ((.):) :: [(b -> c) -> (a -> b) -> a -> c] -> [(b -> c) -> (a -> b) -> a -> c]

-- ((:):)
-- ((:):) :: [a -> [a] -> [a]] -> [a -> [a] -> [a]]