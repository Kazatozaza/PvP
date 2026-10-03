local _version = "1.6.66"

-- ป้องกันหน้าต่างซ้ำซ้อนและเคลียร์ค่าเก่าอย่างปลอดภัย
if getgenv().DestinyHubWindow then
    pcall(function()
        if typeof(getgenv().DestinyHubWindow.Destroy) == "function" then
            getgenv().DestinyHubWindow:Destroy()
        end
    end)
    getgenv().DestinyHubWindow = nil
end

-- โหลด WindUI พร้อมระบบป้องกัน Error หากดึงข้อมูลไม่สำเร็จ
local success, WindUI = pcall(function()
    return loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/download/" .. _version .. "/main.lua"))()
end)

if not success or not WindUI then
    warn("Destiny Hub: ไม่สามารถโหลด WindUI ได้ กรุณาตรวจสอบอินเทอร์เน็ตหรือเวอร์ชัน")
    return
end

pcall(function()
  WindUI:AddTheme({
    Name = "Darker-Soft",
    Primary = Color3.fromHex("#3b82f6"),
    
    White = Color3.new(1,1,1),
    Black = Color3.new(0,0,0),
    
    Dialog = Color3.fromHex("#1e1e24"),
    
    Background = Color3.fromHex("#111115"),
    BackgroundTransparency = 0,
    Hover = Color3.fromHex("#FFFFFF"),

    PanelBackground = Color3.fromHex("#18181f"),
    PanelBackgroundTransparency = .95,
    
    WindowBackground = Color3.fromHex("#111115"),
    
    WindowShadow = Color3.new(0,0,0),
    
    WindowTopbarTitle = Color3.fromHex("#FFFFFF"),
    WindowTopbarAuthor = Color3.fromHex("#FFFFFF"),
    WindowTopbarIcon = Color3.fromHex("#FFFFFF"),
    WindowTopbarButtonIcon = Color3.fromHex("#FFFFFF"), -- ไอคอนปุ่ม Topbar เป็นสีขาว
    
    WindowSearchBarBackground = Color3.fromHex("#18181f"),
    
    -- ส่วนของ Tab / ตัวเลือก
    TabBackground = Color3.fromHex("#18181f"),
    TabBackgroundHover = Color3.fromHex("#ffffff"),
    TabBackgroundHoverTransparency = 0.85,
    TabBackgroundActive = Color3.fromHex("#ffffff"),
    TabBackgroundActiveTransparency = 0.9,
    TabText = Color3.fromHex("#A1A1AA"),
    TabTextTransparency = 0,
    TabTextTransparencyActive = 0,
    TabTitle = Color3.fromHex("#FFFFFF"),
    TabIcon = Color3.fromHex("#A1A1AA"),
    TabIconTransparency = 0,
    TabIconTransparencyActive = 0,
    TabBorderTransparency = 1,
    TabBorderTransparencyActive = 0.7,
    TabBorder = Color3.fromHex("#FFFFFF"),


    ElementBackground = Color3.fromHex("#18181f"),
    ElementBackgroundTransparency = .5,
    ElementBackgroundHover = WindUI.Creator:AddColor("ElementBackground", "#272730", 1),
    ElementTitle = Color3.fromHex("#FFFFFF"),
    ElementDesc = Color3.fromHex("#cbd5e1"),
    ElementIcon = Color3.fromHex("#FFFFFF"),
    
    PopupBackground = Color3.fromHex("#18181f"),
    PopupBackgroundTransparency = "BackgroundTransparency",
    PopupTitle = Color3.fromHex("#FFFFFF"),
    PopupContent = Color3.fromHex("#cbd5e1"),
    PopupIcon = Color3.fromHex("#FFFFFF"),
    
    DialogBackground = Color3.fromHex("#18181f"),
    DialogBackgroundTransparency = "BackgroundTransparency",
    DialogTitle = Color3.fromHex("#FFFFFF"),
    DialogContent = Color3.fromHex("#cbd5e1"),
    DialogIcon = Color3.fromHex("#FFFFFF"),
    
    Toggle = Color3.fromHex("#272730"),
    ToggleBar = Color3.fromHex("#FFFFFF"),
    
    Checkbox = Color3.fromHex("#FFFFFF"),
    CheckboxIcon = Color3.fromHex("#FFFFFF"),
    CheckboxBorder = Color3.fromHex("#52525b"),
    CheckboxBorderTransparency = 0,
    
    SliderIcon = Color3.fromHex("#FFFFFF"),

    Slider = Color3.fromHex("#FFFFFF"),
    SliderThumb = Color3.fromHex("#FFFFFF"),
    SliderIconFrom = Color3.fromHex("#FFFFFF"),
    SliderIconTo = Color3.fromHex("#FFFFFF"),
    
    Tooltip = Color3.fromHex("#272730"),
    TooltipText = Color3.fromHex("#FFFFFF"),
    TooltipSecondary = Color3.fromHex("#94a3b8"),
    TooltipSecondaryText = Color3.fromHex("#FFFFFF"),

    TabSectionIcon = Color3.fromHex("#FFFFFF"),

    SectionIcon = Color3.fromHex("#FFFFFF"),
    
    SectionExpandIcon = Color3.fromHex("#FFFFFF"),
    SectionExpandIconTransparency = 0,
    SectionBox = Color3.fromHex("#18181f"),
    SectionBoxTransparency = .5,
    SectionBoxBorder = Color3.fromHex("#3f3f46"),
    SectionBoxBorderTransparency = 0,
    SectionBoxBackground = Color3.fromHex("#18181f"),
    SectionBoxBackgroundTransparency = .5,
    
    SearchBarBorder = Color3.fromHex("#3f3f46"),
    SearchBarBorderTransparency = 0,
    
    Notification = Color3.fromHex("#18181f"),
    NotificationTitle = Color3.fromHex("#FFFFFF"),
    NotificationTitleTransparency = 0,
    NotificationContent = Color3.fromHex("#cbd5e1"),
    NotificationContentTransparency = 0,
    NotificationDuration = Color3.fromHex("#FFFFFF"),
    NotificationDurationTransparency = .9,
    NotificationBorder = Color3.fromHex("#3f3f46"),
    NotificationBorderTransparency = 0,
    
    DropdownTabBorder = Color3.fromHex("#3f3f46"),

    LabelBackground = Color3.fromHex("#18181f"),
    LabelBackgroundTransparency = .5,

    -- เพิ่มค่าปรับแต่งสีปุ่ม (Button) ให้เป็นสีขาว
    Button = Color3.fromHex("#272730"),
    ButtonText = Color3.fromHex("#FFFFFF"),
    ButtonIcon = Color3.fromHex("#FFFFFF"),
    ButtonBackground = Color3.fromHex("#272730"),
    ButtonBackgroundHover = Color3.fromHex("#32323d"),
  })
end)


local windowSuccess, Window = pcall(function()
    return WindUI:CreateWindow({
    Title = "Project Destiny [v3.0]",
    Icon =  "rbxassetid://97596339693490",
    Author = "System Online • Access Granted",
    Folder = "Destiny Hub",
    Size = UDim2.fromOffset(620, 515), -- window size
    Transparent = true, -- window transparency
    Theme = "Darker-Soft", -- library theme
    Resizable = true, -- the ability to rezize window
    SideBarWidth = 200, -- sidebar (tabs) width
    HideSearchBar = true, -- hide search bar
    })
end)


WindUI:SetNotificationLower(true)

if windowSuccess and Window then
    getgenv().DestinyHubWindow = Window
else
    warn("Destiny Hub: ไม่สามารถสร้างหน้าต่าง UI ได้")
end



Window:Section({
    Title = "Combat",
})

local CombatTab = Window:Tab({
    Title = "Combat",
    Icon = "swords"
})




CombatTab:Select()


local MyConfig = Window.ConfigManager:Config("DestinyConfig")


task.spawn(function()
    task.wait()
    pcall(function()
        MyConfig:Load()
    end)
end)





getgenv().SavedFOVRadius = getgenv().SavedFOVRadius or getgenv().FOVRadius
getgenv().SilentAimMode = getgenv().SilentAimMode or "FOV"
getgenv().FOVRadius = getgenv().FOVRadius or 100
getgenv().MaxDistance = getgenv().MaxDistance or 1000
getgenv().SilentAimEnabled = getgenv().SilentAimEnabled ~= false and true
getgenv().ShowFOV = getgenv().ShowFOV ~= false and true
getgenv().ShowTracer = getgenv().ShowTracer ~= false and true
getgenv().CurrentTarget = nil
getgenv().FOVPositionMode = getgenv().FOVPositionMode or "Middle" 
getgenv().LockedPartName = "HumanoidRootPart"
getgenv().PredictionEnabled = getgenv().PredictionEnabled ~= false and true
getgenv().PredictionFactor = getgenv().PredictionFactor or 0.135
getgenv().CamlockEnabled = getgenv().CamlockEnabled ~= false and true


---------------------------------------------------------------------------------------

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

if LocalPlayer.PlayerGui:FindFirstChild("MobileAimbotGui") then
    LocalPlayer.PlayerGui.MobileAimbotGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MobileAimbotGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MobileAimbotGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local FOVThemeColor = _G.FOVThemeColor or Color3.fromRGB(255, 255, 255)

local FOVUI = Instance.new("Frame")
FOVUI.Name = "FOVCircle"
FOVUI.AnchorPoint = Vector2.new(0.5, 0.5)
FOVUI.BackgroundTransparency = 1
FOVUI.Visible = false
FOVUI.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = FOVUI

local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 1.5
UIStroke.Color = FOVThemeColor
UIStroke.Transparency = 0.3
UIStroke.Parent = FOVUI

local CenterDot = Instance.new("Frame")
CenterDot.Name = "CenterDot"
CenterDot.AnchorPoint = Vector2.new(0.5, 0.5)
CenterDot.Position = UDim2.new(0.5, 0, 0.5, 0)
CenterDot.BackgroundColor3 = FOVThemeColor
CenterDot.BackgroundTransparency = 0.2
CenterDot.Parent = FOVUI

local DotCorner = Instance.new("UICorner")
DotCorner.CornerRadius = UDim.new(1, 0)
DotCorner.Parent = CenterDot

local Snapline = Drawing.new("Line")
Snapline.Visible = false
Snapline.Thickness = 1.5        
Snapline.Color = Color3.fromRGB(255, 255, 255) 
Snapline.Transparency = 1            
Snapline.From = Vector2.new(0, 0)        
Snapline.To = Vector2.new(0, 0)
---------------------------------------------------------------------------------------
local LastMousePosition = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

-- ===== OPTIMIZATION: อัปเดตตำแหน่ง FOV ทันทีที่เม้าส์ขยับ ลดอาการหน่วง =====
local function UpdateFOVPosition(pos)
    if not FOVUI or not FOVUI.Visible then return end
    local cachedFOVMode = tostring(getgenv().FOVPositionMode):lower()
    local viewportSize = Camera.ViewportSize
    
    if cachedFOVMode:find("mouse") then
        FOVUI.Position = UDim2.new(0, pos.X, 0, pos.Y)
    else
        FOVUI.Position = UDim2.new(0, viewportSize.X / 2, 0, viewportSize.Y / 2)
    end
end

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        LastMousePosition = Vector2.new(input.Position.X, input.Position.Y)
        UpdateFOVPosition(LastMousePosition)
    end
end)

UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        LastMousePosition = Vector2.new(input.Position.X, input.Position.Y)
        UpdateFOVPosition(LastMousePosition)
    end
end)

---------------------------------------------------------------------------------------
local safeZonesFolder = Workspace:FindFirstChild("_WorldOrigin") and Workspace._WorldOrigin:FindFirstChild("SafeZones")
local combatCache = {}
local safeZoneCache = {}
local lastCacheClear = tick()
local lastEnemiesCheck = 0
local cachedEnemiesFolder = nil

local function getCachedEnemiesFolder()
    local now = tick()
    if now - lastEnemiesCheck > 1 then
        cachedEnemiesFolder = Workspace:FindFirstChild("Enemies")
        lastEnemiesCheck = now
    end
    return cachedEnemiesFolder
end

local function clearCacheIfNeeded()
    local now = tick()
    if now - lastCacheClear >= 1.0 then
        table.clear(combatCache)
        table.clear(safeZoneCache)
        lastCacheClear = now
    end
end

local function isPlayerInCombat(player, character)
    if not player then return false end
    if combatCache[player] ~= nil then return combatCache[player] end
    
    local pCombat = player:GetAttribute("InCombat") or player:GetAttribute("Combat") or player:GetAttribute("CombatTag")
    if pCombat == true or pCombat == 1 or pCombat == "1" then
        combatCache[player] = true
        return true
    end
    
    local combatTime = player:GetAttribute("CombatTimer") or player:GetAttribute("InCombatTime")
    if type(combatTime) == "number" and combatTime > workspace:GetServerTimeNow() then
        combatCache[player] = true
        return true
    end

    if character then
        local cCombat = character:GetAttribute("InCombat") or character:GetAttribute("Combat") or character:GetAttribute("CombatTag")
        if cCombat == true or cCombat == 1 or cCombat == "1" then
            combatCache[player] = true
            return true
        end
        local combatObj = character:FindFirstChild("InCombat") 
            or character:FindFirstChild("Combat") 
            or character:FindFirstChild("CombatTag")
            or character:FindFirstChild("PvpTag")

        if combatObj then
            combatCache[player] = true
            return true
        end
    end

    combatCache[player] = false
    return false
end

local function isInSafeZoneRadius(character)
    if not character or not character:FindFirstChild("HumanoidRootPart") then return false end
    if not safeZonesFolder then return false end
    
    local charPos = character.HumanoidRootPart.Position
    
    for _, zonePart in ipairs(safeZonesFolder:GetChildren()) do
        if zonePart:IsA("BasePart") then
            local zonePos = zonePart.Position
            local radius
            
            local mesh = zonePart:FindFirstChildOfClass("SpecialMesh")
            radius = mesh and (mesh.Scale.X / 2) * math.max(zonePart.Size.X, zonePart.Size.Z) or math.max(zonePart.Size.X, zonePart.Size.Z) / 2
            
            if (charPos - zonePos).Magnitude <= radius then
                return true
            end
        end
    end
    
    return false
end

local function isPlayerInSafeZone(player, character)
    if not player then return false end
    if isPlayerInCombat(player, character) then
        safeZoneCache[player] = false
        return false
    end

    if safeZoneCache[player] ~= nil then return safeZoneCache[player] end

    local inSafeZoneAttr = player:GetAttribute("SafeZone") or (character and character:GetAttribute("SafeZone"))
    local inRadius = character and isInSafeZoneRadius(character)
    local hasTempSafeZone = character and character:FindFirstChild("TempSafeZone")
    
    local result = (inSafeZoneAttr == true or inRadius or hasTempSafeZone) == true
    safeZoneCache[player] = result
    return result
end

local function ShouldIgnoreTarget(targetCharacter, targetPlayer)
    local humanoid = targetCharacter:FindFirstChildOfClass("Humanoid")
    if humanoid and humanoid.Health <= 0 then return true end

    local enemiesFolder = getCachedEnemiesFolder()
    if enemiesFolder and targetCharacter:IsDescendantOf(enemiesFolder) then
        return false 
    end

    if not targetPlayer or targetPlayer == LocalPlayer then return true end
    if targetPlayer:GetAttribute("PvpDisabled") == true then return true end
    if isPlayerInSafeZone(targetPlayer, targetCharacter) then return true end
    
    if LocalPlayer.Team and LocalPlayer.Team.Name == "Marines" and targetPlayer.Team == LocalPlayer.Team then
        return true
    end
    
    return false
end

local cachedValidTargets = {}
local lastTargetUpdate = 0
local targetUpdateInterval = 0.5

local function UpdateValidTargets()
    table.clear(cachedValidTargets)  
    local mode = getgenv().TargetMode or "Both"
    
    if mode == "Both" or mode == "Players Only" then
        local players = Players:GetPlayers()
        for i = 1, #players do
            local player = players[i]
            if player ~= LocalPlayer and player.Character then
                table.insert(cachedValidTargets, player.Character)
            end
        end
    end
    
    if mode == "Both" or mode == "Enemies Only" then
        local enemiesFolder = getCachedEnemiesFolder()
        if enemiesFolder then
            local children = enemiesFolder:GetChildren()
            for i = 1, #children do
                local enemyModel = children[i]
                if enemyModel:IsA("Model") then
                    table.insert(cachedValidTargets, enemyModel)
                end
            end
        end
    end
end

local function GetAllValidTargets()
    if tick() - lastTargetUpdate >= targetUpdateInterval then
        lastTargetUpdate = tick()
        UpdateValidTargets()
    end
    return cachedValidTargets
end

local cachedFOVMode = "Middle"
local lastModeCheck = 0

local function GetReferencePosition()
    local now = tick()
    if now - lastModeCheck > 0.5 then
        cachedFOVMode = tostring(getgenv().FOVPositionMode):lower()
        lastModeCheck = now
    end
    
    local viewportSize = Camera.ViewportSize
    if cachedFOVMode:find("mouse") then
        return LastMousePosition
    else
        return Vector2.new(viewportSize.X / 2, viewportSize.Y / 2)
    end
end

local function GetTargetInFOV(refPos)
    local ClosestTarget = nil
    local fovRadius = getgenv().FOVRadius or 100
    local ShortestDistance = (fovRadius >= 99999) and 99999 or fovRadius
    local myChar = LocalPlayer.Character
    local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
    
    if not myHRP then return nil end
    
    local maxDistance = getgenv().MaxDistance or 500
    local validTargets = GetAllValidTargets()
    
    for i = 1, #validTargets do
        local char = validTargets[i]
        local targetPart = char:FindFirstChild(getgenv().LockedPartName) or char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Head")
        local humanoid = char:FindFirstChildOfClass("Humanoid")

        if targetPart and humanoid and humanoid.Health > 0 then
            local targetPlayer = Players:GetPlayerFromCharacter(char)
            if not ShouldIgnoreTarget(char, targetPlayer) then
                local worldDistance = (targetPart.Position - myHRP.Position).Magnitude
                
                if worldDistance <= maxDistance then
                    local screenPos, onScreen = Camera:WorldToViewportPoint(targetPart.Position)
                    if onScreen then
                        local distance = (Vector2.new(screenPos.X, screenPos.Y) - refPos).Magnitude
                        if distance < ShortestDistance then
                            ShortestDistance = distance
                            ClosestTarget = targetPart
                        end
                    end
                end
            end
        end
    end
    return ClosestTarget
end





local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

getgenv().SilentAimEnabled = getgenv().SilentAimEnabled or false
getgenv().CurrentTarget = getgenv().CurrentTarget or nil

-- Cache global functions for speed
local type = type
local typeof = typeof
local unpack = unpack
local pairs = pairs

local allowedRemotes = {
    shoot = true, fire = true, attack = true, 
    combat = true, ability = true, skill = true, gun = true
}

local blockedRemotes = {
    equip = true, tool = true, inventory = true, 
    backpack = true, loadout = true, anim = true, sound = true
}

-- Memoization cache to avoid repeated string scanning on the same remote
local remoteCache = {}

local function isAllowedRemote(self)
    local name = self.Name
    local cached = remoteCache[name]
    if cached ~= nil then
        return cached
    end

    local lowerName = name:lower()
    for blockWord in pairs(blockedRemotes) do
        if lowerName:find(blockWord, 1, true) then
            remoteCache[name] = false
            return false
        end
    end

    for keyword in pairs(allowedRemotes) do
        if lowerName:find(keyword, 1, true) then
            remoteCache[name] = true
            return true
        end
    end

    remoteCache[name] = false
    return false
end

task.spawn(function()
    local success, Mouse = pcall(function()
        return LocalPlayer:GetMouse()
    end)
    if not success or not Mouse then return end

local function getRoot()
    local target = getgenv().CurrentTarget
    if target and target.Parent then
        local character = target.Parent
        -- ค้นหาชิ้นส่วนส่วนลำตัวรองรับทั้ง R6 และ R15
        return character:FindFirstChild("HumanoidRootPart") 
            or character:FindFirstChild("UpperTorso") 
            or character:FindFirstChild("Torso")
    end
    return nil
end

    -- Combined / Optimized __index Hook
    local oldIndex
    oldIndex = hookmetamethod(game, "__index", newcclosure(function(self, idx)
        if getgenv().SilentAimEnabled and self == Mouse then
            local r = getRoot()
            if r then
                if idx == "Hit" then 
                    return r.CFrame
                elseif idx == "Target" then 
                    return r
                elseif idx == "X" or idx == "Y" then 
                    return Camera:WorldToScreenPoint(r.Position)[idx]
                end
            end
        end
        return oldIndex(self, idx)
    end))

    -- Combined / Optimized __namecall Hook
    local oldNamecall
    oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
        local method = getnamecallmethod()
        local target = getgenv().CurrentTarget
        local enabled = getgenv().SilentAimEnabled

        if target then
            -- Handle Raycast / Viewport overrides
            if enabled or UserInputService.TouchEnabled then
                if method == "ScreenPointToRay" or method == "ViewportPointToRay" then
                    local r = getRoot()
                    if r then 
                        return Ray.new(Camera.CFrame.Position, (r.Position - Camera.CFrame.Position).Unit * 1000) 
                    end
                end
            end

            -- Handle Remote FireServer / InvokeServer overrides
            if enabled and (method == "FireServer" or method == "InvokeServer") then
                if isAllowedRemote(self) then
                    local targetPos = GetPredictedPosition(target)
                    if targetPos then
                        local args = { ... }
                        for i = 1, #args do
                            local arg = args[i]
                            local argType = typeof(arg)
                            if argType == "Vector3" then
                                args[i] = targetPos
                            elseif argType == "CFrame" then
                                args[i] = arg - arg.Position + targetPos
                            end
                        end
                        return oldNamecall(self, unpack(args))
                    end
                end
            end
        end

        return oldNamecall(self, ...)
    end))
end)









local currentUiColor = Color3.fromRGB(255, 255, 255)
local displayedUiColor = currentUiColor

RunService.RenderStepped:Connect(function(dt)
    clearCacheIfNeeded()
    -- Smooth Color Transition (ปรับความเร็วในการเปลี่ยนสี ยิ่งตัวเลขมากยิ่งเปลี่ยนเร็ว แนะนำ 15-25)
    displayedUiColor = displayedUiColor:Lerp(currentUiColor, math.clamp(dt * 20, 0, 1))

    -- ตรวจสอบตัวละครหลักและกล้องอย่างปลอดภัย
    local character = LocalPlayer.Character
    local camera = Workspace.CurrentCamera
    
    if not character or not camera then
        if FOVUI then FOVUI.Visible = false end
        if Snapline then Snapline.Visible = false end
        getgenv().CurrentTarget = nil
        return
    end

    local myRoot = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso")
    if not myRoot then
        getgenv().CurrentTarget = nil
        if Snapline then Snapline.Visible = false end
        return
    end

    local refPos = GetReferencePosition()
    local mode = getgenv().SilentAimMode

    -- จัดการการแสดงผล UI ของ FOV และอัปเดตสีแบบสมูทตลอดเวลา
    if FOVUI then
        if mode == "360°" or mode == "180°" then
            FOVUI.Visible = false
        else
            FOVUI.Visible = (getgenv().ShowFOV == true)
            if FOVUI.Visible then
                FOVUI.Position = UDim2.new(0, refPos.X, 0, refPos.Y)
                local size = (getgenv().FOVRadius or 100) * 2
                FOVUI.Size = UDim2.new(0, size, 0, size)
                
                pcall(function()
                    FOVUI.Color = displayedUiColor
                end)
                pcall(function()
                    FOVUI.BackgroundColor3 = displayedUiColor
                end)
            end
        end
    end

    -- ตรวจสอบสถานะการเปิดใช้งาน
    if not getgenv().SilentAimEnabled and not getgenv().CamlockEnabled then
        getgenv().CurrentTarget = nil
        if Snapline then Snapline.Visible = false end
        return
    end

    local bestTarget = nil
    local shortestDistance = math.huge
    local maxDistance = getgenv().MaxDistance or 1000
    local validTargets = GetAllValidTargets()

    -- ค้นหาเป้าหมายตามโหมดที่เลือก
    if mode == "360°" then
        for _, char in ipairs(validTargets) do
            if char and char ~= character and not ShouldIgnoreTarget(char) then
                local rootPart = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Head")
                if rootPart then
                    local distance = (myRoot.Position - rootPart.Position).Magnitude
                    if distance <= maxDistance and distance < shortestDistance then
                        shortestDistance = distance
                        bestTarget = rootPart
                    end
                end
            end
        end

    elseif mode == "180°" then
        local lookVector = camera.CFrame.LookVector
        for _, char in ipairs(validTargets) do
            if char and char ~= character and not ShouldIgnoreTarget(char) then
                local rootPart = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Head")
                if rootPart then
                    local directionToTarget = (rootPart.Position - camera.CFrame.Position).Unit
                    if lookVector:Dot(directionToTarget) > 0 then
                        local distance = (myRoot.Position - rootPart.Position).Magnitude
                        if distance <= maxDistance and distance < shortestDistance then
                            shortestDistance = distance
                            bestTarget = rootPart
                        end
                    end
                end
            end
        end

    else
        bestTarget = GetTargetInFOV(refPos)
    end

    getgenv().CurrentTarget = bestTarget

    -- ระบบ Camlock
    if getgenv().CamlockEnabled and getgenv().CurrentTarget then
        local success, targetPos = pcall(function()
            return GetPredictedPosition(getgenv().CurrentTarget)
        end)
        if success and targetPos then
            camera.CFrame = CFrame.new(camera.CFrame.Position, targetPos)
        end
    end

    -- ระบบแสดงเส้น Tracer / Snapline (แก้ไขและรวมโค้ดสมบูรณ์)
    if getgenv().CurrentTarget and getgenv().ShowTracer and Snapline then
        local targetPart = getgenv().CurrentTarget
        
        if typeof(targetPart) == "Instance" and targetPart:IsA("Model") then
            targetPart = targetPart:FindFirstChild("HumanoidRootPart") or targetPart.PrimaryPart or targetPart:FindFirstChild("Head")
        end

        if targetPart and (targetPart:IsA("BasePart") or targetPart:IsA("Model")) then
            local partPos = targetPart:IsA("BasePart") and targetPart.Position or targetPart:GetPivot().Position
            local targetScreenPos, targetOnScreen = camera:WorldToViewportPoint(partPos)

            if targetScreenPos.Z > 0 then
                local startPos
                local originType = getgenv().TracerOrigin or "Center" 
                
                if originType == "Center" then
                    startPos = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
                elseif originType == "Bottom" then
                    startPos = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y)
                else
                    local myScreenPos = camera:WorldToViewportPoint(myRoot.Position)
                    startPos = Vector2.new(myScreenPos.X, myScreenPos.Y)
                end

                Snapline.From = startPos
                Snapline.To = Vector2.new(targetScreenPos.X, targetScreenPos.Y)
                Snapline.Color = displayedUiColor
                
                pcall(function()
                    Snapline.Thickness = getgenv().TracerThickness or 1
                    Snapline.Transparency = getgenv().TracerTransparency or 1
                end)

                Snapline.Visible = true
            else
                Snapline.Visible = false
            end
        else
            Snapline.Visible = false
        end
    else
        if Snapline then 
            Snapline.Visible = false 
        end
    end
end)




CombatTab:Toggle({
    Title = "CamLock (PC/Mobile)",
    Desc = "Lock onto targets instantly.",
    Flag = "camlock_toggle",
    Value = getgenv().CamlockEnabled,
    Callback = function(Value)
        getgenv().CamlockEnabled = Value
        if not Value then
            getgenv().CurrentTarget = nil
        end
    end,
})

CombatTab:Toggle({
    Title = "Silent Aim",
    Desc = "Hit shots without precise crosshairs.",
    Flag = "silent_aim_toggle",
    Value = getgenv().SilentAimEnabled,
    Callback = function(Value)
        getgenv().SilentAimEnabled = Value
        if not Value and not getgenv().CamlockEnabled then
            getgenv().CurrentTarget = nil
            if Snapline then Snapline.Visible = false end
        end
    end,
})


CombatTab:Toggle({
    Title = "Show FOV Circle",
    Desc = "Display FOV circle boundary.",
    Flag = "show_fov_toggle",
    Value = getgenv().ShowFOV,
    Callback = function(Value)
        getgenv().ShowFOV = Value
        if FOVUI then FOVUI.Visible = Value end
    end,
})

CombatTab:Toggle({
    Title = "Show Red Snapline",
    Desc = "Render line to active target.",
    Flag = "show_snapline_toggle",
    Value = getgenv().ShowTracer,
    Callback = function(Value)
        getgenv().ShowTracer = Value
        if not Value and Snapline then
            Snapline.Visible = false
        end
    end,
})

local AimConfigSection = CombatTab:Section({ Title = "Aim Configurations" })

getgenv().TargetMode = "Players Only" 

CombatTab:Dropdown({
    Title = "Target Type",
    Desc = "Choose targets.",
    Flag = "target_type_dropdown",
    Values = {"Players Only", "Enemies Only" },
    Value = "Players Only",
    Callback = function(selected)
        local mode = type(selected) == "table" and selected[1] or selected
        getgenv().TargetMode = mode
    end,
})

CombatTab:Dropdown({
    Title = "FOV Position",
    Desc = "Choose FOV center source.",
    Flag = "fov_position_dropdown",
    Values = { "Mouse/Touch", "Middle" },
    Value = getgenv().FOVPositionMode,
    Callback = function(selected)
        local mode = type(selected) == "table" and selected[1] or selected
        getgenv().FOVPositionMode = mode
    end,
})

CombatTab:Dropdown({
    Title = "Silent Aim Mode",
    Desc = "Switch targeting parameters.",
    Flag = "silent_aim_mode_dropdown",
    Values = { "FOV", "180°", "360°" },
    Value = "FOV",
    Callback = function(selected)
        local mode = type(selected) == "table" and selected[1] or selected
        
        if getgenv().SilentAimMode == "FOV" and mode ~= "FOV" then
        end

        getgenv().SilentAimMode = mode
        
        if mode == "360°" then
            getgenv().FOVRadius = 9999 
        elseif mode == "FOV" then
            getgenv().FOVRadius = savedFOVRadius
        end
    end,
})


CombatTab:Slider({
    Title = "FOV Size",
    Desc = "Scale FOV radius.",
    Flag = "fov_size_slider",
    Increment = 1,
    Value = {
        Min = 50,
        Max = 1000,
        Default = getgenv().FOVRadius
    },
    Callback = function(Value)
        getgenv().FOVRadius = Value
    end,
})

CombatTab:Slider({
    Title = "Max Distance",
    Desc = "Set max distance threshold.",
    Flag = "max_distance_slider",
    Increment = 1,
    Value = {
        Min = 50,
        Max = 1000,
        Default = getgenv().MaxDistance
    },
    Callback = function(Value)
        getgenv().MaxDistance = Value
    end,
})
