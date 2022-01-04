module Threads where

import Control.Concurrent
import Control.Monad
import System.IO


threads = do
  forkIO $ replicateM_ 100 (putChar 'A')
  replicateM_ 100 (putChar 'B')
