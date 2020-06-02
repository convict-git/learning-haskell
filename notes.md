# Functional Programming Notes

### Haskell Intro
- Binary tree comparision *Haskell* and *SML*
   ```haskell
   -- Binary tree in Haskell in uncurry version of Node
   data Tree a  = Nil | Node (Tree a, a, Tree a)
   Nil :: Tree a
   Node :: (Tree a * a * Tree a) -> Tree a

   -- Binary tree in Haskell in *curry* version of Node
   data Tree a = Nil | Node (Tree a) a (Tree a)
   Nil :: Tree a
   Node :: Tree a -> a -> Tree a -> Tree a -- partial application is allowed
   ```
   and
   ```sml
   (* Binary tree in sml *)

   ```



