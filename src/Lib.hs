{-# LANGUAGE OverloadedLabels  #-}
{-# LANGUAGE OverloadedLists   #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}

module Lib
    ( hello
    ) where

import qualified GI.Gtk as Gtk
import Data.GI.Base

hello :: IO ()
hello = do
  Gtk.init Nothing

  win <- new Gtk.Window [ #title := "こんにちは" ]
  on win #destroy Gtk.mainQuit
  button <- new Gtk.Button [ #label := "Click me"]
  on button #clicked (set button [ #sensitive := False
                                 , #label := "Thanks for clicking me" ])
  #add win button
  #showAll win
  Gtk.main
