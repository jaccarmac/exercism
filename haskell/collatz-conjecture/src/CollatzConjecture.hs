{-# LANGUAGE LambdaCase    #-}
{-# LANGUAGE TupleSections #-}

module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz = (fst <$>) . until
  (maybe True ((== 1) . snd))
  (\case Nothing -> Nothing
         Just (c, i) | i > 1 -> Just (succ c,  if even i then i `quot` 2 else 3 * i + 1)
                     | otherwise  -> Nothing)
  . Just . (0,)
