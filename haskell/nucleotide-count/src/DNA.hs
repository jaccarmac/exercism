module DNA (nucleotideCounts, Nucleotide(..)) where

import           Control.Monad (foldM)
import           Data.Map      (Map, fromList, insertWith)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts dna = case (
  foldM
    (\m -> fmap (`countNucleotide` m) . nucleotideFor) emptyCount dna
  ) of
  Left _       -> Left dna
  Right counts -> Right counts

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
