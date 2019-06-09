module Grains (square, total) where

import           Control.Applicative (liftA2)
import           Data.Maybe          (fromMaybe)

square :: Integer -> Maybe Integer
square n | n < 1 = Nothing
         | n > 64 = Nothing
         | otherwise = pure $ 2 ^ (n - 1)

total :: Integer
total = fromMaybe 0 $ foldl (liftA2 (+)) (Just 0) $ map square [1..64]
