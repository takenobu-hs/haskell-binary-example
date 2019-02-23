
import qualified Data.ByteString.Lazy as B
import           Data.Binary.Put

main :: IO ()
main = B.putStr bin

bin :: B.ByteString
bin = runPut $ do
    putInt32le 0x01234567



{-
$ runghc 3.1.put_do.hs | xxd
00000000: 6745 2301                                gE#.

-}

