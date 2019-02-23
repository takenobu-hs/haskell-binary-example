
import qualified Data.ByteString.Lazy as B
import           Data.Binary.Put

main :: IO ()
main = B.putStr bin

bin :: B.ByteString
bin = runPut $ do
    mapM_ putFloatle (map sin [0, (pi/16) .. (pi/2)])



{-
$ runghc 3.4.put_list_sin.hs | xxd
00000000: 0000 0000 c2c5 473e 16ef c33e da39 0e3f  ......G>...>.9.?
00000010: f304 353f 32db 543f 5e83 6c3f bf14 7b3f  ..5?2.T?^.l?..{?
00000020: 0000 803f                                ...?

-}

