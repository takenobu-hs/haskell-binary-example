
import qualified Data.ByteString.Lazy as B
import           Control.Monad (replicateM)
import           Data.Word (Word8)
import           Data.Binary.Get

main :: IO ()
main = do
    x <- B.getContents
    print $ getData x

getData :: B.ByteString -> [Word8]
getData = runGet getList

getList :: Get [Word8]
getList = do
    empty <- isEmpty
    if empty
        then return []
        else (:) <$> getWord8 <*> getList



{-
$ echo -ne '\xFF\x08\x7F' | runghc 4.8.get_eof_applicative.hs
[255,8,127]

-}

