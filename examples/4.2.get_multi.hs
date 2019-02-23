
import qualified Data.ByteString.Lazy as B
import           Data.Word (Word8)
import           Data.Binary.Get

main :: IO ()
main = do
    x <- B.getContents
    print $ getData x

getData :: B.ByteString -> (Word8, Word8)
getData = runGet $ do
    x1 <- getWord8
    x2 <- getWord8
    return (x1, x2)



{-
$ echo "AB" | runghc 4.2.get_multi.hs
(65,66)

$ echo -ne '\xFF\x08' | runghc 4.2.get_multi.hs
(255,8)

-}

