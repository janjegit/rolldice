module Main where

import System.Environment (getArgs)
import System.Random (newStdGen)
import Dice
import Text.Parsec
import Text.Parsec.String (Parser)

integerParser :: Parser Int
integerParser = read <$> many1 digit

dCharParser :: Parser Char
dCharParser = char 'd'

modifierParser :: Parser Int
modifierParser = do
    sign <- option '+' (char '+' <|> char '-')
    num  <- integerParser
    return $ case sign of
        '+' ->  num
        '-' -> -num
        _   ->  num

diceParser :: Parser Dice
diceParser = do
    num      <- integerParser
    _        <- dCharParser
    numDie   <- integerParser
    modifier <- option 0 modifierParser
    return (Dice num numDie modifier)

main :: IO ()
main = do
  args <- getArgs
  gen  <- newStdGen
  case args of
    [input] -> case parse diceParser "" input of
      Left err -> putStrLn $ "Error in parsing arguments: " ++ show err
      Right diceConfig -> putStrLn $ show (rollDice diceConfig gen)
    _ -> putStr $ unlines ["Usage: rolldice <n>d<d>[+/-<m>]",
                             "  n   = Number of dice",
                             "  d   = Number of sides per die",
                             "  +/- = Optional sign for the modifier",
                             "  m   = Optional modifier value"]
