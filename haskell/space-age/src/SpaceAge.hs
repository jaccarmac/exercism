module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

earthYear :: Float
earthYear = 31557600

ageOnEarth :: Float -> Float
ageOnEarth = (/ earthYear)

ageOn :: Planet -> Float -> Float
ageOn =  (ageOnEarth .) . convertToEarthTime

convertToEarthTime :: Planet -> Float -> Float
convertToEarthTime Mercury = (/ 0.2408467)
convertToEarthTime Venus = (/ 0.61519726)
convertToEarthTime Earth = id
convertToEarthTime Mars = (/ 1.8808158)
convertToEarthTime Jupiter = (/ 11.862615)
convertToEarthTime Saturn = (/ 29.447498)
convertToEarthTime Uranus = (/ 84.016846)
convertToEarthTime Neptune = (/ 164.79132)
