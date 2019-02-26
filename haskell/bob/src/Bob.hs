module Bob (responseFor) where

import           Data.Char (isLetter, isLower, isSpace)

responseFor :: String -> String
responseFor = let
  respond t
    | null t = "Fine. Be that way!"
    | isShouting t && isQuestion t = "Calm down, I know what I'm doing!"
    | isShouting t = "Whoa, chill out!"
    | isQuestion t = "Sure."
    | otherwise = "Whatever."
  in respond . strip

isShouting :: String -> Bool
isShouting s = any isLetter s && not (any isLower s)

isQuestion :: String -> Bool
isQuestion = (== '?') . last

strip :: String -> String
strip = filter (not . isSpace)
