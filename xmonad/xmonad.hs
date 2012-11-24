import XMonad
import XMonad.Core
import XMonad.Actions.SpawnOn

import XMonad.Config.Gnome

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.UrgencyHook

import XMonad.Layout.NoBorders
import XMonad.Layout.Tabbed
import XMonad.Layout.TwoPane
import XMonad.Layout.Grid as G
import XMonad.Layout.AutoMaster

import XMonad.Util.Themes
import XMonad.Util.EZConfig

import XMonad.Prompt
import XMonad.Prompt.Window

main = xmonad myConfig

myConfig = gnomeConfig {
	  terminal	= myTerminal
        , borderWidth 	= 3
	, layoutHook 	= avoidStruts $ smartBorders (myLayout)
	, workspaces 	= myWorkspaces
        , modMask	= myMod
        , manageHook    = myManageHook
        } `additionalKeysP` myKeysP

-- win key
myMod = mod4Mask

-- terminal
myTerminal = "urxvt"

-- workspaces
myWorkspaces = ["1:web", "2:code", "3:chat", "4:pdf", "5:doc", "6:vbox" ,"7:games", "8:vid", "9:gimp"]

-- layouts
myLayout = noBorders Full ||| noBorders myTab ||| autoMaster 1 (1/100) G.Grid ||| Tall 1 (3/100) (2/3)

myTab = tabbed shrinkText (theme smallClean)

myManageHook = composeAll [
      manageHook gnomeConfig
    , isFullscreen --> doFullFloat
    ]

myKeysP =
  [
     -- meta p spawns dmenu
     ("M-p", spawn "exe=`dmenu_path | dmenu` && eval \"exec $exe\"")
     -- go to window prompt
     , ("M-S-g", windowPromptGoto defaultXPConfig { autoComplete = Just 500000 })
 ]
