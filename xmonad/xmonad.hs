import XMonad
import XMonad.Core
import XMonad.Actions.SpawnOn

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.UrgencyHook

import XMonad.Layout.NoBorders
import XMonad.Layout.Tabbed
import XMonad.Layout.TwoPane
import XMonad.Layout.Grid
import XMonad.Layout.AutoMaster

import XMonad.Util.Themes
import XMonad.Util.Scratchpad (scratchpadSpawnAction, scratchpadManageHook, scratchpadFilterOutWorkspace)

import qualified XMonad.StackSet as W
import qualified Data.Map as M

-- entry point
main = xmonad =<< xmobar (withUrgencyHook NoUrgencyHook $ myConfig)

myConfig = defaultConfig {
	  terminal	= myTerminal
        , borderWidth 	= 3
	, layoutHook 	= avoidStruts $ smartBorders (myLayout)
	, workspaces 	= myWorkspaces
        , modMask	= myMod
	, keys 		= myKeys
        , manageHook    = myManageHook
        }

-- win key
myMod = mod4Mask

-- terminal
myTerminal = "urxvt"

-- workspaces
myWorkspaces = ["1:web", "2:code", "3:chat", "4:pdf", "5:doc", "6:vbox" ,"7:games", "8:vid", "9:gimp"]

-- layouts
myLayout = noBorders Full ||| noBorders myTab ||| autoMaster 1 (1/100) Grid

myTab = tabbed shrinkText (theme smallClean)

-- hooks
-- automaticly switching app to workspace
myManageHook = scratchpadManageHook (W.RationalRect 0.25 0.375 0.5 0.35) <+> ( composeAll . concat $
        [[
          className =? "firefox" --> doShift "1:web"

        , className =? "eclipse" --> doShift "2:code"

        , className =? "Pidgin" --> doShift "3:chat"
        , className =? "Skype" --> doShift "3:chat"
        , title =? "irssi" --> doShift "3:chat"

        , className =? "Apvlv" --> doShift "4:pdf"
        , className =? "Epdfview" --> doShift "4:pdf"

        , className =? "OpenOffice.org 3.1" --> doShift "5:doc"

        , className =? "MPlayer" --> doShift "8:vid"

        , className =? "Gimp" --> doShift "9:gimp"

        , isFullscreen --> doFullFloat
        , isDialog --> doCenterFloat
        ]]) <+> manageDocks

-- keys
myKeys x = M.union (keys defaultConfig x) (M.fromList (newKeys x))

newKeys conf@(XConfig {XMonad.modMask = modm}) =
	[ ((modm, xK_q), spawn (xmonadPath ++ "--recompile; " ++ xmonadPath ++ "--restart"))
	]
	where xmonadPath = "/usr/bin/xmonad"

