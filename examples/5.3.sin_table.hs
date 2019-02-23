
import qualified Data.ByteString.Lazy as B
import           Data.Int (Int32)
import           Data.Binary.Put

main :: IO ()
main = B.putStr table

table :: B.ByteString
table = runPut $ do
    mapM_ putRow [0, 15 .. 360]

putRow :: Int32 -> Put
putRow degree = do
    let radian = (fromIntegral degree / 360) * (2*pi)
    putInt32le degree
    putFloatle $ cos radian
    putFloatle $ sin radian



{-
$ runghc 5.3.sin_table.hs | xxd

-}

