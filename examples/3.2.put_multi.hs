
import qualified Data.ByteString.Lazy as B
import           Data.Binary.Put

main :: IO ()
main = B.putStr bin

bin :: B.ByteString
bin = runPut $ do
    putInt32le 0x01234567
    putInt16le 0x55AA



{-
$ runghc 3.2.put_multi.hs | xxd
00000000: 6745 2301 aa55                           gE#..U

-}

