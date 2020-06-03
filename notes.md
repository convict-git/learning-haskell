# Functional Programming Notes

### Haskell Intro
- *Types* and *constructors* should start with CAPITAL letters.
- Haskell is indendation sensitive
- *Function application* is left associative, so take care while dealing with
    curry form
    `f1 f2 ... fn = (... (((f1 f2) f3) f4) ... )fn)`
    while *arrow application* is right associative, i.e. `t1 -> t2 -> t3 -> ...
    -> tn = t1 -> (t2 -> (t3 -> (...)))`

- Two ways to do define:

    1)
    ```haskell
    -- null : [a] -> Bool -- a function that returns true for empty list
    null [] = True
    null _  = False
    ```
    2)
    ```haskell
    null [] = True
            | False
    ```

- Binary tree of polymorphic type, comparision b/w *Haskell* and *SML*
   ```haskell
   -- Binary tree in Haskell in uncurry version of Node
   data Tree a  = Nil
                | Node (Tree a, a, Tree a)

   -- Nil :: Tree a
   -- Node :: (Tree a * a * Tree a) -> Tree a

   -- Binary tree in Haskell in *curry* version of Node
   data Tree a = Nil
               | Node (Tree a) a (Tree a)

   -- Nil :: Tree a
   -- Node :: Tree a -> a -> Tree a -> Tree a -- partial application is allowed now
   ```
   and
   ```sml
   (* Binary tree in sml *)
   datatype 'a tree = nil
                    |  node of ('a tree * 'a * 'a tree)

   nil : 'a tree
   node : ('a tree * 'a tree * 'a tree) -> 'a tree
   ```
- Map function
    ```haskell
    -- map :: (a -> b) -> [a] -> [b]
    map f (x:xs) = f x : map f xs
        f _      = []
    ```

- Fold function
    foldl : fold from left  `((..(f (f (f x0 x1) x2) x3) ...)`
    ```haskell
    -- foldl :: (b -> a -> b) -> b -> [a] -> b
    foldl f b0 (x:xs) = foldl f (f b0 x) xs
          f b0 _      = b0
    ```

    foldr : fold from right `(....(f xn-2 (f xn-1 (f xn x0)))...)`
    ```haskell
    -- foldr :: (a -> b -> b) -> b -> [a] -> b
    foldr f b0 (x:xs) = f x (foldr f b0 xs)
          f b0 _      = b0
    ```

-  ZipWith : zip two lists using a function
    ```haskell
    -- zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
    zipWith f (x:xs) (y:ys) = f x y : zipWith f xs ys
    ZipWith f _ _           = []
    ```

    take : gives first n elements from the list
    ```haskell
    -- take :: Int -> [a] -> [a]
    take n xs | n <= 0     = []          -- use of guards
              | otherwise  = case xs of
                             (u : us) -> u : take (n-1) us
                             _        -> []
    ```

    tail : gives the list but first element
    ```haskell
    -- tail :: [a] -> [a]
    tail (x:xs) = xs
    tail _      = []
    ```

## Lazy evaluation
-  Haskell follows *lazy evaluation* as oppossed to *eager evalution* in SML.
    Though eager evaluations can be imposed explicitly.
    In eager evaluation, arguments are evaluated first and then functions are
    applied while in lazy evaluation, arguments are evaluated lazily i.e. only
    when there's no option other than evaluating them to get the desired result.

    let `e = f e1 e2 e3 ... en`
    **Eager evaluation**: first evaluate `e1, e2,...,en` to get `v1, v2,...,vn`
    then compute `f v1 v2 v3 ... vn`
    **Lazy evaluation**:

    eg. In haskell, `[1 ... ]` is inf loop but `take 10 [1 ... ]` isn't

    ```haskell
    -- fibs :: [Int] -- stores inf fib sequence evaluated lazily
    fibs = 1 : 1 : zipWith (+) fibs (tail fibs)

    -- the prev code doesn't go to inf loops unless we just decide to print fibs
    -- So if we want first 10 fibbonacci numbers what do we do?
    x = take 10 fibs
    print x -- This will infact enforce to compute the fibs till first 10 elem
    ```

    ```haskell
    -- filter :: (a -> Bool) -> [a] -> [a]
    filter pred (x:xs) | pred x    = x : filter pref xs
                       | otherwise = filter pref xs
           _ _                     = []

    --sieve :: [Int] -> [Int]
    sieve (x:xs) = x : sieve (filter dv xs)
          where
             dv t = (t `mod` x /= 0)
    sieve [] = []

    primes = sieve [2 .. ]
    -- printing prime will be an inf loop
    -- but doing
    x = take 100 primes
    print x -- is fine
    ```
