module IsbnVerifier (isbn) where

isbn :: String -> Bool
isbn isbnNumber = not (elem Nothing (isbnDigits isbnNumber))

isbnDigits :: String -> [Maybe Int]
isbnDigits isbn = map isbnDigit (filter stripDash isbn)
  where stripDash '-' = False
        stripDash _   = True

isbnDigit :: Char -> Maybe Int
isbnDigit '0' = Just 0
isbnDigit '1' = Just 1
isbnDigit '2' = Just 2
isbnDigit '3' = Just 3
isbnDigit '4' = Just 4
isbnDigit '5' = Just 5
isbnDigit '6' = Just 6
isbnDigit '7' = Just 7
isbnDigit '8' = Just 8
isbnDigit '9' = Just 9
isbnDigit 'X' = Just 10
isbnDigit _   = Nothing
