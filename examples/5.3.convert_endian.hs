
import qualified Data.ByteString.Lazy as B
import           Control.Monad (replicateM)
import           Data.Binary.Get
import           Data.Binary.Put

main :: IO ()
main = do
    x <- B.getContents
    B.putStr $ putLe $ getBe x

getBe :: B.ByteString -> [Float]
getBe = runGet $ replicateM 3 getFloatbe

putLe :: [Float] -> B.ByteString
putLe xs = runPut $ mapM_ putFloatle xs


-- test data
testData :: B.ByteString
testData = runPut $ do
    mapM_ putFloatbe [1..3]

{-
% ghci 5.3.convert_endian.hs
ghci> getBe testData
[1.0,2.0,3.0]

$ xxd z.big
00000000: 3f80 0000 4000 0000 4040 0000            ?...@...@@..

$ runghc 5.3.convert_endian.hs < test.dat | xxd
00000000: 0000 803f 0000 0040 0000 4040            ...?...@..@@

-}

