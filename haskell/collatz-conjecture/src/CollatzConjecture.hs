{-# LANGUAGE LambdaCase    #-}
{-# LANGUAGE TupleSections #-}

module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz = (fst <$>) . until (\case
                                  Nothing -> True
                                  Just (_, i) -> i == 1)
            (\case Nothing -> Nothing
                   Just (c, i) | i > 1 -> Just ((succ c), (if even i then i `quot` 2 else 3 * i + 1))
                               | otherwise  -> Nothing)
            . Just . (0,)
