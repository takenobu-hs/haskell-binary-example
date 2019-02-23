
import qualified Data.ByteString.Lazy as B
import           Data.Binary.Put

main :: IO ()
main = B.putStr bin

val :: Int
val = -3

bin :: B.ByteString
bin = runPut $ do
    putInt64le (fromIntegral val)



{-
$ runghc 3.5.put_int.hs | xxd
00000000: fdff ffff ffff ffff                      ........

-}

