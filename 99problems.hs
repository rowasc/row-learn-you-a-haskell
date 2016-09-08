-- 99problems.hs https://wiki.haskell.org/99_questions/1_to_10

-- 1 Problem 1 - (*) Find the last element of a list.
findLastElement :: [a] -> a
findLastElement list = last list

--(*) Find the last but one element of a list. myButLast [1,2,3,4] would return 3-- 

findButLastElement :: [a] -> a
findButLastElement list = reverse list !! 1

