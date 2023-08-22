--
-- zjgkkn's xmonad config
--
-- modules
import XMonad
import Data.Monoid
import System.Exit
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers

import XMonad.Layout.Grid
import XMonad.Layout.Spiral
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile
import XMonad.Layout.Dishes

import XMonad.Actions.WindowMenu
import XMonad.Actions.CycleWS

import XMonad.Util.Run
import XMonad.Config.Gnome

-- options
-- myTerminal      = "alacritty"
myTerminal      = "xfce4-terminal"
myModMask       = mod4Mask

-- style
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False
myBorderWidth   = 3
myNormalBorderColor  = "#000000"
myFocusedBorderColor = "#924d8b"
myXmobarTitleColor = "#fabd2f"
myXmobarLayoutColor = "#fe8019"
myTextColor = "#fdf4c1"
myNonFocusedTextColor = "#7c6f64"

-- layouts
-- myLayout = avoidStruts $ smartBorders (mosaic 4 [2,3])
myLayout = avoidStruts $ smartBorders (tiled ||| Mirror tiled ||| noBorders Full ||| Grid ||| spiral (6/7))
  where
    tiled   = Tall nmaster delta ratio
    nmaster = 1
    ratio   = 1/2
    delta   = 3/100

-- workspaces
myWorkspaces = map show [1..9]

-- Key bindings. Add, modify or remove key bindings here.
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
  -- apps
  [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
  , ((modm .|. shiftMask, xK_l     ), spawn "i3lock")
  , ((modm,               xK_u     ), spawn "thunar")
  , ((modm,               xK_p     ), spawn "rofi -show drun -show-icons")
  , ((modm,               xK_o     ), spawn "rofi -show window")
  , ((modm,               xK_v     ), spawn "clipmenu")
  , ((modm,               xK_d     ), spawn "xrandr --auto")
  
  -- window management
  , ((modm .|. shiftMask, xK_c     ), kill)
  , ((modm,               xK_space ), sendMessage NextLayout)
  , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
  , ((modm,               xK_n     ), refresh)
  , ((modm,               xK_Tab   ), windows W.focusDown)
  , ((modm,               xK_j     ), windows W.focusDown)
  , ((modm,               xK_k     ), windows W.focusUp  )
  , ((modm,               xK_m     ), windows W.focusMaster  )
  , ((modm,               xK_Return), windows W.swapMaster)
  , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )
  , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )
  , ((modm,               xK_h     ), sendMessage Shrink)
  , ((modm,               xK_l     ), sendMessage Expand)
  , ((modm,               xK_t     ), withFocused $ windows . W.sink)
  , ((modm,               xK_comma ), sendMessage (IncMasterN 1))
  , ((modm,               xK_period), sendMessage (IncMasterN (-1)))
  , ((modm,               xK_Left  ), prevWS)
  , ((modm,               xK_Right ), nextWS)
  , ((modm              , xK_b     ), sendMessage ToggleStruts)

  -- Xmonad
  , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
  , ((modm,               xK_q     ), spawn "xmonad --recompile; xmonad --restart")
  ]
    ++

  -- mod-[1..9], Switch to workspace N
  -- mod-shift-[1..9], Move client to workspace N
  [((m .|. modm, k), windows $ f i)
  | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
  , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
  ++

  -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
  -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
  [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
  | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
  , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


-- Mouse bindings: default actions bound to mouse events
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
  -- mod-button1, Set the window to floating mode and move by dragging
  [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                             >> windows W.shiftMaster))
  -- mod-button2, Raise the window to the top of the stack
  , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
  
  -- mod-button3, Set the window to floating mode and resize by dragging
  , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                             >> windows W.shiftMaster))
  -- you may also bind events to the mouse scroll wheel (button4 and button5)
  ]

-- Window rules:
myManageHook = composeAll
  [ manageDocks
  , isFullscreen --> doFullFloat]

-- Event handling
myEventHook = handleEventHook def <+> fullscreenEventHook <+> docksEventHook <+> ewmhDesktopsEventHook
  
-- Startup hook
myStartupHook = do
  setWMName "LG3D"

-- main
main = do
  xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmonad/xmobar.hs"
  xmonad $ ewmh defaults {
    logHook = dynamicLogWithPP $ xmobarPP
      { ppOutput = hPutStrLn xmproc
      , ppTitle = xmobarColor myXmobarTitleColor "" . shorten 75
      , ppLayout = xmobarColor myXmobarLayoutColor ""
      , ppCurrent = xmobarColor myTextColor ""
      , ppHidden = xmobarColor myNonFocusedTextColor ""
      }
    }

-- Config
defaults = def {
  terminal           = myTerminal,
  focusFollowsMouse  = myFocusFollowsMouse,
  borderWidth        = myBorderWidth,
  modMask            = myModMask,
  workspaces         = myWorkspaces,
  normalBorderColor  = myNormalBorderColor,
  focusedBorderColor = myFocusedBorderColor,
  keys               = myKeys,
  mouseBindings      = myMouseBindings,
  layoutHook         = myLayout,
  manageHook         = myManageHook,
  handleEventHook    = myEventHook,
  startupHook        = myStartupHook
  }
