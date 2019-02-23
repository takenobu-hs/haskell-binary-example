
import qualified Data.ByteString.Lazy as B
import           Data.Binary.Get

main :: IO ()
main = do
    x <- B.getContents
    print $ getData x

getData :: B.ByteString -> Int
getData = runGet $ do
    x <- getInt64le
    return $ fromIntegral x



{-
$ echo -ne '\xFD\xFF\xFF\xFF\xFF\xFF\xFF\xFF' | runghc 4.5.get_int.hs
-3

$ runghc 3.5.put_int.hs | runghc 4.5.get_int.hs
-3
-}

