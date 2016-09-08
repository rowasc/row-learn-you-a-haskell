-- Syntax in functions
-- Pattern matching: used to specify patterns which some data should conform and to deconstruct the data according to those patterns
-- While defining functions, you can create more than one function body, differing in patterns that match them. Keeps code easy to read and simple
-- Haskell  interpreter reads this top to bottom.

--- Lucky number seven from the book ---

lucky :: Int -> String
lucky 7 = "LUCKY NUMBER SEVEN!"
-- x is a catchall pattern. Actually, whenever we use a lower camel case pattern here, we are creating a catch all
lucky x = "Sorry, you are out of luck!"
--- End: Lucky number seven from the book ---


--- sayMe function --
sayMe :: Int -> String
sayMe 1 = "One"
sayMe 2 = "Two"
sayMe 3 = "Three"
sayMe x = "Not between 1 and 3"
-- end : sayMe function -- 


-- Recursive factorial --
-- Factorial of 0 = 1
-- Factorial of 1 = 1 * 1
-- Factorial of 2 = 1 * 2
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1) -- obviously, this is a recursive function FFS!
-- end : Recursive factorial 


-- charName - failing pattern matching --
-- we should always include a catch all , or it will crash if there is nothing that matches the pattern supplied
charName :: Char -> String
charName 'a' = "Albert Einstein"
charName 'b' = "Bill Gates"
charName 'c' = "Charles Bartowsky"
-- end: charName - failing pattern matching --

--- Pattern matching with tuples --- 

-- getting two vectors in 2d scale and adding them together --
-- this makes it stupidly simple to realize: 
--- params are tuples (doubles)
--- name of params in the tuples (x1,y1) (x2,y2)
addVectors :: (Double, Double) -> (Double, Double) -> (Double, Double)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)
--- End: Pattern matching with tuples --- 


--- Pattern matching with list comprehensions --- 


--- END: Pattern matching with list comprehensions --- 


