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

-- ตั้งค่าธีม
pcall(function()
    WindUI:AddTheme({
        Name = "Cyberpunk Neon",
        Accent = Color3.fromHex("#FF007F"),
        Background = Color3.fromHex("#0A0A0F"),
        Outline = Color3.fromHex("#FF007F"),
        Text = Color3.fromHex("#FFFFFF"),
        Placeholder = Color3.fromHex("#8E6B8C"),
        Button = Color3.fromHex("#1F1424"),
        Icon = Color3.fromHex("#FF007F"),
        Toggle = Color3.fromHex("#FF007F"),
        ToggleBar = Color3.fromHex("#FFFFFF"),
        SliderIcon = Color3.fromHex("#FF007F"),
        Slider = Color3.fromHex("#A855F7"),
        SliderThumb = Color3.fromHex("#FFFFFF"),
        SliderIconFrom = Color3.fromHex("#FF007F"),
        SliderIconTo = Color3.fromHex("#00F0FF"),
        Notification = Color3.fromHex("#0A0A0F"),
        NotificationTitle = Color3.fromHex("#FF007F"),
        NotificationTitleTransparency = 0,
        NotificationContent = Color3.fromHex("#FFFFFF"),
        NotificationContentTransparency = 0.3,
        NotificationDuration = Color3.fromHex("#00F0FF"),
        NotificationDurationTransparency = 0.9,
        NotificationBorder = Color3.fromHex("#FF007F"),
        NotificationBorderTransparency = 0.5,
    })
end)

-- สร้างหน้าต่าง UI หลัก
local windowSuccess, Window = pcall(function()
    return WindUI:CreateWindow({
        Title = "Destiny Hub",
        Icon = "rbxassetid://107885166490282",
        Author = "Version Free",
        Folder = "Destiny Hub",
        Size = UDim2.fromOffset(600, 480),
        Transparent = true,
        Theme = "Cyberpunk Neon",
        Resizable = true,
        SideBarWidth = 200,
        HideSearchBar = false,
        ScrollBarEnabled = true,
        BackgroundImageTransparency = 0.3,
    })
end)

if windowSuccess and Window then
    getgenv().DestinyHubWindow = Window
else
    warn("Destiny Hub: ไม่สามารถสร้างหน้าต่าง UI ได้")
end

Window:Tag({
    Title = "Mobile/PC",
    Icon = "",
    Color = Color3.fromHex("#FF007F"), 
})




Window:Section({
    Title = "Main Features",
})

local GeneralTab = Window:Tab({
    Title = "General",
    Icon = "gauge"
})
GeneralTab:Select()

local CombatTab = Window:Tab({
    Title = "Combat",
    Icon = "swords"
})

local Visuals = Window:Tab({
    Title = "Visuals",
    Icon = "crosshair" 
})

local FPSBoost = Window:Tab({
    Title = "FPS Boost",
    Icon = "activity"
})
Window:Section({
    Title = "Config & Server",
})

local Server = Window:Tab({
    Title = "Server",
    Icon = "terminal"
})

local Config = Window:Tab({
    Title = "Config",
    Icon = "wrench"
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
    task.wait(1)
    pcall(function()
        MyConfig:Load()
    end)
end)





getgenv().FOVRadius = getgenv().FOVRadius or 270
getgenv().MaxDistance = getgenv().MaxDistance or 800
getgenv().SilentAimEnabled = getgenv().SilentAimEnabled ~= false and true
getgenv().ShowFOV = getgenv().ShowFOV ~= false and true
getgenv().ShowTracer = getgenv().ShowTracer ~= false and true
getgenv().CurrentTarget = nil
getgenv().FOVPositionMode = getgenv().FOVPositionMode or "Middle" 
getgenv().LockedPartName = "Head"

getgenv().PredictionEnabled = getgenv().PredictionEnabled ~= false and true
getgenv().PredictionFactor = getgenv().PredictionFactor or 0.135
getgenv().CamlockEnabled = getgenv().CamlockEnabled ~= false and true

-- โค้ดสี
local FOVThemeColor = Color3.fromRGB(96, 205, 255)   -- สีวงกลม FOV (ฟ้า)
local SnaplineThemeColor = Color3.fromRGB(255, 60, 60) -- สีเส้นล็อกเป้า (แดง)

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
local SafeZones = Workspace:FindFirstChild("_WorldOrigin") and Workspace._WorldOrigin:FindFirstChild("SafeZones")

-- เช็คสถานะการต่อสู้ (Combat)
local function isPlayerInCombat(player, char)
    if not player then return false end
    if player:GetAttribute("InCombat") or player:GetAttribute("Combat") or player:GetAttribute("CombatTag") then return true end
    
    local cTime = player:GetAttribute("CombatTimer") or player:GetAttribute("InCombatTime")
    if type(cTime) == "number" and cTime > workspace:GetServerTimeNow() then return true end

    if char then
        if char:GetAttribute("InCombat") or char:GetAttribute("Combat") or char:GetAttribute("CombatTag") then return true end
        local obj = char:FindFirstChild("InCombat") or char:FindFirstChild("Combat") or char:FindFirstChild("CombatTag") or char:FindFirstChild("PvpTag")
        if obj then return obj:IsA("ValueBase") and (obj:IsA("BoolValue") and obj.Value or obj:IsA("NumberValue") and obj.Value > 0 or obj:IsA("StringValue") and obj.Value ~= "" or true) end
    end
    return false
end

-- เช็คพื้นที่ปลอดภัย (Safe Zone)
local function isInSafeZoneRadius(char)
    if not char or not char:FindFirstChild("HumanoidRootPart") or not SafeZones then return false end
    local pos = char.HumanoidRootPart.Position
    for _, zone in ipairs(SafeZones:GetChildren()) do
        if zone:IsA("BasePart") then
            local mesh = zone:FindFirstChildOfClass("SpecialMesh")
            local radius = (mesh and mesh.Scale.X / 2 * math.max(zone.Size.X, zone.Size.Z)) or (math.max(zone.Size.X, zone.Size.Z) / 2)
            if (pos - zone.Position).Magnitude <= radius then return true end
        end
    end
    return false
end

local function isPlayerInSafeZone(player, char)
    if isPlayerInCombat(player, char) then return false end
    return (player:GetAttribute("SafeZone") or (char and char:GetAttribute("SafeZone")) or isInSafeZoneRadius(char) or (char and char:FindFirstChild("TempSafeZone"))) == true
end

-- เช็คว่าควรข้ามเป้าหมายนี้หรือไม่
local function ShouldIgnoreTarget(targetChar)
    local targetPlayer = Players:GetPlayerFromCharacter(targetChar)
    if not targetPlayer or targetPlayer == LocalPlayer or targetPlayer:GetAttribute("PvpDisabled") == true or isPlayerInSafeZone(targetPlayer, targetChar) then return true end
    if LocalPlayer.Team and targetPlayer.Team == LocalPlayer.Team and LocalPlayer.Team.Name == "Marines" then return true end
    local hum = targetChar:FindFirstChildOfClass("Humanoid")
    return hum and hum.Health <= 0
end

-- ดึงสถานะสำหรับ ESP
local function getPlayerStatus(player)
    local char = player.Character
    local pvp = player:GetAttribute("PvpDisabled") == true and "ปิด PvP" or "เปิด PvP"
    local combat = isPlayerInCombat(player, char)
    local inSafeZone = isPlayerInSafeZone(player, char)
    
    local zoneStatus = (combat and isInSafeZoneRadius(char) and "Safe Zone (Combat Bypass)") or (inSafeZone and "Safe Zone") or "Normal Zone"
    return string.format("%s | %s | %s", pvp, zoneStatus, combat and "InCombat" or "Ready")
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

-- ค้นหาเป้าหมายที่อยู่ใน FOV
local function GetTargetInFOV(refPos)
    local ClosestTarget = nil
    local ShortestDistance = (getgenv().FOVRadius >= 99999) and 99999 or getgenv().FOVRadius

    local myChar = LocalPlayer.Character
    local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local targetPart = player.Character:FindFirstChild(getgenv().LockedPartName) or player.Character:FindFirstChild("HumanoidRootPart")
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")

            if targetPart and humanoid and humanoid.Health > 0 then
                if not ShouldIgnoreTarget(player.Character) then
                    local worldDistance = myHRP and (targetPart.Position - myHRP.Position).Magnitude or 0
                    if worldDistance <= getgenv().MaxDistance then
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
    end
    return ClosestTarget
end












local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

if getgenv()._SilentAimLoaded then 
    warn("Already loaded!") 
    return 
end

getgenv()._SilentAimLoaded = true
getgenv().SilentAimEnabled = getgenv().SilentAimEnabled or false
getgenv().CurrentTarget = getgenv().CurrentTarget or nil

local function getRoot()
    local t = getgenv().CurrentTarget
    return (t and t.Parent) and t.Parent:FindFirstChild("HumanoidRootPart") or nil
end

pcall(function()
    local mouse = LocalPlayer:GetMouse()
    if not hookmetamethod then return end

    local oldIndex
    oldIndex = hookmetamethod(game, "__index", function(self, idx)
        if getgenv().SilentAimEnabled and self == mouse then
            if idx == "Hit" or idx == "Target" or idx == "X" or idx == "Y" then
                local r = getRoot()
                if r then
                    if idx == "Hit" then 
                        return CFrame.new(r.Position) 
                    elseif idx == "Target" then 
                        return r 
                    elseif idx == "X" then 
                        local sp = Camera:WorldToScreenPoint(r.Position)
                        return sp.X
                    elseif idx == "Y" then 
                        local sp = Camera:WorldToScreenPoint(r.Position)
                        return sp.Y
                    end
                end
            end
        end
        return oldIndex(self, idx)
    end)

    local oldNamecall
    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        if getgenv().SilentAimEnabled and getgenv().CurrentTarget then
            if method == "ScreenPointToRay" or method == "ViewportPointToRay" then
                local r = getRoot()
                if r then 
                    return Ray.new(Camera.CFrame.Position, (r.Position - Camera.CFrame.Position).Unit * 1000) 
                end
            end
        end
        return oldNamecall(self, ...)
    end)
end)





pcall(function()
    local gmt = getrawmetatable(game)
    local oldNamecall = gmt.__namecall
    setreadonly(gmt, false)

    gmt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        local args = { ... }

        -- ตรวจสอบเงื่อนไข Silent Aim และ Target
        if getgenv().SilentAimEnabled and getgenv().CurrentTarget and (method == "FireServer" or method == "InvokeServer") then
            local targetPos = GetPredictedPosition(getgenv().CurrentTarget)
            
            for i, arg in ipairs(args) do
                if typeof(arg) == "Vector3" then
                    -- ถ้าอาร์กิวเมนต์เป็น Vector3 (ตำแหน่งเป้าหมาย) เปลี่ยนเป็นตำแหน่งศัตรู
                    args[i] = targetPos
                elseif typeof(arg) == "CFrame" then
                    -- ถ้าอาร์กิวเมนต์เป็น CFrame (ตำแหน่ง + ทิศทางสกิล) ให้รักษา rotation เดิมแต่เปลี่ยนตำแหน่ง (Position) ไปที่ศัตรู
                    local _, _, _, r00, r01, r02, r10, r11, r12, r20, r21, r22 = arg:GetComponents()
                    args[i] = CFrame.new(
                        targetPos.X, targetPos.Y, targetPos.Z,
                        r00, r01, r02, r10, r11, r12, r20, r21, r22
                    )
                end
            end
            
            return oldNamecall(self, table.unpack(args))
        end

        return oldNamecall(self, ...)
    end)

    setreadonly(gmt, true)
end)











RunService.RenderStepped:Connect(function()
    if not LocalPlayer.Character or not Workspace.CurrentCamera then
        if FOVUI then FOVUI.Visible = false end
        if Snapline then Snapline.Visible = false end
        getgenv().CurrentTarget = nil
        return
    end

    local refPos = GetReferencePosition()
    
    if FOVUI then
        FOVUI.Visible = getgenv().ShowFOV
        if FOVUI.Visible then
            FOVUI.Position = UDim2.new(0, refPos.X, 0, refPos.Y)
            local size = getgenv().FOVRadius * 2
            FOVUI.Size = UDim2.new(0, size, 0, size)
        end
    end

    if not getgenv().SilentAimEnabled and not getgenv().CamlockEnabled then
        getgenv().CurrentTarget = nil
        if Snapline then Snapline.Visible = false end
        return
    end

    getgenv().CurrentTarget = GetTargetInFOV(refPos)

    if getgenv().CamlockEnabled and getgenv().CurrentTarget then
        local targetPos = GetPredictedPosition(getgenv().CurrentTarget)
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetPos)
    end

    if getgenv().CurrentTarget and getgenv().ShowTracer and Snapline then
        local targetPart = getgenv().CurrentTarget
        -- ป้องกันกรณี targetPart เป็น Model แทนที่จะเป็น BasePart ให้ดึง HumanoidRootPart แทน
        if targetPart:IsA("Model") then
            targetPart = targetPart:FindFirstChild("HumanoidRootPart") or targetPart.PrimaryPart
        end

        if targetPart then
            local targetScreenPos, targetOnScreen = Camera:WorldToViewportPoint(targetPart.Position)

            if targetOnScreen then
                local startPos
                local originType = getgenv().TracerOrigin or "Center" 
                
                if originType == "Center" then
                    startPos = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                elseif originType == "Bottom" then
                    startPos = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                else
                    local myCharacter = LocalPlayer.Character
                    local myRootPart = myCharacter and (myCharacter:FindFirstChild("HumanoidRootPart") or myCharacter:FindFirstChild("Torso"))
                    if myRootPart then
                        local myScreenPos, myOnScreen = Camera:WorldToViewportPoint(myRootPart.Position)
                        startPos = Vector2.new(myScreenPos.X, myScreenPos.Y)
                    else
                        startPos = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                    end
                end

                Snapline.From = startPos
                Snapline.To = Vector2.new(targetScreenPos.X, targetScreenPos.Y)
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












--เดินบนน้ำ

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
_G.WaterGodMode = _G.WaterGodMode or false

local platform = nil
local connection = nil

local function getOrCreatePlatform()
    if not platform or not platform.Parent then
        platform = Instance.new("Part")
        platform.Size = Vector3.new(100, 1, 100) 
        platform.Anchored = true
        platform.CanCollide = true
        platform.Transparency = 1 -- ล่องหน
        platform.Material = Enum.Material.ForceField
        platform.Parent = nil
    end
    return platform
end

local function ToggleWaterGodMode(state)
    _G.WaterGodMode = state
    
    if not state then
        if connection then 
            connection:Disconnect() 
            connection = nil 
        end
        if platform then 
            platform:Destroy() 
            platform = nil 
        end
        return
    end

    local currentPlatform = getOrCreatePlatform()
    
    connection = RunService.Heartbeat:Connect(function()
        if not _G.WaterGodMode then return end
        
        local character = LocalPlayer.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then
            if currentPlatform.Parent then currentPlatform.Parent = nil end
            return
        end
        
        local map = Workspace:FindFirstChild("Map")
        local waterPlane = map and map:FindFirstChild("WaterBase-Plane")
        
        local rootPart = character.HumanoidRootPart
        local hum = character:FindFirstChildOfClass("Humanoid")
        
        if waterPlane then
            local waterY = waterPlane.Position.Y
            
            if rootPart.Position.Y <= (waterY + 5) then
                if currentPlatform.Parent ~= Workspace then
                    currentPlatform.Parent = Workspace
                end
                
                currentPlatform.Position = Vector3.new(rootPart.Position.X, waterY, rootPart.Position.Z)
                
                if hum then
                    hum:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
                    if hum:GetState() == Enum.HumanoidStateType.Swimming then
                        hum:ChangeState(Enum.HumanoidStateType.Running)
                    end
                end
            else
                if currentPlatform.Parent == Workspace then
                    currentPlatform.Parent = nil
                end
            end
        else
            if currentPlatform.Parent == Workspace then
                currentPlatform.Parent = nil
            end
        end
    end)
end

ToggleWaterGodMode(true)






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
        if currentTime - lastCheck < 0.5 then return end -- เช็คทุกๆ 0.5 วินาที ไม่ให้ส่งถี่เกินไป
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













-- ESP with SafeZone Integration (Fixed & Optimized)
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
    ShowPvP = true,
    ShowCombat = true,
    ShowSafeZone = true,
    ShowAllTeams = false,
    Pirates = true,
    Marines = true,
}

local COLORS = {
    Pirates = Color3.fromRGB(255, 75, 75),
    Marines = Color3.fromRGB(80, 170, 255),
    Neutral = Color3.fromRGB(200, 200, 200),
    White = Color3.fromRGB(255, 255, 255),
    HP = Color3.fromRGB(0, 255, 128),
    HPBG = Color3.fromRGB(15, 15, 20),
    Level = Color3.fromRGB(255, 215, 0),
    Bounty = Color3.fromRGB(255, 105, 180),
    PvPOn = Color3.fromRGB(120, 255, 0),
    PvPOff = Color3.fromRGB(255, 50, 120),
    Combat = Color3.fromRGB(255, 230, 0),
    SafeZoneOn = Color3.fromRGB(0, 200, 255),
    SafeZoneOff = Color3.fromRGB(255, 120, 0),
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
            
            local distance = (charPos - zonePos).Magnitude
            if distance <= radius then
                return true
            end
        end
    end
    
    return false
end

local function GetTeamInfo(player)
    if ESPConfig.ShowAllTeams then
        local team = player.Team
        local teamName = team and team.Name or "Player"
        return teamName, COLORS.White, true
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
    if data then
        local level = data:FindFirstChild("Level")
        if level then return level.Value end
    end
    local leaderstats = player:FindFirstChild("leaderstats")
    if leaderstats then
        local level = leaderstats:FindFirstChild("Level")
        if level then return level.Value end
    end
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
                if pvpLbl then pvpLbl.Visible = (ESPConfig.ShowPvP or ESPConfig.ShowCombat or ESPConfig.ShowSafeZone) end
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
        gui.Size = UDim2.fromOffset(240, 110)
        gui.StudsOffset = Vector3.new(0, 3.2, 0)
        gui.AlwaysOnTop = true
        gui.Enabled = teamEnabled
        gui.Parent = head

        local container = Instance.new("Frame")
        container.Name = "Container"
        container.Size = UDim2.new(1, 0, 1, 0)
        container.BackgroundTransparency = 1
        container.Parent = gui

        local nameLabel = Instance.new("TextLabel")
        nameLabel.Name = "NameLabel"
        nameLabel.BackgroundTransparency = 1
        nameLabel.Size = UDim2.new(1, 0, 0, 20)
        nameLabel.Position = UDim2.new(0, 0, 0, 0)
        nameLabel.Visible = ESPConfig.ShowName
        nameLabel.RichText = true
        nameLabel.TextSize = 14
        nameLabel.Font = Enum.Font.GothamBold
        nameLabel.TextStrokeTransparency = 0.1
        nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        nameLabel.Parent = container

        local pvpLabel = Instance.new("TextLabel")
        pvpLabel.Name = "PvPLabel"
        pvpLabel.BackgroundTransparency = 1
        pvpLabel.Size = UDim2.new(1, 0, 0, 16)
        pvpLabel.Position = UDim2.new(0, 0, 0, 22)
        pvpLabel.Visible = (ESPConfig.ShowPvP or ESPConfig.ShowCombat or ESPConfig.ShowSafeZone)
        pvpLabel.RichText = true
        pvpLabel.TextSize = 12
        pvpLabel.Font = Enum.Font.GothamSemibold
        pvpLabel.TextStrokeTransparency = 0.2
        pvpLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        pvpLabel.Parent = container

        local levelLabel = Instance.new("TextLabel")
        levelLabel.Name = "LevelLabel"
        levelLabel.BackgroundTransparency = 1
        levelLabel.Size = UDim2.new(1, 0, 0, 16)
        levelLabel.Position = UDim2.new(0, 0, 0, 40)
        levelLabel.Visible = ESPConfig.ShowLevel
        levelLabel.Text = "⭐ Level: " .. tostring(GetLevel(player))
        levelLabel.TextColor3 = COLORS.Level
        levelLabel.TextSize = 12
        levelLabel.Font = Enum.Font.GothamBold
        levelLabel.TextStrokeTransparency = 0.2
        levelLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        levelLabel.Parent = container

        local bountyLabel = Instance.new("TextLabel")
        bountyLabel.Name = "BountyLabel"
        bountyLabel.BackgroundTransparency = 1
        bountyLabel.Size = UDim2.new(1, 0, 0, 16)
        bountyLabel.Position = UDim2.new(0, 0, 0, 58)
        bountyLabel.Visible = ESPConfig.ShowBounty
        bountyLabel.Text = "🔥 Bounty: " .. FormatNumber(GetBounty(player))
        bountyLabel.TextColor3 = COLORS.Bounty
        bountyLabel.TextSize = 12
        bountyLabel.Font = Enum.Font.GothamBold
        bountyLabel.TextStrokeTransparency = 0.2
        bountyLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        bountyLabel.Parent = container

        local hpBG = Instance.new("Frame")
        hpBG.Name = "HPBG"
        hpBG.Size = UDim2.new(0.7, 0, 0, 7)
        hpBG.Position = UDim2.new(0.15, 0, 0, 80)
        hpBG.Visible = ESPConfig.ShowHealth
        hpBG.BackgroundColor3 = COLORS.HPBG
        hpBG.BorderSizePixel = 0
        hpBG.Parent = container

        local hpCornerBG = Instance.new("UICorner")
        hpCornerBG.CornerRadius = UDim.new(1, 0)
        hpCornerBG.Parent = hpBG

        local hpStroke = Instance.new("UIStroke")
        hpStroke.Thickness = 1.2
        hpStroke.Color = Color3.fromRGB(255, 255, 255)
        hpStroke.Transparency = 0.6
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
                distStr = string.format(" <font color=\"rgb(160,160,175)\">[%dm]</font>", distance)
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
            
            local parts = {}
            if ESPConfig.ShowPvP then
                table.insert(parts, string.format("PvP:<font color=\"rgb(%d,%d,%d)\">%s</font>", math.floor(pvpColor.R*255), math.floor(pvpColor.G*255), math.floor(pvpColor.B*255), pvpText))
            end
            if ESPConfig.ShowSafeZone then
                table.insert(parts, string.format("<font color=\"rgb(%d,%d,%d)\">%s</font>", math.floor(safeColor.R*255), math.floor(safeColor.G*255), math.floor(safeColor.B*255), safeText))
            end
            if ESPConfig.ShowCombat then
                table.insert(parts, string.format("<font color=\"rgb(%d,%d,%d)\">%s</font>", math.floor(combatColor.R*255), math.floor(combatColor.G*255), math.floor(combatColor.B*255), combatText))
            end

            pvpLabel.Text = "⚡ " .. table.concat(parts, " | ")
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
                        bountyLabel.Text = "🔥 Bounty: " .. FormatNumber(newValue)
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

    player.Destroying:Connect(function()
        Cleanup()
    end)
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
    local targetPlayer = Players:GetPlayerFromCharacter(targetCharacter)
    if not targetPlayer or targetPlayer == LocalPlayer then return true end
    
    local pvpDisabled = targetPlayer:GetAttribute("PvpDisabled")
    if pvpDisabled == true then 
        return true 
    end
    
    if LocalPlayer.Team and LocalPlayer.Team.Name == "Marines" then
        if targetPlayer.Team and targetPlayer.Team == LocalPlayer.Team then 
            return true 
        end
    end
    
    local humanoid = targetCharacter:FindFirstChildOfClass("Humanoid")
    if not humanoid or humanoid.Health <= 0 then
        return true
    end
    
    -- ส่งค่าทั้ง targetPlayer และ targetCharacter เข้าไปตรวจสอบ
    if isInAnySafeZone(targetPlayer, targetCharacter) then
        return true
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










-- โจมตี

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

local netModule = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Net")
local registerHit = netModule:WaitForChild("RE/RegisterHit")
local registerAttack = netModule:WaitForChild("RE/RegisterAttack")

local fastAttackConnection = nil

-- ฟังก์ชันสำหรับส่งรีโมท M1 ผลไม้ปีศาจ
local function fireFruitM1(targetRoot)
    local character = player.Character
    if not character then return end
    
    -- ค้นหา Tool หรือ Object ผลไม้ปีศาจที่ตัวละครถืออยู่ หรือมีอยู่ใน Character
    for _, item in ipairs(character:GetChildren()) do
        if item:IsA("Tool") or item.Name:find("Dragon") or item:FindFirstChild("RemoteEvent") then
            local remoteEvent = item:FindFirstChild("RemoteEvent")
            local leftClickRemote = item:FindFirstChild("LeftClickRemote")
            
            if remoteEvent then
                pcall(function()
                    remoteEvent:FireServer(false)
                end)
            end
            
            if leftClickRemote then
                pcall(function()
                    local args = {
                        targetRoot.Position, -- ใช้ตำแหน่งเป้าหมายหรือทิศทางที่ต้องการ
                        1
                    }
                    leftClickRemote:FireServer(unpack(args))
                end)
            end
        end
    end
end

-- ฟังก์ชันหลักสำหรับเปิด-ปิดระบบโจมตีออร์โต้
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
            local character = player.Character
            if not character or not character:FindFirstChild("HumanoidRootPart") then return end
            local rootPart = character.HumanoidRootPart
            
            -- ฟังก์ชันช่วยส่งรีโมทโจมตีเป้าหมาย (รวมการตีปกติและผลไม้)
            local function attackTarget(targetRoot)
                if targetRoot then
                    local argsHit = {
                        targetRoot,
                        {},
                        [4] = "211ee8ef"
                    }
                    registerHit:FireServer(unpack(argsHit))
                    
                    local argsAttack = {
                        0.4000000059604645,
                        1
                    }
                    registerAttack:FireServer(unpack(argsAttack))
                    
                    -- เพิ่มการโจมตี M1 ของผลไม้ปีศาจ
                    fireFruitM1(targetRoot)
                end
            end
            
            -- 1. ตีมอนสเตอร์ใน Workspace.Enemies
            local enemiesFolder = workspace:FindFirstChild("Enemies")
            if enemiesFolder then
                for _, enemy in ipairs(enemiesFolder:GetChildren()) do
                    local enemyRoot = enemy:FindFirstChild("HumanoidRootPart") or enemy:FindFirstChild("Head")
                    local humanoid = enemy:FindFirstChildOfClass("Humanoid")
                    
                    if enemyRoot and humanoid and humanoid.Health > 0 then
                        local distance = (rootPart.Position - enemyRoot.Position).Magnitude
                        if distance <= 60 then
                            attackTarget(enemyRoot)
                        end
                    end
                end
            end
            
            -- 2. ตีผู้เล่นคนอื่นในเซิร์ฟเวอร์
            for _, otherPlayer in ipairs(Players:GetPlayers()) do
                if otherPlayer ~= player then
                    local targetChar = otherPlayer.Character
                    if targetChar and targetChar:FindFirstChild("HumanoidRootPart") then
                        local targetRoot = targetChar.HumanoidRootPart
                        local humanoid = targetChar:FindFirstChildOfClass("Humanoid")
                        
                        if humanoid and humanoid.Health > 0 then
                            local distance = (rootPart.Position - targetRoot.Position).Magnitude
                            if distance <= 60 then
                                attackTarget(targetRoot)
                            end
                        end
                    end
                end
            end
            
        end)
        
        task.wait()
    end)
end
























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





--หาผลปีศาจ
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

_G.FruitESPRunning = false

local function SetupFruitESP(obj)
    if not obj then return end
    
    task.defer(function()
        if not obj.Parent then return end
        
        -- ป้องกันไม่ให้จับพวก NPC หรือ Model ของผู้เล่น
        if obj:IsDescendantOf(Workspace:FindFirstChild("Characters")) or obj:IsDescendantOf(Workspace:FindFirstChild("NPCs")) then
            return
        end

        local targetPart = obj:IsA("Model") and obj.PrimaryPart or obj
        if not targetPart and obj:IsA("Model") then
            targetPart = obj:FindFirstChildWhichIsA("BasePart")
        end

        if not targetPart then return end

        -- สร้าง Highlight (ถ้ายังไม่มี และเปิด ESP อยู่)
        if _G.FruitESPRunning and not obj:FindFirstChild("FruitESP_Highlight") then
            local highlight = Instance.new("Highlight")
            highlight.Name = "FruitESP_Highlight"
            highlight.FillColor = Color3.fromRGB(255, 170, 0)
            highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Parent = obj
        end

        local billboard = obj:FindFirstChild("FruitESP_Billboard")
        if not billboard and _G.FruitESPRunning then
            billboard = Instance.new("BillboardGui")
            billboard.Name = "FruitESP_Billboard"
            billboard.Size = UDim2.new(0, 120, 0, 50)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.AlwaysOnTop = true
            
            local textLabel = Instance.new("TextLabel")
            textLabel.Name = "DistanceText"
            textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            textLabel.TextStrokeTransparency = 0
            textLabel.TextSize = 13
            textLabel.Font = Enum.Font.SourceSansBold
            textLabel.Parent = billboard
            
            billboard.Parent = obj
        end

        local textLabel = billboard and billboard:FindFirstChild("DistanceText")

        task.spawn(function()
            while _G.FruitESPRunning and obj.Parent and targetPart and textLabel do
                local char = LocalPlayer.Character
                local rootPart = char and char:FindFirstChild("HumanoidRootPart")
                if rootPart then
                    local distance = math.floor((targetPart.Position - rootPart.Position).Magnitude)
                    textLabel.Text = "🍎 " .. obj.Name .. "\n[" .. distance .. "m]"
                end
                task.wait(0.2) 
            end
        end)
    end)
end

local function RefreshFruitESP()
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if (obj:IsA("Model") or obj:IsA("Part")) and string.find(obj.Name, "Fruit") then
            SetupFruitESP(obj)
        end
    end
end


Workspace.DescendantAdded:Connect(function(obj)
    if _G.FruitESPRunning and (obj:IsA("Model") or obj:IsA("Part")) and string.find(obj.Name, "Fruit") then
        SetupFruitESP(obj)
    end
end)












--  ปุ่มทั้งหมด=================================================================



local AimSection = CombatTab:Section({ Title = "Visual & Settings" })


CombatTab:Toggle({
    Title = "CamLock (PC/Mobile)",
    Desc = "Lock onto targets instantly with smooth camera movement across PC and mobile.",
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
    Desc = "Hit your shots effortlessly without needing precise crosshair placement.",
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
    Desc = "Display a customizable FOV circle boundary on your screen.",
    Flag = "show_fov_toggle",
    Value = getgenv().ShowFOV,
    Callback = function(Value)
        getgenv().ShowFOV = Value
        if FOVUI then FOVUI.Visible = Value end
    end,
})

CombatTab:Toggle({
    Title = "Show Red Snapline",
    Desc = "Render a dynamic red line connecting directly to your active target.",
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

CombatTab:Dropdown({
    Title = "FOV Position",
    Desc = "Choose whether the FOV center follows your mouse/touch or stays locked to the screen center.",
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
    Desc = "Switch targeting parameters between custom FOV radius, 180° sweep, or full 360° coverage.",
    Flag = "silent_aim_mode_dropdown",
    Values = { "FOV", "180°", "360°" },
    Value = "FOV",
    Callback = function(selected)
        local mode = type(selected) == "table" and selected[1] or selected
        getgenv().SilentAimMode = mode
        
        if mode == "180°" then
            getgenv().FOVRadius = 180
        elseif mode == "360°" then
            getgenv().FOVRadius = 9999 
        else
            -- ใชค่าจาก Slider ปกติ
        end
    end,
})

CombatTab:Slider({
    Title = "FOV Size",
    Desc = "Scale the FOV radius to broaden or narrow your detection zone.",
    Flag = "fov_size_slider",
    Increment = 1,
    Value = {
        Min = 50,
        Max = 500,
        Default = getgenv().FOVRadius
    },
    Callback = function(Value)
        getgenv().FOVRadius = Value
    end,
})

CombatTab:Slider({
    Title = "Max Distance",
    Desc = "Set the absolute maximum distance threshold for target acquisition.",
    Flag = "max_distance_slider",
    Increment = 1,
    Value = {
        Min = 50,
        Max = 1200,
        Default = getgenv().MaxDistance
    },
    Callback = function(Value)
        getgenv().MaxDistance = Value
    end,
})




local HitboxSection = CombatTab:Section({ Title = "Hitbox Expander" })
CombatTab:Toggle({
    Title = "Expand Hitboxes",
    Desc = "Enlarge player hitboxes for easier and more reliable hits.",
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
    Desc = "Render a visible outline around the expanded hitbox area.",
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
    Desc = "Adjust the size multiplier for the target hitboxes.",
    Flag = "HitboxSizeSlider",
    Value = {
        Min = 10,
        Max = 300,
        Default = getgenv().HitboxSize
    },
    Increment = 1,
    Callback = function(value)
        getgenv().HitboxSize = value
    end,
})



local CombatBuffsSection = GeneralTab:Section({ Title = "Combat Attack" })

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
                    task.wait() 
                end
            end)
        end
    end,
})


local CharacterAbilities = GeneralTab:Section({ Title = "Character & Abilities" })

GeneralTab:Toggle({
    Title = "Auto Race V4",
    Flag = "AutoRaceV4_Toggle",
    Value = false,
    Callback = function(state)
        SetAutoRaceV4(state)
    end,
})

GeneralTab:Toggle({
    Title = "Auto Race V3",
    Flag = "AutoRaceAbility",
    Value = false,
    Callback = function(state)
        SetAutoRaceAbility(state)
    end,
})

GeneralTab:Toggle({
    Title = "Walking on Water (Full Map)",
    Flag = "IceWalk",
    Value = false,
    Callback = function(state)
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local Workspace = game:GetService("Workspace")
        local player = Players.LocalPlayer

        _G.IcePlatform = _G.IcePlatform or nil
        _G.IceConnection = _G.IceConnection or nil
        _G.IceWalkRunning = state

        local function getOrCreatePlatform()
            if not _G.IcePlatform or not _G.IcePlatform.Parent then
                _G.IcePlatform = Instance.new("Part")
                _G.IcePlatform.Size = Vector3.new(5000, 1, 5000) 
                _G.IcePlatform.Anchored = true
                _G.IcePlatform.CanCollide = true
                _G.IcePlatform.Transparency = 1 
                _G.IcePlatform.Material = Enum.Material.Ice
                _G.IcePlatform.Parent = Workspace
            end
            return _G.IcePlatform
        end

        if not state then
            if _G.IceConnection then
                _G.IceConnection:Disconnect()
                _G.IceConnection = nil
            end
            if _G.IcePlatform then
                _G.IcePlatform:Destroy()
                _G.IcePlatform = nil
            end
            return
        end
        
        local platform = getOrCreatePlatform()
        
        _G.IceConnection = RunService.Heartbeat:Connect(function()
            if not _G.IceWalkRunning then return end
            
            local character = player.Character
            if not character or not character:FindFirstChild("HumanoidRootPart") then
                if platform.Parent then platform.Parent = nil end
                return
            end
            
            local rootPart = character.HumanoidRootPart
            if platform.Parent ~= Workspace then
                platform.Parent = Workspace
            end
            
            local waterLevel = 0 
            
            if rootPart.Position.Y <= waterLevel + 50 then
                platform.Position = Vector3.new(rootPart.Position.X, waterLevel, rootPart.Position.Z)
            else
                if platform.Parent == Workspace then
                    platform.Parent = nil
                end
            end
        end)
    end,
})





















local ServerManagement = Server:Section({ Title = "Server Management" })

local InputJobId = ""
local SpamJoinActive = false

Server:Input({
    Title = "Server Job ID",
    Placeholder = "Enter target Job ID...",
    Value = "",
    Callback = function(text)
        InputJobId = text
    end,
})

Server:Toggle({
    Title = "Spam Join Server",
    Value = false,
    Callback = function(Value)
        SpamJoinActive = Value
        
        if SpamJoinActive then
            if InputJobId == "" or InputJobId == nil then
                WindUI:Notify({
                    Title = "Error",
                    Content = "Please enter a valid Job ID first!",
                    Icon = "alert-circle",
                    Duration = 3,
                })
                SpamJoinActive = false
                return
            end
            
            WindUI:Notify({
                Title = "Spam Join Started",
                Content = "Attempting to join the target server...",
                Icon = "play",
                Duration = 3,
            })
            
            task.spawn(function()
                while SpamJoinActive do
                    pcall(function()
                        local TeleportService = game:GetService("TeleportService")
                        local Players = game:GetService("Players")
                        local LocalPlayer = Players.LocalPlayer
                        
                        if InputJobId ~= "" then
                            TeleportService:TeleportToPlaceInstance(game.PlaceId, InputJobId, LocalPlayer)
                        end
                    end)
                    task.wait(3)
                end
            end)
        end
    end,
})

Server:Button({
    Title = "Join Server",
    Callback = function()
        if InputJobId == "" or InputJobId == nil then
            WindUI:Notify({
                Title = "Error",
                Content = "กรุณากรอก Job ID ก่อน!",
                Icon = "alert-circle",
                Duration = 3,
            })
            return
        end
        
        WindUI:Notify({
            Title = "Connecting",
            Content = "กำลังพยายามเข้าสู่เซิร์ฟเวอร์...",
            Icon = "loader",
            Duration = 3,
        })
        
        local success, err = pcall(function()
            local TeleportService = game:GetService("TeleportService")
            local Players = game:GetService("Players")
            TeleportService:TeleportToPlaceInstance(game.PlaceId, InputJobId, Players.LocalPlayer)
        end)
        
        if not success then
            WindUI:Notify({
                Title = "Teleport Failed (Error 773)",
                Content = "เซิร์ฟเวอร์เต็ม, ปิดตัวลงแล้ว หรือเป็น Private Server ที่ไม่มีสิทธิ์เข้า",
                Icon = "x-circle",
                Duration = 4,
            })
        end
    end,
})

Server:Button({
    Title = "Copy server code",
    Callback = function()
        pcall(function()
            local currentJobId = game.JobId
            if setclipboard then
                setclipboard(currentJobId)
                WindUI:Notify({
                    Title = "Success",
                    Content = "Copied current Job ID to clipboard!",
                    Icon = "check-circle",
                    Duration = 3,
                })
            elseif toclipboard then
                toclipboard(currentJobId)
                WindUI:Notify({
                    Title = "Success",
                    Content = "Copied current Job ID to clipboard!",
                    Icon = "check-circle",
                    Duration = 3,
                })
            end
        end)
    end,
})

Server:Button({
    Title = "Rejoin Server",
    Callback = function()
        WindUI:Notify({
            Title = "Rejoining",
            Content = "กำลังกลับเข้าสู่เซิร์ฟเวอร์เดิม...",
            Icon = "refresh-cw",
            Duration = 3,
        })
        pcall(function()
            local TeleportService = game:GetService("TeleportService")
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            
            TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
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


local ESPSection = Visuals:Section({ Title = "Fruit Settings" })

Visuals:Toggle({
    Title = "Fruit ESP",
    Desc = "Displays the locations of all spawned fruits across the map",
    Flag = "FruitESP_Toggle",
    Value = false,
    Callback = function(state)
        _G.FruitESPRunning = state
        if state then
            RefreshFruitESP()
        else
            for _, obj in ipairs(Workspace:GetDescendants()) do
                local hl = obj:FindFirstChild("FruitESP_Highlight")
                if hl then hl:Destroy() end
                local bb = obj:FindFirstChild("FruitESP_Billboard")
                if bb then bb:Destroy() end
            end
        end
    end,
})


local ESPSection = Visuals:Section({ Title = "ESP Settings" })

Visuals:Toggle({
    Title = "Show Name",
    Desc = "Display player usernames above their characters",
    Flag = "ESP_Name",
    Value = true,
    Callback = function(state)
        ESPConfig.ShowName = state
        UpdateAllESPVisibilities()
    end,
})

Visuals:Toggle({
    Title = "Show Distance",
    Desc = "Show how far away players are from you",
    Flag = "ESP_Distance",
    Value = true,
    Callback = function(state)
        ESPConfig.ShowDistance = state
    end,
})

Visuals:Toggle({
    Title = "Show Level",
    Desc = "Display target player levels",
    Flag = "ESP_Level",
    Value = true,
    Callback = function(state)
        ESPConfig.ShowLevel = state
        UpdateAllESPVisibilities()
    end,
})

Visuals:Toggle({
    Title = "Show Bounty",
    Desc = "Display current bounty or honor values",
    Flag = "ESP_Bounty",
    Value = true,
    Callback = function(state)
        ESPConfig.ShowBounty = state
        UpdateAllESPVisibilities()
    end,
})

Visuals:Toggle({
    Title = "Show PvP Status",
    Desc = "Highlight players with active PvP enabled",
    Flag = "ESP_PvP",
    Value = true,
    Callback = function(state)
        ESPConfig.ShowPvP = state
        UpdateAllESPVisibilities()
    end,
})

Visuals:Toggle({
    Title = "Show Combat Status",
    Desc = "Track when players enter combat mode",
    Flag = "ESP_Combat",
    Value = true,
    Callback = function(state)
        ESPConfig.ShowCombat = state
        UpdateAllESPVisibilities()
    end,
})

Visuals:Toggle({
    Title = "Show Health",
    Desc = "Render live health bars and percentages",
    Flag = "ESP_HP",
    Value = true,
    Callback = function(state)
        ESPConfig.ShowHealth = state
        UpdateAllESPVisibilities()
    end,
})



Visuals:Toggle({
    Title = "Show SafeZone Status",
    Desc = "Display SafeZone and Normal zone indicators",
    Flag = "ESP_SafeZone",
    Value = true,
    Callback = function(state)
        ESPConfig.ShowSafeZone = state
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
    Desc = "Automatically track and follow your hardcore target",
    Flag = "FollowToggle",
    Value = false,
    Callback = function(state)
        FollowEnabled = state
        if not state then currentTarget = nil end
    end,
})

local Keybind = GeneralTab:Keybind({
    Title = "Target Lock Key",
    Desc = "Keybind to trigger pursuit features",
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
    Desc = "Maximum distance to maintain from target",
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









-- // Configuration & Safety Checks
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local StarterGui = game:GetService("StarterGui")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- // Notification Helper
local function notify(title, content)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = content,
            Duration = 3
        })
    end)
end

local Button = FPSBoost:Button({
    Title = "Ultimate FPS Boost",
    Desc = "Advanced multi-layered performance optimization system.",
    Callback = function()
        notify("FPS Boost", "Initializing comprehensive optimization...")

        -- [1] Core Engine & Rendering Tweaks
        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level0
            UserSettings():GetService("UserGameSettings").SavedQualityLevel = Enum.SavedQualityLevel.Level1
            
            -- Disable extensive graphic physics elements
            Workspace.FallenPartsDestroyHeight = 0
            for _, v in ipairs(Workspace:GetChildren()) do
                if v:IsA("Clouds") or v:IsA("Atmosphere") or v:IsA("Wind") or v:IsA("PostEffect") then
                    v:Destroy()
                end
            end
        end)

        -- [2] Deep Lighting Stripping
        pcall(function()
            Lighting.GlobalShadows = false
            Lighting.Brightness = 2
            Lighting.FogEnd = 9e9
            Lighting.FogStart = 9e9
            Lighting.ClockTime = 14
            Lighting.GeographicLatitude = 0
            Lighting.Ambient = Color3.fromRGB(200, 200, 200)
            Lighting.OutdoorAmbient = Color3.fromRGB(200, 200, 200)

            for _, child in ipairs(Lighting:GetChildren()) do
                if child:IsA("PostEffect") or child:IsA("Sky") or child:IsA("Atmosphere") or child:IsA("Clouds") or child:IsA("BlurEffect") or child:IsA("SunRaysEffect") or child:IsA("ColorCorrectionEffect") or child:IsA("BloomEffect") then
                    child:Destroy()
                end
            end
        end)

        -- [3] Terrain & Environment Stripping
        pcall(function()
            local Terrain = Workspace:FindFirstChildOfClass("Terrain")
            if Terrain then
                Terrain.WaterWaveSize = 0
                Terrain.WaterWaveTransparency = 1
                Terrain.WaterTransparency = 1
                Terrain.WaterReflectance = 0
                Terrain.Decoration = false
                pcall(function()
                    Terrain:Clear()
                end)
            end
        end)

        -- [4] Audio & UI Resource Management
        pcall(function()
            SoundService.RespectFilteringEnabled = true
            for _, sound in ipairs(SoundService:GetDescendants()) do
                if sound:IsA("Sound") then
                    sound.Volume = 0
                end
            end
        end)

        -- [5] Advanced Part & Material Optimization Pipeline
        local function optimizePart(v)
            if v:IsA("BasePart") then
                -- Exclude local characters and active gameplay skill effects
                local modelParent = v.Parent
                local isCharacter = modelParent and (modelParent:FindFirstChild("Humanoid") or modelParent:IsA("Accessory"))
                local isEffect = modelParent and modelParent.Name:lower():find("effect") or v.Name:lower():find("effect")

                if not isCharacter and not isEffect then
                    v.Material = Enum.Material.SmoothPlastic
                    v.Reflectance = 0
                    v.CastShadow = false
                    v.Color = Color3.fromRGB(150, 150, 150)
                end
            elseif v:IsA("Decal") or v:IsA("Texture") then
                v.Transparency = 1
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then
                if not v.Parent:FindFirstChild("Humanoid") then
                    v.Enabled = false
                end
            elseif v:IsA("MeshPart") then
                local modelParent = v.Parent
                local isCharacter = modelParent and modelParent:FindFirstChild("Humanoid")
                if not isCharacter then
                    v.TextureID = ""
                    v.Material = Enum.Material.SmoothPlastic
                    v.CastShadow = false
                end
            end
        end

        -- Batch run through existing workspace descendants
        task.spawn(function()
            local descendants = Workspace:GetDescendants()
            for i = 1, #descendants do
                pcall(function()
                    optimizePart(descendants[i])
                end)
                if i % 500 == 0 then
                    task.wait() -- Prevent script exhaustion/timeouts
                end
            end
        end)

        -- [6] Dynamic Event Listener for Future Map Elements
        pcall(function()
            if not getgenv().FPSBoostConnection then
                getgenv().FPSBoostConnection = Workspace.DescendantAdded:Connect(function(v)
                    pcall(function()
                        task.wait(0.1)
                        if v then
                            optimizePart(v)
                        end
                    end)
                end)
            end
        end)

        -- [7] Memory Cleanup and Garbage Collection
        pcall(function()
            collectgarbage("collect")
        end)

        notify("FPS Boost", "Optimization complete! Frame rate profile maximized.")
    end
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
container.Size = UDim2.new(0, 120, 0, 96) -- ปรับความกว้างจาก 160 เป็น 120
container.Position = UDim2.new(0, 20, 0, 20)
container.BackgroundTransparency = 1
container.Parent = screenGui

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = container
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)

local function createButton(text, accentColor, order, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 120, 0, 38) -- ปรับความกว้างจาก 160 เป็น 120
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
    textLabel.TextSize = 12 -- ปรับขนาดตัวอักษรลงนิดหน่อยเพื่อให้พอดีกับปุ่มที่แคบลง
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
