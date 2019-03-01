module CollatzConjecture (collatz) where

import           Data.Foldable (find)

collatz :: Integer -> Maybe Integer
collatz n = find ((|| n == 1) . (>0))
  $ Just
  $ toInteger
  $ length
  $ takeWhile (>1)
  $ iterate (\i -> if even i then i `quot` 2 else 3 * i + 1) n
