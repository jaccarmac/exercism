module Isogram (isIsogram) where

import           Data.Char (isLetter, toLower)

isIsogram :: String -> Bool
isIsogram = checkIsogram ""

checkIsogram :: String -> String -> Bool
checkIsogram _ "" = True
checkIsogram seen (c:cs)
  | isLetter c && lc `elem` seen = False
  | otherwise = checkIsogram (lc:seen) cs
  where lc = toLower c
