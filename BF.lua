local Rayfield = loadstring(game:HttpGet("https://sirius.menu/gen2"))()

local window = Rayfield:CreateWindow({
    name = "Destiny Hub",
    subtitle = "https://discord.gg/hUMaVECvBz",
    ShowText = "Destiny Hub", 
    configuration = {
        autoSave = true,     
        autoLoad = true,     
        fileName = "Destiny Hub",
        customFolder = "Destiny Hub",
    }, 
    
theme = {
        TabColor = Color3.fromRGB(235, 255, 255),
        TabBackground = ColorSequence.new(Color3.fromRGB(10, 102, 140), Color3.fromRGB(0, 180, 216)),
        TabStroke = ColorSequence.new(Color3.fromRGB(72, 202, 228), Color3.fromRGB(144, 224, 239)),
        AccentColor = Color3.fromRGB(72, 202, 228),
        AccentGradient = ColorSequence.new(Color3.fromRGB(10, 102, 140), Color3.fromRGB(0, 180, 216)),
    },
})

window:Toast({
    title = "Destiny Hub",
    subtitle = "",
    avatar = 5,
})

local tag = window:CreateTag({
    text = "us-en",
    color = Color3.fromRGB(255, 175, 15),
})

tag:Set({ 
    text = "Version1.0 Free", 
    color = Color3.fromRGB(72, 202, 228) 
})





local Home = window:CreateTab({ name = "Home", icon = 125823673784681 })
local General = window:CreateTab({ name = "General", icon = 93364949241311 })
local Main = window:CreateTab({ name = "Combat", icon = 125823673784681 })
local Visuals = window:CreateTab({ name = "Visuals", icon = 93364949241311 })











local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

-- ตัวแปรตั้งค่าระบบ
getgenv().FOVRadius = getgenv().FOVRadius or 180
getgenv().MaxDistance = getgenv().MaxDistance or 800
getgenv().SilentAimEnabled = getgenv().SilentAimEnabled ~= false and true
getgenv().ShowFOV = true -- บังคับเปิดการแสดงผล FOV
getgenv().ShowTracer = getgenv().ShowTracer ~= false and true
getgenv().CurrentTarget = nil
getgenv().FOVPositionMode = getgenv().FOVPositionMode or "Mouse/Touch" 
getgenv().LockedPartName = "Head" 
getgenv().CamlockEnabled = getgenv().CamlockEnabled or false

local CurrentThemeColor = Color3.fromRGB(96, 205, 255)

-- สร้างหน้าจอ GUI สำหรับปุ่มลอยมือถือ
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MobileAimUI"
ScreenGui.ResetOnSpawn = false
pcall(function()
    ScreenGui.Parent = CoreGui
end)
if not ScreenGui.Parent then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

-- ฟังก์ชันสร้างปุ่มลอยที่กดสลับสถานะและลากย้ายได้
local function CreateFloatingButton(name, text, defaultState, position, callback)
    local Button = Instance.new("TextButton")
    Button.Name = name
    Button.Size = UDim2.new(0, 110, 0, 45)
    Button.Position = position
    Button.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Button.BorderSizePixel = 0
    Button.TextColor3 = defaultState and Color3.fromRGB(0, 255, 100) or Color3.fromRGB(255, 50, 50)
    Button.TextSize = 14
    Button.Font = Enum.Font.GothamBold
    Button.Text = text .. (defaultState and " ON" or " OFF")
    Button.Parent = ScreenGui

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = Button

    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = Color3.fromRGB(50, 50, 50)
    UIStroke.Thickness = 1.5
    UIStroke.Parent = Button

    -- ระบบลากปุ่ม (Draggable)
    local dragging, dragInput, dragStart, startPos = false, nil, nil, nil

    Button.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = Button.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    Button.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            Button.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    -- กดคลิกเพื่อเปิด-ปิด
    local activeState = defaultState
    Button.MouseButton1Click:Connect(function()
        activeState = not activeState
        if activeState then
            Button.TextColor3 = Color3.fromRGB(0, 255, 100)
            Button.Text = text .. " ON"
        else
            Button.TextColor3 = Color3.fromRGB(255, 50, 50)
            Button.Text = text .. " OFF"
        end
        callback(activeState)
    end)

    return Button
end

-- สร้างปุ่ม MENU, AIM, และ CamLock ตามรูป
CreateFloatingButton("MenuButton", "MENU", true, UDim2.new(0, 50, 0, 90), function(state)
    for _, child in ipairs(ScreenGui:GetChildren()) do
        if child:IsA("TextButton") and child.Name ~= "MenuButton" then
            child.Visible = state
        end
    end
end)

CreateFloatingButton("AimButton", "AIM", getgenv().SilentAimEnabled, UDim2.new(0, 50, 0, 145), function(Value)
    getgenv().SilentAimEnabled = Value
    if not Value and not getgenv().CamlockEnabled then
        getgenv().CurrentTarget = nil
        if RedLine then RedLine.Visible = false end
    end
end)

CreateFloatingButton("CamLockButton", "CamLock", getgenv().CamlockEnabled, UDim2.new(0, 50, 0, 200), function(Value)
    getgenv().CamlockEnabled = Value
    if not Value and not getgenv().SilentAimEnabled then
        getgenv().CurrentTarget = nil
        if RedLine then RedLine.Visible = false end
    end
end)

-- สร้างวงกลม FOV และเส้น Tracer แบบ Drawing
local FOVCircle = Drawing.new("Circle")
FOVCircle.Visible = getgenv().ShowFOV
FOVCircle.Filled = false
FOVCircle.Thickness = 1.5
FOVCircle.Color = CurrentThemeColor
FOVCircle.Transparency = 0.7

local RedLine = Drawing.new("Line")
RedLine.Visible = false
RedLine.Thickness = 1.5
RedLine.Color = CurrentThemeColor
RedLine.Transparency = 0.8

local LastTouchPosition = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        LastTouchPosition = Vector2.new(input.Position.X, input.Position.Y)
    end
end)

UserInputService.TouchMoved:Connect(function(touch)
    LastTouchPosition = Vector2.new(touch.Position.X, touch.Position.Y)
end)

UserInputService.TouchStarted:Connect(function(touch)
    LastTouchPosition = Vector2.new(touch.Position.X, touch.Position.Y)
end)

local function ShouldIgnoreTarget(targetCharacter)
    local targetPlayer = Players:GetPlayerFromCharacter(targetCharacter)
    if not targetPlayer then return true end
    if targetPlayer == LocalPlayer then return true end
    if targetPlayer.Team == LocalPlayer.Team then
        return true
    end
    local humanoid = targetCharacter:FindFirstChildOfClass("Humanoid")
    if humanoid and humanoid.Health <= 0 then
        return true
    end
    return false
end

local function GetReferencePosition()
    local viewportSize = Camera.ViewportSize
    local centerPos = Vector2.new(viewportSize.X / 2, viewportSize.Y / 2)

    if getgenv().FOVPositionMode == "Middle" then
        return centerPos
    else
        if not UserInputService.TouchEnabled then
            local success, mouseLoc = pcall(function()
                return UserInputService:GetMouseLocation()
            end)
            if success and mouseLoc and not (mouseLoc.X == 0 and mouseLoc.Y == 0) then
                LastTouchPosition = mouseLoc
            end
        else
            local touches = UserInputService:GetTouches()
            if #touches > 0 then
                LastTouchPosition = Vector2.new(touches[1].Position.X, touches[1].Position.Y)
            end
        end
        return LastTouchPosition
    end
end

local function GetTargetInFOV(refPos)
    local ClosestTarget = nil
    local ShortestDistance = (getgenv().FOVRadius >= 9999) and 99999 or getgenv().FOVRadius

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

-- ระบบ Metatable Hook ดั้งเดิม
local SuccessMouse, MouseObj = pcall(function()
    return LocalPlayer:GetMouse()
end)

local gmt = getrawmetatable(game)
local oldIndex = gmt.__index
local oldNamecall = gmt.__namecall
setreadonly(gmt, false)

gmt.__index = newcclosure(function(self, idx)
    if getgenv().SilentAimEnabled and getgenv().CurrentTarget and SuccessMouse and self == MouseObj then
        if idx == "Hit" or idx == "hit" then
            return getgenv().CurrentTarget.CFrame
        elseif idx == "Target" or idx == "target" then
            return getgenv().CurrentTarget
        end
    end
    return oldIndex(self, idx)
end)

gmt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = { ... }

    if getgenv().SilentAimEnabled and getgenv().CurrentTarget and (method == "FireServer" or method == "InvokeServer") then
        for i, arg in ipairs(args) do
            if typeof(arg) == "Vector3" then
                args[i] = getgenv().CurrentTarget.Position
            elseif typeof(arg) == "CFrame" then
                args[i] = getgenv().CurrentTarget.CFrame
            end
        end
        return oldNamecall(self, table.unpack(args))
    end

    return oldNamecall(self, ...)
end)

setreadonly(gmt, true)

-- ลูปการทำงานหลัก
RunService.RenderStepped:Connect(function()
    local refPos = GetReferencePosition()
    
    if FOVCircle then
        FOVCircle.Position = refPos
        FOVCircle.Radius = getgenv().FOVRadius
        FOVCircle.Visible = getgenv().ShowFOV
        FOVCircle.Color = CurrentThemeColor
    end

    if not getgenv().SilentAimEnabled and not getgenv().CamlockEnabled then
        getgenv().CurrentTarget = nil
        if RedLine then RedLine.Visible = false end
        return
    end

    getgenv().CurrentTarget = GetTargetInFOV(refPos)

    -- จัดการเส้น Tracer
    if getgenv().CurrentTarget and getgenv().ShowTracer and RedLine then
        local myChar = LocalPlayer.Character
        local myHead = myChar and (myChar:FindFirstChild("Head") or myChar:FindFirstChild("HumanoidRootPart"))

        if myHead then
            local headScreenPos, headOnScreen = Camera:WorldToViewportPoint(myHead.Position)
            local targetScreenPos, targetOnScreen = Camera:WorldToViewportPoint(getgenv().CurrentTarget.Position)

            if targetOnScreen and headOnScreen then
                RedLine.From = Vector2.new(headScreenPos.X, headScreenPos.Y)
                RedLine.To = Vector2.new(targetScreenPos.X, targetScreenPos.Y)
                RedLine.Color = CurrentThemeColor 
                RedLine.Visible = true
            else
                RedLine.Visible = false
            end
        else
            RedLine.Visible = false
        end
    else
        if RedLine then 
            RedLine.Visible = false 
        end
    end
end)









local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- ตัวแปรควบคุมสถานะหลัก
local ESPEnabled = false
local Settings = {
    Pirates = true,
    Marines = true,
}

local COLORS = {
    Pirates = Color3.fromRGB(255, 70, 70),
    Marines = Color3.fromRGB(70, 140, 255),
    Neutral = Color3.fromRGB(255, 255, 255),
    HP = Color3.fromRGB(0, 255, 100),
    HPBG = Color3.fromRGB(45, 45, 45),
    Level = Color3.fromRGB(255, 220, 80)
}

local function GetTeamInfo(player)
    local team = player.Team
    local teamName = team and team.Name or "Neutral"

    if teamName == "Pirates" then
        return "Pirates", COLORS.Pirates, Settings.Pirates
    elseif teamName == "Marines" then
        return "Marines", COLORS.Marines, Settings.Marines
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

    return "N/A"
end

local function CreateESP(player)
    if player == LocalPlayer then return end

    local connectionTeam, connectionHealth, connectionCharacterAdded

    local function Cleanup()
        if connectionTeam then
            connectionTeam:Disconnect()
            connectionTeam = nil
        end
        if connectionHealth then
            connectionHealth:Disconnect()
            connectionHealth = nil
        end
    end

    local function Setup(character)
        Cleanup()

        local head = character:FindFirstChild("Head") or character:WaitForChild("Head", 3)
        local humanoid = character:FindFirstChild("Humanoid") or character:WaitForChild("Humanoid", 3)

        if not head or not humanoid then return end

        local old = head:FindFirstChild("PlayerESP")
        if old then old:Destroy() end

        local teamName, teamColor, teamEnabled = GetTeamInfo(player)

        -- สร้าง BillboardGui
        local gui = Instance.new("BillboardGui")
        gui.Name = "PlayerESP"
        gui.Adornee = head
        gui.Size = UDim2.fromOffset(180, 55)
        gui.StudsOffset = Vector3.new(0, 2.8, 0)
        gui.AlwaysOnTop = true
        -- เช็คทั้งตัวเปิดหลัก (ESPEnabled) และการตั้งค่าทีม
        gui.Enabled = ESPEnabled and teamEnabled
        gui.Parent = head

        -- ชื่อผู้เล่น
        local name = Instance.new("TextLabel")
        name.BackgroundTransparency = 1
        name.Size = UDim2.new(1, 0, 0, 20)
        name.Text = "[" .. teamName .. "] " .. player.DisplayName
        name.TextColor3 = teamColor
        name.TextSize = 13
        name.Font = Enum.Font.SourceSansBold
        name.TextStrokeTransparency = 0
        name.Parent = gui

        -- HP Background
        local hpBG = Instance.new("Frame")
        hpBG.Size = UDim2.new(0.7, 0, 0, 5)
        hpBG.Position = UDim2.new(0.15, 0, 0.42, 0)
        hpBG.BackgroundColor3 = COLORS.HPBG
        hpBG.BorderSizePixel = 0
        hpBG.Parent = gui

        -- HP Bar
        local hp = Instance.new("Frame")
        hp.Size = UDim2.new(1, 0, 1, 0)
        hp.BackgroundColor3 = COLORS.HP
        hp.BorderSizePixel = 0
        hp.Parent = hpBG

        local function UpdateHealth(value)
            local maxHealth = humanoid.MaxHealth
            if maxHealth <= 0 then maxHealth = 1 end
            hp.Size = UDim2.new(math.clamp(value / maxHealth, 0, 1), 0, 1, 0)
        end

        UpdateHealth(humanoid.Health)
        connectionHealth = humanoid.HealthChanged:Connect(UpdateHealth)

        -- Level
        local level = Instance.new("TextLabel")
        level.BackgroundTransparency = 1
        level.Size = UDim2.new(1, 0, 0, 20)
        level.Position = UDim2.new(0, 0, 0.62, 0)
        level.Text = "Lv. " .. tostring(GetLevel(player))
        level.TextColor3 = COLORS.Level
        level.TextSize = 13
        level.Font = Enum.Font.SourceSansBold
        level.TextStrokeTransparency = 0
        level.Parent = gui

        -- อัปเดตเมื่อทีมเปลี่ยน
        connectionTeam = player:GetPropertyChangedSignal("Team"):Connect(function()
            if not gui.Parent then return end
            local newTeam, newColor, newTeamEnabled = GetTeamInfo(player)
            name.Text = "[" .. newTeam .. "] " .. player.DisplayName
            name.TextColor3 = newColor
            gui.Enabled = ESPEnabled and newTeamEnabled
        end)
    end

    if player.Character then
        task.spawn(Setup, player.Character)
    end

    connectionCharacterAdded = player.CharacterAdded:Connect(Setup)

    player.Destroying:Connect(function()
        Cleanup()
        if connectionCharacterAdded then
            connectionCharacterAdded:Disconnect()
        end
    end)
end

-- เริ่มต้นลูปผู้เล่นทั้งหมด
for _, player in ipairs(Players:GetPlayers()) do
    CreateESP(player)
end

Players.PlayerAdded:Connect(CreateESP)
























local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local SpeedEnabled = false
local JumpEnabled = false
local FlyEnabled = false

local CustomSpeed = 50  
local CustomJump = 100 
local FlySpeed = 50

-- เก็บสถานะปุ่มกดสำหรับการบิน (WASD / Space / Ctrl)
local inputControl = {
    Forward = false,
    Backward = false,
    Left = false,
    Right = false,
    Up = false,
    Down = false
}

local function GetCharacter()
    local charactersFolder = workspace:FindFirstChild("Characters")
    if charactersFolder then
        local char = charactersFolder:FindFirstChild(LocalPlayer.Name)
        if char then return char end
    end
    return LocalPlayer.Character
end

-- ระบบจัดการการกดปุ่มบิน
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.W then inputControl.Forward = true end
    if input.KeyCode == Enum.KeyCode.S then inputControl.Backward = true end
    if input.KeyCode == Enum.KeyCode.A then inputControl.Left = true end
    if input.KeyCode == Enum.KeyCode.D then inputControl.Right = true end
    if input.KeyCode == Enum.KeyCode.Space then inputControl.Up = true end
    if input.KeyCode == Enum.KeyCode.LeftControl then inputControl.Down = true end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.W then inputControl.Forward = false end
    if input.KeyCode == Enum.KeyCode.S then inputControl.Backward = false end
    if input.KeyCode == Enum.KeyCode.A then inputControl.Left = false end
    if input.KeyCode == Enum.KeyCode.D then inputControl.Right = false end
    if input.KeyCode == Enum.KeyCode.Space then inputControl.Up = false end
    if input.KeyCode == Enum.KeyCode.LeftControl then inputControl.Down = false end
end)

local lastJumpState = false
local bv, bg

RunService.RenderStepped:Connect(function(deltaTime)
    local character = GetCharacter()
    if not character then return end

    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not rootPart then return end

    -- 1. Speed Hack
    if SpeedEnabled then
        humanoid.WalkSpeed = CustomSpeed
        if humanoid.MoveDirection.Magnitude > 0 then
            local speedMultiplier = CustomSpeed / 16
            character:TranslateBy(humanoid.MoveDirection * speedMultiplier * deltaTime * 8)
        end
    end

    -- 2. Jump Hack
    if JumpEnabled then
        if not lastJumpState then
            humanoid.UseJumpPower = true
            humanoid.JumpPower = CustomJump
            lastJumpState = true
        end
    else
        lastJumpState = false
    end

    -- 3. Fly Hack (ลอยกลางอากาศ)
    if FlyEnabled then
        if not bv or not bg or bv.Parent ~= rootPart then
            -- สร้างแรงต้านแรงโน้มถ่วงและการทรงตัว
            bv = Instance.new("BodyVelocity")
            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bv.Velocity = Vector3.new(0, 0, 0)
            bv.Parent = rootPart

            bg = Instance.new("BodyGyro")
            bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
            bg.P = 9000
            bg.Parent = rootPart
        end

        local camera = workspace.CurrentCamera
        local moveDir = Vector3.new()

        if inputControl.Forward then moveDir = moveDir + camera.CoordinateFrame.LookVector end
        if inputControl.Backward then moveDir = moveDir - camera.CoordinateFrame.LookVector end
        if inputControl.Left then moveDir = moveDir - camera.CoordinateFrame.RightVector end
        if inputControl.Right then moveDir = moveDir + camera.CoordinateFrame.RightVector end
        if inputControl.Up then moveDir = moveDir + Vector3.new(0, 1, 0) end
        if inputControl.Down then moveDir = moveDir - Vector3.new(0, 1, 0) end

        if moveDir.Magnitude > 0 then
            bv.Velocity = moveDir.Unit * FlySpeed
        else
            bv.Velocity = Vector3.new(0, 0.1, 0) -- ลอยนิ่งๆ ไม่ให้ร่วง
        end
        bg.CFrame = camera.CoordinateFrame
        humanoid.PlatformStand = true
    else
        if bv then bv:Destroy() bv = nil end
        if bg then bg:Destroy() bg = nil end
        if humanoid then humanoid.PlatformStand = false end
    end
end)
































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

        -- [Optimized] เปลี่ยนจาก RenderStepped เป็น Task Loop หน่วงเวลา 0.2 วินาที ไม่กิน CPU เครื่องไม่กระตุก
        task.spawn(function()
            while _G.FruitESPRunning and obj.Parent and targetPart and textLabel do
                local char = LocalPlayer.Character
                local rootPart = char and char:FindFirstChild("HumanoidRootPart")
                if rootPart then
                    local distance = math.floor((targetPart.Position - rootPart.Position).Magnitude)
                    textLabel.Text = "🍎 " .. obj.Name .. "\n[" .. distance .. "m]"
                end
                task.wait(0.2) -- อัปเดตความห่างทุกๆ 0.2 วินาที (ลื่นไหลและไม่แลค)
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

RefreshFruitESP()




























local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
_G.WaterGodMode = _G.WaterGodMode or false

local platform = nil
local connection = nil

-- ดึงพาร์ทผิวน้ำจากแมพโดยตรง
local waterPlane = Workspace:FindFirstChild("Map") and Workspace.Map:FindFirstChild("WaterBase-Plane")

local function getOrCreatePlatform()
    if not platform or not platform.Parent then
        platform = Instance.new("Part")
        platform.Size = Vector3.new(100, 1, 100) -- ใหญ่สะใจ เดินยังไงก็ไม่ตก
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
        if connection then connection:Disconnect() connection = nil end
        if platform then platform:Destroy() platform = nil end
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
        
        local rootPart = character.HumanoidRootPart
        local hum = character:FindFirstChildOfClass("Humanoid")
        
        -- เช็คความสูงเทียบกับ WaterBase-Plane โดยตรง
        if waterPlane then
            local waterY = waterPlane.Position.Y
            -- ถ้าตัวละครตกลงมาใกล้หรือต่ำกว่าระดับน้ำในแมพ
            if rootPart.Position.Y <= (waterY + 5) then
                if currentPlatform.Parent ~= Workspace then
                    currentPlatform.Parent = Workspace
                end
                -- ล็อกแพลตฟอร์มไว้ที่ระดับผิวน้ำพอดีเป๊ะ
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
        end
    end)
end

















local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local player = Players.LocalPlayer

local icePlatform = nil
local connection = nil

-- ฟังก์ชันสร้างหรือดึงแพลตฟอร์มน้ำแข็ง (ขยายขนาดให้กว้างขึ้น กันตกขอบ)
local function getOrCreatePlatform()
    if not icePlatform or not icePlatform.Parent then
        icePlatform = Instance.new("Part")
        icePlatform.Size = Vector3.new(12, 1, 12) -- ขยายขนาดให้กว้างขึ้น เดินง่ายขึ้น
        icePlatform.Anchored = true
        icePlatform.CanCollide = true
        icePlatform.Transparency = 0.4 -- ปรับเป็น 1 ถ้าต้องการให้ล่องหนสนิท
        icePlatform.Material = Enum.Material.Ice
        icePlatform.Parent = nil
    end
    return icePlatform
end

local function SetIceWalk(state)
    _G.IceWalkRunning = state
    
    if not state then
        if connection then
            connection:Disconnect()
            connection = nil
        end
        if icePlatform then
            icePlatform:Destroy()
            icePlatform = nil
        end
        return
    end
    
    local platform = getOrCreatePlatform()
    
    connection = RunService.Heartbeat:Connect(function()
        if not _G.IceWalkRunning then return end
        
        local character = player.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then
            if platform.Parent then platform.Parent = nil end
            return
        end
        
        local rootPart = character.HumanoidRootPart
        local posY = rootPart.Position.Y

        if posY <= 5 and posY >= -5 then
            if platform.Parent ~= Workspace then
                platform.Parent = Workspace
            end
            

            platform.Position = Vector3.new(rootPart.Position.X, 1.5, rootPart.Position.Z)
        else
            if platform.Parent == Workspace then
                platform.Parent = nil
            end
        end
    end)
end





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




local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

local netModule = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Net")
local registerHit = netModule:WaitForChild("RE/RegisterHit")
local registerAttack = netModule:WaitForChild("RE/RegisterAttack")

local fastAttackConnection = nil

-- ฟังก์ชันหลักสำหรับเปิด-ปิดระบบโจมตีออร์โต้ (รวมผู้เล่นและมอนสเตอร์)
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
            
            -- ฟังก์ชันช่วยส่งรีโมทโจมตีเป้าหมาย
            local function attackTarget(targetRoot)
                if targetRoot then
                    local argsHit = {
                        targetRoot, -- พาร์ทเป้าหมายที่โดนตี
                        {},
                        [4] = "211ee8ef" -- Hash อ้างอิงรีโมท
                    }
                    registerHit:FireServer(unpack(argsHit))
                    
                    local argsAttack = {
                        0.4000000059604645,
                        1
                    }
                    registerAttack:FireServer(unpack(argsAttack))
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
            
            -- 2. ตีผู้เล่นคนอื่นในเซิร์ฟเวอร์ (Workspace.Characters หรือผ่าน Players Service)
            for _, otherPlayer in ipairs(Players:GetPlayers()) do
                if otherPlayer ~= player then
                    local targetChar = otherPlayer.Character
                    if targetChar and targetChar:FindFirstChild("HumanoidRootPart") then
                        local targetRoot = targetChar.HumanoidRootPart
                        local humanoid = targetChar:FindFirstChildOfClass("Humanoid")
                        
                        -- เช็คว่าผู้เล่นยังมีชีวิตอยู่
                        if humanoid and humanoid.Health > 0 then
                            local distance = (rootPart.Position - targetRoot.Position).Magnitude
                            if distance <= 60 then -- ระยะโจมตี
                                attackTarget(targetRoot)
                            end
                        end
                    end
                end
            end
            
        end)
        
        task.wait(0.1)
    end)
end




























local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local DashEnabled = false
local DashSpeed = 50

local function GetCharacter()
    local charactersFolder = workspace:FindFirstChild("Characters")
    if charactersFolder then
        local char = charactersFolder:FindFirstChild(LocalPlayer.Name)
        if char then return char end
    end
    return LocalPlayer.Character
end

RunService.RenderStepped:Connect(function(deltaTime)
    if not DashEnabled then return end

    local character = GetCharacter()
    if not character then return end

    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end

    -- ถ้าตัวละครกำลังเคลื่อนที่ ให้พุ่งไปตามทิศทางที่กดเดิน
    if humanoid.MoveDirection.Magnitude > 0 then
        local dashMultiplier = DashSpeed / 16
        character:TranslateBy(humanoid.MoveDirection * dashMultiplier * deltaTime * 10)
    end
end)












local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer


-- System Control Variables
local FollowEnabled = false
local FollowDistance = 100 -- Detection radius
local TpBehindDistance = 3 -- Distance offset behind the target
local FollowKeybind = Enum.KeyCode.E

-- ฟังก์ชันตรวจสอบว่าควรละเว้นเป้าหมายนี้หรือไม่ (รวมการเช็คเพื่อนร่วมทีม)
local function ShouldIgnoreTarget(targetCharacter)
    local targetPlayer = Players:GetPlayerFromCharacter(targetCharacter)
    if not targetPlayer then return true end
    
    -- เช็คว่าเป็นตัวเองหรือไม่
    if targetPlayer == LocalPlayer then 
        return true 
    end
    
    -- เช็คเพื่อนร่วมทีม (Team Check) - รองรับทั้งกรณีตั้ง Team และเกมที่ไม่มีระบบ Team แยกชัดเจน
    if LocalPlayer.Team and targetPlayer.Team then
        if targetPlayer.Team == LocalPlayer.Team then
            return true
        end
    end
    
    -- เช็คสถานะเลือด (Humanoid Health)
    local humanoid = targetCharacter:FindFirstChildOfClass("Humanoid")
    if humanoid and humanoid.Health <= 0 then
        return true
    end
    
    return false
end

local function GetClosestPlayerTarget()
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    
    if not rootPart then return nil end

    local closestTarget = nil
    local shortestDistance = FollowDistance

    for _, otherPlayer in ipairs(Players:GetPlayers()) do
        if otherPlayer.Character then
            -- ใช้ฟังก์ชันตรวจสอบเงื่อนไขการละเว้นเป้าหมาย
            if not ShouldIgnoreTarget(otherPlayer.Character) then
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
    end

    return closestTarget
end

task.spawn(function()
    while true do
        task.wait()
        if FollowEnabled then
            local character = LocalPlayer.Character
            local rootPart = character and character:FindFirstChild("HumanoidRootPart")
            local myHumanoid = character and character:FindFirstChild("Humanoid")

            if rootPart and myHumanoid and myHumanoid.Health > 0 then
                local currentTarget = GetClosestPlayerTarget()

                if currentTarget then
                    local targetRoot = currentTarget:FindFirstChild("HumanoidRootPart")
                    if targetRoot then
                        rootPart.CFrame = targetRoot.CFrame * CFrame.new(0, 0, TpBehindDistance)
                    end
                end
            end
        else
            task.wait(0.5)
        end
    end
end)





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

-- ตัวแปรตั้งค่า Hitbox
getgenv().HitboxEnabled = getgenv().HitboxEnabled or false
getgenv().HitboxSize = getgenv().HitboxSize or 5 -- ขนาดความกว้าง (ปกติของเกมมักจะอยู่ที่ 2 หรือ 3)
getgenv().HitboxPartName = getgenv().HitboxPartName or "HumanoidRootPart" -- เลือกขยายส่วนไหน (HumanoidRootPart หรือ Head)
getgenv().HitboxTransparency = 0.7 -- ความโปร่งใสของ Hitbox ที่ขยาย (0 คือทึบมองเห็น, 0.5 กำลังดี, 1 คือล่องหน)

RunService.RenderStepped:Connect(function()
    if not getgenv().HitboxEnabled then return end
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local targetPlayer = Players:GetPlayerFromCharacter(player.Character)
            -- เช็คทีม (ไม่ขยาย Hitbox เพื่อนร่วมทีม)
            if targetPlayer and targetPlayer.Team ~= LocalPlayer.Team then
                local part = player.Character:FindFirstChild(getgenv().HitboxPartName)
                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                
                if part and humanoid and humanoid.Health > 0 then
                    -- บันทึกขนาดเดิมไว้ถ้ายังไม่มี (ป้องกันเกมบัณทับซ้อน)
                    if not part:FindFirstChild("OriginalSize") then
                        local sizeObj = Instance.new("Vector3Value")
                        sizeObj.Name = "OriginalSize"
                        sizeObj.Value = part.Size
                        sizeObj.Parent = part
                    end
                    
                    -- ขยายขนาด Hitbox ตามที่ตั้งค่า
                    part.Size = Vector3.new(getgenv().HitboxSize, getgenv().HitboxSize, getgenv().HitboxSize)
                    part.Transparency = getgenv().HitboxTransparency
                    part.CanCollide = false -- ปิดการชนเพื่อไม่ให้ตัวละครติดหรือเดินชน
                end
            end
        end
    end
end)


--  ปุ่มทั้งหมด=================================================================





-- Main Tab Elements
local MainSection = Main:CreateSection({ Name = "Combat & Aim" })

Main:CreateToggle({
    name = "Fast Attack",
    flag = "FastAttack",
    value = false,
    callback = function(Value)
        SetFastAttack(Value)
    end,
})

local AimSection = Main:CreateSection({ Name = "Visual & Aim Settings" })

Main:CreateToggle({
    name = "Silent Aim",
    flag = "SilentAimToggle",
    value = getgenv().SilentAimEnabled,
    callback = function(Value)
        getgenv().SilentAimEnabled = Value
        if not Value and not getgenv().CamlockEnabled then
            getgenv().CurrentTarget = nil
            if RedLine then RedLine.Visible = false end
        end
    end,
})

Main:CreateToggle({
    name = "Show FOV Circle",
    flag = "ShowFOVToggle",
    value = getgenv().ShowFOV,
    callback = function(Value)
        getgenv().ShowFOV = Value
        if FOVCircle then FOVCircle.Visible = Value end
    end,
})

Main:CreateToggle({
    name = "Show Red Snapline",
    flag = "ShowTracerToggle",
    value = getgenv().ShowTracer,
    callback = function(Value)
        getgenv().ShowTracer = Value
        if not Value and RedLine then
            RedLine.Visible = false
        end
    end,
})

local AimConfigSection = Main:CreateSection({ Name = "Aim Configurations" })

Main:CreateDropdown({
    name = "FOV Position",
    multiSelect = false,
    options = { "Mouse/Touch", "Middle" },
    value = getgenv().FOVPositionMode,
    callback = function(selected)
        local mode = type(selected) == "table" and selected[1] or selected
        getgenv().FOVPositionMode = mode
    end,
})

Main:CreateDropdown({
    name = "Silent Aim",
    multiSelect = false,
    options = { "FOV", "180°", "360°" },
    value = "FOV",
    callback = function(selected)
        local mode = type(selected) == "table" and selected[1] or selected
        if mode == "180°" then
            getgenv().FOVRadius = 180
        elseif mode == "360°" then
            getgenv().FOVRadius = 9999 
        else
            getgenv().FOVRadius = 180 
        end
    end,
})

Main:CreateSlider({
    name = "FOV Size",
    flag = "FOVRadiusSlider",
    range = { 50, 500 },
    increment = 1,
    value = getgenv().FOVRadius,
    callback = function(Value)
        getgenv().FOVRadius = Value
    end,
})

Main:CreateSlider({
    name = "Max Distance",
    flag = "MaxDistanceSlider",
    range = { 50, 800 },
    increment = 1,
    value = getgenv().MaxDistance,
    callback = function(Value)
        getgenv().MaxDistance = Value
    end,
})


Main:CreateColorPicker({
    name = "Highlight",
    color = Color3.fromRGB(96, 205, 255),
    callback = function(color, alpha)
        CurrentThemeColor = color 
    end,
})



local HitboxSection = Main:CreateSection({ Name = "Hitbox Expander" })

Main:CreateToggle({
    name = "ขยาย Hitbox ศัตรู",
    flag = "HitboxToggle",
    value = getgenv().HitboxEnabled,
    callback = function(Value)
        getgenv().HitboxEnabled = Value
        -- ถ้าปิด ให้คืนค่าขนาดเดิมของตัวละครทันที
        if not Value then
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local part = player.Character:FindFirstChild(getgenv().HitboxPartName)
                    if part then
                        local orig = part:FindFirstChild("OriginalSize")
                        if orig then
                            part.Size = orig.Value
                            part.Transparency = 1 -- กลับเป็นล่องหนปกติของเกม
                            part.CanCollide = true
                        end
                    end
                end
            end
        end
    end,
})

Main:CreateSlider({
    name = "ขนาด Hitbox",
    flag = "HitboxSizeSlider",
    range = { 3, 100 },
    increment = 1,
    value = getgenv().HitboxSize,
    callback = function(Value)
        getgenv().HitboxSize = Value
    end,
})


-- General Tab Elements
local CharacterSection = General:CreateSection({ Name = "Character & Abilities" })

-- เอามาใส่ใน Toggle ของคุณ
General:CreateToggle({
    name = "Auto Race V4",
    flag = "",
    value = false,
    callback = function(Value)
        SetAutoRaceV4(Value)
    end,
})

General:CreateToggle({
    name = "Auto Race V3",
    flag = "AutoRaceAbility",
    value = false,
    callback = function(Value)
        SetAutoRaceAbility(Value)
    end,
})

General:CreateToggle({
    name = "Walking on Water",
    flag = "IceWalk",
    value = false,
    callback = function(Value)
        SetIceWalk(Value)
    end,
})

local UtilitySection = General:CreateSection({ Name = "High & FPS" })


local Lighting = game:GetService("Lighting")
local Terrain = workspace:FindFirstChildOfClass("Terrain")

General:CreateDropdown({
    name = "Graphics Modules",
    flag = "GraphicsModulesFlag",
    multiSelect = true,
    options = { 
        "Potato Graphics (ลบเอฟเฟกต์เพิ่ม FPS)", 
        "Shadows",       
        "Bloom / Glow",  
        "Atmosphere",    
        "Nice Water",    
        "High Quality"   
    },
    value = {}, 
    callback = function(selected)
        local function checkOption(name)
            if typeof(selected) == "table" then
                if selected[name] == true or table.find(selected, name) ~= nil then
                    return true
                end
            end
            return false
        end

        local isPotato = checkOption("Potato Graphics (ลบเอฟเฟกต์เพิ่ม FPS)")

        -- ถ้าเลือก Potato Graphics จะทำการเคลียร์เอฟเฟกต์หนักๆ ออกทันทีเพื่อกันแมพรีเซ็ตทับ
        if isPotato then
            Lighting.GlobalShadows = false
            Lighting.Brightness = 1
            for _, v in ipairs(Lighting:GetChildren()) do
                if v:IsA("PostEffect") or v:IsA("Sky") or v:IsA("Atmosphere") then
                    v.Enabled = false
                end
            end
        else
            -- 1. เงา
            Lighting.GlobalShadows = checkOption("Shadows")
            
            -- 2. ความสว่าง
            Lighting.Brightness = checkOption("High Quality") and 2 or 1
            
            -- 3. Bloom / Glow
            local bloom = Lighting:FindFirstChildOfClass("BloomEffect")
            if checkOption("Bloom / Glow") then
                if not bloom then
                    bloom = Instance.new("BloomEffect")
                    bloom.Parent = Lighting
                end
                bloom.Enabled = true
            else
                if bloom then bloom.Enabled = false end
            end

            -- 4. Atmosphere
            local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")
            if checkOption("Atmosphere") then
                if not atmosphere then
                    atmosphere = Instance.new("Atmosphere")
                    atmosphere.Parent = Lighting
                end
                atmosphere.Enabled = true
            else
                if atmosphere then atmosphere.Enabled = false end
            end
        end

        -- 5. น้ำสวย
        if Terrain then
            Terrain.WaterWaveSize = checkOption("Nice Water") and 0.1 or 0
            Terrain.WaterTransparency = checkOption("Nice Water") and 0.8 or 0.3
        end
    end,
})

local CombatBuffsSection = General:CreateSection({ Name = "Combat Buffs" })
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- สมมติฐานฟังก์ชันกดปุ่ม Ken Haki (ถ้าในสคริปต์คุณมีอยู่แล้ว สามารถลบส่วนนี้ออกได้)
local function PressKenKey()
    -- ตัวอย่างการจำลองการกดปุ่ม (หรือจะเปลี่ยนไปเรียก Remote Event ของ Ken Haki แทนก็ได้ตามสคริปต์ของคุณ)
    local vim = game:GetService("VirtualInputManager")
    vim:SendKeyEvent(true, Enum.KeyCode.E, false, game) -- เปลี่ยนปุ่ม 'E' ตามปุ่มฮาคิสังเกตของคุณ
    task.wait(0.1)
    vim:SendKeyEvent(false, Enum.KeyCode.E, false, game)
end

General:CreateToggle({
    name = "Observation Haki",
    flag = "AutoKenCheck",
    value = false, -- แนะนำให้เริ่มต้นเป็น false
    callback = function(Value)
        _G.AutoKenRunning = Value
        
        if Value then
            task.spawn(function()
                while _G.AutoKenRunning do
                    pcall(function()
                        local character = LocalPlayer.Character
                        if character then
                            -- เช็คว่าตัวละครมี Highlight หรือสถานะฮาคิสังเกตทำงานอยู่ไหม
                            local highlight = character:FindFirstChild("Highlight")
                            if not highlight then
                                PressKenKey()
                                task.wait(1) 
                            end
                        end
                    end)
                    task.wait(1.5)
                end
            end)
        end
    end,
})
General:CreateToggle({
    name = "Auto Buso",
    flag = "AutoHakiCheck",
    value = false,
    callback = function(Value)
        _G.AutoBusoRunning = Value
        
        if Value then
            task.spawn(function()
                while _G.AutoBusoRunning do
                    pcall(function() CheckAndEnableBuso() end)
                    task.wait(1) 
                end
            end)
        end
    end,
})

local MovementSection = General:CreateSection({ Name = "Movement Enhancements" })

General:CreateToggle({
    name = "Speed Boost",
    flag = "SpeedToggle",
    value = false,
    callback = function(Value)
        SpeedEnabled = Value
        local char = GetCharacter()
        if not Value and char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = 16 
        end
    end,
})

General:CreateSlider({
    name = "Speed",
    flag = "SpeedSlider",
    range = { 16, 150 },
    increment = 1,
    value = 80,
    callback = function(Value)
        CustomSpeed = Value
    end,
})

General:CreateToggle({
    name = "Jump Boost",
    flag = "JumpToggle",
    value = false,
    callback = function(Value)
        JumpEnabled = Value
        if not Value and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.JumpPower = 50 
        end
    end,
})

General:CreateSlider({
    name = "Jump",
    flag = "JumpSlider",
    range = { 50, 150 },
    increment = 1,
    value = 80,
    callback = function(Value)
        CustomJump = Value
    end,
})

General:CreateToggle({
    name = "Fly",
    flag = "FlyToggle",
    value = false,
    callback = function(Value)
        FlyEnabled = Value
    end,
})

General:CreateSlider({
    name = "Fly Speed",
    flag = "FlySlider",
    range = { 10, 200 },
    increment = 1,
    value = 50,
    callback = function(Value)
        FlySpeed = Value
    end,
})

General:CreateToggle({
    name = "Dash",
    flag = "DashToggle",
    value = false,
    callback = function(Value)
        DashEnabled = Value
    end,
})

General:CreateSlider({
    name = "DashSpeed",
    flag = "DashSlider",
    range = { 10, 100 },
    increment = 1,
    value = 50,
    callback = function(Value)
        DashSpeed = Value
    end,
})


-- Visuals Tab Elements
local VisualsSection = Visuals:CreateSection({ Name = "ESP Settings" })

Visuals:CreateToggle({
    name = "All Player ESP",
    flag = "ESPToggle",
    value = false,
    callback = function(Value)
        ESPEnabled = Value
        for _, p in ipairs(Players:GetPlayers()) do
            if p.Character and p.Character:FindFirstChild("Head") then
                local esp = p.Character.Head:FindFirstChild("PlayerESP")
                if esp then
                    local _, _, teamEnabled = GetTeamInfo(p)
                    esp.Enabled = ESPEnabled and teamEnabled
                end
            end
        end
    end,
})

Visuals:CreateToggle({
    name = "Devil Fruit ESP",
    flag = "FruitESP",
    value = false,
    callback = function(Value)
        _G.FruitESPRunning = Value
        
        if Value then
            pcall(function() RefreshFruitESP() end)
        else
            for _, obj in pairs(Workspace:GetDescendants()) do
                if obj and (obj.Name == "FruitESP_Highlight" or obj.Name == "FruitESP_Billboard") then
                    obj:Destroy()
                end
            end
        end
    end,
})





local UtilitySection = Visuals:CreateSection({ Name = "Utility & Anti-AFK" })


local AntiAFKConnection = nil

Visuals:CreateToggle({
    name = "Anti-AFK",
    flag = "AntiAFKToggle",
    value = true, 
    callback = function(Value)
        if Value then
            local vu = game:GetService("VirtualUser")
            AntiAFKConnection = game:GetService("Players").LocalPlayer.Idled:Connect(function()
                vu:CaptureController()
                vu:ClickButton2(Vector2.new())
            end)
        else
            if AntiAFKConnection then
                AntiAFKConnection:Disconnect()
                AntiAFKConnection = nil
            end
        end
    end,
})



local UtilitySection = Visuals:CreateSection({ Name = "Server Utilities" })

local InputJobId = ""

Visuals:CreateInput({
    name = "Server Job ID",
    flag = "JobIdInputFlag",
    placeholder = "Enter target Job ID...",
    value = "",
    numeric = false, 
    callback = function(text)
        InputJobId = text
    end,
})

Visuals:CreateButton({
    name = "Join Server",
    callback = function()
        pcall(function()
            if InputJobId ~= "" then
                local TeleportService = game:GetService("TeleportService")
                local Players = game:GetService("Players")
                local LocalPlayer = Players.LocalPlayer
                
                TeleportService:TeleportToPlaceInstance(game.PlaceId, InputJobId, LocalPlayer)
            else
                warn("Please enter a valid Job ID first!")
            end
        end)
    end,
})

Visuals:CreateButton({
    name = "Copy server code",
    callback = function()
        pcall(function()
            local currentJobId = game.JobId
            
            if setclipboard then
                setclipboard(currentJobId)
            elseif toclipboard then
                toclipboard(currentJobId)
            else
                return
            end
        end)
    end,
})













local UtilitySection = Main:CreateSection({ Name = "Target Tracker System" })


local FollowToggle = Main:CreateToggle({
    name = "Auto-Follow Nearest Target",
    flag = "FollowToggle",
    value = false,
    callback = function(Value)
        FollowEnabled = Value
    end,
})

Main:CreateKeybind({
    name = "Toggle Tracker Keybind",
    value = Enum.KeyCode.E,
    callback = function(key)
        if typeof(key) == "EnumItem" then
            FollowKeybind = key
        end
    end,
})

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == FollowKeybind then
            FollowEnabled = not FollowEnabled 
            
            -- แจ้งเตือนกระชับครั้งเดียวตอนกดปุ่มคีย์ลัด
            window:Notify({
                title = "Destiny Hub",
                content = FollowEnabled and "Enabled" or "Disabled",
                duration = 2,
            })
            
            if FollowToggle and FollowToggle.Set then
                FollowToggle:Set(FollowEnabled)
            end
        end
    end
end)

Main:CreateSlider({
    name = "Detection Range",
    flag = "FollowDistanceSlider",
    range = { 20, 300 },
    increment = 5,
    value = 100,
    callback = function(Value)
        FollowDistance = Value
    end,
})
















local noclipActive = false
local flyActive = false

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- ฟังก์ชัน Noclip (ทะลุกำแพง)
RunService.Stepped:Connect(function()
    if not noclipActive then return end
    local character = LocalPlayer.Character
    if not character then return end
    
    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
        end
    end
end)

RunService.Heartbeat:Connect(function()
    if not flyActive then return end
    local character = LocalPlayer.Character
    if not character then return end
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    
    if not humanoid or not rootPart or humanoid.Health <= 0 then return end
    
    humanoid.PlatformStand = true
    rootPart.AssemblyLinearVelocity = Vector3.new(0, 250, 0)
end)

local function toggleFly(state)
    flyActive = state
    local character = LocalPlayer.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    
    if not state and humanoid then
        humanoid.PlatformStand = false
    end
    
    window:Notify({
        title = "Destiny Hub",
        content = state and "Fly Up enabled." or "Fly Up disabled.",
        duration = 2,
    })
end

local UtilitySection = Visuals:CreateSection({ Name = "Movement & Noclip" })

Visuals:CreateToggle({
    name = "Noclip ",
    flag = "NoclipToggle",
    value = false,
    callback = function(Value)
        noclipActive = Value
        if not Value then
            local character = LocalPlayer.Character
            if character then
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
            end
        end
    end,
})

Visuals:CreateToggle({
    name = "Fly Up ",
    flag = "FlyUpToggle",
    value = false,
    callback = function(Value)
        toggleFly(Value)
    end,
})

Visuals:CreateKeybind({
    name = "Fly Up Keybind",
    flag = "FlyUpKeybind",
    value = Enum.KeyCode.LeftShift, 
    mode = "Toggle", 
    callback = function(key)
        flyActive = not flyActive
        toggleFly(flyActive)
    end,
})
