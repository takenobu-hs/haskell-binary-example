
{-# LANGUAGE OverloadedStrings #-}

import qualified Data.ByteString.Lazy as B
import           Data.Binary.Put

main :: IO ()
main = B.putStr image

image :: B.ByteString
image = runPut $ do
    putByteString "P5\n#\n16 16\n255\n"
    mapM_ putWord8 [0,1..255]



{-
$ runghc 5.3.image_pgm.hs > image.pgm

-}

