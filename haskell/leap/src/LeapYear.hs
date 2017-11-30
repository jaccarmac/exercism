module LeapYear (isLeapYear) where

divisibleBy :: Integer -> Integer -> Bool
divisibleBy dividend divisor = mod dividend divisor == 0

isLeapYear :: Integer -> Bool
isLeapYear year = or [and [divisibleBy year 4, not (divisibleBy year 100)], divisibleBy year 400]
