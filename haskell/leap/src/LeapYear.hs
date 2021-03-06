module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year = yearDivisibleBy 4 && not (yearDivisibleBy 100) || yearDivisibleBy 400
  where yearDivisibleBy divisor = year `mod` divisor == 0