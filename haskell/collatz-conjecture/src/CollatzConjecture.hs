{-# LANGUAGE TupleSections #-}

module CollatzConjecture (collatz) where

import           Data.Bifunctor (bimap)
import           Data.Foldable  (find)

collatz :: Integer -> Maybe Integer
collatz = (fst <$>) . until
  (maybe True $ (==1) . snd)
  (fmap
   (bimap succ (\i -> if even i then i `div` 2 else 3 * i + 1))
   . find ((>1) . snd))
  . Just . (0,)
