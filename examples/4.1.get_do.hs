
import qualified Data.ByteString.Lazy as B
import           Data.Word (Word8)
import           Data.Binary.Get

main :: IO ()
main = do
    x <- B.getContents
    print $ getData x

getData :: B.ByteString -> Word8
getData = runGet $ do
    x <- getWord8
    return x



{-
$ echo -ne '\xFF' | runghc 4.1.get_do.hs
255

-}

