module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz 1 = Just 0
collatz n = (\l -> if l > 0 then Just $ toInteger l else Nothing)
  $ length
  $ takeWhile (>1)
  $ iterate (\i -> if even i then i `div` 2 else 3 * i + 1) n
