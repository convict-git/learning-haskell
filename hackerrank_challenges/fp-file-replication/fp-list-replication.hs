-- https://www.hackerrank.com/challenges/fp-list-replication/problem

f :: Int -> [Int] -> [Int]

-- replicates each element in array n times
-- eg. input [1 2 3 4] with n = 2
-- output [1 1 2 2 3 3 4 4]
f n (x:xs) = helper n x ++ f n xs
    where
    helper :: Int -> Int -> [Int]
    helper n x | n == 0 = []
           | n > 0 = x : helper (n-1) x
f n [] = []

main :: IO ()
main = getContents >>=
       mapM_ print. (\(n:arr) -> f n arr). map read. words
