{-# LANGUAGE TupleSections #-}

module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz = (fst <$>) . until
  (maybe True ((== 1) . snd))
  ((\(c, i) ->
      if i > 1
      then Just (succ c,  if even i then i `quot` 2 else 3 * i + 1)
      else Nothing)
    =<<)
  . Just . (0,)
