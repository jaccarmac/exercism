module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz 1 = Just 0
collatz i
  | i > 1 = succ <$> collatz
    (if even i
     then i `quot` 2
     else 3 * i + 1)
  | otherwise = Nothing
