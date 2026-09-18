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
    WindowTopbarButtonIcon = Color3.fromHex("#FFFFFF"),
    
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
    
    -- ปรับสีปุ่มเปิดปิด (Toggle)
    Toggle = Color3.fromHex("#3b82f6"), -- เปลี่ยนเป็นสีฟ้าเมื่อเปิด (หรือปรับตามต้องการ)
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
    Icon = "repeat" 
})




Window:Divider() 
Window:Section({
    Title = "Player & Config",
})

local Bounty = Window:Tab({
    Title = "Bounty hunting",
    Icon = "moon" 
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


-- 1. ช่องสำหรับใส่โค้ด Config (สำหรับ Import หรือแสดงโค้ด)
local importedConfigData = ""

Config:Input({
    Title = "Configuration Code",
    Description = "วางโค้ด Config ที่นี่เพื่อ Import หรือคัดลอกออก",
    Value = "",
    Placeholder = "วางโค้ด JSON ที่นี่...",
    Callback = function(text)
        importedConfigData = text
    end,
})

-- 2. ปุ่มสำหรับกด Import (นำเข้า Config จากช่องกรอกข้อความด้านบน)
Config:Button({
    Title = "Import Configuration",
    Description = "บันทึกโค้ดตั้งค่าจากช่องด้านบนลงไฟล์",
    Callback = function()
        pcall(function()
            local filePath = "WindUI/Destiny Hub/config/DestinyConfig.json"
            
            if importedConfigData and importedConfigData ~= "" then
                -- ตรวจสอบและสร้างโฟลเดอร์ถ้ายังไม่มี (เผื่อไว้)
                if makefolder and not isfolder("WindUI/Destiny Hub/config") then
                    -- สร้างโฟลเดอร์ตามลำดับถ้าจำเป็น
                end
                
                if writefile then
                    writefile(filePath, importedConfigData)
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

-- 3. ปุ่ม Export เดิมของคุณ (ดึงจากไฟล์ลงคลิปบอร์ด)
Config:Button({
    Title = "Export Configuration",
    Description = "คัดลอกโค้ดการตั้งค่าเพื่อแชร์ให้คนอื่น",
    Callback = function()
        pcall(function()
            local filePath = "WindUI/Destiny Hub/config/DestinyConfig.json"
            
            if isfile and isfile(filePath) then
                local configData = readfile(filePath)
                
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


-- โหลดค่าอัตโนมัติเมื่อเปิดสคริปต์
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






RunService.RenderStepped:Connect(function(dt)
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

    -- ระบบแสดงเส้น Tracer / Snapline (ปรับปรุงโหมด 360 ให้แสดงผลทะลุจอ/ทุกตำแหน่ง)
    if getgenv().CurrentTarget and getgenv().ShowTracer and Snapline then
        local targetPart = getgenv().CurrentTarget
        
        if typeof(targetPart) == "Instance" and targetPart:IsA("Model") then
            targetPart = targetPart:FindFirstChild("HumanoidRootPart") or targetPart.PrimaryPart or targetPart:FindFirstChild("Head")
        end

        if targetPart and (targetPart:IsA("BasePart") or targetPart:IsA("Model")) then
            local partPos = targetPart:IsA("BasePart") and targetPart.Position or targetPart:GetPivot().Position
            local targetScreenPos, targetOnScreen = camera:WorldToViewportPoint(partPos)

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

            -- สำหรับโหมด 360° ให้แสดงเส้นเสมอแม้เป้าหมายจะอยู่ด้านหลังกล้อง (ไม่ต้องเช็ค Z > 0)
            if mode == "360°" then
                Snapline.Visible = true
            else
                Snapline.Visible = (targetScreenPos.Z > 0)
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



-- ==================== รวมตัวแปรหลัก (ประกาศครั้งเดียวจบ) ====================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

-- Remote สำหรับฮาคิและเผ่า V3
local Remotes = ReplicatedStorage:FindFirstChild("Remotes")
local CommF = Remotes and Remotes:FindFirstChild("CommF_")
local commE = Remotes and Remotes:FindFirstChild("CommE")

-- ==================== 1. ระบบแดช วิ่งเร็ว กระโดดสูง ====================
local JumpEnabled = false
local JumpPercentage = 100

local DashEnabled = false
local DashPercentage = 100

-- ฟังก์ชันหาตัวละคร
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

-- ==================== 2. ระบบเปิดฮาคิ (Buso) ====================
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

-- ==================== 3. ระบบเปิดเผ่า v3 ====================
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
            local character = LocalPlayer.Character
            if not character or not character:FindFirstChild("HumanoidRootPart") then return end
            if commE then
                commE:FireServer("ActivateAbility")
            end
        end)
    end)
end

-- ==================== 4. ระบบเปิดเผ่า v4 ====================
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
        if currentTime - lastCheck < 0.1 then return end
        lastCheck = currentTime
        
        pcall(function()
            local character = LocalPlayer.Character
            if not character or not character:FindFirstChild("HumanoidRootPart") then return end
            
            local backpack = LocalPlayer:FindFirstChild("Backpack")
            local awakening = backpack and backpack:FindFirstChild("Awakening")
            local remoteFunction = awakening and awakening:FindFirstChild("RemoteFunction")
            
            if remoteFunction then
                remoteFunction:InvokeServer(true)
            end
        end)
    end)
end

-- ==================== 5. ลูปการทำงานหลัก (RenderStepped) ====================
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



local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local charactersFolder = Workspace:WaitForChild("Characters", 5)

local statusParagraph = Bounty:Paragraph({
    Title = "สถานะผู้เล่นในเซิร์ฟเวอร์ (PvP Status)",
    Desc = "กำลังโหลดข้อมูล..."
})

-- ฟังก์ชันกลางช่วยอัปเดตข้อความ ป้องกัน Error ของ UI Library
local function updateParagraph(text)
    pcall(function()
        if statusParagraph.Set then
            statusParagraph:Set(text)
        elseif statusParagraph.SetDesc then
            statusParagraph:SetDesc(text)
        elseif statusParagraph.UpdateDesc then
            statusParagraph:UpdateDesc(text)
        end
    end)
end


task.spawn(function()
    while true do
        local statusList = {}
        local activeCount = 0
        
        if charactersFolder then
            for _, charModel in ipairs(charactersFolder:GetChildren()) do
                if charModel:IsA("Model") then
                    local playerName = charModel.Name
                    local targetPlayer = Players:GetPlayerFromCharacter(charModel)
                    
                    if targetPlayer and targetPlayer ~= LocalPlayer then
                        local inCombat = false
                        local inSafeZone = false
                        local pvpEnabled = true
                        local isMarineTeam = false
                        local isDead = false
                        local hasForceField = false
                        
                        pcall(function()
                            local humanoid = charModel:FindFirstChildOfClass("Humanoid")
                            if not humanoid or humanoid.Health <= 0 then isDead = true end
                            if charModel:FindFirstChildOfClass("ForceField") then hasForceField = true end
                            
                            if LocalPlayer.Team and targetPlayer.Team then
                                if LocalPlayer.Team.Name == "Marines" and targetPlayer.Team.Name == "Marines" then
                                    isMarineTeam = true
                                end
                            end
                            
                            if charModel:GetAttribute("InCombat") or targetPlayer:GetAttribute("InCombat") then inCombat = true end
                            if isPlayerInCombat then
                                local ok, res = pcall(isPlayerInCombat, targetPlayer, charModel)
                                if ok and res then inCombat = true end
                            end
                            
                            if charModel:GetAttribute("SafeZone") or targetPlayer:GetAttribute("InSafeZone") then inSafeZone = true end
                            if isPlayerInSafeZone then
                                local ok, res = pcall(isPlayerInSafeZone, targetPlayer, charModel)
                                if ok and res then inSafeZone = true end
                            end
                            
                            local rawPvP = nil
                            for _, attr in ipairs({"PvP", "PVP", "PvPEnabled"}) do
                                if charModel:GetAttribute(attr) ~= nil then
                                    rawPvP = charModel:GetAttribute(attr)
                                    break
                                elseif targetPlayer:GetAttribute(attr) ~= nil then
                                    rawPvP = targetPlayer:GetAttribute(attr)
                                    break
                                end
                            end
                            
                            if rawPvP == nil then
                                local disAttr = charModel:GetAttribute("PvpDisabled") or targetPlayer:GetAttribute("PvpDisabled")
                                if disAttr ~= nil then rawPvP = not disAttr end
                            end
                            
                            if rawPvP ~= nil then
                                pvpEnabled = (rawPvP == true or rawPvP == 1 or rawPvP == "1" or rawPvP == "Enabled")
                            end
                        end)
                        
                        -- เลือกแสดงสถานะหลักแบบพรีเมียม
                        local statusText = "<font color='#2ecc71'>● Active</font>"
                        if isDead then
                            statusText = "<font color='#e74c3c'>✖ Dead</font>"
                        elseif hasForceField then
                            statusText = "<font color='#3498db'>🛡 Spawn Protection</font>"
                        elseif isMarineTeam then
                            statusText = "<font color='#f1c40f'>⚓ Marine Ally</font>"
                        elseif inSafeZone then
                            statusText = "<font color='#1abc9c'>🛡 Safe Zone</font>"
                        elseif inCombat then
                            statusText = "<font color='#e67e22'>⚡ In Combat</font>"
                        elseif not pvpEnabled then
                            statusText = "<font color='#95a5a6'>🔒 PvP Disabled</font>"
                        else
                            activeCount = activeCount + 1
                        end
                        
                        -- จัดรูปแบบแถวรายชื่อให้ดูสะอาดตาและหรูหรา
                        table.insert(statusList, string.format("  <font color='#ffffff'><b>%s</b></font>  <font color='#7f8c8d'></font>  %s", playerName, statusText))
                    end
                end
            end
        end
        
        -- ดีไซน์ Header ให้มีความเป็นมืออาชีพ
        local header = "<font color='#3498db'><b>┏━━ ⚡ PLAYER STATUS MONITOR</b></font>\n<font color='#3498db'><b></b></font> <font color='#bdc3c7'>Online Tracking:</font> <font color='#2ecc71'><b>" .. #statusList .. "</b> Players</font>\n<font color='#3498db'><b>┗━━━━━━━━━━━━━━━━━━━━━━━</b></font>\n\n"
        local body = #statusList > 0 and table.concat(statusList, "\n") or "  <font color='#e74c3c'><i>❌ No other players detected</i></font>"
        
        updateParagraph(header .. body)
        
        task.wait(1)
    end
end)


-- ==========================================
-- SCOPE 1: Configuration & Colors
-- ==========================================
do
    getgenv().ESPConfig = getgenv().ESPConfig or {
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

    getgenv().COLORS = {
        Pirates = Color3.fromRGB(255, 45, 45),
        Marines = Color3.fromRGB(0, 150, 255),
        Neutral = Color3.fromRGB(220, 220, 220),
        White = Color3.fromRGB(255, 255, 255),
        HP = Color3.fromRGB(0, 255, 100),
        HPBG = Color3.fromRGB(10, 10, 15),
        Level = Color3.fromRGB(255, 200, 0),
        Bounty = Color3.fromRGB(255, 80, 180),
        PvPOn = Color3.fromRGB(50, 255, 50),
        PvPOff = Color3.fromRGB(255, 50, 80),
        Combat = Color3.fromRGB(255, 220, 0),
        SafeZoneOn = Color3.fromRGB(0, 220, 255),
        SafeZoneOff = Color3.fromRGB(255, 120, 0),
    }
end

-- ==========================================
-- SCOPE 2: SafeZone & Utility Functions
-- ==========================================
local isInSafeZoneRadius, GetTeamInfo, GetLevel, GetBounty, GetDetailedStatus, FormatNumber
do
    local Players = game:GetService("Players")
    local Workspace = game:GetService("Workspace")

    local function getSafeZonesFolder()
        local origin = Workspace:FindFirstChild("_WorldOrigin")
        if origin then
            return origin:FindFirstChild("SafeZones")
        end
        return nil
    end

    isInSafeZoneRadius = function(character)
        if not character or not character:FindFirstChild("HumanoidRootPart") then return false end
        local folder = getSafeZonesFolder()
        if not folder then return false end
        
        local charPos = character.HumanoidRootPart.Position
        for _, zonePart in ipairs(folder:GetChildren()) do
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

    GetTeamInfo = function(player)
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

    GetLevel = function(player)
        local data = player:FindFirstChild("Data")
        if data and data:FindFirstChild("Level") then return data.Level.Value end
        local leaderstats = player:FindFirstChild("leaderstats")
        if leaderstats and leaderstats:FindFirstChild("Level") then return leaderstats.Level.Value end
        return "?"
    end

    GetBounty = function(player)
        local leaderstats = player:FindFirstChild("leaderstats")
        if leaderstats then
            local bVal = leaderstats:FindFirstChild("Bounty/Honor")
            if bVal then return bVal.Value end
        end
        return 0
    end

    GetDetailedStatus = function(player)
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

    FormatNumber = function(number)
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
end

-- ==========================================
-- SCOPE 3: ESP Rendering & Connection Handler
-- ==========================================
do
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local LocalPlayer = Players.LocalPlayer
    local ActiveESPs = {}

    local function CreateGuiElement(className, parent, name, size, position)
        local element = Instance.new(className)
        element.Name = name
        element.Size = size
        if position then element.Position = position end
        element.Parent = parent
        return element
    end

    local function BuildUIComponents(container, player)
        local nameLabel = CreateGuiElement("TextLabel", container, "NameLabel", UDim2.new(1, 0, 0, 20))
        nameLabel.BackgroundTransparency = 1
        nameLabel.Visible = ESPConfig.ShowName
        nameLabel.RichText = true
        nameLabel.TextSize = 13
        nameLabel.Font = Enum.Font.FredokaOne
        nameLabel.TextStrokeTransparency = 0.3
        nameLabel.TextStrokeColor3 = Color3.fromRGB(10, 10, 15)

        local pvpLabel = CreateGuiElement("TextLabel", container, "PvPLabel", UDim2.new(1, 0, 0, 16), UDim2.new(0, 0, 0, 22))
        pvpLabel.BackgroundTransparency = 1
        pvpLabel.Visible = ESPConfig.ShowStatus
        pvpLabel.RichText = true
        pvpLabel.TextSize = 11
        pvpLabel.Font = Enum.Font.GothamMedium
        pvpLabel.TextStrokeTransparency = 0.4
        pvpLabel.TextStrokeColor3 = Color3.fromRGB(10, 10, 15)

        local levelLabel = CreateGuiElement("TextLabel", container, "LevelLabel", UDim2.new(1, 0, 0, 16), UDim2.new(0, 0, 0, 40))
        levelLabel.BackgroundTransparency = 1
        levelLabel.Visible = ESPConfig.ShowLevel
        levelLabel.Text = "⚡ LVL: " .. tostring(GetLevel(player))
        levelLabel.TextColor3 = COLORS.Level
        levelLabel.TextSize = 11
        levelLabel.Font = Enum.Font.GothamBold
        levelLabel.TextStrokeTransparency = 0.4
        levelLabel.TextStrokeColor3 = Color3.fromRGB(10, 10, 15)

        local bountyLabel = CreateGuiElement("TextLabel", container, "BountyLabel", UDim2.new(1, 0, 0, 16), UDim2.new(0, 0, 0, 58))
        bountyLabel.BackgroundTransparency = 1
        bountyLabel.Visible = ESPConfig.ShowBounty
        bountyLabel.Text = "💎 BOUNTY: " .. FormatNumber(GetBounty(player))
        bountyLabel.TextColor3 = COLORS.Bounty
        bountyLabel.TextSize = 11
        bountyLabel.Font = Enum.Font.GothamBold
        bountyLabel.TextStrokeTransparency = 0.4
        bountyLabel.TextStrokeColor3 = Color3.fromRGB(10, 10, 15)

        local hpBG = CreateGuiElement("Frame", container, "HPBG", UDim2.new(0.75, 0, 0, 6), UDim2.new(0.125, 0, 0, 80))
        hpBG.Visible = ESPConfig.ShowHealth
        hpBG.BackgroundColor3 = COLORS.HPBG
        hpBG.BorderSizePixel = 0

        local hpCornerBG = Instance.new("UICorner")
        hpCornerBG.CornerRadius = UDim.new(1, 0)
        hpCornerBG.Parent = hpBG

        local hpStroke = Instance.new("UIStroke")
        hpStroke.Thickness = 1
        hpStroke.Color = Color3.fromRGB(255, 255, 255)
        hpStroke.Transparency = 0.8
        hpStroke.Parent = hpBG

        local hp = CreateGuiElement("Frame", hpBG, "HP", UDim2.new(1, 0, 1, 0))
        hp.BackgroundColor3 = COLORS.HP
        hp.BorderSizePixel = 0

        local hpCorner = Instance.new("UICorner")
        hpCorner.CornerRadius = UDim.new(1, 0)
        hpCorner.Parent = hp

        return nameLabel, pvpLabel, levelLabel, bountyLabel, hpBG
    end

    local function CreateESP(player)
        if player == LocalPlayer then return end

        local connectionTeam, connectionHealth, connectionBounty, charAddedConn

        local function Cleanup()
            if connectionTeam then connectionTeam:Disconnect(); connectionTeam = nil end
            if connectionHealth then connectionHealth:Disconnect(); connectionHealth = nil end
            if connectionBounty then connectionBounty:Disconnect(); connectionBounty = nil end
            if ActiveESPs[player] and ActiveESPs[player].Gui then
                ActiveESPs[player].Gui:Destroy()
            end
            ActiveESPs[player] = nil
        end

        local function Setup(character)
            if not character then return end
            
            local head = character:FindFirstChild("Head") or character:WaitForChild("Head", 5)
            local humanoid = character:FindFirstChild("Humanoid") or character:WaitForChild("Humanoid", 5)

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

            local container = CreateGuiElement("Frame", gui, "Container", UDim2.new(1, 0, 1, 0))
            container.BackgroundTransparency = 1

            local nameLabel, pvpLabel, levelLabel, bountyLabel, hpBG = BuildUIComponents(container, player)
            local hp = hpBG:FindFirstChild("HP")

            local function UpdateHealth(value)
                local maxHealth = humanoid.MaxHealth
                if maxHealth <= 0 then maxHealth = 1 end
                hp.Size = UDim2.new(math.clamp(value / maxHealth, 0, 1), 0, 1, 0)
            end

            local function UpdateDynamicInfo()
                _, teamColor, teamEnabled = GetTeamInfo(player)
                
                nameLabel.Visible = ESPConfig.ShowName
                pvpLabel.Visible = ESPConfig.ShowStatus
                levelLabel.Visible = ESPConfig.ShowLevel
                bountyLabel.Visible = ESPConfig.ShowBounty
                hpBG.Visible = ESPConfig.ShowHealth

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

            if connectionHealth then connectionHealth:Disconnect() end
            connectionHealth = humanoid.HealthChanged:Connect(UpdateHealth)
        end

        if player.Character then
            task.spawn(function()
                Setup(player.Character)
            end)
        end

        charAddedConn = player.CharacterAdded:Connect(function(newChar)
            Setup(newChar)
        end)

        local leaderstats = player:FindFirstChild("leaderstats")
        if leaderstats then
            local bVal = leaderstats:FindFirstChild("Bounty/Honor")
            if bVal then
                connectionBounty = bVal.Changed:Connect(function(newValue)
                    if ActiveESPs[player] and ActiveESPs[player].Gui then
                        local bountyLbl = ActiveESPs[player].Gui:FindFirstChild("BountyLabel", true)
                        if bountyLbl then
                            bountyLbl.Text = "💎 BOUNTY: " .. FormatNumber(newValue)
                        end
                    end
                end)
            end
        end

        connectionTeam = player:GetPropertyChangedSignal("Team"):Connect(function()
            if ActiveESPs[player] and ActiveESPs[player].Gui then
                local _, _, teamEnabled = GetTeamInfo(player)
                ActiveESPs[player].Gui.Enabled = teamEnabled
                ActiveESPs[player].Update()
            end
        end)

        player.Destroying:Connect(function()
            if charAddedConn then charAddedConn:Disconnect() end
            Cleanup()
        end)
    end

    RunService.RenderStepped:Connect(function()
        for _, data in pairs(ActiveESPs) do
            if data and data.Update and data.Head and data.Head.Parent then
                data.Update()
            end
        end
    end)

    for _, player in ipairs(Players:GetPlayers()) do
        CreateESP(player)
    end

    Players.PlayerAdded:Connect(CreateESP)
end



--วาปหาผู้เล่น (Improved Version)
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
-- ฟังก์ชันตรวจสอบว่าควรละเว้นเป้าหมายนี้หรือไม่
local function ShouldIgnoreTarget(targetChar)
    if not targetChar or not targetChar.Parent then return true end
    
    local targetPlayer = Players:GetPlayerFromCharacter(targetChar)
    if not targetPlayer then return true end
    
    -- 1. ห้ามเลือกตัวเอง
    if targetPlayer == LocalPlayer then return true end
    
    -- 2. เช็กว่าเป้าหมายตายแล้วหรือยัง (เลือดหมด)
    local humanoid = targetChar:FindFirstChildOfClass("Humanoid")
    if not humanoid or humanoid.Health <= 0 then return true end
    
    -- 3. เช็กว่ามี ForceField (อมตะตอนเกิดใหม่) หรือไม่
    if targetChar:FindFirstChildOfClass("ForceField") then
        return true
    end
    
    -- 4. เช็กทีมเดียวกัน (Marines)
    if LocalPlayer.Team and targetPlayer.Team then
        if LocalPlayer.Team.Name == "Marines" and targetPlayer.Team.Name == "Marines" then 
            return true 
        end
    end
    
    -- ตัวแปรเช็กสถานะ SafeZone และ PvP
    local inCombat = false
    local inSafeZone = false
    
    -- ใช้ pcall ป้องกัน error เสมอเผื่อฟังก์ชันหรือ Attribute ไม่มีอยู่จริงในเกมนั้น
    pcall(function()
        -- วิธี ก: เช็กผ่านฟังก์ชันสากล (ถ้าในสคริปต์หลักของคุณมีประกาศไว้)
        if isPlayerInCombat then 
            inCombat = isPlayerInCombat(targetPlayer, targetChar) 
        end
        if isPlayerInSafeZone then 
            inSafeZone = isPlayerInSafeZone(targetPlayer, targetChar) 
        end
        
        -- วิธี ข: เช็กผ่าน Attribute ของ Roblox ที่เกมส่วนใหญ่นิยมใช้เก็บสถานะ
        if targetChar:GetAttribute("SafeZone") or targetPlayer:GetAttribute("InSafeZone") then
            inSafeZone = true
        end
        
        if targetChar:GetAttribute("InCombat") or targetPlayer:GetAttribute("InCombat") then
            inCombat = true
        end
    end)
    
    -- 5. เงื่อนไข SafeZone: ถ้าเป้าหมายอยู่ในเซฟโซน ให้ละเว้น (ไม่โจมตี)
    if inSafeZone then
        return true
    end
    
    -- 6. เงื่อนไข PvP / Combat (เปิดใช้งานบรรทัดล่างนี้ หากต้องการโจมตีเฉพาะคนที่ติด Combat เท่านั้น)
    -- if not inCombat then 
    --     return true 
    -- end
    
    return false
end

-- ค้นหาเป้าหมายที่ใกล้ที่สุด (ปรับปรุงการกรองให้แม่นยำขึ้น)
local function GetClosestPlayerTarget()
    local character = LocalPlayer.Character
    local rootPart = character and character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return nil end

    local closestTarget = nil
    local shortestDistance = FollowDistance

    for _, otherPlayer in ipairs(Players:GetPlayers()) do
        local targetChar = otherPlayer.Character
        if targetChar and not ShouldIgnoreTarget(targetChar) then
            local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")
            local targetHumanoid = targetChar:FindFirstChildOfClass("Humanoid")
            
            -- เช็กว่าเป้าหมายยังไม่ตาย
            if targetRoot and targetHumanoid and targetHumanoid.Health > 0 then
                local distance = (rootPart.Position - targetRoot.Position).Magnitude
                if distance < shortestDistance then
                    shortestDistance = distance
                    closestTarget = targetChar
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

    -- ถ้าไม่มีเป้าหมาย หรือเป้าหมายปัจจุบันเข้าเงื่อนไขถูกเมิน ให้หาใหม่ทันที
    if not currentTarget or ShouldIgnoreTarget(currentTarget) then
        currentTarget = GetClosestPlayerTarget()
    end

    if currentTarget then
        local targetRoot = currentTarget:FindFirstChild("HumanoidRootPart")
        local targetHumanoid = currentTarget:FindFirstChildOfClass("Humanoid")

        -- เช็กว่าเป้าหมายตายหรือยัง
        if not targetHumanoid or targetHumanoid.Health <= 0 or not currentTarget.Parent then
            DisableFollowSystem("Target eliminated! Switching...")
            currentTarget = GetClosestPlayerTarget() -- พยายามหาเป้าหมายใหม่ต่อทันที
        elseif targetRoot then
            -- เทเลพอร์ตไปข้างหลังเป้าหมายอย่างแม่นยำ
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
            
            if FollowToggle and FollowToggle.Set then
                FollowToggle:Set(FollowEnabled)
            end
            
            if not FollowEnabled then 
                currentTarget = nil 
            end
        end
    end
end)















local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

local netModule = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Net")
local registerHit = netModule:WaitForChild("RE/RegisterHit")
local registerAttack = netModule:WaitForChild("RE/RegisterAttack")

local fastAttackConnection = nil

-- ฟังก์ชันหลักสำหรับเปิด-ปิดระบบโจมตีออร์โต้ (เฉพาะโจมตีปกติและรีโมทหลัก)
local function SetFastAttack(state)
    _G.FastAttackRunning = state
    
    if not state then
        if fastAttackConnection then
            fastAttackConnection:Disconnect()
            fastAttackConnection = nil
        end
        return
    end
    
    fastAttackConnection = RunService.Heartbeat:Connect(function()
        if not _G.FastAttackRunning then return end
        
        pcall(function()
            local char = player.Character
            if not char or not char:FindFirstChild("HumanoidRootPart") then return end
            local rootPart = char.HumanoidRootPart
            
            local function attackTarget(targetRoot)
                if targetRoot then
                    -- แก้ไขการส่ง Argument ตรงนี้เพื่อไม่ให้เกิด Syntax Error
                    registerHit:FireServer(targetRoot, {}, "211ee8ef")
                    registerAttack:FireServer(0.4000000059604645, 1)
                end
            end
            
            -- 1. ตีมอนสเตอร์ใน Workspace.Enemies
            local enemiesFolder = workspace:FindFirstChild("Enemies")
            if enemiesFolder then
                for _, enemy in ipairs(enemiesFolder:GetChildren()) do
                    local eRoot = enemy:FindFirstChild("HumanoidRootPart") or enemy:FindFirstChild("Head")
                    local hum = enemy:FindFirstChildOfClass("Humanoid")
                    if eRoot and hum and hum.Health > 0 and (rootPart.Position - eRoot.Position).Magnitude <= 60 then
                        attackTarget(eRoot)
                    end
                end
            end
            
            -- 2. ตีผู้เล่นคนอื่นในเซิร์ฟเวอร์
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= player then
                    local tChar = p.Character
                    if tChar and tChar:FindFirstChild("HumanoidRootPart") then
                        local tRoot = tChar.HumanoidRootPart
                        local hum = tChar:FindFirstChildOfClass("Humanoid")
                        if hum and hum.Health > 0 and (rootPart.Position - tRoot.Position).Magnitude <= 60 then
                            attackTarget(tRoot)
                        end
                    end
                end
            end
        end)
        
        task.wait()
    end)
end

-- ฮิตBox (ขยายหัวผู้เล่นอื่น)
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
        head.Transparency, head.CanCollide, head.CastShadow = 0, true, true
    end
end

RunService.RenderStepped:Connect(function()
    if not getgenv().HitboxEnabled then return end

    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player and p.Character then
            local char = p.Character
            local hum = char:FindFirstChildOfClass("Humanoid")
            
            if hum and hum.Health > 0 then
                local head = char:FindFirstChild("Head")
                if head then
                    local originalSize = head:FindFirstChild("OriginalSize")
                    if not originalSize then
                        originalSize = Instance.new("Vector3Value", head)
                        originalSize.Name, originalSize.Value = "OriginalSize", head.Size
                    end
                    
                    local selectionBox = head:FindFirstChild("CustomHitboxSelectionBox")
                    if getgenv().HitboxShowBox then
                        if not selectionBox then
                            selectionBox = Instance.new("SelectionBox", head)
                            selectionBox.Name = "CustomHitboxSelectionBox"
                        end
                        selectionBox.Adornee = head
                        selectionBox.Color3 = getgenv().HitboxColor
                        selectionBox.LineThickness = 0.001
                    elseif selectionBox then
                        selectionBox:Destroy()
                    end
                    
                    head.Size = Vector3.new(getgenv().HitboxSize, getgenv().HitboxSize, getgenv().HitboxSize)
                    head.Transparency, head.CanCollide, head.CastShadow = 1, false, false
                end
            else
                resetPlayerHitbox(char)
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
    Value = getgenv().SilentAimMode,
    Callback = function(selected)
        local mode = type(selected) == "table" and selected[1] or selected
        
        -- ถ้าอยู่โหมด FOV แล้วเปลี่ยนไปโหมดอื่น ให้บันทึกค่าปัจจุบันเก็บไว้ก่อน
        if getgenv().SilentAimMode == "FOV" and mode ~= "FOV" then
            getgenv().SavedFOVRadius = getgenv().FOVRadius
        end

        getgenv().SilentAimMode = mode
        
        -- ปรับค่า FOVRadius ตามโหมดที่เลือก
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
        
        -- ถ้าปรับขนาดตอนที่อยู่โหมด FOV ปกติ ให้บันทึกค่าเก็บไว้ใน SavedFOVRadius ด้วย
        if getgenv().SilentAimMode == "FOV" then
            getgenv().SavedFOVRadius = Value
        end
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
        Max = 50,
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
    Desc = "Increases your attack speed automatically",
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

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

-- จัดเก็บสถานะและฟังก์ชันกลาง
local IceWalkConfig = {
    GiantFloor = nil,
    FloorConnection = nil,
    FloorRunning = false
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
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if hum then
        hum:SetStateEnabled(Enum.HumanoidStateType.Swimming, true)
    end
end

function IceWalkUtils.GetOrCreateFloor()
    if not IceWalkConfig.GiantFloor or not IceWalkConfig.GiantFloor.Parent then
        local part = Instance.new("Part")
        part.Size = Vector3.new(1000, 1, 1000) -- ขยายขนาดให้กว้างขึ้นเล็กน้อยเพื่อรองรับการพุ่ง/วาปไม่ให้ตก
        part.Anchored = true
        part.CanCollide = true
        part.Transparency = 1 
        part.Material = Enum.Material.SmoothPlastic
        part.Parent = Workspace
        IceWalkConfig.GiantFloor = part
    end
    return IceWalkConfig.GiantFloor
end

GeneralTab:Toggle({
    Title = "Walking on Water",
    Desc = "เดินบนน้ำได้ 100% ไม่จม, ใช้สกิล, Soru และวาปได้ปกติ",
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

        IceWalkConfig.FloorConnection = RunService.RenderStepped:Connect(function(dt)
            if not IceWalkConfig.FloorRunning then return end

            local character = LocalPlayer.Character
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
            local seaLevel = - 2.9

            -- ยิง Raycast หาผิวน้ำ
            local rayResult = Workspace:Raycast(rootPart.Position + Vector3.new(0, 5, 0), Vector3.new(0, -50, 0), raycastParams)
            if rayResult and rayResult.Material == Enum.Material.Water then
                seaLevel = rayResult.Position.Y
            end

            -- ติดตามผู้เล่นทันทีเมื่อมีการวาปหรือพุ่ง (Lerp เร็วขึ้นเพื่อไม่ให้ดีเลย์)
            local targetPos = Vector3.new(rootPart.Position.X, seaLevel - 2, rootPart.Position.Z)
            floorPart.Position = floorPart.Position:Lerp(targetPos, 0.8)

            -- บังคับป้องกันการจมน้ำและสถานะว่ายน้ำเด็ดขาด
            if hum then
                hum:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
                hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
                
                if hum:GetState() == Enum.HumanoidStateType.Swimming or rootPart.Position.Y < (seaLevel + 3.5) then
                    hum:ChangeState(Enum.HumanoidStateType.Running)
                    -- ดึงตัวละครขึ้นมาเหนือผิวน้ำทันทีถ้าหลุดลงไป
                    if rootPart.Position.Y < seaLevel then
                        rootPart.CFrame = CFrame.new(rootPart.Position.X, seaLevel + 4, rootPart.Position.Z)
                    end
                end
            end
        end)
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



local UIKeybind = Config:Keybind({
    Title = "Interface Toggle",
    Desc = "Keybind to show or hide the user interface",
    Flag = "UIKeybindUIKeybind", 
    Value = "",
    Callback = function(key)
        Window:Toggle()
    end
})




local antiAfkConnection

Config:Toggle({
    Title = "Anti-AFK",
    Desc = "Prevents you from being kicked due to inactivity.",
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


-- ประกาศใช้บริการ RunService ของ Roblox
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

-- ฟังก์ชันสำหรับจัดการ Noclip เพื่อป้องกัน Error nil value
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

-- โค้ด Toggle สำหรับ UI Library ของคุณ
Config:Toggle({
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

Config:Toggle({
    Title = "Mobile Custom Toggles UI",
    Desc = "A modern mobile toggle menu with smooth animations and a master hide/show switch.",
    Flag = "MobileMobile",
    Value = true, -- ค่าเริ่มต้นให้แสดงผล
    Callback = function(Value)
        container.Visible = Value
    end,
})




local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local VirtualInputManager = game:GetService("VirtualInputManager")

-- รายการตัวเลือกอาวุธและสกิล
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

-- ตั้งค่าบล็อกคอมโบ (สามารถปรับเปลี่ยนอาวุธและสกิลได้ที่นี่)
local MacroSettings = {
    Block1 = { Weapon = "Sword", Skill = "X", Hold = 0, Wait = 0.4, Delay = 0.05 },
    Block2 = { Weapon = "Melee", Skill = "Z", Hold = 0, Wait = 0.4, Delay = 0.05 },
    Block3 = { Weapon = "Blox Fruit", Skill = "C", Hold = 0, Wait = 0.4, Delay = 0.05 },
    Block4 = { Weapon = "Gun", Skill = "V", Hold = 0, Wait = 0.4, Delay = 0.05 }
}

-- ตัวแปรสถานะการทำงาน
local isRunning = false
local macroEnabled = true

-- ฟังก์ชันจำลองการกดปุ่มคีย์บอร์ด
local function PressKey(keyName, holdDuration)
    local keyCode = Enum.KeyCode[keyName]
    if not keyCode then return end

    VirtualInputManager:SendKeyEvent(true, keyCode, false, game)
    task.wait(holdDuration > 0 and holdDuration or 0.03)
    VirtualInputManager:SendKeyEvent(false, keyCode, false, game)
end

-- ฟังก์ชันเลือกอาวุธ (กดปุ่ม 1, 2, 3, 4)
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
        VirtualInputManager:SendKeyEvent(true, keyToPress, false, game)
        task.wait(0.05)
        VirtualInputManager:SendKeyEvent(false, keyToPress, false, game)
    end
end

-- ฟังก์ชันสั่งใช้งานสกิลหรือแอคชันต่างๆ
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


_G.RunComboMacro = function()
    if not macroEnabled then return end
    if isRunning then return end
    
    task.spawn(function()
        isRunning = true
        
        for i = 1, 4 do
            local block = MacroSettings["Block" .. i]
            if block then
                EquipWeapon(block.Weapon)
                task.wait(0.08) -- หน่วงเวลาสลับอาวุธให้เสถียร
                
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

local SectionControl = Macro:Section({ Title = "Controls" })

Macro:Keybind({
    Title = "Run Combo Macro",
    Value = "",
    Flag = "RunComboMacro_Keybind",
    Callback = function(key)
        _G.RunComboMacro()
    end
})

-- ปุ่มกดเรียกใช้งานผ่าน createButton ด้านนอก (รองรับมือถือ)
createButton("Macro", Color3.fromRGB(), false, function(state)
    _G.RunComboMacro() 
end)















local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local localPlayer = Players.LocalPlayer



local autoBountyEnabled = false
local bountyConnection = nil
local safeModeActive = true
local isSafeEscaping = false
local safeModePercent = 30   
local safeStopPercent = 100
local flySpeed = 250

-- เก็บค่าตัวเลือกฝั่งตัวเราเอง และฝั่งที่จะล่า
local mySelectedFaction = "Marines"
local selectedTargetFaction = "All"

-- เก็บค่าเป็น Table สำหรับรองรับการเลือกหลายสกิล
local selectedMeleeSkills = {"Z"}
local selectedSwordSkills = {"Z"}
local selectedFruitSkills = {"Z"}

local safeZonesFolder = Workspace:FindFirstChild("_WorldOrigin") 
    and Workspace._WorldOrigin:FindFirstChild("SafeZones")

-- ฟังก์ชันเปิด-ปิด Noclip ตอนหนี Safe Mode
local function setSafeNoclip(state)
    local myChar = localPlayer.Character
    if not myChar then return end
    for _, part in ipairs(myChar:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = not state
        end
    end
end

-- ฟังก์ชันเช็คและเปลี่ยนฝั่งตัวละครอัตโนมัติ
local function checkAndSwitchTeam()
    pcall(function()
        local currentTeam = localPlayer.Team and localPlayer.Team.Name or ""
        if currentTeam ~= mySelectedFaction then
            local args = {
                "SetTeam2",
                mySelectedFaction
            }
            ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
            task.wait(1)
        end
    end)
end

local function shouldSkipTarget(targetPlayer, char)
    if targetPlayer == localPlayer then return true end
    
    if localPlayer.Team and localPlayer.Team.Name == "Marines" then
        if targetPlayer.Team and targetPlayer.Team == localPlayer.Team then 
            return true 
        end
    end
    
    return false
end

-- ฟังก์ชันจำลองการกดปุ่มสกิล (ปรับลดเวลาหน่วงเพื่อให้กดติดง่ายขึ้น)
local function pressKey(keyName)
    pcall(function()
        if type(keyName) == "table" then
            for k, v in pairs(keyName) do
                local targetKey = type(k) == "string" and k or v
                if targetKey and targetKey ~= "None" then
                    local keyCode = Enum.KeyCode[targetKey]
                    if keyCode then
                        VirtualInputManager:SendKeyEvent(true, keyCode, false, game)
                        task.wait(0.05)
                        VirtualInputManager:SendKeyEvent(false, keyCode, false, game)
                    end
                end
            end
        elseif type(keyName) == "string" and keyName ~= "None" then
            local keyCode = Enum.KeyCode[keyName]
            if keyCode then
                VirtualInputManager:SendKeyEvent(true, keyCode, false, game)
                task.wait(0.05)
                VirtualInputManager:SendKeyEvent(false, keyCode, false, game)
            end
        end
    end)
end

-- ฟังก์ชันถืออาวุธให้อัตโนมัติ (ถ้าไม่ได้เลือก toolType จะเก็บอาวุธทั้งหมด)
local function equipToolByType(toolType)
    local myChar = localPlayer.Character
    local backpack = localPlayer:FindFirstChildOfClass("Backpack")
    if not myChar then return end
    
    local humanoid = myChar:FindFirstChildOfClass("Humanoid")
    local currentTool = myChar:FindFirstChildOfClass("Tool")

    -- ถ้าไม่ได้ระบุ toolType หรือเป็นค่าว่าง/nil ให้เก็บอาวุธทั้งหมดที่มีออกจากตัวละคร
    if not toolType or toolType == "" then
        if currentTool and backpack then
            humanoid:UnequipTools() -- หรือจะใช้การสลับเข้า Backpack ตามความเหมาะสม
        end
        return
    end

    -- ตรวจสอบอาวุธที่ถืออยู่ปัจจุบันว่าตรงกับประเภทที่ต้องการไหม ถ้าตรงอยู่แล้วให้ข้ามไป
    if currentTool then
        local nameLower = currentTool.Name:lower()
        if toolType == "Melee" and (nameLower:find("combat") or nameLower:find("dark step") or nameLower:find("electro") or nameLower:find("water karate") or nameLower:find("dragon claw") or nameLower:find("superhuman") or nameLower:find("death step") or nameLower:find("sharkman karate") or nameLower:find("electric claw") or nameLower:find("dragon talon") or nameLower:find("godhuman") or nameLower:find("sanguine art")) then
            return
        elseif toolType == "Sword" and (currentTool.ToolTip == "Sword" or (currentTool:FindFirstChild("Handle") and not nameLower:find("fruit") and not nameLower:find("gun") and not nameLower:find("godhuman") and not nameLower:find("combat") and not nameLower:find("sanguine") and not nameLower:find("superhuman"))) then
            return
        elseif toolType == "Fruit" and (currentTool.ToolTip == "Blox Fruit" or currentTool:GetAttribute("Fruit") or nameLower:find("fruit") or nameLower:find("rocket") or nameLower:find("spin") or nameLower:find("chop") or nameLower:find("spring") or nameLower:find("bomb") or nameLower:find("smoke") or nameLower:find("spike") or nameLower:find("flame") or nameLower:find("falcon") or nameLower:find("ice") or nameLower:find("sand") or nameLower:find("dark") or nameLower:find("diamond") or nameLower:find("light") or nameLower:find("rubber") or nameLower:find("barrier") or nameLower:find("ghost") or nameLower:find("magma") or nameLower:find("quake") or nameLower:find("buddha") or nameLower:find("love") or nameLower:find("spider") or nameLower:find("sound") or nameLower:find("phoenix") or nameLower:find("portal") or nameLower:find("rumble") or nameLower:find("pain") or nameLower:find("blizzard") or nameLower:find("gravity") or nameLower:find("mammoth") or nameLower:find("t-rex") or nameLower:find("dough") or nameLower:find("shadow") or nameLower:find("venom") or nameLower:find("control") or nameLower:find("spirit") or nameLower:find("dragon") or nameLower:find("leopard") or nameLower:find("kitsune") or nameLower:find("gas") or nameLower:find("yeti")) then
            return
        elseif toolType == "Gun" and (currentTool.ToolTip == "Gun" or nameLower:find("gun") or nameLower:find("slingshot") or nameLower:find("musket") or nameLower:find("flintlock") or nameLower:find("cannon") or nameLower:find("kabucha") or nameLower:find("soul guitar") or nameLower:find("acidum rifle") or nameLower:find("bizarre rifle") or nameLower:find("bazooka")) then
            return
        end
    end

    -- รวบรวมไอเทมทั้งหมดจาก Backpack และ Character
    local itemsToCheck = {}
    if backpack then
        for _, item in ipairs(backpack:GetChildren()) do
            table.insert(itemsToCheck, item)
        end
    end
    for _, item in ipairs(myChar:GetChildren()) do
        table.insert(itemsToCheck, item)
    end

    -- ค้นหาและหยิบอาวุธที่ตรงกับประเภท
    for _, tool in ipairs(itemsToCheck) do
        if tool:IsA("Tool") then
            local nameLower = tool.Name:lower()
            local isMatch = false

            if toolType == "Melee" then
                if nameLower:find("combat") or nameLower:find("dark step") or nameLower:find("electro") or nameLower:find("water karate") or nameLower:find("dragon claw") or nameLower:find("superhuman") or nameLower:find("death step") or nameLower:find("sharkman karate") or nameLower:find("electric claw") or nameLower:find("dragon talon") or nameLower:find("godhuman") or nameLower:find("sanguine art") then
                    isMatch = true
                end
            elseif toolType == "Sword" then
                if tool.ToolTip == "Sword" or (tool:FindFirstChild("Handle") and not nameLower:find("fruit") and not nameLower:find("gun") and not nameLower:find("godhuman") and not nameLower:find("combat") and not nameLower:find("sanguine") and not nameLower:find("superhuman")) then
                    isMatch = true
                end
            elseif toolType == "Fruit" then
                if tool.ToolTip == "Blox Fruit" or tool:GetAttribute("Fruit") or 
                   nameLower:find("fruit") or nameLower:find("rocket") or nameLower:find("spin") or 
                   nameLower:find("chop") or nameLower:find("spring") or nameLower:find("bomb") or 
                   nameLower:find("smoke") or nameLower:find("spike") or nameLower:find("flame") or 
                   nameLower:find("falcon") or nameLower:find("ice") or nameLower:find("sand") or 
                   nameLower:find("dark") or nameLower:find("diamond") or nameLower:find("light") or 
                   nameLower:find("rubber") or nameLower:find("barrier") or nameLower:find("ghost") or 
                   nameLower:find("magma") or nameLower:find("quake") or nameLower:find("buddha") or 
                   nameLower:find("love") or nameLower:find("spider") or nameLower:find("sound") or 
                   nameLower:find("phoenix") or nameLower:find("portal") or nameLower:find("rumble") or 
                   nameLower:find("pain") or nameLower:find("blizzard") or nameLower:find("gravity") or 
                   nameLower:find("mammoth") or nameLower:find("t-rex") or nameLower:find("dough") or 
                   nameLower:find("shadow") or nameLower:find("venom") or nameLower:find("control") or 
                   nameLower:find("spirit") or nameLower:find("dragon") or nameLower:find("leopard") or 
                   nameLower:find("kitsune") or nameLower:find("gas") or nameLower:find("yeti") then
                    isMatch = true
                end
            elseif toolType == "Gun" then
                if tool.ToolTip == "Gun" or nameLower:find("gun") or nameLower:find("slingshot") or nameLower:find("musket") or nameLower:find("flintlock") or nameLower:find("cannon") or nameLower:find("kabucha") or nameLower:find("soul guitar") or nameLower:find("acidum rifle") or nameLower:find("bizarre rifle") or nameLower:find("bazooka") then
                    isMatch = true
                end
            end

            if isMatch then
                if humanoid then
                    humanoid:EquipTool(tool)
                    task.wait(0.05)
                    break
                end
            end
        end
    end
end


local lastComboTime = 0
local comboCooldown = 0.7

local function smoothFlyTo(targetCFrame, speed, deltaTime, targetChar, distanceToTarget)
    local myChar = localPlayer.Character
    if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then return end
    local myRoot = myChar.HumanoidRootPart

    local humanoid = myChar:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.PlatformStand = true
        for _, child in ipairs(myChar:GetDescendants()) do
            if child:IsA("BasePart") then
                child.Velocity = Vector3.new(0, 0, 0)
                child.RotVelocity = Vector3.new(0, 0, 0)
            end
        end
    end

    local targetPos = targetCFrame.Position
    
    -- ระบบดักทางเป้าหมาย (Prediction) แบบนุ่มนวล
    if targetChar and targetChar:FindFirstChild("HumanoidRootPart") then
        local targetRoot = targetChar.HumanoidRootPart
        targetPos = targetRoot.Position
        
        local targetHum = targetChar:FindFirstChildOfClass("Humanoid")
        local targetVelocity = targetRoot.AssemblyLinearVelocity
        local predictionMultiplier = 0.2
        
        local predictedPos = targetPos + (targetVelocity * predictionMultiplier)
        if targetHum and targetHum.MoveDirection.Magnitude > 0 then
            predictedPos = predictedPos + (targetHum.MoveDirection * 3)
        end
        targetPos = predictedPos
    end

    local currentPos = myRoot.Position
    local distance = (targetPos - currentPos).Magnitude
    
    -- 1. ดึงค่าระยะสูงสุดในการบินจาก Slider แรก
    local maxDistance = 300
    if Bounty and Bounty.Flags and Bounty.Flags.SafeModeDistanceSlider then
        maxDistance = Bounty.Flags.SafeModeDistanceSlider
    end

    -- 2. ดึงค่าระยะห่างจากตัวศัตรูจาก Slider ที่สอง
    local enemyDistanceOffset = 4
    if Bounty and Bounty.Flags and Bounty.Flags.EnemyDistanceSlider then
        enemyDistanceOffset = Bounty.Flags.EnemyDistanceSlider
    end
    
    -- ถ้าอยู่ในระยะที่ตั้งไว้ (แต่นอกระยะโจมตี) ให้เคลื่อนที่เข้าไปหาแบบ Smooth (Lerp)
    if distance <= maxDistance and distance > 15 then
        local idealCFrame = CFrame.new(targetPos) * CFrame.new(0, 3, enemyDistanceOffset)
        
        -- ใช้ Lerp เกลี่ยตำแหน่งให้ไหลลื่น ไม่กระตุก (ปรับเลข 15 ให้ช้า/เร็วได้ตามต้องการ)
        myRoot.CFrame = myRoot.CFrame:Lerp(idealCFrame, math.clamp(speed * deltaTime * 5, 0.05, 1))
        
        myRoot.Velocity = Vector3.new(0, 0, 0)
        myRoot.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        myRoot.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        return
    end

    -- หากระยะทางเข้าใกล้เป้าหมายในระยะโจมตีแล้ว (<= 15 studs) ล็อกตัวและทำคอมโบ
    if distance <= 15 then
        if targetChar and targetChar:FindFirstChild("HumanoidRootPart") then
            -- เกาะติดเป้าหมายแบบสมูทด้วย Lerp ป้องกันอาการสั่นเวลาเป้าหมายขยับ
            local combatCFrame = targetChar.HumanoidRootPart.CFrame * CFrame.new(0, 3, enemyDistanceOffset)
            myRoot.CFrame = myRoot.CFrame:Lerp(combatCFrame, 0.5)
        else
            myRoot.CFrame = CFrame.new(myRoot.Position, targetPos) * CFrame.new(0, 3, enemyDistanceOffset)
        end
        
        -- เคลียร์แรงฟิสิกส์ทั้งหมด
        myRoot.Velocity = Vector3.new(0, 0, 0)
        myRoot.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        myRoot.AssemblyAngularVelocity = Vector3.new(0, 0, 0)

        if tick() - lastComboTime >= comboCooldown then
            lastComboTime = tick()
            
            -- 1. หมัด (Melee)
            if type(selectedMeleeSkills) == "table" and #selectedMeleeSkills > 0 then
                equipToolByType("Melee")
                task.wait(0.1)
                for _, skill in ipairs(selectedMeleeSkills) do
                    if skill ~= "None" then
                        pressKey(skill)
                        task.wait()
                    end
                end
            end
            
            -- 2. ดาบ (Sword)
            if type(selectedSwordSkills) == "table" and #selectedSwordSkills > 0 then
                equipToolByType("Sword")
                task.wait(0.1)
                for _, skill in ipairs(selectedSwordSkills) do
                    if skill ~= "None" then
                        pressKey(skill)
                        task.wait()
                    end
                end
            end
            
            -- 3. ผลไม้ (Fruit)
            if type(selectedFruitSkills) == "table" and #selectedFruitSkills > 0 then
                equipToolByType("Fruit")
                task.wait(0.1)
                for _, skill in ipairs(selectedFruitSkills) do
                    if skill ~= "None" then
                        pressKey(skill)
                        task.wait()
                    end
                end
            end
            
            -- 4. ปืน (Gun)
            if type(selectedGunSkills) == "table" and #selectedGunSkills > 0 then
                equipToolByType("Gun")
                task.wait(0.1)
                for _, skill in ipairs(selectedGunSkills) do
                    if skill ~= "None" then
                        pressKey(skill)
                        task.wait()
                    end
                end
            end
        end
    elseif distance > maxDistance then
        -- ถ้าไกลกว่าระยะที่ตั้งไว้ ให้บินเข้าหาแบบสมูท
        local direction = (targetPos - currentPos).Unit
        local step = speed * deltaTime
        if step > distance then
            step = distance
        end
        local targetFlyCFrame = CFrame.new(currentPos + (direction * step), targetPos)
        myRoot.CFrame = myRoot.CFrame:Lerp(targetFlyCFrame, 0.8)
        myRoot.Velocity = Vector3.new(0, 0, 0)
    end
end


local function runAutoBounty(deltaTime)
    if not autoBountyEnabled then return end

    local myChar = localPlayer.Character
    if not myChar or not myChar:FindFirstChild("HumanoidRootPart") or not myChar:FindFirstChildOfClass("Humanoid") then return end
    local myRoot = myChar.HumanoidRootPart
    local humanoid = myChar:FindFirstChildOfClass("Humanoid")

    -- คำนวณเปอร์เซ็นต์เลือดปัจจุบัน
    local currentHpPercent = (humanoid.Health / humanoid.MaxHealth) * 100

    -- 1. ระบบ Safe Mode (เช็คและบังคับหนีทันทีเมื่อเลือดต่ำกว่าเกณฑ์)
    if safeModeActive and humanoid.Health > 0 then
        -- เริ่มกระบวนการหนีฉุกเฉิน
        if currentHpPercent <= safeModePercent and not isSafeEscaping then
            isSafeEscaping = true
            setSafeNoclip(true)
            myRoot.AssemblyLinearVelocity = Vector3.new(0, flySpeed, 0)
            myRoot.AssemblyAngularVelocity = Vector3.zero
            myChar:PivotTo(myRoot.CFrame + Vector3.new(0, 550, 0))
            humanoid.PlatformStand = true
            if notify then notify("Safe Mode", "Critical HP! Emergency teleport & high-speed flight activated!") end
        end

        -- ขณะกำลังหนี (ล็อคสถานะ ห้ามวิ่งไปหาเป้าหมายเด็ดขาด)
        if isSafeEscaping then
            humanoid.PlatformStand = true
            setSafeNoclip(true)
            myRoot.AssemblyLinearVelocity = Vector3.new(0, flySpeed, 0)
            myRoot.AssemblyAngularVelocity = Vector3.zero
            
            -- หยุดหนีเมื่อเลือดฟื้นกลับมาถึงเกณฑ์ปลอดภัย (safeStopPercent)
            if currentHpPercent >= safeStopPercent then
                isSafeEscaping = false
                humanoid.PlatformStand = false
                setSafeNoclip(false)
                myRoot.AssemblyLinearVelocity = Vector3.zero
                if notify then notify("Safe Mode", "HP fully restored. Resuming normal operations.") end
            end
            
            -- ตัดจบการทำงานในรอบนี้ทันที ไม่ให้ไปทำระบบล่าต่อขณะกำลังหนี
            return 
        end
    end

    -- 2. ระบบ Auto Bounty (ค้นหาและพุ่งเข้าหาเป้าหมาย เมื่อไม่ได้อยู่ในโหมดหนี)
    local nearestTargetRoot = nil
    local nearestTargetChar = nil
    local shortestDistance = math.huge

    for _, targetPlayer in ipairs(Players:GetPlayers()) do
        if targetPlayer ~= localPlayer then
            local char = targetPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                local targetHum = char:FindFirstChildOfClass("Humanoid")
                local targetRoot = char:FindFirstChild("HumanoidRootPart")

                if targetHum and targetHum.Health > 0 and targetRoot then
                    if not shouldSkipTarget(targetPlayer, char) then
                        local inCombat = false 
                        local inSafeZone = false
                        
                        pcall(function()
                            if isPlayerInCombat then inCombat = isPlayerInCombat(targetPlayer, char) end
                            if isPlayerInSafeZone then inSafeZone = isPlayerInSafeZone(targetPlayer, char) end
                        end)

                        if not inSafeZone then
                            local pvpDisabled = targetPlayer:GetAttribute("PvpDisabled")
                            if char:GetAttribute("PvpDisabled") ~= nil then
                                pvpDisabled = char:GetAttribute("PvpDisabled")
                            end

                            if pvpDisabled ~= true then
                                local distance = (targetRoot.Position - myRoot.Position).Magnitude
                                if distance < shortestDistance then
                                    shortestDistance = distance
                                    nearestTargetRoot = targetRoot
                                    nearestTargetChar = char
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    if nearestTargetRoot then
        smoothFlyTo(nearestTargetRoot.CFrame, flySpeed, deltaTime, nearestTargetChar, shortestDistance)
    else
        humanoid.PlatformStand = false
    end
end

-- ==========================================
-- UI: Slider สำหรับปรับค่าเปอร์เซ็นต์เลือด Safe Mode
-- ==========================================

Bounty:Slider({
    Title = "Safe Mode ",
    Increment = 1,
    Value = {
        Min = 10,
        Max = 100,
        Default = 30
    },
    Flag = "SafeModePercentSlider",
    Callback = function(value)
        safeModePercent = value
    end,
})

-- ==========================================
-- UI: Toggle ควบคุมเปิด/ปิด Auto Bounty
-- ==========================================
local Toggle = Bounty:Toggle({
    Title = "Auto Bounty",
    Desc = "Automatically hunt bounty for you",
    Flag = "AutoBounty_Toggle",
    Callback = function(state)
        autoBountyEnabled = state

        -- เคลียร์ Connection เก่าทิ้งก่อนเสมอ ป้องกันการรันซ้อน
        if bountyConnection then
            bountyConnection:Disconnect()
            bountyConnection = nil
        end

        if autoBountyEnabled then
            if checkAndSwitchTeam then checkAndSwitchTeam() end
            
            -- รันผ่าน Heartbeat เพียงตัวเดียวเพื่อความลื่นไหลและเสถียรสูงสุด
            bountyConnection = RunService.Heartbeat:Connect(function(deltaTime)
                runAutoBounty(deltaTime)
            end)
        else
            isSafeEscaping = false
            setSafeNoclip(false)
            if localPlayer.Character and localPlayer.Character:FindFirstChildOfClass("Humanoid") then
                localPlayer.Character.Humanoid.PlatformStand = false
            end
        end
    end
})


local Toggle = Bounty:Toggle({
    Title = "Enable PvP",
    Desc = "Automatically enables PvP combat continuously",
    Flag = "Toggle_EnablePvP",
    Default = false,
    Callback = function(state)
        -- เก็บสถานะการทำงานของลูป
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
                    
                    if success then
                    else
                        warn("Failed to enable PvP: " .. tostring(err))
                    end
                    
                    -- หน่วงเวลา 5 วินาทีต่อรอบ (สามารถปรับลดหรือเพิ่มเวลาได้ตามต้องการ เช่น 3 หรือ 10)
                    task.wait(5)
                end
            end)
        else
        end
    end
})

local DropdownMyFaction = Bounty:Dropdown({
    Title = "Auto Team",
    Desc = "Select your faction. The system will check and switch automatically.",
    Values = {"Marines", "Pirates"},
    Value = "Marines",
    Multi = false,
    Locked = false,
    Flag = "my_faction_select",
    Callback = function(selected)
        mySelectedFaction = selected -- บันทึกค่าที่เลือกเก็บไว้เฉยๆ
    end
})


local HideShowUI = Bounty:Section({ Title = "Set Skills" })

local DropdownMelee = Bounty:Dropdown({
    Title = "Melee",
    Desc = "Select Melee skills (Supports all fighting styles in the game)",
    Values = {"Z", "X", "C", "None"},
    Value = {"Z"},
    Multi = true,
    Locked = false,
    Flag = "melee_skill_multi",
    Callback = function(selected)
        selectedMeleeSkills = selected
    end
})

-- UI Dropdown Sword
local DropdownSword = Bounty:Dropdown({
    Title = "Sword",
    Desc = "Select Sword skills (Supports all swords in the game)",
    Values = {"Z", "X", "None"},
    Value = {"Z"},
    Multi = true,
    Locked = false,
    Flag = "sword_skill_multi",
    Callback = function(selected)
        selectedSwordSkills = selected
    end
})

-- UI Dropdown Fruit
local DropdownFruit = Bounty:Dropdown({
    Title = "Blox Fruit",
    Desc = "Select Blox Fruit skills (Supports all fruits in the game)",
    Values = {"Z", "X", "C", "V", "F", "None"},
    Value = {"Z"},
    Multi = true,
    Locked = false,
    Flag = "fruit_skill_multi",
    Callback = function(selected)
        selectedFruitSkills = selected
    end
})

-- UI Dropdown Gun
local DropdownGun = Bounty:Dropdown({
    Title = "Gun",
    Desc = "Select Gun skills (Supports all guns in the game)",
    Values = {"Z", "X", "None"},
    Value = {"Z"},
    Multi = true,
    Locked = false,
    Flag = "gun_skill_multi",
    Callback = function(selected)
        selectedGunSkills = selected
    end
})
