data Notes = Do | Re | Me | Fa | Sol | La | Ti
  deriving Eq

-- data Foo = Foo | Bar deriving Show

data MyMaybe a = Ju a | No

-- class Eq a => (Eq (MyMaybe a)) where (==) :: Eq a => MyMaybe -> MyMaybe -> Bool

instance Eq a => Eq (MyMaybe a) where
  (==) (Ju x) (Ju y) = (x == y)
  (==) No No = True
  (==) _ _ = False

data Foo = Foo | Bar

instance Show Foo where
  show Foo = "foo"
  show Bar = "bar"

main = print Bar
