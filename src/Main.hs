module Main where

import Monads

main :: IO ()
main = do
  print $ eval $ Div (Div (Val 2) (Val 0)) (Val 2)
  print $ do
    a <- [1, 2, 3]
    (\a->[a+1]) a
