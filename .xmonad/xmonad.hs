import XMonad
import System.IO
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.Run
import XMonad.Util.Run(spawnPipe)
import XMonad.Layout
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.NoBorders
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce
import XMonad.Actions.UpdatePointer
colorBlue      = "#868bae"
colorGreen     = "#00d700"
colorRed       = "#ff005f"
colorGray      = "#666666"
colorWhite     = "#bdbdbd"
colorNormalbg  = "#1c1c1c"
colorfg        = "#a8b6b8"
main :: IO ()
main=do
  xproc <- spawnPipe "xmobar"
  xmonad $ ewmh $ docks $ def
    { 
    terminal = "urxvtc",
    manageHook = manageDocks <+>(isFullscreen --> doFullFloat)<+> manageHook def,
    layoutHook = toggleLayouts (noBorders Full) $ avoidStruts $ layoutHook def,
    handleEventHook = fullscreenEventHook <+> handleEventHook def,
    startupHook = myStartupHook,
    logHook = myLogHook xproc
                >> updatePointer (0.5, 0.5) (0, 0)
    }
    `additionalKeysP`
    [
      ("M-f", sendMessage ToggleLayout),
      ("M-v", spawn "urxvtc -e nvim"),
      ("M4-e", spawn "urxvtc -e ranger"),
      ("M4-b", spawn "chromium"),
      ("M4-l", spawn "i3lock -n -i ~/Downloads/gopherbw.png"),
      ("<XF86AudioRaiseVolume>", spawn "sound_volume_change_wrapper.sh +"),
      ("<XF86AudioLowerVolume>", spawn "sound_volume_change_wrapper.sh -"),
      ("<XF86AudioMute>", spawn "sound_volume_change_wrapper.sh m"),
      ("<XF86MonBrightnessUp>", spawn "light -A 5"),
      ("<XF86MonBrightnessDown>", spawn "light -U 5")
    ]

myStartupHook = do
  spawnOnce "stalonetray"
  spawnOnce "slack"
  spawnOnce "enpass"
myLogHook h = dynamicLogWithPP $ wsPP { ppOutput = hPutStrLn h }
wsPP = xmobarPP {
                ppOrder           = \(ws:l:t:_)  -> [ws,t]
                , ppCurrent         = xmobarColor colorRed     colorNormalbg . \s -> "●"
                , ppUrgent          = xmobarColor colorGray    colorNormalbg . \s -> "●"
                , ppVisible         = xmobarColor colorRed     colorNormalbg . \s -> "◎"
                , ppHidden          = xmobarColor colorGray    colorNormalbg . \s -> "●"
                , ppHiddenNoWindows = xmobarColor colorGray    colorNormalbg . \s -> "○"
                , ppTitle           = xmobarColor colorRed     colorNormalbg
                , ppOutput          = putStrLn
                , ppWsSep           = " "
                , ppSep             = "  "
}
