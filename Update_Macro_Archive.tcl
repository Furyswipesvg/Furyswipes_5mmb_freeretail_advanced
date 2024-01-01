proc get_macspec { name } {
array unset specs
set specs("Global")  0
set specs("Warrior") 1
set specs("Paladin") 2
set specs("Hunter") 3
set specs("Rogue") 4
set specs("Priest") 5
set specs("DeathKnight") 6
set specs("Shaman") 7
set specs("Mage") 8
set specs("Warlock") 9
set specs("Monk") 10
set specs("Druid") 11
set specs("DemonHunter") 12
set specs("ARCANE") 62
set specs("FIRE") 63
set specs("FROST") 64
set specs("HOLYPAL") 65
set specs("PROTPAL") 66
set specs("RETRIBUTION") 70
set specs("ARMS") 71
set specs("FURY") 72
set specs("PROT") 73
set specs("BALANCE") 102
set specs("FERAL") 103
set specs("GUARDIAN") 104
set specs("RESTODRU") 105
set specs("BLOOD") 250
set specs("FROSTDK") 251
set specs("UNHOLY") 252
set specs("BEASTMASTERY") 253
set specs("MARKSMANSHIP") 254
set specs("SURVIVAL") 255
set specs("DISCIPLINE") 256
set specs("HOLY") 257
set specs("SHADOW") 258
set specs("ASSASSINATION") 259
set specs("OUTLAW") 260
set specs("SUBTLETY") 261
set specs("ELEMENTAL") 262
set specs("ELE") 262
set specs("ENHANCEMENT") 263
set specs("RESTOSHAM") 264
set specs("AFFLICTION") 265
set specs("DEMONOLOGY") 266
set specs("DESTRUCTION") 267
set specs("DESTRO") 267
set specs("BREWMASTER") 268
set specs("WINDWALKER") 269
set specs("MISTWEAVER") 270
set specs("HAVOC") 577
set specs("VENGEANCE") 581
array unset class
set class("Global")  0
set class("Warrior") 1
set class("Paladin") 2
set class("Hunter") 3
set class("Rogue") 4
set class("Priest") 5
set class("DeathKnight") 6
set class("Shaman") 7
set class("Mage") 8
set class("Warlock") 9
set class("Monk") 10
set class("Druid") 11
set class("DemonHunter") 12
set class("ARCANE") 8
set class("FIRE") 8
set class("FROST") 8
set class("MAGE") 8
set class("HOLYPAL") 2
set class("PROTPAL") 2
set class("RETRIBUTION") 2
set class("ARMS") 1
set class("FURY") 1
set class("PROT") 1
set class("BALANCE") 11
set class("FERAL") 11
set class("GUARDIAN") 11
set class("RESTODRU") 11
set class("BLOOD") 6
set class("FROSTDK") 6
set class("UNHOLY") 6
set class("BEASTMASTERY") 3
set class("MARKSMANSHIP") 3
set class("SURVIVAL") 3
set class("DISCIPLINE") 5
set class("HOLY") 5
set class("SHADOW") 5
set class("ASSASSINATION") 4
set class("OUTLAW") 4
set class("SUBTLETY") 4
set class("ELEMENTAL") 7
set class("ELE") 7
set class("ENHANCEMENT") 7
set class("RESTOSHAM") 7
set class("AFFLICTION") 9
set class("DEMONOLOGY") 9
set class("DESTRUCTION") 9
set class("DESTRO") 9
set class("BREWMASTER") 10
set class("WINDWALKER") 10
set class("MISTWEAVER") 10
set class("HAVOC") 12
set class("VENGEANCE") 12
set match ""
set sname ""
regexp {.*_.*_(\w+)} $name match sname
if { [info exists sname] && [info exists class("$sname") ] && [info exists specs("$sname")] } {
  #puts "$class("$sname") $specs("$sname")"
  return "$class("$sname") $specs("$sname")"
} else {
  return "UNKNOWN"
}
}
set names ""
set macros ""
set all_macros true
foreach fl [glob WTF/Account/*/SavedVariables/GSE.lua] {
set fL [open $fl r]
set found_macros false
while { [gets $fL line] >= 0 } {
	if { $found_macros && [regexp {^\}} $line] } {
		break
	}
	if { [regexp ^GSE3Storage $line] } {
		set found_macros true
	}
	if {$found_macros} { 
		if { [regexp {^\s*\[\".*_.*_} $line] } {
			set length [string length $line]
			set existing_length 0
	                regexp {\["(\S+)\"\]} $line match macname
			if { [regexp {[a-z]} $macname] } { continue }
			#if { $macname == "AOE_FS_FURY" } { puts "Found $macname." }
			set index [lsearch -index 0 $names $macname]
			if { $index != -1 } { 
			  set existing_length [lindex [lindex $names $index] 1] 			
		        }
			if { $all_macros || ($length > $existing_length) } { 
			  if { !$all_macros && ($index != -1) } { 
			    # Remove name/length of repeat macro
			    set names [lreplace $names $index $index]
			    set newmacs ""
			    #Remove all previous macros of same name
			    foreach mac $macros {
				    if {![regexp $macname $mac] } {
					    lappend newmacs $mac
				    }
			    }
			    set macros $newmacs
		          }
			  # Never add an identical macro
			  if { [lsearch -exact $macros $line] == -1 } {
			    lappend macros $line
			    lappend names "$macname $length"
		          }
		        }
		}
	}
}
close $fL

}

set oF [open loaded.lua w]
puts $oF {
	-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
local ModName, Sequences = ...
local GSE = GSE
---- PRINT MISSING GSE
	if GSE == nil then
	print("Addon requires GSE3. You can get it from Curseforge @https://www.curseforge.com/wow/addons/gse-gnome-sequencer-enhanced-advanced-macros")
	return;
	end
local L = GSE.L
local Statics = GSE.Static
local GSEPlugin = LibStub("AceAddon-3.0"):NewAddon(ModName, "AceEvent-3.0")
-----------------------------------------------------------------------------

if GSE.isEmpty(Sequences) then
  local Sequences = {}
end

-----------------------------------------------------------------------------

---- Put the macros here [[MACRO HERE]]
---- We are storing more detail to give more control.
---- To find the ClassID - /gse showspec will tell you what the ClassID and SpecID is for your character
}
foreach macro $macros {
	regexp {\["(\S+)\"\]} $macro match macname
	regexp {= \"(\S+)\",$} $macro match macbody
	#puts "Processing Macro $macname"
	#puts "SDEBUG  [lindex [get_macspec $macname] 1]" 
	#puts "SDEBUG  [lindex [get_macspec $macname] 0]" 
	if { [get_macspec $macname] != "UNKNOWN" } {
	  puts $oF "Sequences\[\"$macname\"\] = \{\n  \[\"Macro\"\] = \[\[$macbody\]\],\n  \[\"SpecID\"\] = [lindex [get_macspec $macname] 1],\n  \[\"ClassID\"\] = [lindex [get_macspec $macname] 0]\n\}"
        }
}
puts $oF {
-----------------------------------------------------------------------------

---- Because we know the names earlier we can dynamically figure out the names.
local macroNames = {}
-- For each k ("MACRO NAME") and v (the macro string and classid) do this loop
for k,v in pairs(Sequences) do
---- Add the name to the list of macroNames
    table.insert(macroNames, k)
end

-----------------------------------------------------------------------------

local function loadSequences(event, arg)
  if arg == ModName then
---- Force overwrite of macros ignoring the players merge preference
    for k,v in pairs(Sequences) do
        local localsuccess, uncompressedVersion = GSE.DecodeMessage(v.Macro)
        GSE.ReplaceMacro(v.ClassID, k, uncompressedVersion[2])
    end


---- Tell GSE to reload the new stuff
    GSE.PerformReloadSequences()


---- Print Success Message
    GSE.Print("Hello, " .. UnitName("player") .. " " .. UnitLevel("player") .. "  - Furyswipes_5mmb Macro Set has been loaded.", ModName)
  end
end


if GSE.RegisterAddon(ModName, GetAddOnMetadata(ModName, "Version"), macroNames) then
  loadSequences("Load", ModName)
end

GSEPlugin:RegisterMessage(Statics.ReloadMessage,  loadSequences)
}
close $oF
