-- filter function, takes input n and array
-- returns array with elements less than n
f :: Int -> [Int] -> [Int]
f n (x:xs) | x < n = x:f n xs
           | x >= n = f n xs
f n [] = []

foo :: IO Int
foo = do return 10
         return 42

main = do
    n <- foo
    print n
