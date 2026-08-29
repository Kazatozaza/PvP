local _version = "1.6.66"

if getgenv().DestinyHubWindow then
    pcall(function()
        getgenv().DestinyHubWindow:Destroy()
    end)
end

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/download/" .. _version .. "/main.lua"))() 

local Window = WindUI:CreateWindow({
    Icon = "crown", 
    Title = "Destiny Hub", 
    Author = "https://discord.gg/R74798dMZ6", 
    Folder = "MyConfigFile", 
    Theme = "Midnight", 
    Size = UDim2.fromOffset(590, 500),
})


getgenv().DestinyHubWindow = Window


Window:Section({
    Title = "Player Settings",
})

local CombatTab = Window:Tab({
    Title = "Combat",
    Icon = "swords"
})
CombatTab:Select()

local GeneralTab = Window:Tab({
    Title = "General",
    Icon = "settings"
})

local FPSBoost = Window:Tab({
    Title = "FPS Boost",
    Icon = "activity"
})

Window:Section({
    Title = "Main Features",
})


local Visuals = Window:Tab({
    Title = "Visuals",
    Icon = "eye"
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
CenterDot.Size = UDim2.new(0, 6, 0, 6) -- ขนาดจุด (ปรับความกว้าง/สูงได้ตามต้องการ เช่น 4 หรือ 6)
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
Snapline.Thickness = 2         
Snapline.Color = Color3.fromRGB(255, 0, 0) 
Snapline.Transparency = 1              
Snapline.From = Vector2.new(0, 0)        
Snapline.To = Vector2.new(0, 0)          

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

function GetClosestPlayer()
    local closestPlayer = nil
    local shortestDistance = math.huge
    local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
            local hrp = player.Character.HumanoidRootPart
            local screenPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
            
            if onScreen then
                local screenCoord = Vector2.new(screenPos.X, screenPos.Y)
                local distance = (screenCoord - screenCenter).Magnitude
                
                if distance < shortestDistance then
                    shortestDistance = distance
                    closestPlayer = player
                end
            end
        end
    end

    return closestPlayer
end

RunService.RenderStepped:Connect(function()
    local viewportSize = Camera.ViewportSize
    local startPoint = Vector2.new(viewportSize.X / 2, viewportSize.Y / 2)
    
    local target = GetClosestPlayer()
    
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        local targetPos = target.Character.HumanoidRootPart.Position
        local screenPos, onScreen = Camera:WorldToViewportPoint(targetPos)
        
        if onScreen then
            Snapline.From = startPoint
            Snapline.To = Vector2.new(screenPos.X, screenPos.Y)
            Snapline.Visible = true
        else
            Snapline.Visible = false
        end
    else
        Snapline.Visible = false
    end
end)

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

-- เช็คทีมและสถานะเป้าหมาย (รวมเช็ค PvP)
local function ShouldIgnoreTarget(targetCharacter)
    local targetPlayer = Players:GetPlayerFromCharacter(targetCharacter)
    if not targetPlayer then return true end
    if targetPlayer == LocalPlayer then return true end
    
    -- เช็คสถานะ ปิด/เปิด PvP (ถ้าปิดอยู่ จะข้ามทันที)
    local pvpDisabled = targetPlayer:GetAttribute("PvpDisabled")
    if pvpDisabled == true then 
        return true 
    end
    
    -- เช็คทีม (เช่น ถ้าเป็น Marines เหมือนกันจะไม่โจมตี)
    if LocalPlayer.Team and LocalPlayer.Team.Name == "Marines" then
        if targetPlayer.Team and targetPlayer.Team == LocalPlayer.Team then 
            return true 
        end
    end
    
    -- เช็คหลอดเลือด (ถ้าตายแล้วข้าม)
    local humanoid = targetCharacter:FindFirstChildOfClass("Humanoid")
    if humanoid and humanoid.Health <= 0 then return true end
    
    return false
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

pcall(function()
    if not getgenv().SilentAimEnabled then
        getgenv().SilentAimEnabled = false
    end

    -- ฟังก์ชันสำหรับ PC (ดัก Metatable ของ Mouse)
    local successMouse, mouseObj = pcall(function() return LocalPlayer:GetMouse() end)
    if successMouse and mouseObj and getrawmetatable and setreadonly then
        local gmt = getrawmetatable(game)
        local oldIndex = gmt.__index
        setreadonly(gmt, false)

        gmt.__index = newcclosure(function(self, idx)
            if getgenv().SilentAimEnabled and getgenv().CurrentTarget and self == mouseObj then
                local target = getgenv().CurrentTarget
                if target and target.Parent then
                    local rootPart = target.Parent:FindFirstChild("HumanoidRootPart")
                    if rootPart then
                        if idx == "Hit" or idx == "hit" then
                            return CFrame.new(rootPart.Position)
                        elseif idx == "Target" or idx == "target" then
                            return rootPart
                        end
                    end
                end
            end
            return oldIndex(self, idx)
        end)

        setreadonly(gmt, true)
    end
end)






pcall(function()
    local gmt = getrawmetatable(game)
    local oldNamecall = gmt.__namecall
    setreadonly(gmt, false)

    gmt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()

        if getgenv().SilentAimEnabled and getgenv().CurrentTarget and (method == "FireServer" or method == "InvokeServer") then
            local targetPos = GetPredictedPosition(getgenv().CurrentTarget)
            local args = { ... }
            
            for i = 1, #args do
                local arg = args[i]
                local argType = typeof(arg)
                
                if argType == "Vector3" then
                    args[i] = targetPos
                elseif argType == "CFrame" then
                    local _, _, _, r00, r01, r02, r10, r11, r12, r20, r21, r22 = arg:GetComponents()
                    args[i] = CFrame.new(targetPos.X, targetPos.Y, targetPos.Z, r00, r01, r02, r10, r11, r12, r20, r21, r22)
                end
            end
            
            return oldNamecall(self, unpack(args))
        end

        return oldNamecall(self, ...)
    end)

    setreadonly(gmt, true)
end)












RunService.RenderStepped:Connect(function()
    if not LocalPlayer.Character or not Workspace.CurrentCamera then
        if FOVUI then FOVUI.Visible = false end
        Snapline.Visible = false
        return
    end

    local refPos = GetReferencePosition()
    
    if FOVUI then
        FOVUI.Visible = getgenv().ShowFOV
        FOVUI.Position = UDim2.new(0, refPos.X, 0, refPos.Y)
        local size = getgenv().FOVRadius * 2
        FOVUI.Size = UDim2.new(0, size, 0, size)
    end

    if not getgenv().SilentAimEnabled and not getgenv().CamlockEnabled then
        getgenv().CurrentTarget = nil
        Snapline.Visible = false
        return
    end

    getgenv().CurrentTarget = GetTargetInFOV(refPos)

    -- ตรวจสอบระยะห่างจากตัวเราถึงเป้าหมาย
    local inRange = false
    if getgenv().CurrentTarget then
        local myRoot = LocalPlayer.Character and (LocalPlayer.Character:FindFirstChild("HumanoidRootPart") or LocalPlayer.Character:FindFirstChild("Torso"))
        if myRoot then
            local distance = (getgenv().CurrentTarget.Position - myRoot.Position).Magnitude
            if distance <= (getgenv().MaxDistance or math.huge) then
                inRange = true
            end
        else
            inRange = true
        end
    end

    if getgenv().CamlockEnabled and getgenv().CurrentTarget and inRange then
        local targetPos = GetPredictedPosition(getgenv().CurrentTarget)
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetPos)
    end

    if getgenv().CurrentTarget and inRange and getgenv().ShowTracer then
        local targetScreenPos, targetOnScreen = Camera:WorldToViewportPoint(getgenv().CurrentTarget.Position)

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















-- ESP


local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- กำหนดค่าการแสดงผล
local ESPConfig = {
    ShowName = true,
    ShowDistance = true,
    ShowLevel = true,
    ShowBounty = true,
    ShowHealth = true,
    ShowPvP = true,       -- เพิ่มการแสดงผลสถานะ PvP
    ShowCombat = true,    -- เพิ่มการแสดงผลสถานะ InCombat
    ShowAllTeams = false,
    Pirates = true,
    Marines = true,
}

local COLORS = {
    Pirates = Color3.fromRGB(255, 75, 75),       -- แดงทับทิมนีออน (เด่นสะใจ)
    Marines = Color3.fromRGB(80, 170, 255),    -- ฟ้าไอซ์บลู (สะอาดตา)
    Neutral = Color3.fromRGB(200, 200, 200),    -- เทาเงินเมทัลลิก
    White = Color3.fromRGB(255, 255, 255),       
    HP = Color3.fromRGB(0, 255, 128),           -- เขียวเมทริกซ์เรืองแสง
    HPBG = Color3.fromRGB(15, 15, 20, 200),     -- พื้นหลังดำสนิทโปร่งแสงแบบกระจกเงา
    Level = Color3.fromRGB(255, 215, 0),        -- สีทองคำแท้ (Gold)
    Bounty = Color3.fromRGB(255, 105, 180),    -- สีชมพูฮอตพิ้งค์ (Hot Pink)
PvPOn = Color3.fromRGB(120, 255, 0),       -- เขียวมะนาวสว่าง (พร้อมบวก)
    PvPOff = Color3.fromRGB(255, 50, 120),     -- ชมพูเข้ม (ปิด PvP)
    Combat = Color3.fromRGB(255, 230, 0),      -- เหลืองทองประกาย (กำลังสู้เดือด)
}

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

local function GetPvPAndCombatStatus(player)
    local pvpDisabled = player:GetAttribute("PvpDisabled")
    local pvpText = (pvpDisabled == true) and "OFF" or "ON"
    local pvpColor = (pvpDisabled == true) and COLORS.PvPOff or COLORS.PvPOn
    
    local inCombatVal = player:GetAttribute("InCombat")
    if player.Character then
        inCombatVal = inCombatVal or player.Character:GetAttribute("InCombat")
    end
    
    local isCombat = (inCombatVal == true or inCombatVal == 1 or inCombatVal == "1")
    local combatText = isCombat and "InCombat" or "Ready"
    local combatColor = isCombat and COLORS.Combat or COLORS.White
    
    return pvpText, pvpColor, combatText, combatColor
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
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local head = player.Character:FindFirstChild("Head")
            if head then
                local gui = head:FindFirstChild("PlayerESP")
                if gui then
                    local _, _, teamEnabled = GetTeamInfo(player)
                    gui.Enabled = teamEnabled
                    
                    local container = gui:FindFirstChild("Container")
                    if container then
                        local nameLabel = container:FindFirstChild("NameLabel")
                        local levelLabel = container:FindFirstChild("LevelLabel")
                        local bountyLabel = container:FindFirstChild("BountyLabel")
                        local pvpLabel = container:FindFirstChild("PvPLabel")
                        local hpBG = container:FindFirstChild("HPBG")
                        
                        if nameLabel then nameLabel.Visible = ESPConfig.ShowName end
                        if levelLabel then levelLabel.Visible = ESPConfig.ShowLevel end
                        if bountyLabel then bountyLabel.Visible = ESPConfig.ShowBounty end
                        if pvpLabel then pvpLabel.Visible = (ESPConfig.ShowPvP or ESPConfig.ShowCombat) end
                        if hpBG then hpBG.Visible = ESPConfig.ShowHealth end
                    end
                end
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
   -- สร้างโครงสร้าง ESP พร้อมสีสันสุดพรีเมียม
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

    -- ชื่อผู้เล่น + ระยะทาง
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Name = "NameLabel"
    nameLabel.BackgroundTransparency = 1
    nameLabel.Size = UDim2.new(1, 0, 0, 20)
    nameLabel.Position = UDim2.new(0, 0, 0, 0)
    nameLabel.Visible = ESPConfig.ShowName
    nameLabel.RichText = true
    nameLabel.TextSize = 14
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextStrokeTransparency = 0.1 -- ขอบดำเข้มขึ้นเพื่อให้ตัวหนังสือคมชัดทะลุจอ
    nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    nameLabel.Parent = container

    -- ป้ายสถานะ PvP & Combat
    local pvpLabel = Instance.new("TextLabel")
    pvpLabel.Name = "PvPLabel"
    pvpLabel.BackgroundTransparency = 1
    pvpLabel.Size = UDim2.new(1, 0, 0, 16)
    pvpLabel.Position = UDim2.new(0, 0, 0, 22)
    pvpLabel.Visible = (ESPConfig.ShowPvP or ESPConfig.ShowCombat)
    pvpLabel.RichText = true
    pvpLabel.TextSize = 12
    pvpLabel.Font = Enum.Font.GothamSemibold
    pvpLabel.TextStrokeTransparency = 0.2
    pvpLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    pvpLabel.Parent = container

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

        -- อัปเดตข้อความ PvP และ Combat พร้อมสีนีออนเด่นๆ
        local pvpText, pvpColor, combatText, combatColor = GetPvPAndCombatStatus(player)
        local pvpPart = ESPConfig.ShowPvP and string.format("PvP: <font color=\"rgb(%d,%d,%d)\">%s</font>", math.floor(pvpColor.R * 255), math.floor(pvpColor.G * 255), math.floor(pvpColor.B * 255), pvpText) or ""
        local combatPart = ESPConfig.ShowCombat and string.format(" | <font color=\"rgb(%d,%d,%d)\">%s</font>", math.floor(combatColor.R * 255), math.floor(combatColor.G * 255), math.floor(combatColor.B * 255), combatText) or ""
        
        if ESPConfig.ShowPvP and ESPConfig.ShowCombat then
            pvpLabel.Text = "⚡ " .. pvpPart .. combatPart
        elseif ESPConfig.ShowPvP then
            pvpLabel.Text = "⚡ " .. pvpPart
        elseif ESPConfig.ShowCombat then
            pvpLabel.Text = "⚡ " .. combatPart
        else
            pvpLabel.Text = ""
        end
    end

    UpdateDynamicInfo()
    ActiveESPs[player] = { Update = UpdateDynamicInfo, Head = head }

    -- เลเวลผู้เล่น (สีทองเด่นชัด)
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

    -- ค่าหัวผู้เล่น (สีชมพูพรีเมียม)
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

    -- HP Background (สไตล์กระจกเงาขอบโค้งมน)
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

        UpdateHealth(humanoid.Health)
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
        char:PivotTo(hrp.CFrame + Vector3.new(0, 500, 0))
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
local LocalPlayer = Players.LocalPlayer

-- System Control Variables (Hardcore Config)
local FollowEnabled = false
local FollowDistance = 300
local TpBehindDistance = 5
local FollowKeybind = Enum.KeyCode.E

local currentTarget = nil
local FollowToggle -- ตัวแปรสำหรับอ้างอิงสถานะปุ่ม Toggle

-- ฟังก์ชันตรวจสอบเป้าหมาย
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
    
    return false
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
                    Icon = FollowEnabled and "lock" or "unlock",
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
        Max = 120,
        Default = getgenv().HitboxSize
    },
    Increment = 1,
    Callback = function(value)
        getgenv().HitboxSize = value
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
























local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomMobileTogglesStyle"
screenGui.Parent = game.CoreGui
screenGui.ResetOnSpawn = false

local container = Instance.new("Frame")
container.Size = UDim2.new(0, 130, 0, 110)
container.Position = UDim2.new(0, 15, 0, 15)
container.BackgroundTransparency = 1
container.Active = false
container.Parent = screenGui

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = container
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)

local function createButton(text, textColor, order, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 130, 0, 40)
    button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    button.BackgroundTransparency = 0.1
    button.BorderSizePixel = 0
    button.LayoutOrder = order
    button.AutoButtonColor = false
    button.Parent = container

    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, 8)
    uiCorner.Parent = button

    local uiStroke = Instance.new("UIStroke")
    uiStroke.Parent = button
    uiStroke.Color = Color3.fromRGB(55, 55, 55)
    uiStroke.Thickness = 1.5
    uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual

    button.Text = text
    button.TextColor3 = textColor
    button.TextScaled = true
    button.Font = Enum.Font.SourceSansBold

    local activeState = false
    button.MouseButton1Click:Connect(function()
        activeState = not activeState
        
        if activeState then
            button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            if uiStroke then
                uiStroke.Color = textColor 
            end
        else
            button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            if uiStroke then
                uiStroke.Color = Color3.fromRGB(55, 55, 55)
            end
        end

        if callback then
            callback(activeState)
        end
    end)

    return button
end

createButton("Camera Lock", Color3.fromRGB(0, 170, 255), 2, function(Value)
    getgenv().CamlockEnabled = Value
    if not Value then
        getgenv().CurrentTarget = nil
    end
end)

createButton("Teleport player", Color3.fromRGB(0, 170, 255), 3, function(state)
    FollowEnabled = state
    getgenv().TPToTargetEnabled = state
    getgenv().FollowEnabled = state 
    if not state then 
        currentTarget = nil 
        getgenv().CurrentTarget = nil 
    end
end)
