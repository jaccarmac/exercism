module DNA (nucleotideCounts, Nucleotide(..)) where

import           Control.Applicative (liftA2)
import           Control.Arrow       (left)
import           Data.Map            (Map, fromList, insertWith)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts = liftA2 left const $ foldl innerFunc $ Right emptyCount

innerFunc :: Either String (Map Nucleotide Int) -> Char -> Either String (Map Nucleotide Int)
innerFunc (Left c)  = const $ Left c
innerFunc (Right m) = fmap (`countNucleotide` m) . nucleotideFor

emptyCount :: Map Nucleotide Int
emptyCount = fromList [(A, 0), (C, 0), (G, 0), (T, 0)]

countNucleotide :: Nucleotide -> Map Nucleotide Int -> Map Nucleotide Int
countNucleotide n = insertWith (+) n 1

nucleotideFor :: Char -> Either String Nucleotide
nucleotideFor 'A' = Right A
nucleotideFor 'C' = Right C
nucleotideFor 'G' = Right G
nucleotideFor 'T' = Right T
nucleotideFor c   = Left [c]
