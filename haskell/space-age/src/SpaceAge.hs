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
ageOn planet = convertToEarthYear planet . ageOnEarth

convertToEarthYear :: Planet -> Float -> Float
convertToEarthYear Mercury = (/ 0.2408467)
convertToEarthYear Venus = (/ 0.61519726)
convertToEarthYear Earth = id
convertToEarthYear Mars = (/ 1.8808158)
convertToEarthYear Jupiter = (/ 11.862615)
convertToEarthYear Saturn = (/ 29.447498)
convertToEarthYear Uranus = (/ 84.016846)
convertToEarthYear Neptune = (/ 164.79132)
