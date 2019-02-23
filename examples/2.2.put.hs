
import qualified Data.ByteString.Lazy as B
import           Data.Binary.Put

main :: IO ()
main = B.putStr $ runPut $ putInt32le 0x01234567



{-
$ runghc 2.2.put.hs | xxd
00000000: 6745 2301                                gE#.

-}

