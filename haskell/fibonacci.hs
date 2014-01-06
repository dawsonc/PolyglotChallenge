module Main where

import Data.List -- Data.List has a reverse method for arrays

-- returns an array of the fibonacci sequence in reverse order
fibonacci :: Integer -> [Integer]
fibonacci 0 = [0] -- base case
fibonacci 1 = [1, 0] -- other base case
fibonacci n = 
    let x1:x2:rest = fibonacci (n-1)
    in (x1 + x2):x1:x2:rest


main = do
    print $ reverse $ fibonacci 0
    print $ reverse $ fibonacci 1
    print $ reverse $ fibonacci 2
    print $ reverse $ fibonacci 5