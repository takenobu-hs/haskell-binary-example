
import qualified Data.ByteString.Lazy as B
import           Data.Word (Word8)
import           Data.Binary.Get

main :: IO ()
main = do
    x <- B.getContents
    print $ getData x

getData :: B.ByteString -> [Word8]
getData = runGet $ do
    x1 <- getWord8
    x2 <- getWord8
    x3 <- getWord8
    return [x1, x2, x3]



{-
$ echo "ABC" | runghc 4.4.get_list.hs
[65,66,67]

$ echo -ne '\xFF\x08\x7F' | runghc 4.4.get_list.hs
[255,8,127]

-}

