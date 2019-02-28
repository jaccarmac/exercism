module Isogram (isIsogram) where

import           Data.Char (isLetter, toLower)

isIsogram :: String -> Bool
isIsogram ""     = True
isIsogram (c:cs) = (not $ toLower c `elem` cs') && isIsogram cs'
  where cs' = filter isLetter $ map toLower cs
