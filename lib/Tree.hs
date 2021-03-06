module Tree where

data Tree a = Null | Node a (Tree a) (Tree a) deriving (Show)

instance Functor Tree where
  -- fmap :: (a -> b) -> Tree a -> Tree b
  fmap f Null = Null
  fmap f (Node value left right) = Node (f value) (fmap f left) (fmap f right)

isNull :: Tree a -> Bool
isNull Null = True
isNull _ = False

insert :: Ord a => Tree a -> a -> Tree a
insert Null elem = Node elem Null Null
insert (Node value left right) elem
    | elem < value = Node value (insert left elem) right
    | otherwise = Node value left (insert right elem)


fromList :: Ord a => [a] -> Tree a
fromList = foldl insert Null

toList :: Tree a -> [a]
toList Null = []
toList (Node value left right) = toList left ++ [value] ++ toList right
