module Monads where

data Expr = Val Int | Div Expr Expr

savediv :: Int -> Int -> Maybe Int
savediv _ 0 = Nothing
savediv l r = Just $ l `div` r

eval :: Expr -> Maybe Int
eval (Val i) = Just i
eval (Div l r) = do
  evalL <- eval l
  evalR <- eval r
  savediv evalL evalR
