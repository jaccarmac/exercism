module DNA (nucleotideCounts, Nucleotide(..)) where

import           Control.Monad (foldM)
import           Data.Map      (Map, fromList, insertWith)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts = foldM (flip countNucleotide) emptyCount

emptyCount :: Map Nucleotide Int
emptyCount = fromList [(A, 0), (C, 0), (G, 0), (T, 0)]

countNucleotide :: Char -> Map Nucleotide Int -> Either String (Map Nucleotide Int)
countNucleotide 'A' = Right . insertWith (+) A 1
countNucleotide 'C' = Right . insertWith (+) C 1
countNucleotide 'G' = Right . insertWith (+) G 1
countNucleotide 'T' = Right . insertWith (+) T 1
countNucleotide c   = const $ Left [c]
