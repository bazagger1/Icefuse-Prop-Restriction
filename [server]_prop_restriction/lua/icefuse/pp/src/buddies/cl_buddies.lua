--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_prop_restriction/lua/icefuse/pp/src/buddies/cl_buddies.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

local Addon = IcefusePP

local identifier = Addon.identifier
local library = Addon.library
local singleton = Addon.singleton
local instance = Addon.instance

local waitForClient = Addon.waitForClient

local Component = library('Component')

--
-- Buddies
--------------------------------------------------

local PlayerMeta = FindMetaTable('Player')
local player_SteamID = PlayerMeta.SteamID

--------------------------------------------------

local playerBuddies = singleton('playerBuddies')

--[[
- @param player buddy
]]
function Addon.addBuddy(buddy)
    RunConsoleCommand('icefuse_pp_buddy_add', steamId)
end

--[[
- @param string buddy
]]
function Addon.removeBuddy(steamId)
    RunConsoleCommand('icefuse_pp_buddy_remove', steamId)
end

--[[
- Whether the player is the buddy of another player.
-
- @param player buddy
- @param player ply
-
- @return bool
]]
function Addon.isPlayerBuddy(buddy, ply)

    if playerBuddies[player_SteamID(ply)] == nil then
        return false
    end

    return playerBuddies[player_SteamID(ply)][player_SteamID(buddy)] == true
end

--------------------------------------------------
-- Networking

local NET_PLAYER_BUDDIES = identifier('player.buddies')

net.Receive(NET_PLAYER_BUDDIES, function(len)

    local ply = net.ReadEntity() or LocalPlayer()
    local buddies = net.ReadTable()

    waitForClient(function()

        if not IsValid(ply) then
             ply = LocalPlayer() -- Assuming it is localPlayer when nil
        end

        playerBuddies[ply:SteamID()] = buddies

        if ply == LocalPlayer() then
            -- Update the view

            local view = instance('view.buddies')
            if view == nil then
                return
            end

            view:updateBuddies(buddies)

        end

    end, true)

end)

--------------------------------------------------
-- View

local BuddyMenu = singleton('component.buddiesMenu')
Component:extend(BuddyMenu, function(Class, Prototype)

    --[[
    - @var string
    ]]
    Class._panelClass = 'DForm'

    --[[
    - @var table
    ]]
    Prototype._buddies = nil

    --[[
    - @var string
    ]]
    Prototype._filter = ""

    --[[
    - @var Component
    ]]
    Prototype.list = nil

    --[[
    - @var Component
    ]]
    Prototype.removeButton = nil

    --[[
    - @var Component
    ]]
    Prototype.searchInput = nil

    --[[
    - @var Component
    ]]
    Prototype.refreshButton = nil

    --[[
    - @var Component
    ]]
    Prototype.playerList = nil

    --[[
    - @var Component
    ]]
    Prototype.addButton = nil

    --[[
    - @param panel panel
    ]]
    function Prototype:__construct(panel)
        self.__parent.__construct(self, panel)

        self._buddies = {}

    end

    --[[
    - @inheritdoc
    ]]
    function Prototype:init(panel)
        self.__parent:init(panel)

        self.list = Component:createNamed('DListView')
        self.removeButton = Component:createNamed('DButton')
        self.searchInput = Component:createNamed('DTextEntry')
        self.refreshButton = Component:createNamed('DButton')
        self.playerList = Component:createNamed('DListView')
        self.addButton = Component:createNamed('DButton')

        local listPanel = self.list:getPanel()
        local removeButtonPanel = self.removeButton:getPanel()
        local searchInputPanel = self.searchInput:getPanel()
        local refreshButtonPanel = self.refreshButton:getPanel()
        local playerListPanel = self.playerList:getPanel()
        local addButtonPanel = self.addButton:getPanel()

        self:override(self.searchInput, 'OnValueChange', self.p_searchInput_onValueChange)
        self:override(self.refreshButton, 'DoClick', self.p_refreshButton_doClick)
        self:override(self.removeButton, 'DoClick', self.p_removeButton_doClick)
        self:override(self.addButton, 'DoClick', self.p_addButton_doClick)

        listPanel:AddColumn("Steam ID")
        listPanel:AddColumn("Name")
        listPanel:SetMultiSelect(false)
        listPanel:SetTall(140)

        playerListPanel:AddColumn("Steam ID")
        playerListPanel:AddColumn("Name")
        playerListPanel:SetMultiSelect(false)
        playerListPanel:SetTall(120)

        searchInputPanel:SetUpdateOnType(true)
        searchInputPanel:SetTall(28)

        refreshButtonPanel:SetText("Refresh list")
        removeButtonPanel:SetText("Remove selected buddy")
        addButtonPanel:SetText("Add selected buddy")

        panel:Help("\nHere you can manage the buddies you want to share props with."
                .. "\n\nNote: Your buddies will only be lost when the server restarts."
                .. "\n")

        panel:Help("Your buddies:")

        panel:AddItem(listPanel)
        panel:AddItem(removeButtonPanel)

        panel:Help("\nSearch for buddies:")

        panel:AddItem(searchInputPanel)
        panel:AddItem(refreshButtonPanel)
        panel:AddItem(playerListPanel)
        panel:AddItem(addButtonPanel)

    end

    --[[
    - @param table buddies
    ]]
    function Prototype:updateBuddies(buddies)
        self._buddies = buddies

        local listPanel = self.list:getPanel()

        -- Clear the panel
        listPanel:Clear()

        -- Add new lines
        for steamId, _ in pairs(buddies) do

            local ply = player.GetBySteamID(steamId)
            local name = IsValid(ply) and ply:Nick() or "unknown (offline)"

            local line = listPanel:AddLine(steamId, name)
            line._steamId = steamId

        end

        self:filter(self._filter)

    end

    --[[
    - @param string filter
    ]]
    function Prototype:filter(filter)
        self._filter = filter

        local playerListPanel = self.playerList:getPanel()
        playerListPanel:Clear()

        local players = {}
        for _, ply in ipairs(player.GetAll()) do

            if ply:IsBot() then
                continue
            end

            if self._buddies[ply:SteamID()] or ply == LocalPlayer() then
                continue
            end

            if filter == "" then
                table.insert(players, ply)

                continue
            end

            if string.StartWith(filter, 'STEAM_') and ply:SteamID():find(filter)then
                table.insert(players, ply)

                continue
            end

            if ply:Nick():lower():find(filter) or ply:SteamName():lower():find(filter) then
                table.insert(players, ply)

                continue
            end

        end

        for _, ply in ipairs(players) do
            local line = playerListPanel:AddLine(ply:SteamID(), ply:Nick())
            line._steamId = ply:SteamID()
        end
        playerListPanel:SelectFirstItem()

    end

    --[[ ]]
    function Prototype:p_refreshButton_doClick()
        self:filter(self._filter)
    end

    --[[ ]]
    function Prototype:p_addButton_doClick()

        local playerListPanel = self.playerList:getPanel()

        local line = playerListPanel:GetLine(playerListPanel:GetSelectedLine())
        if not line then
            return
        end

        RunConsoleCommand('icefuse_pp_buddy_add', line._steamId)

    end

    --[[ ]]
    function Prototype:p_removeButton_doClick()

        local listPanel = self.list:getPanel()

        local line = listPanel:GetLine(listPanel:GetSelectedLine())
        if not line then
            return
        end

        RunConsoleCommand('icefuse_pp_buddy_remove', line._steamId)

    end

    --[[ ]]
    function Prototype:p_searchInput_onValueChange(panel, value)
        value = string.Trim(value)

        self:filter(value)

    end

end)

--[[
- @param panel panel
]]
local function view(panel)
    instance('view.buddies', BuddyMenu:apply(panel))
end

--[[
-
]]
local function populateToolMenu()

    spawnmenu.AddToolMenuOption("Utilities", "Icefuse - Prop Protection",
        identifier('utillities', 'buddies'), "Buddies", "", "", view)

end
hook.Add('PopulateToolMenu', identifier('buddies'), populateToolMenu)
