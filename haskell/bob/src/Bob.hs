module Bob (responseFor) where

import           Data.Char (isLetter, isSpace, toUpper)

responseFor :: String -> String
responseFor = let
  respond t
    | isSilence t = "Fine. Be that way!"
    | isShouting t && isQuestion t = "Calm down, I know what I'm doing!"
    | isShouting t = "Whoa, chill out!"
    | isQuestion t = "Sure."
    | otherwise = "Whatever."
  in respond . strip

isShouting :: String -> Bool
isShouting s = any isLetter s && all (\c -> c == toUpper c) s

isQuestion :: String -> Bool
isQuestion = (== '?') . last

isSilence :: String -> Bool
isSilence = (== 0) . length

strip :: String -> String
strip = filter (not . isSpace)
