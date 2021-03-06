import XMonad
import XMonad.Layout.NoBorders
import XMonad.Hooks.ICCCMFocus
import XMonad.Hooks.DynamicLog
import XMonad.Util.Dmenu
import XMonad.Hooks.ServerMode
import XMonad.Actions.Commands

main = do
    xmonad =<< xmobar defaultConfig
        {borderWidth = 3,
         focusedBorderColor = "#ff000",
         logHook = takeTopFocus,
         layoutHook = myLayout,
         terminal="gnome-terminal",
         handleEventHook = serverModeEventHook,
         manageHook = mathematica <+> manageHook defaultConfig 
        }

myLayout = tiled ||| Mirror tiled ||| noBorders Full
    where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

mathematica = composeAll [(stringProperty "WM_CLASS") =? "XMathematica" --> doFloat]
