module Bob (responseFor) where

import           Data.Text (Text, empty, last, pack, strip, toLower, toUpper)

responseFor :: String -> String
responseFor = let
  respond t
    | isSilence t = "Fine. Be that way!"
    | isShouting t && isQuestion t = "Calm down, I know what I'm doing!"
    | isShouting t = "Whoa, chill out!"
    | isQuestion t = "Sure."
    | otherwise = "Whatever."
  in respond . strip . pack

isShouting :: Text -> Bool
isShouting t = t == toUpper t && t /= toLower t

isQuestion :: Text -> Bool
isQuestion = (== '?') . Data.Text.last

isSilence :: Text -> Bool
isSilence = (== empty)
