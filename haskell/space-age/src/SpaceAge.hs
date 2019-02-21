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
ageOnEarth seconds = seconds / earthYear

ageOn :: Planet -> Float -> Float
ageOn Mercury = (\x -> x / 0.2408467) . ageOnEarth
ageOn Venus = (\x -> x / 0.61519726) . ageOnEarth
ageOn Earth = ageOnEarth
ageOn Mars = (\x -> x / 1.8808158) . ageOnEarth
ageOn Jupiter = (\x -> x / 11.862615) . ageOnEarth
ageOn Saturn = (\x -> x / 29.447498) . ageOnEarth
ageOn Uranus = (\x -> x / 84.016846) . ageOnEarth
ageOn Neptune = (\x -> x / 164.79132) . ageOnEarth
