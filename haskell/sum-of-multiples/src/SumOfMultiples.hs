module SumOfMultiples (sumOfMultiples) where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ filter (isMultiple factors) [1..limit-1]

isMultiple :: [Integer] -> Integer -> Bool
isMultiple [] _     = False
isMultiple (0:fs) n = isMultiple fs n
isMultiple (f:fs) n = n `mod` f == 0 || isMultiple fs n
