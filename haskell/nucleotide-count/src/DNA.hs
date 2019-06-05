module DNA (nucleotideCounts, Nucleotide(..)) where

import           Control.Applicative (liftA2)
import           Data.Map            (Map, fromList, insertWith)
import           Data.Validation     (Validation (..), toEither)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts = toEither .
  foldl (flip $ liftA2 countNucleotide . nucleotideFor) (pure emptyCount)

emptyCount :: Map Nucleotide Int
emptyCount = fromList [(A, 0), (C, 0), (G, 0), (T, 0)]

countNucleotide :: Nucleotide -> Map Nucleotide Int -> Map Nucleotide Int
countNucleotide n = insertWith (+) n 1

nucleotideFor :: Char -> Validation String Nucleotide
nucleotideFor 'A' = Success A
nucleotideFor 'C' = Success C
nucleotideFor 'G' = Success G
nucleotideFor 'T' = Success T
nucleotideFor c   = Failure [c]
