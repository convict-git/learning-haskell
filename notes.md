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
    null _ = False
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
