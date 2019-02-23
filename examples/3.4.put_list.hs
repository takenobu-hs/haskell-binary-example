
import qualified Data.ByteString.Lazy as B
import           Data.Binary.Put

main :: IO ()
main = B.putStr bin

bin :: B.ByteString
bin = runPut $ do
    mapM_ putInt16le [1, 2, 3, 4]



{-
$ runghc 3.4.put_list.hs | xxd
00000000: 0100 0200 0300 0400                      ........

-}

