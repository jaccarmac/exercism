module DNA (nucleotideCounts, Nucleotide(..)) where

import           Data.Map        (Map, fromList, insertWith)
import           Data.Validation (Validation (..))

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Validation String (Map Nucleotide Int)
nucleotideCounts = foldl innerFunc $ Success emptyCount

innerFunc :: Validation String (Map Nucleotide Int) -> Char -> Validation String (Map Nucleotide Int)
innerFunc (Failure c) = const $ Failure c
innerFunc (Success m) = fmap (`countNucleotide` m) . nucleotideFor

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
