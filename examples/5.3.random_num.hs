
import qualified Data.ByteString.Lazy as B
import           Data.Binary.Put
import           Control.Monad (replicateM)
import           System.Random (randomRIO)

main :: IO ()
main = do
    xs <- numbers
    B.putStr $ bin xs

numbers :: IO [Double]
numbers = replicateM 16 $ randomRIO (-1, 1)

bin :: [Double] -> B.ByteString
bin xs = runPut $ mapM_ putDoublele xs



{-
$ runghc 5.3.random_num.hs | xxd

-}

