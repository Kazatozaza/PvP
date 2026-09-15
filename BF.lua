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
    Title = "Main - 2",
})

local Home = Window:Tab({
    Title = "How to",
    Icon = "house"
})


local GeneralTab = Window:Tab({
    Title = "General",
    Icon = "gauge"
})



Window:Divider() 
Window:Section({
    Title = "Combat",
})

local CombatTab = Window:Tab({
    Title = "Combat",
    Icon = "swords"
})

local Visuals = Window:Tab({
    Title = "Visuals",
    Icon = "crosshair" 
})

local Macro = Window:Tab({
    Title = "Macro",
    Icon = "mouse-pointer" 
})



Window:Divider() 
Window:Section({
    Title = "Server & Config",
})

local Server = Window:Tab({
    Title = "Server World",
    Icon = "terminal"
})

local Config = Window:Tab({
    Title = "Settings Config",
    Icon = "wrench"
})

GeneralTab:Select()

-- Minimalist Monochrome Status Tags with Lucide String Icons
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")

-- FPS Counter Setup
local FPSTag = Window:Tag({
    Title = "FPS: --",
    Icon = "gauge",
    Color = Color3.fromRGB(240, 240, 240),
})

local frameCount, lastUpdate = 0, os.clock()

RunService.RenderStepped:Connect(function()
frameCount = frameCount + 1
    local now = os.clock()
    local elapsed = now - lastUpdate
    
    if elapsed >= 0.5 then
        local fps = math.floor(frameCount / elapsed)
        FPSTag:SetTitle(string.format("FPS: %d", fps))
        
        frameCount = 0
        lastUpdate = now
    end
end)

-- Ping Counter Setup
local PingTag = Window:Tag({
    Title = "Ping: --ms",
    Icon = "wifi",
    Color = Color3.fromRGB(180, 180, 180),
})

task.spawn(function()
    local dataPing = Stats.Network.ServerStatsItem:FindFirstChild("Data Ping")
    
    while true do
        local success, ping = pcall(function()
            if dataPing then
                return math.floor(dataPing:GetValue())
            end
            return math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
        end)
        
        if success and ping then
            PingTag:SetTitle(string.format("Ping: %dms", ping))
        end
        
        task.wait(1)
    end
end)


-- ตรวจสอบฟังก์ชันพื้นฐานเพื่อความปลอดภัย
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

-- สร้าง Paragraph แบบจัดเรียงเท่ากันและล้ำสมัย
Home:Paragraph({
    Title = "",
    Desc = string.format(
        statusText,
        executorName
    ),
    ImageSize = 28,
    Thumbnail = "rbxassetid://130312549112790", 
    ThumbnailSize = 78,
    Buttons = {
        {
            Title = "Copy Official Website",
            Icon = "link",
            Callback = function()
                if safeClipboard then
                    safeClipboard("https://astonishing-biscotti-c152f5.netlify.app/")
                else
                    warn("⚠️ [Cybernetic Hub] ตัวรันไม่รองรับฟังก์ชันคัดลอกอัตโนมัติ")
                end
            end
        }
    }
})

local AimSection = Home:Section({ Title = "-----------------------------------------" })

Home:Button({
    Title = "Reset All Stats",
    Desc = "Instantly resets all your character stats, giving you the freedom to rebuild your specialized combat build.",
    Callback = function()
        local args = {
            "BlackbeardReward",
            "Refund",
            "2"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    end
})

Home:Button({
    Title = "Pirates",
    Desc = "Set sail on the open seas as a fierce pirate, seeking ultimate freedom, legendary bounties, and thrilling adventures.",
    Callback = function()
        local args = {
            "SetTeam2",
            "Pirates"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    end
})

Home:Button({
    Title = "Marines",
    Desc = "Enlist in the prestigious Marine forces to uphold justice, maintain world order, and hunt down dangerous outlaws.",
    Callback = function()
        local args = {
            "SetTeam2",
            "Marines"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    end
})

local MyConfig = Window.ConfigManager:Config("DestinyConfig")

local ConfigSection = Config:Section({ Title = "Configuration Manager" })

-- ปุ่ม Save
Config:Button({
    Title = "Save Configuration",
    Description = "บันทึกการตั้งค่าปัจจุบันทั้งหมด",
    Callback = function()
        MyConfig:Save()
        WindUI:Notify({
            Title = "System Saved",
            Content = "บันทึกการตั้งค่าลงระบบเรียบร้อยแล้ว!",
            Icon = "bell-ring", -- ไอคอนกระดิ่งสั่นแจ้งเตือน
            Duration = 3,
        })
    end,
})

-- ปุ่ม Reset
Config:Button({
    Title = "Reset Configuration",
    Description = "ลบไฟล์เซฟและคืนค่าเริ่มต้น",
    Callback = function()
        pcall(function()
            MyConfig:Delete()
        end)
        WindUI:Notify({
            Title = "System Warning",
            Content = "ล้างค่าการตั้งค่าทั้งหมดเรียบร้อยแล้ว!",
            Icon = "bell-ring", -- ไอคอนสามเหลี่ยมแจ้งเตือน
            Duration = 3,
        })
    end,
})


-- โหลดค่าอัตโนมัติเมื่อเปิดสคริปต์
task.spawn(function()
    task.wait()
    pcall(function()
        MyConfig:Load()
    end)
end)


getgenv().FOVRadius = getgenv().FOVRadius or 300
getgenv().MaxDistance = getgenv().MaxDistance or 1000
getgenv().SilentAimEnabled = getgenv().SilentAimEnabled ~= false and true
getgenv().ShowFOV = getgenv().ShowFOV ~= false and true
getgenv().ShowTracer = getgenv().ShowTracer ~= false and true
getgenv().CurrentTarget = nil
getgenv().FOVPositionMode = getgenv().FOVPositionMode or "Middle" 
getgenv().LockedPartName = "Head"

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

-- กำหนดสี (เผื่อกรณีลืมประกาศตัวแปร FOVThemeColor ด้านบน)
local FOVThemeColor = FOVThemeColor or Color3.fromRGB(255, 255, 255)

-- สร้างวงกลม FOV
local FOVUI = Instance.new("Frame")
FOVUI.Name = "FOVCircle"
FOVUI.AnchorPoint = Vector2.new(0.5, 0.5)
FOVUI.BackgroundTransparency = 1
FOVUI.Visible = false -- เปลี่ยนเป็น true ให้เห็นได้เลย หรือจะปรับเป็น false ตามโค้ดเดิมก็ได้ครับ
FOVUI.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = FOVUI

local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 1.5
UIStroke.Color = FOVThemeColor
UIStroke.Transparency = 0.3
UIStroke.Parent = FOVUI

-- ✨ เพิ่มจุดตรงกลาง (Center Dot)
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


local Snapline = Instance.new("Frame")
Snapline.Name = "Line"
Snapline.AnchorPoint = Vector2.new(0, 0.5)
Snapline.Size = UDim2.new(0, 0, 0, 2)
Snapline.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Snapline.BorderSizePixel = 0
Snapline.Visible = false
Snapline.Parent = ScreenGui

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
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

local safeZonesFolder = Workspace:FindFirstChild("_WorldOrigin") 
    and Workspace._WorldOrigin:FindFirstChild("SafeZones")

-- 1. ฟังก์ชันเช็คสถานะ InCombat (ปรับปรุงให้แม่นยำ ตรวจสอบทุกรูปแบบ)
local function isPlayerInCombat(player, character)
    if not player then return false end
    
    -- เช็ค Attribute ใน Player (รองรับ Boolean, Number, String, และ Combat Timer)
    local pCombat = player:GetAttribute("InCombat") or player:GetAttribute("Combat") or player:GetAttribute("CombatTag")
    if pCombat == true or pCombat == 1 or pCombat == "1" then
        return true
    end
    
    local combatTime = player:GetAttribute("CombatTimer") or player:GetAttribute("InCombatTime")
    if type(combatTime) == "number" and combatTime > workspace:GetServerTimeNow() then
        return true
    end

    -- เช็คใน Character
    if character then
        local cCombat = character:GetAttribute("InCombat") or character:GetAttribute("Combat") or character:GetAttribute("CombatTag")
        if cCombat == true or cCombat == 1 or cCombat == "1" then
            return true
        end

        -- เช็ค Value Object ชั่วคราวในตัวละคร (BoolValue, NumberValue, StringValue)
        local combatObj = character:FindFirstChild("InCombat") 
            or character:FindFirstChild("Combat") 
            or character:FindFirstChild("CombatTag")
            or character:FindFirstChild("PvpTag")

        if combatObj then
            if combatObj:IsA("BoolValue") and combatObj.Value == true then
                return true
            elseif combatObj:IsA("NumberValue") and combatObj.Value > 0 then
                return true
            elseif combatObj:IsA("StringValue") and combatObj.Value ~= "" then
                return true
            elseif combatObj:IsA("ValueBase") then
                return true
            end
        end
    end

    return false
end

-- 2. ฟังก์ชันเช็คว่าตัวละครอยู่ใน Safe Zone ทรงกลมหรือไม่
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

-- 3. ฟังก์ชันเช็คสถานะ Safe Zone (ถ้าติด InCombat อยู่ จะไม่นับว่า Safe)
local function isPlayerInSafeZone(player, character)
    if isPlayerInCombat(player, character) then
        return false
    end

    local inSafeZoneAttr = player:GetAttribute("SafeZone") or (character and character:GetAttribute("SafeZone"))
    local inRadius = character and isInSafeZoneRadius(character)
    local hasTempSafeZone = character and character:FindFirstChild("TempSafeZone")
    
    return (inSafeZoneAttr == true or inRadius or hasTempSafeZone) == true
end

-- 4. เช็คทีมและสถานะเป้าหมาย (สำหรับ Aimbot / Target Targeting)
local function ShouldIgnoreTarget(targetCharacter)
    -- เช็คว่าเป็นมอนสเตอร์ใน Enemies หรือไม่
    local enemiesFolder = Workspace:FindFirstChild("Enemies")
    local isEnemyNPC = enemiesFolder and targetCharacter:IsDescendantOf(enemiesFolder)
    
    local humanoid = targetCharacter:FindFirstChildOfClass("Humanoid")
    if humanoid and humanoid.Health <= 0 then return true end

    -- ถ้าเป็นมอนสเตอร์ NPC ให้ข้ามเงื่อนไขผู้เล่น
    if isEnemyNPC then
        return false -- ไม่เมินมอนสเตอร์ตัวนี้ (สามารถล็อคเป้าได้)
    end

    -- เงื่อนไขเดิมสำหรับผู้เล่น (Players)
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

local function GetAllValidTargets()
    local targets = {}
    local mode = getgenv().TargetMode or "Both"

    -- 1. ถ้าเลือก Players หรือ Both ให้ดึงข้อมูลผู้เล่น
    if mode == "Both" or mode == "Players Only" then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                table.insert(targets, player.Character)
            end
        end
    end

    -- 2. ถ้าเลือก Enemies หรือ Both ให้ดึงข้อมูลมอนสเตอร์จาก Workspace.Enemies
    if mode == "Both" or mode == "Enemies Only" then
        local enemiesFolder = Workspace:FindFirstChild("Enemies")
        if enemiesFolder then
            for _, enemyModel in ipairs(enemiesFolder:GetChildren()) do
                if enemyModel:IsA("Model") then
                    table.insert(targets, enemyModel)
                end
            end
        end
    end

    return targets
end


-- 5. ฟังก์ชันดึงสถานะสำหรับ ESP
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

-- ตัวอย่างการแสดงผล ESP
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        local statusText = getPlayerStatus(player)
    end
end

-- กำหนดจุดอ้างอิง (กลางจอ หรือ ตามนิ้ว)
local function GetReferencePosition()
    local viewportSize = Camera.ViewportSize
    local mode = tostring(getgenv().FOVPositionMode):lower()
    
    if mode == "mouse/touch" or mode == "mousetouch" or mode == "mouse" then
        return LastMousePosition
    else
        return Vector2.new(viewportSize.X / 2, viewportSize.Y / 2)
    end
end

-- คำนวณพรีดิกต์ตำแหน่งเป้าหมายเคลื่อนที่
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
    -- ป้องกันค่า getgenv().FOVRadius เป็น nil
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
    displayedUiColor = displayedUiColor:Lerp(currentUiColor, math.clamp(dt * 20, 0, 1))

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

    if FOVUI then
        if mode == "360°" or mode == "180°" then
            FOVUI.Visible = false
        else
            FOVUI.Visible = (getgenv().ShowFOV == true)
            if FOVUI.Visible then
                FOVUI.Position = UDim2.new(0, refPos.X, 0, refPos.Y)
                local size = (getgenv().FOVRadius or 100) * 2
                FOVUI.Size = UDim2.new(0, size, 0, size)
                pcall(function() FOVUI.Color = displayedUiColor end)
                pcall(function() FOVUI.BackgroundColor3 = displayedUiColor end)
            end
        end
    end

    if not getgenv().SilentAimEnabled and not getgenv().CamlockEnabled then
        getgenv().CurrentTarget = nil
        if Snapline then Snapline.Visible = false end
        return
    end

    local bestTarget = nil
    local shortestDistance = math.huge
    local maxDistance = getgenv().MaxDistance or 1000
    local validTargets = GetAllValidTargets()

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

    if getgenv().CamlockEnabled and getgenv().CurrentTarget then
        local success, targetPos = pcall(function()
            return GetPredictedPosition(getgenv().CurrentTarget)
        end)
        if success and targetPos then
            camera.CFrame = CFrame.new(camera.CFrame.Position, targetPos)
        end
    end

    -- จุดที่แก้ไข: คำนวณการแสดงผล Snapline แบบ UI Frame ให้แสดงผลเส้นตรงได้-- ✨ ระบบแสดงเส้น Tracer / Snapline ปรับจุดเริ่มต้นให้อยู่กลางตัว/หัวพอดี
    if getgenv().CurrentTarget and getgenv().ShowTracer and Snapline then
        local targetPart = getgenv().CurrentTarget
        
        if typeof(targetPart) == "Instance" and targetPart:IsA("Model") then
            targetPart = targetPart:FindFirstChild("HumanoidRootPart") or targetPart.PrimaryPart or targetPart:FindFirstChild("Head")
        end

        if targetPart and (targetPart:IsA("BasePart") or targetPart:IsA("Model")) then
            local partPos = targetPart:IsA("BasePart") and targetPart.Position or targetPart:GetPivot().Position
            local targetScreenPos, targetOnScreen = camera:WorldToViewportPoint(partPos)

            if targetScreenPos.Z > 0 and myRoot then
                -- ปรับความสูงตรง Vector3.new(0, 2, 0) เพื่อขยับจุดเริ่มต้นขึ้น (ถ้ายังต่ำไปให้เพิ่มเลข 2 เป็น 2.5 หรือ 3)
                local myChestPos = myRoot.Position + Vector3.new(0, 4, 0)
                local myScreenPos = camera:WorldToViewportPoint(myChestPos)
                local startPos = Vector2.new(myScreenPos.X, myScreenPos.Y)

                local endPos = Vector2.new(targetScreenPos.X, targetScreenPos.Y)
                local distance = (endPos - startPos).Magnitude
                local centerPos = (startPos + endPos) / 2
                local angle = math.atan2(endPos.Y - startPos.Y, endPos.X - startPos.X)

                Snapline.AnchorPoint = Vector2.new(0.5, 0.5)
                Snapline.Position = UDim2.new(0, centerPos.X, 0, centerPos.Y)
                Snapline.Size = UDim2.new(0, distance, 0, getgenv().TracerThickness or 1.5)
                Snapline.Rotation = math.deg(angle)
                Snapline.BackgroundColor3 = displayedUiColor
                Snapline.BackgroundTransparency = getgenv().TracerTransparency or 0.3
                Snapline.Visible = true
            else
                Snapline.Visible = false
            end
        else
            Snapline.Visible = false
        end
    else
        if Snapline then Snapline.Visible = false end
    end
end)



local HideShowUI = Config:Section({ Title = "Settings" })

local Keybind = Config:Keybind({
    Title = "Keybind SilentAim",
    Desc = "ปุ่มลัดสำหรับเปิด/ปิดระบบ Silent Aim",
    Flag = "KeybindSilentAim", 
    Value = "", -- default key
    Callback = function(key)
        getgenv().SilentAimEnabled = not getgenv().SilentAimEnabled
        
        if not getgenv().SilentAimEnabled and not getgenv().CamlockEnabled then
            getgenv().CurrentTarget = nil
            if Snapline then 
                Snapline.Visible = false 
            end
        end
    end,
})
















-- แดช วิ่งเร็วขึ้น กระโดดสูงขึ้น
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- ==================== 1. ตัวแปรสถานะและค่าเริ่มต้น ====================
local JumpEnabled = false
local JumpPercentage = 100

local DashEnabled = false
local DashPercentage = 100

-- ==================== 2. ฟังก์ชันการทำงานหลัก (Core Functions) ====================

-- ฟังก์ชันหาตัวละคร (รองรับทั้ง Character ปกติและ Folder แยก)
local function GetCharacter()
    local charactersFolder = workspace:FindFirstChild("Characters")
    if charactersFolder then
        local char = charactersFolder:FindFirstChild(LocalPlayer.Name)
        if char then return char end
    end
    return LocalPlayer.Character
end

-- ฟังก์ชันอัปเดตระบบกระโดด
local function UpdateJump(hum)
    hum.UseJumpPower = true
    hum.JumpPower = 50 * (JumpPercentage / 100)
end

-- ฟังก์ชันอัปเดตระบบพุ่ง (Dash)
local function UpdateDash(character, humanoid, deltaTime)
    if humanoid.MoveDirection.Magnitude > 0 then
        local baseSpeed = 25 
        local speedMultiplier = (DashPercentage / 100)
        character:TranslateBy(humanoid.MoveDirection * baseSpeed * speedMultiplier * deltaTime)
    end
end

-- ==================== 3. ลูปการทำงานเบื้องหลัง (RunService Loops) ====================

-- รวมลูปทำงานไว้ใน RenderStepped เดียวเพื่อประสิทธิภาพที่ดีขึ้น
RunService.RenderStepped:Connect(function(deltaTime)
    local character = GetCharacter()
    if not character then return end

    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end

    -- จัดการระบบกระโดด
    if JumpEnabled then
        UpdateJump(humanoid)
    else
        if humanoid.JumpPower ~= 50 then
            humanoid.JumpPower = 50
        end
    end

    -- จัดการระบบพุ่ง (Dash)
    if DashEnabled then
        UpdateDash(character, humanoid, deltaTime)
    end
end)



--ฮาคิ

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

local Remotes = ReplicatedStorage:FindFirstChild("Remotes")
local CommF = Remotes and Remotes:FindFirstChild("CommF_")

local function CheckAndEnableBuso()
    local character = LocalPlayer.Character
    if not character then return end
    
    local hasBuso = character:FindFirstChild("HasBuso")
    
    if not hasBuso then
        if CommF then
            pcall(function()
                CommF:InvokeServer("Buso")
            end)
        end
    else
        if hasBuso:IsA("BoolValue") and not hasBuso.Value then
            if CommF then
                pcall(function()
                    CommF:InvokeServer("Buso")
                end)
            end
        end
    end
end


-- เปิดเผ่า v3


local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

local commE = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommE")
local autoRaceConnection = nil

local function SetAutoRaceAbility(state)
    _G.AutoRaceAbilityRunning = state
    
    if not state then
        if autoRaceConnection then
            autoRaceConnection:Disconnect()
            autoRaceConnection = nil
        end
        return
    end
    
    
    local lastCheck = 0
    autoRaceConnection = RunService.Heartbeat:Connect(function()
        if not _G.AutoRaceAbilityRunning then return end
        
        local currentTime = tick()
        if currentTime - lastCheck < 0.5 then return end
        lastCheck = currentTime
        
        pcall(function()
            local character = player.Character
            if not character or not character:FindFirstChild("HumanoidRootPart") then return end
            
            local args = {
                "ActivateAbility"
            }
            commE:FireServer(unpack(args))
        end)
    end)
end


-- เปิดเผ่า v4


local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

local autoRaceV4Connection = nil

local function SetAutoRaceV4(state)
    _G.AutoRaceV4Running = state
    
    if not state then
        if autoRaceV4Connection then
            autoRaceV4Connection:Disconnect()
            autoRaceV4Connection = nil
        end
        return
    end
    
    local lastCheck = 0
    autoRaceV4Connection = RunService.Heartbeat:Connect(function()
        if not _G.AutoRaceV4Running then return end
        
        local currentTime = tick()
        if currentTime - lastCheck < 0.1 then return end -- เช็คทุกๆ 0.5 วินาที ไม่ให้ส่งถี่เกินไป
        lastCheck = currentTime
        
        pcall(function()
            local character = player.Character
            if not character or not character:FindFirstChild("HumanoidRootPart") then return end
            
            -- ใช้รีโมท Awakening ของ V4 ที่คุณส่งมาตอนแรก
            local backpack = player:FindFirstChild("Backpack")
            local awakening = backpack and backpack:FindFirstChild("Awakening")
            local remoteFunction = awakening and awakening:FindFirstChild("RemoteFunction")
            
            if remoteFunction then
                local args = { true }
                remoteFunction:InvokeServer(unpack(args))
            end
        end)
    end)
end












-- ESP with SafeZone Integration (Modern & Optimized UI)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

local ESPConfig = {
    ShowName = true,
    ShowDistance = true,
    ShowLevel = true,
    ShowBounty = true,
    ShowHealth = true,
    ShowStatus = true,
    ShowAllTeams = false,
    Pirates = true,
    Marines = true,
}

-- โทนสีใหม่สไตล์ Modern Dark / Neon Accent (สบายตาและดูพรีเมียมขึ้น)
local COLORS = {
Pirates = Color3.fromRGB(255, 45, 45),       -- แดงสดเข้มข้น
    Marines = Color3.fromRGB(0, 150, 255),      -- ฟ้าไฮไลต์คมชัด
    Neutral = Color3.fromRGB(220, 220, 220),   -- ขาวเทาสว่าง
    White = Color3.fromRGB(255, 255, 255),
    HP = Color3.fromRGB(0, 255, 100),         -- เขียวสดใส
    HPBG = Color3.fromRGB(10, 10, 15),          -- พื้นหลังดำสนิท
    Level = Color3.fromRGB(255, 200, 0),       -- เหลืองทองสว่าง
    Bounty = Color3.fromRGB(255, 80, 180),     -- ชมพูนีออน
    PvPOn = Color3.fromRGB(50, 255, 50),        -- เขียวเรืองแสง
    PvPOff = Color3.fromRGB(255, 50, 80),      -- แดงเข้มตัดกันชัดเจน
    Combat = Color3.fromRGB(255, 220, 0),      -- เหลืองทองคำ
    SafeZoneOn = Color3.fromRGB(0, 220, 255),   -- ฟ้าไซเบอร์สว่าง
    SafeZoneOff = Color3.fromRGB(255, 120, 0),  -- ส้มประกาย
}

local safeZonesFolder = Workspace:FindFirstChild("_WorldOrigin") 
    and Workspace._WorldOrigin:FindFirstChild("SafeZones")

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
            else
                radius = math.max(zonePart.Size.X, zonePart.Size.Z) / 2
            end
            
            if (charPos - zonePos).Magnitude <= radius then
                return true
            end
        end
    end
    
    return false
end

local function GetTeamInfo(player)
    if ESPConfig.ShowAllTeams then
        local team = player.Team
        return team and team.Name or "Player", COLORS.White, true
    end

    local team = player.Team
    local teamName = team and team.Name or "Neutral"

    if teamName == "Pirates" then
        return "Pirates", COLORS.Pirates, ESPConfig.Pirates
    elseif teamName == "Marines" then
        return "Marines", COLORS.Marines, ESPConfig.Marines
    end

    return teamName, COLORS.Neutral, true
end

local function GetLevel(player)
    local data = player:FindFirstChild("Data")
    if data and data:FindFirstChild("Level") then return data.Level.Value end
    local leaderstats = player:FindFirstChild("leaderstats")
    if leaderstats and leaderstats:FindFirstChild("Level") then return leaderstats.Level.Value end
    return "?"
end

local function GetBounty(player)
    local leaderstats = player:FindFirstChild("leaderstats")
    if leaderstats then
        local bVal = leaderstats:FindFirstChild("Bounty/Honor")
        if bVal then return bVal.Value end
    end
    return 0
end

local function GetDetailedStatus(player)
    local pvpDisabled = player:GetAttribute("PvpDisabled")
    local pvpText = (pvpDisabled == true) and "OFF" or "ON"
    local pvpColor = (pvpDisabled == true) and COLORS.PvPOff or COLORS.PvPOn
    
    local inSafeZoneAttr = player:GetAttribute("SafeZone") or (player.Character and player.Character:GetAttribute("SafeZone"))
    local inRadius = player.Character and isInSafeZoneRadius(player.Character)
    local hasTempSafeZone = player.Character and player.Character:FindFirstChild("TempSafeZone")
    local inSafeZone = inSafeZoneAttr == true or inRadius or hasTempSafeZone
    
    local safeText = inSafeZone and "Safe" or "Normal"
    local safeColor = inSafeZone and COLORS.SafeZoneOn or COLORS.SafeZoneOff

    local inCombatVal = player:GetAttribute("InCombat")
    if player.Character then
        inCombatVal = inCombatVal or player.Character:GetAttribute("InCombat")
    end
    local isCombat = (inCombatVal == true or inCombatVal == 1 or inCombatVal == "1")
    local combatText = isCombat and "Combat" or "Ready"
    local combatColor = isCombat and COLORS.Combat or COLORS.White
    
    return pvpText, pvpColor, safeText, safeColor, combatText, combatColor
end

local function FormatNumber(number)
    local formatted = tostring(number)
    if type(number) == "number" then
        if number >= 1000000 then
            formatted = string.format("%.1fM", number / 1000000)
        elseif number >= 1000 then
            formatted = string.format("%.1fK", number / 1000)
        end
    end
    return formatted
end

local ActiveESPs = {}

local function UpdateAllESPVisibilities()
    for _, data in pairs(ActiveESPs) do
        if data and data.Gui then
            local container = data.Gui:FindFirstChild("Container")
            if container then
                local nameLbl = container:FindFirstChild("NameLabel")
                local pvpLbl = container:FindFirstChild("PvPLabel")
                local lvlLbl = container:FindFirstChild("LevelLabel")
                local bntLbl = container:FindFirstChild("BountyLabel")
                local hpBg   = container:FindFirstChild("HPBG")

                if nameLbl then nameLbl.Visible = ESPConfig.ShowName end
                if pvpLbl then pvpLbl.Visible = ESPConfig.ShowStatus end
                if lvlLbl then lvlLbl.Visible = ESPConfig.ShowLevel end
                if bntLbl then bntLbl.Visible = ESPConfig.ShowBounty end
                if hpBg then hpBg.Visible = ESPConfig.ShowHealth end
            end
        end
    end
end

local function CreateESP(player)
    if player == LocalPlayer then return end

    local connectionTeam, connectionHealth, connectionBounty, connectionCharacterAdded

    local function Cleanup()
        if connectionTeam then connectionTeam:Disconnect(); connectionTeam = nil end
        if connectionHealth then connectionHealth:Disconnect(); connectionHealth = nil end
        if connectionBounty then connectionBounty:Disconnect(); connectionBounty = nil end
        ActiveESPs[player] = nil
    end

    local function Setup(character)
        Cleanup()

        local head = character:FindFirstChild("Head") or character:WaitForChild("Head", 3)
        local humanoid = character:FindFirstChild("Humanoid") or character:WaitForChild("Humanoid", 3)

        if not head or not humanoid then return end

        local old = head:FindFirstChild("PlayerESP")
        if old then old:Destroy() end

        local teamName, teamColor, teamEnabled = GetTeamInfo(player)

        local gui = Instance.new("BillboardGui")
        gui.Name = "PlayerESP"
        gui.Adornee = head
        gui.Size = UDim2.fromOffset(260, 115)
        gui.StudsOffset = Vector3.new(0, 3.4, 0)
        gui.AlwaysOnTop = true
        gui.Enabled = teamEnabled
        gui.Parent = head

        local container = Instance.new("Frame")
        container.Name = "Container"
        container.Size = UDim2.new(1, 0, 1, 0)
        container.BackgroundTransparency = 1
        container.Parent = gui

        -- ปรับฟอนต์และสไตล์ตัวหนังสือให้คมชัดและดูแพงขึ้น
        local nameLabel = Instance.new("TextLabel")
        nameLabel.Name = "NameLabel"
        nameLabel.BackgroundTransparency = 1
        nameLabel.Size = UDim2.new(1, 0, 0, 20)
        nameLabel.Visible = ESPConfig.ShowName
        nameLabel.RichText = true
        nameLabel.TextSize = 13
        nameLabel.Font = Enum.Font.FredokaOne -- หรือใช้ Font.GothamBold ตามความชอบ
        nameLabel.TextStrokeTransparency = 0.3
        nameLabel.TextStrokeColor3 = Color3.fromRGB(10, 10, 15)
        nameLabel.Parent = container

        local pvpLabel = Instance.new("TextLabel")
        pvpLabel.Name = "PvPLabel"
        pvpLabel.BackgroundTransparency = 1
        pvpLabel.Size = UDim2.new(1, 0, 0, 16)
        pvpLabel.Position = UDim2.new(0, 0, 0, 22)
        pvpLabel.Visible = ESPConfig.ShowStatus
        pvpLabel.RichText = true
        pvpLabel.TextSize = 11
        pvpLabel.Font = Enum.Font.GothamMedium
        pvpLabel.TextStrokeTransparency = 0.4
        pvpLabel.TextStrokeColor3 = Color3.fromRGB(10, 10, 15)
        pvpLabel.Parent = container

        local levelLabel = Instance.new("TextLabel")
        levelLabel.Name = "LevelLabel"
        levelLabel.BackgroundTransparency = 1
        levelLabel.Size = UDim2.new(1, 0, 0, 16)
        levelLabel.Position = UDim2.new(0, 0, 0, 40)
        levelLabel.Visible = ESPConfig.ShowLevel
        levelLabel.Text = "⚡ LVL: " .. tostring(GetLevel(player))
        levelLabel.TextColor3 = COLORS.Level
        levelLabel.TextSize = 11
        levelLabel.Font = Enum.Font.GothamBold
        levelLabel.TextStrokeTransparency = 0.4
        levelLabel.TextStrokeColor3 = Color3.fromRGB(10, 10, 15)
        levelLabel.Parent = container

        local bountyLabel = Instance.new("TextLabel")
        bountyLabel.Name = "BountyLabel"
        bountyLabel.BackgroundTransparency = 1
        bountyLabel.Size = UDim2.new(1, 0, 0, 16)
        bountyLabel.Position = UDim2.new(0, 0, 0, 58)
        bountyLabel.Visible = ESPConfig.ShowBounty
        bountyLabel.Text = "💎 BOUNTY: " .. FormatNumber(GetBounty(player))
        bountyLabel.TextColor3 = COLORS.Bounty
        bountyLabel.TextSize = 11
        bountyLabel.Font = Enum.Font.GothamBold
        bountyLabel.TextStrokeTransparency = 0.4
        bountyLabel.TextStrokeColor3 = Color3.fromRGB(10, 10, 15)
        bountyLabel.Parent = container

        -- หลอดเลือดดีไซน์ใหม่ โค้งมน มินิมอล มีขอบเรืองแสงจางๆ
        local hpBG = Instance.new("Frame")
        hpBG.Name = "HPBG"
        hpBG.Size = UDim2.new(0.75, 0, 0, 6)
        hpBG.Position = UDim2.new(0.125, 0, 0, 80)
        hpBG.Visible = ESPConfig.ShowHealth
        hpBG.BackgroundColor3 = COLORS.HPBG
        hpBG.BorderSizePixel = 0
        hpBG.Parent = container

        local hpCornerBG = Instance.new("UICorner")
        hpCornerBG.CornerRadius = UDim.new(1, 0)
        hpCornerBG.Parent = hpBG

        local hpStroke = Instance.new("UIStroke")
        hpStroke.Thickness = 1
        hpStroke.Color = Color3.fromRGB(255, 255, 255)
        hpStroke.Transparency = 0.8
        hpStroke.Parent = hpBG

        local hp = Instance.new("Frame")
        hp.Name = "HP"
        hp.Size = UDim2.new(1, 0, 1, 0)
        hp.BackgroundColor3 = COLORS.HP
        hp.BorderSizePixel = 0
        hp.Parent = hpBG

        local hpCorner = Instance.new("UICorner")
        hpCorner.CornerRadius = UDim.new(1, 0)
        hpCorner.Parent = hp

        local function UpdateHealth(value)
            local maxHealth = humanoid.MaxHealth
            if maxHealth <= 0 then maxHealth = 1 end
            hp.Size = UDim2.new(math.clamp(value / maxHealth, 0, 1), 0, 1, 0)
        end

        local function UpdateDynamicInfo()
            _, teamColor, teamEnabled = GetTeamInfo(player)
            
            local distStr = ""
            if ESPConfig.ShowDistance and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head") then
                local myHead = LocalPlayer.Character.Head
                local distance = math.floor((myHead.Position - head.Position).Magnitude)
                distStr = string.format(" <font color=\"rgb(150,150,165)\">[%dm]</font>", distance)
            end

            nameLabel.Text = string.format("<font color=\"rgb(%d,%d,%d)\">[%s]</font> <font color=\"rgb(255,255,255)\">%s</font>%s", 
                math.floor(teamColor.R * 255), 
                math.floor(teamColor.G * 255), 
                math.floor(teamColor.B * 255), 
                teamName, 
                player.DisplayName,
                distStr
            )

            local pvpText, pvpColor, safeText, safeColor, combatText, combatColor = GetDetailedStatus(player)
            
            pvpLabel.Text = string.format("⚡ PvP:<font color=\"rgb(%d,%d,%d)\">%s</font> | <font color=\"rgb(%d,%d,%d)\">%s</font> | <font color=\"rgb(%d,%d,%d)\">%s</font>", 
                math.floor(pvpColor.R*255), math.floor(pvpColor.G*255), math.floor(pvpColor.B*255), pvpText,
                math.floor(safeColor.R*255), math.floor(safeColor.G*255), math.floor(safeColor.B*255), safeText,
                math.floor(combatColor.R*255), math.floor(combatColor.G*255), math.floor(combatColor.B*255), combatText
            )
        end

        UpdateDynamicInfo()
        UpdateHealth(humanoid.Health)
        
        ActiveESPs[player] = { Update = UpdateDynamicInfo, Head = head, Gui = gui }

        connectionHealth = humanoid.HealthChanged:Connect(UpdateHealth)

        local leaderstats = player:FindFirstChild("leaderstats")
        if leaderstats then
            local bVal = leaderstats:FindFirstChild("Bounty/Honor")
            if bVal then
                connectionBounty = bVal.Changed:Connect(function(newValue)
                    if bountyLabel and bountyLabel.Parent then
                        bountyLabel.Text = "💎 BOUNTY: " .. FormatNumber(newValue)
                    end
                end)
            end
        end

        connectionTeam = player:GetPropertyChangedSignal("Team"):Connect(function()
            if not gui.Parent then return end
            teamName, teamColor, teamEnabled = GetTeamInfo(player)
            gui.Enabled = teamEnabled
            UpdateDynamicInfo()
        end)
    end

    if player.Character then
        task.spawn(Setup, player.Character)
    end

    connectionCharacterAdded = player.CharacterAdded:Connect(Setup)

    player.Destroying:Connect(Cleanup)
end

RunService.RenderStepped:Connect(function()
    for _, data in pairs(ActiveESPs) do
        if data and data.Update then
            data.Update()
        end
    end
end)

for _, player in ipairs(Players:GetPlayers()) do
    CreateESP(player)
end

Players.PlayerAdded:Connect(CreateESP)

-- หนี
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local safeModeActive = false
local isSafeEscaping = false
local safeModePercent = 30
local safeStopPercent = 80
local flySpeed = 300

local function notify(title, text)
    WindUI:Notify({
        Title = title,
        Content = text,
        Icon = "shield-alert",
        Duration = 3,
    })
end

-- ฟังก์ชัน Noclip ภายในตัวสำหรับ Safe Mode
local function setSafeNoclip(state)
    local character = LocalPlayer.Character
    if character then
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = not state
            end
        end
    end
end

-- Safe Mode Ultra-Fast Execution Loop
RunService.Heartbeat:Connect(function()
    if not safeModeActive then return end
    
    local char = LocalPlayer.Character
    if not char then return end
    
    local hum = char:FindFirstChildOfClass("Humanoid")
    local hrp = char:FindFirstChild("HumanoidRootPart")
    
    if not hum or not hrp or hum.Health <= 0 then
        if isSafeEscaping then 
            isSafeEscaping = false 
            hum.PlatformStand = false
            setSafeNoclip(false)
        end
        return
    end
    
    local hpPercent = (hum.Health / hum.MaxHealth) * 100
    
    -- เงื่อนไขกระตุ้นการหนีฉุกเฉินทันที
    if hpPercent <= safeModePercent and not isSafeEscaping then
        isSafeEscaping = true
        setSafeNoclip(true)
        hrp.AssemblyLinearVelocity = Vector3.new(0, flySpeed, 0)
        hrp.AssemblyAngularVelocity = Vector3.zero
        char:PivotTo(hrp.CFrame + Vector3.new(0, 550, 0))
        hum.PlatformStand = true
        notify("Safe Mode", "Critical HP! Emergency teleport & high-speed flight activated!")
    end
    
    -- ล็อคความเร็วและพุ่งหนีกลางอากาศอย่างรวดเร็ว
    if isSafeEscaping then
        hum.PlatformStand = true
        setSafeNoclip(true)
        hrp.AssemblyLinearVelocity = Vector3.new(0, flySpeed, 0)
        hrp.AssemblyAngularVelocity = Vector3.zero
        
        -- หยุดหนีเมื่อเลือดกลับมาถึงเกณฑ์ปลอดภัย
        if hpPercent >= safeStopPercent then
            isSafeEscaping = false
            hum.PlatformStand = false
            setSafeNoclip(false)
            hrp.AssemblyLinearVelocity = Vector3.zero
            notify("Safe Mode", "HP fully restored. Resuming normal operations.")
        end
    end
end)


--วาปหาผู้เล่น
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

-- System Control Variables (Hardcore Config)
local FollowEnabled = false
local FollowDistance = 300
local TpBehindDistance = 5
local FollowKeybind = Enum.KeyCode.E

local currentTarget = nil
local FollowToggle -- ตัวแปรสำหรับอ้างอิงสถานะปุ่ม Toggle

-- อ้างอิงโฟลเดอร์ SafeZones
local safeZonesFolder = Workspace:FindFirstChild("_WorldOrigin") 
    and Workspace._WorldOrigin:FindFirstChild("SafeZones")

-- ฟังก์ชันเช็คว่าตัวละครอยู่ใน Safe Zone ทรงกลมหรือไม่
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

-- ฟังก์ชันเช็คสถานะ InCombat
local function isPlayerInCombat(targetPlayer, targetCharacter)
    local inCombatVal = targetPlayer:GetAttribute("InCombat")
    if targetCharacter then
        inCombatVal = inCombatVal or targetCharacter:GetAttribute("InCombat")
    end
    return (inCombatVal == true or inCombatVal == 1 or inCombatVal == "1")
end

-- ฟังก์ชันเช็คภาพรวม Safe Zone ของตัวละคร (อัปเดตใหม่: เช็ค InCombat ก่อน ถ้าติดสู้จะไม่นับว่าอยู่ Safe Zone)
local function isInAnySafeZone(targetPlayer, targetCharacter)
    if not targetCharacter then return false end

    -- ถ้าติด InCombat ให้มองว่าไม่ได้อยู่ใน Safe Zone ทันที
    if isPlayerInCombat(targetPlayer, targetCharacter) then
        return false 
    end

    local inSafeZoneAttr = targetPlayer:GetAttribute("SafeZone") or targetCharacter:GetAttribute("SafeZone")
    local inRadius = isInSafeZoneRadius(targetCharacter)
    local hasTempSafeZone = targetCharacter:FindFirstChild("TempSafeZone")
    
    return (inSafeZoneAttr == true) or inRadius or (hasTempSafeZone ~= nil)
end

-- ฟังก์ชันตรวจสอบเป้าหมาย (รวมการเช็ค Safe Zone แล้ว)
local function ShouldIgnoreTarget(targetCharacter)
    if not targetCharacter then return true end

    local humanoid = targetCharacter:FindFirstChildOfClass("Humanoid")
    if humanoid and humanoid.Health <= 0 then return true end

    -- เช็คว่าเป็นมอนสเตอร์ NPC หรือไม่
    local enemiesFolder = Workspace:FindFirstChild("Enemies")
    local isEnemyNPC = enemiesFolder and targetCharacter:IsDescendantOf(enemiesFolder)
    local targetPlayer = Players:GetPlayerFromCharacter(targetCharacter)

    -- กรองตาม TargetMode ที่ผู้เล่นเลือกจาก UI ซ้ำอีกรอบเพื่อความปลอดภัย
    local mode = getgenv().TargetMode or "Both"
    if mode == "Players Only" and isEnemyNPC then return true end
    if mode == "Enemies Only" and targetPlayer then return true end

    -- ถ้าเป็นมอนสเตอร์ NPC และผ่านโหมดมาแล้ว ให้ยิง/ล็อกได้เลย
    if isEnemyNPC then
        return false 
    end

    -- เงื่อนไขเช็คผู้เล่นตามปกติ (SafeZone, PvP, Team)
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

-- ฟังก์ชันรวมเช็คสถานะทั้งหมดของผู้เล่นสำหรับ ESP
local function getPlayerStatus(player)
    local character = player.Character
    local pvpDisabled = player:GetAttribute("PvpDisabled")
    local pvpStatus = pvpDisabled == true and "ปิด PvP" or "เปิด PvP"
    
    local inCombat = isPlayerInCombat(player, character)
    local inSafeZone = character and isInAnySafeZone(player, character) or false
    
    local safeZoneStatus = "Normal Zone"
    if inCombat and character and isInSafeZoneRadius(character) then
        safeZoneStatus = "Safe Zone (Combat Bypass)"
    elseif inSafeZone then
        safeZoneStatus = "Safe Zone"
    end

    local combatStatus = inCombat and "InCombat" or "Ready"
   
    return pvpStatus .. " | " .. safeZoneStatus .. " | " .. combatStatus
end

-- ตัวอย่างการวนลูปดึงค่ามาแสดงผลสำหรับทำ ESP
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        local statusText = getPlayerStatus(player)
    end
end
-- ค้นหาเป้าหมายที่ใกล้ที่สุด
local function GetClosestPlayerTarget()
    local character = LocalPlayer.Character
    local rootPart = character and character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return nil end

    local closestTarget = nil
    local shortestDistance = FollowDistance

    for _, otherPlayer in ipairs(Players:GetPlayers()) do
        if otherPlayer.Character and not ShouldIgnoreTarget(otherPlayer.Character) then
            local targetRoot = otherPlayer.Character:FindFirstChild("HumanoidRootPart")
            if targetRoot then
                local distance = (rootPart.Position - targetRoot.Position).Magnitude
                if distance < shortestDistance then
                    shortestDistance = distance
                    closestTarget = otherPlayer.Character
                end
            end
        end
    end

    return closestTarget
end

-- ปิดระบบ
local function DisableFollowSystem(notificationText)
    if not FollowEnabled then return end
    FollowEnabled = false
    currentTarget = nil

    if WindUI and WindUI.Notify then
        WindUI:Notify({
            Title = "Destiny Hub [HARDCORE]",
            Content = notificationText or "Target destroyed! System off.",
            Icon = "x-circle",
            Duration = 1.5,
        })
    end
    
    if FollowToggle and FollowToggle.Set then
        FollowToggle:Set(false)
    end
end

-- ลูปความเร็วสูง (RenderStepped)
RunService.RenderStepped:Connect(function()
    if not FollowEnabled then
        currentTarget = nil
        return
    end

    local character = LocalPlayer.Character
    local rootPart = character and character:FindFirstChild("HumanoidRootPart")
    local myHumanoid = character and character:FindFirstChild("Humanoid")

    if not rootPart or not myHumanoid or myHumanoid.Health <= 0 then return end

    if not currentTarget or ShouldIgnoreTarget(currentTarget) then
        currentTarget = GetClosestPlayerTarget()
    end

    if currentTarget then
        local targetRoot = currentTarget:FindFirstChild("HumanoidRootPart")
        local targetHumanoid = currentTarget:FindFirstChildOfClass("Humanoid")

        if targetHumanoid and targetHumanoid.Health <= 0 then
            DisableFollowSystem("Target eliminated! Switching...")
        elseif targetRoot then
            rootPart.CFrame = targetRoot.CFrame * CFrame.new(0, 0, TpBehindDistance)
        end
    end
end)

-- คีย์ลัดสำหรับเปิด/ปิดระบบ
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == FollowKeybind then
            FollowEnabled = not FollowEnabled 

            if WindUI and WindUI.Notify then
                WindUI:Notify({
                    Title = "Destiny Hub",
                    Content = FollowEnabled and "HARDCORE ON [LOCKED]" or "HARDCORE OFF",
                    Icon = FollowEnabled and "zap" or "zap-off",
                    Duration = 1.5,
                })
            end
            
            -- สั่งปิด/เปิดปุ่ม Toggle บนหน้าจอ UI ทันที
            if FollowToggle and FollowToggle.Set then
                FollowToggle:Set(FollowEnabled)
            end
            
            if not FollowEnabled then 
                currentTarget = nil 
            end
        end
    end
end)
























-- ฮิตBox


local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- ค่าคอนฟิกสำหรับขยายหัวโดยเฉพาะ
getgenv().HitboxEnabled = getgenv().HitboxEnabled or true
getgenv().HitboxSize = getgenv().HitboxSize or 18
getgenv().HitboxColor = getgenv().HitboxColor or Color3.fromRGB(96, 205, 255)
getgenv().HitboxShowBox = getgenv().HitboxShowBox or true

local function resetPlayerHitbox(character)
    if not character then return end
    local head = character:FindFirstChild("Head")
    if head then
        local originalSize = head:FindFirstChild("OriginalSize")
        if originalSize then
            head.Size = originalSize.Value
            originalSize:Destroy()
        end
        local selectionBox = head:FindFirstChild("CustomHitboxSelectionBox")
        if selectionBox then selectionBox:Destroy() end
        head.Transparency = 0
        head.CanCollide = true
        head.CastShadow = true
    end
end

-- ลูปการทำงานหลักเฉพาะหัว
RunService.RenderStepped:Connect(function()
    if not getgenv().HitboxEnabled then return end

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local character = player.Character
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            
            if humanoid and humanoid.Health > 0 then
                local head = character:FindFirstChild("Head")
                if head then
                    -- บันทึกขนาดเดิมเก็บไว้ครั้งแรก
                    local originalSize = head:FindFirstChild("OriginalSize")
                    if not originalSize then
                        originalSize = Instance.new("Vector3Value")
                        originalSize.Name = "OriginalSize"
                        originalSize.Value = head.Size
                        originalSize.Parent = head
                    end
                    
                    -- จัดการกรอบเส้น (SelectionBox)
                    local selectionBox = head:FindFirstChild("CustomHitboxSelectionBox")
                    if getgenv().HitboxShowBox then
                        if not selectionBox then
                            selectionBox = Instance.new("SelectionBox")
                            selectionBox.Name = "CustomHitboxSelectionBox"
                            selectionBox.Parent = head
                        end
                        selectionBox.Adornee = head
                        selectionBox.Color3 = getgenv().HitboxColor
                        selectionBox.LineThickness = 0.001
                    elseif selectionBox then
                        selectionBox:Destroy()
                    end
                    
                    -- ขยายขนาดหัวและปรับสถานะ
                    head.Size = Vector3.new(getgenv().HitboxSize, getgenv().HitboxSize, getgenv().HitboxSize)
                    head.Transparency = 1 
                    head.CanCollide = false
                    head.CastShadow = false
                end
            else
                resetPlayerHitbox(character)
            end
        end
    end
end)



--  ปุ่มทั้งหมด=================================================================



local AimSection = CombatTab:Section({ Title = "Visual & Settings" })


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

local HitboxSection = CombatTab:Section({ Title = "Hitbox Expander" })

CombatTab:Toggle({
    Title = "Expand Hitboxes",
    Desc = "Enlarge player hitboxes.",
    Flag = "HitboxToggle",
    Value = getgenv().HitboxEnabled,
    Callback = function(state)
        getgenv().HitboxEnabled = state
        if not state then
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    resetPlayerHitbox(player.Character)
                end
            end
        end
    end,
})

CombatTab:Toggle({
    Title = "Show Hitbox Visual",
    Desc = "Render hitbox outlines.",
    Flag = "HitboxVisualToggle",
    Value = getgenv().HitboxShowBox,
    Callback = function(state)
        getgenv().HitboxShowBox = state
        if not state then
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local head = player.Character:FindFirstChild("Head")
                    if head then
                        local selectionBox = head:FindFirstChild("CustomHitboxSelectionBox")
                        if selectionBox then
                            selectionBox:Destroy()
                        end
                    end
                end
            end
        end
    end,
})

CombatTab:Slider({
    Title = "Hitbox Scale",
    Desc = "Adjust hitbox size multiplier.",
    Flag = "HitboxSizeSlider",
    Value = {
        Min = 10,
        Max = 100,
        Default = getgenv().HitboxSize
    },
    Increment = 1,
    Callback = function(value)
        getgenv().HitboxSize = value
    end,
})



local CombatBuffsSection = GeneralTab:Section({ Title = "Combat" })


local FastAttackToggle = GeneralTab:Toggle({
    Title = "Fast Attack",
    Desc = "Combat/Fruit/Sword",
    Flag = "FastAttack",
    Value = false,
    Callback = function(state)
        SetFastAttack(state)
    end,
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
            CommE:FireServer(unpack({"Ken", state}))
        end)
    end,
})

task.spawn(function()
    while true do
        task.wait(1.5)
        if autoKenEnabled then
            pcall(function()
                CommE:FireServer(unpack({"Ken", true}))
            end)
        end
    end
end)




















local CharacterAbilities = GeneralTab:Section({ Title = "Character & Abilities" })
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
GeneralTab:Toggle({
    Title = "Walking on Water (Optimized Fix)",
    Desc = "Walk on water firmly without lagging.",
    Flag = "IceWalk",
    Value = false,
    Callback = function(state)
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local Workspace = game:GetService("Workspace")
        local player = Players.LocalPlayer

        _G.GiantFloor = _G.GiantFloor or nil
        _G.FloorConnection = _G.FloorConnection or nil
        _G.FloorRunning = state

        if not state then
            if _G.FloorConnection then
                _G.FloorConnection:Disconnect()
                _G.FloorConnection = nil
            end
            if _G.GiantFloor then
                _G.GiantFloor:Destroy()
                _G.GiantFloor = nil
            end
            local char = player.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if hum then
                hum:SetStateEnabled(Enum.HumanoidStateType.Swimming, true)
            end
            return
        end

        local function getOrCreateFloor()
            if not _G.GiantFloor or not _G.GiantFloor.Parent then
                local part = Instance.new("Part")
                part.Size = Vector3.new(300, 1, 300) -- ลดขนาดลงจาก 1000 เหลือ 300 เพื่อลดภาระฟิสิกส์
                part.Anchored = true
                part.CanCollide = true
                part.Transparency = 1 
                part.Material = Enum.Material.SmoothPlastic
                part.Parent = Workspace
                _G.GiantFloor = part
            end
            return _G.GiantFloor
        end

        local floorPart = getOrCreateFloor()
        local raycastParams = RaycastParams.new()
        raycastParams.FilterType = Enum.RaycastFilterType.Exclude
        
        local lastUpdate = 0
        _G.FloorConnection = RunService.Heartbeat:Connect(function(dt)
            if not _G.FloorRunning then return end
            
            -- ควบคุมให้เช็คแค่ทุกๆ 0.1 วินาที แทนที่จะรันทุกๆ เฟรม (แก้แลค)
            lastUpdate = lastUpdate + dt
            if lastUpdate < 0.1 then return end
            lastUpdate = 0

            local character = player.Character
            if not character or not character:FindFirstChild("HumanoidRootPart") then 
                if floorPart.Parent then floorPart.Parent = nil end
                return 
            end
            
            if floorPart.Parent ~= Workspace then
                floorPart.Parent = Workspace
            end
            
            local rootPart = character.HumanoidRootPart
            local hum = character:FindFirstChildOfClass("Humanoid")
            
            raycastParams.FilterDescendantsInstances = {character}
            local seaLevel = 3
            
            local rayResult = Workspace:Raycast(rootPart.Position + Vector3.new(0, 10, 0), Vector3.new(0, -50, 0), raycastParams)
            if rayResult and rayResult.Material == Enum.Material.Water then
                seaLevel = rayResult.Position.Y
            end
            
            floorPart.Position = Vector3.new(rootPart.Position.X, seaLevel - 1.5, rootPart.Position.Z)
            
            if rootPart.Position.Y < (seaLevel + 4) then
                rootPart.CFrame = CFrame.new(rootPart.Position.X, seaLevel + 4, rootPart.Position.Z) * (rootPart.CFrame - rootPart.CFrame.Position)
                rootPart.AssemblyLinearVelocity = Vector3.new(rootPart.AssemblyLinearVelocity.X, math.max(rootPart.AssemblyLinearVelocity.Y, 0), rootPart.AssemblyLinearVelocity.Z)
            end
            
            if hum then
                hum:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
                hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
                hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
                if hum:GetState() == Enum.HumanoidStateType.Swimming or hum:GetState() == Enum.HumanoidStateType.Freefall then
                    hum:ChangeState(Enum.HumanoidStateType.Running)
                end
            end
        end)
    end,
})






local ServerManagement = Server:Section({ Title = "Server Utilities" })

local InputJobId = ""

Server:Input({
    Title = "Target Server Job ID",
    Desc = "Input specific Job ID to target",
    Placeholder = "Paste Job ID here...",
    Value = "",
    Callback = function(text)
        InputJobId = text
    end,
})

Server:Button({
    Title = "Join Target Server",
    Desc = "Execute a single teleport to the inputted Job ID",
    Callback = function()
        if InputJobId == "" then
            WindUI:Notify({ Title = "Error", Content = "Job ID field is empty!", Icon = "alert-circle", Duration = 3 })
            return
        end
        
        WindUI:Notify({ Title = "Connecting", Content = "Teleporting to instance...", Icon = "loader", Duration = 3 })
        local success = pcall(function()
            TeleportService:TeleportToPlaceInstance(game.PlaceId, InputJobId, LocalPlayer)
        end)
        
        if not success then
            WindUI:Notify({ Title = "Teleport Failed", Content = "Server might be full, closed, or invalid.", Icon = "x-circle", Duration = 4 })
        end
    end,
})

Server:Button({
    Title = "Copy Current Job ID",
    Desc = "Save your current session's Job ID to clipboard",
    Callback = function()
        pcall(function()
            local currentJobId = game.JobId
            if setclipboard then
                setclipboard(currentJobId)
            elseif toclipboard then
                toclipboard(currentJobId)
            end
            WindUI:Notify({ Title = "Success", Content = "Job ID copied to clipboard!", Icon = "check-circle", Duration = 3 })
        end)
    end,
})

Server:Button({
    Title = "Rejoin Current Server",
    Desc = "Instantly reconnects to your exact session",
    Callback = function()
        WindUI:Notify({ Title = "Rejoining", Content = "Reloading session...", Icon = "refresh-cw", Duration = 3 })
        pcall(function()
            TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
        end)
    end,
})

Server:Button({
    Title = "Server Hop (Random)",
    Desc = "Finds and teleports you to a different public server",
    Callback = function()
        WindUI:Notify({ Title = "Server Hopping", Content = "Searching for an alternative server...", Icon = "globe", Duration = 3 })
        
        local success = pcall(function()
            local servers = {}
            local cursor = ""
            
            repeat
                local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100" .. (cursor ~= "" and "&cursor=" .. cursor or "")
                local response = HttpService:JSONDecode(game:HttpGet(url))
                cursor = response.nextPageCursor
                for _, server in ipairs(response.data) do
                    if server.id ~= game.JobId and server.playing < server.maxPlayers then
                        table.insert(servers, server.id)
                    end
                end
            until cursor == nil or #servers > 0
            
            if #servers > 0 then
                local randomServerId = servers[math.random(1, #servers)]
                TeleportService:TeleportToPlaceInstance(game.PlaceId, randomServerId, LocalPlayer)
            else
                WindUI:Notify({ Title = "Hop Failed", Content = "No available servers found right now.", Icon = "alert-triangle", Duration = 4 })
            end
        end)
        
        if not success then
            WindUI:Notify({ Title = "Error", Content = "Failed to fetch server list (HTTP Error).", Icon = "x-circle", Duration = 4 })
        end
    end,
})




















-- สร้าง Section สำหรับ General (ใส่ชื่อหัวข้อตามต้องการ)
local GeneralSection = GeneralTab:Section({ Title = "Movement Settings" })

-- Toggle: เปิด/ปิด กระโดด
GeneralTab:Toggle({
    Title = "Jump Boost",
    Flag = "JumpToggle",
    Value = false,
    Callback = function(state)
        JumpEnabled = state
    end,
})

-- Slider: ปรับความแรงกระโดด
GeneralTab:Slider({
    Title = "Jump Power (%)",
    Flag = "JumpSlider",
    Increment = 1,
    Value = {
        Min = 100,
        Max = 1000,
        Default = 100
    },
    Callback = function(value)
        JumpPercentage = value
    end,
})

-- Toggle: เปิด/ปิด พุ่ง
GeneralTab:Toggle({
    Title = "Speed Dash",
    Flag = "DashToggle",
    Value = false,
    Callback = function(state)
        DashEnabled = state
    end,
})

-- Slider: ปรับความเร็วพุ่ง
GeneralTab:Slider({
    Title = "Dash Speed (%)",
    Flag = "DashSlider",
    Increment = 1,
    Value = {
        Min = 100,
        Max = 1000,
        Default = 100
    },
    Callback = function(value)
        DashPercentage = value
    end,
})

local ESPSection = Visuals:Section({ Title = "ESP Settings" })

Visuals:Toggle({
    Title = "Show Name",
    Desc = "Displays player usernames.",
    Flag = "ESP_Name",
    Value = true,
    Callback = function(state)
        ESPConfig.ShowName = state
        UpdateAllESPVisibilities()
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
        UpdateAllESPVisibilities()
    end,
})

Visuals:Toggle({
    Title = "Show Bounty",
    Desc = "Shows current bounty or honor.",
    Flag = "ESP_Bounty",
    Value = true,
    Callback = function(state)
        ESPConfig.ShowBounty = state
        UpdateAllESPVisibilities()
    end,
})

Visuals:Toggle({
    Title = "Show Health",
    Desc = "Renders health bars and percentages.",
    Flag = "ESP_HP",
    Value = true,
    Callback = function(state)
        ESPConfig.ShowHealth = state
        UpdateAllESPVisibilities()
    end,
})

Visuals:Toggle({
    Title = "Show Player Status",
    Desc = "Displays PvP, SafeZone, and combat status.",
    Flag = "ESP_Status",
    Value = true,
    Callback = function(state)
        ESPConfig.ShowStatus = state
        UpdateAllESPVisibilities()
    end,
})




local SafeModeSection = GeneralTab:Section({ Title = "Safe Mode" })

GeneralTab:Toggle({
    Title = "Noclip",
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

GeneralTab:Slider({
    Title = "Safe Mode HP (%)",
    Increment = 1,
    Value = {
        Min = 10,
        Max = 90,
        Default = 30
    },
    Flag = "SafeModePercentSlider",
    Callback = function(value)
        safeModePercent = value
    end,
})

GeneralTab:Slider({
    Title = "Stop Escaping HP (%)",
    Increment = 1,
    Value = {
        Min = 20,
        Max = 100,
        Default = 80
    },
    Flag = "SafeStopPercentSlider",
    Callback = function(value)
        safeStopPercent = value
    end,
})

GeneralTab:Slider({
    Title = "Escape Flight Speed",
    Increment = 10,
    Value = {
        Min = 100,
        Max = 300,
        Default = 300
    },
    Flag = "SafeFlySpeedSlider",
    Callback = function(value)
        flySpeed = value
    end,
})

GeneralTab:Toggle({
    Title = "Safe Mode",
    Flag = "SafeModeToggle",
    Value = false,
    Callback = function(Value)
        safeModeActive = Value
        isSafeEscaping = false
        if not Value then
            setSafeNoclip(false)
        end
        notify("Destiny Hub", Value and "Safe Mode Enabled (Ultra Fast)" or "Safe Mode Disabled")
    end,
})


local UtilitySection = GeneralTab:Section({ Title = "Elite Target Tracker" })
FollowToggle = GeneralTab:Toggle({
    Title = "Elite Pursuit Mode",
    Desc = "Tracks and follows your target.",
    Flag = "FollowToggle",
    Value = false,
    Callback = function(state)
        FollowEnabled = state
        if not state then currentTarget = nil end
    end,
})

local Keybind = GeneralTab:Keybind({
    Title = "Target Lock Key",
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
        Min = 0,
        Max = 300,
        Default = 250
    },
    Callback = function(value)
        FollowDistance = value
    end,
})

local HideShowUI = Config:Section({ Title = "Hide / Show UI" })

local UIKeybind = Config:Keybind({
    Title = "Interface Toggle",
    Desc = "Keybind to show or hide the user interface",
    Flag = "UIKeybindUIKeybind", 
    Value = "V",
    Callback = function(key)
        Window:Toggle()
    end
})




local antiAfkConnection

Config:Toggle({
    Title = "Anti-AFK",
    Desc = "",
    Flag = "AntiAFK_Toggle",
    Value = false,
    Callback = function(Value)
        pcall(function()
            if Value then
                local vu = game:GetService("VirtualUser")
                antiAfkConnection = LocalPlayer.Idled:Connect(function()
                    vu:Button2Down(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
                    task.wait(1)
                    vu:Button2Up(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
                end)
                
                WindUI:Notify({ 
                    Title = "Anti-AFK Active", 
                    Content = "You will no longer be idle-kicked.", 
                    Icon = "shield", 
                    Duration = 3 
                })
            else
                if antiAfkConnection then
                    antiAfkConnection:Disconnect()
                    antiAfkConnection = nil
                end
                
                WindUI:Notify({ 
                    Title = "Anti-AFK Inactive", 
                    Content = "Anti-AFK has been disabled.", 
                    Icon = "shield-off", 
                    Duration = 3 
                })
            end
        end)
    end,
})





local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomMobileTogglesStyle"
screenGui.Parent = CoreGui
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local container = Instance.new("Frame")
container.Size = UDim2.new(0, 120, 0, 144) 
container.Position = UDim2.new(0, 20, 0, 20)
container.BackgroundTransparency = 1
container.Parent = screenGui

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = container
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)

local function createButton(text, accentColor, order, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 120, 0, 38)
    button.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
    button.BackgroundTransparency = 0.15
    button.BorderSizePixel = 0
    button.LayoutOrder = order
    button.AutoButtonColor = false
    button.Text = ""
    button.Parent = container

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

    local activeState = false
    
    button.MouseButton1Click:Connect(function()
        activeState = not activeState
        
        local tweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
        
        if activeState then
            TweenService:Create(button, tweenInfo, {BackgroundColor3 = Color3.fromRGB(28, 28, 36)}):Play()
            TweenService:Create(uiStroke, tweenInfo, {Color = accentColor}):Play()
            TweenService:Create(textLabel, tweenInfo, {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
            TweenService:Create(indicator, tweenInfo, {BackgroundColor3 = accentColor}):Play()
        else
            TweenService:Create(button, tweenInfo, {BackgroundColor3 = Color3.fromRGB(18, 18, 22)}):Play()
            TweenService:Create(uiStroke, tweenInfo, {Color = Color3.fromRGB(45, 45, 55)}):Play()
            TweenService:Create(textLabel, tweenInfo, {TextColor3 = Color3.fromRGB(200, 200, 210)}):Play()
            TweenService:Create(indicator, tweenInfo, {BackgroundColor3 = Color3.fromRGB(70, 70, 80)}):Play()
        end

        if callback then
            callback(activeState)
        end
    end)

    return button
end

createButton("Camera Lock", Color3.fromRGB(0, 229, 255), 1, function(Value)
    getgenv().CamlockEnabled = Value
    if not Value then
        getgenv().CurrentTarget = nil
    end
end)

createButton("Teleport Player", Color3.fromRGB(0, 229, 255), 2, function(state)
    FollowEnabled = state
    getgenv().TPToTargetEnabled = state
    getgenv().FollowEnabled = state

    if not state then
        currentTarget = nil
        getgenv().CurrentTarget = nil
    end
end)













local VirtualInputManager = game:GetService("VirtualInputManager")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- รายการตัวเลือก
local WeaponList = {
    "None",
    "Melee",
    "Blox Fruit",
    "Sword",
    "Gun"
}

local SkillActionList = {
    "None",
    "Z",
    "X",
    "C",
    "V",
    "F",
    "Click (M1)",
    "Jump"
}

local MacroSettings = {
    Block1 = { Weapon = "Sword", Skill = "X", Hold = 0, Wait = 0.4, Delay = 0.05 },
    Block2 = { Weapon = "Melee / Fighting Style", Skill = "Z", Hold = 0, Wait = 0.4, Delay = 0.05 },
    Block3 = { Weapon = "Blox Fruit", Skill = "C", Hold = 0, Wait = 0.4, Delay = 0.05 },
    Block4 = { Weapon = "Gun", Skill = "V", Hold = 0, Wait = 0.4, Delay = 0.05 }
}

-- ตัวแปรสถานะ
local isRunning = false
local macroEnabled = true

local function PressKey(keyName, holdDuration)
    local keyCode = Enum.KeyCode[keyName]
    if not keyCode then return end

    VirtualInputManager:SendKeyEvent(true, keyCode, false, game)
    task.wait(holdDuration > 0 and holdDuration or 0.03)
    VirtualInputManager:SendKeyEvent(false, keyCode, false, game)
end

local function EquipWeapon(weaponType)
    if weaponType == "None" then return end
    
    local keyToPress = nil
    if weaponType == "Melee" or weaponType == "Melee / Fighting Style" then
        keyToPress = Enum.KeyCode.One
    elseif weaponType == "Blox Fruit" then
        keyToPress = Enum.KeyCode.Two
    elseif weaponType == "Sword" then
        keyToPress = Enum.KeyCode.Three
    elseif weaponType == "Gun" then
        keyToPress = Enum.KeyCode.Four
    end

    if keyToPress then
        -- ลดเวลาดีเลย์สลับอาวุธให้เหมาะกับมือถือที่มีเฟรมเรตจำกัด
        VirtualInputManager:SendKeyEvent(true, keyToPress, false, game)
        task.wait(0.05)
        VirtualInputManager:SendKeyEvent(false, keyToPress, false, game)
    end
end

local function ExecuteAction(skill, holdDuration)
    if skill == "Jump" then
        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
        task.wait(holdDuration > 0 and holdDuration or 0.03)
        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
    elseif skill == "Click (M1)" then
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
        task.wait(holdDuration > 0 and holdDuration or 0.03)
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
    elseif skill ~= "None" then
        PressKey(skill, holdDuration)
    end
end

-- ฟังก์ชันรันคอมโบหลัก (ครอบด้วย coroutine ป้องกันเกมกระตุกและเพิ่มความเร็วในการตอบสนอง)
local function RunComboMacro()
    if not macroEnabled then return end
    if isRunning then return end
    
    task.spawn(function()
        isRunning = true
        
        for i = 1, 4 do
            local block = MacroSettings["Block" .. i]
            if block then
                EquipWeapon(block.Weapon)
                task.wait(0.08) -- ลดเวลาหน่วงลงเพื่อความลื่นไหลบนมือถือ
                
                ExecuteAction(block.Skill, block.Hold)
                
                if block.Wait and block.Wait > 0 then
                    task.wait(block.Wait)
                end
                
                if block.Delay and block.Delay > 0 then
                    task.wait(block.Delay)
                end
            end
        end
        
        isRunning = false
    end)
end

-- สร้าง UI สำหรับแต่ละ Block
for i = 1, 4 do
    local blockKey = "Block" .. i
    local section = Macro:Section({ Title = "Block " .. i })

    Macro:Dropdown({
        Title = "Weapon",
        Desc = "Select weapon type",
        Values = WeaponList,
        Value = MacroSettings[blockKey].Weapon,
        Flag = "block" .. i .. "_weapon",
        Callback = function(selected) MacroSettings[blockKey].Weapon = selected end
    })

    Macro:Dropdown({
        Title = "Skill / Action",
        Desc = "Select skill to use",
        Values = SkillActionList,
        Value = MacroSettings[blockKey].Skill,
        Flag = "block" .. i .. "_skill",
        Callback = function(selected) MacroSettings[blockKey].Skill = selected end
    })

    Macro:Input({
        Title = "Hold Duration",
        Desc = "Time to hold key/click (seconds)",
        Value = tostring(MacroSettings[blockKey].Hold),
        Flag = "block" .. i .. "_hold",
        Callback = function(val) MacroSettings[blockKey].Hold = tonumber(val) or 0 end
    })

    Macro:Input({
        Title = "Skill Wait Time",
        Desc = "Wait time for skill animation (seconds)",
        Value = tostring(MacroSettings[blockKey].Wait),
        Flag = "block" .. i .. "_wait",
        Callback = function(val) MacroSettings[blockKey].Wait = tonumber(val) or 0.4 end
    })

    Macro:Input({
        Title = "Delay",
        Desc = "Delay after action (seconds)",
        Value = tostring(MacroSettings[blockKey].Delay),
        Flag = "block" .. i .. "_delay",
        Callback = function(val) MacroSettings[blockKey].Delay = tonumber(val) or 0.05 end
    })
end

-- [ Keybind Control ]
local SectionControl = Macro:Section({ Title = "Controls" })

Macro:Keybind({
    Title = "Run Combo Macro",
    Value = "",
    Flag = "RunComboMacro_Keybind",
    Callback = function(key)
        RunComboMacro()
    end
})




local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name, screenGui.ResetOnSpawn = "DraggableMacroGui", false

local button = Instance.new("TextButton", screenGui)
button.Size, button.Position = UDim2.new(0, 120, 0, 38), UDim2.new(0, 15, 0, 130)
button.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
button.BorderSizePixel, button.Text, button.AutoButtonColor = 0, "", false

Instance.new("UICorner", button).CornerRadius = UDim.new(0, 8)

local uiGradient = Instance.new("UIGradient", button)
uiGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(35, 35, 42)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 24))
})
uiGradient.Rotation = 45

local uiStroke = Instance.new("UIStroke", button)
uiStroke.Color = Color3.fromRGB(60, 60, 70)
uiStroke.Thickness = 1.2
uiStroke.Transparency = 0.3

local textLabel = Instance.new("TextLabel", button)
textLabel.Size, textLabel.BackgroundTransparency = UDim2.new(1, 0, 1, 0), 1
textLabel.Font = Enum.Font.GothamSemibold
textLabel.Text = "Macro"
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.TextSize = 12

button.MouseButton1Click:Connect(function()
    uiGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(16, 185, 129)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 150, 105))
    })
    uiStroke.Color = Color3.fromRGB(52, 211, 153)
    
    if RunComboMacro then 
        RunComboMacro() 
    end
    
    task.delay(0.2, function()
        uiGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(35, 35, 42)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 24))
        })
        uiStroke.Color = Color3.fromRGB(60, 60, 70)
    end)
end)

-- ระบบลากพร้อมจำกัดไม่ให้หลุดขอบจอ
local dragging, dragStart, startPos

button.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = button.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        
        -- คำนวณตำแหน่งใหม่แบบ Offset
        local newX = startPos.X.Offset + delta.X
        local newY = startPos.Y.Offset + delta.Y
        
        -- ดึงขนาดหน้าจอและขนาดปุ่มปัจจุบัน
        local screenSize = screenGui.AbsoluteSize
        local btnSize = button.AbsoluteSize
        
        -- จำกัดขอบเขต (Clamping) ไม่ให้เกินจอ
        local clampedX = math.clamp(newX, 0, screenSize.X - btnSize.X)
        local clampedY = math.clamp(newY, 0, screenSize.Y - btnSize.Y)
        
        button.Position = UDim2.new(0, clampedX, 0, clampedY)
    end
end)
