
import qualified Data.ByteString.Lazy as B
import           Data.ByteString (ByteString)
import           Data.Int  (Int32, Int16)
import           Data.Word (Word16, Word8)
import           Data.Binary.Get

main :: IO ()
main = do
    x <- B.getContents
    print $ getData x

getData :: B.ByteString
        -> (Int32, Int16, Word16, Float, Double, ByteString, Word8)
getData = runGet $ do
    x1 <- getInt32le
    x2 <- getInt16le
    x3 <- getWord16le
    x4 <- getFloatle
    x5 <- getDoublele
    x6 <- getByteString 3
    x7 <- getWord8
    return (x1, x2, x3, x4, x5, x6, x7)



{-
$ runghc 3.3.put_various.hs > test.dat
$ runghc 4.3.get_various.hs < test.dat
(19088743,21930,51966,1.0,1.0,"ABC",255)

-}

