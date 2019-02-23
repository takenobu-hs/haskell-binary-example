
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
    n <- fromIntegral <$> getWord8
    xs <- replicateM n getWord8
    return xs



{-
$ echo -ne '\x03\xFF\x08\x7F' | runghc 4.6.get_cond_count.hs
[255,8,127]

-}

