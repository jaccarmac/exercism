module Diamond (diamond) where

diamond :: Char -> Maybe [String]
diamond c | c < 'A' || c > 'Z' = Nothing
          | otherwise = pure [[charAt x y | x <- row] | y <- column]
          where row = [c, pred c .. 'A'] ++ ['B' .. c]
                column = ['A' .. c] ++ tail [c, pred c .. 'A']
                charAt x y | x == y = x
                           | otherwise = ' '
