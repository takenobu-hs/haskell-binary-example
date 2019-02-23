
import qualified Data.ByteString.Lazy as B
import           Data.Binary.Get

main :: IO ()
main = do
    x <- B.getContents
    print $ runGet getWord8 x



{-
$ echo "A" | runghc 2.3.get.hs
65

$ echo -ne '\xFF' | runghc 2.3.get.hs
255
-}

