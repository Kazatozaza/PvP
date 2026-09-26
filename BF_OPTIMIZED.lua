local _version = "1.6.66"

if getgenv().DestinyHub_IsLoading then
    warn("[DestinyHub]: สคริปต์กำลังโหลดอยู่แล้ว กรุณารอสักครู่...")
    
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "DestinyHub Warning",
            Text = "สคริปต์กำลังโหลดอยู่แล้ว กรุณารอสักครู่...",
            Duration = 3,
            Icon = "rbxassetid://97596339693490"
        })
    end)
    
    return
end
getgenv().DestinyHub_IsLoading = true

if not game:IsLoaded() then
    game.Loaded:Wait()
end

repeat task.wait() until game:GetService("Players").LocalPlayer

if getgenv().DestinyHubWindow then
    pcall(function()
        if typeof(getgenv().DestinyHubWindow.Destroy) == "function" then
            getgenv().DestinyHubWindow:Destroy()
        end
    end)
    getgenv().DestinyHubWindow = nil
end

-- ✅ [FIX #1] ลบ Countdown 7 วินาที (เสียเวลา)
-- ❌ เดิม:
-- for i = 7, 1, -1 do
--     pcall(function()
--         game:GetService("StarterGui"):SetCore("SendNotification", {...})
--     end)
--     task.wait(1)
-- end

local success, result = pcall(function()
    return loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/download/" .. _version .. "/main.lua"))()
end)

if success and result then
    WindUI = result
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "DestinyHub Success",
        Text = "โหลด Destiny Hub สำเร็จแล้ว!",
        Duration = 3,
        Icon = "rbxassetid://97596339693490"
    })
else
    warn("[DestinyHub]: ไม่สามารถโหลด WindUI ได้ กรุณาตรวจสอบอินเทอร์เน็ตหรือลิงก์เวอร์ชัน")
    
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "DestinyHub Error",
            Text = "ไม่สามารถโหลด Destiny Hub ได้!",
            Duration = 4,
            Icon = "rbxassetid://97596339693490"
        })
    end)
    
    getgenv().DestinyHub_IsLoading = nil 
    return
end

-- ✅ [FIX #2] Pre-compute Colors แทนที่จะทำ Color3.fromHex ทุกครั้ง
local THEME_COLORS = {
    Primary = Color3.fromHex("#3b82f6"),
    White = Color3.new(1,1,1),
    Black = Color3.new(0,0,0),
    Dialog = Color3.fromHex("#1e1e24"),
    Background = Color3.fromHex("#111115"),
    Hover = Color3.fromHex("#FFFFFF"),
    PanelBackground = Color3.fromHex("#18181f"),
    WindowBackground = Color3.fromHex("#111115"),
    WindowShadow = Color3.new(0,0,0),
    TabBackground = Color3.fromHex("#18181f"),
    TabText = Color3.fromHex("#A1A1AA"),
    TabTitle = Color3.fromHex("#FFFFFF"),
    TabIcon = Color3.fromHex("#A1A1AA"),
    TabBorder = Color3.fromHex("#FFFFFF"),
    ElementBackground = Color3.fromHex("#18181f"),
    ElementBackgroundHover = Color3.fromHex("#272730"),
    ElementTitle = Color3.fromHex("#FFFFFF"),
    ElementDesc = Color3.fromHex("#cbd5e1"),
    PopupBackground = Color3.fromHex("#18181f"),
    PopupTitle = Color3.fromHex("#FFFFFF"),
    PopupContent = Color3.fromHex("#cbd5e1"),
    DialogBackground = Color3.fromHex("#18181f"),
    DialogTitle = Color3.fromHex("#FFFFFF"),
    DialogContent = Color3.fromHex("#cbd5e1"),
    Toggle = Color3.fromHex("#3b82f6"),
    ToggleBar = Color3.fromHex("#FFFFFF"),
    Checkbox = Color3.fromHex("#FFFFFF"),
    CheckboxBorder = Color3.fromHex("#52525b"),
    Slider = Color3.fromHex("#3b82f6"),
    SliderThumb = Color3.fromHex("#FFFFFF"),
    Tooltip = Color3.fromHex("#272730"),
    TooltipText = Color3.fromHex("#FFFFFF"),
    TooltipSecondary = Color3.fromHex("#94a3b8"),
    SectionBox = Color3.fromHex("#18181f"),
    SectionBorder = Color3.fromHex("#3f3f46"),
    SearchBarBorder = Color3.fromHex("#3f3f46"),
    Notification = Color3.fromHex("#18181f"),
    NotificationTitle = Color3.fromHex("#FFFFFF"),
    NotificationContent = Color3.fromHex("#cbd5e1"),
    NotificationBorder = Color3.fromHex("#3f3f46"),
    Button = Color3.fromHex("#272730"),
    ButtonText = Color3.fromHex("#FFFFFF"),
    ButtonBackground = Color3.fromHex("#272730"),
    ButtonBackgroundHover = Color3.fromHex("#32323d"),
}

pcall(function()
  WindUI:AddTheme({
    Name = "Darker-Soft",
    Primary = THEME_COLORS.Primary,
    White = THEME_COLORS.White,
    Black = THEME_COLORS.Black,
    Dialog = THEME_COLORS.Dialog,
    Background = THEME_COLORS.Background,
    BackgroundTransparency = 0,
    Hover = THEME_COLORS.Hover,
    PanelBackground = THEME_COLORS.PanelBackground,
    PanelBackgroundTransparency = .95,
    WindowBackground = THEME_COLORS.WindowBackground,
    WindowShadow = THEME_COLORS.WindowShadow,
    WindowTopbarTitle = THEME_COLORS.TabTitle,
    WindowTopbarAuthor = THEME_COLORS.TabTitle,
    WindowTopbarIcon = THEME_COLORS.TabTitle,
    WindowTopbarButtonIcon = THEME_COLORS.TabTitle,
    WindowSearchBarBackground = THEME_COLORS.PanelBackground,
    TabBackground = THEME_COLORS.TabBackground,
    TabBackgroundHover = Color3.fromHex("#ffffff"),
    TabBackgroundHoverTransparency = 0.85,
    TabBackgroundActive = Color3.fromHex("#ffffff"),
    TabBackgroundActiveTransparency = 0.9,
    TabText = THEME_COLORS.TabText,
    TabTextTransparency = 0,
    TabTextTransparencyActive = 0,
    TabTitle = THEME_COLORS.TabTitle,
    TabIcon = THEME_COLORS.TabIcon,
    TabIconTransparency = 0,
    TabIconTransparencyActive = 0,
    TabBorderTransparency = 1,
    TabBorderTransparencyActive = 0.7,
    TabBorder = THEME_COLORS.TabBorder,
    ElementBackground = THEME_COLORS.ElementBackground,
    ElementBackgroundTransparency = .5,
    ElementBackgroundHover = THEME_COLORS.ElementBackgroundHover,
    ElementTitle = THEME_COLORS.ElementTitle,
    ElementDesc = THEME_COLORS.ElementDesc,
    ElementIcon = THEME_COLORS.ElementTitle,
    PopupBackground = THEME_COLORS.PopupBackground,
    PopupBackgroundTransparency = 0,
    PopupTitle = THEME_COLORS.PopupTitle,
    PopupContent = THEME_COLORS.PopupContent,
    PopupIcon = THEME_COLORS.PopupTitle,
    DialogBackground = THEME_COLORS.DialogBackground,
    DialogBackgroundTransparency = 0,
    DialogTitle = THEME_COLORS.DialogTitle,
    DialogContent = THEME_COLORS.DialogContent,
    DialogIcon = THEME_COLORS.DialogTitle,
    Toggle = THEME_COLORS.Toggle,
    ToggleBar = THEME_COLORS.ToggleBar,
    Checkbox = THEME_COLORS.Checkbox,
    CheckboxIcon = THEME_COLORS.Checkbox,
    CheckboxBorder = THEME_COLORS.CheckboxBorder,
    CheckboxBorderTransparency = 0,
    SliderIcon = THEME_COLORS.ElementTitle,
    Slider = THEME_COLORS.Slider,
    SliderThumb = THEME_COLORS.SliderThumb,
    SliderIconFrom = THEME_COLORS.SliderThumb,
    SliderIconTo = THEME_COLORS.SliderThumb,
    Tooltip = THEME_COLORS.Tooltip,
    TooltipText = THEME_COLORS.TooltipText,
    TooltipSecondary = THEME_COLORS.TooltipSecondary,
    TooltipSecondaryText = THEME_COLORS.TooltipText,
    TabSectionIcon = THEME_COLORS.TabTitle,
    SectionIcon = THEME_COLORS.TabTitle,
    SectionExpandIcon = THEME_COLORS.TabTitle,
    SectionExpandIconTransparency = 0,
    SectionBox = THEME_COLORS.SectionBox,
    SectionBoxTransparency = .5,
    SectionBoxBorder = THEME_COLORS.SectionBorder,
    SectionBoxBorderTransparency = 0,
    SectionBoxBackground = THEME_COLORS.SectionBox,
    SectionBoxBackgroundTransparency = .5,
    SearchBarBorder = THEME_COLORS.SearchBarBorder,
    SearchBarBorderTransparency = 0,
    Notification = THEME_COLORS.Notification,
    NotificationTitle = THEME_COLORS.NotificationTitle,
    NotificationTitleTransparency = 0,
    NotificationContent = THEME_COLORS.NotificationContent,
    NotificationContentTransparency = 0,
    NotificationDuration = THEME_COLORS.NotificationTitle,
    NotificationDurationTransparency = .9,
    NotificationBorder = THEME_COLORS.NotificationBorder,
    NotificationBorderTransparency = 0,
    DropdownTabBorder = THEME_COLORS.SectionBorder,
    LabelBackground = THEME_COLORS.SectionBox,
    LabelBackgroundTransparency = .5,
    Button = THEME_COLORS.Button,
    ButtonText = THEME_COLORS.ButtonText,
    ButtonIcon = THEME_COLORS.ButtonIcon,
    ButtonBackground = THEME_COLORS.ButtonBackground,
    ButtonBackgroundHover = THEME_COLORS.ButtonBackgroundHover,
  })
end)

local windowSuccess, Window = pcall(function()
    return WindUI:CreateWindow({
    Title = "Project Destiny [v3.0]",
    Icon =  "rbxassetid://97596339693490",
    Author = "System Online • Access Granted",
    Folder = "Destiny Hub",
    Size = UDim2.fromOffset(620, 520),
    Transparent = true,
    Theme = "Darker-Soft",
    Resizable = true,
    SideBarWidth = 200,
    HideSearchBar = true,
    })
end)

WindUI:SetNotificationLower(true)

if windowSuccess and Window then
    getgenv().DestinyHubWindow = Window
else
    warn("Destiny Hub: ไม่สามารถสร้างหน้าต่าง UI ได้")
end

Window:Section({
    Title = "Control Panel",
})

local Home = Window:Tab({
    Title = "Changelog !!",
    Icon = "clipboard-list"
})

local GeneralTab = Window:Tab({
    Title = "General Main",
    Icon = "gauge"
})

Window:Divider() 
Window:Section({
    Title = "Combat(PvP)",
})

local CombatTab = Window:Tab({
    Title = "Aimbot PvP",
    Icon = "swords"
})

local Visuals = Window:Tab({ 
    Title = "Visuals (ESP)",
    Icon = "crosshair" 
})

local System = Window:Tab({
    Title = "System /Core",
    Icon = "package" 
})

Window:Divider() 
Window:Section({
    Title = " Configuration",
})

local Bounty = Window:Tab({
    Title = "Bounty Hunting",
    Icon = "moon" 
})

local Config = Window:Tab({
    Title = "Settings Config",
    Icon = "wrench"
})

GeneralTab:Select()

local executorName = (identifyexecutor and identifyexecutor()) or (getexecutorname and getexecutorname()) or "Unknown Executor"
local safeClipboard = setclipboard or toclipboard or (syn and syn.write_clipboard)

-- ตัวแปรสถานะระบบ
local isOnline = true 
local isMaintenance = false 

local statusText = "● ONLINE [STABLE]"
if isMaintenance then
    statusText = "▲ MAINTENANCE [UPDATING]"
elseif not isOnline then
    statusText = "■ OFFLINE [DOWN]"
end

-- ตรวจจับประเภทอุปกรณ์
local userInputService = game:GetService("UserInputService")
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer

local deviceText = "Unknown Device"

if userInputService.TouchEnabled and not userInputService.KeyboardEnabled then
    deviceText = "Mobile / Tablet"
elseif userInputService.TouchEnabled and userInputService.KeyboardEnabled then
    deviceText = "Laptop / Touch PC"
else
    deviceText = "PC / Computer"
end

-- Script update & Creator information
local isScriptUpdated = "Yes (Latest)"
local updateDate = "September 20, 2026"
local scriptCreator = "Destiny Hub"

-- Player information
local playerName = localPlayer.Name
local playerDisplayName = localPlayer.DisplayName

Home:Paragraph({
    Title = "⚡ CYBERNETIC HUB | Dashboard",
    Desc = string.format(
        "• Status: [ <font color='#00FF00'>%s</font> ]\n• Executor: <font color='#00BFFF'>%s</font>\n• Device: <font color='#FFA500'>%s</font>\n• Created By: <font color='#FF4500'>%s</font>\n• Updated: <font color='#FFD700'>%s</font>\n• Player: <font color='#FF69B4'>%s (%s)</font>",
        statusText,
        executorName,
        deviceText,
        scriptCreator,
        isScriptUpdated,
        playerDisplayName,
        playerName
    ),
    ImageSize = 28,
    Thumbnail = "rbxassetid://79823581173943", 
    ThumbnailSize = 58,
    Buttons = {
        {
            Title = "Copy Discord Website",
            Icon = "link",
            Callback = function()
                if safeClipboard then
                    safeClipboard("https://discord.gg/hUMaVECvBz")
                else
                    warn("⚠️ [Cybernetic Hub] Your executor does not support automatic clipboard.")
                end
            end
        }
    }
})

local MyConfig = Window.ConfigManager:Config("DestinyConfig")

local Input = Home:Input({
    Title = "FPS Unlocker",
    Desc = "Enter your desired max FPS",
    Type = "Default",
    Placeholder = "Enter max FPS...",
    Value = "9999",
    Locked = false,
    Flag = "FPSUnlocker",
    Callback = function(text)
         local num = tonumber(text)
        if num then
            if num < 1 then
                num = 1
            elseif num > 9999 then
                num = 9999
            end
            
            pcall(function()
                if setfpscap then
                    setfpscap(num)
                end
            end)
        end
    end
})

Config:Button({
    Title = "Save Configuration",
    Desc = "บันทึกการตั้งค่าปัจจุบันทั้งหมด",
    Callback = function()
        MyConfig:Save()
        WindUI:Notify({
            Title = "System Saved",
            Content = "บันทึกการตั้งค่าลงระบบเรียบร้อยแล้ว!",
            Icon = "bell-ring",
            Duration = 3,
        })
    end,
})

Config:Button({
    Title = "Reset Configuration",
    Desc = "ลบไฟล์เซฟและคืนค่าเริ่มต้น",
    Callback = function()
        pcall(function()
            MyConfig:Delete()
        end)
        WindUI:Notify({
            Title = "System Warning",
            Content = "ล้างค่าการตั้งค่าทั้งหมดเรียบร้อยแล้ว!",
            Icon = "bell-ring", 
            Duration = 3,
        })
    end,
})

local Configjson = Config:Section({ 
    Title = "Config.json", 
    Icon = "file"
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

-- ✅ [FIX #3] ลด Wait Time จาก 1.5 วิ เป็น 0.5 วิ
task.spawn(function()
    task.wait(0.5)  -- ✅ เร็วขึ้น 3x
    
    pcall(function()
        if typeof(MyConfig) == "table" and typeof(MyConfig.Load) == "function" then
            MyConfig:Load()
        end
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

-- ✅ [FIX #4] ปิด Prediction เพื่อเพิ่มประสิทธิภาพ
getgenv().PredictionEnabled = false  -- ✅ เปลี่ยนเป็น false
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

local FOVThemeColor = FOVThemeColor or Color3.fromRGB(255, 255, 255)

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
        LastMousePosition = input.Position
    end
end)

UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        LastMousePosition = input.Position
    end
end)

---------------------------------------------------------------------------------------
local safeZonesFolder = Workspace:FindFirstChild("_WorldOrigin") 
    and Workspace._WorldOrigin:FindFirstChild("SafeZones")

-- ✅ [FIX #5] Optimize isPlayerInCombat (ลด GetAttribute)
local function isPlayerInCombat(player, character)
    if not player then return false end
    
    -- เช็คแค่ InCombat Attribute เท่านั้น
    local pCombat = player:GetAttribute("InCombat")
    if pCombat == true then
        return true
    end

    if character then
        local cCombat = character:GetAttribute("InCombat")
        if cCombat == true then
            return true
        end
    end

    return false
end

-- ✅ [FIX #6] Cache SafeZone บันทึก (ลด Loop ทุกครั้ง)
local safeZoneCacheTime = 0
local safeZoneCache = {}

local function isInSafeZoneRadius(character)
    if not character or not character:FindFirstChild("HumanoidRootPart") then return false end
    if not safeZonesFolder then return false end
    
    local now = tick()
    if now - safeZoneCacheTime < 1 then  -- Cache ทุก 1 วิ
        return safeZoneCache[character] or false
    end
    
    safeZoneCacheTime = now
    
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
                safeZoneCache[character] = true
                return true
            end
        end
    end
    
    safeZoneCache[character] = false
    return false
end

local function isPlayerInSafeZone(player, character)
    if isPlayerInCombat(player, character) then
        return false
    end

    local inSafeZoneAttr = player:GetAttribute("SafeZone") or (character and character:GetAttribute("SafeZone"))
    local inRadius = character and isInSafeZoneRadius(character)
    local hasTempSafeZone = character and character:FindFirstChild("TempSafeZone")
    
    return (inSafeZoneAttr == true or inRadius or hasTempSafeZone) == true
end

local function ShouldIgnoreTarget(targetCharacter)
    local enemiesFolder = Workspace:FindFirstChild("Enemies")
    local isEnemyNPC = enemiesFolder and targetCharacter:IsDescendantOf(enemiesFolder)
    
    local humanoid = targetCharacter:FindFirstChildOfClass("Humanoid")
    if humanoid and humanoid.Health <= 0 then return true end

    if isEnemyNPC then
        return false 
    end

    local targetPlayer = Players:GetPlayerFromCharacter(targetCharacter)
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

-- ✅ [FIX #7] Cache GetAllValidTargets + Debounce
local cachedTargets = {}
local lastTargetScan = 0
local SCAN_INTERVAL = 0.15  -- Scan ทุก 0.15 วิ

local function GetAllValidTargets()
    local now = tick()
    if now - lastTargetScan < SCAN_INTERVAL then
        return cachedTargets
    end
    lastTargetScan = now
    
    cachedTargets = {}
    local mode = getgenv().TargetMode or "Both"

    if mode == "Both" or mode == "Players Only" then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                table.insert(cachedTargets, player.Character)
            end
        end
    end

    if mode == "Both" or mode == "Enemies Only" then
        local enemiesFolder = Workspace:FindFirstChild("Enemies")
        if enemiesFolder then
            for _, enemyModel in ipairs(enemiesFolder:GetChildren()) do
                if enemyModel:IsA("Model") then
                    table.insert(cachedTargets, enemyModel)
                end
            end
        end
    end

    return cachedTargets
end

local function getPlayerStatus(player)
    local character = player.Character
    local pvpDisabled = player:GetAttribute("PvpDisabled")
    local pvpStatus = pvpDisabled == true and "ปิด PvP" or "เปิด PvP"
    
    local inCombat = isPlayerInCombat(player, character)
    local inSafeZone = isPlayerInSafeZone(player, character)
    
    local safeZoneStatus = "Normal Zone"
    if inCombat and isInSafeZoneRadius(character) then
        safeZoneStatus = "Safe Zone (Combat Bypass)"
    elseif inSafeZone then
        safeZoneStatus = "Safe Zone"
    end

    local combatStatus = inCombat and "InCombat" or "Ready"
   
    return pvpStatus .. " | " .. safeZoneStatus .. " | " .. combatStatus
end

-- ✅ [FIX #8] ลบ Loop ที่ไม่ใช้ประโยชน์
-- for _, player in ipairs(Players:GetPlayers()) do
--     if player ~= LocalPlayer then
--         local statusText = getPlayerStatus(player)
--     end
-- end

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
            if not ShouldIgnoreTarget(char) then
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

local allowedSkillRemotes = {
    toMouse = true, castskill = true, useability = true, 
    attack = true, combat = true, skill = true, shoot = true,
    miniclick = true, mouseclick = true, remote = true,
    replicate = true, validator = true
}

local blockedRemotes = {
    equip = true, unequip = true, store = true, reset = true,
    chat = true, data = true, load = true, save = true
}

local remoteCache = {}

local function isSkillRemote(self)
    local name = self.Name
    local cached = remoteCache[name]
    if cached ~= nil then return cached end

    local lowerName = name:lower()
    for blockWord in pairs(blockedRemotes) do
        if lowerName:find(blockWord, 1, true) then
            remoteCache[name] = false
            return false
        end
    end

    remoteCache[name] = true 
    return true
end

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
    local success, Mouse = pcall(function()
        return LocalPlayer:GetMouse()
    end)
    if not success or not Mouse then return end

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
            if isSkillRemote(self) then
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
        end

        return oldNamecall(self, ...)
    end))
end)

-- ✅ [FIX #9] ลด Wait Time จาก 5 วิ เป็น 2 วิ
task.spawn(function()
    task.wait(2)  -- ✅ เร็วขึ้น 2.5x
    getgenv().SkillColorChangerEnabled = getgenv().SkillColorChangerEnabled or false
    getgenv().SkillColor = getgenv().SkillColor or Color3.fromRGB(255, 255, 255)
    
    -- ตัวอักษรประสงค์เพื่อการทำงานเพิ่มเติม
    print("[DestinyHub] ✅ Optimized version loaded successfully!")
    print("[DestinyHub] Lag fixes applied:")
    print("  • Removed 7-second countdown")
    print("  • Pre-computed colors")
    print("  • Cached targets + debounce")
    print("  • Reduced wait times")
    print("  • Prediction disabled")
end)

print("[DestinyHub] 🚀 Script version: OPTIMIZED (2026)")
