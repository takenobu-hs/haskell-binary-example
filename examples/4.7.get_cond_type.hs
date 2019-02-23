
import qualified Data.ByteString.Lazy as B
import           Control.Monad (replicateM)
import           Data.Word (Word8)
import           Data.Binary.Get

main :: IO ()
main = do
    x <- B.getContents
    print $ getData x

data Val = F Float
         | D Double
         deriving Show

getData :: B.ByteString -> Val
getData = runGet $ do
    n <- fromIntegral <$> getWord8
    x <- case n of
        1 -> F <$> getFloatle
        _ -> D <$> getDoublele
    return x



{-
$ echo -ne '\x01\x00\x00\x00\x40' | runghc 4.7.get_cond_type.hs
F 2.0

-}

