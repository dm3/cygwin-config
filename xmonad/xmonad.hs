import XMonad
import XMonad.Core

import XMonad.Actions.SpawnOn
import XMonad.Actions.Submap

import XMonad.Config.Gnome

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.SetWMName

import XMonad.Layout.NoBorders
import XMonad.Layout.Tabbed
import XMonad.Layout.TwoPane
import XMonad.Layout.Grid as G
import XMonad.Layout.AutoMaster

import XMonad.StackSet(RationalRect(..))

import XMonad.Util.Themes
import XMonad.Util.EZConfig

import XMonad.Prompt
import XMonad.Prompt.Window
import XMonad.Prompt.Shell

import Data.List
import qualified Data.Map as M

main = xmonad myConfig

myConfig = gnomeConfig {
    terminal= myTerminal
        , borderWidth = 2
        , layoutHook = avoidStruts $ smartBorders (myLayout)
        , workspaces = myWorkspaces
        , modMask = myMod
        , manageHook = myManageHook
        -- startup hook makes xmonad.desktop fail to be recognized, however
        -- java GUI apps are grey rectangles without the setWMName
        , startupHook = setWMName "LG3D"
} `additionalKeysP` myKeysP

-- win key
myMod = mod4Mask

-- terminal
myTerminal = "urxvtcd"

-- workspaces
myWorkspaces = ["1:web", "2:code", "3:chat", "4:pdf", "5:doc", "6:vbox" ,"7:games", "8:vid", "9:gimp"]

-- layouts
myLayout = noBorders Full ||| noBorders myTab ||| autoMaster 1 (1/100) G.Grid ||| Tall 1 (3/100) (2/3)

myTab = tabbed shrinkText (theme smallClean)
myManageHook = composeAll [
      manageHook gnomeConfig,
      isFullscreen --> doFullFloat,
      isDialog --> doCenterFloat
    ]

myKeysP = [
     -- spawn dmenu
     ("M-p", spawn "dmenu_run")
     -- go to window prompt
     , ("M-S-g", windowPromptGoto defaultXPConfig { autoComplete = Just 500000 })
     -- control mpc
     , ("M-m", submap . M.fromList $
        [ ((0, xK_n),     spawn "mpc next")
        , ((0, xK_p),     spawn "mpc prev")
        , ((0, xK_r),     spawn "mpc random")
        , ((0, xK_space), spawn "mpc toggle")
        , ((0, xK_s),     spawn "mpc | xmessage -file - -timeout 3")
        ])
     -- input language
     , ("M-/", submap . M.fromList $
        [ ((0, xK_Left),     spawn "setxkbmap us")
        , ((0, xK_Down),     spawn "setxkbmap lt")
        , ((0, xK_Right),    spawn "setxkbmap ru -variant phonetic")
        ])
    ]
