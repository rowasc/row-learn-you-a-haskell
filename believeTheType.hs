-- Since functions in Haskell are pure (their result only depends on their arguments), 
-- the equivalent of a function with no arguments is just a value. For example, one = 1.



-- Rewriting all of chapter one functions with types -- 

concatThreeNumbers :: Int -> Int -> Int -> String
concatThreeNumbers x y z = show x ++ " " ++ show y ++ " " ++ show z
-- doubleMe --
doubleMe :: Int -> Int
doubleMe x = x * 2
-- end doubleMe --

-- doubleUs --
doubleUs :: Int -> Int -> Int
doubleUs x y = doubleMe x + doubleMe y
-- end doubleUs --
--doubleSmallNumber--
doubleSmallNumber :: Int -> Int
doubleSmallNumber x = if (x > 100) then x else doubleMe x
-- end doubleSmallNumber --

-- doubleSmallNumber' -- 
doubleSmallNumber' :: Int -> Int
doubleSmallNumber' x  = (if x < 100 then x else doubleMe x) + 1
-- end doubleSmallNumber' --

-- lostNumbers : Is this a function that can have a void type as the function param?-- 
lostNumbers = [2,4,8]
-- end lostNumbers -- 

-- isPalindrome --
isPalindrome :: [Char] -> Bool
isPalindrome word = if null word == True then False else ((reverse word) == word)
-- end isPalindrome --

-- checkPalindromes --
checkPalindromes :: [String] -> [Bool]
checkPalindromes words = [  isPalindrome word | word <- words ]
-- end checkPalindromes --

-- infiniteListTake10 : Is this a function that can have a void type as the function param?-- 
infiniteListTake10 = take 10 [2,4..] -- [2,4,6,8,10,12,14,16,18,20] with list operation
-- infiniteListTake10 : Is this a function that can have a void type as the function param?-- 

--- List comprehensions . Lists can only store values of the same type. Storing ["a", 2, 3] won't work . Storing [1,2,3] will---
setComprehension =  [doubleMe x  | x <- [1..10]]--same as inifiteListTake10 but with a set comprehension
setComprehensionGtEq12 =  [ x  | x <- [1..10], doubleMe x >= 12]-- get all elements from a list that after being doubled, are equal or greater than 12. Print the original number.
setComprehensionRemainder7is3 = [x | x <- [50..100], x `mod` 7 == 3] -- get numbers whose remainder when divided by 7 is 3
boomBang xs = [if x < 10 then "BOOM" else "BANG" | x <- xs , odd x]-- every odd number > 10 = "BANG", every odd number < 10 = "BOOM", if it's not ODD, we throw it out of the list
xNot131519AndEven = [x | x <- [10..20], x /= 13, x /= 15, x /= 19, even x] -- multiple predicates for each value
multipleListsXPlusY = [x + y | x <- [1,2], y <- [100,101]] -- x+y , when x=1 and y =100 (101), when x=2 and y=100 (102).. then when x=2 and y=100 (102) and when x=2 and y=101(103) // [101,102,102,103]
productOfXY = [x * y | x <- [1,2], y <-[10,11]] -- same as multipleListsXPlusY , we combine all values of X with all value of Y, then multiply them
productOfXYGt20 = [x * y | x <- [1,2], y <-[10,11], x * y >20] -- same as productOfXY , but we only return if GT than 20
nouns = ["hobo", "frog", "pope"]
adjectives = ["lazy", "grouchy", "scheming"]
epicHilarity = [adjective ++ " " ++ noun |  adjective <- adjectives, noun <- nouns] -- hilarious adjectives for all nouns. 
rewriteLenght xs = sum [1 | _ <- xs] -- underscore is just a tmp variable, haskell style :) . We replace each value by 1 and then sum to get the lenght

-- Defining type for functions removeLowerCase receives a String and returns a string (array of Char)-- 
removeLowercase :: [Char] -> [Char]
removeLowercase letters = [l | l <- letters, l `elem` ['A'..'Z']]


listWithList = [[1,2,3], [4,5,6], [7,8,9]]
removeOddNumbersWitouthFlattening = [[li | li <- listInner, even li] | listInner <- listWithList] -- remove odd numbers from a list of lists witouth flattening the list
--- Tuples: used to store several heterogenous elements as a single value. Tuples have a FIXED size. You cannot append elements to a 2size tuple easily . Storing ("a", 1, 2) will work  just fine ---
myFirstTuple = ("a", 1)
-- myFirstListOfTuples = [(1,2),(1,1,1)] -- We cannot do this in haskell, because tupples of different sizes are basically a separate type. Tuples of size 2 are different than tuples of size 3
myFirstListOfTuples = [(1,2),(1,1)]
--- mySecondListOfTuples = [(1,2),("a",1)] -- We cannot do this because T2 ("a",1) is of a different type than T1. This is because mixed type tuples are different type than single type tuples
mySecondListOfTuples = [(1,2),(1,1)]

--- Using pairs (tuples of size 2) ---
fstUse = fst (2,3) -- this only works with tuples that are pais. You cannot use fst on triplets. Fst returns the first element of a pair
sndUse = snd (2,3) -- this only works with tuples that are pais. You cannot use snd on triplets. Snd returns the second element of a pair

--- Using ZIP to produce lists of pairs. Takes two lists and zips them together in one list of pairs by pairing the nL1 element  with the nL2 element
zipUse = zip [1,2,3,4] [4,4,4,3] -- returns [(1,4),(2,4),(3,4),(4,3)]

--- Using ZIP in unmatched size lists ignores the smaller list remanining elements -- 
zipUseUnmatched = zip [1, 1,2,3,4] [2,3,4,5] -- returns [(1,2),(1,3),(2,4),(3,5)]

-- Matching two lists with different types into pairs (size 2 tuples) works because tuples can have different types
zipUseTwoTypes = zip ["A", "B","C","D"] [2,3,4,5] -- returns [("A",2),("B",3),("C",4),("D",5)]

-- finding the right triangle 
-- Length of all 3 sides are integers
-- Lenght of each side is less than or equal to 10 (<=10)
-- Triangle's perimeter (sum of size lenghts) equals 24
rightTriangles = [(a, b, c) | c <- [1..10], a <- [1..c], b <- [1..a], a^2 + b^2 == c^2 , a + b + c == 24]

