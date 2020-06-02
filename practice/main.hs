isEmpty :: [a] -> Bool
isEmpty [] = True
isEmpty _ = False

myMap :: (a -> b) -> [a] -> [b]
myMap f (a:as) = f a : myMap f as
myMap f [] = []

x = myMap (+1) [1, 2, 3]
y = myMap (+1)

myFoldl :: (a -> b -> a) -> a -> [b] -> a
myFoldl f y (x:xs) = myFoldl f (f y x) xs
myFoldl f y []     = y

myFoldr :: (b -> a -> a) -> a -> [b] -> a
myFoldr f y (x:xs) = f x (myFoldr f y xs)
myFoldr f y []     = y

data BinTree a = Nil
               | Node (BinTree a) a (BinTree a)

inOrder :: BinTree a -> [a]
inOrder (Node l mid r) = inOrder l ++ mid:inOrder r
inOrder Nil            = []

myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith f (x:xs) (y:ys) = f x y : myZipWith f xs ys
myZipWith f _ _           = []

fibs = 1 : 1 : myZipWith (+) fibs (tail fibs)
z = take 10 fibs

fac = 1 : myZipWith (*) fac (tail xs)
  where xs = [1 .. ]
z1 = take 10 fac

main = print $ z1 ++ z
