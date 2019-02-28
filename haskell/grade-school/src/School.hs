module School (School, add, empty, grade, sorted) where

import           Data.List (sort)

data School = Empty
  | Grade Int [String] School

add :: Int -> String -> School -> School
add gradeNum student Empty = Grade gradeNum [student] Empty
add gradeNum student (Grade thisGrade students school)
  | thisGrade == gradeNum = Grade gradeNum (sort (student : students)) school
  | otherwise = Grade thisGrade students (add gradeNum student school)

empty :: School
empty = Empty

grade :: Int -> School -> [String]
grade _ Empty = []
grade gradeNum (Grade thisGrade students school)
  | thisGrade == gradeNum = students
  | otherwise = grade gradeNum school

sorted :: School -> [(Int, [String])]
sorted Empty                             = []
sorted (Grade thisGrade students school) = sort ((thisGrade, students) : sorted school)
