local _version = "1.6.66"

if not game:IsLoaded() then
    game.Loaded:Wait()
end

if getgenv().__WindUIWindow then
    pcall(function()
        getgenv().__WindUIWindow:Destroy()
    end)

    getgenv().__WindUIWindow = nil
end

local WindUI = loadstring(
    game:HttpGet(
        "https://github.com/Footagesus/WindUI/releases/download/"
        .. _version
        .. "/main.lua"
    )
)()

WindUI:AddTheme({
    Name = "Destiny Neon Violet",
    Primary = Color3.fromHex("#F0E7FF"),
    White = Color3.fromHex("#FFFFFF"),
    Black = Color3.fromHex("#030108"),
    Dialog = Color3.fromHex("#120722"),
    Background = Color3.fromHex("#080312"),
    BackgroundTransparency = 0,
    Hover = Color3.fromHex("#4A2080"),
    PanelBackground = Color3.fromHex("#8B5CF6"),
    PanelBackgroundTransparency = 0.82,
    WindowBackground = Color3.fromHex("#080312"),
    WindowShadow = Color3.fromHex("#C084FC"),
    WindowTopbarTitle = Color3.fromHex("#F7F0FF"),
    WindowTopbarAuthor = Color3.fromHex("#DDD6FE"),
    WindowTopbarIcon = Color3.fromHex("#C084FC"),
    WindowTopbarButtonIcon = Color3.fromHex("#E9D5FF"),
    WindowSearchBarBackground = Color3.fromHex("#2A1055"),
    -- Tabs
    TabBackground = Color3.fromHex("#6B21A8"),
    TabBackgroundHover = Color3.fromHex("#8B5CF6"),
    TabBackgroundHoverTransparency = 0.80,
    TabBackgroundActive = Color3.fromHex("#C084FC"),
    TabBackgroundActiveTransparency = 0.70,
    TabText = Color3.fromHex("#E9D5FF"),
    TabTextTransparency = 0.12,
    TabTextTransparencyActive = 0,
    TabTitle = Color3.fromHex("#FFFFFF"),
    TabIcon = Color3.fromHex("#D8B4FE"),
    TabIconTransparency = 0.10,
    TabIconTransparencyActive = 0,
    TabBorderTransparency = 1,
    TabBorderTransparencyActive = 0.25,
    TabBorder = Color3.fromHex("#E9D5FF"),
    TabSectionText = Color3.fromHex("#C4B5FD"),
    TabSectionIcon = Color3.fromHex("#D8B4FE"),
    -- Elements
    ElementBackground = Color3.fromHex("#6B21A8"),
    ElementBackgroundTransparency = 0.85,
    ElementBackgroundHover = Color3.fromHex("#C084FC"),
    ElementTitle = Color3.fromHex("#F0E7FF"),
    ElementDesc = Color3.fromHex("#D8B4FE"),
    ElementIcon = Color3.fromHex("#F0E7FF"),
    -- Button
    Button = Color3.fromHex("#8B5CF6"),
    ButtonTransparency = 0,
    ButtonHover = Color3.fromHex("#C084FC"),
    ButtonText = Color3.fromHex("#FFFFFF"),
    ButtonTitle = Color3.fromHex("#FFFFFF"),
    ButtonIcon = Color3.fromHex("#FFFFFF"),
    ButtonBorder = Color3.fromHex("#E9D5FF"),
    ButtonBorderTransparency = 0.25,
    -- Input / Textbox
    Input = Color3.fromHex("#2A1055"),
    InputBackground = Color3.fromHex("#2A1055"),
    InputText = Color3.fromHex("#F7F0FF"),
    InputPlaceholder = Color3.fromHex("#C084FC"),
    InputBorder = Color3.fromHex("#A855F7"),
    InputBorderTransparency = 0.40,
    -- Dropdown
    Dropdown = Color3.fromHex("#2A1055"),
    DropdownBackground = Color3.fromHex("#2A1055"),
    DropdownItem = Color3.fromHex("#E9D5FF"),
    DropdownItemHover = Color3.fromHex("#7C3AED"),
    DropdownItemHoverTransparency = 0.80,
    DropdownItemActive = Color3.fromHex("#C084FC"),
    DropdownItemText = Color3.fromHex("#FFFFFF"),
    DropdownIcon = Color3.fromHex("#C084FC"),
    DropdownTabBorder = Color3.fromHex("#A855F7"),
    -- Keybind
    Keybind = Color3.fromHex("#2A1055"),
    KeybindBackground = Color3.fromHex("#2A1055"),
    KeybindText = Color3.fromHex("#F0E7FF"),
    KeybindBorder = Color3.fromHex("#A855F7"),
    KeybindBorderTransparency = 0.40,
    -- Colorpicker
    Colorpicker = Color3.fromHex("#8B5CF6"),
    ColorpickerHue = Color3.fromHex("#C084FC"),
    ColorpickerBorder = Color3.fromHex("#E9D5FF"),
    -- Popup (แก้ไขให้เป็นตัวเลขแล้ว)
    PopupBackground = Color3.fromHex("#2A1055"),
    PopupBackgroundTransparency = 0,
    PopupTitle = Color3.fromHex("#F0E7FF"),
    PopupContent = Color3.fromHex("#D8B4FE"),
    PopupIcon = Color3.fromHex("#C084FC"),
    -- Dialog (แก้ไขให้เป็นตัวเลขแล้ว)
    DialogBackground = Color3.fromHex("#2A1055"),
    DialogBackgroundTransparency = 0,
    DialogTitle = Color3.fromHex("#FFFFFF"),
    DialogContent = Color3.fromHex("#D8B4FE"),
    DialogIcon = Color3.fromHex("#E9D5FF"),
    -- Toggle
    Toggle = Color3.fromHex("#C084FC"),
    ToggleBar = Color3.fromHex("#FFFFFF"),
    ToggleEnabled = Color3.fromHex("#C084FC"),
    ToggleDisabled = Color3.fromHex("#3B1E69"),
    -- Checkbox
    Checkbox = Color3.fromHex("#C084FC"),
    CheckboxIcon = Color3.fromHex("#FFFFFF"),
    CheckboxBorder = Color3.fromHex("#E9D5FF"),
    CheckboxBorderTransparency = 0.30,
    -- Slider
    SliderIcon = Color3.fromHex("#F0E7FF"),
    Slider = Color3.fromHex("#E9D5FF"),
    SliderThumb = Color3.fromHex("#FFFFFF"),
    SliderIconFrom = Color3.fromHex("#A855F7"),
    SliderIconTo = Color3.fromHex("#FFFFFF"),
    -- Tooltip
    Tooltip = Color3.fromHex("#3B1E69"),
    TooltipText = Color3.fromHex("#FFFFFF"),
    TooltipSecondary = Color3.fromHex("#D8B4FE"),
    TooltipSecondaryText = Color3.fromHex("#FFFFFF"),
    -- Sections
    SectionIcon = Color3.fromHex("#D8B4FE"),
    SectionText = Color3.fromHex("#D8B4FE"),
    SectionTitle = Color3.fromHex("#F0E7FF"),
    SectionExpandIcon = Color3.fromHex("#FFFFFF"),
    SectionExpandIconTransparency = 0.15,
    SectionBox = Color3.fromHex("#C084FC"),
    SectionBoxTransparency = 0.82,
    SectionBoxBorder = Color3.fromHex("#E9D5FF"),
    SectionBoxBorderTransparency = 0.45,
    SectionBoxBackground = Color3.fromHex("#8B5CF6"),
    SectionBoxBackgroundTransparency = 0.85,
    -- Search
    SearchBarBorder = Color3.fromHex("#A855F7"),
    SearchBarBorderTransparency = 0.50,
    SearchBarText = Color3.fromHex("#F0E7FF"),
    SearchBarPlaceholder = Color3.fromHex("#C084FC"),
    SearchBarIcon = Color3.fromHex("#C084FC"),
    -- Notification
    Notification = Color3.fromHex("#2A1055"),
    NotificationTitle = Color3.fromHex("#F0E7FF"),
    NotificationTitleTransparency = 0,
    NotificationContent = Color3.fromHex("#D8B4FE"),
    NotificationContentTransparency = 0.10,
    NotificationDuration = Color3.fromHex("#D8B4FE"),
    NotificationDurationTransparency = 0.10,
    NotificationBorder = Color3.fromHex("#C084FC"),
    NotificationBorderTransparency = 0.40,
    NotificationIcon = Color3.fromHex("#D8B4FE"),
    -- Label
    LabelBackground = Color3.fromHex("#C084FC"),
    LabelBackgroundTransparency = 0.82,
    LabelText = Color3.fromHex("#FFFFFF"),
    -- Scrollbar
    Scrollbar = Color3.fromHex("#C084FC"),
    ScrollbarBackground = Color3.fromHex("#2A1055"),
    ScrollbarTransparency = 0.25,
    -- Divider / Line
    Divider = Color3.fromHex("#A855F7"),
    DividerTransparency = 0.60,
    Line = Color3.fromHex("#A855F7"),
    LineTransparency = 0.60,
})

local windowSuccess, Window = pcall(function()
    return WindUI:CreateWindow({
        Title = "Project Destiny [v3.0]",
        Icon = "rbxassetid://82953555902230",
        Author = "System Online • Access Granted",
        Folder = "Destiny Hub",
        Size = UDim2.fromOffset(620, 520),
        Theme = "Destiny Neon Violet",
        Resizable = true,
        SideBarWidth = 200,
        HideSearchBar = false,
        ScrollBarEnabled = true,
    })
end)


Window:SetIconSize(40) 


getgenv().__WindUIWindow = Window

Window:Section({ Title = "Control Panel" })

local Home = Window:Tab({ Title = "Changelog !!", Icon = "clipboard-list" })
local GeneralTab = Window:Tab({ Title = "General Main", Icon = "gauge" })

Window:Divider() 
Window:Section({ Title = "Combat(PvP)" })

local CombatTab = Window:Tab({ Title = "Aimbot PvP", Icon = "swords" })
local Visuals = Window:Tab({ Title = "Visuals (ESP)", Icon = "crosshair" })
local System = Window:Tab({ Title = "System /Core", Icon = "package" })

Window:Divider() 
Window:Section({ Title = "Configuration" })

local Bounty = Window:Tab({ Title = "Bounty Hunting", Icon = "moon" })
local Config = Window:Tab({ Title = "Settings Config", Icon = "wrench" })

GeneralTab:Select()


local MyConfig = Window.ConfigManager:Config("DestinyConfig")

task.spawn(function()
    task.wait(3)
    pcall(function()
        MyConfig:Load()
    end)
end)








local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local LP = Players.LocalPlayer

-- Executor
local executorName =
    (identifyexecutor and identifyexecutor())
    or (getexecutorname and getexecutorname())
    or "Unknown"


-- Player
local username = LP.Name
local displayName = LP.DisplayName

local dashboardText = [[

<font color="#FFFFFF"><b> SYSTEM INFORMATION</b></font>
<font color="#555555">━━━━━━━━━━━━━━━━━━━━━━━━</font>
<font color="#777777">●</font> Executor   : <font color="#00BFFF">]] .. executorName .. [[</font>

<font color="#FFFFFF"><b> SCRIPT INFORMATION</b></font>

<font color="#888888">Welcome back, <font color="#FFFFFF">]] .. displayName .. [[</font>.
Enjoy your experience with <font color="#B57CFF">Destiny Hub</font>.</font>
]]


Home:Paragraph({
    Title = "● Destiny Hub | Dashboard",
    Desc = dashboardText,

    ImageSize = 50,

    Thumbnail = "rbxassetid://71825656372618",
    ThumbnailSize = 70,
        Buttons = {
            {
                Title = "Copy Discord",
                Icon = "link",

                Callback = function()
                    local ok, err = pcall(function()
                        setclipboard("https://discord.gg/hUMaVECvBz")
                    end)

                    if ok then
                    else
                        warn("[Destiny Hub] Clipboard error: " .. tostring(err))
                    end
                end
            }
        }
    
})


local Group = Config:Group({})
Group:Button({
    Title = "Save",
    Icon  = "save",
    Callback = function()
        if MyConfig and typeof(MyConfig.Save) == "function" then
            MyConfig:Save()
            WindUI:Notify({
                Title = "System Saved",
                Content = "บันทึกการตั้งค่าลงระบบเรียบร้อยแล้ว!",
                Icon = "bell-ring",
                Duration = 3,
            })
        else
            WindUI:Notify({
                Title = "Error",
                Content = "ไม่พบระบบ Config หรือยังไม่ได้โหลด!",
                Icon = "x",
                Duration = 3,
            })
        end
    end,
})

Group:Button({
    Title = "Reset",
    Icon  = "rotate-ccw",
    Callback = function()
        pcall(function()
            if MyConfig and typeof(MyConfig.Delete) == "function" then
                MyConfig:Delete()
            end
        end)
        WindUI:Notify({
            Title = "System Warning",
            Content = "ล้างค่าการตั้งค่าทั้งหมดเรียบร้อยแล้ว!",
            Icon = "bell-ring", 
            Duration = 3,
        })
    end,
})
Config:Divider() 

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

local FOVThemeColor = _G.FOVThemeColor or Color3.fromRGB(255, 255, 255)

-- สร้างวงกลม FOV
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

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        LastMousePosition = Vector2.new(input.Position.X, input.Position.Y)
    end
end)

UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        LastMousePosition = Vector2.new(input.Position.X, input.Position.Y)
    end
end)

---------------------------------------------------------------------------------------

local safeZonesFolder = Workspace:FindFirstChild("_WorldOrigin") 
    and Workspace._WorldOrigin:FindFirstChild("SafeZones")

-- ⚡ Cache สำหรับเช็ค Combat และ SafeZone
local combatCache = {}
local safeZoneCache = {}
local lastCacheClear = tick()
local cacheExpiry = 0.2  -- ⚡ ล้าง cache ทุก 0.2 วินาที

local function clearCacheIfNeeded()
    local now = tick()
    if now - lastCacheClear >= cacheExpiry then
        table.clear(combatCache)
        table.clear(safeZoneCache)
        lastCacheClear = now
    end
end

local function isPlayerInCombat(player, character)
    if not player then return false end
    
    -- ⚡ ใช้ cache ก่อน
    if combatCache[player] ~= nil then
        return combatCache[player]
    end
    
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
            if combatObj:IsA("BoolValue") and combatObj.Value == true then
                combatCache[player] = true
                return true
            elseif combatObj:IsA("NumberValue") and combatObj.Value > 0 then
                combatCache[player] = true
                return true
            elseif combatObj:IsA("StringValue") and combatObj.Value ~= "" then
                combatCache[player] = true
                return true
            elseif combatObj:IsA("ValueBase") then
                combatCache[player] = true
                return true
            end
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
            local radius = 0
            
            local mesh = zonePart:FindFirstChildOfClass("SpecialMesh")
            if mesh then
                radius = mesh.Scale.X / 2
                radius = radius * math.max(zonePart.Size.X, zonePart.Size.Z)
            else
                radius = math.max(zonePart.Size.X, zonePart.Size.Z) / 2
            end
            
            local distance = (charPos - zonePos).Magnitude
            if distance <= radius then
                return true
            end
        end
    end
    
    return false
end

local function isPlayerInSafeZone(player, character)
    if not player then return false end
    
    -- ⚡ ใช้ cache ก่อน
    if safeZoneCache[player] ~= nil then
        return safeZoneCache[player]
    end
    
    if isPlayerInCombat(player, character) then
        safeZoneCache[player] = false
        return false
    end

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

    local enemiesFolder = Workspace:FindFirstChild("Enemies")
    local isEnemyNPC = enemiesFolder and targetCharacter:IsDescendantOf(enemiesFolder)
    
    if isEnemyNPC then
        return false 
    end

    if not targetPlayer then return true end
    if targetPlayer == LocalPlayer then return true end
    
    local pvpDisabled = targetPlayer:GetAttribute("PvpDisabled")
    if pvpDisabled == true then 
        return true 
    end
    
    if isPlayerInSafeZone(targetPlayer, targetCharacter) then
        return true
    end
    
    if LocalPlayer.Team and LocalPlayer.Team.Name == "Marines" then
        if targetPlayer.Team and targetPlayer.Team == LocalPlayer.Team then 
            return true 
        end
    end
    
    return false
end

-- ⚡ ลดการอัพเดท Valid Targets
local cachedValidTargets = {}
local lastTargetUpdate = 0
local targetUpdateInterval = 0.2  -- ⚡ เพิ่มจาก 0.15 เป็น 0.2

local function UpdateValidTargets()
    table.clear(cachedValidTargets)  
    local mode = getgenv().TargetMode or "Both"

    if mode == "Both" or mode == "Players Only" then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                table.insert(cachedValidTargets, player.Character)
            end
        end
    end

    if mode == "Both" or mode == "Enemies Only" then
        local enemiesFolder = Workspace:FindFirstChild("Enemies")
        if enemiesFolder then
            for _, enemyModel in ipairs(enemiesFolder:GetChildren()) do
                if enemyModel:IsA("Model") then
                    table.insert(cachedValidTargets, enemyModel)
                end
            end
        end
    end
end

local function GetAllValidTargets()
    local now = tick()
    
    if now - lastTargetUpdate >= targetUpdateInterval then
        lastTargetUpdate = now
        UpdateValidTargets()
    end
    
    return cachedValidTargets
end

local function GetReferencePosition()
    local viewportSize = Camera.ViewportSize
    local mode = tostring(getgenv().FOVPositionMode):lower()
    
    if mode == "mouse/touch" or mode == "mousetouch" or mode == "mouse" then
        return LastMousePosition
    else
        return Vector2.new(viewportSize.X / 2, viewportSize.Y / 2)
    end
end

local function GetPredictedPosition(targetPart)
    if not targetPart then return Vector3.new(0,0,0) end
    local basePos = targetPart.Position
    if getgenv().PredictionEnabled then
        local velocity = targetPart.AssemblyLinearVelocity or Vector3.new(0,0,0)
        return basePos + (velocity * getgenv().PredictionFactor)
    end
    return basePos
end

-- ⚡ ลดการเรียก GetPredictedPosition ซ้ำ
local lastPredictedPos = Vector3.new(0, 0, 0)

local function GetTargetInFOV(refPos)
    local ClosestTarget = nil
    local fovRadius = getgenv().FOVRadius or 100
    local ShortestDistance = (fovRadius >= 99999) and 99999 or fovRadius

    local myChar = LocalPlayer.Character
    local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")

    for _, char in ipairs(GetAllValidTargets()) do
        local targetPart = char:FindFirstChild(getgenv().LockedPartName) or char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Head")
        local humanoid = char:FindFirstChildOfClass("Humanoid")

        if targetPart and humanoid and humanoid.Health > 0 then
            local targetPlayer = Players:GetPlayerFromCharacter(char)
            if not ShouldIgnoreTarget(char, targetPlayer) then
                local maxDistance = getgenv().MaxDistance or 500
                local worldDistance = myHRP and (targetPart.Position - myHRP.Position).Magnitude or 0
                
                if worldDistance <= maxDistance then
                    local screenPos, onScreen = Camera:WorldToViewportPoint(targetPart.Position)

                    if onScreen then
                        local targetPos2D = Vector2.new(screenPos.X, screenPos.Y)
                        local distance = (targetPos2D - refPos).Magnitude

                        if distance <= ShortestDistance then
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
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

getgenv().SkillRedirectEnabled = getgenv().SkillRedirectEnabled or true
getgenv().CurrentTarget = getgenv().CurrentTarget or nil

local cachedPart = nil
local lastTarget = nil

local function getTargetCFrame()
    local target = getgenv().CurrentTarget
    if not target or not target.Parent then 
        cachedPart = nil
        lastTarget = nil
        return nil 
    end
    
    if target ~= lastTarget then
        lastTarget = target
        cachedPart = target.Parent:FindFirstChild("HumanoidRootPart")
    end
    
    return cachedPart
end

task.spawn(function()
      local Character = LocalPlayer.Character

    if not Character then
        Character = LocalPlayer.CharacterAdded:Wait()
    end

    -- รอ Character ให้พร้อมจริง ๆ
    local Humanoid = Character:WaitForChild("Humanoid")
    local RootPart = Character:WaitForChild("HumanoidRootPart")

    -- รอจน Character เข้า Workspace
    repeat
        task.wait()
    until Character:IsDescendantOf(workspace)

    -- รอจนตัวละครมีชีวิต
    repeat
        task.wait()
    until Humanoid.Parent
        and RootPart.Parent
        and Humanoid.Health > 0

    -- ==========================================
    -- GET MOUSE
    -- ==========================================

    local success, Mouse = pcall(function()
        return LocalPlayer:GetMouse()
    end)

    if not success or not Mouse then
        return
    end

    local oldIndex
    oldIndex = hookmetamethod(game, "__index", newcclosure(function(self, idx)
        if getgenv().SkillRedirectEnabled and self == Mouse then
            local rootPart = getTargetCFrame()
            if rootPart then
                if idx == "Hit" then 
                    return rootPart.CFrame
                elseif idx == "Target" then 
                    return rootPart
                elseif idx == "X" or idx == "Y" then 
                    local screenPoint = Camera:WorldToScreenPoint(rootPart.Position)
                    return screenPoint[idx]
                end
            end
        end
        return oldIndex(self, idx)
    end))

    local oldNamecall
    oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
        local method = getnamecallmethod()
        local enabled = getgenv().SkillRedirectEnabled
        local rootPart = getTargetCFrame()

        if enabled and rootPart and (method == "FireServer" or method == "InvokeServer") then
            local targetCFrame = rootPart.CFrame
            local targetPos = targetCFrame.Position
            local args = { ... }
            
            for i = 1, #args do
                local arg = args[i]
                local argType = typeof(arg)
                if argType == "CFrame" then
                    args[i] = targetCFrame
                elseif argType == "Vector3" then
                    args[i] = targetPos
                end
            end
            
            return oldNamecall(self, unpack(args))
        end

        return oldNamecall(self, ...)
    end))
end)

local currentUiColor = Color3.fromRGB(255, 255, 255)
local displayedUiColor = currentUiColor

RunService.RenderStepped:Connect(function(dt)
    clearCacheIfNeeded()
    displayedUiColor = displayedUiColor:Lerp(
        currentUiColor,
        math.clamp(dt * 20, 0, 1)
    )

    local character = LocalPlayer.Character
    local camera = Workspace.CurrentCamera

    if not character or not camera then
        if FOVUI then FOVUI.Visible = false end
        if Snapline then Snapline.Visible = false end
        getgenv().CurrentTarget = nil
        return
    end

    local myRoot = character:FindFirstChild("HumanoidRootPart")
        or character:FindFirstChild("Torso")

    if not myRoot then
        getgenv().CurrentTarget = nil
        if Snapline then Snapline.Visible = false end
        return
    end

    local refPos = GetReferencePosition()
    local mode = getgenv().SilentAimMode

    -- FOV UI
    if FOVUI then
        if mode == "360°" or mode == "180°" then
            FOVUI.Visible = false
        else
            FOVUI.Visible = getgenv().ShowFOV == true

            if FOVUI.Visible then
                FOVUI.Position = UDim2.new(0, refPos.X, 0, refPos.Y)

                local size = (getgenv().FOVRadius or 100) * 2
                FOVUI.Size = UDim2.new(0, size, 0, size)

                if UIStroke then
                    UIStroke.Color = displayedUiColor
                end
            end
        end
    end

    if not getgenv().SilentAimEnabled
        and not getgenv().CamlockEnabled then

        getgenv().CurrentTarget = nil
        if Snapline then Snapline.Visible = false end
        return
    end

    local bestTarget
    local shortestDistance = math.huge
    local maxDistance = getgenv().MaxDistance or 1000
    local validTargets = GetAllValidTargets()

    -- Target Search
    if mode == "360°" or mode == "180°" then
        local lookVector = camera.CFrame.LookVector
        local cameraPos = camera.CFrame.Position

        for _, char in ipairs(validTargets) do
            if char and char ~= character then
                local rootPart = char:FindFirstChild("HumanoidRootPart")
                    or char:FindFirstChild("Head")

                local humanoid = char:FindFirstChildOfClass("Humanoid")

                if rootPart and humanoid and humanoid.Health > 0 then
                    local targetPlayer = Players:GetPlayerFromCharacter(char)

                    if not ShouldIgnoreTarget(char, targetPlayer) then
                        local valid = true

                        if mode == "180°" then
                            local direction = (rootPart.Position - cameraPos).Unit
                            valid = lookVector:Dot(direction) > 0
                        end

                        if valid then
                            local distance =
                                (myRoot.Position - rootPart.Position).Magnitude

                            if distance <= maxDistance
                                and distance < shortestDistance then

                                shortestDistance = distance
                                bestTarget = rootPart
                            end
                        end
                    end
                end
            end
        end
    else
        bestTarget = GetTargetInFOV(refPos)
    end

    getgenv().CurrentTarget = bestTarget

    -- Camlock
    if getgenv().CamlockEnabled and bestTarget then
        local targetPos = GetPredictedPosition(bestTarget)

        if targetPos then
            camera.CFrame = CFrame.new(
                camera.CFrame.Position,
                targetPos
            )
        end
    end

    -- Snapline
    if bestTarget and getgenv().ShowTracer and Snapline then
        local targetPart = bestTarget

        if typeof(targetPart) == "Instance" and targetPart:IsA("Model") then
            targetPart = targetPart:FindFirstChild("HumanoidRootPart")
                or targetPart.PrimaryPart
                or targetPart:FindFirstChild("Head")
        end

        if targetPart and targetPart:IsA("BasePart") then
            local screenPos = camera:WorldToViewportPoint(targetPart.Position)

            if screenPos.Z > 0 then
                local origin = getgenv().TracerOrigin or "Center"
                local startPos

                if origin == "Center" then
                    startPos = Vector2.new(
                        camera.ViewportSize.X / 2,
                        camera.ViewportSize.Y / 2
                    )
                elseif origin == "Bottom" then
                    startPos = Vector2.new(
                        camera.ViewportSize.X / 2,
                        camera.ViewportSize.Y
                    )
                else
                    local myPos = camera:WorldToViewportPoint(myRoot.Position)
                    startPos = Vector2.new(myPos.X, myPos.Y)
                end

                Snapline.From = startPos
                Snapline.To = Vector2.new(screenPos.X, screenPos.Y)
                Snapline.Color = displayedUiColor
                Snapline.Thickness = getgenv().TracerThickness or 1
                Snapline.Transparency = getgenv().TracerTransparency or 1
                Snapline.Visible = true
            else
                Snapline.Visible = false
            end
        else
            Snapline.Visible = false
        end
    elseif Snapline then
        Snapline.Visible = false
    end
end)


getgenv().HitboxEnabled = true
getgenv().HitboxSize = 8

task.spawn(function()
    while true do
        if getgenv().HitboxEnabled then
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character then
                    local char = p.Character
                    local hum = char:FindFirstChildOfClass("Humanoid")

                    if hum and hum.Health > 0 then
                        local head = char:FindFirstChild("Head")

                        if head then
                            head.Size = Vector3.new(
                                getgenv().HitboxSize,
                                getgenv().HitboxSize,
                                getgenv().HitboxSize
                            )
                            head.Transparency = 1
                            head.CanCollide = false
                            head.CastShadow = false
                        end
                    end
                end
            end
        end

        task.wait(1)
    end
end)


local function initializeSkillSettings()

-- 🛡️ Cleanup
if _G.XodusConnections then
    for _, connection in pairs(_G.XodusConnections) do
        pcall(function() connection:Disconnect() end)
    end
end

_G.XodusConnections = {}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

local Remotes = ReplicatedStorage:WaitForChild("Remotes", 10)

local CommF = Remotes:WaitForChild("CommF_", 10)
local commE = Remotes:WaitForChild("CommE", 10)

-- ⚙️ Settings
local JumpEnabled = false
local JumpMultiplier = 1
local DashEnabled = false
local DashMultiplier = 1
local autoRaceConnection
local autoRaceV4Connection

local function GetCharacter()
    local folder = workspace:FindFirstChild("Characters")
    return (folder and folder:FindFirstChild(LocalPlayer.Name))
        or LocalPlayer.Character
end

local function UpdateJump(humanoid)
    humanoid.UseJumpPower = true
    humanoid.JumpPower = 50 * JumpMultiplier
end

local function UpdateDash(character, humanoid, dt)
    if humanoid.MoveDirection.Magnitude > 0 then
        character:TranslateBy(
            humanoid.MoveDirection * 25 * DashMultiplier * dt
        )
    end
end

-- ==================== Auto Race ====================

local function SetAutoRaceAbility(state)
    _G.AutoRaceAbilityRunning = state

    if autoRaceConnection then
        autoRaceConnection:Disconnect()
        autoRaceConnection = nil
    end

    if not state then return end

    local lastCheck = 0

    autoRaceConnection = RunService.Heartbeat:Connect(function()
        if not _G.AutoRaceAbilityRunning then return end

        local now = tick()
        if now - lastCheck < 0.5 then return end
        lastCheck = now

        pcall(function()
            local character = LocalPlayer.Character
            if not character or not character:FindFirstChild("HumanoidRootPart") then
                return
            end

            if commE then
                commE:FireServer("ActivateAbility")
            end
        end)
    end)

    table.insert(_G.XodusConnections, autoRaceConnection)
end

-- ==================== Auto Race V4 ====================

local function SetAutoRaceV4(state)
    _G.AutoRaceV4Running = state

    if autoRaceV4Connection then
        autoRaceV4Connection:Disconnect()
        autoRaceV4Connection = nil
    end

    if not state then return end

    local lastCheck = 0

    autoRaceV4Connection = RunService.Heartbeat:Connect(function()
        if not _G.AutoRaceV4Running then return end

        local now = tick()
        if now - lastCheck < 0.1 then return end
        lastCheck = now

        pcall(function()
            local character = LocalPlayer.Character
            if not character or not character:FindFirstChild("HumanoidRootPart") then
                return
            end

            local backpack = LocalPlayer:FindFirstChild("Backpack")
            local awakening = backpack and backpack:FindFirstChild("Awakening")
            local remoteFunction = awakening and awakening:FindFirstChild("RemoteFunction")

            if remoteFunction then
                remoteFunction:InvokeServer(true)
            end
        end)
    end)

    table.insert(_G.XodusConnections, autoRaceV4Connection)
end

-- ==================== Main Loop ====================

local renderConnection = RunService.RenderStepped:Connect(function(dt)
    local character = GetCharacter()
    if not character then return end

    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end

    if JumpEnabled then
        UpdateJump(humanoid)
    elseif humanoid.JumpPower ~= 50 then
        humanoid.JumpPower = 50
    end

    if DashEnabled then
        UpdateDash(character, humanoid, dt)
    end
end)

table.insert(_G.XodusConnections, renderConnection)

-- ==================== Buso ====================

local function CheckAndEnableBuso()
    local character = LocalPlayer.Character
    if not character then return end

    local hasBuso = character:FindFirstChild("HasBuso")

    if not hasBuso or (hasBuso:IsA("BoolValue") and not hasBuso.Value) then
        if CommF then
            pcall(function()
                CommF:InvokeServer("Buso")
            end)
        end
    end
end



getgenv().ESPConfig = getgenv().ESPConfig or {
    ShowName = true,
    ShowDistance = true,
    ShowLevel = true,
    ShowBounty = true,
    ShowHealth = true,
    ShowStatus = true,
    ShowAllTeams = false,
    Pirates = true,
    Marines = true
}

getgenv().COLORS = {
    Pirates = Color3.fromRGB(255, 35, 75),
    Marines = Color3.fromRGB(0, 190, 255),
    Neutral = Color3.fromRGB(230, 230, 240),
    White = Color3.fromRGB(255, 255, 255),
    HP = Color3.fromRGB(0, 255, 120),
    HPBG = Color3.fromRGB(8, 8, 14),
    Level = Color3.fromRGB(255, 220, 0),
    Bounty = Color3.fromRGB(255, 60, 210),
    PvPOn = Color3.fromRGB(50, 255, 100),
    PvPOff = Color3.fromRGB(255, 50, 80),
    SafeZoneOn = Color3.fromRGB(0, 235, 255),
    SafeZoneOff = Color3.fromRGB(255, 125, 30),
    Combat = Color3.fromRGB(255, 215, 0),
    Outline = Color3.fromRGB(5, 5, 10),
    Glow = Color3.fromRGB(255, 255, 255)
}

local ESP = getgenv().ESPConfig
local C = getgenv().COLORS

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

local ActiveESPs = {}
local SafeZones = {}
local SafeZoneCacheTime = 0

local function RefreshSafeZones()
    SafeZones = {}

    local origin = Workspace:FindFirstChild("_WorldOrigin")
    local folder = origin and origin:FindFirstChild("SafeZones")

    if not folder then return end

    for _, zone in ipairs(folder:GetChildren()) do
        if zone:IsA("BasePart") then
            local mesh = zone:FindFirstChildOfClass("SpecialMesh")
            local radius = mesh
                and mesh.Scale.X * 0.5
                or math.max(zone.Size.X, zone.Size.Z) * 0.5

            SafeZones[#SafeZones + 1] = {
                Position = zone.Position,
                Radius = radius
            }
        end
    end

    SafeZoneCacheTime = tick()
end

local function IsSafeZone(character)
    if not character then return false end

    local root = character:FindFirstChild("HumanoidRootPart")
    if not root then return false end

    if tick() - SafeZoneCacheTime >= 5 then
        RefreshSafeZones()
    end

    for _, zone in ipairs(SafeZones) do
        local d = root.Position - zone.Position

        if d.X * d.X + d.Y * d.Y + d.Z * d.Z <= zone.Radius ^ 2 then
            return true
        end
    end

    return false
end

local function GetTeam(player)
    if not player or not player.Parent then
        return "Player", C.White, false
    end

    local name = player.Team and player.Team.Name or "Neutral"

    if ESP.ShowAllTeams then
        return name, C[name] or C.Neutral, true
    end

    if name == "Pirates" then
        return name, C.Pirates, ESP.Pirates == true
    end

    if name == "Marines" then
        return name, C.Marines, ESP.Marines == true
    end

    return name, C.Neutral, true
end

local function GetLevel(player)
    local data = player:FindFirstChild("Data")
    local level = data and data:FindFirstChild("Level")

    if level then return level.Value end

    local stats = player:FindFirstChild("leaderstats")
    level = stats and stats:FindFirstChild("Level")

    return level and level.Value or "?"
end

local function GetBounty(player)
    local stats = player:FindFirstChild("leaderstats")
    local bounty = stats and stats:FindFirstChild("Bounty/Honor")

    return bounty and bounty.Value or 0
end

local function FormatNumber(n)
    if type(n) ~= "number" then return tostring(n) end
    if n >= 1e9 then return string.format("%.1fB", n / 1e9) end
    if n >= 1e6 then return string.format("%.1fM", n / 1e6) end
    if n >= 1e3 then return string.format("%.1fK", n / 1e3) end
    return tostring(n)
end

local function GetStatus(player)
    local pvpOff = player:GetAttribute("PvpDisabled") == true
    local pvpText = pvpOff and "OFF" or "ON"
    local pvpColor = pvpOff and C.PvPOff or C.PvPOn

    local char = player.Character
    local safe =
        player:GetAttribute("SafeZone") == true
        or (char and char:GetAttribute("SafeZone") == true)
        or IsSafeZone(char)
        or (char and char:FindFirstChild("TempSafeZone") ~= nil)

    local safeText = safe and "SAFE" or "NORMAL"
    local safeColor = safe and C.SafeZoneOn or C.SafeZoneOff

    local combat = player:GetAttribute("InCombat")

    if char then
        combat = combat or char:GetAttribute("InCombat")
    end

    combat = combat == true or combat == 1 or combat == "1"

    return
        pvpText, pvpColor,
        safeText, safeColor,
        combat and "COMBAT" or "READY",
        combat and C.Combat or C.White
end

local function New(class, parent, name, size, pos)
    local obj = Instance.new(class)
    obj.Name = name
    obj.Size = size
    obj.Position = pos or UDim2.new()
    obj.Parent = parent
    return obj
end

local function SetupLabel(label, size, font)
    label.BackgroundTransparency = 1
    label.TextStrokeTransparency = 0.05
    label.TextStrokeColor3 = C.Outline
    label.RichText = true
    label.TextSize = size
    label.Font = font or Enum.Font.GothamBold
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.TextYAlignment = Enum.TextYAlignment.Center
end

local function BuildUI(parent)
    local name = New("TextLabel", parent, "Name", UDim2.new(1, 0, 0, 18))
    SetupLabel(name, 12)
    name.Visible = ESP.ShowName

    local status = New(
        "TextLabel", parent, "Status",
        UDim2.new(1, 0, 0, 14),
        UDim2.new(0, 0, 0, 19)
    )
    SetupLabel(status, 9)
    status.Visible = ESP.ShowStatus

    local level = New(
        "TextLabel", parent, "Level",
        UDim2.new(1, 0, 0, 14),
        UDim2.new(0, 0, 0, 34)
    )
    SetupLabel(level, 9)
    level.TextColor3 = C.Level
    level.Visible = ESP.ShowLevel

    local bounty = New(
        "TextLabel", parent, "Bounty",
        UDim2.new(1, 0, 0, 14),
        UDim2.new(0, 0, 0, 49)
    )
    SetupLabel(bounty, 9)
    bounty.TextColor3 = C.Bounty
    bounty.Visible = ESP.ShowBounty

    local hpBG = New(
        "Frame", parent, "HPBG",
        UDim2.new(0.65, 0, 0, 4),
        UDim2.new(0.21, 0, 0, 66)
    )

    hpBG.BackgroundColor3 = C.HPBG
    hpBG.BackgroundTransparency = 0.15
    hpBG.BorderSizePixel = 0
    hpBG.Visible = ESP.ShowHealth

    local bgCorner = Instance.new("UICorner")
    bgCorner.CornerRadius = UDim.new(1, 0)
    bgCorner.Parent = hpBG

    local bgStroke = Instance.new("UIStroke")
    bgStroke.Thickness = 1
    bgStroke.Color = C.HP
    bgStroke.Parent = hpBG

    local hp = New("Frame", hpBG, "HP", UDim2.new(1, 0, 1, 0))
    hp.BackgroundColor3 = C.HP
    hp.BorderSizePixel = 0

    local hpCorner = Instance.new("UICorner")
    hpCorner.CornerRadius = UDim.new(1, 0)
    hpCorner.Parent = hp

    local hpStroke = Instance.new("UIStroke")
    hpStroke.Thickness = 1
    hpStroke.Color = C.HP
    hpStroke.Parent = hp

    return name, status, level, bounty, hpBG, hp
end

local function CreateESP(player)
    if player == LocalPlayer or ActiveESPs[player] then return end

    local connections = {}
    local token = 0

    local function Disconnect()
        for _, c in ipairs(connections) do
            if c.Connected then c:Disconnect() end
        end
        table.clear(connections)
    end

    local function Cleanup()
        local data = ActiveESPs[player]

        if data then
            if data.HealthConnection and data.HealthConnection.Connected then
                data.HealthConnection:Disconnect()
            end

            if data.Gui then data.Gui:Destroy() end
            ActiveESPs[player] = nil
        end
    end

    local function Setup(character)
        token = token + 1
        local currentToken = token

        Cleanup()

        if not character or not character.Parent then return end

        local head, humanoid

        for _ = 1, 30 do
            if currentToken ~= token or not character.Parent then
                return
            end

            head = character:FindFirstChild("Head")
            humanoid = character:FindFirstChildOfClass("Humanoid")

            if head and humanoid then break end
            task.wait(0.25)
        end

        if not head or not humanoid or not player.Parent then return end

        local old = head:FindFirstChild("PlayerESP")
        if old then old:Destroy() end

        local _, _, enabled = GetTeam(player)

        local gui = Instance.new("BillboardGui")
        gui.Name = "PlayerESP"
        gui.Adornee = head
        gui.Size = UDim2.fromOffset(210, 86)
        gui.StudsOffset = Vector3.new(0, 3, 0)
        gui.AlwaysOnTop = true
        gui.LightInfluence = 0
        gui.MaxDistance = 10000000
        gui.Enabled = enabled
        gui.Parent = head

        local container = New(
            "Frame",
            gui,
            "Container",
            UDim2.new(1, 0, 1, 0)
        )

        container.BackgroundTransparency = 1

        local name, status, level, bounty, hpBG, hp =
            BuildUI(container)

        local function UpdateHealth(value)
            if not hp.Parent then return end

            local max = math.max(humanoid.MaxHealth, 1)
            local percent = math.clamp((tonumber(value) or 0) / max, 0, 1)

            hp.Size = UDim2.new(percent, 0, 1, 0)

            local color =
                percent > 0.65 and Color3.fromRGB(0, 255, 120)
                or percent > 0.30 and Color3.fromRGB(255, 220, 0)
                or Color3.fromRGB(255, 35, 65)

            hp.BackgroundColor3 = color

            local stroke = hp:FindFirstChildOfClass("UIStroke")
            if stroke then stroke.Color = color end

            stroke = hpBG:FindFirstChildOfClass("UIStroke")
            if stroke then stroke.Color = color end
        end

        local function Update()
            if not gui.Parent then return end

            local teamName, teamColor, teamEnabled = GetTeam(player)
            gui.Enabled = teamEnabled

            name.Visible = ESP.ShowName
            status.Visible = ESP.ShowStatus
            level.Visible = ESP.ShowLevel
            bounty.Visible = ESP.ShowBounty
            hpBG.Visible = ESP.ShowHealth

            local distanceText = ""

            if ESP.ShowDistance and LocalPlayer.Character then
                local myRoot = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                local targetRoot = character:FindFirstChild("HumanoidRootPart")

                if myRoot and targetRoot then
                    local distance = math.floor(
                        (myRoot.Position - targetRoot.Position).Magnitude
                    )

                    distanceText = string.format(
                        ' <font color="rgb(170,170,190)">[%dm]</font>',
                        distance
                    )
                end
            end

            local r = math.floor(teamColor.R * 255)
            local g = math.floor(teamColor.G * 255)
            local b = math.floor(teamColor.B * 255)

            name.Text = string.format(
                '<font color="rgb(%d,%d,%d)">[%s]</font> <font color="rgb(255,255,255)">%s</font>%s',
                r, g, b,
                tostring(teamName),
                tostring(player.DisplayName),
                distanceText
            )

            local pvpText, pvpColor,
                safeText, safeColor,
                combatText, combatColor = GetStatus(player)

            status.Text = string.format(
                '⚡ <font color="rgb(255,255,255)">PvP</font>:<font color="rgb(%d,%d,%d)">%s</font> | <font color="rgb(%d,%d,%d)">%s</font> | <font color="rgb(%d,%d,%d)">%s</font>',
                pvpColor.R * 255,
                pvpColor.G * 255,
                pvpColor.B * 255,
                pvpText,
                safeColor.R * 255,
                safeColor.G * 255,
                safeColor.B * 255,
                safeText,
                combatColor.R * 255,
                combatColor.G * 255,
                combatColor.B * 255,
                combatText
            )

            level.Text = "⚡ LVL: " .. tostring(GetLevel(player))
            bounty.Text = "💎 BOUNTY: " .. FormatNumber(GetBounty(player))
        end

        Update()
        UpdateHealth(humanoid.Health)

        local healthConnection =
            humanoid.HealthChanged:Connect(UpdateHealth)

        ActiveESPs[player] = {
            Gui = gui,
            Update = Update,
            HealthConnection = healthConnection
        }

        local stats = player:FindFirstChild("leaderstats")

        if stats then
            local bountyValue = stats:FindFirstChild("Bounty/Honor")

            if bountyValue then
                table.insert(connections, bountyValue.Changed:Connect(function(value)
                    if ActiveESPs[player] then
                        bounty.Text = "💎 BOUNTY: " .. FormatNumber(value)
                    end
                end))
            end
        end

        table.insert(connections, player:GetPropertyChangedSignal("Team"):Connect(Update))
    end

    local function SafeSetup(character)
        task.spawn(function()
            local success, err = pcall(Setup, character)
            if not success then
                warn("[ESP]", err)
            end
        end)
    end

    if player.Character then
        SafeSetup(player.Character)
    end

    table.insert(
        connections,
        player.CharacterAdded:Connect(SafeSetup)
    )

    table.insert(connections, player.Destroying:Connect(function()
    token = token + 1
    Disconnect()
    Cleanup()
end))

end

RunService.Heartbeat:Connect(function()
    for player, data in pairs(ActiveESPs) do
        if data.Gui and data.Gui.Parent and data.Update then
            data.Update()
        elseif not player.Parent then
            ActiveESPs[player] = nil
        end
    end
end)

for _, player in ipairs(Players:GetPlayers()) do
    CreateESP(player)
end

Players.PlayerAdded:Connect(CreateESP)



local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

local FollowEnabled = false
local FollowDistance = 300
local TpBehindDistance = 5 -- ระยะห่างด้านหลังเป้าหมาย (หน่วยเป็น stud)
local FollowKeybind = Enum.KeyCode.E

local currentTarget = nil
local FollowToggle
local lastTargetUpdate = 0
local updateDelay = 0.5 -- อัปเดตเป้าหมายทุก 0.5 วินาที

-- Safe Zone Cache System
local safeZonesFolder = Workspace:FindFirstChild("_WorldOrigin") 
    and Workspace._WorldOrigin:FindFirstChild("SafeZones")

local followCombatCache = {}
local followSafeZoneCache = {}
local lastCacheClear = tick()
local cacheExpiry = 0.2 -- ล้าง cache ทุก 0.2 วินาที

local function Follow_ClearCacheIfNeeded()
    local now = tick()
    if now - lastCacheClear >= cacheExpiry then
        table.clear(followCombatCache)
        table.clear(followSafeZoneCache)
        lastCacheClear = now
    end
end

local function Follow_IsPlayerInCombat(player, character)
    if not player then return false end
    
    if followCombatCache[player] ~= nil then
        return followCombatCache[player]
    end
    
    local pCombat = player:GetAttribute("InCombat") or player:GetAttribute("Combat") or player:GetAttribute("CombatTag")
    if pCombat == true or pCombat == 1 or pCombat == "1" then
        followCombatCache[player] = true
        return true
    end
    
    local combatTime = player:GetAttribute("CombatTimer") or player:GetAttribute("InCombatTime")
    if type(combatTime) == "number" and combatTime > workspace:GetServerTimeNow() then
        followCombatCache[player] = true
        return true
    end

    if character then
        local cCombat = character:GetAttribute("InCombat") or character:GetAttribute("Combat") or character:GetAttribute("CombatTag")
        if cCombat == true or cCombat == 1 or cCombat == "1" then
            followCombatCache[player] = true
            return true
        end

        local combatObj = character:FindFirstChild("InCombat") 
            or character:FindFirstChild("Combat") 
            or character:FindFirstChild("CombatTag")
            or character:FindFirstChild("PvpTag")

        if combatObj then
            if combatObj:IsA("BoolValue") and combatObj.Value == true then
                followCombatCache[player] = true
                return true
            elseif combatObj:IsA("NumberValue") and combatObj.Value > 0 then
                followCombatCache[player] = true
                return true
            elseif combatObj:IsA("StringValue") and combatObj.Value ~= "" then
                followCombatCache[player] = true
                return true
            elseif combatObj:IsA("ValueBase") then
                followCombatCache[player] = true
                return true
            end
        end
    end

    followCombatCache[player] = false
    return false
end

local function Follow_IsInSafeZoneRadius(character)
    if not character or not character:FindFirstChild("HumanoidRootPart") then return false end
    if not safeZonesFolder then return false end
    
    local charPos = character.HumanoidRootPart.Position
    
    for _, zonePart in ipairs(safeZonesFolder:GetChildren()) do
        if zonePart:IsA("BasePart") then
            local zonePos = zonePart.Position
            local radius = 0
            
            local mesh = zonePart:FindFirstChildOfClass("SpecialMesh")
            if mesh then
                radius = mesh.Scale.X / 2
                radius = radius * math.max(zonePart.Size.X, zonePart.Size.Z)
            else
                radius = math.max(zonePart.Size.X, zonePart.Size.Z) / 2
            end
            
            local distance = (charPos - zonePos).Magnitude
            if distance <= radius then
                return true
            end
        end
    end
    
    return false
end

local function Follow_IsPlayerInSafeZone(player, character)
    if not player then return false end
    
    if followSafeZoneCache[player] ~= nil then
        return followSafeZoneCache[player]
    end
    
    if Follow_IsPlayerInCombat(player, character) then
        followSafeZoneCache[player] = false
        return false
    end

    local inSafeZoneAttr = player:GetAttribute("SafeZone") or (character and character:GetAttribute("SafeZone"))
    local inRadius = character and Follow_IsInSafeZoneRadius(character)
    local hasTempSafeZone = character and character:FindFirstChild("TempSafeZone")
    
    local result = (inSafeZoneAttr == true or inRadius or hasTempSafeZone) == true
    followSafeZoneCache[player] = result
    return result
end

local function Follow_ShouldIgnoreTarget(targetCharacter, targetPlayer)
    local humanoid = targetCharacter:FindFirstChildOfClass("Humanoid")
    if humanoid and humanoid.Health <= 0 then return true end

    local enemiesFolder = Workspace:FindFirstChild("Enemies")
    local isEnemyNPC = enemiesFolder and targetCharacter:IsDescendantOf(enemiesFolder)
    
    if isEnemyNPC then
        return false 
    end

    if not targetPlayer then return true end
    if targetPlayer == LocalPlayer then return true end
    
    local pvpDisabled = targetPlayer:GetAttribute("PvpDisabled")
    if pvpDisabled == true then 
        return true 
    end
    
    if Follow_IsPlayerInSafeZone(targetPlayer, targetCharacter) then
        return true
    end
    
    if LocalPlayer.Team and LocalPlayer.Team.Name == "Marines" then
        if targetPlayer.Team and targetPlayer.Team == LocalPlayer.Team then 
            return true 
        end
    end
    
    return false
end

-- หาเป้าหมายที่ใกล้ที่สุด
local function GetClosestPlayerTarget()
    local character = LocalPlayer.Character
    local rootPart = character and character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return nil end

    local closestTarget = nil
    local shortestDistance = FollowDistance

    for _, otherPlayer in ipairs(Players:GetPlayers()) do
        if otherPlayer ~= LocalPlayer then
            local targetChar = otherPlayer.Character
            
            if targetChar and not Follow_ShouldIgnoreTarget(targetChar, otherPlayer) then
                local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")
                if targetRoot then
                    local distance = (rootPart.Position - targetRoot.Position).Magnitude
                    
                    if distance < shortestDistance then
                        shortestDistance = distance
                        closestTarget = otherPlayer
                    end
                end
            end
        end
    end

    return closestTarget
end

-- ปิดระบบติดตาม (ใช้รูปแบบแจ้งเตือนที่คุณกำหนด)
local function DisableFollowSystem(notificationText)
    if not FollowEnabled then return end
    FollowEnabled = false
    currentTarget = nil

    if WindUI and WindUI.Notify then
        WindUI:Notify({
            Title = "Destiny Hub [HARDCORE]",
            Content = notificationText or "Target destroyed! System off.",
            Icon = "rbxassetid://97596339693490",
            Duration = 1.5,
        })
    end
    
    if FollowToggle and FollowToggle.Set then
        FollowToggle:Set(false)
    end
end

-- ติดตามเป้าหมาย (หากเป้าหมายเลือดหมดหรือไม่มี Humanoid จะคืนค่า false และสั่งปิดระบบทันที)
local function FollowTarget(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then 
        DisableFollowSystem("Target lost! System off.")
        return false 
    end
    
    local character = LocalPlayer.Character
    local rootPart = character and character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return false end
    
    local targetChar = targetPlayer.Character
    local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")
    local targetHumanoid = targetChar:FindFirstChildOfClass("Humanoid")
    local myHumanoid = character:FindFirstChildOfClass("Humanoid")
    
    -- ถ้าเป้าหมายเลือดหมด ตาย หรือไม่มี Humanoid ให้สั่งปิดระบบทันที
    if not targetRoot or not targetHumanoid or targetHumanoid.Health <= 0 then 
        DisableFollowSystem("Target destroyed! System off.")
        return false 
    end
    
    if not myHumanoid or myHumanoid.Health <= 0 then
        DisableFollowSystem("You died!")
        return false
    end
    
    -- คำนวณตำแหน่งด้านหลังเป้าหมาย
    local targetCFrame = targetRoot.CFrame
    local behindCFrame = targetCFrame * CFrame.new(0, 0, TpBehindDistance)
    
    -- ทำการวาป
    rootPart.CFrame = behindCFrame
    
    return true
end

RunService.RenderStepped:Connect(function()
    if not FollowEnabled then
        currentTarget = nil
        return
    end

    Follow_ClearCacheIfNeeded()

    local character = LocalPlayer.Character
    local rootPart = character and character:FindFirstChild("HumanoidRootPart")
    local myHumanoid = character and character:FindFirstChildOfClass("Humanoid")

    if not rootPart or not myHumanoid or myHumanoid.Health <= 0 then 
        DisableFollowSystem("You died!")
        return 
    end

    -- อัปเดตเป้าหมายทุก 0.5 วินาที
    local currentTime = tick()
    if currentTime - lastTargetUpdate >= updateDelay then
        lastTargetUpdate = currentTime
        
        local function IsTargetValid(player)
            if not player or not player.Character then return false end
            return not Follow_ShouldIgnoreTarget(player.Character, player)
        end

        if not currentTarget or not IsTargetValid(currentTarget) then
            currentTarget = GetClosestPlayerTarget()
        end
    end

    -- ติดตามเป้าหมาย
    if currentTarget then
        local success = FollowTarget(currentTarget)
        if not success then
            return
        end
    else
        currentTarget = GetClosestPlayerTarget()
    end
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == FollowKeybind then
            FollowEnabled = not FollowEnabled 
            
            if FollowEnabled then
                currentTarget = GetClosestPlayerTarget()
            else
                currentTarget = nil
            end

            if WindUI and WindUI.Notify then
                WindUI:Notify({
                    Title = "Destiny Hub",
                    Content = FollowEnabled and "HARDCORE ON [LOCKED]" or "HARDCORE OFF",
                    Icon = FollowEnabled and "zap" or "zap-off",
                    Duration = 1.5,
                })
            end
            
            if FollowToggle and FollowToggle.Set then
                FollowToggle:Set(FollowEnabled)
            end
        end
    end
end)







local toggleState = false
local soruCooldown = 1 -- ค่าเริ่มต้น 1 วินาที

local Toggle = System:Toggle({
    Title = "Infinite Soru",
    Desc = "สแปม Soru อัตโนมัติด้วยคูลดาวน์ที่กำหนด",
    Icon = "wind",
    Flag = "SoruToggle",
    Callback = function(state)
        toggleState = state
        
        local player = game.Players.LocalPlayer
        local characters = workspace:FindFirstChild("Characters")
        local soruScript = nil
        
        -- ค้นหา Soru Script ในตัวละคร
        local myChar = player.Character or player.CharacterAdded:Wait()
        if myChar then
            soruScript = myChar:FindFirstChild("Soru")
        end
        
        if not soruScript and characters then
            local charFolder = characters:FindFirstChild(player.Name)
            if charFolder then
                soruScript = charFolder:FindFirstChild("Soru")
            end
        end
        
        if not soruScript then 
            warn("ไม่พบ Soru Script ในตัวละครของคุณ")
            return 
        end
        
        if state then
            task.spawn(function()
                while toggleState do
                    soruScript.Enabled = true
                    soruScript.Disabled = false
                    
                    -- ใช้ค่าคูลดาวน์จากตัวแปร soruCooldown (หารครึ่งสำหรับการเปิด/ปิด)
                    local waitTime = tonumber(soruCooldown) or 1
                    task.wait(waitTime / 2)
                    
                    if not toggleState then break end
                    
                    soruScript.Enabled = false
                    soruScript.Disabled = true
                    task.wait(waitTime / 2)
                end
            end)
        else
            -- เมื่อปิด Toggle ให้คืนค่าปกติ
            soruScript.Enabled = false
            soruScript.Disabled = false
        end
    end
})

local Input = System:Input({
    Title = "Soru Delay (Seconds)",
    Desc = "rate/cooldown (seconds)", 
    Icon = "clock", 
    Type = "Default",
    Placeholder = "1 or 0.5...", 
    Value = "1", 
    Locked = false, 
    Flag = "SoruCooldownInput", 
    Callback = function(text)
        local num = tonumber(text)
        if num and num > 0 then
            soruCooldown = num
        else
            soruCooldown = 1 -- ค่าสำรองถ้ากรอกไม่ถูกต้อง
        end
    end
})

System:Divider() 

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer

--// =========================================================
--// SAFETY MODE SETTINGS
--// =========================================================

local defenseProtocolEnabled = false
local isEmergencyAscending = false

local healthTriggerThreshold = 20
local healthRecoveryThreshold = 100
local ascentVelocity = 220


--// =========================================================
--// SAFETY MODE FUNCTION
--// =========================================================

local function executeDefenseProtocol(humanoid, rootPart)
    if not defenseProtocolEnabled
        or not humanoid
        or humanoid.Health <= 0
        or not rootPart then
        return
    end

    local maxHealth = humanoid.MaxHealth > 0 and humanoid.MaxHealth or 100
    local healthPercent = (humanoid.Health / maxHealth) * 100

    --// HP ต่ำ → เริ่มหนี
    if healthPercent <= healthTriggerThreshold
        and not isEmergencyAscending then

        isEmergencyAscending = true

        humanoid.PlatformStand = true

        rootPart.AssemblyLinearVelocity = Vector3.zero
        rootPart.AssemblyAngularVelocity = Vector3.zero

        local destination = rootPart.CFrame + Vector3.new(0, 550, 0)

        local tween = TweenService:Create(
            rootPart,
            TweenInfo.new(
                0.5,
                Enum.EasingStyle.Quad,
                Enum.EasingDirection.Out
            ),
            {
                CFrame = destination
            }
        )

        tween:Play()
    end

    --// กำลังหนีขึ้นฟ้า
    if isEmergencyAscending then
        humanoid.PlatformStand = true

        rootPart.AssemblyLinearVelocity =
            Vector3.new(0, ascentVelocity, 0)

        rootPart.AssemblyAngularVelocity = Vector3.zero

        --// ป้องกันตกต่ำเกินไป
        local destroyHeight = workspace.FallenPartsDestroyHeight or -500

        if rootPart.Position.Y < destroyHeight + 400 then
            rootPart.CFrame =
                rootPart.CFrame + Vector3.new(0, 100, 0)
        end

        --// HP กลับถึงค่าที่กำหนด
        if healthPercent >= healthRecoveryThreshold then
            isEmergencyAscending = false

            humanoid.PlatformStand = false
            rootPart.AssemblyLinearVelocity = Vector3.zero
        end

        return
    end
end

RunService.RenderStepped:Connect(function()
    if not defenseProtocolEnabled then
        return
    end

    local character = LocalPlayer.Character
    if not character then
        return
    end

    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local rootPart = character:FindFirstChild("HumanoidRootPart")

    if humanoid and rootPart then
        executeDefenseProtocol(humanoid, rootPart)
    end
end)



local SafetyMode = System:Section({
    Title = "Safety Mode",
    Icon = "shield-alert"
})

local ShieldToggle = System:Toggle({
    Title = "Safety Mode",
    Desc = "Automatically escapes and flies up when HP is critical",
    Icon = "shield-alert",
    Value = false,
    Type = "Toggle",
    Locked = false,
    Flag = "defense_protocol_toggle",

    Callback = function(value)
        defenseProtocolEnabled = value

        -- สั่งยกเลิกสถานะทันทีเมื่อกดปิด
        if not value then
            isEmergencyAscending = false

            local character = LocalPlayer.Character
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                local root = character:FindFirstChild("HumanoidRootPart")

                if humanoid then
                    humanoid.PlatformStand = false
                end

                if root then
                    -- หยุดแรงลอยทันที เพื่อให้ตัวละครร่วงลงมาตามปกติ
                    root.AssemblyLinearVelocity = Vector3.zero
                    root.AssemblyAngularVelocity = Vector3.zero
                end
            end
        end
    end
})

local HPRestoreSlider = System:Slider({
    Title = "Resume Health Percent",
    Desc = "HP percentage required to resume normal operations",

    Value = {
        Min = 20,
        Max = 80,
        Default = 30
    },

    Step = 1,
    Locked = false,
    Flag = "defense_restore_percent_slider",

    Callback = function(value)
        healthTriggerThreshold = value
    end
})

System:Divider() 
local SafetyMode = System:Section({
    Title = "Boost FPS",
    Icon = "gauge"
})

local Toggle = System:Toggle({
    Title = "Fast Mode",
    Desc = "Enables high-speed mode to reduce lag and improve smoothness.",
    Icon = "rocket",
    Flag = "FastMode123",
    Callback = function(state)
        local btnPath = game:GetService("Players").LocalPlayer.PlayerGui.Main.SettingsMenu.Content.ScrollingFrame.FastMode
        local btn = state and btnPath.FirstButton or btnPath.SecondButton
        
        if btn then
            if firesignal then
                firesignal(btn.MouseButton1Click)
                firesignal(btn.Activated)
            elseif fireclickdetector then
                fireclickdetector(btn)
            else
                -- Fallback in case firesignal is not supported
                for _, connection in ipairs(getconnections(btn.MouseButton1Click)) do
                    connection:Fire()
                end
            end
        end
    end
})

local Input = System:Input({
    Title = "FPS Unlocker",
    Desc = "Enter your desired max FPS", -- optional
    Type = "Default", -- "Default" or "Textarea". optional
    Placeholder = "Enter max FPS...", -- placeholder text. optional
    Value = "9999", -- initial value. optional
    Locked = false, -- disable input. optional
    Flag = "FPSUnlocker", -- for config saving. optional
    Callback = function(text)
         local num = tonumber(text)
        if num then
            if num < 1 then
                num = 1
            elseif num > 9999 then
                num = 9999
            end
            
            -- สั่งตั้งค่า FPS ให้กับเกมผ่าน Executor
            pcall(function()
                if setfpscap then
                    setfpscap(num)
                end
            end)
        end
    end
})


local Configjson = Config:Section({ 
    Title = "Config.json", 
    Icon = "file" -- หรือใช้ "folder", "save" ก็ได้ครับ
})

local importedConfigData = ""
local configFilePath = "WindUI/Destiny Hub/config/DestinyConfig.json"

Config:Input({
    Title = "Configuration Code",
    Desc = "วางโค้ด Config ที่นี่เพื่อ Import หรือคัดลอกออก",
    Value = "",
    Placeholder = "วางโค้ด JSON ที่นี่...",
    Callback = function(text)
        importedConfigData = text
    end,
})

Config:Button({
    Title = "Import Configuration",
    Desc = "บันทึกโค้ดตั้งค่าจากช่องด้านบนลงไฟล์",
    Callback = function()
        pcall(function()
            if importedConfigData and importedConfigData ~= "" then
                if makefolder then
                    if not isfolder("WindUI") then makefolder("WindUI") end
                    if not isfolder("WindUI/Destiny Hub") then makefolder("WindUI/Destiny Hub") end
                    if not isfolder("WindUI/Destiny Hub/config") then makefolder("WindUI/Destiny Hub/config") end
                end
                
                -- เขียนไฟล์ Config หากฟังก์ชัน writefolder รองรับ
                if writefile then
                    writefile(configFilePath, importedConfigData)
                    WindUI:Notify({
                        Title = "Import Success",
                        Content = "นำเข้าและบันทึก Config เรียบร้อยแล้ว!",
                        Duration = 3,
                    })
                end
            else
                WindUI:Notify({
                    Title = "Import Failed",
                    Content = "กรุณากรอกหรือวางโค้ด Config ก่อนกด Import",
                    Duration = 3,
                })
            end
        end)
    end,
})

Config:Button({
    Title = "Export Configuration",
    Desc = "คัดลอกโค้ดการตั้งค่าเพื่อแชร์ให้คนอื่น",
    Callback = function()
        pcall(function()
            if isfile and isfile(configFilePath) then
                local configData = readfile(configFilePath)
                
                if setclipboard then
                    setclipboard(configData)
                    WindUI:Notify({
                        Title = "Export Success",
                        Content = "คัดลอกโค้ด Config ไปยังคลิปบอร์ดแล้ว!",
                        Duration = 3,
                    })
                end
            else
                WindUI:Notify({
                    Title = "Export Failed",
                    Content = "ไม่พบไฟล์ตั้งค่า กรุณากด Save ก่อน",
                    Duration = 3,
                })
            end
        end)
    end,
})
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")

local FPSTag = Window:Tag({
    Title = "FPS: --",
    Icon = "gauge",
    Color = Color3.fromHex("#C4B5FD"), -- ม่วงอ่อนสดใส
})

local frameCount, lastUpdate = 0, os.clock()
RunService.RenderStepped:Connect(function()
    frameCount = frameCount + 1
    local now = os.clock()
    local elapsed = now - lastUpdate
    
    if elapsed >= 1.0 then
        local fps = math.floor(frameCount / elapsed)
        FPSTag:SetTitle(string.format("FPS: %d", fps))
        
        -- เปลี่ยนสีตามระดับ FPS เพิ่มเติมให้สวยขึ้น
        if fps >= 90 then
            FPSTag:SetColor(Color3.fromHex("#C4B5FD")) -- ม่วงสด (ดีเยี่ยม)
        elseif fps >= 60 then
            FPSTag:SetColor(Color3.fromHex("#C4B5FD")) -- ม่วงอ่อน (ดี)
        else
            FPSTag:SetColor(Color3.fromHex("#C4B5FD")) -- ม่วงขาว (ปกติ)
        end
        
        frameCount = 0
        lastUpdate = now
    end
end)

local PingTag = Window:Tag({
    Title = "Ping: --ms",
    Icon = "wifi",
    Color = Color3.fromHex("#A855F7"), -- ม่วงหลัก
})

task.spawn(function()
    local serverStats = Stats:FindFirstChild("Network") 
        and Stats.Network:FindFirstChild("ServerStatsItem")
    local dataPing = serverStats and serverStats:FindFirstChild("Data Ping")
    
    while true do
        local success, ping = pcall(function()
            if dataPing then
                return math.floor(dataPing:GetValue())
            end
            return 0
        end)
        
        if success and ping then
            PingTag:SetTitle(string.format("Ping: %dms", ping))
            
            -- เปลี่ยนสีตามค่า Ping เพิ่มความมีชีวิต
            if ping <= 50 then
                PingTag:SetColor(Color3.fromHex("#C4B5FD")) -- ม่วงสด (เร็ว)
            elseif ping <= 100 then
                PingTag:SetColor(Color3.fromHex("#C4B5FD")) -- ม่วงปกติ
            else
                PingTag:SetColor(Color3.fromHex("#C4B5FD")) -- ม่วงเข้ม (ช้า)
            end
        end
        
        task.wait(2)
    end
end)

CombatTab:Toggle({
    Title = "CamLock (PC/Mobile)",
    Desc  = "Lock onto targets instantly.",
    Flag  = "camlock_toggle",
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
    Icon = "crosshair", 
    Desc  = "Hit shots without precise crosshairs.",
    Flag  = "silent_aim_toggle",
    Value = getgenv().SilentAimEnabled,
    Callback = function(Value)
        getgenv().SilentAimEnabled = Value
        if not Value and not getgenv().CamlockEnabled then
            getgenv().CurrentTarget = nil
            if Snapline then 
                Snapline.Visible = false 
            end
        end
    end,
})

CombatTab:Divider() 
local FOVSection = CombatTab:Section({ 
    Title = "Targeting & FOV", 
    Icon = "crosshair" 
})

CombatTab:Dropdown({
    Title = "Silent Aim Mode",
    Desc  = "Switch targeting parameters.",
    Flag  = "silent_aim_mode_dropdown",
    Values = { "FOV", "180°", "360°" },
    Value  = getgenv().SilentAimMode,
    Callback = function(selected)
        
        local mode = type(selected) == "table" and selected[1] or selected
        
        if getgenv().SilentAimMode == "FOV" and mode ~= "FOV" then
            getgenv().SavedFOVRadius = getgenv().FOVRadius
        end

        getgenv().SilentAimMode = mode
        
        if mode == "360°" then
            getgenv().FOVRadius = 9999 
        elseif mode == "180°" then
            getgenv().FOVRadius = 180 
        elseif mode == "FOV" then
            getgenv().FOVRadius = getgenv().SavedFOVRadius
        end
    end,
})

CombatTab:Slider({
    Title = "FOV Size",
    Desc  = "Scale FOV radius.",
    Flag  = "fov_size_slider",
    Increment = 1,
    Value = {
        Min     = 50,
        Max     = 1000,
        Default = getgenv().FOVRadius
    },
    Callback = function(Value)
        
        getgenv().FOVRadius = Value
        
        if getgenv().SilentAimMode == "FOV" then
            getgenv().SavedFOVRadius = Value
        end
    end,
})


CombatTab:Dropdown({
    Title = "FOV Position",
    Desc  = "Choose FOV center source.",
    Flag  = "fov_position_dropdown",
    Values = { "Mouse/Touch", "Middle" },
    Value  = getgenv().FOVPositionMode,
    Callback = function(selected)
        local mode = type(selected) == "table" and selected[1] or selected
        getgenv().FOVPositionMode = mode
    end,
})

CombatTab:Toggle({
    Title = "Show FOV Circle",
    Desc  = "Display FOV circle boundary.",
    Flag  = "show_fov_toggle",
    Value = getgenv().ShowFOV,
    Callback = function(Value)
        getgenv().ShowFOV = Value
        if FOVUI then 
            FOVUI.Visible = Value 
        end
    end,
})

CombatTab:Divider() 
local VisualsSection = CombatTab:Section({ 
    Title = "Visuals & Filters", 
    Icon = "eye" -- หรือใช้ "palette", "sparkles" ก็ได้ครับ
})

CombatTab:Toggle({
    Title = "Show Red Snapline",
    Desc  = "Render line to active target.",
    Flag  = "show_snapline_toggle",
    Value = getgenv().ShowTracer,
    Callback = function(Value)
        getgenv().ShowTracer = Value
        if not Value and Snapline then
            Snapline.Visible = false
        end
    end,
})

CombatTab:Slider({
    Title = "Max Distance",
    Desc  = "Set max distance threshold.",
    Flag  = "max_distance_slider",
    Increment = 1,
    Value = {
        Min     = 50,
        Max     = 1000,
        Default = getgenv().MaxDistance
    },
    Callback = function(Value)
        getgenv().MaxDistance = Value
    end,
})

getgenv().TargetMode = "Players Only" 

CombatTab:Dropdown({
    Title = "Target Type",
    Desc  = "Choose targets.",
    Flag  = "target_type_dropdown",
    Values = { "Players Only", "Enemies Only" },
    Value  = "Players Only",
    Callback = function(selected)
        local mode = type(selected) == "table" and selected[1] or selected
        getgenv().TargetMode = mode
    end,
})


local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

_G.XodusConnections = _G.XodusConnections or {}

if _G.XodusFastAttackCleanup then
    pcall(_G.XodusFastAttackCleanup)
end

local modules = ReplicatedStorage:WaitForChild("Modules", 10)
local net = modules and modules:WaitForChild("Net", 10)
local registerHit = net and net:WaitForChild("RE/RegisterHit", 10)
local registerAttack = net and net:WaitForChild("RE/RegisterAttack", 10)

_G.AttackSpeed = _G.AttackSpeed or 0.1
_G.FastAttackRunning = false

local connection
local lastAttack = 0

local function Attack(target)
    if not target then return end

    registerHit:FireServer(target, {}, "211ee8ef")
    registerAttack:FireServer(0.4000000059604645, 1)
    lastAttack = tick()
end

local function SetFastAttack(state)
    _G.FastAttackRunning = state

    if connection then
        connection:Disconnect()
        connection = nil
    end

    if not state then return end

    connection = RunService.Heartbeat:Connect(function()
        if not _G.FastAttackRunning then return end
        if tick() - lastAttack < _G.AttackSpeed then return end

        pcall(function()
            local char = player.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            if not root then return end

            local enemies = workspace:FindFirstChild("Enemies")

            if enemies then
                for _, enemy in ipairs(enemies:GetChildren()) do
                    local rootPart = enemy:FindFirstChild("HumanoidRootPart")
                        or enemy:FindFirstChild("Head")
                    local hum = enemy:FindFirstChildOfClass("Humanoid")

                    if rootPart and hum and hum.Health > 0
                        and (root.Position - rootPart.Position).Magnitude <= 60 then
                        Attack(rootPart)
                        return
                    end
                end
            end

            for _, target in ipairs(Players:GetPlayers()) do
                if target ~= player then
                    local targetChar = target.Character
                    local rootPart = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
                    local hum = targetChar and targetChar:FindFirstChildOfClass("Humanoid")

                    if rootPart and hum and hum.Health > 0
                        and (root.Position - rootPart.Position).Magnitude <= 60 then
                        Attack(rootPart)
                        return
                    end
                end
            end
        end)
    end)

    table.insert(_G.XodusConnections, connection)
end

_G.XodusFastAttackCleanup = function()
    _G.FastAttackRunning = false

    if connection then
        pcall(function()
            connection:Disconnect()
        end)
        connection = nil
    end
end

local FastAttackToggle = GeneralTab:Toggle({
    Title = "Fast Attack",
    Desc = "Increases your attack speed automatically",
    Flag = "FastAttack",
    Value = false,
    Callback = function(state)
        SetFastAttack(state)
    end,
})

local Slider = GeneralTab:Slider({
    Title = "Attack Speed",
    Desc = "Speed (not long = fastest)",
    Value = {
        Min = 0,
        Max = 0.7,
        Default = 0.1
    },
    Step = 0.01,
    Locked = false,
    Flag = "attack_speed_slider",
    Callback = function(value)
        _G.AttackSpeed = value
    end
})


GeneralTab:Toggle({
    Title = "Auto Buso",
    Desc = "Automatically enables Buso Haki",
    Flag = "AutoHakiCheck",
    Value = false,
    Callback = function(state)
        _G.AutoBusoRunning = state
        
        if state then
            task.spawn(function()
                while _G.AutoBusoRunning do
                    pcall(function() 
                        if typeof(CheckAndEnableBuso) == "function" then
                            CheckAndEnableBuso() 
                        end
                    end)
                    task.wait(1) 
                end
            end)
        end
    end,
})



local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CommE = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommE")

local autoKenEnabled = false

GeneralTab:Toggle({
    Title = "Auto Ken",
    Desc = "Automatically toggles the Ken feature when enabled or disabled",
    Flag = "AutoKenCheck",
    Value = false,

    Callback = function(state)
        autoKenEnabled = state

        pcall(function()
            CommE:FireServer("Ken", tostring(state))
        end)
    end,
})

task.spawn(function()
    while task.wait(1.5) do
        if autoKenEnabled then
            pcall(function()
                CommE:FireServer("Ken", "true")
            end)
        end
    end
end)

local CharacterAbilities = GeneralTab:Section({ 
    Title = "Character & Abilities", 
    Icon = "user" -- หรือใช้ "zap", "activity" ก็ได้ครับ
})
GeneralTab:Divider() 

GeneralTab:Toggle({
    Title = "Auto Race V4",
    Desc = "Auto Race V4 activate & upgrade.",
    Flag = "AutoRaceV4_Toggle",
    Value = false,
    Callback = function(state)
        SetAutoRaceV4(state)
    end,
})

GeneralTab:Toggle({
    Title = "Auto Race V3",
    Desc = "Instant Race V3 activation.",
    Flag = "AutoRaceAbility",
    Value = false,
    Callback = function(state)
        SetAutoRaceAbility(state)
    end,
})
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

local IceWalkConfig = {
    GiantFloor = nil,
    FloorConnection = nil,
    FloorRunning = false,
    LastPosition = nil,
    LastSeaLevel = nil,
    LastState = nil
}

local IceWalkUtils = {}

function IceWalkUtils.Cleanup()
    if IceWalkConfig.FloorConnection then
        IceWalkConfig.FloorConnection:Disconnect()
        IceWalkConfig.FloorConnection = nil
    end

    if IceWalkConfig.GiantFloor then
        IceWalkConfig.GiantFloor:Destroy()
        IceWalkConfig.GiantFloor = nil
    end

    IceWalkConfig.LastPosition = nil
    IceWalkConfig.LastSeaLevel = nil
    IceWalkConfig.LastState = nil

    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")

    if hum then
        hum:SetStateEnabled(Enum.HumanoidStateType.Swimming, true)
        hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
    end
end

function IceWalkUtils.GetOrCreateFloor()
    if not IceWalkConfig.GiantFloor
        or not IceWalkConfig.GiantFloor.Parent then

        local part = Instance.new("Part")
        part.Name = "IceWalkFloor"
        part.Size = Vector3.new(1000, 1, 1000)
        part.Anchored = true
        part.CanCollide = true
        part.CanTouch = false
        part.CanQuery = false
        part.CastShadow = false
        part.Transparency = 1
        part.Material = Enum.Material.SmoothPlastic
        part.Parent = Workspace

        IceWalkConfig.GiantFloor = part
    end

    return IceWalkConfig.GiantFloor
end

GeneralTab:Toggle({
    Title = "Walking on Water",
    Desc = "Does not sink; Soru and warping work normally.",
    Flag = "IceWalk",
    Value = false,

    Callback = function(state)
        IceWalkConfig.FloorRunning = state

        if not state then
            IceWalkUtils.Cleanup()
            return
        end

        local floorPart = IceWalkUtils.GetOrCreateFloor()

        local raycastParams = RaycastParams.new()
        raycastParams.FilterType = Enum.RaycastFilterType.Exclude

        -- อัปเดตประมาณ 20 ครั้ง/วินาที แทนทุกเฟรม
        local UPDATE_RATE = 0.05
        local elapsed = 0

        IceWalkConfig.FloorConnection =
            RunService.Heartbeat:Connect(function(dt)

                if not IceWalkConfig.FloorRunning then
                    return
                end

                elapsed = elapsed + dt

                if elapsed < UPDATE_RATE then
                    return
                end

                elapsed = 0

                local character = LocalPlayer.Character

                if not character then
                    return
                end

                local rootPart =
                    character:FindFirstChild("HumanoidRootPart")

                local hum =
                    character:FindFirstChildOfClass("Humanoid")

                if not rootPart or not hum then
                    return
                end

                if floorPart.Parent ~= Workspace then
                    floorPart.Parent = Workspace
                end

                raycastParams.FilterDescendantsInstances = { character }

                local seaLevel = -2.8

                -- Raycast เฉพาะตามช่วงเวลา ไม่ใช่ทุก Frame
                local rayResult = Workspace:Raycast(
                    rootPart.Position + Vector3.new(0, 5, 0),
                    Vector3.new(0, -50, 0),
                    raycastParams
                )

                if rayResult
                    and rayResult.Material == Enum.Material.Water then

                    seaLevel = rayResult.Position.Y
                end

                -- ถ้าระดับน้ำไม่เปลี่ยน ไม่ต้องคำนวณซ้ำ
                if IceWalkConfig.LastSeaLevel ~= seaLevel then
                    IceWalkConfig.LastSeaLevel = seaLevel
                end

                local currentPos = rootPart.Position

                -- ตรวจจับการเคลื่อนที่ / วาร์ป
                local moved = false

                if IceWalkConfig.LastPosition then
                    local distance =
                        (currentPos - IceWalkConfig.LastPosition).Magnitude

                    moved = distance > 1
                else
                    moved = true
                end

                IceWalkConfig.LastPosition = currentPos

                if moved or not floorPart.Parent then
                    local targetPos = Vector3.new(
                        currentPos.X,
                        seaLevel - 2,
                        currentPos.Z
                    )

                    -- ตรงทันที ลดภาระจาก Lerp ทุกเฟรม
                    floorPart.Position = targetPos
                end

                -- ตั้งค่า State แค่ครั้งเดียว
                if IceWalkConfig.LastState ~= false then
                    hum:SetStateEnabled(
                        Enum.HumanoidStateType.Swimming,
                        false
                    )

                    hum:SetStateEnabled(
                        Enum.HumanoidStateType.FallingDown,
                        false
                    )

                    IceWalkConfig.LastState = false
                end

                -- ป้องกันตกน้ำ
                if rootPart.Position.Y < seaLevel + 3.5 then

                    if hum:GetState()
                        == Enum.HumanoidStateType.Swimming then

                        hum:ChangeState(
                            Enum.HumanoidStateType.Running
                        )
                    end

                    if rootPart.Position.Y < seaLevel then
                        rootPart.CFrame = CFrame.new(
                            currentPos.X,
                            seaLevel + 4,
                            currentPos.Z
                        )
                    end
                end
            end)
    end,
})



GeneralTab:Divider() 

GeneralTab:Toggle({
    Title = "Jump Boost",
    Desc = "Enhances your jump height significantly.",
    Flag = "JumpToggle",
    Value = false,
    Callback = function(state)
        JumpEnabled = state
    end,
})


GeneralTab:Slider({
    Title = "Jump Multiplier",
    Desc = "Adjust the multiplier for your jump power.",
    Flag = "JumpSlider",
    Increment = 0.1, 
    Value = {
        Min = 1,
        Max = 10,
        Default = 1
    },
    Callback = function(value)
        JumpMultiplier = value
    end,
})

-- Toggle: เปิด/ปิด พุ่ง
GeneralTab:Toggle({
    Title = "Speed Dash",
    Desc = "Enables fast forward dashing ability.",
    Flag = "DashToggle",
    Value = false,
    Callback = function(state)
        DashEnabled = state
    end,
})

-- Slider: ปรับตัวคูณความเร็วพุ่ง (1x ถึง 10x)
GeneralTab:Slider({
    Title = "Dash Multiplier",
    Desc = "Adjust the speed multiplier of your dash.",
    Flag = "DashSlider",
    Increment = 0.1, -- ละเอียดขึ้นแบบทศนิยม หรือจะเปลี่ยนเป็น 1 ถ้าเอาจำนวนเต็ม
    Value = {
        Min = 1,
        Max = 10,
        Default = 1
    },
    Callback = function(value)
        DashMultiplier = value
    end,
})

Visuals:Toggle({
    Title = "Show Name",
    Desc = "Displays player usernames.",
    Flag = "ESP_Name",
    Value = true,
    Callback = function(state)
        ESPConfig.ShowName = state
    end,
})

Visuals:Toggle({
    Title = "Show Distance",
    Desc = "Shows distance to players.",
    Flag = "ESP_Distance",
    Value = true,
    Callback = function(state)
        ESPConfig.ShowDistance = state
    end,
})

Visuals:Toggle({
    Title = "Show Level",
    Desc = "Displays player levels.",
    Flag = "ESP_Level",
    Value = true,
    Callback = function(state)
        ESPConfig.ShowLevel = state
    end,
})

Visuals:Toggle({
    Title = "Show Bounty",
    Desc = "Shows current bounty or honor.",
    Flag = "ESP_Bounty",
    Value = true,
    Callback = function(state)
        ESPConfig.ShowBounty = state
    end,
})

Visuals:Toggle({
    Title = "Show Health",
    Desc = "Renders health bars and percentages.",
    Flag = "ESP_HP",
    Value = true,
    Callback = function(state)
        ESPConfig.ShowHealth = state
    end,
})

Visuals:Toggle({
    Title = "Show Player Status",
    Desc = "Displays PvP, SafeZone, and combat status.",
    Flag = "ESP_Status",
    Value = true,
    Callback = function(state)
        ESPConfig.ShowStatus = state
    end,
})


local UtilitySection = GeneralTab:Section({ 
    Title = "Target Dominance", 
    Icon = "crown" 
})
GeneralTab:Divider() 

FollowToggle = GeneralTab:Toggle({
    Title = "Instant Warp",
    Desc = "Tracks and follows your target.",
    Flag = "FollowToggle",
    Value = false,
    Callback = function(state)
        FollowEnabled = state
        if not state then currentTarget = nil end
    end,
})

local Keybind = GeneralTab:Keybind({
    Title = "Teleport Key",
    Desc = "Keybind for pursuit features.",
    Flag = "UIKeybind",
    Value = "E",
    Callback = function(key)
        if typeof(key) == "EnumItem" then
            FollowKeybind = key
        elseif type(key) == "string" then
            pcall(function()
                FollowKeybind = Enum.KeyCode[key]
            end)
        end
    end,
})

local Slider = GeneralTab:Slider({
    Title = "Pursuit Radius",
    Desc = "Maximum distance from target.",
    Flag = "VolumeSlider",
    Increment = 1,
    Value = {
        Min = 20,
        Max = 250,
        Default = 200
    },
    Callback = function(value)
        FollowDistance = value
    end,
})

Config:Divider() 

local HideShowUI = Config:Section({ 
    Title = "Settings", 
    Icon = "monitor" 
})

local UIKeybind = Config:Keybind({
    Title = "Keybind Ui",
    Desc = "Keybind to show or hide the user interface",
    Flag = "UIKeybindUIKeybind", 
    Value = "",
    Callback = function(key)
        Window:Toggle()
    end
})




local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

local function setSafeNoclip(state)
    local character = localPlayer.Character
    if character then
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = not state
            end
        end
    end
end

Config:Toggle({
    Title = "Noclip",
    Desc = "Walk through walls.",
    Flag = "NoclipToggle",
    Value = false,
    Callback = function(state)
        if state then
            _G.NoclipConnection = RunService.Stepped:Connect(function()
                setSafeNoclip(true)
            end)
        else
            if _G.NoclipConnection then
                _G.NoclipConnection:Disconnect()
                _G.NoclipConnection = nil
            end
            setSafeNoclip(false)
        end
    end,
})



local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera

if CoreGui:FindFirstChild("CustomMobileTogglesStyle") then
    CoreGui.CustomMobileTogglesStyle:Destroy()
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomMobileTogglesStyle"
screenGui.Parent = CoreGui
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local function createDraggableButton(text, accentColor, defaultPosition, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 120, 0, 38)
    button.Position = defaultPosition
    button.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
    button.BackgroundTransparency = 0.15
    button.BorderSizePixel = 0
    button.AutoButtonColor = false
    button.Text = ""
    button.Active = true
    button.Parent = screenGui

    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, 10)
    uiCorner.Parent = button

    local shadow = Instance.new("UIStroke")
    shadow.Name = "Shadow"
    shadow.Parent = button
    shadow.Color = Color3.fromRGB(0, 0, 0)
    shadow.Transparency = 0.5
    shadow.Thickness = 2.5
    shadow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    local uiStroke = Instance.new("UIStroke")
    uiStroke.Name = "Border"
    uiStroke.Parent = button
    uiStroke.Color = Color3.fromRGB(45, 45, 55)
    uiStroke.Thickness = 1.5
    uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, -20, 1, 0)
    textLabel.Position = UDim2.new(0, 10, 0, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = text
    textLabel.TextColor3 = Color3.fromRGB(200, 200, 210)
    textLabel.TextSize = 12
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.Parent = button

    local indicator = Instance.new("Frame")
    indicator.Size = UDim2.new(0, 6, 0, 6)
    indicator.Position = UDim2.new(1, -14, 0.5, -3)
    indicator.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
    indicator.BorderSizePixel = 0
    indicator.Parent = button

    local indCorner = Instance.new("UICorner")
    indCorner.CornerRadius = UDim.new(1, 0)
    indCorner.Parent = indicator

    -- ระบบลากปุ่มแบบรวบรัดตัวแปร
    local dragging, dragInput, dragStart, startPos, isDragging = false, nil, nil, nil, false

    button.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging, dragStart, startPos, isDragging = true, input.Position, button.AbsolutePosition, false
            
            TweenService:Create(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 114, 0, 35)
            }):Play()
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                    TweenService:Create(button, TweenInfo.new(0.15, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                        Size = UDim2.new(0, 120, 0, 38)
                    }):Play()
                end
            end)
        end
    end)

    button.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
                isDragging = true
            end
            
            local screenSize = Camera.ViewportSize
            local newX = math.clamp(startPos.X + delta.X, 0, screenSize.X - button.AbsoluteSize.X)
            local newY = math.clamp(startPos.Y + delta.Y, 0, screenSize.Y - button.AbsoluteSize.Y)
            
            button.Position = UDim2.new(0, newX, 0, newY)
        end
    end)

    local activeState = false
    button.MouseButton1Click:Connect(function()
        if isDragging then return end
        activeState = not activeState
        
        local tInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
        if activeState then
            TweenService:Create(button, tInfo, {BackgroundColor3 = Color3.fromRGB(28, 28, 36)}):Play()
            TweenService:Create(uiStroke, tInfo, {Color = accentColor}):Play()
            TweenService:Create(textLabel, tInfo, {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
            TweenService:Create(indicator, tInfo, {BackgroundColor3 = accentColor}):Play()
        else
            TweenService:Create(button, tInfo, {BackgroundColor3 = Color3.fromRGB(18, 18, 22)}):Play()
            TweenService:Create(uiStroke, tInfo, {Color = Color3.fromRGB(45, 45, 55)}):Play()
            TweenService:Create(textLabel, tInfo, {TextColor3 = Color3.fromRGB(200, 200, 210)}):Play()
            TweenService:Create(indicator, tInfo, {BackgroundColor3 = Color3.fromRGB(70, 70, 80)}):Play()
        end

        if callback then callback(activeState) end
    end)

    return button
end

local camlockBtn = createDraggableButton("Camera Lock", Color3.fromRGB(0, 229, 255), UDim2.new(0, 20, 0, 20), function(Value)
    getgenv().CamlockEnabled = Value
    if not Value then getgenv().CurrentTarget = nil end
end)

local teleportBtn = createDraggableButton("Teleport Player", Color3.fromRGB(0, 229, 255), UDim2.new(0, 20, 0, 68), function(state)
    FollowEnabled = not FollowEnabled 
    
    if FollowEnabled then
        currentTarget = GetClosestPlayerTarget()
    else
        currentTarget = nil
        getgenv().CurrentTarget = nil
    end

    if WindUI and WindUI.Notify then
        WindUI:Notify({
            Title = "Destiny Hub",
            Content = FollowEnabled and "HARDCORE ON [LOCKED]" or "HARDCORE OFF",
            Icon = FollowEnabled and "zap" or "zap-off",
            Duration = 1.5,
        })
    end
    
    if FollowToggle and FollowToggle.Set then
        FollowToggle:Set(FollowEnabled)
    end
end)

if typeof(Config) == "table" then
    Config:Toggle({
        Title = "Camera Lock ",
        Desc = "ซ่อน/แสดง ปุ่ม Camera Lock",
        Flag = "ToggleCamlockUI",
        Value = true,
        Callback = function(Value)
            if camlockBtn then camlockBtn.Visible = Value end
        end,
    })

    Config:Toggle({
        Title = "Teleport Player ",
        Desc = "ซ่อน/แสดง ปุ่ม Teleport Player",
        Flag = "ToggleTeleportUI",
        Value = true,
        Callback = function(Value)
            if teleportBtn then teleportBtn.Visible = Value end
        end,
    })
end
end

initializeSkillSettings()



local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local localPlayer = Players.LocalPlayer

local autoBountyEnabled = false
local bountyConnection = nil

local selectedMeleeSkills = {"None"}
local selectedSwordSkills = {"None"}
local selectedFruitSkills = {"None"}
local selectedGunSkills = {"None"}

local flySpeed = 220

local healthTriggerThreshold = 30
local healthRecoveryThreshold = 100
local defenseProtocolEnabled = false
local isEmergencyAscending = false
local cachedNearestTarget = nil
local lastTargetSearchTime = 0
local targetSearchInterval = 0.5
local selectedFaction = "Pirates"
local teamCheckInProgress = false
local isTeamSwitchVerified = false
local teamCheckLoopRunning = false
local ascentVelocity = 220

-- ✅ Cache สำหรับผู้เล่น (เลี่ยงการ GetPlayers ทุกครั้ง)
local playerCache = {}
local lastPlayerCacheTime = 0
local playerCacheInterval = 0.5

local function updatePlayerCache()
    local now = tick()
    if now - lastPlayerCacheTime < playerCacheInterval then
        return playerCache
    end
    
    lastPlayerCacheTime = now
    playerCache = Players:GetPlayers()
    return playerCache
end

local function verifyTeamSwitch()
    local player = Players.LocalPlayer
    if not player or not selectedFaction then return false end
    
    local team = player.Team
    return team and team.Name == selectedFaction
end

local function checkAndSwitchTeam()
    if teamCheckInProgress then return end

    local player = Players.LocalPlayer
    if not player or not selectedFaction then return end

    local team = player.Team
    if team and team.Name == selectedFaction then 
        isTeamSwitchVerified = true
        return 
    end

    teamCheckInProgress = true
    isTeamSwitchVerified = false

    local success, err = pcall(function()
        local replicatedStorage = game:GetService("ReplicatedStorage")
        local remotes = replicatedStorage:WaitForChild("Remotes", 2)
        if remotes then
            local CommF = remotes:WaitForChild("CommF_", 2)
            if CommF then
                CommF:InvokeServer("SetTeam2", selectedFaction)
                task.wait(0.5)
            end
        end
    end)

    if not success and err then
        warn("[Auto Bounty] Team switch error:", err)
    end

    if verifyTeamSwitch() then
        isTeamSwitchVerified = true
    else
        isTeamSwitchVerified = false
    end

    task.wait(1)
    teamCheckInProgress = false
end

-- ✅ ลดการหน่วงเวลา
local function pressKey(keyName)
    pcall(function()
        if type(keyName) == "table" then
            for k, v in pairs(keyName) do
                local targetKey = type(k) == "string" and k or v
                if targetKey and targetKey ~= "None" then
                    local keyCode = Enum.KeyCode[targetKey]
                    if keyCode then
                        VirtualInputManager:SendKeyEvent(true, keyCode, false, game)
                        task.wait(0.01)
                        VirtualInputManager:SendKeyEvent(false, keyCode, false, game)
                    end
                end
            end
        elseif type(keyName) == "string" and keyName ~= "None" then
            local keyCode = Enum.KeyCode[keyName]
            if keyCode then
                VirtualInputManager:SendKeyEvent(true, keyCode, false, game)
                task.wait(0.01)
                VirtualInputManager:SendKeyEvent(false, keyCode, false, game)
            end
        end
    end)
end

-- ✅ เก็บ CheckMatch ไว้ใน Table พร้อมจำกัด Size
local toolTypeCache = {}
local MAX_TOOL_CACHE = 500

local function addToToolCache(toolId, typeName)
    if table.getn(toolTypeCache) >= MAX_TOOL_CACHE then
        table.clear(toolTypeCache)
    end
    toolTypeCache[toolId] = typeName
end

local function checkMatch(tool, typeName)
    local toolId = tool:GetFullName()
    
    if toolTypeCache[toolId] then
        return toolTypeCache[toolId] == typeName
    end
    
    local name = tool.Name:lower()
    local tooltip = tool.ToolTip or ""
    local result = false
    
    if typeName == "Melee" then
        result = name:find("combat") or name:find("dark step") or name:find("electro") or 
               name:find("water karate") or name:find("dragon claw") or name:find("superhuman") or 
               name:find("death step") or name:find("sharkman karate") or name:find("electric claw") or 
               name:find("dragon talon") or name:find("godhuman") or name:find("sanguine art")
               
    elseif typeName == "Sword" then
        result = tooltip:lower() == "sword"
               
    elseif typeName == "Fruit" then
        result = tooltip:lower() == "blox fruit" or tool:GetAttribute("Fruit") == true
               
    elseif typeName == "Gun" then
        result = tooltip:lower() == "gun"
    end
    
    if result then
        addToToolCache(toolId, typeName)
    end
    
    return result
end

local function equipToolByType(toolType)
    local myChar = localPlayer.Character
    local backpack = localPlayer:FindFirstChildOfClass("Backpack")
    if not myChar then return end
    
    local humanoid = myChar:FindFirstChildOfClass("Humanoid")
    local currentTool = myChar:FindFirstChildOfClass("Tool")

    if not toolType or toolType == "" or toolType == "None" then
        if currentTool and backpack and humanoid then
            humanoid:UnequipTools()
        end
        return
    end

    if currentTool and checkMatch(currentTool, toolType) then
        return
    end

    local itemsToCheck = {}
    if backpack then
        for _, item in ipairs(backpack:GetChildren()) do 
            if item:IsA("Tool") then
                table.insert(itemsToCheck, item)
            end
        end
    end
    
    for _, item in ipairs(myChar:GetChildren()) do 
        if item:IsA("Tool") then
            table.insert(itemsToCheck, item)
        end
    end

    for _, tool in ipairs(itemsToCheck) do
        if checkMatch(tool, toolType) then
            if humanoid then
                humanoid:EquipTool(tool)
                break
            end
        end
    end
end

local function executeSkills(skillTable, toolType)
    if not skillTable or type(skillTable) ~= "table" then return end
    
    local hasValid = false
    for _, skill in ipairs(skillTable) do
        if skill ~= "None" then
            hasValid = true
            break
        end
    end
    
    if not hasValid then return end
    
    equipToolByType(toolType)
    task.wait(0.03)
    
    for _, skill in ipairs(skillTable) do
        if skill ~= "None" then
            pressKey(skill)
            task.wait(0.03)
        end
    end
end

local lastComboTime = 0
local comboCooldown = 1

local function smoothFlyTo(targetCFrame, speed, deltaTime, targetChar, distanceToTarget)
    local localPlayer = game:GetService("Players").LocalPlayer
    local myChar = localPlayer.Character
    if not myChar then return end
    
    local myRoot = myChar:FindFirstChild("HumanoidRootPart")
    if not myRoot then return end

    local humanoid = myChar:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.PlatformStand = true
    end

    local targetPos = targetCFrame.Position
    local currentPos = myRoot.Position
    local distance = (targetPos - currentPos).Magnitude
    
    local maxDistance = (Bounty and Bounty.Flags and Bounty.Flags.SafeModeDistanceSlider) or 150
    local enemyDistanceOffset = (Bounty and Bounty.Flags and Bounty.Flags.EnemyDistanceSlider) or 0
    
    if distance <= maxDistance then
        -- ✅ เก็บ targetRoot ไปใช้ซ้ำ (เรียกเพียงครั้งเดียว)
        local targetRoot = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
        
        myRoot.CFrame = targetRoot
            and targetRoot.CFrame * CFrame.new(0, 3, enemyDistanceOffset)
            or CFrame.new(myRoot.Position, targetPos) * CFrame.new(0, 3, enemyDistanceOffset)
        
        myRoot.Velocity = Vector3.zero
        myRoot.AssemblyLinearVelocity = Vector3.zero
        myRoot.AssemblyAngularVelocity = Vector3.zero

        if distance <= 100 then
            if tick() - lastComboTime >= comboCooldown then
                lastComboTime = tick()
                
                if selectedMeleeSkills and selectedMeleeSkills[1] ~= "None" then
                    executeSkills(selectedMeleeSkills, "Melee")
                    task.wait(0.05)
                end
                
                if selectedSwordSkills and selectedSwordSkills[1] ~= "None" then
                    executeSkills(selectedSwordSkills, "Sword")
                    task.wait(0.05)
                end
                
                if selectedFruitSkills and selectedFruitSkills[1] ~= "None" then
                    executeSkills(selectedFruitSkills, "Fruit")
                    task.wait(0.05)
                end
                
                if selectedGunSkills and selectedGunSkills[1] ~= "None" then
                    executeSkills(selectedGunSkills, "Gun")
                    task.wait(0.05)
                end
            end
        end
        return
    end

    -- ✅ เพิ่มเช็ค Distance เพื่อเลี่ยง Calculation ที่ไม่จำเป็น
    if distance > 0 then
        local direction = (targetPos - currentPos).Unit
        local currentSpeed = speed or flySpeed
        local clampedSpeed = math.min(currentSpeed, 220)
        
        myRoot.AssemblyLinearVelocity = direction * clampedSpeed
        myRoot.AssemblyAngularVelocity = Vector3.zero
        myRoot.CFrame = CFrame.lookAt(currentPos, currentPos + direction)
    end
end

local hopServersEnabled = false

-- ✅ ลด GetPlayers() calls ไม่ให้เกิดจากหลายฟังก์ชัน
local function shouldSkipTarget(targetPlayer, LocalPlayer)
    if not targetPlayer or targetPlayer == LocalPlayer then return true end
    if LocalPlayer.Team and LocalPlayer.Team.Name == "Marines" then
        if targetPlayer.Team and targetPlayer.Team.Name == "Marines" then return true end
    end
    return false
end

local function getPlayerLevel(player)
    local success, lvl = pcall(function()
        if player:FindFirstChild("Data") and player.Data:FindFirstChild("Level") then
            return player.Data.Level.Value
        elseif player.Character and player.Character:FindFirstChild("Data") and player.Character.Data:FindFirstChild("Level") then
            return player.Character.Data.Level.Value
        end
        return nil
    end)
    return success and lvl or nil
end

local function findNearestTarget(LocalPlayer, myRoot, myLevel)
    local now = tick()
    
    if now - lastTargetSearchTime < targetSearchInterval then
        return cachedNearestTarget
    end
    
    lastTargetSearchTime = now
    
    if not myRoot then 
        cachedNearestTarget = nil
        return nil
    end
    
    local nearestTargetRoot = nil
    local nearestTargetChar = nil
    local nearestTargetPlayer = nil
    local shortestDistance = math.huge

    -- ✅ ใช้ cached players list
    local playerList = updatePlayerCache()

    for _, targetPlayer in ipairs(playerList) do
        if not shouldSkipTarget(targetPlayer, LocalPlayer) then
            local char = targetPlayer.Character
            if char then
                -- ✅ เก็บ Reference ไปใช้ซ้ำ แทนเรียก FindFirstChild ซ้ำ
                local targetRoot = char:FindFirstChild("HumanoidRootPart")
                local targetHum = char:FindFirstChildOfClass("Humanoid")
                
                if targetHum and targetHum.Health > 0 and targetRoot then
                    local inSafeZone = false
                    pcall(function()
                        if isPlayerInSafeZone then inSafeZone = isPlayerInSafeZone(targetPlayer, char) end
                    end)

                    if not inSafeZone then
                        local pvpDisabled = targetPlayer:GetAttribute("PvpDisabled") or char:GetAttribute("PvpDisabled")
                        if pvpDisabled ~= true then
                            local targetLevel = getPlayerLevel(targetPlayer)
                            local isLevelValid = true
                            
                            if type(myLevel) == "number" and type(targetLevel) == "number" then
                                if math.abs(myLevel - targetLevel) > 800 then
                                    isLevelValid = false
                                end
                            end

                            if isLevelValid then
                                local distance = (targetRoot.Position - myRoot.Position).Magnitude
                                if distance <= 15000 and distance < shortestDistance then
                                    shortestDistance = distance
                                    nearestTargetRoot = targetRoot
                                    nearestTargetChar = char
                                    nearestTargetPlayer = targetPlayer
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    
    cachedNearestTarget = {root = nearestTargetRoot, char = nearestTargetChar, distance = shortestDistance, player = nearestTargetPlayer}

    return cachedNearestTarget
end

local function runAutoBounty(deltaTime)
    if not autoBountyEnabled then return end

    if not isTeamSwitchVerified then
        return
    end

    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    if not LocalPlayer then return end

    local myChar = LocalPlayer.Character
    if not myChar then return end
    
    local rootPart = myChar:FindFirstChild("HumanoidRootPart")
    local charHumanoid = myChar:FindFirstChildOfClass("Humanoid")
    
    if not rootPart or not charHumanoid then return end

    local TweenService = game:GetService("TweenService")

    if defenseProtocolEnabled and charHumanoid and charHumanoid.Health > 0 and rootPart then
        local maxHpValue = charHumanoid.MaxHealth > 0 and charHumanoid.MaxHealth or 100
        local currentHpRatio = (charHumanoid.Health / maxHpValue) * 100

        if currentHpRatio <= healthTriggerThreshold and not isEmergencyAscending then
            isEmergencyAscending = true

            charHumanoid.PlatformStand = true
            rootPart.AssemblyLinearVelocity = Vector3.zero
            rootPart.AssemblyAngularVelocity = Vector3.zero

            local destinationCFrame = rootPart.CFrame + Vector3.new(0, 800, 0)
            local transitionInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            local riseTween = TweenService:Create(rootPart, transitionInfo, {CFrame = destinationCFrame})
            riseTween:Play()
        end

        if isEmergencyAscending then
            charHumanoid.PlatformStand = true
            rootPart.AssemblyLinearVelocity = Vector3.new(0, ascentVelocity, 0)
            rootPart.AssemblyAngularVelocity = Vector3.zero
            
            if rootPart.Position.Y < (workspace.FallenPartsDestroyHeight or -500) + 400 then
                rootPart.CFrame = rootPart.CFrame + Vector3.new(0, 100, 0)
            end
            
            if (currentHpRatio >= healthRecoveryThreshold) then
                isEmergencyAscending = false
                charHumanoid.PlatformStand = false
                rootPart.AssemblyLinearVelocity = Vector3.zero
            end
            
            return 
        end
    end

    if not autoBountyEnabled then return end

    -- ✅ ส่ง cache เข้าไปเพื่อลด GetPlayers calls
    local myLevel = getPlayerLevel(LocalPlayer)
    local targetData = findNearestTarget(LocalPlayer, rootPart, myLevel)
    local nearestTargetRoot = targetData and targetData.root
    local nearestTargetChar = targetData and targetData.char
    local shortestDistance = targetData and targetData.distance or math.huge

    if nearestTargetRoot and nearestTargetChar and charHumanoid and charHumanoid.Health > 0 and shortestDistance <= 10000 then
        pcall(function()
            smoothFlyTo(nearestTargetRoot.CFrame, flySpeed, deltaTime, nearestTargetChar, shortestDistance)
        end)
        return
    end

    if not hopServersEnabled then
        return
    end

    if isPlayerInCombat(LocalPlayer, myChar) then
        return
    end

    for i = 1, 30 do 
        if not autoBountyEnabled or not hopServersEnabled then return end
        
        if isPlayerInCombat(LocalPlayer, LocalPlayer.Character) then
            local browser = LocalPlayer.PlayerGui:FindFirstChild("ServerBrowser")
            if browser then browser.Enabled = false end
            return 
        end
        
        local nData = findNearestTarget(LocalPlayer, rootPart, myLevel)
        if nData and nData.root and nData.distance <= 10000 then
            local browser = LocalPlayer.PlayerGui:FindFirstChild("ServerBrowser")
            if browser then browser.Enabled = false end
            return 
        end
        
        task.wait(0.1)
    end

    if not autoBountyEnabled or not hopServersEnabled then return end

    if isPlayerInCombat(LocalPlayer, LocalPlayer.Character) then
        local browser = LocalPlayer.PlayerGui:FindFirstChild("ServerBrowser")
        if browser then browser.Enabled = false end
        return 
    end

    local browserGui = LocalPlayer.PlayerGui:WaitForChild("ServerBrowser")
    browserGui.Enabled = true 
    task.wait(1)

    while autoBountyEnabled and hopServersEnabled do
        if isPlayerInCombat(LocalPlayer, LocalPlayer.Character) then
            browserGui.Enabled = false
            return
        end
        
        local nData = findNearestTarget(LocalPlayer, rootPart, myLevel)
        if nData and nData.root and nData.distance <= 10000 then
            browserGui.Enabled = false
            return
        end
        
        local joined = false
        local frame = browserGui:FindFirstChild("Frame", true)
        
        if frame then
            for _, i in ipairs(frame:GetDescendants()) do
                if not autoBountyEnabled or not hopServersEnabled then return end
                
                if i:IsA("TextButton") and (i.Text == "Join" or i.Name == "JoinButton") then
                    if firesignal then 
                        firesignal(i.MouseButton1Click) 
                        joined = true
                    end
                    task.wait(0.5)
                elseif i:IsA("ScrollingFrame") then
                    i.CanvasPosition = i.CanvasPosition + Vector2.new(0, 150)
                end
            end
        end
        
        if not joined then
            task.wait(1) 
        else
            task.wait(1)
        end
    end
end

local Toggle = Bounty:Toggle({
    Title = "Auto Bounty",
    Desc = "Automatically hunt bounty for you",
    Flag = "AutoBounty_Toggle",
    Callback = function(state)
        autoBountyEnabled = state

        if bountyConnection then
            bountyConnection:Disconnect()
            bountyConnection = nil
        end

        if autoBountyEnabled then
            isTeamSwitchVerified = false  
            lastTargetSearchTime = 0
            cachedNearestTarget = nil
            
            teamCheckLoopRunning = true
            task.spawn(function()
                while autoBountyEnabled and teamCheckLoopRunning do
                    if not verifyTeamSwitch() then
                        checkAndSwitchTeam()
                    else
                        isTeamSwitchVerified = true
                    end
                    task.wait(2)
                end
            end)
            
            bountyConnection = RunService.Heartbeat:Connect(function(deltaTime)
                runAutoBounty(deltaTime)
            end)
        else
            teamCheckLoopRunning = false
            if localPlayer.Character and localPlayer.Character:FindFirstChildOfClass("Humanoid") then
                localPlayer.Character.Humanoid.PlatformStand = false
            end
        end
    end
})

local ToggleHop = Bounty:Toggle({
    Title = "Hop Servers",
    Desc = "Automatically hop servers when no target found",
    Flag = "HopServers_Toggle",
    Default = false,
    Callback = function(state)
        hopServersEnabled = state
    end
})

local Toggle = Bounty:Toggle({
    Title = "Enable PvP",
    Desc = "Automatically enables PvP combat continuously",
    Flag = "Toggle_EnablePvP",
    Default = false,
    Callback = function(state)
        _G.EnablePvPLoop = state
        
        if state then
            task.spawn(function()
                while _G.EnablePvPLoop do
                    local args = {
                        "EnablePvp"
                    }
                    local success, err = pcall(function()
                        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
                    end)
                    
                    task.wait(2)
                end
            end)
        end
    end
})

local DropdownMyFaction = Bounty:Dropdown({
    Title = "Auto Team",
    Desc = "Select your faction. The system will check and switch automatically.",
    Values = {"Marines", "Pirates"},
    Value = selectedFaction,
    Multi = false,
    Locked = false,
    Flag = "my_faction_select",
    Callback = function(selected)
        selectedFaction = selected
    end
})

local UtilitySection = Bounty:Section({ 
    Title = "Settings Skills", 
    Icon = "settings" 
})
Bounty:Divider() 

local DropdownMelee = Bounty:Dropdown({
    Title = "Melee",
    Desc = "Select Melee skills (Supports all fighting styles in the game)",
    Values = {"Z", "X", "C"},
    Multi = true,
    AllowNone = true,
    Flag = "melee_skill_multi",
    Callback = function(selected)
        selectedMeleeSkills = selected
    end
})

local DropdownSword = Bounty:Dropdown({
    Title = "Sword",
    Desc = "Select Sword skills (Supports all swords in the game)",
    Values = {"Z", "X"},
    Multi = true,
    AllowNone = true,
    Flag = "sword_skill_multi",
    Callback = function(selected)
        selectedSwordSkills = selected
    end
})

local DropdownFruit = Bounty:Dropdown({
    Title = "Blox Fruit",
    Desc = "Select Blox Fruit skills (Supports all fruits in the game)",
    Values = {"Z", "X", "C", "V", "F"},
    Multi = true,
    AllowNone = true,
    Flag = "fruit_skill_multi",
    Callback = function(selected)
        selectedFruitSkills = selected
    end
})

local DropdownGun = Bounty:Dropdown({
    Title = "Gun",
    Desc = "Select Gun skills (Supports all guns in the game)",
    Values = {"Z", "X"},
    Multi = true,
    AllowNone = true,
    Flag = "gun_skill_multi",
    Callback = function(selected)
        selectedGunSkills = selected
    end
})

local UtilitySection = Bounty:Section({ 
    Title = "Manually initiate the hunt.", 
    Icon = "sword" 
})

Bounty:Divider() 

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local selectedPlayers = {}
local playerControls = {}
local lastComboTime = lastComboTime or 0
local comboCooldown = comboCooldown or 1

local ascentVelocity = 220
local healthTriggerThreshold = 30
local healthRecoveryThreshold = 100
local defenseProtocolEnabled = false
local isEmergencyAscending = false

local combatCache = {}
local safeZoneCache = {}
local cacheTime = tick()
local cacheDuration = 0.2

local safeZones =
    Workspace:FindFirstChild("_WorldOrigin")
    and Workspace._WorldOrigin:FindFirstChild("SafeZones")

local function Bounty_ClearCache()
    if tick() - cacheTime >= cacheDuration then
        table.clear(combatCache)
        table.clear(safeZoneCache)
        cacheTime = tick()
    end
end

local function Bounty_IsSafeRadius(character)
    if not character or not safeZones then return false end

    local root = character:FindFirstChild("HumanoidRootPart")
    if not root then return false end

    for _, zone in ipairs(safeZones:GetChildren()) do
        if zone:IsA("BasePart") then
            local mesh = zone:FindFirstChildOfClass("SpecialMesh")
            local radius = mesh
                and (mesh.Scale.X / 2) * math.max(zone.Size.X, zone.Size.Z)
                or math.max(zone.Size.X, zone.Size.Z) / 2

            if (root.Position - zone.Position).Magnitude <= radius then
                return true
            end
        end
    end

    return false
end

local function Bounty_IsSafe(player, character)
    if not player then return false end

    Bounty_ClearCache()

    if safeZoneCache[player] ~= nil then
        return safeZoneCache[player]
    end

    local result =
        player:GetAttribute("SafeZone") == true
        or (character and character:GetAttribute("SafeZone") == true)
        or Bounty_IsSafeRadius(character)
        or (character and character:FindFirstChild("TempSafeZone") ~= nil)

    safeZoneCache[player] = result
    return result
end

local function Bounty_ShouldIgnore(character, player)
    if not character then return true end

    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid and humanoid.Health <= 0 then
        return true
    end

    local enemies = Workspace:FindFirstChild("Enemies")
    if enemies and character:IsDescendantOf(enemies) then
        return false
    end

    if not player or player == LocalPlayer then return true end
    if player:GetAttribute("PvpDisabled") == true then return true end
    if Bounty_IsSafe(player, character) then return true end

    if LocalPlayer.Team
        and LocalPlayer.Team.Name == "Marines"
        and player.Team == LocalPlayer.Team then
        return true
    end

    return false
end

local function Bounty_IsValid(player)
    if not player or not player.Character then return false end

    local character = player.Character

    if Bounty_ShouldIgnore(character, player) then return false end
    if Bounty_IsSafe(player, character) then return false end
    if Bounty_IsSafeRadius(character) then return false end

    return true
end

local function Bounty_GetLevel(player)
    local data = player:FindFirstChild("Data")
    local level = data and data:FindFirstChild("Level")

    if level then return level.Value end

    local stats = player:FindFirstChild("leaderstats")
    level = stats and stats:FindFirstChild("Level")

    return level and level.Value or "?"
end

local function Bounty_GetBounty(player)
    local stats = player:FindFirstChild("leaderstats")
    local bounty = stats and stats:FindFirstChild("Bounty/Honor")

    return bounty and bounty.Value or 0
end

local function Bounty_GetDesc(player)
    local valid = Bounty_IsValid(player)
    local color = valid and "#55FF88" or "#FF5555"
    local status = valid and "Ready" or "Not ready"

    return string.format(
        'Status: <font color="%s">%s</font> | Lv. <font color="#FFFFFF">%s</font> | Bounty: <font color="#FFD166">%s</font>',
        color,
        status,
        tostring(Bounty_GetLevel(player)),
        tostring(Bounty_GetBounty(player))
    )
end

local function Bounty_CreatePlayer(player)
    if player == LocalPlayer or playerControls[player.UserId] then
        return
    end

    selectedPlayers[player.UserId] = false

    playerControls[player.UserId] = Bounty:Toggle({
        Title = string.format("%s (@%s)", player.DisplayName, player.Name),
        Desc = Bounty_GetDesc(player),
        Icon = "check",
        Value = false,
        Type = "Toggle",
        Locked = false,

        Callback = function(state)
            selectedPlayers[player.UserId] = state
        end
    })
end

for _, player in ipairs(Players:GetPlayers()) do
    Bounty_CreatePlayer(player)
end

Players.PlayerAdded:Connect(function(player)
    task.wait(0.5)
    Bounty_CreatePlayer(player)
end)

Players.PlayerRemoving:Connect(function(player)
    local id = player.UserId
    local control = playerControls[id]

    if control and typeof(control.Destroy) == "function" then
        control:Destroy()
    end

    playerControls[id] = nil
    selectedPlayers[id] = nil
    combatCache[player] = nil
    safeZoneCache[player] = nil
end)

-- ✅ ปรับปรุง Bounty_MoveTo เพื่อลดการเรียก FindFirstChild
local function Bounty_MoveTo(targetCFrame, speed, targetCharacter)
    local character = LocalPlayer.Character
    if not character then return end
    
    local root = character:FindFirstChild("HumanoidRootPart")
    if not root then return end

    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then humanoid.PlatformStand = true end

    local targetPos = targetCFrame.Position
    local distance = (targetPos - root.Position).Magnitude

    local maxDistance =
        (Bounty and Bounty.Flags and Bounty.Flags.SafeModeDistanceSlider) or 150

    local offset =
        (Bounty and Bounty.Flags and Bounty.Flags.EnemyDistanceSlider) or 0

    if distance <= maxDistance then
        -- ✅ เก็บ targetRoot ไปใช้ซ้ำ (เรียกเพียงครั้งเดียว)
        local targetRoot = targetCharacter and targetCharacter:FindFirstChild("HumanoidRootPart")

        root.CFrame = targetRoot
            and targetRoot.CFrame * CFrame.new(0, 3, offset)
            or CFrame.new(root.Position, targetPos) * CFrame.new(0, 3, offset)

        root.Velocity = Vector3.zero
        root.AssemblyLinearVelocity = Vector3.zero
        root.AssemblyAngularVelocity = Vector3.zero

        if distance <= 100 and tick() - lastComboTime >= comboCooldown then
            lastComboTime = tick()

            if selectedMeleeSkills and selectedMeleeSkills[1] ~= "None" then
                executeSkills(selectedMeleeSkills, "Melee")
                task.wait(0.1)
            end

            if selectedSwordSkills and selectedSwordSkills[1] ~= "None" then
                executeSkills(selectedSwordSkills, "Sword")
                task.wait(0.1)
            end

            if selectedFruitSkills and selectedFruitSkills[1] ~= "None" then
                executeSkills(selectedFruitSkills, "Fruit")
                task.wait(0.1)
            end

            if selectedGunSkills and selectedGunSkills[1] ~= "None" then
                executeSkills(selectedGunSkills, "Gun")
            end
        end

        return
    end

    -- ✅ เพิ่มเช็ค Distance เพื่อเลี่ยง Calculation ที่ไม่จำเป็น
    if distance > 0 then
        local direction = targetPos - root.Position
        if direction.Magnitude > 0 then
            direction = direction.Unit
            local finalSpeed = math.min(speed or flySpeed or 50, 220)

            root.AssemblyLinearVelocity = direction * finalSpeed
            root.AssemblyAngularVelocity = Vector3.zero
            root.CFrame = CFrame.lookAt(root.Position, root.Position + direction)
        end
    end
end

-- ✅ ปรับปรุง Bounty_Defense เพื่อลดการค้นหา Character ซ้ำ
local function Bounty_Defense()
    if not defenseProtocolEnabled then
        isEmergencyAscending = false
        return false
    end

    local character = LocalPlayer.Character
    if not character then return false end
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local root = character:FindFirstChild("HumanoidRootPart")

    if not humanoid or humanoid.Health <= 0 or not root then
        isEmergencyAscending = false
        return false
    end

    local maxHealth = humanoid.MaxHealth
    if maxHealth <= 0 then
        maxHealth = 100
    end

    local healthPercent = (humanoid.Health / maxHealth) * 100

    if healthPercent <= healthTriggerThreshold and not isEmergencyAscending then
        isEmergencyAscending = true
        humanoid.PlatformStand = true

        root.AssemblyLinearVelocity = Vector3.zero
        root.AssemblyAngularVelocity = Vector3.zero

        root.CFrame = root.CFrame + Vector3.new(0, 800, 0)
        root.AssemblyLinearVelocity = Vector3.new(0, ascentVelocity, 0)
    end

    if isEmergencyAscending then
        if not defenseProtocolEnabled then
            isEmergencyAscending = false
            humanoid.PlatformStand = false
            root.AssemblyLinearVelocity = Vector3.zero
            return false
        end

        humanoid.PlatformStand = true
        root.AssemblyLinearVelocity = Vector3.new(0, ascentVelocity, 0)
        root.AssemblyAngularVelocity = Vector3.zero

        if root.AssemblyLinearVelocity.Y < ascentVelocity then
            root.AssemblyLinearVelocity = Vector3.new(0, ascentVelocity, 0)
        end

        if root.Position.Y < 300 then
            root.CFrame = root.CFrame + Vector3.new(0, 100, 0)
            root.AssemblyLinearVelocity = Vector3.new(0, ascentVelocity, 0)
        end

        if healthPercent >= healthRecoveryThreshold then
            isEmergencyAscending = false
            humanoid.PlatformStand = false
            root.AssemblyLinearVelocity = Vector3.zero
            root.AssemblyAngularVelocity = Vector3.zero
        end

        return true
    end

    return false
end

RunService.Heartbeat:Connect(function()
    if Bounty_Defense() then
        return
    end

    for userId, selected in pairs(selectedPlayers) do
        local player = Players:GetPlayerByUserId(userId)

        if player then
            local control = playerControls[userId]

            if control and control.SetDesc then
                control:SetDesc(Bounty_GetDesc(player))
            end

            if selected and player.Character then
                local target = player.Character
                local root = target:FindFirstChild("HumanoidRootPart")

                if root and Bounty_IsValid(player) then
                    Bounty_MoveTo(root.CFrame, 220, target)
                end
            end
        end
    end
end)
