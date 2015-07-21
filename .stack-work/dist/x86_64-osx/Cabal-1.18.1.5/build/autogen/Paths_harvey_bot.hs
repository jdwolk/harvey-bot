module Paths_harvey_bot (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/jordaniel/projects/philosophie/internal/harvey-bot/.stack-work/install/x86_64-osx/lts-2.15/7.8.4/bin"
libdir     = "/Users/jordaniel/projects/philosophie/internal/harvey-bot/.stack-work/install/x86_64-osx/lts-2.15/7.8.4/lib/x86_64-osx-ghc-7.8.4/harvey-bot-0.1.0.0"
datadir    = "/Users/jordaniel/projects/philosophie/internal/harvey-bot/.stack-work/install/x86_64-osx/lts-2.15/7.8.4/share/x86_64-osx-ghc-7.8.4/harvey-bot-0.1.0.0"
libexecdir = "/Users/jordaniel/.cabal/libexec"
sysconfdir = "/Users/jordaniel/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "harvey_bot_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "harvey_bot_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "harvey_bot_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "harvey_bot_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "harvey_bot_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
