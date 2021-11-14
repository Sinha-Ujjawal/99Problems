module Problems1To10 where

-- https://wiki.haskell.org/99_questions/1_to_10

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x : _) = Just x

safeTail :: [a] -> [a]
safeTail [] = []
safeTail (_ : xs) = xs

myLast :: [a] -> Maybe a
myLast = safeHead . reverse

myButLast :: [a] -> Maybe a
myButLast = safeHead . safeTail . reverse

elementAt :: [a] -> Int -> Maybe a
elementAt xs i = if i >= 0 then safeHead $ drop i xs else Nothing

myLength :: [a] -> Int
myLength = sum . map (const 1)

myReverse :: [a] -> [a]
myReverse = foldl (flip (:)) []

isPalindrome :: Eq a => [a] -> Bool
isPalindrome = (==) <*> reverse

data NestedList a = Elem a | List [NestedList a]

flatten :: NestedList a -> [a]
flatten (Elem a) = [a]
flatten (List as) = concatMap flatten as

compress :: Eq a => [a] -> [a]
compress [] = []
compress (x : xs) = reverse $ snd $ foldl folder (x, [x]) xs
  where
    folder (prev, acc) x
      | x == prev = (prev, acc)
      | otherwise = (x, x : acc)

pack :: Eq a => [a] -> [[a]]
pack [] = []
pack (x : xs) = reverse $ (\(_, cacc, acc) -> cacc : acc) $ foldl folder (x, [x], []) xs
  where
    folder (prev, cacc, acc) x
      | x == prev = (prev, x : cacc, acc)
      | otherwise = (x, [x], cacc : acc)

encode :: Eq a => [a] -> [(Int, a)]
encode [] = []
encode (x : xs) = reverse $ (\(prev, c, acc) -> (c, prev) : acc) $ foldl folder (x, 1, []) xs
  where
    folder (prev, c, acc) x
      | x == prev = (prev, c + 1, acc)
      | otherwise = (x, 1, (c, prev) : acc)
