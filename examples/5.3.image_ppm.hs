
{-# LANGUAGE OverloadedStrings #-}

import qualified Data.ByteString.Lazy as B
import           Data.Binary.Put

main :: IO ()
main = B.putStr image

image :: B.ByteString
image = runPut $ do
    putByteString "P6\n#\n16 16\n255\n"
    mapM_ putWord8 pixels


pixels = interleave3 r g b

r = [0..255]
g = replicate 256 0
b = [255,254..0]

interleave3 [] _ _ = []
interleave3 (r:rs) (g:gs) (b:bs) = r:g:b:interleave3 rs gs bs



{-
$ runghc 5.3.image_ppm.hs > image.ppm

-}

