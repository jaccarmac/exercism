module DNA (nucleotideCounts, Nucleotide(..)) where

import           Control.Monad (foldM)
import           Data.Map      (Map, fromList, insertWith)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts = foldM countNucleotide $ fromList [(A, 0), (C, 0), (G, 0), (T, 0)]

countNucleotide :: Map Nucleotide Int -> Char -> Either String (Map Nucleotide Int)
countNucleotide m 'A' = Right $ insertWith (+) A 1 m
countNucleotide m 'C' = Right $ insertWith (+) C 1 m
countNucleotide m 'G' = Right $ insertWith (+) G 1 m
countNucleotide m 'T' = Right $ insertWith (+) T 1 m
countNucleotide m c   = Left [c]
