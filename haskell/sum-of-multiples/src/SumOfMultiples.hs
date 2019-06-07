module SumOfMultiples (sumOfMultiples) where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ filter (\x -> any (x `isMultipleOf`) factors) [1..limit-1]

isMultipleOf :: Integer -> Integer -> Bool
isMultipleOf _ 0 = False
isMultipleOf m n = m `mod` n == 0
