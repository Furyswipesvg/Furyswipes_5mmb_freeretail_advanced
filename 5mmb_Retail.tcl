set version 122823_retail
lappend auto_path twapi
package require twapi_input
set kb [string tolower [twapi::get_keyboard_layout_name]]
puts ""
puts "Welcome to multiboxing, sucka!"
puts ""
puts "USING 5MMB_retail.TCL VERSION $version"
puts "=============================================="
puts "My keyboard layout is $kb"
puts "If shared mouseclicks don't automatically work using key "
puts "to the left of 1, give this key code to Furyswipes"
set display [twapi::get_display_size]
array unset toons
array unset autodelete
array unset levelingparty
set winswapkeys "NumpadEnd NumpadDown NumpadPgDn NumpadLeft Clear NumpadRight NumpadHome NumpadUp NumpadPgUp NumpadInsert"
set dontsoulstone ""
set hideframes ""
set fixunused ""
set dontflashframe ""
set useautotrade ""
set dontautodelete ""
set dontbuystacks ""
set dontautopass ""
set autoturn ""
set nomacros ""
set clearcastmissiles ""
set warlockpet ""
set healhellfireat ""
set healtankat ""
set healchumpat ""
set healselfat ""
set maxheal "11 11 11 11"
set clique_overlay ""
set raidname "myraid1"
set gazefollow ""
set burningfollow ""
set dedicated_healers ""
set powerleveler ""
set monitor ""
set use2monitors false
set openlevelers ""
set shiftlevelers ""
set ctrllevelers ""
set goldto ""
set boeto ""
array set kb_oem "00000409 oem3"
array set kb_oem "00000407 oem5"
array set kb_oem "00000406 oem5"
array set kb_oem "00000809 oem7"
array set kb_oem "0000041d oem5"
array set kb_oem "00000414 oem5"
set oem $kb_oem($kb)
set HKN 5mmb_HKN_retail.txt
set SME "Interface\\Addons\\Furyswipes_5mmb\\Furyswipes_5mmb.lua"
#set SME SM_Extend.lua
set fail false
set toonlistf [lindex $argv 0]
if { $toonlistf == "" } { set toonlistf toonlist.txt } 
if { ! [file exist $toonlistf ] } {
	puts "ERROR: YOU MUST HAVE A FILE NAMED $toonlistf IN THIS DIRECTORY"
	puts ""
	puts "FORMAT OF FILE:"
	puts "# <-this is a comment. It is ignored by the program"
	puts "You need to specify your multibox accounts with 5 words starting with box"
	puts "box <accountname> <password> <toon name> <role>"
	puts "Role can be tank / melee/ caster / hunter /healer"
	puts "EVERY TOON must have a role"
	puts "Windows for the toons will come out on the screen in the order you list them."
	puts "Tanks will get bigger windows, if possible"
	return
}
if { ! [file exist "wow.exe" ] && ! [file exist "Wow.exe"] } {
	puts "ERROR: THIS PROGRAM MUST BE THE DIRECTORY WHERE YOUR WOW.EXE resides"
	return
}
set nohotkeyoverwrite false
set nosmoverwrite false
if { $fail } { puts "hit any key to return" ; gets stdin char ; return }
set tL [open $toonlistf r]
if { [set tL [open $toonlistf r]] != "" } {
  puts "Found toonlist $toonlistf"
} else {
  puts "ERROR: Could not open $toonlistf in read mode."
}
#if { [file exist $HKN] } {
#  puts "DO YOU WANT TO OVERWRITE $HKN ?"
#  puts "You should back this file up first."
#  puts "ARE YOU SURE YOU WANT TO OVERWRITE $HKN? y/n"
#  gets stdin char
#  if { $char!="Y" && $char!="y" } {
#    puts "File won't be changed."
#    set nohotkeyoverwrite true
#    puts "hit enter to continue" ; gets stdin char
#  }
#}
#if { [file exist $SME] } {
#  puts "DO YOU WANT TO OVERWRITE $SME ?"
#  puts "You should back this file up first."
#  puts "ARE YOU SURE YOU WANT TO OVERWRITE $SME? y/n"
#  gets stdin char
#  if { $char!="Y" && $char!="y" } {
#    puts "File won't be changed."
#	set nosmoverwrite true
#    puts "hit enter to contineue" ; gets stdin char
#  }
#}
set numtoons 0
while { [gets $tL line] >= 0 } {
  set line [regsub "\n" $line "" ]
  if { $line == "" } { continue }
  set line [string trim $line] 
  if { [string index $line 0] != "#" } {
    if { [string tolower [lindex $line 0]] == "box" } {
      if { [llength $line] < 6 } { puts "ERROR: box takes 5 or 6 arguments in toonlist line $line" ; puts "hit any key to return" ; gets stdin char ; return }
      #if { $numtoons==5 } { puts "ERROR: Only 5 box commands per toonlist for now." ; return }
      set bnet_account [lindex $line 1] 
      set passwd [lindex $line 2] 
      set license [lindex $line 3]
      set name [lindex $line 4] 
      set role [lindex $line 5] 
      set raidletters [string tolower [lrange $line 6 end]]
      set raids ""
      foreach userraid $raidletters { 
        regexp {([a-z]|)([0-9])?} $userraid match userraid cpunum
        if { $cpunum=="" } { set cpunum 1 } 
        lappend raids ${userraid}${cpunum}     
      }
      if { ! [regexp m $raids]  } { lappend raids m1 }
      set toons($numtoons) "$bnet_account $license $passwd $name $role $raids"
      incr numtoons
    } elseif { [string tolower [lindex $line 0]] == "keyboard" } {
     if { [llength $line] != 2 } { puts "ERROR: incorrect number of elements line $line" ; puts "hit any key to return" ; gets stdin char ; return }
     set keyboard [lindex $line 1] 
     if { $keyboard !="us" && $keyboard !="uk" && $keyboard !="de" && $keyboard !="other" }  { puts "ERROR: keyboard choices are us/uk/de/other" ; return }
     if { $keyboard=="de" } {
       set oem "oem5"
     } elseif { $keyboard=="other" } {
       set oem "oem7"
     } elseif { $keyboard=="uk" } {
       set oem "oem8"
     } else {
       set oem "oem3"
     }
   } elseif { [string tolower [lindex $line 0]] == "monitor" } {
 		  	if { [llength $line] != 2 } { puts "ERROR: incorrect number of elements line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set monitor [lindex $line 1] 
				if { $monitor !="1280x1024" && $monitor !="1920x1080" && $monitor !="2560x1440" && $monitor !="3360x1440" && $monitor !="3840x2160" }  { puts "ERROR: monitor choices are 1280x1024/1920x1080/2560x1440/3360x1440/3840x2160" ; return }
    } elseif { [string tolower [lindex $line 0]] == "computer" } {
 		  	if { [llength $line] != 3 } { puts "ERROR: incorrect number of elements line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set computer([lindex $line 1]) [lindex $line 2]
    } elseif { [string tolower [lindex $line 0]] == "raidname" } {
 		  	if { [llength $line] != 2 } { puts "ERROR: incorrect number of elements line $line" ; puts "hit any key to return" ; gets stdin char ; return }
 		  	if { [llength [lindex $line 1]] > 1 } { puts "ERROR: arg must be one name $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set raidname [lindex $line 1]
    } elseif { [string tolower [lindex $line 0]] == "powerleveler" } {
 		  	if { [llength $line] != 2 } { puts "ERROR: incorrect number of elements line $line" ; puts "hit any key to return" ; gets stdin char ; return }
 		  	if { [llength [lindex $line 1]] > 1 } { puts "ERROR: arg must be one name $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set powerleveler [lindex $line 1]
    } elseif { [string tolower [lindex $line 0]] == "bombfollow" } {
 		  	if { [llength $line] != 2 } { puts "ERROR: incorrect number of elements line $line" ; puts "hit any key to return" ; gets stdin char ; return }
 		  	if { [llength [lindex $line 1]] > 1 } { puts "ERROR: arg must be one name $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set bombfollow [lindex $line 1]
    } elseif { [string tolower [lindex $line 0]] == "gazefollow" } {
 		  	if { [llength $line] != 2 } { puts "ERROR: incorrect number of elements line $line" ; puts "hit any key to return" ; gets stdin char ; return }
 		  	if { [llength [lindex $line 1]] > 1 } { puts "ERROR: arg must be one name $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set gazefollow [lindex $line 1]
    } elseif { [string tolower [lindex $line 0]] == "burningfollow" } {
 		  	if { [llength $line] != 2 } { puts "ERROR: incorrect number of elements line $line" ; puts "hit any key to return" ; gets stdin char ; return }
 		  	if { [llength [lindex $line 1]] > 1 } { puts "ERROR: arg must be one name $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set burningfollow [lindex $line 1]
    } elseif { [string tolower [lindex $line 0]] == "dedicated_healers" } {
 		  	if { [expr ([llength $line]-1) % 2] } { puts "ERROR: must be sequence of paired tank and healer $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set dedicated_healers [lrange $line 1 end]
    } elseif { [string tolower [lindex $line 0]] == "goldto" } {
 		  	if { [llength $line] != 2 } { puts "ERROR: incorrect number of elements line $line" ; puts "hit any key to return" ; gets stdin char ; return }
 		  	if { [llength [lindex $line 1]] > 1 } { puts "ERROR: arg must be one name $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set goldto [lindex $line 1]
    } elseif { [string tolower [lindex $line 0]] == "boeto" } {
 		  	if { [llength $line]  < 2 } { puts "ERROR: incorrect number of elements line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set boeto [lrange $line 1 end]
    } elseif { [string tolower [lindex $line 0]] == "itemto" } {
 		  	if { [llength $line] < 3 } { puts "ERROR: incorrect number of elements line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set itemto([lindex $line 1]) [lrange $line 2 end]
    } elseif { [string tolower [lindex $line 0]] == "maxheal" } {
 		  	if { [llength $line] != 5 } { puts "ERROR: incorrect number of elements line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set maxheal [lrange $line 1 end]
    } elseif { [string tolower [lindex $line 0]] == "clique_overlay" } {
 		  	if { [llength $line] != 5 } { puts "ERROR: incorrect number of elements line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set clique_overlay [lrange $line 1 end]
    } elseif { [string tolower [lindex $line 0]] == "dontautodelete" } {
 		  	if { [llength $line] != 1 } { puts "ERROR: should be only one element on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set dontautodelete true
    } elseif { [string tolower [lindex $line 0]] == "dontsoulstone" } {
 		  	if { [llength $line] != 1 } { puts "ERROR: should be only one element on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set dontsoulstone true
    } elseif { [string tolower [lindex $line 0]] == "hideframes" } {
 		  	if { [llength $line] != 1 } { puts "ERROR: should be only one element on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set hideframes true
				 } elseif { [string tolower [lindex $line 0]] == "fixunused" } {
 		  	if { [llength $line] != 1 } { puts "ERROR: should be only one element on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set fixunused true
    } elseif { [string tolower [lindex $line 0]] == "dontflashframe" } {
 		  	if { [llength $line] != 1 } { puts "ERROR: should be only one element on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set dontflashframe true
    } elseif { [string tolower [lindex $line 0]] == "use2monitors" } {
 		  	if { [llength $line] != 1 } { puts "ERROR: should be only one element on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set use2monitors true
    } elseif { [string tolower [lindex $line 0]] == "useautotrade" } {
 		  	if { [llength $line] != 1 } { puts "ERROR: should be only one element on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set useautotrade true
    } elseif { [string tolower [lindex $line 0]] == "dontbuystacks" } {
 		  	if { [llength $line] != 1 } { puts "ERROR: should be only one element on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set dontbuystacks true
    } elseif { [string tolower [lindex $line 0]] == "dontautopass" } {
 		  	if { [llength $line] != 1 } { puts "ERROR: should be only one element on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set dontautopass true
    } elseif { [string tolower [lindex $line 0]] == "autoturn" } {
 		  	if { [llength $line] != 1 } { puts "ERROR: should be only one element on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set autoturn true
    } elseif { [string tolower [lindex $line 0]] == "nomacros" } {
 		  	if { [llength $line] != 1 } { puts "ERROR: should be only one element on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set nomacros true
    } elseif { [string tolower [lindex $line 0]] == "clearcastmissiles" } {
 		  	if { [llength $line] != 1 } { puts "ERROR: should be only one element on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set clearcastmissiles true
    } elseif { [string tolower [lindex $line 0]] == "warlockpet" } {
 		  	if { [llength $line] != 2 } { puts "ERROR: should be only two elements on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set warlockpet [lindex $line 1]
    } elseif { [string tolower [lindex $line 0]] == "healhellfireat" } {
 		  	if { [llength $line] != 2 } { puts "ERROR: should be only two elements on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set healhellfireat [lindex $line 1]
    } elseif { [string tolower [lindex $line 0]] == "healtankat" } {
 		  	if { [llength $line] != 2 } { puts "ERROR: should be only two elements on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set healtankat [lindex $line 1]
    } elseif { [string tolower [lindex $line 0]] == "healchumpat" } {
 		  	if { [llength $line] != 2 } { puts "ERROR: should be only two elements on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set healchumpat [lindex $line 1]
    } elseif { [string tolower [lindex $line 0]] == "healchumpat" } {
 		  	if { [llength $line] != 2 } { puts "ERROR: should be only two elements on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set healchumpat [lindex $line 1]
    } elseif { [string tolower [lindex $line 0]] == "healselfat" } {
 		  	if { [llength $line] != 2 } { puts "ERROR: should be only two elements on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set healselfat [lindex $line 1]
    } elseif { [string tolower [lindex $line 0]] == "autodelete" } {
 		  	if { [llength $line] < 3 } { puts "ERROR: incorrect number of elements line $line" ; puts "hit any key to return" ; gets stdin char ; return }
 		  	if {  [expr ([llength $line ]-1) % 2] } { puts "ERROR: must be even number of elements after command $line" ; puts "hit any key to return" ; gets stdin char ; return }
				foreach {item stack} [lrange $line 1 end] {
					set autodelete($item) $stack
				}
    } elseif { [string tolower [lindex $line 0]] == "levelingparty" } {
 		  	if { [llength $line] < 2 || [llength $line] > 6  } { puts "ERROR: incorrect number of elements line $line. Must be between one and 5 toon names" ; puts "hit any key to return" ; gets stdin char ; return }
	      set sql [string totitle [ string tolower [lindex $line 1]]]
				set sqmem [lrange $line 2 end]
				set levelingparties($sql) $sqmem
    } elseif { [string tolower [lindex $line 0]] == "raidorder10" } {
 		  	if { [llength [lindex $line 1]] >11 } { puts "ERROR: second arg must 10 or less names $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set index [expr [array size raidorder10] + 1]
				set raidorder10($index) [lrange $line 1 end]
    } elseif { [string tolower [lindex $line 0]] == "raidorder20" } {
 		  	if { [llength [lindex $line 1]] >21 } { puts "ERROR: second arg must 20 or less names $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set index [expr [array size raidorder20] + 1]
				set raidorder20($index) [lrange $line 1 end]
    } elseif { [string tolower [lindex $line 0]] == "raidorder40" } {
 		  	if { [llength [lindex $line 1]] >41 } { puts "ERROR: second arg must 40 or less names $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set index [expr [array size raidorder40] + 1]
				set raidorder40($index) [lrange $line 1 end]
    }
  }
}
if { ! [info exists computer(1) ] } { set computer(1) Local }
if $numtoons==0 { 
  puts "ERROR: No box commands with toon names were found in $toonlistf. "
  puts "SEE toonlist_command_reference.txt"
  puts "hit any key to return" ; gets stdin char ; return
}
set tooncount $numtoons
close $tL 
puts "Detected display size $display"
if { $monitor != "" } { 
	puts "Automatic monitor selection overridden by user to $monitor"
} else {
	set sizes "1280x1024 1920x1080 2560x1440 3360x1440 3840x2160"
	foreach size $sizes {
		regexp "(\\d+)" $size match x
		regexp "x(\\d+)" $size match y
		if { [lindex $display 0] >= $x && [lindex $display 1] >= $y } {
			set monitor $size
		}
	}
	puts "Monitor automatically set to $monitor"
}
#while { $tooncount >= 1 } {
  #incr tooncount -1
  #puts $toons($tooncount)
  #set account [lindex $toons($tooncount) 0]
  #puts "Account $account has license [lindex $toons($tooncount) 1]"
  #puts "Account $account has password [lindex $toons($tooncount) 2]"
  #set name [string tolower [lindex $toons($tooncount) 3]]
  #set name [string totitle $name ]
  #puts "Account $account has toon name $name"
  #puts "Account $account has role [ string tolower [lindex $toons($tooncount) 4]]"
  #puts "Account $account has raids [lrange $toons($tooncount) 5 end]"
#}
if { ! $nohotkeyoverwrite } {
	set hK [open $HKN w+]
	puts $hK "// Version $version"
	puts $hK {// Comments begin with //. They don't do anything in the script.

// These are window labels. Kind of like nicknames for long window names.}
#<SetActiveWindowTrackingDelay 175>
#<SetActiveWindowTracking on>

	set totallabels 0
	for { set i 0 } { $i<[array size toons] } { incr i } {
	  set toonname [string tolower [lindex $toons($i) 3]]
	  set account [lindex $toons($i) 1]
	  set raids [lrange $toons($i) 5 end]
		set comps 1
		foreach myraid $raids {
			regexp {([a-z]|[A-Z])([0-9])?} $myraid match foo cpunum
			if { [lsearch $comps $cpunum] == -1 } { lappend comps $cpunum } 
		}
	  set length [string length $account]
		foreach mycomp $comps {
	  	if { $length > 2 } {
	    	set length [string length $account]
	    	set acctnick "[string index $account 0][string index $account [expr $length-2]][string index $account [expr $length-1]]"
	  	} else {
	    	set acctnick ${account}
	  	}
	  	set acct_winname($account) ${acctnick}
		#puts "acct_winname for $account is $acct_winname($account)"
	  	puts $hK "  <Label w${totallabels} $computer($mycomp) SendWinM ${toonname}_${mycomp}${acctnick}>"
			incr totallabels
		}
	}
	puts $hK ""
	puts $hK {// The above labels are your window names.
// They are like the "address" to your windows. They contain which 
// computer to send the hotkey to, if you are using multiple machines. (you can!)
// So in this case, w0 will be used later to point to Mootalia's window.
// Name your windows something that gives you a hint.
// Toon name and a hint at the end about what wow license to click
// It's not critical, but it's very helpful
// This is the main launcher command definition.
  <Command LaunchAndRename>
	<SendPC %1%>}
	set curdir [pwd]
if { $fixunused=="" } { 
	puts -nonewline $hK {	<Run "}
	puts $hK "$curdir/Wow.exe\" >"
	puts $hK {	<TargetWin "World of Warcraft">  
	<TargetWin "World of Warcraft">
	<RenameTargetWin %2%>
	<Wait 300>}
if { $hideframes=="true" } {
	puts $hK "\t<RemoveWinFrame>"
}
puts $hK {	<SetWinSize %5% %6%>
	<SetWinPos %7% %8%>
	<SetForegroundWin>
	<Text %3%>
	<Key Tab>
	<Text %4%>
	<Key Enter>}
} else {
	puts -nonewline $hK {   <Run "}
	puts $hK "$curdir/Wow.exe\" >"
	puts $hK {<TargetWin "World of Warcraft">
		<RenameTargetWin %2%>
	<Wait 300>
	<TargetWin "World of Warcraft">
	<RenameTargetWin Unused%2%>
	<Wait 300>
	<TargetWin %2%>
if { $hideframes=="true" } {
	puts $hK "\t<RemoveWinFrame>"
}
	<SetWinSize %5% %6%>
	<SetWinPos %7% %8%>
	<SetForegroundWin>
	<Text %3%>
	<Key Tab>
	<Text %4%>
	<Key Enter>}
	}
	puts $hK "\t<TargetWin %2%>"
	puts $hK "\t<WaitForInputIdle 2000>"
puts $hK {
// This is the second Launcher command definition
// It's not used. You CAN use it as a special wow setup for your main.
// You know, max graphics, sound, etc.
// NEXT STEP: If you want to do this, you have to make a SEPERATE WOW
// DIR and put the path below. Set that wow up the way you want.
  <Command LaunchHiresAndRename>
	<SendPC %1%>
	<Run "G:/World of Warcraft2/_retail_/Wow.exe" >
	<WaitForInputIdle 400>
	<TargetWin "World of Warcraft">  
	<RenameTargetWin %2%>  
	<WaitForInputIdle 400>
	<TargetWin "World of Warcraft">  
	<RenameTargetWin Unused%2%>  
	<TargetWin %2%>
	<TargetWin %2%>
	<WaitForInputIdle 400>
	<WaitForInputIdle 400>
	<Text %3%>
	<Key Tab>
	<Text %4%>
	<TargetWin %2%>
	//<RemoveWinFrame>
	<SetWinSize %5% %6%>
	<SetWinPos %7% %8%>
	<SetVar LastWin ActiveWindowName>

// This command is used to resize your window.	
  <Command ResetWindowPosition>
	<SendPC %1%> 
	<TargetWin %2%>
	<SetForegroundWin>
	<SetWinSize %3% %4%>
	<SetWinPos %5% %6%>

// This is your first HOTKEY. That's a key combo that only works when scroll_lock is on.
// In this case that combo is Alt-Ctrl-m (case doesn't matter)
// It launches your wow windows!
// The numbers at the end are the window size (x and y) and the window position (x and y)
// Experiment with them if you like.
// OPTIONAL STEP: If you want to run a special wow setup for your main, 
// change the command LaunchAndRename to LaunchHiresAndRename just for your main.

}

#THESE ARE WINDOW CONFIGURATIONS
#Each is a list of 4-number sets. 
#The numbers are win-size-x win-size-y win-position-x win-position-y
#There are a lot of lists. It's a 3d array.
#Main list is every window for that number of monitiors e.g. (5)
#Second list set is each combo of monitors with one window as main. (numpad keys)
#Third list is each monitor position in the set
# Right now, 3d only fully used (window switching) for raidhash(5) one monitor.
# 20 Window Raid 
if { $clique_overlay=="" } {
	switch $monitor {
	1280x1024 { set clique_overlay "33 84 21 106" }
	1920x1080 { set clique_overlay "53 130 32 165" }
	2560x1440 { set clique_overlay "67 172 46 219" }
	3360x1440 { set clique_overlay "98 236 61 304" }
	3840x2160 { set clique_overlay "105 260 65 330" }
	}
}
if { $monitor == "3840x2160" } {
#3840x2160
if { $use2monitors } {
	set raidhash(1) {{3840 2160 0 0 }}
	set raidhash(2) {{3840 2160 0 0 } {3840 2160 3840 0 }}
	set raidhash(3) {{3840 2160 0 0 } {1920 1080 3840 0 } {1920 1080 3840 1080}}
	set raidhash(4) {{3840 2160 0 0 } {1920 1080 3840 0 } {1920 1080 5760 0 } {1920 1080 3840 1080}}
	set raidhash(5) {{1920 1440 960 720} {960 720 0 720} {960 720 960 0} {960 720 1920 0} {960 720 2880 720}}
	set raidhash(10) {{1280 1020 0 960} {1280 1020 1280 960} {1280 1020 2560 960} {640 480 640 0} {640 480 0 0} {640 480 0 480} {640 480 1280 0} {640 480 640 480} {640 480 1280 480} {640 480 1920 480}}
	set raidhash(20) {{640 480 0 0} {960 720 0 1440} {960 720 960 1440} {960 720 1920 1440} {640 480 640 0} {640 480 1280 0} {640 480 1920 0} {640 480 2560 0} {640 480 3200 0} {640 480 0 480} {640 480 640 480} {640 480 1280 480} {640 480 1920 480} {640 480 2560 480} {640 480 3200 480} {640 480 0 960} {640 480 640 960} {640 480 1280 960} {640 480 1920 960 } {640 480 2560 960}} 
	set raidhash(25) {{533 430 1548 0} {1548 1290 0 860} {533 430 1548 430} {533 430 1548 860} {533 430 1548 1290} {533 430 1548 1720} {533 430 2081 0} {533 430 2081 430} {533 430 2081 860} {533 430 2081 1290} {533 430 2081 1720} {533 430 2614 0} {533 430 2614 430} {533 430 2614 860} {533 430 2614 1290} {533 430 2614 1720} {533 430 3147 0} {533 430 3147 430} {533 430 3147 860} {533 430 3147 1290} {533 430 3147 1720} {533 430 482 0} {533 430 1015 0} {533 430 482 430} {533 430 1015 430}}
	set raidhash(40) {{480 360 0 0} {1440 1080 960 1080} {480 360 480 0} {480 360 960 0} {480 360 1440 0} {480 360 1920 0} {480 360 2400 0} {480 360 2880 0} {480 360 3360 0} {480 360 0 360} {480 360 480 360} {480 360 960 360} {480 360 1440 360} {480 360 1920 360} {480 360 2400 360} {480 360 2880 360} {480 360 3360 360} {480 360 0 720} {480 360 480 720} {480 360 960 720} {480 360 1440 720} {480 360 1920 720} {480 360 2400 720} {480 360 2880 720} {480 360 3360 720} {480 360 0 1080} {480 360 480 1080} {480 360 2400 1080} {480 360 2880 1080} {480 360 3360 1080} {480 360 0 1440} {480 360 480 1440} {480 360 2400 1440} {480 360 2880 1440} {480 360 3360 1440} {480 360 0 1800} {480 360 480 1800} {480 360 2400 1800} {480 360 2880 1800} {480 360 3360 1800}}
} else { 
	set raidhash(1) {{3840 2160 0 0 }}
	set raidhash(2) {{1920 1080 0 0 } {1920 1080 0 1080}}
	set raidhash(3) {{1920 1080 3840 0 } {1920 1080 5760 0 } {1920 1080 3840 1080}}
	set raidhash(4) {{1920 1080 3840 0 } {1920 1080 5760 0 } {1920 1080 3840 1080} {1920 1080 5760 1080}}
	set raidhash(5) {{1920 1440 960 720 } {960 720 0 720} {960 720 960 0} {960 720 1920 0} {960 720 2880 720 }}
	set raidhash(10) {{1280 1020 0 960} {1280 1020 1280 960} {1280 1020 2560 960} {640 480 640 0} {640 480 0 0} {640 480 0 480} {640 480 1280 0} {640 480 640 480} {640 480 1280 480} {640 480 1920 480}}
	set raidhash(10) {{2240 1680 0 480} {640 480 0 0} {640 480 640 0} {640 480 1280 0} {640 480 1920 0} {640 480 2560 0} {640 480 3200 0} {640 480 2240 480} {640 480 2880 480} {1420 1065 2240 960}}
	set raidhash(15) {{1980 1400 0 720} {930 698 1980 360} {480 360 0 0} {480 360 480 0} {480 360 960 0} {930 698 2910 360 } {480 360 1440 0} {480 360 1920 0} {480 360 2400 0} {480 360 2880 0} {480 360 3360 0} {480 360 0 360} {480 360 480 360} {480 360 960 360} {480 360 1440 360} } 
	set raidhash(20) {{640 480 0 0} {960 720 0 1440} {960 720 960 1440} {960 720 1920 1440} {640 480 640 0} {640 480 1280 0} {640 480 1920 0} {640 480 2560 0} {640 480 3200 0} {640 480 0 480} {640 480 640 480} {640 480 1280 480} {640 480 1920 480} {640 480 2560 480} {640 480 3200 480} {640 480 0 960} {640 480 640 960} {640 480 1280 960} {640 480 1920 960 } {640 480 2560 960} {480 360 3200 1280}} 
	set raidhash(20) {{1980 1400 0 720} {930 698 1980 720} {480 360 0 0} {480 360 480 0} {480 360 960 0} {930 698 1980 1418 } {480 360 1440 0} {480 360 1920 0} {480 360 2400 0} {480 360 2880 0} {480 360 3360 0} {480 360 0 360} {480 360 480 360} {480 360 960 360} {480 360 1440 360} {480 360 1920 360} {480 360 2400 360} {480 360 2880 360} {480 360 3360 360 } {930 698 2910 720} } 
	set raidhash(25) {{533 430 1548 0} {1548 1290 0 860} {533 430 1548 430} {533 430 1548 860} {533 430 1548 1290} {533 430 1548 1720} {533 430 2081 0} {533 430 2081 430} {533 430 2081 860} {533 430 2081 1290} {533 430 2081 1720} {533 430 2614 0} {533 430 2614 430} {533 430 2614 860} {533 430 2614 1290} {533 430 2614 1720} {533 430 3147 0} {533 430 3147 430} {533 430 3147 860} {533 430 3147 1290} {533 430 3147 1720} {533 430 482 0} {533 430 1015 0} {533 430 482 430} {533 430 1015 430}}
	set raidhash(40) {{480 360 0 0} {1440 1080 960 1080} {480 360 480 0} {480 360 960 0} {480 360 1440 0} {480 360 1920 0} {480 360 2400 0} {480 360 2880 0} {480 360 3360 0} {480 360 0 360} {480 360 480 360} {480 360 960 360} {480 360 1440 360} {480 360 1920 360} {480 360 2400 360} {480 360 2880 360} {480 360 3360 360} {480 360 0 720} {480 360 480 720} {480 360 960 720} {480 360 1440 720} {480 360 1920 720} {480 360 2400 720} {480 360 2880 720} {480 360 3360 720} {480 360 0 1080} {480 360 480 1080} {480 360 2400 1080} {480 360 2880 1080} {480 360 3360 1080} {480 360 0 1440} {480 360 480 1440} {480 360 2400 1440} {480 360 2880 1440} {480 360 3360 1440} {480 360 0 1800} {480 360 480 1800} {480 360 2400 1800} {480 360 2880 1800} {480 360 3360 1800}}
	set raidhash(40) {{1440 1080 960 1080} {480 360 0 0 } {480 360 480 0} {480 360 960 0} {480 360 1440 0} {480 360 1920 0} {480 360 2400 0} {480 360 2880 0} {480 360 3360 0} {480 360 0 360} {480 360 480 360} {480 360 960 360} {480 360 1440 360} {480 360 1920 360} {480 360 2400 360} {480 360 2880 360} {480 360 3360 360} {480 360 0 720} {480 360 480 720} {480 360 960 720} {480 360 1440 720} {480 360 1920 720} {480 360 2400 720} {480 360 2880 720} {480 360 3360 720} {480 360 0 1080} {480 360 480 1080} {480 360 2400 1080} {480 360 2880 1080} {480 360 3360 1080} {480 360 0 1440} {480 360 480 1440} {480 360 2400 1440} {480 360 2880 1440} {480 360 3360 1440} {480 360 0 1800} {480 360 480 1800} {480 360 2400 1800} {480 360 2880 1800} {480 360 3360 1800}}
	set raidhash(55) { {1536 1152 768 864 }
{384 288 0 0 } {384 288 384 0} {384 288 768 0} {384 288 1152 0} {384 288 1536 0} {384 288 1920 0} {384 288 2304 0} {384 288 2688 0} {384 288 3072 0} {384 288 3456 0} 
{384 288 0 288} {384 288 384 288} {384 288 768 288} {384 288 1152 288} {384 288 1536 288} {384 288 1920 288} {384 288 2304 288} {384 288 2688 288} {384 288 3072 288} {384 288 3456 288} 
{384 288 0 576} {384 288 384 576} {384 288 768 576} {384 288 1152 576} {384 288 1536 576} {384 288 1920 576} {384 288 2304 576} {384 288 2688 576} {384 288 3072 576} {384 288 3456 576} 
{384 288 0 864} {384 288 384 864}                                                                            {384 288 2304 864} {384 288 2688 864} {384 288 3072 864} {384 288 3456 864} 
{384 288 0 1152} {384 288 384 1152}                                                                          {384 288 2304 1152} {384 288 2688 1152} {384 288 3072 1152} {384 288 3456 1152} 
{384 288 0 1440} {384 288 384 1440}                                                                          {384 288 2304 1440} {384 288 2688 1440} {384 288 3072 1440} {384 288 3456 1440}
{384 288 0 1728} {384 288 384 1728}                                                                          {384 288 2304 1728} {384 288 2688 1728} {384 288 3072 1728} {384 288 3456 1728}
}
	set raidhash(84) { {1392 1044 0 783}
{348 261 0 0 } {348 261 348 0} {348 261 696 0} {348 261 1044 0} {348 261 1392 0} {348 261 1740 0} {348 261 2088 0} {348 261 2436 0} {348 261 2784 0} {348 261 3132 0} {348 261 3480 0 } 
{348 261 0 261} {348 261 348 261} {348 261 696 261} {348 261 1044 261} {348 261 1392 261} {348 261 1740 261} {348 261 2088 261} {348 261 2436 261} {348 261 2784 261} {348 261 3132 261} {348 261 3480 261} 
{348 261 0 522} {348 261 348 522} {348 261 696 522} {348 261 1044 522} {348 261 1392 522} {348 261 1740 522} {348 261 2088 522} {348 261 2436 522} {348 261 2784 522} {348 261 3132 522} {348 261 3480 522} 
                                                                       {348 261 1392 783} {348 261 1740 783} {348 261 2088 783} {348 261 2436 783} {348 261 2784 783} {348 261 3132 783} {348 261 3480 783} 
                                                                       {348 261 1392 1044} {348 261 1740 1044} {348 261 2088 1044} {348 261 2436 1044} {348 261 2784 1044} {348 261 3132 1044} {348 261 3480 1044} 
                                                                       {348 261 1392 1305} {348 261 1740 1305} {348 261 2088 1305} {348 261 2436 1305} {348 261 2784 1305} {348 261 3132 1305} {348 261 3480 1305} 
                                                                       {348 261 1392 1566} {348 261 1740 1566} {348 261 2088 1566} {348 261 2436 1566} {348 261 2784 1566} {348 261 3132 1566} {348 261 3480 1566} 
{348 261 0 1827} {348 261 348 1827} {348 261 696 1827} {348 261 1044 1827} {348 261 1392 1827} {348 261 1740 1827} {348 261 2088 1827} {348 261 2436 1827} {348 261 2784 1827} {348 261 3132 1827} {348 261 3480 1827} 
{348 261 0 2088} {348 261 348 2088} {348 261 696 2088} {348 261 1044 2088} {348 261 1392 2088} {348 261 1740 2088} {348 261 2088 2088} {348 261 2436 2088} {348 261 2784 2088} {348 261 3132 2088} {348 261 3480 2088} 
}
	#set raidhash(80) {{480 360 0 0} {1440 1080 960 1080} {480 360 480 0} {480 360 960 0} {480 360 1440 0} {480 360 1920 0} {480 360 2400 0} {480 360 2880 0} {480 360 3360 0} {480 360 0 360} {480 360 480 360} {480 360 960 360} {480 360 1440 360} {480 360 1920 360} {480 360 2400 360} {480 360 2880 360} {480 360 3360 360} {480 360 0 720} {480 360 480 720} {480 360 960 720} {480 360 1440 720} {480 360 1920 720} {480 360 2400 720} {480 360 2880 720} {480 360 3360 720} {480 360 0 1080} {480 360 480 1080} {480 360 2400 1080} {480 360 2880 1080} {480 360 3360 1080} {480 360 0 1440} {480 360 480 1440} {480 360 2400 1440} {480 360 2880 1440} {480 360 3360 1440} {480 360 0 1800} {480 360 480 1800} {480 360 2400 1800} {480 360 2880 1800} {480 360 3360 1800} {480 360 0 0} {1440 1080 960 1080} {480 360 480 0} {480 360 960 0} {480 360 1440 0} {480 360 1920 0} {480 360 2400 0} {480 360 2880 0} {480 360 3360 0} {480 360 0 360} {480 360 480 360} {480 360 960 360} {480 360 1440 360} {480 360 1920 360} {480 360 2400 360} {480 360 2880 360} {480 360 3360 360} {480 360 0 720} {480 360 480 720} {480 360 960 720} {480 360 1440 720} {480 360 1920 720} {480 360 2400 720} {480 360 2880 720} {480 360 3360 720} {480 360 0 1080} {480 360 480 1080} {480 360 2400 1080} {480 360 2880 1080} {480 360 3360 1080} {480 360 0 1440} {480 360 480 1440} {480 360 2400 1440} {480 360 2880 1440} {480 360 3360 1440} {480 360 0 1800} {480 360 480 1800} {480 360 2400 1800} {480 360 2880 1800} {480 360 3360 1800}}
		}
	} elseif { $monitor == "3360x1440" } {
	  #3360x1440
		if { $use2monitors } { 
			set raidhash(1) {{3360 1440 0 0 }}
			set raidhash(2) {{3360 1440 0 0 } {3360 1440 3360 0 }}
			set raidhash(3) {{3360 1440 0 0 } {1280 720 3360 0 } {1280 720 3360 720}}
			set raidhash(4) {{3360 1440 0 0 } {1280 720 3360 0 } {1280 720 3360 720 } {1280 720 4640 0}}
 			set raidhash(5) {{1720 1440 860 0} {860 720 0 0} {860 720 0 720} {860 720 2580 0} {860 720 2580 720}}
     	set raidhash(10) {{2064 960 688 0} {688 480 0 0} {688 480 0 480} {688 480 0 960} {688 480 688 960} {688 480 1376 960} {688 480 2064 960} {688 480 2752 0} {688 480 2752 480} {688 480 2752 960}}
     	set raidhash(15) {{1440 1200 720 0} {720 600 0 0} {720 600 0 600} {720 600 2160 0} {720 600 2160 600} {480 400 2880 0} {480 400 2880 400} {480 400 2880 800} {480 400 3360 0} {480 400 3360 400} {480 400 3360 800} {480 400 3840 0} {480 400 3840 400} {480 400 3840 800} {480 400 4320 0}}
      			set raidhash(20) {{490 360 0 0} {490 360 0 360} {490 360 0 720} {490 360 0 1080} {490 360 490 0} {490 360 490 360} {490 360 490 720} {490 360 490 1080} {980 720 980 0} {490 360 980 1080} {490 360 1470 720} {490 360 1470 1080} {490 360 1960 0} {490 360 1960 720} {490 360 1960 1080} {490 360 2450 0} {490 360 2450 360} {490 360 2450 720} {490 360 2450 1080} {490 360 980 720}}
		} else { 
			set raidhash(1) {{3360 1440 0 0 }}
			set raidhash(2) {{1280 720 0 0 } {1280 720 0 720}}
			set raidhash(3) {{1280 720 0 0 } {1280 720 0 720 } {1280 720 1280 0}}
			set raidhash(4) {{1280 720 0 0 } {1280 720 0 720 } {1280 720 1280 0} { 1280 720 1280 720}}
 			set raidhash(5) {{1720 1440 860 0} {860 720 0 0} {860 720 0 720} {860 720 2580 0} {860 720 2580 720}}
 			set raidhash(5) {{1720 1440 860 0} {860 720 0 0} {860 720 0 720} {860 720 2580 0} {860 720 2580 720}}
     	set raidhash(10) {{2064 960 688 0} {688 480 0 0} {688 480 0 480} {688 480 0 960} {688 480 688 960} {688 480 1376 960} {688 480 2064 960} {688 480 2752 0} {688 480 2752 480} {688 480 2752 960}}
     	set raidhash(15) {{1440 1200 720 0} {720 600 0 0} {720 600 0 600} {720 600 2160 0} {720 600 2160 600} {480 400 2880 0} {480 400 2880 400} {480 400 2880 800} {480 400 3360 0} {480 400 3360 400} {480 400 3360 800} {480 400 3840 0} {480 400 3840 400} {480 400 3840 800} {480 400 4320 0}}
     	set raidhash(20) {{490 360 0 0} {490 360 0 360} {490 360 0 720} {490 360 0 1080} {490 360 490 0} {490 360 490 360} {490 360 490 720} {490 360 490 1080} {980 720 980 0} {490 360 980 1080} {490 360 1470 720} {490 360 1470 1080} {490 360 1960 0} {490 360 1960 720} {490 360 1960 1080} {490 360 2450 0} {490 360 2450 360} {490 360 2450 720} {490 360 2450 1080} {490 360 980 720}}
		}
	} elseif { $monitor == "2560x1440" } {
	  #x1440
		if { $use2monitors } { 
			set raidhash(1) {{2560 1440 0 0 }}
			set raidhash(2) {{2560 1440 0 0 } {2560 1440 2560 0 }}
			set raidhash(3) {{2560 1440 0 0 } {1280 720 2560 0 } {1260 720 2560 720}}
			set raidhash(4) {{2560 1440 0 0 } {1280 720 2560 0 } {1280 720 2560 720 } {1280 720 3360 0}}
 			set raidhash(5) {{1720 1440 860 0} {860 720 0 0} {860 720 0 720} {860 720 2560 0} {860 720 2560 720}}
 			set raidhash(5) {{1720 1440 860 0} {860 720 0 0} {860 720 0 720} {860 720 2560 0} {860 720 2560 720}}
     	set raidhash(10) {{2064 960 688 0} {688 480 0 0} {688 480 0 480} {688 480 0 960} {688 480 688 960} {688 480 1376 960} {688 480 2064 960} {688 480 2752 0} {688 480 2752 480} {688 480 2752 960}}
     	set raidhash(15) {{1440 1200 720 0} {720 600 0 0} {720 600 0 600} {720 600 2160 0} {720 600 2160 600} {480 400 2880 0} {480 400 2880 400} {480 400 2880 800} {480 400 3360 0} {480 400 3360 400} {480 400 3360 800} {480 400 3840 0} {480 400 3840 400} {480 400 3840 800} {480 400 4320 0}}
      			set raidhash(20) {{490 360 0 0} {490 360 0 360} {490 360 0 720} {490 360 0 1080} {490 360 490 0} {490 360 490 360} {490 360 490 720} {490 360 490 1080} {980 720 980 0} {490 360 980 1080} {490 360 1470 720} {490 360 1470 1080} {490 360 1960 0} {490 360 1960 720} {490 360 1960 1080} {490 360 2450 0} {490 360 2450 360} {490 360 2450 720} {490 360 2450 1080} {490 360 980 720}}
		} else { 
			set raidhash(1) {{2560 1440 0 0 }}
			set raidhash(2) {{1280 720 0 0 } {1280 720 0 720}}
			set raidhash(3) {{1280 720 0 0 } {1280 720 0 720 } {1280 720 1280 0}}
			set raidhash(4) {{1280 720 0 0 } {1280 720 0 720 } {1280 720 1280 0} {1280 720 1280 720}}
	set raidhash(5) {{1280 960 640 480} {640 480 0 480} {640 480 640 0} {640 480 1280 0} {640 480 1920 480}}
     	set raidhash(10) {{2064 960 688 0} {688 480 0 0} {688 480 0 480} {688 480 0 960} {688 480 688 960} {688 480 1376 960} {688 480 2064 960} {688 480 2752 0} {688 480 2752 480} {688 480 2752 960}}
     	set raidhash(15) {{1440 1200 720 0} {720 600 0 0} {720 600 0 600} {720 600 2160 0} {720 600 2160 600} {480 400 2880 0} {480 400 2880 400} {480 400 2880 800} {480 400 3360 0} {480 400 3360 400} {480 400 3360 800} {480 400 3840 0} {480 400 3840 400} {480 400 3840 800} {480 400 4320 0}}
     	set raidhash(20) {{490 360 0 0} {490 360 0 360} {490 360 0 720} {490 360 0 1080} {490 360 490 0} {490 360 490 360} {490 360 490 720} {490 360 490 1080} {980 720 980 0} {490 360 980 1080} {490 360 1470 720} {490 360 1470 1080} {490 360 1960 0} {490 360 1960 720} {490 360 1960 1080} {490 360 2450 0} {490 360 2450 360} {490 360 2450 720} {490 360 2450 1080} {490 360 980 720}}
		}
	} elseif { $monitor == "1280x1024" } {
			set raidhash(1) {{1280 1024 0 0 }}
			set raidhash(2) {{640 540 0 0 } {640 540 0 540 }}
			set raidhash(3) {{640 540 0 0 } {640 540 0 540 } {640 540 640 0 }}
			set raidhash(4) {{640 540 0 0 } {640 540 0 540 } {640 540 640 0 } {640 540 640 540 }}
			set raidhash(5) {{640 480 320 240} {320 240 0 240} {320 240 320 0} {320 240 640 0} {320 240 960 240}}
	} else {
	  #1080p
		if { $use2monitors } { 
	set raidhash(1) {{1920 1080 0 0 }}
	set raidhash(2) {{1920 1080 0 0 } {1920 1080 1920 0 }}
	set raidhash(3) {{960 540 0 0 } {960 540 0 0 } {960 540 960 0}}
	set raidhash(4) {{1920 1080 0 0 } {960 540 1920 0 } {960 540 2880 0 } {960 540 1920 540}}
						set raidhash(5) {{1920 1080 0 0} {960 540 1920 540} {960 540 1920 0} {960 540 2880 0} {960 540 2880 540}}
			set raidhash(10) {{1920 1080 0 0} {640 360 1920 0} {640 360 2560 0} {640 360 3200 0} {640 360 1920 360} {640 360 2560 360} {640 360 3200 360} {640 360 1920 720} {640 360 2560 720} {640 360 3200 720}}
	  	set raidhash(20) {{960 720 0 360} {480 360 0 0} {480 360 480 0} {480 360 960 0} {480 360 1440 0} {480 360 960 360} {480 360 1440 360} {480 360 960 720} {480 360 1920 0} {480 360 2400 0} {480 360 2880 0} {480 360 3360 0} {480 360 1920 360} {480 360 2400 360} {480 360 2880 360} {480 360 3360 360} {480 360 1920 720} {480 360 2400 720} {480 360 2880 720} {480 360 3360 720}}
	  	set raidhash(25) {{320 240 320 0} {480 360 0 480} {680 480 360 480} {320 240 0 0} {320 240 640 0} {320 240 960 0} {320 240 1280 0} {320 240 1600 0} {320 240 0 240} {320 240 320 240} {320 240 640 240} {320 240 960 240} {320 240 960 480} {320 240 1600 240} {320 240 1280 240} {320 240 1280 480} {320 240  1600 480} {320 240 960 720} {320 240 1280 720} {320 240 1600 720}}
	  	set raidhash(25) {{533 430 1548 0} {1548 1290 0 860} {533 430 1548 430} {533 430 1548 860} {533 430 1548 1290} {533 430 1548 1720} {533 430 2081 0} {533 430 2081 430} {533 430 2081 860} {533 430 2081 1290} {533 430 2081 1720} {533 430 2614 0} {533 430 2614 430} {533 430 2614 860} {533 430 2614 1290} {533 430 2614 1720} {533 430 3147 0} {533 430 3147 430} {533 430 3147 860} {533 430 3147 1290} {533 430 3147 1720} {533 430 482 0} {533 430 1015 0} {533 430 482 430} {533 430 1015 430}}
	  	set raidhash(25) {{266 215 774 0} {774 645 0 430} {266 215 774 215} {266 215 774 430} {266 215 774 645} {266 215 774 860} {266 215 1040 0} {266 215 1040 215} {266 215 1040 430} {266 215 1040 645} {266 215 1040 860} {266 215 1307 0} {266 215 1307 215} {266 215 1307 430} {266 215 1307 645} {266 215 1307 860} {266 215 1573 0} {266 215 1573 215} {266 215 1573 430} {266 215 1573 645} {266 215 1573 860} {266 215 241 0} {266 215 507 0} {266 215 241 215} {266 215 507 215}}
		set raidhash(40) {{240 180 0 0} {480 360 480 720} {480 360 0 720} {480 360 960 720} {480 360 1440 720} {240 180 120 0} {240 180 240 0} {240 180 360 0} {240 180 480 0} {240 180 600 0} {240 180 720 0} {240 180 840 0} {240 180 960 0} {240 180 1200 0} {240 180 1440 0} {240 180 1680 0} {240 180 0 180} {240 180 240 180} {240 180 480 180} {240 180 720 180} {240 180 960 180} {240 180 1200 180} {240 180 1440 180} {240 180 1680 180} {240 180 0 360} {240 180 240 360} {240 180 480 360} {240 180 720 360} {240 180 960 360} {240 180 1200 360} {240 180 1440 360} {240 180 1680 360} {240 180 0 540} {240 180 240 540} {240 180 480 540} {240 180 720 540} {240 180 960 540} {240 180 1200 540} {240 180 1440 540} {240 180 1680 540}}
		} else { 
	set raidhash(1) {{1920 1080 0 0 }}
	set raidhash(2) {{960 540 0 0 } {960 540 0 540}}
	set raidhash(3) {{960 540 0 0 } {960 540 0 0 } {960 540 960 0}}
	set raidhash(4) {{960 540 0 0 } {960 540 0 0 } {960 540 960 0} {960 540 960 540}}
			set raidhash(5) {{960 720 480 360} {480 360 0 360} {480 360 480 0} {480 360 960 0} {480 360 1440 360}}
			set raidhash(10) {{640 510 0 480} {640 510 640 480} {640 510 1280 480} {320 240 320 0} {320 240 0 0} {320 240
	 	0 240} {320 240 640 0} {320 240 320 240} {320 240 640 240} {320 240 960 240}}
	  	set raidhash(20) {{320 240 320 0} {480 360 0 480} {680 480 360 480} {320 240 0 0} {320 240 640 0} {320 240 960 0} {320 240 1280 0} {320 240 1600 0} {320 240 0 240} {320 240 320 240} {320 240 640 240} {320 240 960 240} {320 240 960 480} {320 240 1600 240} {320 240 1280 240} {320 240 1280 480} {320 240  1600 480} {320 240 960 720} {320 240 1280 720} {320 240 1600 720}}
	  	set raidhash(25) {{266 215 774 0} {774 645 0 430} {266 215 774 215} {266 215 774 430} {266 215 774 645} {266 215 774 860} {266 215 1040 0} {266 215 1040 215} {266 215 1040 430} {266 215 1040 645} {266 215 1040 860} {266 215 1307 0} {266 215 1307 215} {266 215 1307 430} {266 215 1307 645} {266 215 1307 860} {266 215 1573 0} {266 215 1573 215} {266 215 1573 430} {266 215 1573 645} {266 215 1573 860} {266 215 241 0} {266 215 507 0} {266 215 241 215} {266 215 507 215}}
			set raidhash(40) {{240 180 0 0} {480 360 480 720} {480 360 0 720} {480 360 960 720} {480 360 1440 720} {240 180 120 0} {240 180 240 0} {240 180 360 0} {240 180 480 0} {240 180 600 0} {240 180 720 0} {240 180 840 0} {240 180 960 0} {240 180 1200 0} {240 180 1440 0} {240 180 1680 0} {240 180 0 180} {240 180 240 180} {240 180 480 180} {240 180 720 180} {240 180 960 180} {240 180 1200 180} {240 180 1440 180} {240 180 1680 180} {240 180 0 360} {240 180 240 360} {240 180 480 360} {240 180 720 360} {240 180 960 360} {240 180 1200 360} {240 180 1440 360} {240 180 1680 360} {240 180 0 540} {240 180 240 540} {240 180 480 540} {240 180 720 540} {240 180 960 540} {240 180 1200 540} {240 180 1440 540} {240 180 1680 540}}
		}
	}
	array unset raidlist
	array unset raididx
	set raids ""
	for {set i 0} {$i < [array size toons]} {incr i} {
		#puts [lrange $toons($i) 5 end]
		foreach letter [lrange $toons($i) 5 end] {
			#puts "[lindex $toons($i) 0] [lindex $toons($i) 1] has raidletter $letter"
			if {[lsearch $raids $letter]== -1} {
			  set raids "$raids $letter"
			}
		}
	}
	set mainraids ""
	foreach userraid $raids { 
		regexp {([a-z]|[A-Z])([0-9])?} $userraid match userraid cpunum
		set raididx($userraid) 0
		array unset group${userraid}
		if { [lsearch $mainraids $userraid ] == -1 } { lappend mainraids $userraid } 
	}
	for {set i 0} {$i < [array size toons]} {incr i} {
		set myraids [lrange $toons($i) 5 end]
		foreach userraid $myraids {
			regexp {([a-z]|[A-Z])([0-9])?} $userraid match userraid cpunum
			set group${userraid}($raididx($userraid)) "[lrange $toons($i) 0 4] ${userraid}${cpunum}"
			#puts "group $userraid"
			#puts "[lrange $toons($i) 0 4] ${userraid}${cpunum}"
			#puts "$groupm(0)"
			#puts "raidindex of group $userraid $raididx($userraid)"
			#puts [array names groupf]
			#puts [array get groupf 1]
			incr raididx($userraid)
		}
	}
	array unset windowcount
	for {set i 0} {$i < [array size toons]} {incr i} {
		set myraids [lrange $toons($i) 5 end]
	  foreach  userraid $myraids {
			if [info exists windowcount($userraid)] {
				incr windowcount($userraid)
			} else {
				set  windowcount($userraid) 1
			}
		}
	}
	foreach raid [array names windowcount] { 
	  #Set window count in each raid to something I actually have a hash for
		if {$windowcount($raid) > 55} { set windowcount($raid) 84
		} elseif {$windowcount($raid) > 40} { set windowcount($raid) 55
		} elseif {$windowcount($raid) > 25} { set windowcount($raid) 40
		} elseif {$windowcount($raid) > 20 } { set windowcount($raid) 25  
		} elseif {$windowcount($raid) > 15 } { set windowcount($raid) 20  
		} elseif {$windowcount($raid) > 10 } { set windowcount($raid) 15  
		} elseif {$windowcount($raid) > 5 } { set windowcount($raid) 10  
		} 
		set windex($raid) 0
	}
	#foreach mainraid $mainraids {
		#puts $hK ""
		#set arrayname group${mainraid}
		#if { [array size $arrayname] == 2 } { 
			#set thistoon [lindex [array get $arrayname 0] 1]
	  		#set toonname [string tolower [lindex $thistoon 3]]
	  		#set myraid [lindex $thistoon 5]
			#regexp {([a-z]|[A-Z])([0-9])?} $myraid match foo cpunum
	  		#set bnet_account [lindex $thistoon 0]
	  		#set account [lindex $thistoon 1]
	  		#set passwd [lindex $thistoon 2]
	  		#set winname1 ${toonname}_${cpunum}$acct_winname($account)
			#set thistoon [lindex [array get $arrayname 1] 1]
	  		#set toonname [string tolower [lindex $thistoon 3]]
	  		#set myraid [lindex $thistoon 5]
			#regexp {([a-z]|[A-Z])([0-9])?} $myraid match foo cpunum
	  		#set bnet_account [lindex $thistoon 0]
	  		#set account [lindex $thistoon 1]
	  		#set passwd [lindex $thistoon 2]
	  		#set winname2 ${toonname}_${cpunum}$acct_winname($account)
			#puts $hK "<Command RemoveFrames>"
			#puts $hK "\t<TargetWin $winname1>"
			#puts $hK "\t<RemoveWinFrame>"
			#puts $hK "\t<RenameWin World $winname1>"
			#puts $hK "\t<TargetWin $winname2>"
			#puts $hK "\t<RemoveWinFrame>"
			#puts $hK "\t<RenameWin World $winname2>"
			#puts $hK ""
		#}
	#}
	puts $hK "  <Command LaunchWow>"
	puts $hK "	<SendPC %1%>"
	puts $hK "	< Open \"$curdir/Wow.exe\" >"
	puts $hK "  <Command RenameWindow>"
	puts $hK "	<SendPC %1%>"
	puts $hK "	<RenameWin \"World of Warcraft\" %2%>"
	puts $hK {  <Command AccInfoWindowPosWindowSize>
	<SendPC %1%>
	<TargetWin %2%>
	<SetForegroundWin>
	<SetWinRedraw off>
	<SetWinRect %5% %6% %7% %8%>
	<SetWinRedraw on>
	<UpdateWin>
	<wait 50><Key Backspace>
	<wait 75><Text %3%>
	<wait 75><Key Tab>
	<wait 25><Key Backspace>
	<wait 50><Text %4%>
	<wait 75><Key Enter>}
	foreach mainraid $mainraids {
		puts $hK ""
		puts $hK "  <Hotkey ScrollLockOn Alt Ctrl N>"
		#puts "mainraid is $mainraid"
		set arrayname group${mainraid}
		#puts "arrayname is $arrayname"
		#puts "array size is [array size $arrayname]"
		#for { set i 0 } { $i<[array size $arrayname] } { incr i } {
			#puts "Array $arrayname $i contains [array get $arrayname $i]"
		#}
		for { set i 0 } { $i<[array size $arrayname] } { incr i } {
			set thistoon [lindex [array get $arrayname $i] 1]
			#puts "thistoon is $thistoon"
	  		set toonname [string tolower [lindex $thistoon 3]]
			#puts "toonname is $toonname"
	  		set myraid [lindex $thistoon 5]
			#puts "myraid is $myraid"
			regexp {([a-z]|[A-Z])([0-9])?} $myraid match foo cpunum
			#puts "cpunum is $cpunum"
	  		set bnet_account [lindex $thistoon 0]
			#puts "bnet_account is [lindex $thistoon 0]"
	  		set account [lindex $thistoon 1]
	  		set passwd [lindex $thistoon 2]
			#puts "passwd is $passwd"
	  		#puts "winname is ${toonname}_${cpunum}$acct_winname($account)"
	  		set winname ${toonname}_${cpunum}$acct_winname($account)
	  		puts $hK "	<if WinDoesNotExist $winname>"
	  		puts $hK "	<LaunchAndRename $computer($cpunum) $winname $bnet_account $passwd [lindex $raidhash($windowcount($myraid)) $windex($myraid)] $toonname>"
			incr windex($myraid)
		}
		puts $hK ""
		puts $hK "  <Hotkey ScrollLockOn Alt Ctrl $mainraid>"
		#puts "mainraid is $mainraid"
		set arrayname group${mainraid}
		#puts "arrayname is $arrayname"
		#puts "array size is [array size $arrayname]"
		#for { set i 0 } { $i<[array size $arrayname] } { incr i } {
			#puts "Array $arrayname $i contains [array get $arrayname $i]"
		#}
		for { set i 0 } { $i<[array size $arrayname] } { incr i } {
			set thistoon [lindex [array get $arrayname $i] 1]
			#puts "thistoon is $thistoon"
	  		set toonname [string tolower [lindex $thistoon 3]]
			#puts "toonname is $toonname"
	  		set myraid [lindex $thistoon 5]
			#puts "myraid is $myraid"
			regexp {([a-z]|[A-Z])([0-9])?} $myraid match foo cpunum
			#puts "cpunum is $cpunum"
	  		set bnet_account [lindex $thistoon 0]
			#puts "bnet_account is [lindex $thistoon 0]"
	  		set account [lindex $thistoon 1]
	  		set passwd [lindex $thistoon 2]
			#puts "passwd is $passwd"
	  		#puts "winname is ${toonname}_${cpunum}$acct_winname($account)"
	  		set winname ${toonname}_${cpunum}$acct_winname($account)
	  		puts $hK "	<if WinDoesNotExist $winname> <LaunchWow $computer($cpunum)>"

			incr windex($myraid)
		}
	  	puts $hK "	//<wait 4500>"
	  	puts $hK "	//<DoHotKey HotKey ScrollLockOn Ctrl Alt K>"
	  	puts $hK "	//<wait 180>"
	  	puts $hK "	//<DoHotKey HotKey ScrollLockOn Ctrl Alt J>"
	  	puts $hK "	//<wait 350>"
	  	puts $hK "	//<DoHotKey HotKey ScrollLockOn Shift Ctrl $mainraid>"
		puts $hK "  <Hotkey ScrollLockOn Alt Ctrl K>"
		for { set i 0 } { $i<[array size $arrayname] } { incr i } {
			set thistoon [lindex [array get $arrayname $i] 1]
			#puts "thistoon is $thistoon"
	  		set toonname [string tolower [lindex $thistoon 3]]
			#puts "toonname is $toonname"
	  		set myraid [lindex $thistoon 5]
			#puts "myraid is $myraid"
			regexp {([a-z]|[A-Z])([0-9])?} $myraid match foo cpunum
			#puts "cpunum is $cpunum"
	  		set bnet_account [lindex $thistoon 0]
			#puts "bnet_account is [lindex $thistoon 0]"
	  		set account [lindex $thistoon 1]
	  		set passwd [lindex $thistoon 2]
			#puts "passwd is $passwd"
	  		#puts "winname is ${toonname}_${cpunum}$acct_winname($account)"
	  		set winname ${toonname}_${cpunum}$acct_winname($account)
	  		puts $hK "	<if WinDoesNotExist $winname> <RenameWindow $computer($cpunum) $winname>"
			incr windex($myraid)
		}
		puts $hK ""
		puts $hK "  <Hotkey ScrollLockOn Alt Ctrl J>"
		for { set i 0 } { $i<[array size $arrayname] } { incr i } {
			set thistoon [lindex [array get $arrayname $i] 1]
			#puts "thistoon is $thistoon"
	  		set toonname [string tolower [lindex $thistoon 3]]
			#puts "toonname is $toonname"
	  		set myraid [lindex $thistoon 5]
			#puts "myraid is $myraid"
			regexp {([a-z]|[A-Z])([0-9])?} $myraid match foo cpunum
			#puts "cpunum is $cpunum"
	  		set bnet_account [lindex $thistoon 0]
			#puts "bnet_account is [lindex $thistoon 0]"
	  		set account [lindex $thistoon 1]
	  		set passwd [lindex $thistoon 2]
			#puts "passwd is $passwd"
	  		#puts "winname is ${toonname}_${cpunum}$acct_winname($account)"
	  		set winname ${toonname}_${cpunum}$acct_winname($account)
	  		puts $hK "	<AccInfoWindowPosWindowSize $computer($cpunum) $winname $bnet_account $passwd>"
			incr windex($myraid)
		}
		foreach raid [array names windowcount] { 
			set windex($raid) 0
		}
		#if { [array size $arrayname]==2 } { 
			#puts $hK "\t<RemoveFrames>"
		#}
		puts $hK ""
		puts $hK "  <Hotkey ScrollLockOn Shift Ctrl $mainraid>"
		for { set i 0 } { $i<[array size $arrayname] } { incr i } {
			set thistoon [lindex [array get $arrayname $i] 1]
	  		set toonname [string tolower [lindex $thistoon 3]]
	  		set myraid [lindex $thistoon 5]
			regexp {([a-z]|[A-Z])([0-9])?} $myraid match foo cpunum
	  		set account [lindex $thistoon 1]
	  		set passwd [lindex $thistoon 2]
	  		set winname ${toonname}_${cpunum}$acct_winname($account)
	  		puts $hK "	<ResetWindowPosition $computer($cpunum) $winname [lindex $raidhash($windowcount($myraid)) $windex($myraid)]>"
			incr windex($myraid)
		}
	}
	foreach mainraid $mainraids {
		puts $hK ""
		set arrayname group${mainraid}
		if { [array size $arrayname] == 2 } { 
			set thistoon [lindex [array get $arrayname 0] 1]
	  		set toonname [string tolower [lindex $thistoon 3]]
	  		set myraid [lindex $thistoon 5]
			regexp {([a-z]|[A-Z])([0-9])?} $myraid match foo cpunum
	  		set bnet_account [lindex $thistoon 0]
	  		set account [lindex $thistoon 1]
	  		set passwd [lindex $thistoon 2]
	  		set winname1 ${toonname}_${cpunum}$acct_winname($account)
			set thistoon [lindex [array get $arrayname 1] 1]
	  		set toonname [string tolower [lindex $thistoon 3]]
	  		set myraid [lindex $thistoon 5]
			regexp {([a-z]|[A-Z])([0-9])?} $myraid match foo cpunum
	  		set bnet_account [lindex $thistoon 0]
	  		set account [lindex $thistoon 1]
	  		set passwd [lindex $thistoon 2]
	  		set winname2 ${toonname}_${cpunum}$acct_winname($account)
			puts $hK "<Command RemoveFrames>"
			puts $hK "\t<TargetWin $winname1>"
			puts $hK "\t<RemoveWinFrame>"
			puts $hK "\t<RenameWin World $winname1>"
			puts $hK "\t<TargetWin $winname2>"
			puts $hK "\t<RemoveWinFrame>"
			puts $hK "\t<RenameWin World $winname2>"
			puts $hK ""
			puts $hK "<Command SetPip>"
			puts $hK "\t<TargetWin %2%>"
			puts $hK "\t\t<SetWinSize [expr int([lindex $raidhash(1) 0 0]/4)] [expr int([lindex $raidhash(1) 0 1]/4)]>"
			puts $hK "\t\t<SetWinPos [expr int([lindex $raidhash(1) 0 0]*.7)] [expr int([lindex $raidhash(1) 0 1]*.6)]>"
			puts $hK "\t<TargetWin %1%>"
			puts $hK "\t\t<SetWinPos 0 0>"
			puts $hK "\t\t<SetWinSize [lindex $raidhash(1) 0 0] [lindex $raidhash(1) 0 1]>"
			puts $hK "\t<TargetWin %2%>"
			puts $hK "\t\t<SetForegroundWin>"
			puts $hK "\t\t<UpdateWin>"
			puts $hK "\t<TargetWin %1%>"
			puts $hK "\t\t<SetWinRegion [expr int([lindex $raidhash(1) 0 0]*.7)] [expr int([lindex $raidhash(1) 0 1]*.6)] [expr int([lindex $raidhash(1) 0 0]/4)] [expr int([lindex $raidhash(1) 0 1]/4)]>"
			puts $hK "\t\t<SetForegroundWin>"
			puts $hK ""
			puts $hK "<Hotkey ScrollLockOn F10>"
			puts $hK "\t<Toggle>"
			puts $hK "\t\t<SetPip $winname1 $winname2>"
			puts $hK "\t<Toggle>"
			puts $hK "\t\t<SetPip $winname2 $winname1>"
			puts $hK ""
		}
	}
	foreach mainraid $mainraids {
		#Win swapping only happens for main raid m
		#puts "mainraid is $mainraid"
		puts $hK {// This next group of hotkeys is how you swap windows with the keypad numbers.}
		set arrayname group${mainraid}
		regexp {([a-z]|[A-Z])([0-9])?} $mainraid match raidletter cpunum
		if { $raidletter ne "m" } { continue } 
		for  { set x 0 } { $x<[array size $arrayname] } { incr x} {
			if { $x > 19 } { break }
			if { $x > 9 } { puts $hK "  <Hotkey ScrollLockOn Shift [lindex $winswapkeys [expr $x - 10]]>"
			} else {
			  puts $hK "  <Hotkey ScrollLockOn [lindex $winswapkeys $x]>"
		        }
			puts $hK "	<SaveMousePos>"
			foreach raid [array names windowcount] { 
				set windex($raid) 0
			}
			for { set i 0 } { $i<[array size $arrayname] } { incr i } {
				set thistoon [lindex [array get $arrayname $i] 1]
	  			set toonname [string tolower [lindex $thistoon 3]]
	  			set myraid [lindex $thistoon 5]
				regexp {([a-z]|[A-Z])([0-9])?} $myraid match foo cpunum
	  			set bnet_account [lindex $thistoon 0]
	  			set account [lindex $thistoon 1]
	  			set passwd [lindex $thistoon 2]
	  			set winname ${toonname}_${cpunum}$acct_winname($account)
				set winset  $raidhash($windowcount($myraid))
				set win0 [list [lindex $winset 0 ]]
				set win1 [list [lindex $winset 1 ]]
				set win2 [list [lindex $winset 2 ]]
				set win3 [list [lindex $winset 3 ]]
				set win4 [list [lindex $winset 4 ]]
				set win5 [list [lindex $winset 5 ]]
				set win6 [list [lindex $winset 6 ]]
				set win7 [list [lindex $winset 7 ]]
				set win8 [list [lindex $winset 8 ]]
				set win9 [list [lindex $winset 9 ]]
				set win10 [list [lindex $winset 10 ]]
				set win11 [list [lindex $winset 11 ]]
				set win12 [list [lindex $winset 12 ]]
				set win13 [list [lindex $winset 13 ]]
				set win14 [list [lindex $winset 14 ]]
				set win15 [list [lindex $winset 15 ]]
				set win16 [list [lindex $winset 16 ]]
				set win17 [list [lindex $winset 17 ]]
				set win18 [list [lindex $winset 18 ]]
				set win19 [list [lindex $winset 19 ]]
				set swaplist [list \
					"$win0 $win1 $win2 $win3 $win4 $win5 $win6 $win7 $win8 $win9 $win10 $win11 $win12 $win13 $win14 $win15 $win16 $win17 $win18 $win19" \
					"$win1 $win0 $win2 $win3 $win4 $win5 $win6 $win7 $win8 $win9 $win10 $win11 $win12 $win13 $win14 $win15 $win16 $win17 $win18 $win19" \
					"$win2 $win1 $win0 $win3 $win4 $win5 $win6 $win7 $win8 $win9 $win10 $win11 $win12 $win13 $win14 $win15 $win16 $win17 $win18 $win19" \
					"$win3 $win1 $win2 $win0 $win4 $win5 $win6 $win7 $win8 $win9 $win10 $win11 $win12 $win13 $win14 $win15 $win16 $win17 $win18 $win19" \
					"$win4 $win1 $win2 $win3 $win0 $win5 $win6 $win7 $win8 $win9 $win10 $win11 $win12 $win13 $win14 $win15 $win16 $win17 $win18 $win19" \
					"$win5 $win1 $win2 $win3 $win4 $win0 $win6 $win7 $win8 $win9 $win10 $win11 $win12 $win13 $win14 $win15 $win16 $win17 $win18 $win19" \
					"$win6 $win1 $win2 $win3 $win4 $win5 $win0 $win7 $win8 $win9 $win10 $win11 $win12 $win13 $win14 $win15 $win16 $win17 $win18 $win19" \
					"$win7 $win1 $win2 $win3 $win4 $win5 $win6 $win0 $win8 $win9 $win10 $win11 $win12 $win13 $win14 $win15 $win16 $win17 $win18 $win19" \
					"$win8 $win1 $win2 $win3 $win4 $win5 $win6 $win7 $win0 $win9 $win10 $win11 $win12 $win13 $win14 $win15 $win16 $win17 $win18 $win19" \
					"$win9 $win1 $win2 $win3 $win4 $win5 $win6 $win7 $win8 $win0 $win10 $win11 $win12 $win13 $win14 $win15 $win16 $win17 $win18 $win19" \
					"$win10 $win1 $win2 $win3 $win4 $win5 $win6 $win7 $win8 $win9 $win0 $win11 $win12 $win13 $win14 $win15 $win16 $win17 $win18 $win19" \
					"$win11 $win1 $win2 $win3 $win4 $win5 $win6 $win7 $win8 $win9 $win10 $win0 $win12 $win13 $win14 $win15 $win16 $win17 $win18 $win19" \
					"$win12 $win1 $win2 $win3 $win4 $win5 $win6 $win7 $win8 $win9 $win10 $win11 $win0 $win13 $win14 $win15 $win16 $win17 $win18 $win19" \
					"$win13 $win1 $win2 $win3 $win4 $win5 $win6 $win7 $win8 $win9 $win10 $win11 $win12 $win0 $win14 $win15 $win16 $win17 $win18 $win19" \
					"$win14 $win1 $win2 $win3 $win4 $win5 $win6 $win7 $win8 $win9 $win10 $win11 $win12 $win13 $win0 $win15 $win16 $win17 $win18 $win19" \
					"$win15 $win1 $win2 $win3 $win4 $win5 $win6 $win7 $win8 $win9 $win10 $win11 $win12 $win13 $win14 $win0 $win16 $win17 $win18 $win19" \
					"$win16 $win1 $win2 $win3 $win4 $win5 $win6 $win7 $win8 $win9 $win10 $win11 $win12 $win13 $win14 $win15 $win0 $win17 $win18 $win19" \
					"$win17 $win1 $win2 $win3 $win4 $win5 $win6 $win7 $win8 $win9 $win10 $win11 $win12 $win13 $win14 $win15 $win16 $win0 $win18 $win19" \
					"$win18 $win1 $win2 $win3 $win4 $win5 $win6 $win7 $win8 $win9 $win10 $win11 $win12 $win13 $win14 $win15 $win16 $win17 $win0 $win19" \
					"$win19 $win1 $win2 $win3 $win4 $win5 $win6 $win7 $win8 $win9 $win10 $win11 $win12 $win13 $win14 $win15 $win16 $win17 $win18 $win0" \
					]
	  			puts $hK "	<ResetWindowPosition $computer($cpunum) $winname [lindex $swaplist $x $windex($myraid) ]>"
				incr windex($myraid)
			}
			puts $hK "	<RestoreMousePos>"
		}
	}
#				file mkdir WTF
#				set f [open WTF\\config.wtf w]
#puts $f { SET hwDetect "0"
#SET videoOptionsVersion "19"
#SET gxApi "D3D11"
#SET gxMaximize "0"
#SET graphicsQuality "3"
#SET RAIDgraphicsQuality "3"
#SET mouseSpeed "1"
#SET Sound_MusicVolume "0.40000000596046"
#SET Sound_AmbienceVolume "0.60000002384186"
#SET spellClutterRangeConstantRaid "10.000000"
#SET CACHE-WQST-QuestV2RecordCount "4549"
#SET CACHE-WQST-QuestV2HotfixCount "0"
#SET CACHE-WQST-QuestObjectiveRecordCount "5324"
#SET CACHE-WQST-QuestObjectiveHotfixCount "0"
#SET CACHE-WQST-QuestObjectiveXEffectRecordCount "0"
#SET CACHE-WQST-QuestObjectiveXEffectHotfixCount "0"
#SET CACHE-WGOB-GameObjectsRecordCount "10021"
#SET CACHE-WGOB-GameObjectsHotfixCount "0"
#SET expandUpgradePanel "0"
#SET RenderScale "1"
#SET gameTip "74"
#SET vsync "1"
#SET checkAddonVersion "0"
#SET lastAddonVersion "11302"
#SET ffxGlow "0"
#SET ffxDeath "0"
#SET ffxNether "0"
#SET chatClassColorOverride "0"
#SET uiScale "1"
#SET Sound_OutputDriverName "System Default"
#SET Sound_EnableMusic "0"
#SET gxWindowedResolution "1912x1413"
#SET engineSurvey "6"
#SET lastCharacterIndex "1"
#SET spellClutterRangeConstant "10.000000"
#SET useUiScale "1"}
#close $f
	set winlabels "\t<SendLabel"
	for { set i 0 } { $i<$totallabels } { incr i } {
	  if { $winlabels=="\t<SendLabel" } { set winlabels  "$winlabels w${i}" } else { set winlabels "${winlabels},w${i}" } 
	}
	set winlabels "${winlabels}>"
	puts $hK "" 
	puts $hK {  <Hotkey ScrollLockOn Numpad1>
	<DoHotKey Hotkey ScrollLockOn NumpadEnd>
  <Hotkey ScrollLockOn Numpad2>
	<DoHotKey Hotkey ScrollLockOn NumpadDown>
  <Hotkey ScrollLockOn Numpad3>
	<DoHotKey Hotkey ScrollLockOn NumpadPgDn>
  <Hotkey ScrollLockOn Numpad4>
	<DoHotKey Hotkey ScrollLockOn NumpadLeft>
  <Hotkey ScrollLockOn Numpad5>
	<DoHotkey Hotkey ScrollLockOn Clear>
  <Hotkey ScrollLockOn Numpad6>
	<DoHotkey Hotkey ScrollLockOn NumpadRight>
  <Hotkey ScrollLockOn Numpad7>
	<DoHotkey Hotkey ScrollLockOn NumpadHome>
  <Hotkey ScrollLockOn Numpad8>
	<DoHotkey Hotkey ScrollLockOn NumpadUp>
  <Hotkey ScrollLockOn Numpad9>
	<DoHotkey Hotkey ScrollLockOn NumpadPgUp>
  <Hotkey ScrollLockOn Numpad0>
	<DoHotkey Hotkey ScrollLockOn NumpadInsert>}
	puts $hK {  <Hotkey ScrollLockOn Shift Numpad1>
	<DoHotKey Hotkey ScrollLockOn Shift NumpadEnd>
  <Hotkey ScrollLockOn Shift Numpad2>
	<DoHotKey Hotkey ScrollLockOn Shift NumpadDown>
  <Hotkey ScrollLockOn Shift Numpad3>
	<DoHotKey Hotkey ScrollLockOn Shift NumpadPgDn>
  <Hotkey ScrollLockOn Shift Numpad4>
	<DoHotKey Hotkey ScrollLockOn Shift NumpadLeft>
  <Hotkey ScrollLockOn Shift Numpad5>
	<DoHotkey Hotkey ScrollLockOn Shift Clear>
  <Hotkey ScrollLockOn Shift Numpad6>
	<DoHotkey Hotkey ScrollLockOn Shift NumpadRight>
  <Hotkey ScrollLockOn Shift Numpad7>
	<DoHotkey Hotkey ScrollLockOn Shift NumpadHome>
  <Hotkey ScrollLockOn Shift Numpad8>
	<DoHotkey Hotkey ScrollLockOn Shift NumpadUp>
  <Hotkey ScrollLockOn Shift Numpad9>
	<DoHotkey Hotkey ScrollLockOn Shift NumpadPgUp>
  <Hotkey ScrollLockOn Shift Numpad0>
	<DoHotkey Hotkey ScrollLockOn Shift NumpadInsert>}
	puts $hK ""
	puts $hK {// This is the hotkey that closes all windows-- Ctrl-Alt-o (letter O)	}
	puts $hK "  <Hotkey ScrollLockOn Alt Ctrl o>"
	puts $hK $winlabels
	puts $hK {	<CloseWin>
	}
	puts $hK "" 
	puts $hK {// This is a special hotkey I made for reloading all your user interfaces in wow.}
	puts $hK {// Ctrl-L (case never matters) will enter /reload into each window}
	puts $hK "  <Hotkey ScrollLockOn Ctrl l>"
	puts $hK $winlabels
	puts $hK {	<Key enter>
	<Wait 250>
	<Key divide>
	<Wait 25>
	<Text reload>
	<Wait 175>
	<Key enter>
}
	puts $hK {// This is the true magic...this runs /init in each window to set up bindings and macros!
// Ctrl-i}
	puts $hK "  <Hotkey ScrollLockOn Ctrl i>"
	puts $hK $winlabels
	puts $hK {	<Key enter>
	<Wait 250>
	<Key divide>
	<Wait 25>
	<Text init>
	<Wait 175>
	<Key enter>
}
	puts $hK {// This sends enter to each window to log in
// Ctrl-i}
	puts $hK "  <Hotkey ScrollLockOn Ctrl e>"
	puts $hK $winlabels
	puts $hK {	<Key enter>
}
	puts $hK {//-----------------------------------------------------------
// This is the key you hold down to send mouse clicks to all windows.
// I use ~ (the key to the left of the 1 key)
// That key is oem5 in Germany and oem8 in UK. If none of those work, you may be oem7.
//-----------------------------------------------------------}
	#puts $hK "<UseKeyAsModifier $oem>"
	#puts $hK "<Hotkey ScrollLockOn $oem LButton, RButton, Button4, Button5>"
	#puts $hK {      <SaveMousePos>}
	#puts $hK {      <Wait 5>}
	#puts $hK $winlabels
	#puts $hK {      <ClickMouse %TriggerMainKey%>}
	#puts $hK {      <Wait 5>}
	#puts $hK {      <RestoreMousePos>}
	#puts $hK ""
	puts $hK "  <UseKeyAsModifier $oem>"
	puts $hK "  <Hotkey ScrollLockOn $oem LButton, RButton, Button4, Button5>"

	#puts $hK $winlabels
	#puts $hK {      <Cancel>}
	#puts $hK {	<SaveMousePos>}
	#foreach label [split $winlabels ","] {
	  #set label [regsub {\>$} $label ""]
	  #if { ![regexp {^w} $label] } { continue } 
	  #puts $hK "      <SendLabel $label> <ClickMouse %TriggerMainKey% >"
        #}
	puts $hK {      <SaveMousePos>}
	puts $hK {      <Wait 5>}
	puts $hK $winlabels
	puts $hK {      <ClickMouse %TriggerMainKey%>}
	puts $hK {      <ClickMouse %TriggerMainKey%>}
	puts $hK {      <Wait 5>}
	puts $hK {      <RestoreMousePos>}
	puts $hK ""
	#puts $hK "<CreateColoredButton clique $clique_overlay 0x101010 0x101010>"
	puts -nonewline $hK {<Hotkey ScrollLockOn LButton, MButton, RButton, Button4, Button5>
	<Passthrough>
	<If MouseIsOverWindowRect }
	set toonname [string tolower [lindex $toons(0) 3]]
	set account [lindex $toons(0) 1]
	set length [string length $account]
	if { $length > 2 } {
		set length [string length $account]
		set acctnick "[string index $account 0][string index $account [expr $length-2]][string index $account [expr $length-1]]"
	} else {
		set acctnick ${account}
	}
	puts -nonewline $hK "${toonname}_1${acctnick}"
	puts $hK " $clique_overlay >"
	set allbutmain [regsub "w0," $winlabels ""] 
      puts $hK {	<SaveMousePos>
	<Wait 5>}
	puts $hK "${allbutmain}"
	puts $hK {	<ClickMouse Scale %Trigger%>
	<Wait 5>
	<RestoreMousePos>}
	puts $hK ""
	puts $hK {//-----------------------------------------------------------
// This is the catch-all hotkey definition. Every key here
// will be sent to both windows. Any key NOT HERE will NOT.
// Notice there is an exception list at the end.
// The word %Trigger% gets replaced with whatever key you clicked.
//-----------------------------------------------------------
  <Hotkey ScrollLockOn A-Z, 1-9, Shift, Ctrl, Alt, Plus, Minus, Esc , Divide, F1-F12 except 1-6,E,F,Q,H, W, A, S, D, R, T, Y, I, U, J, V>}
	puts $hK $winlabels
	puts $hK {	<Key %Trigger%>}
	puts $hK ""
	puts $hK {//-----------------------------------------------------------
// THIS KEY IS DIFFERENT. THESE are MOVEMENT key definitions.
// This is different from a Hotkey. Hotkeys only work once, the instant
// You press them. Movement keys can be held down, and they work
// constantly.
// Notice, asdw, the normal wow keys aren't here. You don't want your normal
// wow movement keys to move your side  toons.
// Use the arrow keys for that. (see, they are there)
//-----------------------------------------------------------
  <MovementHotkey ScrollLockOn space, up, down, left, right,e,q>}
	puts $hK $winlabels
	puts $hK "\t<Key %Trigger%>"
	puts $hK ""
puts $hK {//You can even make special movement keys for just some of your toons.}
        set hunter_present 0
	for { set i 0 } { $i<[array size toons] } { incr i } {
	  set role [lindex $toons($i) 4]
          if {$role=="hunter"} { set hunter_present 1}
  	}
	if {$hunter_present} { 
		puts $hK {//Hunter backup}
		puts $hK {  <MovementHotkey ScrollLockOn T>}
		set totallabels 0
		set hunterlabels "\t<Sendlabel"
		for { set i 0 } { $i<[array size toons] } { incr i } {
	  	set role [lindex $toons($i) 4]
	  	set role [string tolower $role ]
	  	set raids [lrange $toons($i) 5 end]
			set comps 1
			foreach myraid $raids {
			  	regexp {([a-z]|[A-Z])([0-9])?} $myraid match foo cpunum
			  	if { [lsearch $comps $cpunum] == -1 } { lappend comps $cpunum } 
			}
			foreach mycomp $comps {
	    	if { $role=="hunter" } { 
	      	if { $hunterlabels=="\t<Sendlabel" } { set hunterlabels  "$hunterlabels w${totallabels}" } else { set hunterlabels "$hunterlabels,w${totallabels}" } 
				}
		  	incr totallabels		
	  	}
		}
		set hunterlabels "${hunterlabels}>"
		puts $hK $hunterlabels
		puts $hK "	<Key Down>"
		puts $hK ""
	}
        set melee_present 0
	for { set i 0 } { $i<[array size toons] } { incr i } {
	  set role [lindex $toons($i) 4]
          if {$role=="melee" } { set melee_present 1}
  	}
	if {$melee_present} {
		puts $hK {//Melee backup}
		puts $hK {  <MovementHotkey ScrollLockOn v>}
		set totallabels 0
		set meleelabels "\t<Sendlabel"
		for { set i 0 } { $i<[array size toons] } { incr i } {
	  	set role [lindex $toons($i) 4]
	  	set role [string tolower $role ]
	  	set raids [lrange $toons($i) 5 end]
			set comps 1
			foreach myraid $raids {
			  	regexp {([a-z]|[A-Z])([0-9])?} $myraid match foo cpunum
			  	if { [lsearch $comps $cpunum] == -1 } { lappend comps $cpunum } 
			}
			foreach mycomp $comps {
	  		if { $role=="melee" } { 
	   	 	if { $meleelabels=="\t<Sendlabel" } { set meleelabels  "$meleelabels w${totallabels}" } else { set meleelabels "$meleelabels,w${totallabels}" } 
	  		}
				incr totallabels
			}
		}
		set meleelabels "${meleelabels}>"
		puts $hK $meleelabels
		puts $hK "	<Key Down>"
		puts $hK ""
		puts $hK {//Melee forward}
		puts $hK {  <MovementHotkey ScrollLockOn r>}
		set totallabels 0
		set meleelabels "\t<Sendlabel"
		for { set i 0 } { $i<[array size toons] } { incr i } {
	  	set role [lindex $toons($i) 4]
	  	set role [string tolower $role ]
	  	set raids [lrange $toons($i) 5 end]
			set comps 1
			foreach myraid $raids {
			  	regexp {([a-z]|[A-Z])([0-9])?} $myraid match foo cpunum
			  	if { [lsearch $comps $cpunum] == -1 } { lappend comps $cpunum } 
			}
			foreach mycomp $comps {
	  		if { $role=="melee" } { 
	    		if { $meleelabels=="\t<Sendlabel" } { set meleelabels  "$meleelabels w${totallabels}" } else { set meleelabels "$meleelabels,w${totallabels}" } 
	  		}
				incr totallabels
			}
		}
		set meleelabels "${meleelabels}>"
		puts $hK $meleelabels
		puts $hK "	<Key Up>"
		puts $hK ""
	}
        set healer_present 0
	for { set i 0 } { $i<[array size toons] } { incr i } {
	  set role [lindex $toons($i) 4]
          if {$role=="healer" } { set healer_present 1}
  	}
	if {$healer_present} {
		puts $hK {//Healer backup}
		puts $hK {  <MovementHotkey ScrollLockOn Y>}
		set totallabels 0
		set healerlabels "\t<Sendlabel"
		for { set i 0 } { $i<[array size toons] } { incr i } {
	  	set dname [lindex $toons($i) 3]
	  	set role [lindex $toons($i) 4]
	  	set role [string tolower $role ]
	  	set raids [lrange $toons($i) 5 end]
			set comps 1
			foreach myraid $raids {
			  	regexp {([a-z]|[A-Z])([0-9])?} $myraid match foo cpunum
			  	if { [lsearch $comps $cpunum] == -1 } { lappend comps $cpunum } 
			}
			foreach mycomp $comps {
	  		if { $role=="healer" } { 
	   	 	if { $healerlabels=="\t<Sendlabel" } { set healerlabels  "$healerlabels w${totallabels}" } else { set healerlabels "$healerlabels,w${totallabels}" } 
	  		}
				incr totallabels
			}
		}
		set healerlabels "${healerlabels}>"
		puts $hK $healerlabels
		puts $hK "	<Key Down>"
		puts $hK ""
	}
        set mana_present 0
	for { set i 0 } { $i<[array size toons] } { incr i } {
	  set role [lindex $toons($i) 4]
          if {$role=="healer" || $role=="caster" } { set mana_present 1}
  	}
	if {$mana_present} {
		puts $hK {//Mana backup}
		puts $hK {  <MovementHotkey ScrollLockOn H>}
		set totallabels 0
		set manalabels "\t<Sendlabel"
		for { set i 0 } { $i<[array size toons] } { incr i } {
	  	set role [lindex $toons($i) 4]
	  	set role [string tolower $role ]
	  	set raids [lrange $toons($i) 5 end]
			set comps 1
			foreach myraid $raids {
			  	regexp {([a-z]|[A-Z])([0-9])?} $myraid match foo cpunum
			  	if { [lsearch $comps $cpunum] == -1 } { lappend comps $cpunum } 
			}
			foreach mycomp $comps {
	  		if { $role=="healer" || $role=="caster" } { 
	    		if { $manalabels=="\t<Sendlabel" } { set manalabels  "$manalabels w${totallabels}" } else { set manalabels "$manalabels,w${totallabels}" } 
	  		}
				incr totallabels
			}
		}
		set manalabels "${manalabels}>"
		puts $hK $manalabels
		puts $hK "	<Key Down>"
		puts $hK ""
	}
puts $hK {//-------------------------------------------------------------
// Everything below these lines are special hotkeys I made.

// First trick key--when you hit 0, only send it to the window where your mouse is.
// 
  <Hotkey ScrollLockOn 0>
	<SendFocusWin>
	<Key 0>
}
	puts $hK {// More magic. I redefined alt-1
// When you hit it, it will send alt-1 AND F11 (which is a macro that says /assist Furyswipes)
// So alt-1 forces people to assist main.
// I do it this way so you only have to change one macro to change your main.
// Don't put assist in your dps macros.
  <Hotkey ScrollLockOn Alt 1>}
	puts $hK $winlabels
	puts $hK "\t<Key Alt 1>"
	set totallabels 0
	for { set i 0 } { $i<[array size toons] } { incr i } {
  		set toonname [string tolower [lindex $toons($i) 3]]
  		set account [lindex $toons($i) 1]
  		set raids [lrange $toons($i) 5 end]
		set comps 1
		foreach myraid $raids {
			regexp {([a-z]|[A-Z])([0-9])?} $myraid match foo cpunum
			if { [lsearch $comps $cpunum] == -1 } { lappend comps $cpunum } 
		}
  		set length [string length $account]
		foreach mycomp $comps {
  			if { $length > 2 } {
    				set length [string length $account]
    				set acctnick "[string index $account 0][string index $account [expr $length-2]][string index $account [expr $length-1]]"
  			} else {
    				set acctnick ${account}
  			}
  			set acct_winname($account) ${acctnick}
  			puts $hK "\t<if MouseIsOverWindow ${toonname}_${mycomp}${acctnick}>"
			puts $hK $winlabels
			puts $hK "\t<Key ctrl f[expr 3+$totallabels]>"
			incr totallabels
		}
	}
	puts $hK ""
	puts $hK {// Same magic for 2-6}
	puts $hK {  <Hotkey ScrollLockOn 2-6>}
	puts $hK $winlabels
	puts $hK "\t<Key %Trigger%>"
	set totallabels 0
	for { set i 0 } { $i<[array size toons] } { incr i } {
	  set toonname [string tolower [lindex $toons($i) 3]]
	  set account [lindex $toons($i) 1]
	  set raids [lrange $toons($i) 5 end]
		set comps 1
		foreach myraid $raids {
			regexp {([a-z]|[A-Z])([0-9])?} $myraid match foo cpunum
			if { [lsearch $comps $cpunum] == -1 } { lappend comps $cpunum } 
		}
	  set length [string length $account]
		foreach mycomp $comps {
	  	if { $length > 2 } {
	    	set length [string length $account]
	    	set acctnick "[string index $account 0][string index $account [expr $length-2]][string index $account [expr $length-1]]"
	  	} else {
	    	set acctnick ${account}
	  	}
	  	set acct_winname($account) ${acctnick}
	  	puts $hK "\t<if MouseIsOverWindow ${toonname}_${mycomp}${acctnick}>"
		puts $hK $winlabels
		puts $hK "\t<Key ctrl f[expr 3+$totallabels]>"
			incr totallabels
		}
	}
	puts $hK {  <Hotkey ScrollLockOn 1>}
	puts $hK $winlabels
	puts $hK "\t<Key 1>"
	set meleewinlabs ""
	set melee_present 0
	for { set i 0 } { $i<[array size toons] } { incr i } {
	  set role [lindex $toons($i) 4]
          if {$role=="melee" } { 
		  if { ! $melee_present } {
			  set meleewinlabs "\t<SendLabel w${i}"
		  } else { 
			  set meleewinlabs "${meleewinlabs},w${i}"
		  }
		  set melee_present 1
  	  }
	}
	if { $melee_present } { set meleewinlabs "${meleewinlabs}>"}
	if { $melee_present } {
		set totallabels 0
		for { set i 0 } { $i<[array size toons] } { incr i } {
		  	set toonname [string tolower [lindex $toons($i) 3]]
		  	set account [lindex $toons($i) 1]
		  	set role [lindex $toons($i) 4]
		  	set raids [lrange $toons($i) 5 end]
			set comps 1
			foreach myraid $raids {
				regexp {([a-z]|[A-Z])([0-9])?} $myraid match foo cpunum
				if { [lsearch $comps $cpunum] == -1 } { lappend comps $cpunum } 
			}
		  	set length [string length $account]
			foreach mycomp $comps {
	  			if { $length > 2 } {
	    				set length [string length $account]
	    				set acctnick "[string index $account 0][string index $account [expr $length-2]][string index $account [expr $length-1]]"
	  			} else {
	    				set acctnick ${account}
	  			}
	  			set acct_winname($account) ${acctnick}
	  			puts $hK "\t<if MouseIsOverWindow ${toonname}_${mycomp}${acctnick}>"
				puts $hK $meleewinlabs
				puts $hK "\t<Key shift f[expr 3+$totallabels]>"
				incr totallabels
			}
		}
	}
	puts $hK ""
	puts $hK {// Now--ANY KEY that uses a HKN MODIFIER (alt/ctrl/shift) WILL NOT WORK.
// UNLESS.......you define it!
  <Hotkey ScrollLockOn Alt 2>}
	puts $hK $winlabels
	puts $hK {	<Key Alt 2> 
  <Hotkey ScrollLockOn Alt 3>}
	puts $hK $winlabels
	puts $hK {	<Key Alt 3> }
	puts $hK ""
	puts $hK {// Now, alt-4 is a special key for 5-minute multiboxing.
// It also sends an F10 (a macro with /follow furyswipes) and F11 (the assist macro)
// So alt-4 is how you make your toons follow again.
// YOU WILL USE ALT-4 CONSTANTLY. GET USED TO IT, SUCKAS.
  <Hotkey ScrollLockOn Alt 4>
	<ResetToggles>}
	set totallabels 0
	for { set i 0 } { $i<[array size toons] } { incr i } {
	  set toonname [string tolower [lindex $toons($i) 3]]
	  set account [lindex $toons($i) 1]
	  set raids [lrange $toons($i) 5 end]
		set comps 1
		foreach myraid $raids {
			regexp {([a-z]|[A-Z])([0-9])?} $myraid match foo cpunum
			if { [lsearch $comps $cpunum] == -1 } { lappend comps $cpunum } 
		}
	  set length [string length $account]
		foreach mycomp $comps {
	  		if { $length > 2 } {
	    			set length [string length $account]
	    			set acctnick "[string index $account 0][string index $account [expr $length-2]][string index $account [expr $length-1]]"
	  		} else {
	    			set acctnick ${account}
	  		}
	  		set acct_winname($account) ${acctnick}
	  		puts $hK "\t<if MouseIsOverWindow ${toonname}_${mycomp}${acctnick}>"
			puts $hK $winlabels
			puts $hK "\t<Key shift f[expr 3+$totallabels]>"
			puts $hK "\t<Key ctrl f[expr 3+$totallabels]>"
			puts $hK "\t<endif>"
			incr totallabels
		}
	}
	puts $hK $winlabels
	puts $hK {	<Key Alt 4>}
	puts $hK ""
	puts $hK {// F is my favorite new key. It is mapped to "Interact with target" keybind.
// When you hit it the first time, everyone will assist your leader.
// When you hit it a second time. LEEEEEEEEROYYYYYY!!!!!!!
// Everyone will attack your target or open a vendor, OR skin a dead animal,
// ...you get the idea.
  <Hotkey ScrollLockOn f>
	<toggle>}
	set totallabels 0
	for { set i 0 } { $i<[array size toons] } { incr i } {
	  set toonname [string tolower [lindex $toons($i) 3]]
	  set account [lindex $toons($i) 1]
	  set raids [lrange $toons($i) 5 end]
		set comps 1
		foreach myraid $raids {
			regexp {([a-z]|[A-Z])([0-9])?} $myraid match foo cpunum
			if { [lsearch $comps $cpunum] == -1 } { lappend comps $cpunum } 
		}
	  set length [string length $account]
		foreach mycomp $comps {
	  	if { $length > 2 } {
	    	set length [string length $account]
	    	set acctnick "[string index $account 0][string index $account [expr $length-2]][string index $account [expr $length-1]]"
	  	} else {
	    	set acctnick ${account}
	  	}
	  	set acct_winname($account) ${acctnick}
	  	puts $hK "\t<if MouseIsOverWindow ${toonname}_${mycomp}${acctnick}>"
		puts $hK $winlabels
		puts $hK "\t<Key ctrl f[expr 3+$totallabels]>"
	        puts $hK {	<Key f>}
			incr totallabels
		}
	}
	#puts $hK {	<toggle>}
	#puts $hK $winlabels
	#puts $hK {	<Key f>}
	puts $hK ""
	puts $hK {// Awesome magic here. I put an interrupt skill in shift-3 action bar.
// this goes through each one at a time
// (after focusing on main's target on the first click)
  <Hotkey ScrollLockOn Shift 3>
	<Toggle>}
	set totallabels 0
	for { set i 0 } { $i<[array size toons] } { incr i } {
	  set toonname [string tolower [lindex $toons($i) 3]]
	  set account [lindex $toons($i) 1]
	  set raids [lrange $toons($i) 5 end]
		set comps 1
		foreach myraid $raids {
			regexp {([a-z]|[A-Z])([0-9])?} $myraid match foo cpunum
			if { [lsearch $comps $cpunum] == -1 } { lappend comps $cpunum } 
		}
	  set length [string length $account]
		foreach mycomp $comps {
	  	if { $length > 2 } {
	    	set length [string length $account]
	    	set acctnick "[string index $account 0][string index $account [expr $length-2]][string index $account [expr $length-1]]"
	  	} else {
	    	set acctnick ${account}
	  	}
	  	set acct_winname($account) ${acctnick}
	  	puts $hK "\t<if MouseIsOverWindow ${toonname}_${mycomp}${acctnick}>"
		puts $hK $winlabels
		puts $hK "\t<Key ctrl f[expr 3+$totallabels]>"
			incr totallabels
		}
	}
	for { set i 0 } { $i<$totallabels } { incr i } {
		puts $hK "\t<Toggle>"
		puts $hK "\t<SendLabel w${i}>"
		puts $hK "\t<Key Shift 3>"
	}
	puts $hK ""
	puts $hK {// Shift-4 is also a skill that focuses tank target.
  <Hotkey ScrollLockOn Shift 4> }
	set totallabels 0
	for { set i 0 } { $i<[array size toons] } { incr i } {
	  set toonname [string tolower [lindex $toons($i) 3]]
	  set account [lindex $toons($i) 1]
	  set raids [lrange $toons($i) 5 end]
		set comps 1
		foreach myraid $raids {
			regexp {([a-z]|[A-Z])([0-9])?} $myraid match foo cpunum
			if { [lsearch $comps $cpunum] == -1 } { lappend comps $cpunum } 
		}
	  set length [string length $account]
		foreach mycomp $comps {
	  	if { $length > 2 } {
	    	set length [string length $account]
	    	set acctnick "[string index $account 0][string index $account [expr $length-2]][string index $account [expr $length-1]]"
	  	} else {
	    	set acctnick ${account}
	  	}
	  	set acct_winname($account) ${acctnick}
	  	puts $hK "\t<if MouseIsOverWindow ${toonname}_${mycomp}${acctnick}>"
		puts $hK $winlabels
		puts $hK "\t<Key ctrl f[expr 3+$totallabels]>"
			incr totallabels
		}
	}
	puts $hK "\t<Endif>"
	puts $hK $winlabels
	puts $hK "\t<Key Shift 4>"
	puts $hK ""
	puts $hK {// More boring modifier maps--has to be done}
	puts $hK {  <Hotkey ScrollLockOn Alt 5>}
	puts $hK $winlabels
	puts $hK {	<Key Alt 5> }
	puts $hK {  <Hotkey ScrollLockOn Alt 6>}
	puts $hK $winlabels
	puts $hK {	<Key Alt 6> }
	puts $hK {  <Hotkey ScrollLockOn Alt 7>}
	puts $hK $winlabels
	puts $hK {	<Key Alt 7> }
	puts $hK {  <Hotkey ScrollLockOn Alt 8>}
	puts $hK $winlabels
	puts $hK {	<Key Alt 8> }
	puts $hK {  <Hotkey ScrollLockOn Alt 9>}
	puts $hK $winlabels
	puts $hK {	<Key Alt 9> }
	puts $hK {  <Hotkey ScrollLockOn Alt 0>}
	puts $hK $winlabels
	puts $hK {	<Key Alt 0> }
	puts $hK {  <Hotkey ScrollLockOn Alt Plus>}
	puts $hK $winlabels
	puts $hK {	<Key Alt Plus> }
	puts $hK {  <Hotkey ScrollLockOn Alt Minus>}
	puts $hK $winlabels
	puts $hK {	<Key Alt Minus> }
	puts $hK {// Special one for ctrl-alt-1 if you ever need it.}
	puts $hK {  <Hotkey ScrollLockOn Ctrl Alt 1>}
	puts $hK $winlabels
	puts $hK {	<Key Ctrl Alt 1>}
	puts $hK {  <Hotkey ScrollLockOn Alt F1>}
	puts $hK $winlabels
	puts $hK {	<Key Alt F1>}
	puts $hK {  <Hotkey ScrollLockOn Ctrl 1>}
	puts $hK $winlabels
	puts $hK {	<Key Ctrl 1>}
	puts $hK {  <Hotkey ScrollLockOn Ctrl 2> }
	puts $hK $winlabels
	puts $hK {	<Key Ctrl 2> }
	puts $hK {  <Hotkey ScrollLockOn Ctrl 3>}
	puts $hK $winlabels
	puts $hK {	<Key Ctrl 3> }
	puts $hK {  <Hotkey ScrollLockOn Ctrl 4>}
	puts $hK $winlabels
	puts $hK {	<Key Ctrl 4> }
	puts $hK {  <Hotkey ScrollLockOn Ctrl 5>}
	puts $hK $winlabels
	puts $hK {	<Key Ctrl 5> }
	puts $hK {  <Hotkey ScrollLockOn Ctrl 6>}
	puts $hK $winlabels
	puts $hK {	<Key Ctrl 6> }
	puts $hK {  <Hotkey ScrollLockOn Ctrl 7>}
	puts $hK $winlabels
	puts $hK {	<Key Ctrl 7> }
	puts $hK {  <Hotkey ScrollLockOn Ctrl 8>}
	puts $hK $winlabels
	puts $hK {	<Key Ctrl 8> }
	puts $hK {  <Hotkey ScrollLockOn Ctrl 9>}
	puts $hK $winlabels
	puts $hK {	<Key Ctrl 9> }
	puts $hK {  <Hotkey ScrollLockOn Ctrl 0>}
	puts $hK $winlabels
	puts $hK {	<Key Ctrl 0> }
	puts $hK {  <Hotkey ScrollLockOn Ctrl Plus>}
	puts $hK $winlabels
	puts $hK {	<Key Ctrl Plus> }
	puts $hK {  <Hotkey ScrollLockOn Ctrl Minus>}
	puts $hK $winlabels
	puts $hK {	<Key Ctrl Minus> }
	puts $hK {  <Hotkey ScrollLockOn Shift 1>}
	puts $hK $winlabels
	puts $hK {	<Key Shift 1>}
	puts $hK {// Shift 2 is the polymorph button. First click is assist tank, second click is poly}
	puts $hK {  <Hotkey ScrollLockOn Shift 2>}
        puts $hK "\t<toggle>"
	set totallabels 0
	for { set i 0 } { $i<[array size toons] } { incr i } {
	  set toonname [string tolower [lindex $toons($i) 3]]
	  set account [lindex $toons($i) 1]
	  set raids [lrange $toons($i) 5 end]
		set comps 1
		foreach myraid $raids {
			regexp {([a-z]|[A-Z])([0-9])?} $myraid match foo cpunum
			if { [lsearch $comps $cpunum] == -1 } { lappend comps $cpunum } 
		}
	  set length [string length $account]
		foreach mycomp $comps {
	  	if { $length > 2 } {
	    	set length [string length $account]
	    	set acctnick "[string index $account 0][string index $account [expr $length-2]][string index $account [expr $length-1]]"
	  	} else {
	    	set acctnick ${account}
	  	}
	  	set acct_winname($account) ${acctnick}
	  	puts $hK "\t<if MouseIsOverWindow ${toonname}_${mycomp}${acctnick}>"
		puts $hK $winlabels
		puts $hK "\t<Key ctrl f[expr 3+$totallabels]>"
			incr totallabels
		}
	}
	puts $hK {	<toggle>}
	puts $hK $winlabels
	puts $hK {	<Key Shift 2> }
	puts $hK {  <Hotkey ScrollLockOn Shift 5>}
	puts $hK $winlabels
	puts $hK {	<Key Shift 5> }
	puts $hK {  <Hotkey ScrollLockOn Shift 6>}
	puts $hK $winlabels
	puts $hK {	<Key Shift 6> }
	puts $hK {  <Hotkey ScrollLockOn Shift 7>}
	puts $hK $winlabels
	puts $hK {	<Key Shift 7> }
	puts $hK {  <Hotkey ScrollLockOn Shift 8>}
	puts $hK $winlabels
	puts $hK {	<Key Shift 8> }
	puts $hK {  <Hotkey ScrollLockOn Shift 9>}
	puts $hK $winlabels
	puts $hK {	<Key Shift 9> }
	puts $hK {  <Hotkey ScrollLockOn Shift 0>}
	puts $hK $winlabels
	puts $hK {	<Key Shift 0> }
	puts $hK {  <Hotkey ScrollLockOn Shift Plus>}
	puts $hK $winlabels
	puts $hK {	<Key Shift Plus> }
	puts $hK {  <Hotkey ScrollLockOn Shift Minus>}
	puts $hK $winlabels
	puts $hK {	<Key Shift Minus> }
	puts $hK {  <Hotkey ScrollLockOn Shift F1>}
	puts $hK $winlabels
	puts $hK {	<Key Shift F1>}
	puts $hK {  <Hotkey ScrollLockOn Shift F2>}
	puts $hK $winlabels
	puts $hK {	<Key Shift F2> }
	puts $hK {  <Hotkey ScrollLockOn Shift F3>}
	puts $hK $winlabels
	puts $hK {	<Key Shift F3> }
	puts $hK {  <Hotkey ScrollLockOn Shift F4>}
	puts $hK $winlabels
	puts $hK {	<Key Shift F4> }
	puts $hK {  <Hotkey ScrollLockOn Shift F5>}
	puts $hK $winlabels
	puts $hK {	<Key Shift F5> }
	puts $hK {  <Hotkey ScrollLockOn Shift F6>}
	puts $hK $winlabels
	puts $hK {	<Key Shift F6> }
	puts $hK {  <Hotkey ScrollLockOn Shift F7>}
	puts $hK $winlabels
	puts $hK {	<Key Shift F7> }
	puts $hK {  <Hotkey ScrollLockOn Shift F8>}
	puts $hK $winlabels
	puts $hK {	<Key Shift F8> }
	puts $hK {  <Hotkey ScrollLockOn Shift F9>}
	puts $hK $winlabels
	puts $hK {	<Key Shift F9> }
	puts $hK {  <Hotkey ScrollLockOn Shift F10>}
	puts $hK $winlabels
	puts $hK {	<Key Shift F10> }
	puts $hK {  <Hotkey ScrollLockOn Shift F11>}
	puts $hK $winlabels
	puts $hK {	<Key Shift F11> }
	puts $hK {  <Hotkey ScrollLockOn Shift F12>}
	puts $hK $winlabels
	puts $hK {	<Key Shift F12> }
	close $hK
}
if { ! $nosmoverwrite } { 
	set INSTUFF2TRACK false
	set INAUTODELETE false
	set INTHELIST false
	set INLEVPART false
	set sM [open $SME r]
	set sMN [open tmp w+]
	while { [gets $sM line] >= 0 } {
	  if { [regexp "^FSMB_tank" $line ] } {
	    puts -nonewline $sMN "FSMB_tank="
	    set found_tank false
	    for { set i 0 } { $i<[array size toons] } { incr i } {
	      if { ! $found_tank && [string tolower [lindex $toons($i) 4]] == "tank" } {
	        set name [string totitle [ string tolower [lindex $toons($i) 3]]]
		regexp {^([^-]*)(?:-|$)} $name match basename
		set found_tank true
	        puts $sMN \"$basename\"
	      }
	    }
	    if { ! $found_tank } { puts $sMN \"\" }
          } elseif { [regexp "^FSMB_nomacros" $line ] } {
	    if { $nomacros=="true" } {
	    	puts $sMN "FSMB_nomacros=true"
	    } else { 
		puts $sMN "FSMB_nomacros=nil"
	    }
	  } elseif { [regexp "^FSMB_healerlist" $line ] } {
	    puts -nonewline $sMN "FSMB_healerlist=\{"
	    set first false
	    for { set i 0 } { $i<[array size toons] } { incr i } {
	      if { [ string tolower [lindex $toons($i) 4]] == "healer" } {
	        set name [string totitle [ string tolower [lindex $toons($i) 3]]]
		regexp {^([^-]*)(?:-|$)} $name match basename
	        if { $first=="false" } { 
	          puts -nonewline $sMN \"$basename\"
	          set first true
	        } else {
	          puts -nonewline $sMN ,\"$basename\"
	        } 
	      }
	    }
	    puts $sMN "\}"
	  } elseif { [regexp "^FSMB_toonlist" $line ] } {
	    set toonno 1
	    puts -nonewline $sMN "FSMB_toonlist=\{"
	    set first false
	    for { set i 0 } { $i<[array size toons] } { incr i } {
	      set name [string totitle [ string tolower [lindex $toons($i) 3]]]
	      regexp {^([^-]*)(?:-|$)} $name match basename
	      if { $first=="false" } { 
	        puts -nonewline $sMN \[$toonno\]=\"$basename\"
	        set first true
	      } else {
	        puts -nonewline $sMN ,\[$toonno\]=\"$basename\"
	      } 
	      incr toonno
	    }
	    puts $sMN "\}"
	  } elseif { [regexp "^FSMB_invitelist" $line ] } {
	    set toonno 1
	    puts -nonewline $sMN "FSMB_invitelist=\{"
	    set first false
	    for { set i 0 } { $i<[array size toons] } { incr i } {
	      set name [string totitle [ string tolower [lindex $toons($i) 3]]]
	      if { $first=="false" } { 
	        puts -nonewline $sMN \[$toonno\]=\"$name\"
	        set first true
	      } else {
	        puts -nonewline $sMN ,\[$toonno\]=\"$name\"
	      } 
	      incr toonno
	    }
	    puts $sMN "\}"
		} elseif { [regexp "^MB_RAID" $line ] && $raidname!="" } {
	    puts $sMN "MB_RAID = \"MULTIBOX_$raidname\""
		} elseif { [regexp "^MB_powerleveler" $line ] && $powerleveler!="" } {
	    set powerleveler [string totitle [ string tolower $powerleveler]]
	    puts $sMN "MB_powerleveler=\"$powerleveler\""
		} elseif { [regexp "^MB_bomfollow" $line ] && $bombfollow!="" } {
	    set bombfollow [string totitle [ string tolower $bombfollow]]
	    puts $sMN "MB_bombfollow=\"$bombfollow\""
		} elseif { [regexp "^MB_gazefollow" $line ] && $gazefollow!="" } {
	    set gazefollow [string totitle [ string tolower $gazefollow]]
	    puts $sMN "MB_gazefollow=\"$gazefollow\""
		} elseif { [regexp "^MB_burningfollow" $line ] && $burningfollow!="" } {
	    set burningfollow [string totitle [ string tolower $burningfollow]]
	    puts $sMN "MB_burningfollow=\"$burningfollow\""
	  } elseif { [regexp "^MB_dedicated_healers" $line ] } {
	    puts -nonewline $sMN "MB_dedicated_healers=\{"
	    set first true
	    foreach { tank healer } $dedicated_healers {
	      set tank [string totitle [ string tolower $tank]]
	      set healer [string totitle [ string tolower $healer]]
	      if { $first=="true" } { 
	        puts -nonewline $sMN "$tank=\"$healer\""
	        set first false
	      } else {
	        puts -nonewline $sMN ",$tank=\"$healer\""
	      } 
	    }
	    puts $sMN "\}"
	  } elseif { [regexp "^MB_maxheal" $line ] && $maxheal!="" } {
	    puts -nonewline $sMN "MB_maxheal=\{Druid=[lindex $maxheal 0],Priest=[lindex $maxheal 1],Shaman=[lindex $maxheal 2],Paladin=[lindex $maxheal 3]"
	    puts $sMN "\}"
		} elseif { [regexp "^MB_soulstone_rezzers" $line ] && $dontsoulstone == "true" } {
	    puts $sMN "MB_soulstone_rezzers=false"
		} elseif { [regexp "^MB_soulstone_rezzers" $line ] && $dontsoulstone == "" } {
	    puts $sMN "MB_soulstone_rezzers=true"
		} elseif { [regexp "^MB_frameflash" $line ] && $dontflashframe == "true" } {
	    puts $sMN "MB_frameflash=false"
		} elseif { [regexp "^MB_frameflash" $line ] && $dontflashframe == "" } {
	    puts $sMN "MB_frameflash=true"
		} elseif { [regexp "^MB_autotrade=" $line ] && $useautotrade == "true" } {
	    puts $sMN "MB_autotrade=true"
		} elseif { [regexp "^MB_autotrade=" $line ] && $useautotrade == "" } {
	    puts $sMN "MB_autotrade=false"
		} elseif { [regexp "^MB_autodelete" $line ] && $dontautodelete == "true" } {
	    puts $sMN "MB_autodelete=false"
		} elseif { [regexp "^MB_autodelete" $line ] && $dontautodelete == "" } {
	    puts $sMN "MB_autodelete=true"
		} elseif { [regexp "^MB_buystacks" $line ] && $dontbuystacks == "true" } {
	    puts $sMN "MB_buystacks=false"
		} elseif { [regexp "^MB_buystacks" $line ] && $dontbuystacks == "" } {
	    puts $sMN "MB_buystacks=true"
		} elseif { [regexp "^MB_autopass" $line ] && $dontautopass == "true" } {
	    puts $sMN "MB_autopass=false"
		} elseif { [regexp "^MB_autopass" $line ] && $dontautopass == "" } {
	    puts $sMN "MB_autopass=true"
		} elseif { [regexp "^MB_autoturn" $line ] && $autoturn == "true" } {
	    puts $sMN "MB_autoturn=true"
		} elseif { [regexp "^MB_autoturn" $line ] && $autoturn == "" } {
	    puts $sMN "MB_autoturn=false"
		} elseif { [regexp "^MB_clearcastAM" $line ] && $clearcastmissiles == "true" } {
	    puts $sMN "MB_clearcastAM=true"
		} elseif { [regexp "^MB_clearcastAM" $line ] && $clearcastmissiles == "" } {
	    puts $sMN "MB_clearcastAM=false"
		} elseif { [regexp "^MB_default_warlock_pet" $line ] && $warlockpet != "" } {
	      set warlockpet [string totitle [ string tolower $warlockpet]]
	    	puts $sMN "MB_default_warlock_pet=\"$warlockpet\""
		} elseif { [regexp "^MB_default_warlock_pet" $line ] && $warlockpet == "" } {
	    	puts $sMN "MB_default_warlock_pet=\"Imp\""
		} elseif { [regexp "^MB_hellfire_threshold" $line ] && $healhellfireat != "" } {
	    puts $sMN "MB_hellfire_threshold=$healhellfireat"
		} elseif { [regexp "^MB_hellfire_threshold" $line ] && $healhellfireat == "" } {
	    puts $sMN "MB_hellfire_threshold=.85"
		} elseif { [regexp "^MB_healtank_threshold" $line ] && $healtankat != "" } {
	    puts $sMN "MB_healtank_threshold=$healtankat"
		} elseif { [regexp "^MB_healtank_threshold" $line ] && $healtankat == "" } {
	    puts $sMN "MB_healtank_threshold=.5"
		} elseif { [regexp "^MB_healchump_threshold" $line ] && $healchumpat != "" } {
	    puts $sMN "MB_healchump_threshold=$healchumpat"
		} elseif { [regexp "^MB_healchump_threshold" $line ] && $healchumpat == "" } {
	    puts $sMN "MB_healchump_threshold=.33"
		} elseif { [regexp "^MB_healself_threshold" $line ] && $healselfat != "" } {
	    puts $sMN "MB_healself_threshold=$healselfat"
		} elseif { [regexp "^MB_healself_threshold" $line ] && $healselfat == "" } {
	    puts $sMN "MB_healself_threshold=.3"
		} elseif { [regexp "^FsR_Stuff2Track" $line ] } {
				set INSTUFF2TRACK true
		} elseif {$INSTUFF2TRACK && ![regexp "^FsR" $line] } {
		} elseif {$INSTUFF2TRACK && [regexp "^FsR" $line] && ![regexp "^FsR_Stuff2Track" $line] } {
				set INSTUFF2TRACK false
	    	puts $sMN "FsR_Stuff2Track=\{"
				if { $goldto!="" } {
	        set goldto [string totitle [ string tolower $goldto]]
	    		puts $sMN "\t\[\"Gold\"\] = \{itemkind = \"special\", collector = \{\"$goldto\"\}\},"
				} else {
	    		puts $sMN "\t\[\"Gold\"\] = \{itemkind = \"special\", collector = \{\"\"\}\},"
				}
				puts $sMN  	{	["EmptyBagSlots"] = {itemkind = "special"},
 	["Soul Shard"] = {itemkind = "special"},
	["Sacred Candle"] = {itemkind = "item" , class = {Priest = {AnnounceValue = 5}}},
 	["Symbol of Kings"] = {itemkind = "item" , class = {Paladin = {AnnounceValue = 5}}},
 	["Wild Thornroot"] = {itemkind = "item" , class = {Druid = {AnnounceValue = 5}}},
 	["Major Healing Potion"] = {itemkind = "item", class = {Druid = {},Rogue = {},Warrior = {},Hunter = {},Warlock = {},Mage = {}, Priest = {}, Shaman = {}, Paladin = {}}},
	["Major Mana Potion"] = {itemkind = "item" , class = {Druid = {}, Priest = {}, Shaman = {}, Paladin = {}}},}
				if { $boeto!="" } {
	    		puts -nonewline $sMN "\t\[\"BOE\"\] = \{itemkind = \"itemGrp\", collector = \{"
	    	  set first true
					foreach boetoon $boeto { 
	          set boetoon [string totitle [ string tolower $boetoon]]
					  if { $first } { 
						  puts -nonewline $sMN \"$boetoon\"
							set first false
						} else {
						  puts -nonewline $sMN ,\"$boetoon\"
			      }
					}
					puts $sMN "\}\},"
				} else {
	    		puts $sMN "\t\[\"BOE\"\] = \{itemkind = \"itemGrp\", collector = \{\"\"\}\},"
				}
				if { [array size itemto] > 0 } {
					foreach item [array names itemto ] {
						puts -nonewline $sMN "\t\[\"$item\"\] = \{itemkind = \"itemGrp\", collector = \{"					
							set first true
	            foreach coll $itemto($item) { 
	              set coll [string totitle [ string tolower $coll]]
								if { $first } {
									puts -nonewline $sMN \"$coll\"
									set first false
								} else {
									puts -nonewline $sMN ,\"$coll\"
								}
							}
							puts $sMN "\}\},"
					  }
					} else {
	    			puts $sMN "\t\[\"Lockbox\"\] = \{itemkind = \"itemGrp\", collector = \{\"\"\}\},"
					}
	 		puts $sMN {	["Conjured Sparkling Water"] = {itemkind = "item" , class = {Mage={Ratio=2},Hunter = {Ratio=1}, Warlock = {Ratio=1},Druid = {Ratio=1}, Priest = {Ratio=1}, Shaman = {Ratio=1}, Paladin = {Ratio=1}}}}
			puts $sMN "\}"
			puts $sMN $line
		} elseif { [regexp "^MB_TheList" $line ] } {
				set INTHELIST true
		} elseif {$INTHELIST && ![regexp "^\}" $line] } {
		} elseif {$INTHELIST && [regexp "^\}" $line] } {
			set INTHELIST false
	   	puts $sMN "MB_TheList=\{"
	 	  set first true
		  foreach item [array names autodelete] {
	      if { $first } { 
					puts -nonewline $sMN "\t\[\"$item\"\]=$autodelete($item)"
					set first false
				} else {
					puts -nonewline $sMN ",\n\t\[\"$item\"\]=$autodelete($item)"
			  }
			}
			puts $sMN ""
			puts $sMN $line
		} elseif { [regexp "^MB_levelingparties" $line ] } {
			set INLEVPART true
		} elseif {$INLEVPART && ![regexp "^\}" $line] } {
		} elseif {$INLEVPART && [regexp "^\}" $line] } {
			set INLEVPART false
			set firstparty false
	   	puts $sMN "MB_levelingparties=\{"
			set firstsq true
		  foreach sql [array names levelingparties] { 
	      set sql [string totitle [ string tolower $sql]]
				set sq $levelingparties($sql) 
				if { !$firstsq } { 
				  puts -nonewline $sMN ",\n\t${sql}=\{"
				} else { 
					puts -nonewline $sMN "\t${sql}=\{"
					set firstsq false
				}
				set firstmem true
				foreach sqmem $sq {
	        set sqmem [string totitle [ string tolower $sqmem]]
					if { !$firstmem } { 
						puts -nonewline $sMN ","
						puts -nonewline $sMN "\"$sqmem\""
					} else {
						set firstmem false
						puts -nonewline $sMN "\"$sqmem\""
					}
				}
				puts -nonewline $sMN "\}"
			}
			puts $sMN ""
			puts $sMN $line
	  } else {
	    puts $sMN $line
	  }
	}
	close $sMN
	close $sM
	file copy -force tmp $SME
	file delete tmp
}
puts "YOU CAN CLOSE THIS WINDOW NOW."
