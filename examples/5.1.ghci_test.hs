
import qualified Data.ByteString.Lazy as B
import           Data.Word (Word8)
import           Data.Binary.Put
import           Data.Binary.Get

main :: IO ()
main = do
    x <- B.getContents
    print $ getData x

getData :: B.ByteString -> Float
getData = runGet $ do
    x <- getFloatle
    return x

testData :: B.ByteString
testData = runPut $ do
    putFloatle 1.0



{-
ghci> getData testData
1.0

-}

