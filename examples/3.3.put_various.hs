
{-# LANGUAGE OverloadedStrings #-}

import qualified Data.ByteString.Lazy as B
import           Data.Binary.Put

main :: IO ()
main = B.putStr bin

bin :: B.ByteString
bin = runPut $ do
    putInt32le    0x01234567
    putInt16le    0x55aa
    putWord16le   0xcafe
    putFloatle    1.0
    putDoublele   1.0
    putByteString "ABC"
    putWord8      0xff



{-
$ runghc 3.3.put_various.hs | xxd
00000000: 6745 2301 aa55 feca 0000 803f 0000 0000  gE#..U.....?....
00000010: 0000 f03f 4142 43ff                      ...?ABC.

-}

