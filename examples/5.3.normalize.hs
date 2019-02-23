
import qualified Data.ByteString.Lazy as B
import           Control.Monad (replicateM)
import           Data.Binary.Get
import           Data.Binary.Put

main :: IO ()
main = do
    x <- B.getContents
    print $ normal $ getData x

getData :: B.ByteString -> [Float]
getData = runGet $ replicateM 16 getFloatle

normal :: [Float] -> [Float]
normal xs = let maxval = maximum xs
            in  map (/ maxval) xs


-- test data
testData :: B.ByteString
testData = runPut $ do
    mapM_ putFloatle [1..16]

{-
ghci> getData testData
[1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0]

ghci> normal $ getData testData
[6.25e-2,0.125,0.1875,0.25,0.3125,0.375,0.4375,0.5,0.5625,0.625,0.6875,0.75,0.8125,0.875,0.9375,1.0]

$ runghc 5.3.normalize.hs < test.dat | xxd

-}

