data MyMaybe a = Jjust a | Nnothing
{-
class Functor t where
  fmap :: (a -> b) -> t a -> t b
  map :: (a -> b) -> [] a -> [] b
  -}

instance Functor MyMaybe where
  fmap f (Jjust x) = Jjust $ f x
  fmap _  _ = Nnothing

main::IO Int
main = fmap (\x -> x * x) getInt

