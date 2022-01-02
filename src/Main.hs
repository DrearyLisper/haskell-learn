module Main where

import Tree

main :: IO ()
main = print $ toList $ fromList [1, 2, 3, 4]
