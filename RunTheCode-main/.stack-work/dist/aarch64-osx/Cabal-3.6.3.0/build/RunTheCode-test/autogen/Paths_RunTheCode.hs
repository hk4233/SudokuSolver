{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_RunTheCode (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/Users/mayurreddysangepu/RunTheCode/RunTheCode/.stack-work/install/aarch64-osx/febdad4706f06af0b0f38f6b94427b647a666aed4d90800056d1372c7737d3b3/9.2.4/bin"
libdir     = "/Users/mayurreddysangepu/RunTheCode/RunTheCode/.stack-work/install/aarch64-osx/febdad4706f06af0b0f38f6b94427b647a666aed4d90800056d1372c7737d3b3/9.2.4/lib/aarch64-osx-ghc-9.2.4/RunTheCode-0.1.0.0-Hblg0J06CCl8yw3G9TLXiq-RunTheCode-test"
dynlibdir  = "/Users/mayurreddysangepu/RunTheCode/RunTheCode/.stack-work/install/aarch64-osx/febdad4706f06af0b0f38f6b94427b647a666aed4d90800056d1372c7737d3b3/9.2.4/lib/aarch64-osx-ghc-9.2.4"
datadir    = "/Users/mayurreddysangepu/RunTheCode/RunTheCode/.stack-work/install/aarch64-osx/febdad4706f06af0b0f38f6b94427b647a666aed4d90800056d1372c7737d3b3/9.2.4/share/aarch64-osx-ghc-9.2.4/RunTheCode-0.1.0.0"
libexecdir = "/Users/mayurreddysangepu/RunTheCode/RunTheCode/.stack-work/install/aarch64-osx/febdad4706f06af0b0f38f6b94427b647a666aed4d90800056d1372c7737d3b3/9.2.4/libexec/aarch64-osx-ghc-9.2.4/RunTheCode-0.1.0.0"
sysconfdir = "/Users/mayurreddysangepu/RunTheCode/RunTheCode/.stack-work/install/aarch64-osx/febdad4706f06af0b0f38f6b94427b647a666aed4d90800056d1372c7737d3b3/9.2.4/etc"

getBinDir     = catchIO (getEnv "RunTheCode_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "RunTheCode_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "RunTheCode_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "RunTheCode_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "RunTheCode_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "RunTheCode_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
