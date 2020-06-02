# Functional Programming Notes

### Haskell Intro
- *Types* and *constructors* should start with CAPITAL letters.
- Haskell is indendation sensitive

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

- Binary tree comparision *Haskell* and *SML*
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
-
