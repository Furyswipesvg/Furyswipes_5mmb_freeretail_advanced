if GetLocale() ~= "koKR" then
    return
end

local L = LibStub("AceLocale-3.0"):NewLocale("GSE", "koKR")

-- Options translation
L["  The Alternative ClassID is "] = "  대체 직업ID는 "
L[" Deleted Orphaned Macro "] = "삭제된 고아 매크로"
--[[Translation missing --]]
L[" from "] = " from "
--[[Translation missing --]]
L[" has been added as a new version and set to active.  Please review if this is as expected."] = " has been added as a new version and set to active.  Please review if this is as expected."
--[[Translation missing --]]
L[" is not available.  Unable to translate sequence "] = " is not available.  Unable to translate sequence "
--[[Translation missing --]]
L[" macros per Account.  You currently have "] = " macros per Account.  You currently have "
--[[Translation missing --]]
L[" macros per character.  You currently have "] = " macros per character.  You currently have "
--[[Translation missing --]]
L[" saved as version "] = " saved as version "
--[[Translation missing --]]
L[" sent"] = " sent"
--[[Translation missing --]]
L[" tried to overwrite the version already loaded from "] = " tried to overwrite the version already loaded from "
--[[Translation missing --]]
L[" was imported as a new macro."] = " was imported as a new macro."
--[[Translation missing --]]
L[" was imported with the following errors."] = " was imported with the following errors."
L[" was updated to new version."] = "|1이;가; 새 버전으로 업데이트되었습니다."
--[[Translation missing --]]
L["%s macro may cause a 'RestrictedExecution.lua:431' error as it has %s actions when compiled.  This get interesting when you go past 255 actions.  You may need to simplify this macro."] = "%s macro may cause a 'RestrictedExecution.lua:431' error as it has %s actions when compiled.  This get interesting when you go past 255 actions.  You may need to simplify this macro."
--[[Translation missing --]]
L["%sMACRO VALIDATION ERROR|r - PostMacro found with invalid LoopLimit.  PostMacro will not be saved for version %s"] = "%sMACRO VALIDATION ERROR|r - PostMacro found with invalid LoopLimit.  PostMacro will not be saved for version %s"
--[[Translation missing --]]
L[". This version was not loaded."] = ". This version was not loaded."
L["/gse checkmacrosforerrors|r will loop through your macros and check for corrupt macro versions.  This will then show how to correct these issues."] = "/gse checkmacrosforerrors|r 매크로를 반복하고 손상된 매크로 버전을 확인합니다. 그러면 이러한 문제를 수정하는 방법이 표시됩니다."
L["/gse cleanorphans|r will loop through your macros and delete any left over GSE macros that no longer have a sequence to match them."] = "/gse cleanorphans|r 매크로를 반복하고 더 이상 일치하는 시퀀스가 없는 남은 GSE 매크로를 삭제합니다."
L["/gse help|r to get started."] = "/gse help|r를 입력하세요."
L["/gse showspec|r will show your current Specialisation and the SPECID needed to tag any existing macros."] = "/gse showspec|r 현재 전문화 및 기존 매크로에 태그를 지정하는 데 필요한 전문화ID가 표시됩니다."
--[[Translation missing --]]
L["/gse|r again."] = "/gse|r again."
--[[Translation missing --]]
L["/gse|r to get started."] = "/gse|r to get started."
L["/gse|r will list any macros available to your spec.  This will also add any macros available for your current spec to the macro interface."] = "/gse|r 전문화에 사용할 수 있는 모든 매크로를 나열합니다. 이렇게 하면 현재 전문화에 사용 가능한 모든 매크로도 매크로 인터페이스에 추가됩니다."
--[[Translation missing --]]
L[":|r To get started "] = ":|r To get started "
L[":|r You cannot delete the only copy of a sequence."] = ":|r 시퀀스의 유일한 복사본은 삭제할 수 없습니다."
L[":|r Your current Specialisation is "] = ":|r 현재 전문화는 "
L["|r Incomplete Sequence Definition - This sequence has no further information "] = "|r 불완전한 시퀀스 정의 - 이 시퀀스에는 추가 정보가 없습니다."
L["|r.  As a result this macro was not created.  Please delete some macros and reenter "] = "|r. 결과적으로 이 매크로는 생성되지 않았습니다. 일부 매크로를 삭제하고 다시 입력하세요."
--[[Translation missing --]]
L["|r.  You can also have a  maximum of "] = "|r.  You can also have a  maximum of "
L["<DEBUG> |r "] = "<디버그> |r"
--[[Translation missing --]]
L["<SEQUENCEDEBUG> |r "] = "<SEQUENCEDEBUG> |r "
--[[Translation missing --]]
L[ [=[A pause can be measured in either clicks or seconds.  It will either wait 5 clicks or 1.5 seconds.
If using seconds, you can also wait for the GCD by entering ~~GCD~~ into the box.]=] ] = [=[A pause can be measured in either clicks or seconds.  It will either wait 5 clicks or 1.5 seconds.
If using seconds, you can also wait for the GCD by entering ~~GCD~~ into the box.]=]
L["A sequence collision has occured. "] = "시퀀스 충돌이 발생했습니다."
--[[Translation missing --]]
L["A sequence collision has occured.  Extra versions of this macro have been loaded.  Manage the sequence to determine how to use them "] = "A sequence collision has occured.  Extra versions of this macro have been loaded.  Manage the sequence to determine how to use them "
--[[Translation missing --]]
L["A sequence collision has occured.  Your local version of "] = "A sequence collision has occured.  Your local version of "
L["About"] = "정보"
L["About GSE"] = "GSE 정보"
--[[Translation missing --]]
L["ActionButtonUseKeyDown"] = "ActionButtonUseKeyDown"
L["Actions"] = "행동"
L["Active Version: "] = "활성 버전: "
L["Add a Loop Block."] = "Loop 블록을 추가합니다."
L["Add a Pause Block."] = "Pause 블록을 추가합니다."
L["Add a Repeat Block."] = "Repeat 블록을 추가합니다."
L["Add a substitution variable for this macro.  This can either be a straight string swap or can be a function.  If a lua function the function needs to return a value."] = "이 매크로에 대해 치환 변수를 추가합니다. 이는 정직한 문자열 교환이거나 함수일 수 있습니다. lua 함수인 경우 함수는 값을 반환해야 합니다."
L["Add Action"] = "Action 추가"
L["Add an Action Block."] = "Action 블록을 추가합니다."
L["Add an If Block.  If Blocks allow you to shoose between blocks based on the result of a variable that returns a true or false value."] = "If 블록을 추가합니다. If 블록을 사용하면 참 또는 거짓 값을 반환하는 변수의 결과를 기반으로 블록 중에서 선택할 수 있습니다."
L["Add If"] = "If 추가"
L["Add Loop"] = "Loop 추가"
L["Add Pause"] = "Pause 추가"
L["Add Repeat"] = "Repeat 추가"
L["Add Variable"] = "변수 추가"
L["Add WeakAura"] = "WeakAura 추가"
L["Addin Version %s contained versions for the following macros:"] = "버전 %s에는 다음 매크로에 대한 버전이 포함되어 있습니다:"
L["All macros are now stored as upper case names.  You may need to re-add your old macros to your action bars."] = "모든 매크로는 이제 대문자 이름으로 저장됩니다. 행동 단축바에 이전 매크로를 다시 추가해야 할 수도 있습니다."
L["Alt Keys."] = "Alt 키"
--[[Translation missing --]]
L["Alwaus use the highest rank of spell available.  This is useful for levelling."] = "Alwaus use the highest rank of spell available.  This is useful for levelling."
--[[Translation missing --]]
L["Always use Max Rank"] = "Always use Max Rank"
L["Any Alt Key"] = "Alt 키"
L["Any Control Key"] = "Ctrl 키"
L["Any Shift Key"] = "Shift 키"
L["Are you sure you want to delete %s?  This will delete the macro and all versions.  This action cannot be undone."] = "%s|1을;를; 삭제할까요? 매크로 및 모든 버전이 삭제됩니다. 이는 취소할 수 없습니다."
L["Arena"] = "투기장"
L["Arena setting changed to Default."] = "투기장 설정이 기본값으로 변경되었습니다."
L["As GSE is updated, there may be left over macros that no longer relate to sequences.  This will check for these automatically on logout.  Alternatively this check can be run via /gse cleanorphans"] = "GSE가 업데이트되면 더 이상 시퀀스와 관련이 없는 매크로가 남아 있을 수 있습니다. 이를 접속 종료 시 자동으로 확인합니다. 또는 이 검사는 /gse cleanorphans를 통해 실행할 수 있습니다."
L["Auras included in GSE Macros"] = "GSE 매크로에 포함된 효과"
L["Author"] = "작성자"
L["Author Colour"] = "작성자 색상"
L["Auto Create Class Macro Stubs"] = "직업 매크로 스텁 자동 생성"
L["Auto Create Global Macro Stubs"] = "전역 매크로 스텁 자동 생성"
L["Automatically Create Macro Icon"] = "매크로 아이콘 자동 생성"
L["Available Addons"] = "이용 가능한 애드온"
L["Belt"] = "허리"
L["Blizzard Functions Colour"] = "블리자드 함수 색상"
L["Block Path"] = "블록 경로"
L["Block Type: %s"] = "블록 유형: %s"
L["Boolean Functions"] = "부울 함수"
L["Boolean Functions are GSE variables that return either a true or false value."] = "부울 함수는 참 또는 거짓 값을 반환하는 GSE 변수입니다."
L["Boolean not found.  There is a problem with %s not returning true or false."] = "부울을 찾을 수 없습니다. %s|1이;가; 참 또는 거짓을 반환하지 않는 문제가 있습니다."
L["By setting the default Icon for all macros to be the QuestionMark, the macro button on your toolbar will change every key hit."] = "모든 매크로의 기본 아이콘을 물음표로 설정하면 도구 모음의 매크로 버튼이 키 입력마다 변경됩니다."
L["By setting this value the Sequence Editor will show every macro for every class."] = "이 값을 설정하면 시퀀스 편집기는 모든 직업에 대해 매크로를 모두 표시합니다."
L["By setting this value the Sequence Editor will show every macro for your class.  Turning this off will only show the class macros for your current specialisation."] = "이 값을 설정하면 시퀀스 편집기에 직업 매크로가 모두 표시됩니다. 끄면 현재 전문화에 대한 직업 매크로만 표시됩니다."
L["Cancel"] = "취소"
L["Character"] = "캐릭터"
L["Character Specific Options which override the normal account settings."] = "일반 계정 설정을 무시하는 캐릭터별 옵션입니다."
--[[Translation missing --]]
L["CheckMacroCreated"] = "Check Macro Created"
L["Checks to see if you have a Heart of Azeroth equipped and if so will insert '/cast Heart Essence' into the macro.  If not your macro will skip this line."] = "아제로스의 심장이 장착되어 있는지 확인하고 있으면 매크로에 '/cast 심장의 정수'를 삽입합니다. 없으면 매크로는 이 줄을 건너뜁니다."
L["Choose import action:"] = "가져오기 동작 선택:"
L["Choose Language"] = "언어 선택"
L["Classwide Macro"] = "전직업 매크로"
L["Clear"] = "지우기"
L["Clear Common Keybindings"] = "공통 단축키 설정 지우기"
L["Clear Errors"] = "오류 지우기"
L["Clear Keybindings"] = "단축키 설정 지우기"
--[[Translation missing --]]
L["Clear Spell Cache"] = "Clear Spell Cache"
--[[Translation missing --]]
L["Clicks"] = "Clicks"
L["Close"] = "닫기"
--[[Translation missing --]]
L["Close to Maximum Macros.|r  You can have a maximum of "] = "Close to Maximum Macros.|r  You can have a maximum of "
--[[Translation missing --]]
L["Close to Maximum Personal Macros.|r  You can have a maximum of "] = "Close to Maximum Personal Macros.|r  You can have a maximum of "
L["Colour"] = "색상"
L["Colour and Accessibility Options"] = "색상 및 접근성 옵션"
L["Combat"] = "전투"
L["Command Colour"] = "명령어 색상"
L["Common Solutions to game quirks that seem to affect some people."] = "일부 사람들에게 영향을 미치는 것으로 보이는 게임 문제에 대한 흔한 해결책입니다."
L["Compile"] = "컴파일"
--[[Translation missing --]]
L["Compiled"] = "Compiled"
L["Compiled Template"] = "컴파일된 템플릿"
L["Completely New GS Macro."] = "완전히 새로운 GS 매크로입니다."
--[[Translation missing --]]
L["Compress"] = "Compress"
--[[Translation missing --]]
L["Compress Sequence from Forums"] = "Compress Sequence from Forums"
L["Conditionals Colour"] = "조건부 색상"
L["Configuration"] = "구성"
L["Continue"] = "계속"
--[[Translation missing --]]
L["Contributed by: "] = "Contributed by: "
L["Control Keys."] = "Ctrl 키"
--[[Translation missing --]]
L["Convert"] = "Convert"
--[[Translation missing --]]
L["Convert this to a GSE3 Template"] = "Convert this to a GSE3 Template"
L["Copy this link and open it in a Browser."] = "이 링크를 복사하고 브라우저에서 엽니다."
L["Copy this link and paste it into a chat window."] = "이 링크를 복사하여 대화창에 붙여넣습니다."
L["Create a new macro."] = "새 매크로를 만듭니다."
L["Create buttons for Global Macros"] = "전역 매크로용 버튼 만들기"
L["Create Icon"] = "아이콘 생성"
L["Create Macro"] = "매크로 생성"
L[ [=[Create or remove a Macro stub in /macro that can be dragged to your action bar so that you can use this macro.
GSE can store an unlimited number of macros however WOW's /macro interface can only store a limited number of macros.]=] ] = "이 매크로를 쓸 수 있도록 행동 단축바에 끌 수 있는 /macro의 매크로 스텁(stub, 토막)을 만들거나 제거합니다. GSE는 매크로를 무제한으로 저장할 수 있지만, WOW의 /macro 인터페이스는 제한된 수의 매크로만 저장할 수 있습니다."
L["Creating New Sequence."] = "새 시퀀스 생성 중입니다."
L["Current GCD"] = "현재 글쿨"
L["Current GCD: %s"] = "현재 글쿨: %s"
L["CVar Settings"] = "CVar 설정"
L["Debug"] = "디버그"
L["Debug Mode Options"] = "디버그 모드 옵션"
L["Debug Output Options"] = "디버그 출력 옵션"
L["Debug Sequence Execution"] = "시퀀스 실행 디버그"
--[[Translation missing --]]
L["Decompress"] = "Decompress"
L["Default Debugger Height"] = "기본 디버거 높이"
L["Default Debugger Width"] = "기본 디버거 너비"
L["Default Editor Height"] = "기본 편집기 높이"
L["Default Editor Width"] = "기본 편집기 너비"
L["Default Import Action"] = "기본 가져오기 동작"
L["Default Menu Height"] = "기본 메뉴 높이"
L["Default Menu Width"] = "기본 메뉴 너비"
L["Default Version"] = "기본값 버전"
--[[Translation missing --]]
L["Del"] = "Del"
L["Delete"] = "삭제"
L["Delete Block"] = "블록 삭제"
L["Delete Icon"] = "아이콘 삭제"
L["Delete Orphaned Macros on Logout"] = "접속 종료 시 고아 매크로 삭제"
L[ [=[Delete this Block from the sequence.  
WARNING: If this is a loop this will delete all the blocks inside the loop as well.]=] ] = "시퀀스에서 이 블록을 삭제합니다. 경고: 이것이 loop라면 loop 내부의 모든 블록도 삭제됩니다."
L["Delete this macro.  This is not able to be undone."] = "이 매크로를 삭제합니다. 이는 취소할 수 없습니다."
L["Delete this variable from the sequence."] = "시퀀스에서 이 변수를 삭제합니다."
L[ [=[Delete this verion of the macro.  This can be undone by closing this window and not saving the change.  
This is different to the Delete button below which will delete this entire macro.]=] ] = "매크로 이 버전을 삭제합니다. 이 창을 닫고 변경 사항을 저장하지 않으면 취소할 수 있습니다. 이는 이 매크로 전체를 삭제하는 아래의 삭제 버튼과 다릅니다."
L["Delete this WeakAura from the sequence."] = "이 WeakAura를 시퀀스에서 삭제합니다."
L["Delete Variable"] = "변수 삭제"
L["Delete Version"] = "버전 삭제"
L["Delete WeakAura"] = "WeakAura 삭제"
--[[Translation missing --]]
L["Different helpTxt"] = "Different helpTxt"
L["Disable"] = "사용 안 함"
L["Disable Block"] = "블록 사용 안 함"
L["Disable Editor"] = "편집기 사용 안 함"
L["Disable Sequence"] = "시퀀스 사용 안 함"
L["Disable this block so that it is not executed. If this is a container block, like a loop, all the blocks within it will also be disabled."] = "실행되지 않도록 이 블록을 끕니다. loop와 같은 컨테이너 블록인 경우 그 안의 모든 블록도 비활성화됩니다."
L["Display debug messages in Chat Window"] = "디버그 메시지 채팅창에 표시"
L["Don't Force"] = "강제 안 함"
L["Don't Translate Sequences"] = "시퀀스를 번역하지 마세요."
L["Drag this icon to your action bar to use this macro. You can change this icon in the /macro window."] = "이 매크로를 사용하려면 행동 단축바에 이 아이콘을 끌어다 놓으세요. /macro 창에서 이 아이콘을 바꿀 수 있습니다."
L["Dragonflight has changed how the /click command operates.  As a result all your macro stubs (found in /macro) have been updated to match the value of the CVar ActionButtonUseKeyDown.  This is a one off configuration change that needs to be done for each character.  You can change this configuration in GSE's Options."] = "용군단은 /click 명령이 작동하는 방식을 변경했습니다. 그 결과 모든 매크로 스텁(/macro에 있음)이 CVar ActionButtonUseKeyDown의 값과 일치하도록 업데이트되었습니다. 이는 각 캐릭터에 대해 수행해야 하는 일회성 구성 변경입니다. GSE 옵션에서 이 구성을 바꿀 수 있습니다."
L["Dungeon"] = "던전"
L["Dungeon setting changed to Default."] = "던전 설정을 기본값으로 바꿉니다."
L["Edit"] = "편집"
--[[Translation missing --]]
L["Edit Spell Cache"] = "Edit Spell Cache"
L["Edit this macro directly in Lua. WARNING: This may render the macro unable to operate and can crash your Game Session."] = "Lua에서 이 매크로를 직접 편집합니다. 경고: 이로 인해 매크로가 작동하지 않고 게임 세션이 중단될 수 있습니다."
L["Edit this macro.  To delete a macro, choose this edit option and then from inside hit the delete button."] = "이 매크로를 편집합니다. 매크로를 삭제하려면 이 편집 옵션을 선택한 다음 내부에서 삭제 버튼을 누르세요."
L["Editor Colours"] = "편집기 색상"
L["Emphasis Colour"] = "강조 색상"
L["Enable"] = "사용"
L["Enable Debug for the following Modules"] = "다음 모듈에 대해 디버그 사용"
L["Enable Mod Debug Mode"] = "Mod 디버그 모드 사용"
L["Enable Sequence"] = "시퀀스 사용"
L["Enable this option to stop automatically translating sequences from enUS to local language."] = "enUS에서 지역 언어로 시퀀스를 자동으로 번역하는 것을 중지하려면 이 옵션을 사용합니다."
--[[Translation missing --]]
L["Enable timing functions by using Click refresh speed as a pseudo timer."] = "Enable timing functions by using Click refresh speed as a pseudo timer."
--[[Translation missing --]]
L["Enforce GSE minimum version for this macro"] = "Enforce GSE minimum version for this macro"
--[[Translation missing --]]
L["Error found in version %i of %s."] = "Error found in version %i of %s."
L["Error processing Custom Pause Value.  You will need to recheck your macros."] = "사용자 정의 일시 중지 값을 처리하는 중에 오류가 발생했습니다. 매크로를 다시 확인해야 합니다."
--[[Translation missing --]]
L["Error: Destination path not found."] = "Error: Destination path not found."
--[[Translation missing --]]
L["Error: Source path not found."] = "Error: Source path not found."
--[[Translation missing --]]
L["Error: You cannot move a container to be a child within itself."] = "Error: You cannot move a container to be a child within itself."
L["Export"] = "내보내기"
L["Export a Sequence"] = "시퀀스 내보내기"
L["Export Macro Read Only"] = "매크로 읽기 전용 내보내기"
L["Export this Macro."] = "이 매크로를 내보냅니다."
--[[Translation missing --]]
L["Extra Macro Versions of %s has been added."] = "Extra Macro Versions of %s has been added."
L["Filter Macro Selection"] = "매크로 선택 필터링"
L["Finished scanning for errors.  If no other messages then no errors were found."] = "오류 검사를 완료했습니다. 다른 메시지가 없으면 오류가 발견되지 않은 것입니다."
--[[Translation missing --]]
L["FinishReload"] = "Finish Reload"
--[[Translation missing --]]
L["Fix SetBackdrop Nil"] = "Fix SetBackdrop Nil"
L["Force ActionButtonUseKeyDown State"] = "ActionButtonUseKeyDown 상태 강제"
L["Force CVar State"] = "CVar 상태 강제"
L["Format export for WLM Forums"] = "WLM 포럼용 형식 내보내기"
--[[Translation missing --]]
L["FYou cannot delete this version of a sequence.  This version will be reloaded as it is contained in "] = "FYou cannot delete this version of a sequence.  This version will be reloaded as it is contained in "
L["Gameplay Options"] = "게임 플레이 옵션"
L["General"] = "일반"
L["General Options"] = "일반 옵션"
L["Get Help"] = "도움 받기"
L["Global"] = "공통"
L["Global Macros are those that are valid for all classes.  GSE2 also imports unknown macros as Global.  This option will create a button for these macros so they can be called for any class.  Having all macros in this space is a performance loss hence having them saved with a the right specialisation is important."] = "전역 매크로는 모든 직업에 유효한 매크로입니다. GSE2는 알 수 없는 매크로도 Global로 가져옵니다. 이 옵션은 이러한 매크로에 대한 버튼을 생성하므로 모든 직업에 대해 호출할 수 있습니다. 이 자리에 모든 매크로가 있으면 성능이 저하되므로 올바른 전문화로 저장하는 것이 중요합니다."
L["Gnome Sequencer: Compress a Sequence String."] = "Gnome Sequencer: 시퀀스 문자열을 압축합니다."
L["Gnome Sequencer: Export a Sequence String."] = "Gnome Sequencer: 시퀀스 문자열을 내보냅니다."
--[[Translation missing --]]
L["Gnome Sequencer: Record your rotation to a macro."] = "Gnome Sequencer: Record your rotation to a macro."
L["Gnome Sequencer: Sequence Debugger. Monitor the Execution of your Macro"] = "Gnome Sequencer: 시퀀스 디버거. 매크로 실행 모니터링"
L["Gnome Sequencer: Sequence Editor."] = "Gnome Sequencer: 시퀀스 편집기."
L["GnomeSequencer was originally written by semlar of wowinterface.com."] = "GnomeSequencer는 원래 wowinterface.com의 semlar가 작성했습니다."
--[[Translation missing --]]
L["GnomeSequencer-Enhanced"] = "GnomeSequencer-Enhanced"
L["GSE"] = "GSE"
--[[Translation missing --]]
L["GSE - %s's Macros"] = "GSE - %s's Macros"
L["GSE allows plugins to load Macro Collections as plugins.  You can reload a collection by pressing the button below."] = "GSE를 사용하면 플러그인이 매크로 컬렉션을 플러그인처럼 불러올 수 있습니다. 아래 버튼을 눌러 컬렉션을 다시 불러올 수 있습니다."
L["GSE has a LibDataBroker (LDB) data feed.  List Other GSE Users and their version when in a group on the tooltip to this feed."] = "GSE에는 LibDataBroker (LDB) 데이터 피드가 있습니다. 그룹에 있는 경우 다른 GSE 사용자와 해당 버전을 이 피드의 툴팁에 나열합니다."
L["GSE has a LibDataBroker (LDB) data feed.  Set this option to show queued Out of Combat events in the tooltip."] = "GSE에는 LibDataBroker (LDB) 데이터 피드가 있습니다. 툴팁에 대기 중인 비전투 중 이벤트를 표시하려면 이 옵션을 설정하세요."
L["GSE is a complete rewrite of that addon that allows you create a sequence of macros to be executed at the push of a button."] = "GSE는 버튼을 누르면 실행되는 일련의 매크로를 생성할 수 있는 해당 애드온을 완전히 재작성한 것입니다."
L["GSE is out of date. You can download the newest version from https://www.curseforge.com/wow/addons/gse-gnome-sequencer-enhanced-advanced-macros."] = "GSE가 오래되었습니다. https://www.curseforge.com/wow/addons/gse-gnome-sequencer-enhanced-advanced-macros 에서 최신 버전을 다운로드할 수 있습니다."
L["GSE Macro"] = "GSE 매크로"
L["GSE Macro Stubs have been reset to KeyDown configuration.  The /click command needs to be `/click TEMPLATENAME LeftButton t` (Note the 't' here is required along with the LeftButton.)"] = "GSE 매크로 스텁이 KeyDown 구성으로 재설정되었습니다. /click 명령은 `/click TEMPLATENAME LeftButton t`여야 합니다(여기서 't'는 LeftButton과 함께 필요합니다)."
L["GSE Macro Stubs have been reset to KeyUp configuration.  The /click command needs to be `/click TEMPLATENAME`"] = "GSE 매크로 스텁이 KeyUp 구성으로 재설정되었습니다. /click 명령은 `/click TEMPLATENAME`이어야 합니다."
L["GSE Plugins"] = "GSE 플러그인"
L["GSE Raw Editor"] = "GSE Raw 편집기"
L["GSE stores the base spell and asks WoW to use that ability.  WoW will then choose the current version of the spell.  This toggle switches between showing the Base Spell or the Current Spell."] = "GSE는 기본 주문을 저장하고 WoW에게 그 능력을 사용하도록 요청합니다. 그러면 WoW가 그 주문의 현재 버전을 선택합니다. 이 옵션은 기본 주문 또는 현재 주문 표시 사이를 전환합니다."
L["GSE Users"] = "GSE 사용자"
L["GSE Version: %s"] = "GSE 버전: %s"
L[ [=[GSE was originally forked from GnomeSequencer written by semlar.  It was enhanced by TImothyLuke to include a lot of configuration and boilerplate functionality with a GUI added.  The enhancements pushed the limits of what the original code could handle and was rewritten from scratch into GSE.

GSE itself wouldn't be what it is without the efforts of the people who write macros with it.  Check out https://wowlazymacros.com for the things that make this mod work.  Special thanks to Lutechi for creating this community.]=] ] = [=[GSE는 원래 semlar가 작성한 GnomeSequencer에서 분기되었습니다. GUI가 추가된 많은 구성 및 상용구 기능을 포함하도록 TimothyLuke에 의해 향상되었습니다. 향상된 기능은 원래 코드가 처리할 수 있는 한계를 넘어서 처음부터 GSE로 다시 작성되었습니다.

GSE 자체는 매크로를 작성하는 사람들의 노력 없이는 그 자체가 될 수 없습니다. 이 모드(mod)를 작동하게 만드는 것들은 https://wowlazymacros.com에서 확인하세요. 이 커뮤니티를 만든 Lutechi에게 특별히 감사드립니다.]=]
L["GSE: Advanced Macro Compiler loaded.|r  Type "] = "GSE: 고급 매크로 컴파일러를 불러왔습니다.|r 시작하려면 "
L["GSE: Import a Macro String."] = "GSE: 매크로 문자열을 가져옵니다."
L["GSE: Left Click to open the Sequence Editor"] = "GSE: 좌클릭으로 시퀀스 편집기 열기"
L["GSE: Middle Click to open the Transmission Interface"] = "GSE: 휠클릭으로 전송 인터페이스 열기"
L["GSE: Right Click to open the Sequence Debugger"] = "GSE: 우클릭으로 시퀀스 디버거 열기"
--[[Translation missing --]]
L["GSE2 Retro Importer available."] = "GSE2 Retro Importer available."
--[[Translation missing --]]
L["GSE2 Retro interface loaded.  Type `%s/gse2 import%s` to import an old GSE2 string or `%s/gse2 edit%s` to mock up a new template using the GSE2 editor."] = "GSE2 Retro interface loaded.  Type `%s/gse2 import%s` to import an old GSE2 string or `%s/gse2 edit%s` to mock up a new template using the GSE2 editor."
--[[Translation missing --]]
L["GSE2 Retro:"] = "GSE2 Retro:"
L["Head"] = "머리"
L["Help Colour"] = "도움말 색상"
L["Help Information"] = "도움말 정보"
L["Help Link"] = "도움말 링크"
L["Help URL"] = "도움말 URL"
L["Heroic"] = "영웅"
--[[Translation missing --]]
L["Heroic setting changed to Default."] = "Heroic setting changed to Default."
L["Hide Login Message"] = "접속 메시지 숨기기"
L["Hide Minimap Icon"] = "미니맵 아이콘 숨기기"
L["Hide Minimap Icon for LibDataBroker (LDB) data text."] = "LibDataBroker (LDB) 데이터 문자용 미니맵 아이콘을 숨깁니다."
L["Hides the message that GSE is loaded."] = "GSE를 불러왔다는 메시지를 숨깁니다."
L["History"] = "역사"
L["How many macro Clicks to pause for?"] = "일시 중지할 매크로 클릭 수는?"
L["How many milliseconds to pause for?"] = "몇 밀리초 동안 일시 중지할까요?"
--[[Translation missing --]]
L["How many pixels high should the Debuger start at.  Defaults to 500"] = "How many pixels high should the Debuger start at.  Defaults to 500"
L["How many pixels high should the Editor start at.  Defaults to 700"] = "편집기가 시작되어야 하는 픽셀 높이입니다. 기본값은 700입니다."
--[[Translation missing --]]
L["How many pixels high should the Menu start at.  Defaults to 500"] = "How many pixels high should the Menu start at.  Defaults to 500"
--[[Translation missing --]]
L["How many pixels wide should the Debugger start at.  Defaults to 700"] = "How many pixels wide should the Debugger start at.  Defaults to 700"
L["How many pixels wide should the Editor start at.  Defaults to 700"] = "편집기가 시작되어야 하는 픽셀 너비입니다. 기본값은 700입니다."
--[[Translation missing --]]
L["How many pixels wide should the Menu start at.  Defaults to 700"] = "How many pixels wide should the Menu start at.  Defaults to 700"
L["How many seconds to pause for?"] = "몇 초 동안 일시 중지할까요?"
--[[Translation missing --]]
L["How many times does this action repeat"] = "How many times does this action repeat"
L["Icon Colour"] = "아이콘 색상"
L["If Blocks require a variable that returns either true or false.  Create the variable first."] = "If 블록에는 참 또는 거짓을 반환하는 변수가 필요합니다. 변수를 먼저 만드세요."
L["If Blocks Require a variable."] = "If 블록에 변수가 필요합니다."
--[[Translation missing --]]
L["If you load Gnome Sequencer - Enhanced and the Sequence Editor and want to create new macros from scratch, this will enable a first cut sequenced template that you can load into the editor as a starting point.  This enables a Hello World macro called Draik01.  You will need to do a /console reloadui after this for this to take effect."] = "If you load Gnome Sequencer - Enhanced and the Sequence Editor and want to create new macros from scratch, this will enable a first cut sequenced template that you can load into the editor as a starting point.  This enables a Hello World macro called Draik01.  You will need to do a /console reloadui after this for this to take effect."
L["Ignore"] = "무시"
L["Import"] = "가져오기"
L["Import Macro from Forums"] = "포럼에서 매크로 가져오기"
L["Imported new sequence "] = "가져온 새 시퀀스"
L["Incorporate the belt slot into the KeyRelease. This is the equivalent of /use [combat] 5 in a KeyRelease."] = "허리 칸을 키해제에 포함합니다. 이는 키해제 내 /use [combat] 5와 동일합니다."
L["Incorporate the first ring slot into the KeyRelease. This is the equivalent of /use [combat] 11 in a KeyRelease."] = "1번 반지 칸을 키해제에 포함합니다. 이는 키해제 내 /use [combat] 11과 동일합니다."
L["Incorporate the first trinket slot into the KeyRelease. This is the equivalent of /use [combat] 13 in a KeyRelease."] = "1번 장신구 칸을 키해제에 포함합니다. 이는 키해제 내 /use [combat] 13과 동일합니다."
L["Incorporate the Head slot into the KeyRelease. This is the equivalent of /use [combat] 1 in a KeyRelease."] = "머리 칸을 키해제에 포함합니다. 이는 키해제 내 /use [combat] 1과 동일합니다."
L["Incorporate the neck slot into the KeyRelease. This is the equivalent of /use [combat] 2 in a KeyRelease."] = "목 칸을 키해제에 포함합니다. 이는 키해제 내 /use [combat] 2와 동일합니다."
L["Incorporate the second ring slot into the KeyRelease. This is the equivalent of /use [combat] 12 in a KeyRelease."] = "2번 반지 칸을 키해제에 포함합니다. 이는 키해제 내 /use [combat] 12와 동일합니다."
L["Incorporate the second trinket slot into the KeyRelease. This is the equivalent of /use [combat] 14 in a KeyRelease."] = "2번 장신구 칸을 키해제에 포함합니다. 이는 키해제 내 /use [combat] 14와 동일합니다."
L["Inner Loop End"] = "내부 반복 끝"
L["Inner Loop Limit"] = "내부 반복 제한"
L[ [=[Inner Loop Limit controls how many times the Sequence part of your macro executes 
until it goes onto to the PostMacro and then resets to the PreMacro.]=] ] = "내부 반복 제한은 매크로의 시퀀스 부분이 후매크로로 이동한 다음 전매크로로 초기화될 때까지 실행되는 횟수를 제어합니다."
L["Inner Loop Start"] = "내부 반복 시작"
L["Insert this block again after how many blocks."] = "이 블록을 몇 블록 뒤에 다시 삽입합니다."
L["Interval"] = "간격"
L["Invalid value entered into pause block. Needs to be 'GCD' or a Number."] = "Pause 블록에 잘못된 값을 입력했습니다. '글쿨' 또는 숫자여야 합니다."
--[[Translation missing --]]
L["KeyDown"] = "KeyDown"
--[[Translation missing --]]
L["KeyPress"] = "KeyPress"
--[[Translation missing --]]
L["KeyRelease"] = "KeyRelease"
--[[Translation missing --]]
L["KeyUp"] = "KeyUp"
L["Language"] = "언어"
L["Language Colour"] = "언어 색상"
L["Left Alt Key"] = "왼쪽 Alt 키"
L["Left Control Key"] = "왼쪽 Ctrl 키"
L["Left Mouse Button"] = "마우스 왼쪽 버튼"
L["Left Shift Key"] = "왼쪽 Shift 키"
L["Legacy GS/GSE1 Macro"] = "구 GS/GSE1 매크로"
L["Like a /castsequence macro, it cycles through a series of commands when the button is pushed. However, unlike castsequence, it uses macro text for the commands instead of spells, and it advances every time the button is pushed instead of stopping when it can't cast something."] = "/castsequence 매크로처럼 버튼을 눌렀을 때 일련의 명령을 순환합니다. 그러나 castsequence와 달리 주문 대신 명령에 매크로 텍스트를 사용하고 무언가를 시전할 수 없을 때 멈추지 않고 버튼을 누를 때마다 진행합니다."
L["Load"] = "불러오기"
L["Load or update this WeakAura into WeakAuras."] = "이 WeakAura를 불러오거나 업데이트합니다."
L["Load Sequence"] = "시퀀스 불러오기"
L["Load WeakAura"] = "WeakAura 불러오기"
--[[Translation missing --]]
L["Local Function: "] = "Local Function: "
--[[Translation missing --]]
L["Local Macro"] = "Local Macro"
L["Macro Collection to Import."] = "가져올 매크로 컬렉션입니다."
L["Macro Compile Error"] = "매크로 컴파일 오류"
--[[Translation missing --]]
L["Macro found by the name %sPVP%s. Rename this macro to a different name to be able to use it.  WOW has a global object called PVP that is referenced instead of this macro."] = "Macro found by the name %sPVP%s. Rename this macro to a different name to be able to use it.  WOW has a global object called PVP that is referenced instead of this macro."
--[[Translation missing --]]
L["Macro found by the name %sWW%s. Rename this macro to a different name to be able to use it.  WOW has a hidden button called WW that is executed instead of this macro."] = "Macro found by the name %sWW%s. Rename this macro to a different name to be able to use it.  WOW has a hidden button called WW that is executed instead of this macro."
L["Macro Icon"] = "매크로 아이콘"
L["Macro Import Successful."] = "매크로 가져오기에 성공했습니다."
L["Macro Reset"] = "매크로 초기화"
L["Macro unable to be imported."] = "매크로를 가져올 수 없습니다."
L["Macro Variables"] = "매크로 변수"
L["Macro Version %d deleted."] = "매크로 버전 %d|1을;를; 삭제했습니다."
--[[Translation missing --]]
L["Make Active"] = "Make Active"
--[[Translation missing --]]
L["Manage Versions"] = "Manage Versions"
--[[Translation missing --]]
L["Matching helpTxt"] = "Matching helpTxt"
--[[Translation missing --]]
L["Measure"] = "Measure"
--[[Translation missing --]]
L["Merge"] = "Merge"
--[[Translation missing --]]
L["MergeSequence"] = "MergeSequence"
L["Middle Mouse Button"] = "마우스 가운데 버튼"
L["Millisecond click settings"] = "밀리초 클릭 설정"
--[[Translation missing --]]
L["Milliseconds"] = "Milliseconds"
L["Mouse Button 4"] = "4번 마우스 버튼"
L["Mouse Button 5"] = "5번 마우스 버튼"
L["Mouse Buttons."] = "마우스 버튼"
L["Move Down"] = "아래로 이동"
L["Move this block down one block."] = "이 블록을 한 블록 아래로 이동합니다."
L["Move this block up one block."] = "이 블록을 한 블록 위로 이동합니다."
L["Move Up"] = "위로 이동"
--[[Translation missing --]]
L["Moved %s to class %s."] = "Moved %s to class %s."
L["MS Click Rate"] = "밀리초 클릭률"
L["Mythic"] = "신화"
--[[Translation missing --]]
L["Mythic setting changed to Default."] = "Mythic setting changed to Default."
L["Mythic+"] = "쐐기"
--[[Translation missing --]]
L["Mythic+ setting changed to Default."] = "Mythic+ setting changed to Default."
L["Name"] = "이름"
L["Neck"] = "목"
L["New"] = "새로 만들기"
L["New Sequence Name"] = "새 시퀀스 이름"
L["No"] = "아니오"
--[[Translation missing --]]
L["No Active Version"] = "No Active Version"
--[[Translation missing --]]
L["No changes were made to "] = "No changes were made to "
L["No Help Information "] = "도움말 정보 없음"
L["No Help Information Available"] = "이용 가능한 도움말 정보 없음"
L["No Sample Macros are available yet for this class."] = "이 직업에는 아직 사용할 수 있는 샘플 매크로가 없습니다."
--[[Translation missing --]]
L["No Sequences present so none displayed in the list."] = "No Sequences present so none displayed in the list."
L["Normal Colour"] = "일반 색상"
L["Notes and help on how this macro works.  What things to remember.  This information is shown in the sequence browser."] = "이 매크로 작동 방식에 대한 참고 및 도움말입니다. 기억해야 할 것입니다. 이 정보는 시퀀스 브라우저에 표시됩니다."
--[[Translation missing --]]
L["On some clients the Editor will throw an error relating to setBackdrop. Turning this on will prevent those errors."] = "On some clients the Editor will throw an error relating to setBackdrop. Turning this on will prevent those errors."
--[[Translation missing --]]
L["Only Save Local Macros"] = "Only Save Local Macros"
--[[Translation missing --]]
L["OOC Queue Delay"] = "OOC Queue Delay"
L["Opens the GSE Options window"] = "GSE 옵션창을 엽니다."
--[[Translation missing --]]
L["openviewer"] = "Open Viewer"
L["Options"] = "옵션"
--[[Translation missing --]]
L["Options have been reset to defaults."] = "Options have been reset to defaults."
L["Output"] = "출력"
--[[Translation missing --]]
L["Output the action for each button press to verify StepFunction and spell availability."] = "Output the action for each button press to verify StepFunction and spell availability."
L["Party"] = "파티"
--[[Translation missing --]]
L["Party setting changed to Default."] = "Party setting changed to Default."
L["Pause"] = "일시 중지"
--[[Translation missing --]]
L["Pause for the GCD."] = "Pause for the GCD."
L["Paused"] = "일시 중지됨"
L["Paused - In Combat"] = "일시 중지됨 - 전투 중"
L["Picks a Custom Colour for emphasis."] = "강조용 사용자 정의 색상을 고릅니다."
L["Picks a Custom Colour for the Author."] = "작성자용 사용자 정의 색상을 고릅니다."
L["Picks a Custom Colour for the Commands."] = "명령어용 사용자 정의 색상을 고릅니다."
L["Picks a Custom Colour for the Mod Names."] = "모드 이름에 대한 사용자 정의 색상을 고릅니다."
L["Picks a Custom Colour to be used for braces and indents."] = "중괄호 및 들여쓰기에 사용할 사용자 정의 색상을 고릅니다."
L["Picks a Custom Colour to be used for Icons."] = "아이콘에 사용할 사용자 정의 색상을 고릅니다."
--[[Translation missing --]]
L["Picks a Custom Colour to be used for language descriptors"] = "Picks a Custom Colour to be used for language descriptors"
L["Picks a Custom Colour to be used for macro conditionals eg [mod:shift]"] = "매크로 조건부(예, [mod:shift])에 사용할 사용자 정의 색상을 고릅니다."
L["Picks a Custom Colour to be used for Macro Keywords like /cast and /target"] = "/cast 및 /target 같은 매크로 키워드에 사용할 사용자 정의 색상을 고릅니다."
L["Picks a Custom Colour to be used for numbers."] = "숫자에 사용할 사용자 정의 색상을 고릅니다."
L["Picks a Custom Colour to be used for Spells and Abilities."] = "주문 및 능력에 사용할 사용자 정의 색상을 고릅니다."
--[[Translation missing --]]
L["Picks a Custom Colour to be used for StepFunctions."] = "Picks a Custom Colour to be used for StepFunctions."
--[[Translation missing --]]
L["Picks a Custom Colour to be used for strings."] = "Picks a Custom Colour to be used for strings."
L["Picks a Custom Colour to be used for unknown terms."] = "알 수 없는 용어에 사용할 사용자 정의 색상을 고릅니다."
L["Picks a Custom Colour to be used normally."] = "평소에 사용할 사용자 정의 색상을 고릅니다."
--[[Translation missing --]]
L["Please wait till you have left combat before using the Sequence Editor."] = "Please wait till you have left combat before using the Sequence Editor."
L["Plugins"] = "플러그인"
--[[Translation missing --]]
L["PostMacro"] = "PostMacro"
--[[Translation missing --]]
L["PreMacro"] = "PreMacro"
L["Prevent Sound Errors"] = "오류 음성 방지"
L["Prevent UI Errors"] = "UI 오류 방지"
L["Print KeyPress Modifiers on Click"] = "클릭 시 키눌림 보조키 출력"
L["Print to the chat window if the alt, shift, control modifiers as well as the button pressed on each macro keypress."] = "Alt, Shift, Ctrl 보조키뿐만 아니라 각 매크로 키를 누를 때 버튼을 누르면 채팅창에 출력합니다."
L["Priority List (1 12 123 1234)"] = "우선 순위 목록 (1 12 123 1234)"
L["Prompt Samples"] = "샘플 유도"
L["PVP"] = "PVP"
--[[Translation missing --]]
L["PVP setting changed to Default."] = "PVP setting changed to Default."
L["Raid"] = "공격대"
--[[Translation missing --]]
L["Raid setting changed to Default."] = "Raid setting changed to Default."
L["Random - It will select .... a spell, any spell"] = "무작위 - 주문, 임의 주문을 선택합니다"
--[[Translation missing --]]
L["Rank"] = "Rank"
L["Raw Edit"] = "Raw 편집"
--[[Translation missing --]]
L["Ready to Send"] = "Ready to Send"
--[[Translation missing --]]
L["Received Sequence "] = "Received Sequence "
L["Record"] = "기록"
L["Record Macro"] = "매크로 기록"
L["Record the spells and items you use into a new macro."] = "사용하는 주문과 아이템을 새 매크로에 기록합니다."
L["Registered Addons"] = "등록된 애드온"
L["Rename New Macro"] = "새 매크로 이름 바꾸기"
--[[Translation missing --]]
L["Repeat"] = "Repeat"
--[[Translation missing --]]
L["Replace"] = "Replace"
--[[Translation missing --]]
L["Request Macro"] = "Request Macro"
--[[Translation missing --]]
L["Request that the user sends you a copy of this macro."] = "Request that the user sends you a copy of this macro."
L["Require Target to use"] = "사용할 대상 필요"
L["Reset Macro when out of combat"] = "비전투 중 매크로 초기화"
L["Reset this macro when you exit combat."] = "전투를 종료할 때 이 매크로를 초기화합니다."
L["Resets"] = "초기화"
L["Resets macros back to the initial state when out of combat."] = "전투에서 벗어날 때 매크로를 초기 상태로 재설정합니다."
--[[Translation missing --]]
L["Restricted"] = "Restricted"
--[[Translation missing --]]
L["RESTRICTED: Macro specifics disabled by author."] = "RESTRICTED: Macro specifics disabled by author."
L["Resume"] = "재시작"
--[[Translation missing --]]
L["Returns the current Loop Index.  If this is the third action in a loop it will return 3."] = "Returns the current Loop Index.  If this is the third action in a loop it will return 3."
L["Returns your current Global Cooldown value accounting for your haste if that stat is present."] = "해당 능력치가 있는 경우 가속을 설명하는 현재 전역 재사용 대기시간 값을 반환합니다."
L["Reverse Priority (1 21 321 4321)"] = "역 우선 순위 (1 21 321 4321)"
L["Right Alt Key"] = "오른쪽 Alt 키"
L["Right Control Key"] = "오른쪽 Ctrl 키"
L["Right Mouse Button"] = "마우스 오른쪽 버튼"
L["Right Shift Key"] = "오른쪽 Shift 키"
L["Ring 1"] = "손가락 1"
L["Ring 2"] = "손가락 2"
L["Running"] = "실행 중"
L["Save"] = "저장"
L["Save the changes made to this macro"] = "이 매크로에 대한 변경 사항을 저장합니다."
L["Scenario"] = "시나리오"
--[[Translation missing --]]
L["Scenario setting changed to Default."] = "Scenario setting changed to Default."
--[[Translation missing --]]
L["Seconds"] = "Seconds"
--[[Translation missing --]]
L["Seed Initial Macro"] = "Seed Initial Macro"
--[[Translation missing --]]
L["Select a Sequence"] = "Select a Sequence"
--[[Translation missing --]]
L["Select Other Version"] = "Select Other Version"
L["Send"] = "보내기"
L["Send this macro to another GSE player who is on the same server as you are."] = "이 매크로를 같은 서버에 있는 다른 GSE 플레이어에게 보냅니다."
--[[Translation missing --]]
L["Send To"] = "Send To"
L["Sequence"] = "시퀀스"
L["Sequence %s saved."] = "시퀀스 %s|1이;가; 저장되었습니다."
--[[Translation missing --]]
L["Sequence Author set to Unknown"] = "Sequence Author set to Unknown"
L["Sequence Compare"] = "시퀀스 비교"
L["Sequence Debugger"] = "시퀀스 디버거"
L["Sequence Editor"] = "시퀀스 편집기"
L["Sequence Menu"] = "시퀀스 메뉴"
L["Sequence Name"] = "시퀀스 이름"
--[[Translation missing --]]
L["Sequence Name %s is in Use. Please choose a different name."] = "Sequence Name %s is in Use. Please choose a different name."
L["Sequence Named %s was not specifically designed for this version of the game.  It may need adjustments."] = "이름이 %s인 시퀀스는 이 게임 버전을 위해 특별히 설계되지 않았습니다. 조정이 필요할 수 있습니다."
--[[Translation missing --]]
L["Sequence Saved as version "] = "Sequence Saved as version "
--[[Translation missing --]]
L["Sequence specID set to current spec of "] = "Sequence specID set to current spec of "
--[[Translation missing --]]
L["Sequence to Compress."] = "Sequence to Compress."
L["Sequence Viewer"] = "시퀀스 뷰어"
L["Sequential (1 2 3 4)"] = "순서대로 (1 2 3 4)"
L["Set Default Icon QuestionMark"] = "기본 아이콘 물음표로 설정"
L["Shift Keys."] = "Shift 키"
L["Show All Macros in Editor"] = "모든 매크로 편집기에 표시"
L["Show Class Macros in Editor"] = "직업 매크로 편집기에 표시"
L["Show Current Spells"] = "현재 주문 표시"
L["Show Full Block Execution"] = "전체 블록 실행 표시"
L["Show Global Macros in Editor"] = "전역 매크로 편집기에 표시"
L["Show GSE Users in LDB"] = "GSE 사용자 LDB에 표시"
L["Show OOC Queue in LDB"] = "비전투 중 대기열 LDB에 표시"
L["Show the compiled version of this macro."] = "이 매크로의 컴파일된 버전을 표시합니다."
L["Show the current value of this variable."] = "이 변수의 현재 값을 표시합니다."
--[[Translation missing --]]
L["Source Language "] = "Source Language "
L["Specialisation / Class ID"] = "전문화 / 직업 ID"
--[[Translation missing --]]
L["Specialization Specific Macro"] = "Specialization Specific Macro"
L["SpecID/ClassID Colour"] = "전문화ID/직업ID 색상"
--[[Translation missing --]]
L["Spell Cache Editor"] = "Spell Cache Editor"
L["Spell Colour"] = "주문 색상"
--[[Translation missing --]]
L["Spell ID"] = "Spell ID"
--[[Translation missing --]]
L["Spell Name"] = "Spell Name"
--[[Translation missing --]]
L["State"] = "State"
--[[Translation missing --]]
L["Step Function"] = "Step Function"
--[[Translation missing --]]
L["Step Functions"] = "Step Functions"
L["Stop"] = "중지"
L["Store Debug Messages"] = "디버그 메시지 저장"
L["Store output of debug messages in a Global Variable that can be referrenced by other mods."] = "디버그 메시지의 출력을 다른 모드(mod)에서 참조할 수 있는 전역 변수에 저장합니다."
L["String Colour"] = "문자열 색상"
L["Support GSE"] = "GSE 후원"
L["Supporters"] = "후원자"
L["System Variables"] = "시스템 변수"
L["Talents"] = "특성"
L["Target"] = "대상"
--[[Translation missing --]]
L["Target language "] = "Target language "
--[[Translation missing --]]
L["Target protection is currently %s"] = "Target protection is currently %s"
L["Test Variable"] = "변수 검사"
L["The author of this macro."] = "이 매크로 작성자입니다."
L[ [=[The block path shows the direct location of a block.  This can be edited to move a block to a different position quickly.  Each block is prefixed by its container.
EG 2.3 means that the block is the third block in a container at level 2.  You can move a block into a container block by specifying the parent block.  You need to press the Okay button to move the block.]=] ] = "블록 경로는 블록의 직접 위치를 보여줍니다. 블록을 다른 위치로 빠르게 이동하도록 편집할 수 있습니다. 각 블록에는 컨테이너가 접두사로 붙습니다. EG 2.3은 블록이 2레벨 컨테이너에서 세 번째 블록임을 뜻합니다. 상위 블록을 지정하여 블록을 컨테이너 블록으로 옮길 수 있습니다. 블록을 이동하려면 확인 버튼을 눌러야 합니다."
L["The command "] = "명령어 "
L["The current result of variable |cff0000ff~~%s~~|r is |cFF00D1FF%s|r"] = "|cff0000ff~~%s~~|r 변수의 현재 결과는 |cFF00D1FF%s|r"
--[[Translation missing --]]
L["The Custom StepFunction Specified is not recognised and has been ignored."] = "The Custom StepFunction Specified is not recognised and has been ignored."
L["The default sizes of each window."] = "각 창의 기본 크기입니다."
--[[Translation missing --]]
L["The delay in seconds between Out of Combat Queue Polls.  The Out of Combat Queue saves changes and updates macros.  When you hit save or change zones, these actions enter a queue which checks that first you are not in combat before proceeding to complete their task.  After checking the queue it goes to sleep for x seconds before rechecking what is in the queue."] = "The delay in seconds between Out of Combat Queue Polls.  The Out of Combat Queue saves changes and updates macros.  When you hit save or change zones, these actions enter a queue which checks that first you are not in combat before proceeding to complete their task.  After checking the queue it goes to sleep for x seconds before rechecking what is in the queue."
L["The following people donate monthly via Patreon for the ongoing maintenance and development of GSE.  Their support is greatly appreciated."] = "다음 분들은 GSE의 지속적인 유지 및 개발을 위해 Patreon을 통해 매달 기부하고 있습니다. 후원 대단히 감사합니다."
L["The GSE Out of Combat queue is %s"] = "GSE 비전투 중 대기열이 %s"
--[[Translation missing --]]
L["The GUI has not been loaded.  Please activate this plugin amongst WoW's addons to use the GSE GUI."] = "The GUI has not been loaded.  Please activate this plugin amongst WoW's addons to use the GSE GUI."
--[[Translation missing --]]
L["The GUI is corrupt.  Please ensure that your GSE install is complete."] = "The GUI is corrupt.  Please ensure that your GSE install is complete."
--[[Translation missing --]]
L["The GUI is missing.  Please ensure that your GSE install is complete."] = "The GUI is missing.  Please ensure that your GSE install is complete."
--[[Translation missing --]]
L["The GUI needs updating.  Please ensure that your GSE install is complete."] = "The GUI needs updating.  Please ensure that your GSE install is complete."
--[[Translation missing --]]
L["The Macro Translator will translate an English sequence to your local language for execution.  It can also be used to translate a sequence into a different language.  It is also used for syntax based colour markup of Sequences in the editor."] = "The Macro Translator will translate an English sequence to your local language for execution.  It can also be used to translate a sequence into a different language.  It is also used for syntax based colour markup of Sequences in the editor."
L["The main lines of the macro."] = "매크로의 주요 줄입니다."
L["The milliseconds being used in key click delay."] = "키 클릭 지연에 사용되는 밀리초입니다."
L[ [=[The name of your macro.  This name has to be unique and can only be used for one object.
You can copy this entire macro by changing the name and choosing Save.]=] ] = "매크로 이름입니다. 이 이름은 고유해야 하며 하나의 개체에만 사용할 수 있습니다. 이름을 변경하고 저장을 선택하여 이 매크로 전체를 복사할 수 있습니다."
L["The Sample Macros have been reloaded."] = "샘플 매크로를 다시 불러왔습니다."
--[[Translation missing --]]
L["The Sequence Editor can attempt to parse the Sequences, KeyPress and KeyRelease in realtime.  This is still experimental so can be turned off."] = "The Sequence Editor can attempt to parse the Sequences, KeyPress and KeyRelease in realtime.  This is still experimental so can be turned off."
--[[Translation missing --]]
L["The Sequence Editor is an addon for GnomeSequencer-Enhanced that allows you to view and edit Sequences in game.  Type "] = "The Sequence Editor is an addon for GnomeSequencer-Enhanced that allows you to view and edit Sequences in game.  Type "
--[[Translation missing --]]
L[ [=[The step function determines how your macro executes.  Each time you click your macro GSE will go to the next line.  
The next line it chooses varies.  If Random then it will choose any line.  If Sequential it will go to the next line.  
If Priority it will try some spells more often than others.]=] ] = [=[The step function determines how your macro executes.  Each time you click your macro GSE will go to the next line.  
The next line it chooses varies.  If Random then it will choose any line.  If Sequential it will go to the next line.  
If Priority it will try some spells more often than others.]=]
L["The version of this macro that will be used when you enter raids."] = "공격대에 들어갈 때 사용될 이 매크로의 버전입니다."
L["The version of this macro that will be used where no other version has been configured."] = "다른 버전이 구성되지 않은 경우 사용될 이 매크로의 버전입니다."
L["The version of this macro to use in Arenas.  If this is not specified, GSE will look for a PVP version before the default."] = "투기장에서 사용할 이 매크로의 버전입니다. 지정하지 않으면 GSE는 기본값보다 PVP 버전을 찾습니다."
L["The version of this macro to use in heroic dungeons."] = "영웅 던전에서 사용할 이 매크로의 버전입니다."
L["The version of this macro to use in Mythic Dungeons."] = "신화 던전에서 사용할 이 매크로의 버전입니다."
L["The version of this macro to use in Mythic+ Dungeons."] = "쐐기 던전에서 사용할 이 매크로의 버전입니다."
L["The version of this macro to use in normal dungeons."] = "일반 던전에서 사용할 이 매크로의 버전입니다."
L["The version of this macro to use in PVP."] = "PVP에서 사용할 이 매크로의 버전입니다."
L["The version of this macro to use in Scenarios."] = "시나리오에서 사용할 이 매크로의 버전입니다."
L["The version of this macro to use when in a party in the world."] = "파티에 있을 때 사용할 이 매크로의 버전입니다."
L["The version of this macro to use when in time walking dungeons."] = "시간여행 던전에서 사용할 이 매크로의 버전입니다."
L["There are %i events in out of combat queue"] = "비전투 중 대기열에 이벤트가 %i개 있음"
L["There are no events in out of combat queue"] = "비전투 중 대기열에 이벤트가 없음"
L["There are No Macros Loaded for this class.  Would you like to load the Sample Macro?"] = "이 직업에 대해 불러온 매크로가 없습니다. 샘플 매크로를 불러올까요?"
--[[Translation missing --]]
L["There is an issue with sequence %s.  It has not been loaded to prevent the mod from failing."] = "There is an issue with sequence %s.  It has not been loaded to prevent the mod from failing."
--[[Translation missing --]]
L[ [=[These lines are executed after the lines in the Sequence Box have been repeated Inner Loop Limit number of times.
The Sequence will then go on to the PreMacro if it exists then back to the Sequence.]=] ] = [=[These lines are executed after the lines in the Sequence Box have been repeated Inner Loop Limit number of times.
The Sequence will then go on to the PreMacro if it exists then back to the Sequence.]=]
L[ [=[These lines are executed before the lines in the Sequence Box.  If an Inner Loop Limit is not set, these are executed only once.  
If an Inner Loop Limit has been set these are executed after the Sequence has been looped through the number of times.  
The Sequence will then go on to the Post Macro if it exists then back to the PreMacro.]=] ] = "이 줄은 시퀀스 상자의 줄보다 먼저 실행됩니다. 내부 반복 제한이 설정되지 않은 경우 한 번만 실행됩니다. 내부 반복 제한이 설정된 경우 시퀀스가 여러 번 반복된 후에 이 줄이 실행됩니다. 그런 다음 시퀀스는 후매크로가 있으면 계속 진행하고 그 다음 전매크로로 돌아갑니다."
L["These lines are executed every time you click this macro.  They are evaluated by WOW after the line in the Sequence Box."] = "이 줄은 이 매크로를 클릭할 때마다 실행됩니다. 시퀀스 상자의 줄 다음에 WOW에 의해 평가됩니다."
L["These lines are executed every time you click this macro.  They are evaluated by WOW before the line in the Sequence Box."] = "이 줄은 이 매크로를 클릭할 때마다 실행됩니다. 시퀀스 상자의 줄 이전에 WOW에 의해 평가됩니다."
L["These options combine to allow you to reset a macro while it is running.  These options are Cumulative ie they add to each other.  Options Like LeftClick and RightClick won't work together very well."] = "이러한 옵션을 결합하여 실행되는 동안 매크로를 재설정할 수 있습니다. 이 옵션은 누적됩니다. 즉, 서로 추가됩니다. 좌클릭 및 우클릭과 같은 옵션은 함께 잘 작동하지 않습니다."
L["These tick boxes have three settings for each slot.  Gold = Definately use this item. Blank = Do not use this item automatically.  Silver = Either use or not based on my default settings store in GSE's Options."] = "이 체크 상자는 각 칸에 대해 세 가지 설정이 있습니다. 금색 = 확실히 이 아이템을 사용합니다. 빈칸 = 이 아이템을 자동으로 사용하지 않습니다. 은색 = GSE의 옵션에 저장된 내 기본 설정을 기반으로 사용하거나 사용하지 않습니다."
--[[Translation missing --]]
L["This box is disabled as no Inner Loop Limit has been set.  It will never be called without it."] = "This box is disabled as no Inner Loop Limit has been set.  It will never be called without it."
L["This change will not come into effect until you save this macro."] = "이 변경 사항은 이 매크로를 저장할 때까지 적용되지 않습니다."
L["This CVAR makes WoW use your abilities when you press the key not when you release it.  To use GSE in its native configuration this needs to be checked."] = "이 CVAR는 WoW가 키를 놓을 때가 아니라 누를 때 능력을 사용하도록 합니다. 기본 구성에서 GSE를 사용하려면 이를 확인해야 합니다."
--[[Translation missing --]]
L["This function will clear the spell cache and any mappings between individual spellIDs and spellnames.."] = "This function will clear the spell cache and any mappings between individual spellIDs and spellnames.."
--[[Translation missing --]]
L["This function will open a window enabling you to edit the spell cache and any mappings between individual spellIDs and spellnames.."] = "This function will open a window enabling you to edit the spell cache and any mappings between individual spellIDs and spellnames.."
L["This function will remove the SHIFT+N, ALT+N and CTRL+N keybindings for this character.  Useful if [mod:shift] etc conditions don't work in game."] = "이 기능은 이 캐릭터에 대한 SHIFT+N, ALT+N 및 CTRL+N 단축키를 제거합니다. [mod:shift] 등의 조건이 게임에서 작동하지 않는 경우 유용합니다."
L["This function will update macro stubs to support listening to the options below.  This is required to be completed 1 time per character."] = "이 기능은 아래 옵션 수신을 지원하도록 매크로 스텁을 업데이트합니다. 이는 캐릭터당 1회 완료해야 합니다."
--[[Translation missing --]]
L["This is a small addon that allows you create a sequence of macros to be executed at the push of a button."] = "This is a small addon that allows you create a sequence of macros to be executed at the push of a button."
--[[Translation missing --]]
L["This is needed for ConsolePort and BindPad."] = "This is needed for ConsolePort and BindPad."
L["This is the only version of this macro.  Delete the entire macro to delete this version."] = "이것은 이 매크로의 유일한 버전입니다. 이 버전을 지우려면 전체 매크로를 삭제하세요."
--[[Translation missing --]]
L["This macro uses features that are not available in this version. You need to update GSE to %s in order to use this macro."] = "This macro uses features that are not available in this version. You need to update GSE to %s in order to use this macro."
L["This option clears errors and stack traces ingame.  This is the equivalent of /run UIErrorsFrame:Clear() in a KeyRelease.  Turning this on will trigger a Scam warning about running custom scripts."] = "이 옵션은 게임 내 오류 및 스택 추적을 지웁니다. 이는 키해제(KeyRelease) 속 /run UIErrorsFrame:Clear()와 동일합니다. 이 옵션을 켜면 사용자 정의 스크립트 실행에 대해 사기 경고가 발생합니다."
L["This option dumps extra trace information to your chat window to help troubleshoot problems with the mod"] = "이 옵션은 mod 관련 문제를 해결하는 데 도움이 되도록 대화창에 추가 추적 정보를 출력(dump)합니다."
L["This option hide error sounds like \"That is out of range\" from being played while you are hitting a GS Macro.  This is the equivalent of /console Sound_EnableErrorSpeech lines within a Sequence.  Turning this on will trigger a Scam warning about running custom scripts."] = "이 옵션은 GS 매크로를 누르는 동안 재생되는 \"범위를 벗어났습니다\"와 같은 오류 음성을 숨깁니다. 이는 시퀀스 내 /console Sound_EnableErrorSpeech 줄과 동일합니다. 이 옵션을 켜면 사용자 지정 스크립트 실행에 대한 사기 경고가 발생합니다."
L["This option hides text error popups and dialogs and stack traces ingame.  This is the equivalent of /script UIErrorsFrame:Hide() in a KeyRelease.  Turning this on will trigger a Scam warning about running custom scripts."] = "이 옵션은 게임 내 문자 오류 팝업 및 대화 상자와 스택 추적을 숨깁니다. 이는 키해제 속 /script UIErrorsFrame:Hide()와 동일합니다. 이 옵션을 켜면 사용자 정의 스크립트 실행에 대한 사기 경고가 발생합니다."
L["This option prevents macros firing unless you have a target. Helps reduce mistaken targeting of other mobs/groups when your target dies."] = "이 옵션은 대상이 없으면 매크로가 실행되는 것을 방지합니다. 대상이 죽을 때 다른 몹/그룹에 대한 잘못된 대상 지정을 줄이는 데 도움이 됩니다."
L["This sequence is Read Only and unable to be edited."] = "이 시퀀스는 읽기 전용이며 편집할 수 없습니다."
--[[Translation missing --]]
L["This Sequence was exported from GSE %s."] = "This Sequence was exported from GSE %s."
L["This setting forces the ActionButtonUseKeyDown setting one way or another.  It also reconfigures GSE's Macro Stubs to operate in the specified mode."] = "이 설정은 어떤 식으로든 ActionButtonUseKeyDown 설정을 강제합니다. 또한 지정된 모드에서 작동하도록 GSE의 매크로 스텁을 재구성합니다."
L["This shows the Global Macros available as well as those for your class."] = "이는 직업 매크로뿐만 아니라 사용 가능한 전역 매크로를 표시합니다."
L["This version has been modified by TimothyLuke to make the power of GnomeSequencer avaialble to people who are not comfortable with lua programming."] = "이 버전은 Lua 프로그래밍에 익숙하지 않은 사람들이 GnomeSequencer의 기능을 사용할 수 있도록 TimothyLuke가 수정했습니다."
L["This will display debug messages for the "] = "디버그 메시지가 표시되는 모듈: "
--[[Translation missing --]]
L["This will display debug messages for the GSE Ingame Transmission and transfer"] = "This will display debug messages for the GSE Ingame Transmission and transfer"
L["This will display debug messages in the Chat window."] = "채팅창에 디버그 메시지를 출력합니다."
L["Timewalking"] = "시간여행"
--[[Translation missing --]]
L["Timewalking setting changed to Default."] = "Timewalking setting changed to Default."
L["Title Colour"] = "제목 색상"
--[[Translation missing --]]
L["To correct this either delete the version via the GSE Editor or enter the following command to delete this macro totally.  %s/run GSE.DeleteSequence (%i, %s)%s"] = "To correct this either delete the version via the GSE Editor or enter the following command to delete this macro totally.  %s/run GSE.DeleteSequence (%i, %s)%s"
L["To get started "] = "시작하려면 "
--[[Translation missing --]]
L["To use a macro, open the macros interface and create a macro with the exact same name as one from the list.  A new macro with two lines will be created and place this on your action bar."] = "To use a macro, open the macros interface and create a macro with the exact same name as one from the list.  A new macro with two lines will be created and place this on your action bar."
--[[Translation missing --]]
L["Translate to"] = "Translate to"
--[[Translation missing --]]
L["Translated Sequence"] = "Translated Sequence"
L["Trinket 1"] = "장신구 1"
L["Trinket 2"] = "장신구 2"
L["Troubleshooting"] = "문제 해결"
--[[Translation missing --]]
L["Two sequences with unknown sources found."] = "Two sequences with unknown sources found."
L["Unable to interpret sequence."] = "시퀀스를 해석할 수 없습니다."
--[[Translation missing --]]
L["Unable to process content.  Fix table and try again."] = "Unable to process content.  Fix table and try again."
L["Unknown Author|r "] = "알 수 없는 작성자|r"
L["Unknown Colour"] = "알 수 없음 색상"
--[[Translation missing --]]
L["Unrecognised Import"] = "Unrecognised Import"
L["Up forces GSE into ActionButtonUseKeyDown=0 while Down forces GSE into ActionButtonUseKeyDown=1"] = "Up은 GSE를 ActionButtonUseKeyDown=0으로 Down은 GSE를 ActionButtonUseKeyDown=1로 강제합니다."
L["Update"] = "업데이트"
L["Update Macro Stubs"] = "매크로 스텁 업데이트"
L["Update Macro Stubs."] = "매크로 스텁 업데이트"
L["Update Talents"] = "특성 업데이트"
L["Update the stored talents to match the current chosen talents."] = "현재 선택한 특성과 일치하도록 저장된 특성을 업데이트합니다."
--[[Translation missing --]]
L["Updated Macro"] = "Updated Macro"
L["UpdateSequence"] = "시퀀스 업데이트"
L["Updating due to new version."] = "새 버전으로 인해 업데이트 중입니다."
L["Use"] = "사용"
L["Use Belt Item in KeyRelease"] = "키해제에 허리 아이템 사용"
--[[Translation missing --]]
L["Use External MS Timings"] = "Use External MS Timings"
L["Use First Ring in KeyRelease"] = "키해제에 1번 반지 사용"
L["Use First Trinket in KeyRelease"] = "키해제에 1번 장신구 사용"
L["Use Global Account Macros"] = "전역 계정 매크로 사용"
L["Use Head Item in KeyRelease"] = "키해제에 머리 아이템 사용"
--[[Translation missing --]]
L["Use Macro Translator"] = "Use Macro Translator"
L["Use Neck Item in KeyRelease"] = "키해제에 목 아이템 사용"
--[[Translation missing --]]
L["Use Realtime Parsing"] = "Use Realtime Parsing"
L["Use Second Ring in KeyRelease"] = "키해제에 2번 반지 사용"
L["Use Second Trinket in KeyRelease"] = "키해제에 2번 장신구 사용"
L["Use Verbose Export Sequence Format"] = "자세한 내보내기 시퀀스 형식 사용"
L["Use WLM Export Sequence Format"] = "WLM 내보내기 시퀀스 형식 사용"
L["Value"] = "값"
L["Variables"] = "변수"
L["Version"] = "버전"
L["Version="] = "버전="
--[[Translation missing --]]
L["Virtual Button Support"] = "Virtual Button Support"
L["WARNING ONLY"] = "경고만"
--[[Translation missing --]]
L["was unable to be interpreted."] = "was unable to be interpreted."
--[[Translation missing --]]
L["was unable to be programmed.  This macro will not fire until errors in the macro are corrected."] = "was unable to be programmed.  This macro will not fire until errors in the macro are corrected."
L["WeakAuras"] = "WeakAuras"
L["WeakAuras is a mod that watches for certain conditions and actions and they alerts the player to them occuring.  These are included for convenience and still need to be copied from here and imported to the WeakAuras mod via the command /wa."] = "WeakAuras는 특정 조건과 행동을 감시하고 플레이어에게 이러한 상황이 발생하면 알리는 모드(mod)입니다. 이것들은 편의상 포함되어 있으며 여전히 여기에서 복사하여 /wa 명령을 통해 WeakAuras 모드로 가져와야 합니다."
L["WeakAuras was not found."] = "WeakAuras를 찾을 수 없습니다."
--[[Translation missing --]]
L["WeakAuras was not found.  Reported error was %s"] = "WeakAuras was not found.  Reported error was %s"
L["Website or forum URL where a player can get more information or ask questions about this macro."] = "플레이어가 이 매크로에 대해 더 많은 정보를 얻거나 질문할 수 있는 웹사이트 또는 포럼 URL입니다."
L[ [=[What are the preferred talents for this macro?
'1,2,3,1,2,3,1' means First row choose the first talent, Second row choose the second talent etc]=] ] = "이 매크로에서 선호하는 특성은 무엇입니까? '1,2,3,1,2,3,1'은 첫 번째 줄은 첫 번째 특성, 두 번째 줄은 두 번째 특성 등을 선택함을 뜻합니다."
L["What class or spec is this macro for?  If it is for all classes choose Global."] = "이 매크로는 어떤 직업 또는 전문화용입니까? 모든 직업에 해당하는 경우 공통을 고르세요."
L["When creating a macro, if there is not a personal character macro space, create an account wide macro."] = "매크로를 만들 때 개인 캐릭터 매크로 공간이 없으면 계정 전체 매크로를 만듭니다."
L["When debugging the output of a sequence, show the full executed block in the Debugger Output."] = "시퀀스 출력을 디버깅할 때 디버거 출력에 전체 실행 블록을 표시합니다."
L["When exporting a sequence create a stub entry to import for WLM's Website."] = "시퀀스를 내보낼 때 WLM 웹사이트(wowlazymacros.com)용 가져오기 스텁(stub, 토막) 항목을 만듭니다."
L["When exporting a sequence use a human readable verbose form."] = "시퀀스를 내보낼 때 사람이 읽을 수 있는 자세한 형식을 사용합니다."
--[[Translation missing --]]
L["When GSE imports a macro and it already exists locally and has local edits, what do you want the default action to be.  Merge - Add the new MacroVersions to the existing Macro.  Replace - Replace the existing macro with the new version. Ignore - ignore updates.  This default action will set the default on the Compare screen however if the GUI is not available this will be the action taken."] = "When GSE imports a macro and it already exists locally and has local edits, what do you want the default action to be.  Merge - Add the new MacroVersions to the existing Macro.  Replace - Replace the existing macro with the new version. Ignore - ignore updates.  This default action will set the default on the Compare screen however if the GUI is not available this will be the action taken."
L["When loading or creating a sequence, if it is a global or the macro has an unknown specID automatically create the Macro Stub in Account Macros"] = "시퀀스를 불러오거나 만들 때 Global이거나 매크로에 알 수 없는 전문화 ID가 있는 경우 자동으로 계정 매크로에 매크로 스텁을 생성합니다."
L["When loading or creating a sequence, if it is a macro of the same class automatically create the Macro Stub"] = "시퀀스를 불러오거나 만들 때 같은 직업의 매크로인 경우 자동으로 매크로 스텁을 생성합니다."
L["When you log into a class without any macros, prompt to load the sample macros."] = "매크로 없는 직업으로 접속하면 샘플 매크로를 불러오라는 메시지가 표시됩니다."
L["Window Sizes"] = "창 크기"
L["Yes"] = "예"
L["You cannot delete the Default version of this macro.  Please choose another version to be the Default on the Configuration tab."] = "이 매크로의 기본값 버전은 삭제할 수 없습니다. 구성 탭에서 다른 버전을 기본값으로 선택하세요."
--[[Translation missing --]]
L["You cannot delete this version of a sequence.  This version will be reloaded as it is contained in "] = "You cannot delete this version of a sequence.  This version will be reloaded as it is contained in "
--[[Translation missing --]]
L["You need to reload the User Interface for the change in StepFunction to take effect.  Would you like to do this now?"] = "You need to reload the User Interface for the change in StepFunction to take effect.  Would you like to do this now?"
L["You need to reload the User Interface to complete this task.  Would you like to do this now?"] = "이 작업을 완료하려면 사용자 인터페이스를 다시 불러와야 합니다. 지금 할까요?"
L["Your ClassID is "] = "직업ID는"
L["Your current Specialisation is "] = "현재 전문화는 "
--[[Translation missing --]]
L["Your sequence name was longer than 27 characters.  It has been shortened from %s to %s so that your macro will work."] = "Your sequence name was longer than 27 characters.  It has been shortened from %s to %s so that your macro will work."


