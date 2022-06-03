module Diamond (diamond) where

import           Data.Char (chr, ord)

diamond :: Char -> Maybe [String]
diamond c | c < 'A' || c > 'Z' = Nothing
          | otherwise = pure $ mirrorRows $ padRows (diamondRowsFrom c) maxDepth
  where maxDepth = ord c - ord 'A'

mirrorRows :: [String] -> [String]
mirrorRows []     = []
mirrorRows [s]    = [s]
mirrorRows (s:ss) = s:mirrorRows ss ++ [s]

padRows :: [String] -> Int -> [String]
padRows [] _ = []
padRows ss 0 = ss
padRows (s:ss) depth = (pad ++ s ++ pad):padRows ss (depth - 1)
  where pad = replicate depth ' '

diamondRowsFrom :: Char -> [String]
diamondRowsFrom 'A' = ["A"]
diamondRowsFrom c = diamondRowsFrom (chr $ ord c - 1) ++ [currentRow]
  where currentRow = diamondRow c $ ord c - ord 'A'

diamondRow :: Char -> Int -> String
diamondRow c 0     = [c]
diamondRow c depth = c:replicate spaces ' ' ++ [c]
  where spaces = depth * 2 - 1
