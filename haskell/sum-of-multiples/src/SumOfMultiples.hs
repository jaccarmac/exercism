module SumOfMultiples (sumOfMultiples) where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ filter (isMultipleOf factors) [1..limit-1]

isMultipleOf :: [Integer] -> Integer -> Bool
isMultipleOf factors n = any (\m -> m /= 0 && n `mod` m == 0) factors
