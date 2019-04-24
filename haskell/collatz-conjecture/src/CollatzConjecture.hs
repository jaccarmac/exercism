module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n = ifNothing (if n == 1 then Just 0 else Nothing)
  $ (\i -> if i == 0 then Nothing else Just i)
  $ toInteger
  $ length
  $ takeWhile (>1)
  $ iterate (\i -> if even i then i `quot` 2 else 3 * i + 1) n
  where ifNothing d Nothing = d
        ifNothing _ m       = m
