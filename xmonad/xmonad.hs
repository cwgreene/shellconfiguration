import XMonad
import XMonad.Layout.NoBorders
import XMonad.Hooks.ICCCMFocus
import XMonad.Hooks.DynamicLog

main = do
    xmonad =<< xmobar defaultConfig
        {borderWidth = 3,
         focusedBorderColor = "#ff000",
         logHook = takeTopFocus,
         layoutHook = myLayout,
         terminal="gnome-terminal"}

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

