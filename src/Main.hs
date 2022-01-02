module Main where

import Tree

main :: IO ()
main = print $ toList $ fmap even $ fromList [1, 2, 3, 4]
