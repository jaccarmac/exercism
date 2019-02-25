{-# LANGUAGE MultiWayIf #-}

module Bob (responseFor) where

import Data.Text (empty, last, pack, Text, toLower, toUpper, strip)

responseFor :: String -> String
responseFor s = (\t -> if
                    | isSilence t -> "Fine. Be that way!"
                    | isShouting t && isQuestion t -> "Calm down, I know what I'm doing!"
                    | isShouting t -> "Whoa, chill out!"
                    | isQuestion t -> "Sure."
                    | otherwise -> "Whatever.") $ strip $ pack s

isShouting :: Text -> Bool
isShouting t = t == toUpper t && t /= toLower t

isQuestion :: Text -> Bool
isQuestion = (== '?') . Data.Text.last

isSilence :: Text -> Bool
isSilence = (== empty)
