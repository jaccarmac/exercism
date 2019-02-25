module Pangram (isPangram) where

import           Data.Char (toLower)
import           Data.Set  (Set, fromList, isSubsetOf)

isPangram :: String -> Bool
isPangram = (letters `isSubsetOf`) . lettersIn

letters :: Set Char
letters = fromList ['a'..'z']

lettersIn :: String -> Set Char
lettersIn = fromList . map toLower
