--EDAN40 tenta 16.12.2013

-- QUESTION 1
-- write scanr, scanl and reverse
scanr :: (a -> b -> b) -> b -> [a] -> [b]

scanrR f z []      = [z]
scanrR f z (x:xs)  = (:) (f x (head prev)) prev
                         where prev = scanrR f z xs

scanrF f z l = foldr ff [z] l
               where ff x xs = (f x (head xs)):xs

scanl :: (a -> b -> a) -> a -> [b] -> [a]

scanlR f z []     = [z]
scanlR f z (x:xs) = z : scanlR f (f z x) xs

scanlF f z l = foldl ff [z] l
               where ff xs x = xs ++ (f (last xs) x):[]

reverse :: [a] -> [a]
reverse = foldl (flip (:)) []

-- QUESTION 2
-- subclass

-- A method of introducing typeclasses with inherited constraints
-- A subclass B of a class A must fullfill all the constraints posed on A, 
-- together with possibly some additional ones, specific to B 

-- notation:
class A b where
  f1 :: b -> Int
class A b => B b where
  f2 :: b -> b -> Bool

-- in such case all instances of B will have both f1 and f2 defined

-- QUESTION 3
-- Church numerals
-- 2 + 2 = 4

-- twoC `plusC` twoC = fourC
-- we have to remember about the extra parameter to Church numerals
-- === stands for "is equivalent to"

-- twoC `plusC` twoC f ===
-- plusC twoC twoC f ===
-- (twoC f).(twoC f) ===
-- (f.f).(twoC f) ===
-- f . (f . (twoC f)) ===
-- f . (succC twoC f) ===
-- f . (threeC f) ===
-- succC threeC f ===
-- fourC f


-- QUESTION 4

f :: (Monad m, Num b) => m b -> m b -> m b

-- f [1,2,3] [2,4,8] = [2,4,8,4,8,16,6,12,24]
-- f (Just 5) Nothing = Nothing
-- yes, fmap (+2) (Just 5) is correct (and equal Just 7 BTW)
-- return 5 :: (Monad m, Num a) => m a


-- QUESTION 5
-- seq, pseq, par, force

seq, pseq, par :: a -> b -> b
force :: xs -> xs

-- seq: suggests evaluation of its first arg (up to WHNF), returns the second
-- pseq: forces evaluation of the first arg first, then returns the second
-- par: like seq, but evaluation of the first arg may be done in parallel with returning the second
-- force: evaluates the spine of a list (up to WHNF)

-- parSort2
-- just enables parallel evaluation up to WHNF, no real effect (due to WHNF and laziness)

-- parSort3
-- slightly better attempt (let's force evaluation of lesser BEFORE the concatenation) but, 
-- likewise, no real effect (laziness, WHNF)

-- parSort4
-- by enforcing the complete list evaluation (on top level at least) allows parallelism to improve the efficiency



-- QUESTION 6

-- type classes

-- a:
-- m1 and m2 contain different number of music objects, 
-- thus line m1 and line m2 compose in parallel different number of music objects
-- (even though the side effect (= the music itself) is the same!)
-- line m1 = (Note (C,5) dur [] :+: Note (D,5) dur []) :+: (Note (E,5) dur [] :+: Rest (0 % 1))
-- line m2 = Note (C,5) dur [] :+: (Note (D,5) dur [] :+: (Note (E,5) dur [] :+: Rest (0 % 1)))
-- then
-- lineToList (line m1) contains 2 elements
-- lineToList (line m2) contains 3 elements

-- b:
-- a possible (incomplete, but sufficient for the task) solution
line2 [] = (Rest 0)
line2 ((Note x y z) : ms) = (Note x y z) :+: (line2 ms)
line2 ((m1 :+: m2) : ms) = line2 (m1 : (m2 : ms))

-- c:
-- a possible (incomplete, but sufficient for the task) solution
lineToList2 (Rest 0) = []
lineToList2 (Note x y z) = [(Note x y z)]
lineToList2 (Note x y z :+: ms) = (Note x y z): lineToList2 ms
lineToList2 (m :+: ms) = lineToList2 m ++ lineToList2 ms

-- Note: patterns may need to be modified to obey the current constraints of the language
