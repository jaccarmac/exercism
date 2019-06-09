module Grains (square, total) where

import           Data.Maybe (fromMaybe)

square :: Integer -> Maybe Integer
square n | n < 1 = Nothing
         | n > 64 = Nothing
         | otherwise = pure $ 2 ^ (n - 1)

total :: Integer
total = fromMaybe 0 $ sum <$> traverse square [1..64]
