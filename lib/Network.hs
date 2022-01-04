module Network where

import Control.Monad
import Control.Concurrent
import Network.Socket hiding     (recv)
import Network.Socket.ByteString

serve = do
  addrinfos <- getAddrInfo Nothing (Just "0.0.0.0") (Just "7000")
  let serveraddr = head addrinfos
  sock <- socket (addrFamily serveraddr) Datagram defaultProtocol
  bind sock (addrAddress serveraddr)
  setSocketOption sock ReuseAddr 1
  forever (do recv sock 4096 >>= print)
