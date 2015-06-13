--This Lua script was developed by Drew Weatherton for the BizHawk emulator-------------------------------------------
--NOTE: Script must be stored in the same directory as EmuHawk.exe for some functions to work-------------------------
--Purpose: Establish waypoints to track distance to provide benchmarks for progress-----------------------------------

console.clear()

--User has clicked the "Save" button
function SaveWaypoint1Button()

    if forms.ischecked(CheckboxWayline1) == true then
        CheckboxWayline1State = "true"
    else 
        CheckboxWayline1State = "false"
    end

    if forms.ischecked(CheckboxWaypoint2) == true then
        CheckboxWaypoint2State = "true"
    else 
        CheckboxWaypoint2State = "false"
    end

    if forms.ischecked(CheckboxWayline2) == true then
        CheckboxWayline2State = "true"
    else 
        CheckboxWayline2State = "false"
    end

    local handle = io.open(forms.gettext(WaypointFilename) .. ".wpt", "w+")
    handle:write(
        CheckboxWayline1State .. "\n" ..
        CheckboxWaypoint2State .. "\n" ..
        CheckboxWayline2State .. "\n" ..

        forms.gettext(Waypoint1TitleTextBox) .. "\n" ..
        forms.gettext(Waypoint1XTextBox) .. "\n" ..
        forms.gettext(Waypoint1YTextBox) .. "\n" ..
        forms.gettext(Waypoint1ZTextBox) .. "\n" ..

        forms.gettext(Waypoint1X2TextBox) .. "\n" ..
        forms.gettext(Waypoint1Y2TextBox) .. "\n" ..
        forms.gettext(Waypoint1Z2TextBox) .. "\n" ..

        forms.gettext(Waypoint2TitleTextBox) .. "\n" ..
        forms.gettext(Waypoint2XTextBox) .. "\n" ..
        forms.gettext(Waypoint2YTextBox) .. "\n" ..
        forms.gettext(Waypoint2ZTextBox) .. "\n" ..

        forms.gettext(Waypoint2X2TextBox) .. "\n" ..
        forms.gettext(Waypoint2Y2TextBox) .. "\n" ..
        forms.gettext(Waypoint2Z2TextBox))
    handle:close()

    console.log("Waypoint File Saved")

end

--User has clicked the "Open" button
function OpenWaypoint1Button()

    SavedVariables = { }

    SavedVariables[0] = CheckboxWayline1
    SavedVariables[1] = CheckboxWaypoint2
    SavedVariables[2] = CheckboxWayline2

    SavedVariables[3] = Waypoint1TitleTextBox
    SavedVariables[4] = Waypoint1XTextBox
    SavedVariables[5] = Waypoint1YTextBox
    SavedVariables[6] = Waypoint1ZTextBox
    SavedVariables[7] = Waypoint1X2TextBox
    SavedVariables[8] = Waypoint1Y2TextBox
    SavedVariables[9] = Waypoint1Z2TextBox
    SavedVariables[10] = Waypoint2TitleTextBox
    SavedVariables[11] = Waypoint2XTextBox
    SavedVariables[12] = Waypoint2YTextBox
    SavedVariables[13] = Waypoint2ZTextBox
    SavedVariables[14] = Waypoint2X2TextBox
    SavedVariables[15] = Waypoint2Y2TextBox
    SavedVariables[16] = Waypoint2Z2TextBox

    WaypointDirectory = forms.openfile()

    local i = 0

    for line in io.lines(WaypointDirectory) do

        console.log(line)
        if i < 3 then
            forms.setproperty(SavedVariables[i],"Checked",line)
        else
            forms.settext(SavedVariables[i], line)
        end

        i = i + 1

    end

end

function SetWaypoint1Button()

    forms.settext(Waypoint1XTextBox, PlayerX)
    forms.settext(Waypoint1YTextBox, PlayerY)
    forms.settext(Waypoint1ZTextBox, PlayerZ)

end

function SetWaypoint1Button2()

    forms.settext(Waypoint1X2TextBox, PlayerX)
    forms.settext(Waypoint1Y2TextBox, PlayerY)
    forms.settext(Waypoint1Z2TextBox, PlayerZ)

end

function SetWaypoint2Button()

    forms.settext(Waypoint2XTextBox, PlayerX)
    forms.settext(Waypoint2YTextBox, PlayerY)
    forms.settext(Waypoint2ZTextBox, PlayerZ)

end

function SetWaypoint2Button2()

    forms.settext(Waypoint2X2TextBox, PlayerX)
    forms.settext(Waypoint2Y2TextBox, PlayerY)
    forms.settext(Waypoint2Z2TextBox, PlayerZ)

end

    WaypointsWindow = forms.newform(482, 700, "Mario Kart 64 Waypoint Dashboard")

    WaypointFilename = forms.textbox(WaypointsWindow, "Filename", 366, 18, "", 53, 3, true, true)
    SaveWaypoint1Handle = forms.button(WaypointsWindow, "Save", SaveWaypoint1Button, 0, 0, 50, 23)
    OpenWaypoint1Handle = forms.button(WaypointsWindow, "Open", OpenWaypoint1Button, 422, 0, 50, 23)

-- Waypoint 1------------------------------------------------------------------------------------------------------------
-- Waypoint 1, Point 1

    forms.label(WaypointsWindow, "____________________________________________________________________________________", 0, 11, 477, 14)
    
    forms.label(WaypointsWindow, "Waypoint 1:", 0, 30, 64, 18)

    SetWaypoint1Handle = forms.button(WaypointsWindow, "Set from location", SetWaypoint1Button, 185, 110, 94, 23)
    Waypoint1TitleTextBox = forms.textbox(WaypointsWindow, "Title", 408, 20, "", 64, 27, true, true)

    Waypoint1XTextBox = forms.textbox(WaypointsWindow, "0", 132, 20, SIGNED, 185, 50, false, true)
    Waypoint1XLabel = forms.label(WaypointsWindow, "X:", 171, 55, 17, 15)
    Waypoint1X = tonumber(forms.gettext(Waypoint1XTextBox))

    Waypoint1YTextBox = forms.textbox(WaypointsWindow, "0", 132, 20, SIGNED, 185, 70, false, true)
    forms.label(WaypointsWindow, "Y:", 171, 75, 17, 15) 
    Waypoint1Y = tonumber(forms.gettext(Waypoint1YTextBox))

    Waypoint1ZTextBox = forms.textbox(WaypointsWindow, "0", 132, 20, SIGNED, 185, 90, false, true)
    forms.label(WaypointsWindow, "Z:", 171, 95, 17, 15)
    Waypoint1Z = tonumber(forms.gettext(Waypoint1ZTextBox))

-- Waypoint 1, Point 2
    SetWaypoint1Handle2 = forms.button(WaypointsWindow, "Set from location", SetWaypoint1Button2, 378, 110, 94, 23)
    -- Create checkbox for toggling this waypoint's visiblity
    CheckboxWayline1 = forms.checkbox(WaypointsWindow, "Line segment", 295, 110)
    -- This starts as invisible (size 0,0) but size is changed to cover all related inputs
    Waypoint1Cover2 = forms.label(WaypointsWindow, "", 320, 50, 0, 0)

    Waypoint1X2TextBox = forms.textbox(WaypointsWindow, "0", 132, 20, SIGNED, 340, 50, false, true)
    forms.label(WaypointsWindow, "X2:", 320, 55, 24, 15)
    Waypoint1X2 = tonumber(forms.gettext(Waypoint1X2TextBox))

    Waypoint1Y2TextBox = forms.textbox(WaypointsWindow, "0", 132, 20, SIGNED, 340, 70, false, true)
    forms.label(WaypointsWindow, "Y2:", 320, 75, 24, 15)
    Waypoint1Y2 = tonumber(forms.gettext(Waypoint1Y2TextBox))

    Waypoint1Z2TextBox = forms.textbox(WaypointsWindow, "0", 132, 20, SIGNED, 340, 90, false, true)
    forms.label(WaypointsWindow, "Z2:", 320, 95, 24, 15)
    Waypoint1Z2 = tonumber(forms.gettext(Waypoint1Z2TextBox))

-- Distances
    forms.label(WaypointsWindow, "Distances:", 10, 53, 60, 15)
    Waypoint1XYTextBox = forms.textbox(WaypointsWindow, "0", 132, 20, SIGNED, 33, 70, false, true)
    forms.label(WaypointsWindow, "XY:", 10, 75, 25, 20)    

    Waypoint1XYZTextBox = forms.textbox(WaypointsWindow, "0", 132, 20, SIGNED, 33, 90, false, true)
    forms.label(WaypointsWindow, "XYZ:", 3, 95, 32, 20)

-- Waypoint 2------------------------------------------------------------------------------------------------------------
-- Waypoint 2, Point 1

    forms.label(WaypointsWindow, "____________________________________________________________________________________", 0, 123, 477, 14)
    
    Waypoint2TitleTextBox = forms.textbox(WaypointsWindow, "Title", 388, 20, "", 84, 139, true, true)

    CheckboxWaypoint2 = forms.checkbox(WaypointsWindow, "Waypoint 2:", 3, 137)
    
    SetWaypoint1Handle = forms.button(WaypointsWindow, "Set from location", SetWaypoint2Button, 185, 222, 94, 23)

    Waypoint2XTextBox = forms.textbox(WaypointsWindow, "0", 132, 20, SIGNED, 185, 162, false, true)
    Waypoint2XLabel = forms.label(WaypointsWindow, "X:", 171, 167, 17, 15)
    Waypoint2X = tonumber(forms.gettext(Waypoint1XTextBox))

    Waypoint2YTextBox = forms.textbox(WaypointsWindow, "0", 132, 20, SIGNED, 185, 182, false, true)
    forms.label(WaypointsWindow, "Y:", 171, 187, 17, 15) 
    Waypoint2Y = tonumber(forms.gettext(Waypoint1YTextBox))

    Waypoint2ZTextBox = forms.textbox(WaypointsWindow, "0", 132, 20, SIGNED, 185, 202, false, true)
    forms.label(WaypointsWindow, "Z:", 171, 207, 17, 15)
    Waypoint2Z = tonumber(forms.gettext(Waypoint1ZTextBox))

-- Waypoint 1, Point 2

    SetWaypoint2Handle2 = forms.button(WaypointsWindow, "Set from location", SetWaypoint2Button2, 378, 222, 94, 23)

    -- Create checkbox for toggling this waypoint's visiblity
    CheckboxWayline2 = forms.checkbox(WaypointsWindow, "Line segment", 295, 222)
    -- This starts as invisible (size 0,0) but size is changed to cover all related inputs
    Waypoint2Cover2 = forms.label(WaypointsWindow, "", 320, 162, 0, 0)

    Waypoint2X2TextBox = forms.textbox(WaypointsWindow, "0", 132, 20, SIGNED, 340, 162, false, true)
    forms.label(WaypointsWindow, "X2:", 320, 167, 24, 15)
    Waypoint2X2 = tonumber(forms.gettext(Waypoint1X2TextBox))

    Waypoint2Y2TextBox = forms.textbox(WaypointsWindow, "0", 132, 20, SIGNED, 340, 182, false, true)
    forms.label(WaypointsWindow, "Y2:", 320, 187, 24, 15)
    Waypoint2Y2 = tonumber(forms.gettext(Waypoint1Y2TextBox))

    Waypoint2Z2TextBox = forms.textbox(WaypointsWindow, "0", 132, 20, SIGNED, 340, 202, false, true)
    forms.label(WaypointsWindow, "Z2:", 320, 207, 24, 15)
    Waypoint2Z2 = tonumber(forms.gettext(Waypoint1Z2TextBox))

-- Distances
    forms.label(WaypointsWindow, "Distances:", 10, 165, 60, 15)
    Waypoint2XYTextBox = forms.textbox(WaypointsWindow, "0", 132, 20, SIGNED, 33, 182, false, true)
    forms.label(WaypointsWindow, "XY:", 10, 187, 25, 20)    

    Waypoint2XYZTextBox = forms.textbox(WaypointsWindow, "0", 132, 20, SIGNED, 33, 202, false, true)
    forms.label(WaypointsWindow, "XYZ:", 3, 207, 32, 20)

while true do

    Xaddr = 0x0F69A4
    Yaddr = 0x0F69AC
    Zaddr = 0xF69A8

    -- Divide by 18 to convert to meters
    PlayerX=(mainmemory.readfloat(Xaddr, true)/18)
    PlayerY=(mainmemory.readfloat(Yaddr, true)/18)
    PlayerZ=(mainmemory.readfloat(Zaddr, true)/18)

    -- Waypoint 1 Logic
    Waypoint1X = tonumber(forms.gettext(Waypoint1XTextBox))
    Waypoint1Y = tonumber(forms.gettext(Waypoint1YTextBox))
    Waypoint1Z = tonumber(forms.gettext(Waypoint1ZTextBox))

    Waypoint1XY = math.sqrt ((Waypoint1X-PlayerX)^2+(Waypoint1Y-PlayerY)^2)
    forms.settext(Waypoint1XYTextBox, Waypoint1XY)

    Waypoint1XYZ = math.sqrt ((Waypoint1X-PlayerX)^2+(Waypoint1Y-PlayerY)^2+(Waypoint1Z-PlayerZ)^2)
    forms.settext(Waypoint1XYZTextBox, Waypoint1XYZ)

    if forms.ischecked(CheckboxWayline1) == false then

        forms.setproperty(Waypoint1Cover2,"Visible",true)
        forms.setproperty(SetWaypoint1Handle2,"Visible",false)

    else

        forms.setproperty(Waypoint1Cover2,"Visible",false)
        forms.setproperty(SetWaypoint1Handle2,"Visible",true)

        Waypoint1X2 = tonumber(forms.gettext(Waypoint1X2TextBox))
        Waypoint1Y2 = tonumber(forms.gettext(Waypoint1Y2TextBox))
        Waypoint1Z2 = tonumber(forms.gettext(Waypoint1Z2TextBox))

    end

    if forms.ischecked(CheckboxWaypoint2) == false then

        forms.setsize(WaypointsWindow, 482, 182)
        forms.setproperty(Waypoint2TitleTextBox,"Visible",false)


    else

        forms.setsize(WaypointsWindow, 482, 272)
        forms.setproperty(Waypoint2TitleTextBox,"Visible",true)

        -- Waypoint 2 Logic
        Waypoint2X = tonumber(forms.gettext(Waypoint2XTextBox))
        Waypoint2Y = tonumber(forms.gettext(Waypoint2YTextBox))
        Waypoint2Z = tonumber(forms.gettext(Waypoint2ZTextBox))

        Waypoint2XY = math.sqrt ((Waypoint2X-PlayerX)^2+(Waypoint2Y-PlayerY)^2)
        forms.settext(Waypoint2XYTextBox, Waypoint2XY)

        Waypoint2XYZ = math.sqrt ((Waypoint2X-PlayerX)^2+(Waypoint2Y-PlayerY)^2+(Waypoint2Z-PlayerZ)^2)
        forms.settext(Waypoint2XYZTextBox, Waypoint2XYZ)

    end

    if forms.ischecked(CheckboxWayline2) == false then

        forms.setproperty(Waypoint2Cover2,"Visible",true)
        forms.setproperty(SetWaypoint2Handle2,"Visible",false)

    else

        forms.setproperty(Waypoint2Cover2,"Visible",false)
        forms.setproperty(SetWaypoint2Handle2,"Visible",true)

        Waypoint2X2 = tonumber(forms.gettext(Waypoint2X2TextBox))
        Waypoint2Y2 = tonumber(forms.gettext(Waypoint2Y2TextBox))
        Waypoint2Z2 = tonumber(forms.gettext(Waypoint2Z2TextBox))

    end

    emu.frameadvance()
end