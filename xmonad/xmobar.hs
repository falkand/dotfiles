Config {
   -- appearance
  font =         "xft:Fira Sans:size=14"
  , additionalFonts = [ "xft:Font Awesome:size=14" ]
  , bgColor = "#1f2430"
  , fgColor = "#e6e1cf"
  , position = Top

   -- layout
   , sepChar =  "%"   -- delineator between plugin names and straight text
   , alignSep = "}{"  -- separator between left-right alignment
--   , template = "%StdinReader% }{ %battery% | %multicpu% | %memory% * %swap% | %dynnetwork% | %kbd% | %date%"
   , template = "%StdinReader% }{ %battery% | %multicpu% | %memory% * %swap% | %dynnetwork% | %kbd% | %date%"      

   -- general behavior
   , lowerOnStart =     True    -- send to bottom of window stack on start
   , hideOnStart =      False   -- start with window unmapped (hidden)
   , allDesktops =      True    -- show on all desktops
   , overrideRedirect = True    -- set the Override Redirect flag (Xlib)
   , pickBroadest =     False   -- choose widest display (multi-monitor)
   , persistent =       True    -- enable/disable hiding (True = disabled)

   -- plugins
   --   Numbers can be automatically colored according to their value. xmobar
   --   decides color based on a three-tier/two-cutoff system, controlled by
   --   command options:
   --     --Low sets the low cutoff
   --     --High sets the high cutoff
   --
   --     --low sets the color below --Low cutoff
   --     --normal sets the color between --Low and --High cutoffs
   --     --High sets the color above --High cutoff
   --
   --   The --template option controls how the plugin is displayed. Text
   --   color can be set by enclosing in <fc></fc> tags. For more details
   --   see http://projects.haskell.org/xmobar/#system-monitor-plugins.
   , commands = 
        [
	        -- network activity monitor (dynamic interface resolution)
        Run DynNetwork     [ "--template" , "<dev>: <tx>kB/s|<rx>kB/s"
                             , "--Low"      , "1000"       -- units: B/s
                             , "--High"     , "5000"       -- units: B/s
                             , "--low"      , "green"
                             , "--normal"   , "orange"
                             , "--high"     , "red"
                             ] 10

        -- cpu activity monitor
        , Run MultiCpu       [ "--template" , "Cpu:<total0>|<total1>|<total2>|<total3>|<total4>|<total5>|<total6>|<total7>"
                             , "--Low"      , "50"         -- units: %
                             , "--High"     , "85"         -- units: %
                             , "--low"      , "green"
                             , "--normal"   , "orange"
                             , "--high"     , "red"
                             ] 10

        -- swap monitor
	, Run Swap	     [ "--template", "<usedratio>%"
	      		     ] 10

	-- xmonad panels
	, Run StdinReader

        -- cpu core temperature monitor
        , Run CoreTemp       [ "--template" , "Temp: <core0>°C|<core1>°C"
                             , "--Low"      , "70"        -- units: °C
                             , "--High"     , "80"        -- units: °C
                             , "--low"      , "green"
                             , "--normal"   , "orange"
                             , "--high"     , "red"
                             ] 50
                          
        -- memory usage monitor
        , Run Memory         [ "--template" ,"Mem:<usedratio>%"
                             , "--Low"      , "20"        -- units: %
                             , "--High"     , "90"        -- units: %
                             , "--low"      , "green"
                             , "--normal"   , "orange"
                             , "--high"     , "red"
                             ] 10

        -- battery monitor
        , Run Battery        [ "--template" , "Batt:<acstatus>"
                             , "--Low"      , "10"        -- units: %
                             , "--High"     , "80"        -- units: %
                             , "--low"      , "red"
                             , "--normal"   , "orange"
                             , "--high"     , "green"

                             , "--" -- battery specific options
                                       -- discharging status
                                       , "-o"	, "<left>% (<timeleft>)"
                                       -- AC "on" status
                                       , "-O"	, "<fc=#F44336>Charging</fc>"
                                       -- charged status
                                       , "-i"	, "<fc=#2196F3>Charged</fc>"
                             ] 50

        -- keyboard layout indicator
        , Run Kbd            [ ("ru"         , "<fc=#2196F3>RU</fc>")
                             , ("us"         , "<fc=#F44336>US</fc>")
                             ]
			     

        -- time and date indicator 
        --   (%F = y-m-d date, %a = day of week, %T = h:m:s time)
        , Run Date           "<fc=#FFFFFF>%F (%a) %T</fc>" "date" 10
	
	-- xmonad panels
        , Run StdinReader
        ]
   }
