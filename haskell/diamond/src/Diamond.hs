module Diamond (diamond) where

import           Data.Functor ((<&>))

diamond :: Char -> Maybe [String]
diamond c | c < 'A' || c > 'Z' = Nothing
          | otherwise = pure $ (row <&>) . charAt <$> column
          where row = [c, pred c .. 'A'] ++ ['B' .. c]
                column = ['A' .. c] ++ tail [c, pred c .. 'A']
                charAt x y | x == y = x
                           | otherwise = ' '
