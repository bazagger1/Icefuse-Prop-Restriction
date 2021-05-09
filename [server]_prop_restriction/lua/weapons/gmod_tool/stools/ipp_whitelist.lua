--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_prop_restriction/lua/weapons/gmod_tool/stools/ipp_whitelist.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

TOOL.Category           = "Icefuse Prop Protection"
TOOL.Name               = "Model Whitelister"
TOOL.Command            = nil
TOOL.ConfigName         = ""

local _mode = TOOL.Mode

function TOOL:LeftClick(trace)

    if SERVER then
        return false
    end

    if not IsValid(trace.Entity) then
        return false
    end

    if not IsFirstTimePredicted() then
        return
    end

    RunConsoleCommand('icefuse_pp_model_whitelist_add', self._category, trace.Entity:GetModel())

    return true
end

function TOOL:RightClick(trace)

    if SERVER then
        return false
    end

    if not IsValid(trace.Entity) then
        return false
    end

    if not IsFirstTimePredicted() then
        return
    end

    RunConsoleCommand('icefuse_pp_model_whitelist_remove', self._category, trace.Entity:GetModel())

    return true
end

function TOOL.BuildCPanel(panel)

	panel:Help("\nLeft click to add a model to the whitelist.\n\nRight click to remove a model from the whitelist.\n")

	local comboBox = vgui.Create('DComboBox')
    panel:AddItem(comboBox)

	panel:Help("\nEditor actions:")

	local resetButton = vgui.Create('DButton')
    panel:AddItem(resetButton)

	local editorModeButton = vgui.Create('DButton')
    panel:AddItem(editorModeButton)

    resetButton:SetText("Reset cache")
    resetButton.DoClick = function()
        RunConsoleCommand('icefuse_pp_reset_cache')
    end

    editorModeButton:SetText("Toggle editor mode")
    editorModeButton.DoClick = function()
        RunConsoleCommand('icefuse_pp_editor_mode')
    end

    local categories = {}
    for category, _ in pairs(IcefusePP.config('categories'), true) do
        table.insert(categories, category)
    end

    table.sort(categories, function(a, b)
        return a < b
    end)

    local chooseIndex = 0
    for index, category in ipairs(categories) do

        comboBox:AddChoice(index .. '.   ' .. category, category)

        if category == '_editor' then
            chooseIndex = index
        end

    end

    comboBox.OnSelect = function(_, index, value, data)
        LocalPlayer():GetTool('ipp_whitelist')._category = data
    end

    comboBox:ChooseOptionID(chooseIndex)

end
