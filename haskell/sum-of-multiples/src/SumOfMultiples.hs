module SumOfMultiples (sumOfMultiples) where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ filter (`isMultipleOfAny` factors) [1..limit-1]

isMultipleOfAny :: Integer -> [Integer] -> Bool
isMultipleOfAny x = any (x `isMultipleOf`)

isMultipleOf :: Integer -> Integer -> Bool
isMultipleOf _ 0 = False
isMultipleOf m n = m `mod` n == 0
