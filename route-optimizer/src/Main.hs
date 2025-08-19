{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import GHC.Generics
import Data.Aeson
import qualified Data.ByteString.Lazy.Char8 as B
import Data.List
import Data.Ord (comparing)
import Control.Monad (forM_)

-- Definição de ponto
data Point = Point
  { id :: Int
  , x  :: Double
  , y  :: Double
  } deriving (Show, Eq, Generic)

instance FromJSON Point
instance ToJSON Point

-- Calcula distância euclidiana entre dois pontos
distance :: Point -> Point -> Double
distance a b =
  sqrt ((x a - x b)^2 + (y a - y b)^2)

-- Função Nearest Neighbor para ordenar os pontos
optimize :: [Point] -> [Point]
optimize [] = []
optimize (p:ps) = go p ps [p]
  where
    go _ [] acc = reverse acc
    go curr remain acc =
      let next = minimumBy (comparing (distance curr)) remain
      in go next (delete next remain) (next : acc)

-- Calcula a distância total do caminho
totalDistance :: [Point] -> Double
totalDistance pts = sum $ zipWith distance pts (tail pts)

-- Função principal
main :: IO ()
main = do
  input <- B.getContents
  let points = decode input :: Maybe [Point]
  case points of
    Just pts -> do
      let ordered = optimize pts
      B.putStrLn $ encode $ object
        [ "ordered_points" .= ordered
        , "total_distance" .= totalDistance ordered
        ]
    Nothing -> putStrLn "Invalid JSON input"
