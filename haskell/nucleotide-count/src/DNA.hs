module DNA (nucleotideCounts, Nucleotide(..)) where

import           Control.Monad (foldM)
import           Data.Map      (Map, fromList, insertWith)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts = foldM (flip countNucleotide) emptyCount

emptyCount :: Map Nucleotide Int
emptyCount = fromList [(A, 0), (C, 0), (G, 0), (T, 0)]

countNucleotide :: Char -> Map Nucleotide Int -> Either String (Map Nucleotide Int)
countNucleotide n  = case n of
  'A' -> incrementKey A
  'C' -> incrementKey C
  'G' -> incrementKey G
  'T' -> incrementKey T
  c   -> const $ Left [c]
  where incrementKey k = Right . insertWith (+) k 1
