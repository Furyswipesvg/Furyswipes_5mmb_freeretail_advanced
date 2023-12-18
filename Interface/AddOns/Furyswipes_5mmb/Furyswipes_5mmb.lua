FSMB_version="111419_retail"
AceComm=LibStub("AceComm-3.0")
print('Hello from 5mmb!')
FSMB_toonlist={[1]="Eversmile",[2]="Neversmile",[3]="Aslf",[4]="Frawshawwk",[5]="Goodlivin"}
FSMB_invitelist={[1]="Thelnsane",[2]="Elonlnside",[3]="Tolnfinity",[4]="Thelraq",[5]="Anlmpulse"}
FSMB_tank="Eversmile"
FSMB_nomacros=nil
FSMB_healerlist={"Aslf"}
FSMB_maxheal={Druid=3,Priest=3,Shaman=5,Paladin=3}
FSMB_mypoly={["Priest"]="Shackle",["Mage"]="Polymorph",["Druid"]="Hibernate",["Warlock"]="Banish"}
FSMB_myint={["Paladin"]="Hammer of Justice",["Priest"]="Silence",["Mage"]="Counterspell",["Druid"]="Bash",["Shaman"]="Earth Shock",["Hunter"]="Scatter Shot",["Warlock"]="",["Warrior"]="Pummel",["Rogue"]="Kick",}
FSMB_decurse={["Paladin"]="Cleanse",["Priest"]="Dispel Magic",["Mage"]="Remove Lesser Curse",["Druid"]="Remove Curse",["Shaman"]="Cure Poison",["Hunter"]="None",["Warlock"]="None",["Warrior"]="None",["Rogue"]="None",}
-- Find players region and set the spelling for Rank and some other flakey things.
region=GetLocale()
local rankName,hearthStone,textSoulbound,textBoe
if (region == "deDE") then
	rankName = "Rang"
	hearthStone = "Ruhestein"
	textSoulbound = "Seelengebunden"
	textBoe = "Wird beim Anlegen gebunden"
elseif (region == "frFR") then
	rankName = "Rang"
	hearthStone = "Pierre de foyer"
	textSoulbound = "Lié"
	textBoe = "Lié quand équipé"
elseif (region == "esES" or region == "esMX") then
	rankName = "Rango"
	hearthStone = "Piedra de hogar"
	textSoulbound = "Ligado"
	textBoe = "Se liga al equiparlo"
elseif (region == "ptBR") then
	rankName = "Grau"
	hearthStone = "Pedra de Regresso"
	textSoulbound = ""
	textBoe = "Vinculado quando equipado"
elseif (region == "itIT") then
	rankName = "Grado"
	hearthStone = "Hearthstone"
	textSoulbound = "Vincolato"
	textBoe = "Si vincola all'equipaggiamento"
elseif (region == "ruRU") then
	rankName = "???????"
	hearthStone = "?????? ???????????"
	textSoulbound = "???????????? ???????"
	textBoe = "?????????? ???????????? ??? ?????????"
elseif (region == "zhCN" or region == "zhTW") then
	rankName = "??"
	hearthStone = "??"
	textSoulbound = "???"
	textBoe = "?????????? ???????????? ??? ?????????"
elseif (region == "koKR") then
	rankName = "??"
	hearthStone = "???"
	textSoulbound = "?? ???"
	textBoe = "?? ? ??"
else
	rankName = "Rank"
	hearthStone = "Hearthstone"
	textSoulbound = "Soulbound"
	textBoe = "Binds when equipped"
end

-- Find Spellnames by ID, result will be in players locale, tested with german & english
--local hearthStone = GetItemInfo(6948)
	consumeMagic = GetSpellInfo(278326)
	rejuvenation = GetSpellInfo(774)
	swiftmend = GetSpellInfo(18562)
	wildGrowth = GetSpellInfo(48438)
	efflorescence = GetSpellInfo(145205)
	lifebloom = GetSpellInfo(33763)
	regrowth = GetSpellInfo(8936)
	ironbark = GetSpellInfo(102342)
	revitalize = GetSpellInfo(212040)
	tranquility = GetSpellInfo(740)
	rebuke = GetSpellInfo(96231)
	riptide = GetSpellInfo(61295)
	priestHeal = GetSpellInfo(2061)
	healingSurge = GetSpellInfo(8004)
	healingWave = GetSpellInfo(77472)
	chainHeal = GetSpellInfo(1064)
	shamanHeal = GetSpellInfo(8004)
	druidHeal = GetSpellInfo(8936)
	palaHeal = GetSpellInfo(19750)
	divineShield = GetSpellInfo(642)
	druidRebirth = GetSpellInfo(20484)
	crusaderSeal = GetSpellInfo(21082)
	rightSeal = GetSpellInfo(20154)
	conjureWater = GetSpellInfo(5504)
	frostArmor = GetSpellInfo(168)
	iceArmor = GetSpellInfo(7302)
	vivify = GetSpellInfo(116670)
	resuscitate = GetSpellInfo(115178)
	revival = GetSpellInfo(115178)
	reawaken = GetSpellInfo(212051)
	touchOfKarma = GetSpellInfo(122470)
	dampenHarm = GetSpellInfo(122278)
	arcaneIntellect = GetSpellInfo(1459)
	direBearForm = GetSpellInfo(9634)
	bearForm = GetSpellInfo(5487)
	windShear = GetSpellInfo(57994)
	hex = GetSpellInfo(51514)
	victoryRush = GetSpellInfo(34428)
	enragedRegen = GetSpellInfo(184364)
	freezingTrap = GetSpellInfo(187650)
	vanish = GetSpellInfo(1856)
	sap = GetSpellInfo(6770)
	ib = GetSpellInfo(48792)
	unendingRes = GetSpellInfo(104773)
	crimsonVial = GetSpellInfo(185311)
	vr = GetSpellInfo(198793)
	exil = GetSpellInfo(109304)
	vicoryRush = GetSpellInfo(34428)
	feignDeath = GetSpellInfo(5384)
	feedPet = GetSpellInfo(6991)
	callPet = GetSpellInfo(883)
	revivePet = GetSpellInfo(982)
	shootBow = GetSpellInfo(2480)
	shootGun = GetSpellInfo(7918)
	shootCrossbow = GetSpellInfo(7919)
	druidThorns = GetSpellInfo(467)
	markOfTheWild = GetSpellInfo(1126)
	druidWrath = GetSpellInfo(5176)
	flameTongue = GetSpellInfo(8024)
	rockBiter = GetSpellInfo(8017)
	windFury = GetSpellInfo(8232)
	shackleUndead = GetSpellInfo(9484)
	innerFire = GetSpellInfo(588)
	pwFortitude = GetSpellInfo(21562)
	blessingWisdom = GetSpellInfo(203539)
	blessingMight = GetSpellInfo(29381)
	blessingKings = GetSpellInfo(203538)
	ancestralSpirit = GetSpellInfo(2008)
	ancestralVision = GetSpellInfo(212048)
	redemption = GetSpellInfo(7328)
	raiseAlly = GetSpellInfo(61999)
	revive=GetSpellInfo(50769)
	resuscitate=GetSpellInfo(115178)
	massRes = GetSpellInfo(212036)
	priestRes = GetSpellInfo(24173)
	resurrection = GetSpellInfo(24173)
	drainSoul = GetSpellInfo(1120)
	prismaticBarrier = GetSpellInfo(235450)
	demonSkin = GetSpellInfo(687)
	demonArmor = GetSpellInfo(12956)
	magePoly = GetSpellInfo(118)
	druidHibernate = GetSpellInfo(2637)
	warlockBanish = GetSpellInfo(710)
	repentance = GetSpellInfo(20066)
	hammerJustice = GetSpellInfo(853)
	priestSilence = GetSpellInfo(15487)
	mageCounter = GetSpellInfo(2139)
	druidBash = GetSpellInfo(5211)
	earthShock = GetSpellInfo(8042)
	counterShot = GetSpellInfo(147362)
	warPummel = GetSpellInfo(6552)
	rogueKick = GetSpellInfo(1766)
	palaCleanse = GetSpellInfo(4987)
	dispelMagic = GetSpellInfo(527)
	remLesserCurse = GetSpellInfo(475)
	remCurse = GetSpellInfo(2782)
	curePoison = GetSpellInfo(526)
	spearHand = GetSpellInfo(116705)
	paralysis = GetSpellInfo(115078)
	astralShift = GetSpellInfo(108271)
	imprison = GetSpellInfo(217832)
	blur = GetSpellInfo(198589)
	disrupt = GetSpellInfo(183752)
	mindfreeze = GetSpellInfo(47528)
	consumeMagic = GetSpellInfo(278326)
	detox = GetSpellInfo(115450)

FSMB_mydecurse=FSMB_decurse[UnitClass("player")]
FSMB_maxheal={Druid=11,Priest=11,Shaman=11,Paladin=11}
FSMB_myrez={["PALADIN"]=(redemption),["SHAMAN"]=(ancestralSpirit),["DRUID"]=(revive),["MONK"]=(resuscitate),["PRIEST"]=(resurrection),["DEATHKNIGHT"]=(raiseAlly)}
FSMB_mypoly={["HUNTER"]=(freezingTrap),["SHAMAN"]=(hex),["ROGUE"]=(sap),["DEATHKNIGHT"]=("NONE"),["DEMONHUNTER"]=(imprison),["MONK"]=(paralysis),["PRIEST"]=(shackleUndead),["MAGE"]=(magePoly),["DRUID"]=(druidHibernate),["WARLOCK"]=(warlockBanish),["PALADIN"]=(repentance)}
FSMB_selfheal={["DEATHKNIGHT"]=(ib),["DEMONHUNTER"]=(blur),["MONK"]=(spearHand),["PALADIN"]=(divineShield),["PRIEST"]=(priestHeal),["MAGE"]=(iceBlock),["DRUID"]=(druidHeal),["SHAMAN"]=(shamanHeal),["HUNTER"]=(exil),["WARLOCK"]=(unendingRes),["WARRIOR"]=(victoryRush),["ROGUE"]=(vanish),}
FSMB_myint={["DEATHKNIGHT"]=(mindfreeze),["DEMONHUNTER"]=(disrupt),["MONK"]=(spearHand),["PALADIN"]=(hammerJustice),["PRIEST"]=(priestSilence),["MAGE"]=(mageCounter),["DRUID"]=(druidBash),["SHAMAN"]=(windShear),["HUNTER"]=(counterShot),["WARLOCK"]="",["WARRIOR"]=(warPummel),["ROGUE"]=(rogueKick),}
FSMB_myint["PALADIN"]=rebuke
FSMB_decurse={["MONK"]=(detox),["DEMONHUNTER"]=(consumeMagic),["PALADIN"]=(palaCleanse),["PRIEST"]=(dispelMagic),["MAGE"]=(remLesserCurse),["DRUID"]=(remCurse),["SHAMAN"]=(curePoison),["HUNTER"]="None",["WARLOCK"]="None",["WARRIOR"]="None",["ROGUE"]="None",}
FSMB_heal_names={["MONK"]=(vivify),["PALADIN"]=(palaHeal),["PRIEST"]=(priestHeal),["DRUID"]=(druidHeal),["SHAMAN"]=(shamanHeal)}
FSMB_mydecurse=FSMB_decurse[UnitClass("player")]
myname=UnitName("player")
myclass=UnitClass("player")
mylevel=UnitLevel("player")
-- Find players class, first variable is in players locale, second in english and in CAPS
notUsed, myClass=UnitClass("player")
if UnitLevel("player")>7 then 
	FSMB_myseal="Seal of the Crusader"
else
	FSMB_myseal="Seal of Righteousness"
end
FSMB_myaura="Aura of Devotion"
SLASH_INIT1="/init"
SlashCmdList["INIT"]=function()
	init()
end
SLASH_VERSION1 = '/version'
	SlashCmdList['VERSION'] = function(arg)
	print("Furyswipes_5mmb version is "..FSMB_version)
end
FlashClientIcon = function() end
FSMB_msgcd=GetTime()
function GrabSpell(spell)
		PickupSpellBookItem(spell)
end
function FindInTable(table,string)
	--only works on 1D tables
	if not table then return end
	for i,v in pairs(table) do
		if v==string then return i end
	end
	return nil
end
function init()
	if UnitAffectingCombat("player") then return end
	myspec=GetSpecialization()
	if mylevel>39 then bearform=(direBearForm) else bearform=(bearForm) end
	if myClass=="WARRIOR" then
		FSMB_IsMelee=true
		if myspec==3 then myspec="PROT"
		elseif myspec==1 then myspec="ARMS"
		else myspec="FURY" end
	elseif myClass=="DEATHKNIGHT" then
		FSMB_IsMelee=true
		if myspec==3 then myspec="UNHOLY"
		elseif myspec==2 then myspec="FROST"
		else myspec="BLOOD" end
	elseif myClass=="DRUID" then
		if myspec==4 then myspec="RESTORATION"
		elseif myspec==3 then myspec="GUARDIAN"
		elseif myspec==2 then myspec="FERAL" FSMB_IsMelee=true
		else myspec="BALANCE" end
	elseif myClass=="MAGE" then
		if myspec==1 then myspec="ARCANE"
		elseif myspec==2 then myspec="FIRE"
		else myspec="FROST" end
	elseif myClass=="SHAMAN" then
		if myspec==3 then myspec="RESTOSHAM"
		elseif myspec==2 then myspec="ENHANCEMENT" FSMB_IsMelee=true
		else myspec="ELEMENTAL" end
	elseif myClass=="HUNTER" then 
		if myspec==3 then myspec="SURVIVAL"
		elseif myspec==2 then myspec="MARKSMANSHIP"
		else myspec="BEASTMASTERY" end
	elseif myClass=="PRIEST" then
		if myspec==3 then myspec="SHADOW"
		elseif myspec==2 then myspec="HOLY"
		else myspec="DISCIPLINE" end
	elseif myClass=="ROGUE" then
		FSMB_IsMelee=true
		if myspec==3 then myspec="SUBTLETY"
		elseif myspec==2 then myspec="OUTLAW"
		else myspec="ASSASINATION" end
	elseif myClass=="MONK" then
		FSMB_IsMelee=true
		if myspec==3 then myspec="WINDWALKER"
		elseif myspec==2 then myspec="MISTWEAVER"
		else myspec="BREWMASTER" end
	elseif myClass=="DEMONHUNTER" then
		FSMB_IsMelee=true
		if myspec==2 then myspec="VENGEANCE"
		else myspec="HAVOC" end
	elseif myClass=="WARLOCK" then
		if myspec==3 then myspec="DESTRUCTION"
		elseif myspec==2 then myspec="DEMONOLOGY"
		else myspec="AFFLICTION" end
	elseif myClass=="PALADIN" then
		if myspec==1 then myspec="HOLYPAL" FSMB_IsMelee=true
		elseif myspec==2 then myspec="PROTPAL"
		else myspec="RETRIBUTION" end
	end
local myname=UnitName("player")
local myclass=UnitClass("player")
local mylevel=UnitLevel("player")
clearmacros()
	local macroId = CreateMacroFS("party_fs", "Ability_HUNTER_pathfinding", "/run PartyUp()" , personal);
	PickupMacro(macroId)
	PlaceAction(10)
	PickupMacro(macroId)
	PlaceAction(22)
	PickupMacro(macroId)
	PlaceAction(82)
	PickupMacro(macroId)
	PlaceAction(94)
	PickupMacro(macroId)
	PlaceAction(106)
	PickupMacro(macroId)
	PlaceAction(118)
	ClearCursor()
	local slot=43
	local idx=0
	local i
	for i=1,TableLength(FSMB_toonlist) do
		if myname==FSMB_toonlist[i] then
			macroId = CreateMacro("f"..i.."_fs", "Ability_hunter_pet_gorilla", "", nil);
		else
			macroId = CreateMacro("f"..i.."_fs", "Ability_hunter_pet_gorilla", "/follow "..FSMB_toonlist[i].."\n/run SetView(4)", nil);
		end
		PickupMacro(macroId)
		PlaceAction(slot+i)
		ClearCursor()
	end


		macroId = CreateMacroFS("init_fs", "Ability_HUNTER_pathfinding", "/init" , hunterpersonal);
	PickupMacro(macroId)
	PlaceAction(43)
	ClearCursor()
	local slot=32
	local idx=0
	local i
		for i=1,TableLength(FSMB_toonlist) do
			if i==6 then slot=44 idx=0 end
			if i>10 then break end
			if myname==FSMB_toonlist[i] then
				macroId = CreateMacroFS("a"..i.."_fs", "Ability_HUNTER_pet_hyena", "/console autoInteract 0", nil);
			else
				macroId = CreateMacroFS("a"..i.."_fs", "Ability_HUNTER_pet_hyena", "/console autoInteract 1\n/assist "..FSMB_toonlist[i], nil);
			end
			PickupMacro(macroId)
			PlaceAction(slot+idx)
			ClearCursor()
			idx=idx+1
		end
	if myClass=="MONK" or myClass=="SHAMAN" or myClass=="PRIEST" or myClass=="PALADIN" or myClass=="DRUID" then
		local slot=49
		local idx=0
		local i
		for i=1,TableLength(FSMB_toonlist) do
			if i==11 then break end
			if myClass=="SHAMAN" and myspec=="RESTOSHAM" then
				if FSMB_toonlist[i]==myname then
					heallist="\n/castsequence [@player] reset=combat/30 "..riptide..","..healingSurge..","..healingSurge..","..healingSurge..","..healingSurge..","..healingSurge
				else
					heallist="\n/target "..FSMB_toonlist[i].."\n/castsequence [nomod] reset=combat/10 "..riptide..","..healingSurge..","..healingSurge..","..healingSurge..","..healingSurge..","..healingSurge..","..healingWave
				end
			elseif myClass=="DRUID" and myspec=="RESTORATION" then
				if FSMB_toonlist[i]==myname then
					heallist="\n/castsequence [@player] reset=combat/30 "..efflorescence..","..swiftmend..","..rejuvenation..","..","..lifebloom..","..rejuvenation..","..regrowth..","..regrowth.."\n/cast [@player] ironbark"
				else
					heallist="\n/target "..FSMB_toonlist[i].."\n/castsequence [nomod] reset=combat/10 "..efflorescence..","..swiftmend..","..rejuvenation..","..lifebloom..","..rejuvenation..","..regrowth..","..regrowth..","..regrowth.."\n/cast ironbark"
				end
			elseif myClass=="MONK" and myspec=="BREWMASTER" and FSMB_toonlist[i]==myname then
				heallist="\n/cast [nochanneling] Expel Harm\n/cast [@player,nochanneling] vivify"
			else
				heallist="\n/cast [@"..FSMB_toonlist[i].."] "..FSMB_heal_names[myClass]
			end
				macroId = CreateMacroFS("h"..i.."_fs", "spell_nature_healingtouch", "/run ClearCursor()\n/cleartarget"..heallist, personal);
				PickupMacro(macroId)
				PlaceAction(slot+idx)
				ClearCursor()
				idx=idx+1
		end
	elseif myname~="Mootalia" then 
		local slot=49
		local idx=0
		local i
		for i=1,TableLength(FSMB_toonlist) do
			PickupAction(slot+idx)
			ClearCursor()
			idx=idx+1
		end
	end
	if myClass=="DRUID" then
		macroId = CreateMacroFS("rebirth_fs", "spell_nature_reincarnation", "\n/cancelform\n/cast "..druidRebirth.."", nil);
		PickupMacro(macroId)
		PlaceAction(68)
		ClearCursor()
	end
	for i=1,TableLength(FSMB_toonlist) do
		macroId=nil
		if i==1 and myname==FSMB_toonlist[i] then
			macroId = CreateMacroFS("makealine_fs", "Ability_HUNTER_pet_tallstrider", "", personal);
		elseif myname==FSMB_toonlist[i] then
			macroId = CreateMacroFS("makealine_fs", "Ability_HUNTER_pet_tallstrider", "/follow "..FSMB_toonlist[i-1], personal);
		end
		if macroId then
			PickupMacro(macroId)
			PlaceAction(60)
			ClearCursor()
		end
	end
	index=CreateMacroFS("reload_fs","spell_frost_stun","/reload",personal)
	PickupMacro(index)
	PlaceAction(31)
	ClearCursor()
	index=CreateMacroFS("leave_fs","spell_nature_purge","/script C_PartyInfo.LeaveParty()",personal)
	PickupMacro(index)
	PlaceAction(30)
	ClearCursor()
	index=CreateMacroFS("dance_fs","ability_DRUID_aquaticform","/dance",nil)
	PickupMacro(index)
	PlaceAction(29)
	ClearCursor()
	-- NONE OF THE FOLLOWING MACROS GET CREATED IF YOU put nomacros in your toonlist
	if not FSMB_nomacros then
		if myClass=="DRUID" then
			local macroId = CreateMacroFS("hearth_fs", "INV_Misc_QuestionMark", "/cancelform\n/use "..hearthStone.."", nil);
			PickupMacro(macroId)
			PlaceAction(26)
			ClearCursor()
		else
			PickupItem(hearthStone)
			PlaceAction(26)
			ClearCursor()
		end
		if myClass=="HUNTER" then
			index=CreateMacroFS("feign_fs","INV_Misc_QuestionMark","/petfollow\n/petpassive\n/stopattack\n/cast "..freezingTrap.."\n/cast "..feignDeath.."",nil)
			PickupMacro(index)
			PlaceAction(61)
			index=CreateMacroFS("feed_fs","INV_Misc_QuestionMark","/cast [pet] "..feedPet.."\n/use 0 1\n/run ClearCursor()\n/cast [nopet] "..callPet.."\n/cast [@pet,dead] "..revivePet.."",nil)
			PickupMacro(index)
			PlaceAction(38)
			ClearCursor()
		end
		if myClass=="WARRIOR" and IsTank(myname) then
			--print("Checking ranged weap")
			if RangedWeaponType() and SpellExists(shoot) then
				GrabSpell(shoot)
				PlaceAction(61)
			elseif RangedWeaponType() and SpellExists(shootGun) then
				GrabSpell(shootGun)
				PlaceAction(61)
			elseif RangedWeaponType() and SpellExists(shootCrossbow) then
				GrabSpell(shootCrossbow)
				PlaceAction(61)
			elseif RangedWeaponType() and SpellExists(shootBow) then
				GrabSpell(shootBow)
				PlaceAction(61)
			end
		end
		if myClass=="DRUID" then
			GrabSpell(druidWrath)
			PlaceAction(61)
			ClearCursor()
			if IsTank(myname) then
				macroId = CreateMacroFS("pull_fs", "INV_Misc_QuestionMark", "/cancelform [nocombat]\n/cast [nocombat] "..druidWrath.."", nil);
				PickupMacro(macroId)
				PlaceAction(61)
				ClearCursor()
			end 
		end
		if myClass=="PRIEST" then
			macroId = CreateMacroFS("shackle_fs", "INV_Misc_QuestionMark", "/cast "..shackleUndead.."", nil);
			PickupMacro(macroId)
			PlaceAction(62)
			ClearCursor()
				local slot=38
				macroId = CreateMacroFS("b1_fs", "INV_Misc_QuestionMark", "/cast [@player] "..pwFortitude.."", nil);
				PickupMacro(macroId)
				PlaceAction(slot)
			macroId = CreateMacroFS("bufft_fs", "INV_Misc_QuestionMark", "/castsequence reset=combat/target "..pwFortitude..",null", personal);
		end
		if myClass=="PALADIN" or myClass=="SHAMAN" or myClass=="DRUID" or myClass =="MONK" or myClass =="PRIEST" or myClass=="DEATHKNIGHT" then
			if FSMB_myrez[myClass] then
				local rezlist=""
				local rezzers={}
				local nonrezzers={}
				if myClass=="PRIEST" and myspec=="HOLY" then 
					macroId = CreateMacroFS("rez_fs", "INV_Misc_QuestionMark", "/cast "..massRes, nil);
					PickupMacro(macroId)
					PlaceAction(8)
					GrabSpell(massRes)
					PlaceAction(68)
					ClearCursor()
				elseif myClass=="SHAMAN" and myspec=="RESTOSHAM" then 
					macroId = CreateMacroFS("rez_fs", "INV_Misc_QuestionMark", "/cast "..ancestralVision, nil);
					PickupMacro(macroId)
					PlaceAction(8)
					GrabSpell(ancestralVision)
					PlaceAction(68)
					ClearCursor()
				else
					if myClass~="DRUID" then
						GrabSpell(FSMB_myrez[myClass])
						PlaceAction(8)
						ClearCursor()
					end
				end
			end
		end
		if myClass=="DRUID" then
				GrabSpell(FSMB_myrez[myClass])
				PlaceAction(8)
				GrabSpell(FSMB_myrez[myClass])
				PlaceAction(20)
				GrabSpell(FSMB_myrez[myClass])
				PlaceAction(80)
				GrabSpell(FSMB_myrez[myClass])
				PlaceAction(92)
				GrabSpell(FSMB_myrez[myClass])
				PlaceAction(104)
				GrabSpell(FSMB_myrez[myClass])
				PlaceAction(116)
				ClearCursor()
			macroId = CreateMacroFS("rebirth_fs", "spell_nature_reincarnation", "\n/cancelform\n/cast "..druidRebirth.."", nil);
			PickupMacro(macroId)
			PlaceAction(9)
			PickupMacro(macroId)
			PlaceAction(21)
			PickupMacro(macroId)
			PlaceAction(81)
			PickupMacro(macroId)
			PlaceAction(93)
			PickupMacro(macroId)
			PlaceAction(105)
			PickupMacro(macroId)
			PlaceAction(117)
			ClearCursor()
		end
		if myClass=="WARLOCK" and SpellExists(drainSoul) then
			GrabSpell(drainSoul)
			PlaceAction(64)
			--index=CreateMacroFS("pet_fs","INV_Misc_QuestionMark","/cast [nopet, group, nocombat] Summon Imp\n/cast [nopet, nogroup, nocombat] Summon Voidwalker")
			GrabSpell(demonSkin)
			GrabSpell(demonArmor)
			PlaceAction(37)
			ClearCursor()
		end
		if myClass=="DEMONHUNTER" and SpellExists(consumeMagic) then
			GrabSpell(consumeMagic)
			PlaceAction(64)
			ClearCursor()
		end
		if myClass=="MAGE" then
			if findSpell(conjureWater,BOOKTYPE_SPELL) then
				GrabSpell(conjureWater)
				PlaceAction(12)
				ClearCursor()
			end
				GrabSpell(prismaticBarrier)
				PlaceAction(37)
				ClearCursor()
				macroId = CreateMacroFS("b1_fs", "INV_Misc_QuestionMark", "/cast [@player] "..arcaneIntellect.."", nil);
				PickupMacro(macroId)
				PlaceAction(38)
				ClearCursor()
			macroId = CreateMacroFS("bufft_fs", "INV_Misc_QuestionMark", "/castsequence reset=combat/target "..arcaneIntellect.."", personal);
			PickupAction(12)
			ClearCursor()
		end
		if myClass=="WARRIOR" then
			macroId = CreateMacroFS("passive_fs", "Spell_magic_polymorphchicken", "/petfollow [mod:alt]\n/stopattack [mod:alt]", hunterpersonal);
			PickupMacro(macroId)
			PlaceAction(62)
			ClearCursor()
		else
			macroId = CreateMacroFS("poly_fs", "INV_Misc_QuestionMark", "/cast "..FSMB_mypoly[myClass], nil);
			PickupMacro(macroId)
			PlaceAction(62)
			ClearCursor()
		end
		local index
		index=CreateMacroFS("setup_fs_"..myspec,"Spell_magic_polymorphchicken","#showtooltip\n/click [button:1] setup_fs_"..myspec.." LeftButton t;\n/petpassive [mod:alt]\n/stopcasting [mod:alt]",nil)
		PickupMacro(index)
		PlaceAction(1)
		if myClass=="DRUID" then
			PickupMacro(index)
			PlaceAction(13)
			PickupMacro(index)
			PlaceAction(73)
			PickupMacro(index)
			PlaceAction(85)
			PickupMacro(index)
			PlaceAction(97)
			PickupMacro(index)
			PlaceAction(109)
		end
		ClearCursor()
		index=CreateMacroFS("single_fs_"..myspec,"ability_searingarrow","#showtooltip\n/click [button:1] single_fs_"..myspec.." LeftButton t;",nil)
		PickupMacro(index)
		PlaceAction(2)
		if myClass=="DRUID" then
			PickupMacro(index)
			PlaceAction(74)
			PickupMacro(index)
			PlaceAction(86)
			PickupMacro(index)
			PlaceAction(98)
			PickupMacro(index)
			PlaceAction(110)
		end
		ClearCursor()
			--AUX Macros that click with 2,3,5
			--index=CreateMacroFS("aux1_fs","ability_searingarrow","/click "..myspec.."_AUX1",nil)
			--PickupMacro(index)
			--PlaceAction(65)
			--ClearCursor()
			--index=CreateMacroFS("aux2_fs","ability_searingarrow","/click "..myspec.."_AUX2",nil)
			--PickupMacro(index)
			--PlaceAction(66)
			--ClearCursor()
			--index=CreateMacroFS("aux3_fs","ability_searingarrow","/click "..myspec.."_AUX3",nil)
			--PickupMacro(index)
			--PlaceAction(67)
			--ClearCursor()
			index=CreateMacroFS("multi_fs_"..myspec,"ability_upgrademoonglaive","#showtooltip\n/click [button:1] multi_fs_"..myspec.." LeftButton t;",nil)
		PickupMacro(index)
		PlaceAction(3)
		if myClass=="DRUID" then
			PickupMacro(index)
			PlaceAction(75)
			PickupMacro(index)
			PlaceAction(87)
			PickupMacro(index)
			PlaceAction(99)
			PickupMacro(index)
			PlaceAction(111)
		end
		ClearCursor()
		index=CreateMacroFS("turbo_fs_"..myspec,"Spell_nature_lightning","#showtooltip\n/click [button:1] turbo_fs_"..myspec.." LeftButton t;\n/petpassive [mod:alt]\n/run SetView(4)",hunterpersonal)
		PickupMacro(index)
		PlaceAction(4)
		if myClass=="DRUID" then
			PickupMacro(index)
			PlaceAction(16)
			PickupMacro(index)
			PlaceAction(76)
			PickupMacro(index)
			PlaceAction(88)
			PickupMacro(index)
			PlaceAction(100)
			PickupMacro(index)
			PlaceAction(112)
		end
		ClearCursor()
		index=CreateMacroFS("aoe_fs_"..myspec,"spell_fire_selfdestruct","#showtooltip\n/click [button:1] aoe_fs_"..myspec.." LeftButton t;",nil)
		PickupMacro(index)
		PlaceAction(5)
		if myClass=="DRUID" then
			PickupMacro(index)
			PlaceAction(17)
			PickupMacro(index)
			PlaceAction(77)
			PickupMacro(index)
			PlaceAction(89)
			PickupMacro(index)
			PlaceAction(101)
			PickupMacro(index)
			PlaceAction(113)
		end
		ClearCursor()
		index=CreateMacroFS("sheal_fs_"..myspec,"spell_nature_healingtouch","#showtooltip\n/click [button:1] sheal_fs_"..myspec.." LeftButton t;",nil)
		PickupMacro(index)
		PlaceAction(6)
		if myClass=="DRUID" then
			PickupMacro(index)
			PlaceAction(18)
			PickupMacro(index)
			PlaceAction(78)
			PickupMacro(index)
			PlaceAction(90)
			PickupMacro(index)
			PlaceAction(102)
			PickupMacro(index)
			PlaceAction(114)
		end
		ClearCursor()
		if myClass=="DEATHKNIGHT" then 
			macroId = CreateMacroFS("int_fs", "ability_DRUID_bash", "/click BLOOD_INT", personal);
			PickupMacro(macroId)
			PlaceAction(63)
			ClearCursor()
		elseif FSMB_myint[myClass] then
			macroId = CreateMacroFS("int_fs", "INV_Misc_Questionmark", "/cast "..FSMB_myint[myClass], personal);
			PickupMacro(macroId)
			PlaceAction(63)
			ClearCursor()
		end
		--macroId = CreateMacroFS("decurse", "spell_nature_removecurse", "/click ".."DECURSE", nil);
		--PickupMacro(macroId)
		--PlaceAction(56)
		--ClearCursor()
	end
local macroId = CreateMacro("spit_fs", "Inv_misc_slime_01", "/spit", nil);
PickupMacro(macroId)
PlaceAction(59)
ClearCursor()
local partymac=""
for i=1,TableLength(FSMB_toonlist) do
	partymac=partymac.."/invite "..FSMB_toonlist[i].."\n"
end
	LoadBindings(1)
	SetBinding("F1","MULTIACTIONBAR2BUTTON1")
	SetBinding("F2","MULTIACTIONBAR2BUTTON2")
	SetBinding("F3","MULTIACTIONBAR2BUTTON3")
	SetBinding("F4","MULTIACTIONBAR2BUTTON4")
	SetBinding("F5","MULTIACTIONBAR2BUTTON5")
	SetBinding("F6","MULTIACTIONBAR2BUTTON6")
	SetBinding("F7","MULTIACTIONBAR2BUTTON7")
	SetBinding("F8","MULTIACTIONBAR2BUTTON8")
	SetBinding("F9","MULTIACTIONBAR2BUTTON9")
	SetBinding("F10","MULTIACTIONBAR2BUTTON10")
	SetBinding("F11","MULTIACTIONBAR2BUTTON11")
	SetBinding("F12","MULTIACTIONBAR2BUTTON12")
	SetBinding("SHIFT-1","MULTIACTIONBAR1BUTTON1")
	SetBinding("SHIFT-2","MULTIACTIONBAR1BUTTON2")
	SetBinding("SHIFT-3","MULTIACTIONBAR1BUTTON3")
	SetBinding("SHIFT-4","MULTIACTIONBAR1BUTTON4")
	SetBinding("SHIFT-5","MULTIACTIONBAR1BUTTON5")
	SetBinding("SHIFT-6","MULTIACTIONBAR1BUTTON6")
	SetBinding("SHIFT-7","MULTIACTIONBAR1BUTTON7")
	SetBinding("SHIFT-8","MULTIACTIONBAR1BUTTON8")
	SetBinding("SHIFT-9","MULTIACTIONBAR1BUTTON9")
	SetBinding("SHIFT-0","MULTIACTIONBAR1BUTTON10")
	SetBinding("SHIFT--","MULTIACTIONBAR1BUTTON11")
	SetBinding("SHIFT-=","MULTIACTIONBAR1BUTTON12")
	SetBinding("F","INTERACTTARGET")
	SetBinding("SHIFT-F1","MULTIACTIONBAR4BUTTON1")
	SetBinding("SHIFT-F2","MULTIACTIONBAR4BUTTON2")
	SetBinding("SHIFT-F3","MULTIACTIONBAR4BUTTON3")
	SetBinding("SHIFT-F4","MULTIACTIONBAR4BUTTON4")
	SetBinding("SHIFT-F5","MULTIACTIONBAR4BUTTON5")
	SetBinding("SHIFT-F6","MULTIACTIONBAR4BUTTON6")
	SetBinding("SHIFT-F7","MULTIACTIONBAR4BUTTON7")
	SetBinding("SHIFT-F8","MULTIACTIONBAR4BUTTON8")
	SetBinding("SHIFT-F9","MULTIACTIONBAR4BUTTON9")
	SetBinding("SHIFT-F10","MULTIACTIONBAR4BUTTON10")
	SetBinding("SHIFT-F11","MULTIACTIONBAR4BUTTON11")
	SetBinding("SHIFT-F12","MULTIACTIONBAR4BUTTON12")
	SetBinding("CTRL-F1","MULTIACTIONBAR3BUTTON1")
	SetBinding("CTRL-F2","MULTIACTIONBAR3BUTTON2")
	SetBinding("CTRL-F3","MULTIACTIONBAR3BUTTON3")
	SetBinding("CTRL-F4","MULTIACTIONBAR3BUTTON4")
	SetBinding("CTRL-F5","MULTIACTIONBAR3BUTTON5")
	SetBinding("CTRL-F6","MULTIACTIONBAR3BUTTON6")
	SetBinding("CTRL-F7","MULTIACTIONBAR3BUTTON7")
	SetBinding("CTRL-F8","MULTIACTIONBAR3BUTTON8")
	SetBinding("CTRL-F9","MULTIACTIONBAR3BUTTON9")
	SetBinding("CTRL-F10","MULTIACTIONBAR3BUTTON10")
	SetBinding("CTRL-F11","MULTIACTIONBAR3BUTTON11")
	SetBinding("CTRL-F12","MULTIACTIONBAR3BUTTON12")
	SetBinding("BUTTON3","MOVEBACKWARD")
	SetBinding("ALT-CTRL-1","ACTIONBUTTON1")
	SetBinding("CTRL-1")
	SetBinding("CTRL-2")
	SetBinding("CTRL-3")
	SetBinding("CTRL-4")
	SetBinding("CTRL-5")
	SetBinding("CTRL-6")
	SetBinding("CTRL-7")
	SetBinding("CTRL-8")
	SetBinding("CTRL-9")
	SetBinding("CTRL-0")
	SetBinding("CTRL--")
	SetBinding("CTRL-=")
	SetBinding("SHIFT-UP")
	SetBinding("SHIFT-DOWN")
	SetBinding("SHIFT-MOUSEWHEELUP")
	SetBinding("SHIFT-MOUSEWHEELDOWN")
	SetBinding("B","OPENALLBAGS")
	SaveBindings(1)
	CompactRaidFrameManager:Show()
	SetCVar("uiScale", 0.65)
	SetCVar("useUiScale", 1)
	SetCVar("alwaysShowActionBars", true)
	SetCVar("nameplateShowEnemies", true)
	SetCVar("nameplateShowFriends", true)
	SetCVar("enableFloatingCombatText", true)
	SetCVar("autointeract", true)
	SetCVar("autoInteract", true)
	SetCVar("autoQuestWatch", false)
	SetCVar("gameTip", false)
	SetCVar("statusText", true)
	SetCVar("statusTextDisplay", "NUMERIC")
	SetCVar("autoLootDefault", true)
	SetCVar("useCompactPartyFrames", 1)
	SetCVar("blockChannelInvites", true)
	SetCVar("instantQuestText", true)
	SetCVar("lootUnderMouse", true)
	SetCVar("nameplateMotion", true)
	SetCVar("autoSelfCast", false)
	SetCVar("showTutorials", false)
	SetCVar("ShowClassColorInFriendlyNameplate", true)
	SetCVar("showTargetOfTarget", true)
	SetModifiedClick("SELFCAST","NONE")
	SetActionBarToggles(true,true,true,true,true)
	SHOW_MULTI_ACTIONBAR_1=true
	SHOW_MULTI_ACTIONBAR_2=true
	SHOW_MULTI_ACTIONBAR_3=true
	SHOW_MULTI_ACTIONBAR_4=true
	ALWAYS_SHOW_MULTI_ACTIONBAR=1
	MultiActionBar_Update()
	ClearTutorials()
	ReloadUI()
end
function FindKeyInTable(table,string)
	if not table then return end
	for i,v in pairs(table) do
		if i==string and v then return true end
	end
	return nil
end
function TableLength(tab)
	--This utility tells you how many elements are in a table
	--if table doesn't exist, it's 0.
	if not tab then return 0 end
	local len=0
	for _ in pairs(tab) do
		len=len+1
	end
	return len
end
function findSpell(spellName, bookType)
  local i, s;
  local found = false;
  for i = 1, MAX_SKILLLINE_TABS do
    local name, texture, offset, numSpells = GetSpellTabInfo(i);
    if (not name) then break; end
    for s = offset + 1, offset + numSpells do
      local	spell, rank = GetSpellBookItemName(s, bookType);
      if (spell == spellName) then found = true; end
      if (found and spell ~=spellName) then return s-1; end
    end
  end
  if (found) then return s; end
  return nil;
end
function CreateMacroFS(nameorid, icon, body, perCharacter)
    --print("CreateMacroFS: nameorid="..nameorid..", body="..body)
    name,_,body_,_ = GetMacroInfo(nameorid)
    --print("CreateMacroFS: name="..tostring(name)..", body_="..tostring(body_))
    if name then
        --print("Macro "..name.." already exist. NOT creating it again.")
        return name
    end
    return CreateMacro(nameorid, icon, body, perCharacter)
end
function DeleteMacroFS(indexorname)
    name,_,body,_ = GetMacroInfo(indexorname)
    if body then
        if not string.match(body, "^#noupdate") then
            print("DELETE macro:      "..name.." and body: \n"..body)
            DeleteMacro(name)
        else
            print("Found #noupdate macro:   "..name.." and body: \n"..body)
        end
    else
        print("Nonexisting macro: "..indexorname)
    end
end
function clearmacros()
  print("Clearing Macros...")
 MB_macronamestodelete={ "init_fs","focus_fs","sdm_fs","aux1_fs","aux2_fs","aux3_fs","follow_fs","rsingle","rmulti","rebirth","hearth","pet","spit","bufft","self","healpot","manapot","tot","rez","setup","pull","feign","shackle","feed","single","multi","selfh","decurse","reload","dance","leave","makealine","drink","buff","healtank","aoe","turbo","int","passive","poly","h1","h2","h3","h4","h5","f1","f2","f3","f4","f5","a1","a2","a3","a4","a5","party","b0","b1","b2","b3","b4","b5","rsingle_fs","rmulti_fs","rebirth_fs","hearth_fs","pet_fs","spit_fs","bufft_fs","self_fs","healpot_fs","manapot_fs","tot_fs","rez_fs","FARM_fs","setup_fs","pull_fs","feign_fs","shackle_fs","feed_fs","single_fs","multi_fs","selfh_fs","decurse_fs","reload_fs","dance_fs","leave_fs","makealine_fs","drink_fs","buff_fs","healtank_fs","sheal_fs","aoe_fs","turbo_fs","int_fs","passive_fs","poly_fs","h1_fs","h2_fs","h3_fs","h4_fs","h5_fs","f1_fs","f2_fs","f3_fs","f4_fs","f5_fs","a1_fs","a2_fs","a3_fs","a4_fs","a5_fs","a6_fs","a7_fs","a8_fs","a9_fs","a10_fs","party_fs","b0_fs","b1_fs","b2_fs","b3_fs","b4_fs","b5_fs","h6_fs","h7_fs","h8_fs","h9_fs","h10_fs"}
 
MB_allspecs = {"PROTECTION","ARMS","FURY","UNHOLY","FROSTDK","BLOOD","RESTORATION","GUARDIAN","FERAL","BALANCE","ARCANE","FIRE","FROST","RESTOSHAM","ENHANCEMENT","ELEMENTAL","SURVIVAL","MARKSMANSHIP","BEASTMASTERY","SHADOW","HOLY","DISCIPLINE","SUBTLETY","OUTLAW","ASSASINATION","WINDWALKER","MISTWEAVER","BREWMASTER","VENGEANCE","HAVOC","DESTRUCTION","DEMONOLOGY","AFFLICTION","HOLYPAL","PROTPAL", "RETRIBUTION" }
MB_allmactypes = {"single_fs_","setup_fs_","multi_fs_","turbo_fs_","aoe_fs_","sheal_fs_"}


  for _,macname in pairs(MB_macronamestodelete) do
    DeleteMacroFS(macname)
  end
  for _,mactype in pairs(MB_allmactypes) do
    for _,specname in pairs(MB_allspecs) do
      DeleteMacroFS(mactype..specname)
    end
  end
  print("Done clearing Macros!")
end
function IsTank(name)
	if name then 
		return name==FSMB_tank
	end
end
-- specID for GSE
--[0] = "Global",
--  [1] = "Warrior",
--  [2] = "Paladin",
--  [3] = "Hunter",
--  [4] = "Rogue",
--  [5] = "Priest",
--  [6] = "Death Knight",
--  [7] = "Shaman",
--  [8] = "Mage",
--  [9] = "Warlock",
--  [10] = "Monk",
--  [11] = "Druid",
--  [12] = "Demon Hunter",
--  [62] = "Arcane",
--  [63] = "Fire",
--  [64] = "Frost - Mage",
--  [65] = "Holy - Paladin",
--  [66] = "Protection - Paladin",
--  [70] = "Retribution",
--  [71] = "Arms",
--  [72] = "Fury",
--  [73] = "Protection - Warrior",
--  [102] = "Balance",
--  [103] = "Feral",
--  [104] = "Guardian",
--  [105] = "Restoration - Druid",
--  [250] = "Blood",
--  [251] = "Frost - DK",
--  [252] = "Unholy",
--  [253] = "Beast Mastery",
--  [254] = "Marksmanship",
--  [255] = "Survival",
--  [256] = "Discipline",
--  [257] = "Holy - Priest",
--  [258] = "Shadow",
--  [259] = "Assassination",
--  [260] = "Outlaw",
--  [261] = "Subtlety",
--  [262] = "Elemental",
--  [263] = "Enhancement",
--  [264] = "Restoration - Shaman",
--  [265] = "Affliction",
--  [266] = "Demonology",
--  [267] = "Destruction",
--  [268] = "Brewmaster",
--  [269] = "Windwalker",
--  [270] = "Mistweaver",
--  [577] = "Havoc",
--  [581] = "Vengeance",
SLASH_FIND1="/find"
SlashCmdList["FIND"]=function(item)
	if item=="" then Print("Usage /find <classname or all or nothing> <wearing> item slot or string") return end
	AceComm.SendCommMessage(FSMB,"FSMB_FIND", item ,"RAID") 
end
FSMB = CreateFrame("frame","FSMB",UIParent)
function FSMB:OnCommReceived(prefix,item)
	FSMB_Find(item)
end
-- register the events we want to use (this is why we made the frame)
AceComm.RegisterComm(FSMB,"FSMB_FIND")
FSMB:RegisterEvent("ADDON_LOADED") -- register event "ADDON_LOADED"
FSMB:RegisterEvent("CHAT_MSG_ADDON")
FSMB:RegisterEvent("CONFIRM_SUMMON")
FSMB:RegisterEvent("TRAINER_SHOW")
FSMB:RegisterEvent("TRAINER_CLOSED")
FSMB:RegisterEvent("MERCHANT_SHOW")
FSMB:RegisterEvent("MERCHANT_CLOSED")
FSMB:RegisterEvent("TRADE_SHOW")
FSMB:RegisterEvent("TRADE_CLOSED")
FSMB:RegisterEvent("RESURRECT_REQUEST")
FSMB:RegisterEvent("PARTY_INVITE_REQUEST")
FSMB:RegisterEvent("UI_ERROR_MESSAGE")
FSMB:RegisterEvent("TAXIMAP_OPENED")
FSMB:RegisterEvent("PLAYER_LOGIN")
FSMB:RegisterEvent("UI_ERROR_MESSAGE")
FSMB:RegisterEvent("PLAYER_LOGIN")
FSMB:RegisterEvent("UI_ERROR_MESSAGE")
FSMB:RegisterEvent("AUTOFOLLOW_END")
	FSMB:RegisterEvent("UPDATE_POSSESS_BAR")
	FSMB:RegisterEvent("UPDATE_OVERRIDE_ACTIONBAR")
	FSMB:RegisterEvent("PLAYER_GAINS_VEHICLE_DATA")
	FSMB:RegisterEvent("PLAYER_LOSES_VEHICLE_DATA")
	FSMB:RegisterEvent("UPDATE_VEHICLE_ACTIONBAR")
	FSMB:RegisterEvent("UNIT_ENTERED_VEHICLE")
	FSMB:RegisterEvent("UNIT_EXITED_VEHICLE")
	FSMB:RegisterEvent("UNIT_ENTERING_VEHICLE")
	FSMB:RegisterEvent("UNIT_EXITING_VEHICLE")
	FSMB:RegisterEvent("VEHICLE_ANGLE_SHOW")
	FSMB:RegisterEvent("VEHICLE_ANGLE_UPDATE")
	FSMB:RegisterEvent("VEHICLE_UPDATE")
	FSMB:RegisterEvent("VEHICLE_POWER_SHOW")
	FSMB:RegisterEvent("ACTIONBAR_UPDATE_COOLDOWN")

FSMBtooltip=CreateFrame("GAMETOOLTIP", "FSMBtooltip", UIParent, "GameTooltipTemplate")
Print=print
FSMB:SetScript("OnEvent", function(self,event, arg1, arg2, arg3, ...) -- event handler
    if (event == "CHAT_MSG_ADDON") then
        --Print("Addon message recieved from"..arg3)
        if arg1=="FSMB_FIND" then
            local item = arg2
            --print("Got find request for "..item)
            MB_Find(item)
        end
		elseif event == "UI_ERROR_MESSAGE" then
		if arg1 == 50 then
			if arg2 == SPELL_FAILED_NOT_STANDING then
				DoEmote("STAND")
			elseif arg2 == SPELL_FAILED_NOT_MOUNTED then
				Dismount()
			end
		elseif arg1 == 159 then
			if arg2 == ERR_LOOT_NOTSTANDING then
			DoEmote("STAND")
			end
		elseif arg1 == 198 then
			if arg2 == ERR_ATTACK_MOUNTED then
				Dismount()
			end
		elseif arg1 == 213 then
			if arg2 == ERR_TAXIPLAYERALREADYMOUNTED then
				Dismount()
			end
		elseif arg1 == 504 then
			if arg2 == ERR_NOT_WHILE_MOUNTED then
				Dismount()
			end
		end
	elseif event=="TRAINER_SHOW" then
		if GetRealmName()=="LichKingMBW" then
			SetTrainerServiceTypeFilter("available", 1);
			SetTrainerServiceTypeFilter("unavailable", 0);
			SetTrainerServiceTypeFilter("used", 0);
			FsR_TrainerIsUP = true
		end
  	elseif event == "UPDATE_OVERRIDE_ACTIONBAR" or event == "PLAYER_GAINS_VEHICLE_DATA" or event == "PLAYER_LOSES_VEHICLE_DATA" or event == "UNIT_ENTERED_VEHICLE" or event == "UNIT_EXITED_VEHICLE" or event == "UNIT_ENTERING_VEHICLE" or event == "UNIT_EXITING_VEHICLE" or event == "VEHICLE_ANGLE_SHOW" or event == "VEHICLE_ANGLE_UPDATE" or event == "VEHICLE_UPDATE" or event == "VEHICLE_POWER_SHOW" or event == "UPDATE_VEHICLE_ACTION_BAR" or event == "ACTIONBAR_UPDATE_COOLDOWN" then
		--if not UnitAffectingCombat("player") and (HasOverrideActionBar() or HasBonusActionBar() or HasVehicleActionBar() or HasTempShapeshiftActionBar()) then
			--for _,v in pairs(FSMB_turbokeys) do
				--SetOverrideBinding(UIParent, true,v,nil)
			--end
			--SetOverrideBinding(UIParent, true,"2",nil)
			--SetOverrideBinding(UIParent, true,"3",nil)
			--SetOverrideBinding(UIParent, true,"4",nil)
			--SetOverrideBinding(UIParent, true,"5",nil)
			--SetOverrideBinding(UIParent, true,"6",nil)
		--elseif not UnitAffectingCombat("player") then 	
			--for _,v in pairs(FSMB_turbokeys) do
				--_G["ActionButton"..v]:RegisterForClicks("AnyDown","AnyUp")
				--SetOverrideBindingClick(UIParent, true,v,"ActionButton"..v)
			--end
			--ActionButton2:RegisterForClicks("AnyDown","AnyUp")
			--SetOverrideBindingClick(UIParent, true,"2","ActionButton2")
			--ActionButton3:RegisterForClicks("AnyDown","AnyUp")
			--SetOverrideBindingClick(UIParent, true,"3","ActionButton3")
			--ActionButton4:RegisterForClicks("AnyDown","AnyUp")
			--SetOverrideBindingClick(UIParent, true,"4","ActionButton4")
			--ActionButton5:RegisterForClicks("AnyDown","AnyUp")
			--SetOverrideBindingClick(UIParent, true,"5","ActionButton5")
			--ActionButton6:RegisterForClicks("AnyDown","AnyUp")
			--SetOverrideBindingClick(UIParent, true,"6","ActionButton6")
		--end
  	elseif event == "TRAINER_CLOSED" then
		FsR_TrainerIsUP = false
	elseif event=="MERCHANT_SHOW" then
		if GetRealmName()=="LichKingMBW" then
			FsR_MerchantIsUP = true
		end
  	elseif event == "MERCHANT_CLOSED" then
		FsR_MerchantIsUP = false
	elseif event=="TRADE_SHOW" then 
		--TargetUnit("NPC")
		FSMB_tradeopen=true
	elseif event=="TRADE_CLOSED" then 
		FSMB_tradeopen=false
	elseif event == "TAXIMAP_OPENED" then
		Dismount()
	elseif event == "CONFIRM_SUMMON" then
	elseif event == "PARTY_INVITE_REQUEST" then
		AcceptGroup()
		StaticPopup_Hide("PARTY_INVITE")
		StaticPopup_Hide("PARTY_INVITE_REQUEST")
	elseif event == "RESURRECT_REQUEST" then
    	-- this event fires when you get a resurrect request
        	AcceptResurrect() -- accepts resurrection
	        StaticPopup_Hide("RESURRECT_NO_TIMER"); -- hides popup frame
	        StaticPopup_Hide("RESURRECT_NO_SICKNESS"); -- hides popup frame
	        StaticPopup_Hide("RESURRECT"); -- hides popup frame
	elseif (event == "UI_ERROR_MESSAGE") then
	elseif (event == "AUTOFOLLOW_END") then
        end
end)
FSMB:Show()
function TableReverse(table)
	local t={}
	if not table then return end
	for key,value in pairs(table) do
		t[value]=key
	end
	return t
end
function FSMB_Find(item)
	FSMB_slotmap={ [0]="ammo",[1]="head",[2]="neck",[3]="shoulder",[4]="shirt",[5]="chest",[6]="waist",[7]="legs",[8]="feet",[9]="wrist",[10]="hands",[11]="finger 1",[12]="finger 2",[13]="trinket 1",[14]="trinket 2",[15]="back",[16]="main hand",[17]="off hand",[18]="ranged",[19]="tabard"}
	FSMB_slotmap_i=TableReverse(FSMB_slotmap)
	local Rarity={["poor"]=0,["common"]=1,["uncommon"]=2,["rare"]=3,["epic"]=4,["legendary"]=5}
	--This is the function that determines what happens when you type /find
	if item=="" then Print("Usage /find <classname or all or nothing> <wearing> item slot or string") return end
	local class="all"
	local _,_,key=string.find(item,"(%a+)%s*")
	key=string.lower(key)
	local FSMB_classlist={"Warrior","Mage","Shaman","Paladin","Priest","Rogue","Druid","Hunter","Warlock"}
	classlist={}
	for _,class in pairs(FSMB_classlist) do
		table.insert(classlist,string.lower(class))
	end
	if FindInTable(classlist,key) then
		class=key
		_,_,item=string.find(item,"%a+%s(.*)")
		if not item then
			item=key
		else
			Print("Checking class "..key)
			_,_,key=string.find(item,"(%a+)%s*")
		end
	end
	if key=="all" then
		_,_,item=string.find(item,"%a+%s(.*)")
		_,_,key=string.find(item,"(%a+)%s*")
	end
	if key=="wearing" or key=="crapgear" then
		_,_,item=string.find(item,"%a+%s(.*)")
	end
	local myClass=string.lower(UnitClass("player"))
	if key=="crapgear" then
		if class~="all" and class~=myClass then return end
		Print("Finding crappy gear.")
		for inv=1,16 do
			if inv~=4 then
				local itemLink = GetInventoryItemLink("player",inv)
				local quality=GetInventoryItemQuality("player",inv)
				if not quality then
					FSMB_msg("MISSING: slot "..FSMB_slotmap[inv])
				elseif quality<3 then
					local bsnum=string.gsub(itemLink,".-\124H([^\124]*)\124h.*", "%1")
					local itemName, _, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemIcon = GetItemInfo(bsnum)
					FSMB_msg("CRAP: "..itemEquipLoc.." "..inv.." "..itemLink)
				end
			end
		end
		return
	end
		if key=="boe" then
		Print("Finding boe items in bags")
		if class~="all" and class~=myClass then return end
		for bag=-1,11 do for slot=1,C_Container.GetContainerNumSlots(bag) do
			local texture,itemCount,locked,quality,readable,lootable,link=C_Container.GetContainerItemInfo(bag,slot)
			if texture then
				local link=C_Container.GetContainerItemLink(bag,slot)
				local bsnum=string.gsub(link,".-\124H([^\124]*)\124h.*", "%1")
				local itemName, _, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemIcon = GetItemInfo(bsnum)
				_,itemCount=C_Container.GetContainerItemInfo(bag,slot)
				local match=nil
				link=C_Container.GetContainerItemLink(bag,slot)
				links=string.lower(link)
				items=string.lower(item)
				match = string.find(links, items)
				if IsUnboundBOE(bag,slot) then
					FSMB_msg("Found "..link.." in bag "..bag.." slot "..slot)
				end
			end
		end end
		return
	end
	if key=="wearing" then
		if not item then Print("You need to name an item or slot") return end
		Print("Finding "..class.." wearing "..item)
		if class~="all" and class~=myClass then return end
		for inv=1,19 do
			local itemLink = GetInventoryItemLink("player",inv)
			local quality=GetInventoryItemQuality("player",inv)
			if itemLink then
				local bsnum=string.gsub(itemLink,".-\124H([^\124]*)\124h.*", "%1")
				local itemName, _, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemIcon = GetItemInfo(bsnum)
				local match=nil
				links=string.lower(itemLink)
				items=string.lower(item)
				match = string.find(links, items)
				if itemEquipLoc then
					match= match or string.find(string.lower(itemEquipLoc),items)
				end
				if itemRarity then
					match= match or itemRarity==Rarity[items]
				end
				if itemType then
					itemType=string.lower(itemType)
					match= match or string.find(itemType,items)
				end
				if itemSubType then
					itemSubType=string.lower(itemSubType)
					match= match or string.find(itemSubType,items)
				end
				if match then
					FSMB_msg("Found "..itemLink.." in slot "..FSMB_slotmap[inv])
				end
			end
		end
		return
			else
		if not item then Print("You need to name an item or slot") return end
			Print("Finding item "..item)
			if class~="all" and class~=myClass then return end
			for bag=-2,11 do
				local maxIndex=C_Container.GetContainerNumSlots(bag)
				if bag==-2 then maxIndex=12 end
				for slot=1,maxIndex do
				    local itemTable  = C_Container.GetContainerItemInfo(bag,slot)
				     --if itemTable then printt(itemTable) end
				     -- C_Container.GetContainerItemInfo now returns a table with the following keys
				     -- Keys: itemName hasLoot hyperlink iconFileID hasNoValue isLocked itemID isBound stackCount isFiltered isReadable quality
				     if itemTable then
					local itemName, _, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemIcon = GetItemInfo(itemTable.hyperlink)
					local match=nil
					if itemName then
						links=string.lower(itemName)
					else
						links=string.lower(itemLink)
					end
					items=string.lower(item)
					match = string.find(links, items)
					if itemEquipLoc then
						itemEquipLoc=string.lower(itemEquipLoc)
						match= match or string.find(itemEquipLoc,items)
					end
					if itemRarity then
						match= match or itemRarity==Rarity[items]
					end
					if itemType then
						itemType=string.lower(itemType)
						match= match or string.find(itemType,items)
					end
					if itemSubType then
						itemSubType=string.lower(itemSubType)
						match= match or string.find(itemSubType,items)
					end
					if match then
						FSMB_msg("Found "..itemTable.hyperlink.."x"..itemTable.stackCount.." in bag "..bag.." slot "..slot)
					end
				end
			end
		end
	end
end
function IsUnboundBOE(b,s)
	local soulbound=nil
	local boe=nil
	--local _,_,itemID = string.find(itemlink, "item:(%d+)")
	FSMBtooltip:SetOwner(UIParent, "ANCHOR_NONE");
	FSMBtooltip:ClearLines()
	FSMBtooltip:SetBagItem(b,s);
	FSMBtooltip:Show()
	local index = 1
	local ltext = getglobal("FSMBtooltipTextLeft"..index):GetText()
	while ltext ~= nil do
		ltext = getglobal("FSMBtooltipTextLeft"..index):GetText()
		if ltext ~= nil then
			if string.find(ltext,"Soulbound") or string.find(ltext,textSoulbound) then
				soulbound=true
			end
			if string.find(ltext,"Binds when equipped") or string.find(ltext,textBoe) then
			
				boe=true
			end
		end
		index=index+1
	end
	if not soulbound and boe then return true end
end
function FSMB_msg(msg)
	--this is a raid message function with a 2 second cooldown to kind-of avoid some spamming.
	local cooldown=5
	local time=GetTime()
	if MB_prev_msg==msg and FSMB_msgcd+cooldown>time then return end
	MB_prev_msg=msg
	FSMB_msgcd=time
	if UnitInRaid("player") then
		SendChatMessage(msg,"RAID") return
	else
		SendChatMessage(msg,"PARTY") return
	end
	Print(msg)
end
function RangedWeaponType()
	local itemLink = GetInventoryItemLink("player",18)
	if not itemLink then return "Bow" end
	local bsnum=string.gsub(itemLink,".-\124H([^\124]*)\124h.*", "%1")
	local itemName, _, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemIcon = GetItemInfo(bsnum)
	_,_,itemSubType=string.find(itemSubType,"(.*)s")
	return(itemSubType)
end
function printt(tab,indent)
	if indent == nil then indent = "" end
	indent = indent.."  "
	if type (tab) ~= "table" then
		print ("invoke with a table, you sent me a: ",type (tab) )
		return
   	end
   for k,v in pairs (tab) do
      if type (v) == "table" then
         print (indent,k," <TABLE>")
         printt (v, indent)
      else
         print (indent,k," = ",v)
      end
   end
end
function SpellExists(spell)
	return GetSpellInfo(spell)
end
function IsRet()
	return (TalentPointsIn(3)>TalentPointsIn(1) and TalentPointsIn(3)>TalentPointsIn(2))
end
function TalentPointsIn(tab)
	points=0
	for t=1,GetNumTalents(tab) do
		n,ic,tier,c,EM=GetTalentInfo(tab,t)
		points=points+EM
	end
	return points
end
function FindInTable(table,string)
	--only works on 1D tables
	if not table then return end
	for i,v in pairs(table) do
		if v==string then return i end
	end
	return nil
end
function dumpcloth()
	--This will throw cloth and leather at a crafter
	if FSMB_clothto~=myname and FSMB_tradeopen then
		if GetTradeTargetItemLink(1) and (string.find(GetTradeTargetItemLink(1), " Leather") or string.find(GetTradeTargetItemLink(1), " Hide") or string.find(GetTradeTargetItemLink(1), " Cloth"))  then AcceptTrade() return end
	end
	if FSMB_clothto==myname and FSMB_tradeopen then
		if GetTradeTargetItemLink(1) and (string.find(GetTradeTargetItemLink(1), " Leather") or string.find(GetTradeTargetItemLink(1), " Hide") or string.find(GetTradeTargetItemLink(1), " Cloth"))  then AcceptTrade() return end
	end
	if FSMB_clothto~=myname and not FSMB_tradeopen then
		print("Checking for item")
		if (HasItem(" Hide")>0  or HasItem(" Leather")>0 or HasItem(" Cloth")>0 ) and not FSMB_tradeopen then  InitiateTrade(GetUnit(FSMB_clothto)) end
	
		print("Have something, trying to trade with "..UnitName(GetUnit(FSMB_clothto)))
		if FSMB_tradeopen then PickupLeatherOrCloth() return end
	end
end
function PickupLeatherOrCloth()
	--pick up a stack of leather or cloth in your bags
	local bag,slot,link,tbutton
	tbutton=1
	for bag=0,4 do for slot=1,C_Container.GetContainerNumSlots(bag) do
		local texture,itemCount,locked,quality,readable,lootable,link=C_Container.GetContainerItemInfo(bag,slot)
		if texture then
			link=C_Container.GetContainerItemLink(bag,slot)
			local bsnum=string.gsub(link,".-\124H([^\124]*)\124h.*", "%1")
			local itemName, itemNo, itemRarity, itemReqLevel, itemType, itemSubType, itemCount, itemEquipLoc, itemIcon = GetItemInfo(bsnum)
			if not GetTRadeTargetItemLink(6) and string.find(itemName," Leather") or string.find(itemName," Hide") or string.find(itemName," Cloth")  then
				PickupContainerItem(bag,slot)
				ClickTradeButton(tbutton)
				tbutton=tbutton+1
			end
		end
		if tbutton==7 then break end
	end end
	if tbutton>1 then return true end
end
function HasItem(item)
	--Used to pick up pet food when feeding pet
	--have to pick food type based on hunter name and pet
	count=0
	for bag=0,4 do for slot=1,C_Container.GetContainerNumSlots(bag) do
		local texture,itemCount,locked,quality,readable,lootable,link=C_Container.GetContainerItemInfo(bag,slot)
		if texture then
			link=C_Container.GetContainerItemLink(bag,slot)
			--Print(link)
			if string.find(link,item) then count=count+itemCount end
		end
	end end
	if count==0 then
	end
	return count
end
function GetUnit(uname)
	if uname==UnitName("player") then return "player" end
	for i=1,GetNumGroupMembers() do
		local name,rank,subgroup=GetRaidRosterInfo(i)
		if uname==name then return "party"..i-1 end
	end
end
function printmacs(startwith)
	for t=startwith,startwith+20 do
		print(t.." "..GetMacroIconInfo(t))
	end
end
function iconnumber(name)
	for t=1,1104 do
		lowername=string.lower(name)
		icon=string.lower(GetMacroIconInfo(t))
		if string.find(icon,lowername) then return t end
	end
end
function SpellNum(spell)
	--In the wonderful world of 1.12 programming, sometimes just using a spell name isn't enough.
	--SOMETIMES you need to know what spell NUMBER it is, cause otherwise it doesn't work.
	--Healthstones and feral spells are like this.
	if not spell then return end
	local i = 1 highestSpellNum=0 
	local spellName
	while true do
		spellName, spellRank = GetSpellName(i, BOOKTYPE_SPELL)
		if not spellName then
			do break end
		end
		if string.find(spellName,spell) then highestSpellNum=i end
		i = i + 1
	end
	--Fs* returned the spellid of the last spell in the spellbook if the spell is not in the spellbook
	if highestSpellNum==0 then return end
	--Fs*
	return highestSpellNum
end
function SpellRank(spell)
	if not spell then return end
	--In the wonderful world of 1.12 programming, sometimes just using a spell name isn't enough.
	--SOMETIMES you need to know what spell NUMBER it is, cause otherwise it doesn't work.
	--Healthstones and feral spells are like this.
	local i = 1 highestSpellNum=0 highestSpellRank="Rank 1"
	local spellName
	while true do
		spellName, spellRank = GetSpellName(i, BOOKTYPE_SPELL)
		if not spellName then
			highestSpellRank=string.match(highestSpellRank,"%a+ (%d+)")
			return tonumber(highestSpellRank)
		end
		if string.find(spellName,spell) then highestSpellNum=i highestSpellRank=spellRank end
		i = i + 1
	end
	if highestSpellNum==0 then return end
	return tonumber(highestSpellRank)
end
function Build_Spell_Array()
	local spell = 1
	FSMB_spellTable = {}
	while true do
		local spellName, spellRank = GetSpellName(spell, BOOKTYPE_SPELL)
		if not spellName then
			do break end
		end
		local spellLink = GetSpellLink(spell, BOOKTYPE_SPELL)
		local spellID = string.sub(spellLink, 19, string.find(spellLink, "%[") -3)
		FSMB_spellTable[spell] = {spellID, spellName, spellRank}
		spell = spell + 1
	end
	Print("Spell Database Built!!")
end
function IAmFocus()
	if FSMB_raidleader==UnitName("player") then return true end
end
function FSMB_leader()
	return FSMB_raidleader
end
function focusme()
		if not IsAltKeyDown() then return end
                FSMB_raidleader=UnitName("player")
		AceComm.SendCommMessage(FSMB,"FSMB_FOCUS", UnitName("player"),"RAID")
end
function mountup()
	if IsControlKeyDown() then 
		Dismount()
		AceComm.SendCommMessage(FSMB,"FSMB_DISMOUNT", UnitName("player"),"RAID")
	else
		automount()
		AceComm.SendCommMessage(FSMB,"FSMB_AUTOMOUNT", UnitName("player"),"RAID")
	end
end
function follow()
	--This is meant to be in your alt-4 macro, and gets everyone to follow and assist the focus (meant to be your current window toon)
		inInst,instType=IsInInstance()
		if FSMB_tank==myname and (inInst and instType=="party") then return end
		if not IsAltKeyDown() and not IsControlKeyDown() and not IsShiftKeyDown() then
			FollowUnit(unitname(FSMB_raidleader))
		end
end
function automount()
	inInst,instType=IsInInstance()
	if GetZoneText()=="The Maw" and SecureCmdOptionParse"[nodead,nomod,nocombat,nomounted]" then C_MountJournal.SummonByID(1442) 
	elseif FSMB_hivemind and myname~="Mootalia" and not (inInst and instType=="party") then
		if FSMB_raidleader==myname or FSMB_tank==myname then 
			if SecureCmdOptionParse"[nodead,nomod,nocombat,nomounted]" then C_MountJournal.SummonByID(1025) end
		end
	elseif SecureCmdOptionParse"[nodead,nomod,nocombat,outdoors,nomounted]"then C_MountJournal.SummonByID(0)end
end
function melee_follow()
		if IsAltKeyDown() or IsControlKeyDown() then return end
		AceComm.SendCommMessage(FSMB,"FSMB_MELEEFOLLOW", UnitName("player"),"RAID")
end
function unitname(inname)
	if UnitInRaid("player") then
			for i=1,GetNumGroupMembers() do
				if UnitName("raid"..i)==inname then return "raid"..i end
			end
	else
		if inname==UnitName("player") then return "player" end
			for i=1,GetNumGroupMembers() do
				if UnitName("party"..i)==inname then return "party"..i end
			end
	end
end
function delwater()
	if 1 then return end
	for bag=0,4 do for slot=1,C_Container.GetContainerNumSlots(bag) do
		print(C_Container.GetContainerNumSlots(bag))
		link=C_Container.GetContainerItemLink(bag,slot)
			if link and not string.find(link,"Hearthstone") then
					PickupContainerItem(bag,slot)
					DeleteCursorItem()
			end
	end end
end
function buystacks()
	itemlists={
["WARLOCK"]={"Conjured Mountain Spring Water",}, ["HUNTER"]={"Conjured Mountain Spring Water","Roasted Quail", "Jagged Arrow", "Accurate Slugs",}, ["SHAMAN"]={"Conjured Mountain Spring Water","Ankh",}, ["MAGE"]={"Conjured Mountain Spring Water","Arcane Powder","Rune of Portals"}, ["DRUID"]={"Conjured Mountain Spring Water", "Wild Thornroot", "Ironwood Seed",}, ["PALADIN"]={"Conjured Mountain Spring Water","Symbol of Kings",}, ["PRIEST"]={"Conjured Mountain Spring Water","Sacred Candle",}, ["ROGUE"]={"Flash Powder",}, ["DEATHKNIGHT"]={"Corpse Dust",}, }
	limits={["Symbol of Kings"]={600,100},["Corpse Dust"]={200,1},["Conjured Mountain Spring Water"]={200,1},["Roasted Quail"]={320,5},["Jagged Arrow"]={16,200},["Accurate Slugs"]={16,200},["Flash Powder"]={400,1},["Wild Thornroot"]={320,1},["Ironwood Seed"]={60,1},["Sacred Candle"]={640,1},["Ankh"]={30,1},["Arcane Powder"]={320,1},["Rune of Portals"]={80,1}}
	for class,items in pairs(itemlists) do
	for _,item in pairs(items) do
		if myClass==class then
			local myitems=HasItem(item)/limits[item][2]
			local needitems=(limits[item][1]-myitems)/limits[item][2]
			if needitems>0 then
				for itemidx=1,GetMerchantNumItems() do
					link=GetMerchantItemLink(itemidx)
					if link then
						if string.find(link,item) then
							Print("Buying "..needitems.." "..link)
							BuyMerchantItem(itemidx,needitems)
						end
					end
				end
			end
		end
	end end
end
	
function PartyUp()
	local partymac=""
	FSMB_raidleader=myname
	if FSMB_game=="shadow" then 
		for i=1,TableLength(FSMB_invitelist) do
			DEFAULT_CHAT_FRAME.editBox:SetText("/invite "..FSMB_invitelist[i]) ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
		end
	else
		for i=1,TableLength(FSMB_toonlist) do
			DEFAULT_CHAT_FRAME.editBox:SetText("/invite "..FSMB_toonlist[i]) ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
		end
	end
	SetLootMethod("freeforall",UnitName("player"))
end

			--if class=="HUNTER" and item=="Jagged Arrow" and HasPouch() then if myitems==0 then needitems=1 end end
			--if class=="HUNTER" and item=="Accurate Slugs" and HasQuiver() then if myitems==0 then needitems=1 end end
--levelthese={ "froststrike", "jealousy", "rage", "hate", "love", "devotion", "affection", "anger", "pity", "joy", "rapture", "adoration", "shame", "respect", "disgust", "fear"}
--for _,boringlowbee in pairs(levelthese) do
	--.summon boringlowbee
	--.mod level 80
--end
