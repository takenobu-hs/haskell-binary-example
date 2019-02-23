
import qualified Data.ByteString.Lazy as B
import           Data.Binary.Get

main :: IO ()
main = do
    x <- B.getContents
    print $ getData x

getData :: B.ByteString -> Int
getData = runGet $ do
    x <- fromIntegral <$> getInt64le
    return x



{-
$ echo -ne '\xFD\xFF\xFF\xFF\xFF\xFF\xFF\xFF' | runghc 4.5.get_int_fmap.hs
-3

$ runghc 3.5.put_int.hs | runghc 4.5.get_int_fmap.hs
-3
-}

