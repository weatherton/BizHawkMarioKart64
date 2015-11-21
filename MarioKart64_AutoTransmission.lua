--This Lua script was developed by Drew Weatherton for the BizHawk emulator (additional authors: micro500, adelikat)--
--NOTE: Script must be stored in the same directory as EmuHawk.exe for some functions to work-------------------------
--Purpose: Partially automate the process of executing perfect maneuvers in Mario Kart 64-----------------------------
console.clear()

local InputQueue = nil
local queueIterator = nil

--User has clicked the "Generate Input" button
function GenerateButton()

--Variables, from Interface:
    Direction = forms.gettext(DirectionDropdown)
    Maneuver = forms.gettext(ManeuverDropdown)
    BlankLeadingFrames = tonumber(forms.gettext(TextBoxBlankLeadingFrames))

    --Input Catalog Logic-----------------------------------------------------------------
    --NOTE: We use the bk2 N64 movie mnemonic format (|..|    0,    0,..................|)
    --|rP| -XXX, -YYY,UDLRUDLRSZBAudrllr|
    --|rP| -XXX, -YYY,
    --      (+ analog)UDLR
    --             (D-pad)UDLR
    --                        SZBA
    --                 (C buttons)udrl
    --                      (Shoulder)lr|

    --Add an array to store inputs in
    FramesQueue = {}

    -- Add any desired blank frames to the start
    local i = 0

    while i < tonumber(forms.gettext(TextBoxBlankLeadingFrames)) do
        FramesQueue[#FramesQueue+1] = "|..|    0,    0,..................|"
        i = i + 1
    end

    -- Add specific maneuver inputs
    if Direction == "1.Right" then

        if Maneuver == "1.Outward MT (fastest)" then
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   20,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   20,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   20,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -35,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   39,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -50,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -50,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -50,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -50,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   39,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   63,    0,..................|"

        elseif Maneuver == "2.Straight MT (faster)" then
            FramesQueue[#FramesQueue+1] = "|..|   62,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   20,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   20,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   20,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -35,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   64,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   39,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -50,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -50,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -50,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -50,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   50,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -56,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   61,    0,..................|"

        elseif Maneuver == "3.Inward MT (fast)" then
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   20,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   20,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   39,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -50,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -50,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -50,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -50,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   40,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -55,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"

        elseif Maneuver == "4.Classic MT (reliable)" then
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   39,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -50,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -50,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -50,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -50,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   39,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -40,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
        elseif Maneuver == "5.Shroom Slide" then

            OuterFramesPer = tonumber(forms.gettext(TextBoxOuterFramesPer))
            InnerMagnitude = tonumber(forms.gettext(TextBoxInnerMagnitude))
            TotalShroomSlideFrames = tonumber(forms.gettext(TextBoxTotalShroomSlideFrames))

            local i = 0
            while i <= TotalShroomSlideFrames do
                local j = 0
                while j < OuterFramesPer do
                    FramesQueue[#FramesQueue+1] = "|..|  -65,    0,.................r|"
                    j = j + 1
                    i = i +1
                end

                FramesQueue[#FramesQueue+1] = "|..|   ".. InnerMagnitude ..",    0,.................r|"
                i = i +1
            end
        end

    elseif Direction == "2.Left" then
            if Maneuver == "1.Outward MT (fastest)" then
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -20,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -20,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -20,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   35,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -39,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   50,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   50,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   50,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   50,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -39,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -63,    0,..................|"

        elseif Maneuver == "2.Straight MT (faster)" then
            FramesQueue[#FramesQueue+1] = "|..|  -62,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -20,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -20,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -20,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   35,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -64,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -39,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   50,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   50,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   50,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   50,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -50,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   56,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -61,    0,..................|"

        elseif Maneuver == "3.Inward MT (fast)" then
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -20,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -20,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   60,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -39,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   50,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   50,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   50,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   50,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -40,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   55,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"

        elseif Maneuver == "4.Classic MT (reliable)" then
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -39,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   50,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   50,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   50,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   50,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|  -39,    0,.................r|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   65,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|   40,    0,..................|"
            FramesQueue[#FramesQueue+1] = "|..|  -65,    0,..................|"

        elseif Maneuver == "5.Shroom Slide" then

            OuterFramesPer = tonumber(forms.gettext(TextBoxOuterFramesPer))
            InnerMagnitude = tonumber(forms.gettext(TextBoxInnerMagnitude))
            TotalShroomSlideFrames = tonumber(forms.gettext(TextBoxTotalShroomSlideFrames))

            local i = 0
            while i <= TotalShroomSlideFrames do
                local j = 0
                while j < OuterFramesPer do
                    FramesQueue[#FramesQueue+1] = "|..|   65,    0,.................r|"
                    j = j + 1
                    i = i +1
                end

                FramesQueue[#FramesQueue+1] = "|..|  -".. InnerMagnitude ..",    0,.................r|"
                i = i +1
            end
        end
    end

    -- Append any desired blank frames to the end
    local i = 0

    while i < tonumber(forms.gettext(TextBoxBlankTrailingFrames)) do
        FramesQueue[#FramesQueue+1] = "|..|    0,    0,..................|"
        i = i + 1
    end

    -- Convert the FramesQueue table
    local i = 1
    local tableStr = ""
    while i <= #FramesQueue do
        if (i > 1) then
            tableStr = tableStr .. "\r\n"
        end
        tableStr = tableStr .. FramesQueue[i]
        i = i +1
    end
    -- Verify output to the console
    -- console.log(tableStr)
    -- Output to the Main Window
    forms.settext(GeneratedTextBox, tableStr)
end

--User has clicked the "Execute Input" button
function ExecuteButton()
    TextBoxContents = forms.gettext(InputQueueTextBox)

    local handle = io.open("MarioKart64_AutoTransmission_InputQueueArchive.txt", "a+")
    handle:write("\r\n" .. "\r\n" .. os.date("%c") .. "\r\n" .. TextBoxContents)
    handle:close()


    InputQueue = bizstring.split(TextBoxContents, "\r\n")
    if (emu.islagged()) then
      queueIterator = -1
    else
      queueIterator = 0
    end
    forms.setproperty(ExecuteButtonHandle, "Enabled", false)
    forms.setproperty(RecordButtonHandle, "Enabled", false)
    forms.setproperty(ExecuteItemBotButtonHandle, "Enabled", false)
end

--User has clicked the "HUD Options" button
function HudButton()
    MainWindow = forms.newform(225, 100, "HUD Options")


    --HUD Customizations
    forms.label(MainWindow, "HUD Settings:  (check to exclude)", 10, 6, 240, 18)
    CheckboxHUD_LapPosition = forms.checkbox(MainWindow, "Lap / Position", 10, 21)
    CheckboxHUD_Coordinates = forms.checkbox(MainWindow, "Coordinates", 10, 40)
    CheckboxHUD_Time = forms.checkbox(MainWindow, "Time", 120, 21)
    CheckboxHUD_SpeedState = forms.checkbox(MainWindow, "Speed / State", 120, 40)
end

--Generate the User Interface
------------INPUTS ARE X,Y,WIDTH,HEIGHT  -- For Text Boxes: WIDTH, HEIGHT, "signed", X, Y-------
MainWindow = forms.newform(655, 800, "Mario Kart 64 Automatic Transmission v1.00")

-- Blank frames
forms.label(MainWindow, "Blank leading frames", 28, 8, 105, 18)
TextBoxBlankLeadingFrames = forms.textbox(MainWindow, "0", 20, 18, "UNSIGNED", 10, 5)

forms.label(MainWindow, "Blank trailing frames", 158, 8, 105, 18)
TextBoxBlankTrailingFrames = forms.textbox(MainWindow, "0", 20, 18, "UNSIGNED", 140, 5)

--Direction dropdown
LabelDirection = forms.label(MainWindow, "facing", 67, 31, 40, 20)
a = { }
a[0] = "1.Right"
a[1] = "2.Left"
DirectionDropdown = forms.dropdown(MainWindow, a, 10, 28, 57, 20)

--Maneuver dropdown
a = { }
a[0] = "1.Outward MT (fastest)"
a[1] = "2.Straight MT (faster)"
a[2] = "3.Inward MT (fast)"
a[3] = "4.Classic MT (reliable)"
a[4] = "5.Shroom Slide"
ManeuverDropdown = forms.dropdown(MainWindow, a, 110, 28, 131, 20)

--Shroomslide options
forms.label(MainWindow, "(Shroom slide parameters:", 5, 57, 130, 18)

forms.label(MainWindow, "Total frames", 28, 80, 65, 18)
TextBoxTotalShroomSlideFrames = forms.textbox(MainWindow, "60", 20, 18, "UNSIGNED", 10, 78)

forms.label(MainWindow, "Inner", 122, 74, 40, 14)
forms.label(MainWindow, "magnitude", 116, 85, 60, 14)
TextBoxInnerMagnitude = forms.textbox(MainWindow, "32", 20, 18, "UNSIGNED", 96, 78)

forms.label(MainWindow, "Outer frames", 197, 74, 67, 14)
forms.label(MainWindow, "per inner frame", 202, 85, 60, 14)
forms.label(MainWindow, ")", 261, 79, 8, 14)
TextBoxOuterFramesPer = forms.textbox(MainWindow, "1", 20, 18, "UNSIGNED", 175, 78)

--Create Input
GenerateButtonHandle = forms.button(MainWindow, "Generate Input", GenerateButton, 10, 110, 86, 23)

--Multi-Line Textbox for Generating Input
forms.label(MainWindow, "INPUT CATALOG", 96, 120, 93, 15)
GeneratedTextBox = forms.textbox(MainWindow, "|..|    0,    0,..................|", 255, 565, "", 10, 135, true, true)


--HUD window creation WORKINGHERE
HUDButtonHandle = forms.button(MainWindow, "HUD Options", HudButton, 189, 721, 86, 23)

--Textbox for Frame Reference
forms.label(MainWindow, "Frame v", 281, 30, 45, 13)
FrameReferenceTextBox = forms.textbox(MainWindow, "12345", 50, 712, "", 280, 44, true, true)

--Populate the Frame Reference Table
function PopulateFrameReference()
    local i = 2
    local LoadFramecount = emu.framecount()
    local FramecountList

    FramecountList = LoadFramecount
    
    while i <= 98 do
        FramecountList = FramecountList .. "\r\n" .. LoadFramecount + i
        i = i + 2
    end

    forms.settext(FrameReferenceTextBox, FramecountList)
end

event.onloadstate(PopulateFrameReference)

--Item selection dropdown
itemOptions = { }
itemOptions[0] = "01. Banana"
itemOptions[1] = "02. Banana Bunch"
itemOptions[2] = "03. Green Shell"
itemOptions[3] = "04. Triple Green Shell"
itemOptions[4] = "05. Red Shell"
itemOptions[5] = "06. Triple Red Shell"
itemOptions[6] = "07. Spiny Shell"
itemOptions[7] = "08. Thunder Bolt"
itemOptions[8] = "09. Fake Item Box"
itemOptions[9] = "10. Super Star"
itemOptions[10] = "11. Boo"
itemOptions[11] = "12. Mushroom"
itemOptions[12] = "14. Triple Mushrooms"
itemOptions[13] = "15. Super Mushroom"
ItemSelectionDropdown = forms.dropdown(MainWindow, itemOptions, 468, 2, 120, 20)

BooModeCheckbox = forms.checkbox(MainWindow, "Boo Mode", 398,0)

--Multi-Line Textbox for Input Queue
forms.label(MainWindow, "INPUT QUEUE", 305, 9, 150, 15)
forms.label(MainWindow, "<-Format", 582, 26, 60, 18)
forms.textbox(MainWindow, "|rP| -XXX, -YYY,UDLRUDLRSZBAudrllr|", 255, 20, "", 328, 24, true, true)
InputQueueTextBox = forms.textbox(MainWindow, "|..|    0,    0,..................|", 255, 712, "", 328, 44, true, true)

--Execute Input
ExecuteButtonHandle = forms.button(MainWindow, "Execute Input", ExecuteButton, 585, 44, 55, 712)

RecordButtonHandle = nil

RecordState = 0

function RecordButton()
  if (RecordState == 0) then
    forms.setproperty(ExecuteButtonHandle, "Enabled", false)
    forms.setproperty(ExecuteItemBotButtonHandle, "Enabled", false)
    
    -- Clear the queue
    forms.settext(GeneratedTextBox, "")
    
    -- set flag to indicate in record mode
    RecordState = 1
    
    forms.settext(RecordButtonHandle, "Stop Recording")
  else
    forms.setproperty(ExecuteButtonHandle, "Enabled", true)
    forms.setproperty(ExecuteItemBotButtonHandle, "Enabled", true)
  
    RecordState = 0
  
    forms.settext(RecordButtonHandle, "Record Input")
  end
end

RecordButtonHandle = forms.button(MainWindow, "Record Input", RecordButton, 189, 110, 77, 23)

function ClearQueue()
    InputQueue = nil
    queueIterator = nil
    forms.setproperty(ExecuteButtonHandle, "Enabled", true)
    forms.setproperty(RecordButtonHandle, "Enabled", true)
    forms.setproperty(ExecuteItemBotButtonHandle, "Enabled", true)
end

function CopyInputButton()
    forms.settext(InputQueueTextBox, forms.gettext(GeneratedTextBox))
end

CopyInputHandle = forms.button(MainWindow, ">", CopyInputButton, 258, 150, 30, 23)

function AppendInputButton()
    forms.settext(InputQueueTextBox, forms.gettext(InputQueueTextBox) .. "\r\n" .. forms.gettext(GeneratedTextBox))
end

AppendInputHandle = forms.button(MainWindow, ">>", AppendInputButton, 258, 200, 30, 23)

-- Bot variables

-- Item bot States:
-- -1: not active
-- 0: searching for first chance to hit Z
-- 1: about to press Z
-- 2: Waiting to see what item we got
-- 3: advancing one input frame past the last time we tried
-- 4. Successful cleanup

ItemBotState = -1

ItemBotIteratorSave = -1

ItemBotWantedItem = -1

ExecuteItemBotButtonHandle = nil

function ExecuteItemBotButton()
    if (ItemBotState ~= -1) then
        -- disable the bot
        ItemBotState = -1
        ClearQueue()

        -- Change the button text to something
        forms.settext(ExecuteItemBotButtonHandle, "Item Bot")
    else
        -- Set up the input queue
        ExecuteButton()

        -- Make both buttons disabled
        forms.setproperty(ExecuteButtonHandle, "Enabled", false)
        
        -- Make a starting state
        savestate.save("ItemBotStartingState")
        
        -- Find the desired item
        itemSelection = forms.gettext(ItemSelectionDropdown)
        local i = 0
        while (i < 15) do
            if (itemOptions[i] == itemSelection) then
                ItemBotWantedItem = i + 1
            end
            i = i + 1
        end

        forms.setproperty(ExecuteItemBotButtonHandle, "Enabled", true)
        forms.settext(ExecuteItemBotButtonHandle, "Stop Bot")
        
        ItemBotState = 0
    end
end

--Item Select Bot Execute
ExecuteItemBotButtonHandle = forms.button(MainWindow, "Item Bot", ExecuteItemBotButton, 585, 1, 55, 23)

function load_state_handler() 
    if (ItemBotState == -1) then
        ClearQueue()
    end
    
    if (RecordState == 1) then
      forms.setproperty(ExecuteButtonHandle, "Enabled", true)
      forms.setproperty(ExecuteItemBotButtonHandle, "Enabled", true)
    
      RecordState = 0
    
      forms.settext(RecordButtonHandle, "Record Input")
    end
end

loadstateEventHandle = event.onloadstate(load_state_handler, "load_state_handler")

while true do

    --NOTE: I was having an error from the HUD Options check boxes and have commented out that functionality for now
    --if forms.ischecked(CheckboxHUD_Time) == false then
        local TimerAddr = 0x0DC598

        Timer=mainmemory.readfloat(TimerAddr, true)
        gui.text(0,0, "TIME ".. string.format("%.3f", Timer),0x50000000,"orange","topright")
    --end

    --if forms.ischecked(CheckboxHUD_LapPosition) == false then
        local LapAddr = 0x164390
        local PathAddr = 0x163288
        local PlaceAddr = 0x18CF99

        Lap=mainmemory.read_s32_be(LapAddr) + 1
        Path=mainmemory.read_s32_be(PathAddr)
        Place=mainmemory.read_u8(PlaceAddr) + 1
        gui.text(client.borderwidth()+client.bufferwidth()*.25,0, "LAP ".. Lap .. "/3, Path " .. Path .. ", Place " .. Place .. "/8",0x50000000,"purple")
    --end

    --if forms.ischecked(CheckboxHUD_Coordinates) == false then
        local Xaddr = 0x0F69A4
        local XvAddr = 0x0F69C4
        local Yaddr = 0x0F69AC
        local YvAddr = 0x0F69CC
        local Zaddr = 0xF69A8
        local ZvAddr = 0x0F69C8
        local ZgroundAddr = 0x0F6A04


        PlayerX=mainmemory.readfloat(Xaddr, true)
        gui.text(0,17, "X ".. string.format("%.3f", PlayerX),"black","white","bottomleft")
        PlayerXv=mainmemory.readfloat(XvAddr, true) * 12
        gui.text(0,2, "Xv ".. string.format("%.3f", PlayerXv),"black","white","bottomleft")

        PlayerY=mainmemory.readfloat(Yaddr, true)
        gui.text(120,17, "Y ".. string.format("%.3f", PlayerY),"black","white","bottomleft")
        PlayerYv=mainmemory.readfloat(YvAddr, true) * 12
        gui.text(120,2, "Yv ".. string.format("%.3f", PlayerYv),"black","white","bottomleft")

        PlayerZ=mainmemory.readfloat(Zaddr, true)
        gui.text(240,17, "Z ".. string.format("%.3f", PlayerZ),"black","white","bottomleft")
        PlayerZv=mainmemory.readfloat(ZvAddr, true) * 12
        gui.text(240,2, "Zv ".. string.format("%.3f", PlayerZv),"black","white","bottomleft")

        gui.text(360,2, "XYZv " .. string.format("%.3f", math.sqrt (PlayerXv^2+PlayerYv^2+PlayerZv^2)) .. " km/h","black","white","bottomleft")

        GroundHeight=mainmemory.readfloat(ZgroundAddr, true)
        PlayerHeight=mainmemory.readfloat(Zaddr, true)
        PlayerAGL=(PlayerHeight-GroundHeight-5.317)
        gui.text(360,17, "Z[AGL] " .. string.format("%.2f", PlayerAGL),"black","white","bottomleft")

        --Rivals
        local Rival1Addr = 0x163349
        local Rival2Addr = 0x16334B

        characters = {
            "Mario","Luigi","Yoshi","Toad","DK","Wario","Peach","Bowser"
        }
	
        Rival1=mainmemory.read_u8(Rival1Addr)
        Rival2=mainmemory.read_u8(Rival2Addr)

        gui.text(536,17, "R1: " .. characters[Rival1+1],"black","yellow","bottomleft")
        gui.text(536,2, "R2: " .. characters[Rival2+1],"black","yellow","bottomleft")
	
    --end

    --if forms.ischecked(CheckboxHUD_SpeedState) == false then

        local MTglideAddr = 0x0F6BCB

        MTglide=mainmemory.read_u8(MTglideAddr)
        if MTglide > 0 then
            gui.text(client.screenwidth()*.5-30,client.screenheight()*.5 - 30, "MT " .. 31 - MTglide,"","red")
        end

        local StateEAddr = 0x0F6A4E
        StateE=mainmemory.read_u8(StateEAddr)

        if bit.check(StateE,5) then
            gui.text(client.screenwidth()*.5-50,client.screenheight()*.5 - 15, "SHROOMING","","red")
        end

        --This speed address is what actually feeds the speedometer but it is only the XY velocity and also stops reporting after a race ends
        --local SpeedAddr = 0x18CFE4
        --Speed=mainmemory.readfloat(SpeedAddr, true)
        --I chose to calculate the velocity based on the XY velocity rather than reading the speedometer memory value

        gui.text(client.screenwidth()*.5-60,client.screenheight()*.5, string.format("%.3f", math.sqrt (PlayerXv^2+PlayerYv^2)) .. " km/h","black","white")
        
        local StateFAddr = 0x0F6A4F
        StateF=mainmemory.read_u8(StateFAddr)

        if bit.check(StateF,5) then
            gui.text(client.screenwidth()*.5-60,client.screenheight()*.5 + 15, "AB SPINNING","","red")
        end

        if bit.check(StateF,3) then
            gui.text(client.screenwidth()*.5-55,client.screenheight()*.5 + 30, "OFF GROUND","","red")
        end
    --end
    
    -- Detect if this is a lag frame
    isLag = emu.islagged()
    
    if (RecordState == 1) then
      if (isLag == false) then
        forms.settext(GeneratedTextBox, forms.gettext(GeneratedTextBox) .. movie.getinputasmnemonic(emu.framecount()-1) .. "\r\n")
      end
    elseif (InputQueue ~= nil) then
        if (isLag == false) then
            queueIterator = queueIterator + 1
            if (ItemBotState == 1) then
                -- Change state to detection mode
                ItemBotState = 2
            end
            
            if (ItemBotState == 3) then
               -- Save the state
               savestate.save("ItemBotIterator")
               
               -- Save the iterator
               ItemBotIteratorSave = queueIterator
               
               -- Switch to hitting state
               ItemBotState = 1
            end
            --console.log("Non-lag frame, incrementing index")
        else
            --console.log("lag frame, keeping previous index")
        end
        
        -- If looking for the first chance to press z, check now
        if (ItemBotState == 0) then
            -- Read the delay timer value
            local delayTimerAddr = 0x165F07
            z_delay_timer = memory.read_u8(delayTimerAddr)
            
            -- Found it, switch states
            if (((z_delay_timer == 0 or z_delay_timer == 1) and isLag == true) or forms.ischecked(BooModeCheckbox)) then
                -- Make a state here
                savestate.save("ItemBotIterator")
                
                -- Remember what spot we're on in the queue
                ItemBotIteratorSave = queueIterator
                
                -- Change State
                ItemBotState = 1
            else
                -- Still looking
            end
        end
        
        -- If waiting to see what item we got, check if its set yet, and if its what we want
        if (ItemBotState == 2) then
          item_we_got = memory.read_s8(0x165F5B)
          z_delay_timer = memory.read_u8(0x165F07)

          if (item_we_got > 0 or (z_delay_timer == 255 and forms.ischecked(BooModeCheckbox))) then
            if (item_we_got == ItemBotWantedItem) then
                -- We succeeded
                
                local i = 0
                local tableStr = ""
                while i <= #InputQueue do
                    local to_edit = bizstring.replace(InputQueue[i], "\n", "")
                    
                    -- store the Z in the right spot in the text box
                    if (i == ItemBotIteratorSave) then
                        to_edit = string.sub(to_edit,0,25) .. "Z" .. string.sub(to_edit,27)
                    end
                    
                    tableStr = tableStr .. to_edit .. "\r\n"
                    i = i +1
                end
                forms.settext(InputQueueTextBox, tableStr)
                
                -- Clean up the queue
                ClearQueue()
                
                -- Load the starting state
                savestate.load("ItemBotStartingState")
                
                -- turn off the bot
                ItemBotState = 4
                
                -- Pause
                client.pause()
            else
                -- We failed
                -- load the state
                savestate.load("ItemBotIterator")
                
                -- load the iterator value
                queueIterator = ItemBotIteratorSave

                -- Switch to skip a frame mode
                ItemBotState = 3
            end
          end
        end

        --console.log("Getting index " .. queueIterator .. " of InputQueue")
        if (ItemBotState ~= 4) then
            if (queueIterator < table.getn(InputQueue) + 1) then
                toPut = bizstring.replace(InputQueue[queueIterator], "\n", "")
                
                -- If we're going to press Z
                if (ItemBotState == 1) then
                    -- Inject the Z to next state
                    toPut = string.sub(toPut,0,25) .. "Z" .. string.sub(toPut,27)
                end
                
                --console.log(toPut)
                    --console.log(forms.gettext(TextBoxItemFrame))

                joypad.setfrommnemonicstr(toPut)
            else
                -- We ran out of input, and the bot is running
                if (ItemBotState >= 0) then
                  -- We failed!
                  
                  -- print out a message?
                  console.log("Item bot ran out of queued input!")
                  
                  -- Re-enable the button
                  forms.settext(ExecuteItemBotButtonHandle, "Item Bot")
                  
                  ItemBotState = -1
                end
                
                --console.log("input queue is done, clearing everything out")
                ClearQueue()
            end
        else
            ItemBotState = -1
            
            -- Re-enable the button
            forms.settext(ExecuteItemBotButtonHandle, "Item Bot")
        end
    end

    emu.frameadvance()
end
