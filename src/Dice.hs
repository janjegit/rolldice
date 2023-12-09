module Dice ( Dice(..)
            , Outcome(..)
            , rollDice
            , sumOfRoll) where

import System.Random

-- Dice Number Sides Modifier
data Dice = Dice Int Int Int

type Modifier = Int
type Roll     = ([Int], Modifier)

data Outcome = Outcome Dice Roll

instance Show Dice where
  show (Dice n sides m) = 
    show n ++ "d" ++ show sides ++ modifier
    where
      modifier | m > 0     = "+" ++ show m
               | m < 0     = show m
               | otherwise = ""

instance Eq Outcome where
  (==) outcome other = (sumOfRoll outcome) == (sumOfRoll other)

instance Ord Outcome where
  compare outcome other = compare (sumOfRoll outcome) (sumOfRoll other)

instance Show Outcome where
  show o = 
    let (Outcome dice rolled) = o
        (r,m) = rolled
        showRolled []     = ""
        showRolled (x:[]) = show x 
        showRolled (x:xs) = show x ++ "+" ++ showRolled xs
        modifier 
          | m < 0     = "+(" ++ show m ++ ")"
          | m > 0     = "+" ++ show m
          | otherwise = ""
        showSum 
          | (length r) > 1 || m /= 0 = "=" ++ (show $ sumOfRoll o)
          | otherwise                = ""
    in "Rolled " ++ show dice ++ ": " ++ showRolled r ++ modifier ++ showSum ++ "."

rollDice :: Dice -> StdGen -> Outcome
rollDice dice gen = 
  let (Dice n sides m) = dice 
      roll = take n (randomRs (1,sides) gen)
  in Outcome dice (roll,m)

sumOfRoll :: Outcome -> Int
sumOfRoll (Outcome _ (roll,m)) = m + sum roll
