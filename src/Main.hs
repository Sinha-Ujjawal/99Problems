module Main where

import Problems1To10
  ( NestedList (Elem, List),
    compress,
    elementAt,
    encode,
    flatten,
    isPalindrome,
    myButLast,
    myLast,
    myLength,
    myReverse,
    pack,
  )

main :: IO ()
main = do
  -- Problems 1 to 10
  print $ myLast [1, 2, 3, 4]
  print $ myLast ([] :: [Int])
  print $ myButLast [1, 2, 3, 4]
  print $ myButLast [1]
  print $ myButLast ([] :: [Int])
  print $ elementAt [1, 2, 3] 0
  print $ elementAt [1, 2, 3] 1
  print $ elementAt [1, 2, 3] 2
  print $ elementAt [1, 2, 3] 4
  print $ elementAt [1, 2, 3] (-1)
  print $ elementAt ([] :: [Int]) 0
  print $ myLength [1, 2, 3]
  print $ myLength []
  print $ myReverse [1, 2, 3]
  print $ isPalindrome [1, 2, 1]
  print $ isPalindrome [1, 2, 3]
  print $ flatten (List [Elem 1, List [Elem 2, List [Elem 3, Elem 4], Elem 5]])
  print $ compress "aaaabccaadeeee"
  print $ pack "aaaabccaadeeee"
  print $ encode "aaaabccaadeeee"
