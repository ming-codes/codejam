
googlerese :: Char -> Char
googlerese 'a' = 'y'
googlerese 'b' = 'h'
googlerese 'c' = 'e'
googlerese 'd' = 's'
googlerese 'e' = 'o'
googlerese 'f' = 'c'
googlerese 'g' = 'v'
googlerese 'h' = 'x'
googlerese 'i' = 'd'
googlerese 'j' = 'u'
googlerese 'k' = 'i'
googlerese 'l' = 'g'
googlerese 'm' = 'l'
googlerese 'n' = 'b'
googlerese 'o' = 'k'
googlerese 'p' = 'r'
googlerese 'q' = 'z'
googlerese 'r' = 't'
googlerese 's' = 'n'
googlerese 't' = 'w'
googlerese 'u' = 'j'
googlerese 'v' = 'p'
googlerese 'w' = 'f'
googlerese 'x' = 'm'
googlerese 'y' = 'a'
googlerese 'z' = 'q'
googlerese ' ' = ' '
googlerese '\n' = '\n'
googlerese x = '?'

main :: IO()
main = do
  num <- getLine
  interact (\input -> map googlerese input)
