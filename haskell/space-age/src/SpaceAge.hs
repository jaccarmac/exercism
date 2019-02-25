module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

ageOn :: Planet -> Float -> Float
ageOn planet seconds = ageOnEarth seconds / yearInEarthYears planet

ageOnEarth :: Float -> Float
ageOnEarth = (/ 31557600)

yearInEarthYears :: Planet -> Float
yearInEarthYears Mercury = 0.2408467
yearInEarthYears Venus = 0.61519726
yearInEarthYears Earth = 1
yearInEarthYears Mars = 1.8808158
yearInEarthYears Jupiter = 11.862615
yearInEarthYears Saturn = 29.447498
yearInEarthYears Uranus = 84.016846
yearInEarthYears Neptune = 164.79132
