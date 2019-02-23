
import qualified Data.ByteString.Lazy as B
import           Control.Monad (replicateM)
import           Data.Word (Word8)
import           Data.Binary.Get

main :: IO ()
main = do
    x <- B.getContents
    print $ getData x

getData :: B.ByteString -> [Word8]
getData = runGet $ do
    xs <- replicateM 3 getWord8
    return xs



{-
$ echo "ABCDE" | runghc 4.4.get_list_replicateM.hs
[65,66,67]

$ echo -ne '\xFF\x08\x7F' | runghc 4.4.get_list_replicateM.hs
[255,8,127]

-}

