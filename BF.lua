local _version = "1.6.66"
if not game:IsLoaded() then game.Loaded:Wait() end

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/download/" .. _version .. "/main.lua"))()

WindUI:AddTheme({
    Name = "Destiny Cyber Neon Purple",
    Primary = Color3.fromHex("#FFFFFF"),
    White = Color3.fromHex("#FFFFFF"),
    Black = Color3.fromHex("#050505"),
    Dialog = Color3.fromHex("#121212"),
    Background = Color3.fromHex("#09090B"),
    BackgroundTransparency = 0.05,
    Hover = Color3.fromHex("#27272A"),
    PanelBackground = Color3.fromHex("#18181B"),
    PanelBackgroundTransparency = 0.3,
    WindowBackground = Color3.fromHex("#0F0F12"), 
    WindowShadow = Color3.fromHex("#A855F7"),
    WindowTopbarTitle = Color3.fromHex("#FFFFFF"),
    WindowTopbarAuthor = Color3.fromHex("#A1A1AA"),
    WindowTopbarIcon = Color3.fromHex("#FFFFFF"), -- เปลี่ยนไอคอนหัวข้อหน้าต่างเป็นสีขาว
    WindowTopbarButtonIcon = Color3.fromHex("#FFFFFF"),
    WindowSearchBarBackground = Color3.fromHex("#18181B"),
    
    -- Sidebar / Tabs
    TabBackground = Color3.fromHex("#121215"),
    TabBackgroundHover = Color3.fromHex("#27272A"),
    TabBackgroundHoverTransparency = 0.2,
    TabBackgroundActive = Color3.fromHex("#1F1F23"),
    TabBackgroundActiveTransparency = 0.0,
    TabText = Color3.fromHex("#A1A1AA"),
    TabTextTransparency = 0.1,
    TabTextTransparencyActive = 0,
    TabTitle = Color3.fromHex("#FFFFFF"),
    TabIcon = Color3.fromHex("#FFFFFF"), -- เปลี่ยนไอคอนเมนูซ้ายเป็นสีขาว
    TabIconTransparency = 0,
    TabIconTransparencyActive = 0,
    TabBorderTransparency = 1,
    TabBorderTransparencyActive = 0,
    TabBorder = Color3.fromHex("#A855F7"),
    TabSectionText = Color3.fromHex("#71717A"),
    TabSectionIcon = Color3.fromHex("#FFFFFF"), -- เปลี่ยนไอคอน Section ในเมนูเป็นสีขาว
    
    -- Elements / Cards
    ElementBackground = Color3.fromHex("#18181B"),
    ElementBackgroundTransparency = 0.4,
    ElementBackgroundHover = Color3.fromHex("#27272A"),
    ElementTitle = Color3.fromHex("#FFFFFF"),
    ElementDesc = Color3.fromHex("#A1A1AA"),
    ElementIcon = Color3.fromHex("#FFFFFF"), -- เปลี่ยนไอคอนในการ์ดเป็นสีขาว
    
    -- Buttons
    Button = Color3.fromHex("#1E1E24"),
    ButtonTransparency = 0,
    ButtonHover = Color3.fromHex("#A855F7"),
    ButtonText = Color3.fromHex("#FFFFFF"),
    ButtonTitle = Color3.fromHex("#FFFFFF"),
    ButtonIcon = Color3.fromHex("#FFFFFF"), -- เปลี่ยนไอคอนปุ่มเป็นสีขาว
    ButtonBorder = Color3.fromHex("#A855F7"),
    ButtonBorderTransparency = 0.2,
    
    Input = Color3.fromHex("#121215"),
    InputBackground = Color3.fromHex("#121215"),
    InputText = Color3.fromHex("#FFFFFF"),
    InputPlaceholder = Color3.fromHex("#71717A"),
    InputBorder = Color3.fromHex("#A855F7"),
    InputBorderTransparency = 0.4,
    
    Dropdown = Color3.fromHex("#121215"),
    DropdownBackground = Color3.fromHex("#121215"),
    DropdownItem = Color3.fromHex("#D4D4D8"),
    DropdownItemHover = Color3.fromHex("#27272A"),
    DropdownItemHoverTransparency = 0.2,
    DropdownItemActive = Color3.fromHex("#A855F7"),
    DropdownItemText = Color3.fromHex("#FFFFFF"),
    DropdownIcon = Color3.fromHex("#FFFFFF"), -- เปลี่ยนไอคอน Dropdown เป็นสีขาว
    DropdownTabBorder = Color3.fromHex("#A855F7"),
    
    -- Toggles
    Toggle = Color3.fromHex("#A855F7"),
    ToggleBar = Color3.fromHex("#FFFFFF"),
    ToggleEnabled = Color3.fromHex("#A855F7"),
    ToggleDisabled = Color3.fromHex("#27272A"),
    
    Checkbox = Color3.fromHex("#A855F7"),
    CheckboxIcon = Color3.fromHex("#050505"),
    CheckboxBorder = Color3.fromHex("#A855F7"),
    CheckboxBorderTransparency = 0.2,
    
    SliderIcon = Color3.fromHex("#FFFFFF"), -- เปลี่ยนไอคอน Slider เป็นสีขาว
    Slider = Color3.fromHex("#A855F7"),
    SliderThumb = Color3.fromHex("#FFFFFF"),
    SliderIconFrom = Color3.fromHex("#FFFFFF"), -- เปลี่ยนไอคอน Slider ฝั่งเริ่มต้นเป็นสีขาว
    SliderIconTo = Color3.fromHex("#FFFFFF"), -- เปลี่ยนไอคอน Slider ปลายทางเป็นสีขาว
    
    SectionBox = Color3.fromHex("#18181B"),
    SectionBoxTransparency = 0.5,
    SectionBoxBorder = Color3.fromHex("#A855F7"),
    SectionBoxBorderTransparency = 0.4,
    SectionBoxBackground = Color3.fromHex("#121215"),
    SectionBoxBackgroundTransparency = 0.5,
    
    Divider = Color3.fromHex("#27272A"),
    DividerTransparency = 0.3,
    Line = Color3.fromHex("#27272A"),
    LineTransparency = 0.3,
    
    Scrollbar = Color3.fromHex("#A855F7"),
    ScrollbarBackground = Color3.fromHex("#0F0F12"),
    ScrollbarTransparency = 0.1,
})

local success, Window = pcall(function()
    return WindUI:CreateWindow({
        Title = "Project Destiny [v3.0] Premium",
        Icon = "rbxassetid://82953555902230",
        Author = "System Online • Access Granted",
        Folder = "Destiny Hub",
        Size = UDim2.fromOffset(620, 558),
        Transparent = true,
        Theme = "Destiny Cyber Neon Purple",
        Resizable = true,
        SideBarWidth = 200,
        HideSearchBar = false,
        ScrollBarEnabled = true,
    })
end)
Window:DisableTopbarButtons({ "Close", "Minimize" })
Window:SetIconSize(40) 
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
CombatTab:Select()
local MyConfig = Window.ConfigManager:Config("DestinyConfig")
task.spawn(function()
    task.wait(3)
    pcall(function() MyConfig:Load() end)
end)
Window:CreateTopbarButton("ToggleMinimize", "minimize-2", function() Window:Close() end, 5, true, 17)
Window:CreateTopbarButton("Settings", "cog", function() Config:Select() end, 4, true, 17)
Window:CreateTopbarButton("swords", "swords", function() CombatTab:Select() end, 3, true, 17)
local Group = Config:Group({})
local Progress = Config:ProgressBar({
    Title = "files...",
    Value = { Min = 0, Max = 100, Default = 0 },
    DisplayMode = "Value",
    Width = 220,
})
Group:Button({
    Title="Save",
    Desc="Save settings",
    Icon="save",
    Callback=function()
        if MyConfig and typeof(MyConfig.Save)=="function" then
            Progress:Set(30)
            task.wait(.3)
            MyConfig:Save()
            Progress:Set(70)
            task.wait(.3)
            Progress:Set(100)

            WindUI:Notify({
                Title="System Saved",
                Content="Saved successfully!",
                Icon="bell-ring",
                Duration=3
            })

            task.delay(1.5,function()
                Progress:Set(0)
            end)
        else
            WindUI:Notify({
                Title="Error",
                Content="Config not found!",
                Icon="x",
                Duration=3
            })
        end
    end
})
Group:Button({
    Title = "Reset",
    Desc = "Reset to default",
    Icon  = "rotate-ccw",
    Callback = function()
        pcall(function()
            if MyConfig and typeof(MyConfig.Delete) == "function" then
                MyConfig:Delete()
            end
        end)
        WindUI:Notify({ Title = "System Warning", Content = "Settings reset!", Icon = "bell-ring", Duration = 3 })
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

--// สร้างเส้น Tracer (Snapline)
local Snapline = Drawing.new("Line")
Snapline.Visible = false
Snapline.Thickness = 1.5        
Snapline.Color = Color3.fromRGB(255, 255, 255) 
Snapline.Transparency = 1             
Snapline.From = Vector2.new(0, 0)         
Snapline.To = Vector2.new(0, 0)         

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

local safeZonesFolder = Workspace:FindFirstChild("_WorldOrigin") and Workspace._WorldOrigin:FindFirstChild("SafeZones")
local combatCache = {}
local safeZoneCache = {}
local lastCacheClear = tick()
local cacheExpiry = 0.2

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
        local combatObj = character:FindFirstChild("InCombat") or character:FindFirstChild("Combat") or character:FindFirstChild("CombatTag") or character:FindFirstChild("PvpTag")
        if combatObj and combatObj:IsA("ValueBase") then
            combatCache[player] = true
            return true
        end
    end

    combatCache[player] = false
    return false
end

local function isInSafeZoneRadius(character)
    if not character or not character:FindFirstChild("HumanoidRootPart") or not safeZonesFolder then return false end
    local charPos = character.HumanoidRootPart.Position
    
    for _, zonePart in ipairs(safeZonesFolder:GetChildren()) do
        if zonePart:IsA("BasePart") then
            local radius = math.max(zonePart.Size.X, zonePart.Size.Z) / 2
            local mesh = zonePart:FindFirstChildOfClass("SpecialMesh")
            if mesh then radius = (mesh.Scale.X / 2) * math.max(zonePart.Size.X, zonePart.Size.Z) end
            
            if (charPos - zonePart.Position).Magnitude <= radius then
                return true
            end
        end
    end
    return false
end

local function isPlayerInSafeZone(player, character)
    if not player then return false end
    if safeZoneCache[player] ~= nil then return safeZoneCache[player] end
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

--// อัปเดตรายชื่อเป้าหมาย
local cachedValidTargets = {}
local lastTargetUpdate = 0
local targetUpdateInterval = 0.2  

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
    if tick() - lastTargetUpdate >= targetUpdateInterval then
        lastTargetUpdate = tick()
        UpdateValidTargets()
    end
    return cachedValidTargets
end

local function GetReferencePosition()
    local viewportSize = Camera.ViewportSize
    local mode = tostring(getgenv().FOVPositionMode):lower()
    if mode:find("mouse") then
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
            local targetPlayer = Players:GetPlayerFromCharacter(char)
            if not ShouldIgnoreTarget(char, targetPlayer) then
                local maxDistance = getgenv().MaxDistance or 500
                local worldDistance = myHRP and (targetPart.Position - myHRP.Position).Magnitude or 0
                
                if worldDistance <= maxDistance then
                    local screenPos, onScreen = Camera:WorldToViewportPoint(targetPart.Position)
                    if onScreen then
                        local distance = (Vector2.new(screenPos.X, screenPos.Y) - refPos).Magnitude
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

--// ระบบ Silent Aim Hook Metamethod
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
    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local Humanoid = Character:WaitForChild("Humanoid")
    local RootPart = Character:WaitForChild("HumanoidRootPart")

    repeat task.wait() until Character:IsDescendantOf(workspace) and Humanoid.Health > 0
    local success, Mouse = pcall(function() return LocalPlayer:GetMouse() end)
    if not success or not Mouse then return end

    local oldIndex
    oldIndex = hookmetamethod(game, "__index", newcclosure(function(self, idx)
        if getgenv().SilentAimEnabled and self == Mouse then
            local rootPart = getTargetCFrame()
            if rootPart then
                if idx == "Hit" then return rootPart.CFrame
                elseif idx == "Target" then return rootPart
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
        local rootPart = getTargetCFrame()

        if getgenv().SilentAimEnabled and rootPart and (method == "FireServer" or method == "InvokeServer") then
            local targetCFrame = rootPart.CFrame
            local targetPos = targetCFrame.Position
            local args = { ... }
            
            for i = 1, #args do
                local argType = typeof(args[i])
                if argType == "CFrame" then args[i] = targetCFrame
                elseif argType == "Vector3" then args[i] = targetPos end
            end
            return oldNamecall(self, unpack(args))
        end
        return oldNamecall(self, ...)
    end))
end)

--// ลูป RenderStepped หลัก (ควบคุม FOV, Camlock, Tracer)
local currentUiColor = Color3.fromRGB(255, 255, 255)
local displayedUiColor = currentUiColor

RunService.RenderStepped:Connect(function(dt)
    clearCacheIfNeeded()
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

    -- จัดการแสดงผลวงแหวน FOV
    if FOVUI then
        if mode == "360°" or mode == "180°" then
            FOVUI.Visible = false
        else
            FOVUI.Visible = getgenv().ShowFOV == true
            if FOVUI.Visible then
                FOVUI.Position = UDim2.new(0, refPos.X, 0, refPos.Y)
                local size = (getgenv().FOVRadius or 100) * 2
                FOVUI.Size = UDim2.new(0, size, 0, size)
                if UIStroke then UIStroke.Color = displayedUiColor end
            end
        end
    end

    if not getgenv().SilentAimEnabled and not getgenv().CamlockEnabled then
        getgenv().CurrentTarget = nil
        if Snapline then Snapline.Visible = false end
        return
    end

    local bestTarget
    local shortestDistance = math.huge
    local maxDistance = getgenv().MaxDistance or 1000
    local validTargets = GetAllValidTargets()

    -- ค้นหาเป้าหมายตามโหมด
    if mode == "360°" or mode == "180°" then
        local lookVector = camera.CFrame.LookVector
        local cameraPos = camera.CFrame.Position

        for _, char in ipairs(validTargets) do
            if char and char ~= character then
                local rootPart = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Head")
                local humanoid = char:FindFirstChildOfClass("Humanoid")

                if rootPart and humanoid and humanoid.Health > 0 then
                    local targetPlayer = Players:GetPlayerFromCharacter(char)
                    if not ShouldIgnoreTarget(char, targetPlayer) then
                        local valid = true
                        if mode == "180°" then
                            valid = lookVector:Dot((rootPart.Position - cameraPos).Unit) > 0
                        end

                        if valid then
                            local distance = (myRoot.Position - rootPart.Position).Magnitude
                            if distance <= maxDistance and distance < shortestDistance then
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

    -- ระบบ Camlock (ล็อคมุมกล้อง)
    if getgenv().CamlockEnabled and bestTarget then
        local targetPos = GetPredictedPosition(bestTarget)
        if targetPos then
            camera.CFrame = CFrame.new(camera.CFrame.Position, targetPos)
        end
    end

    -- ระบบ Tracer (เส้นโยงเป้าหมาย)
    if bestTarget and getgenv().ShowTracer and Snapline then
        local targetPart = bestTarget
        if typeof(targetPart) == "Instance" and targetPart:IsA("Model") then
            targetPart = targetPart:FindFirstChild("HumanoidRootPart") or targetPart.PrimaryPart or targetPart:FindFirstChild("Head")
        end

        if targetPart and targetPart:IsA("BasePart") then
            local screenPos = camera:WorldToViewportPoint(targetPart.Position)
            if screenPos.Z > 0 then
                local origin = getgenv().TracerOrigin or "Center"
                local startPos

                if origin == "Center" then
                    startPos = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
                elseif origin == "Bottom" then
                    startPos = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y)
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

local function initializeSkillSettings()
local Players=game:GetService("Players")
local RunService=game:GetService("RunService")
local ReplicatedStorage=game:GetService("ReplicatedStorage")
local TweenService=game:GetService("TweenService")
local Workspace=game:GetService("Workspace")
local LocalPlayer=Players.LocalPlayer
local ENV=getgenv()

local Remotes=ReplicatedStorage:WaitForChild("Remotes",10)
local CommF=Remotes:WaitForChild("CommF_",10)
local commE=Remotes:WaitForChild("CommE",10)

local JumpEnabled=false
local JumpMultiplier=1
local DashEnabled=false
local DashMultiplier=1
local autoRaceConnection
local autoRaceV4Connection

local function GetCharacter()
    local f=Workspace:FindFirstChild("Characters")
    return (f and f:FindFirstChild(LocalPlayer.Name)) or LocalPlayer.Character
end

local function UpdateJump(h)
    h.UseJumpPower=true
    h.JumpPower=50*JumpMultiplier
end

local function UpdateDash(c,h,dt)
    if h.MoveDirection.Magnitude>0 then
        c:TranslateBy(h.MoveDirection*25*DashMultiplier*dt)
    end
end

local function SetAutoRaceAbility(state)
    _G.AutoRaceAbilityRunning=state

    if autoRaceConnection then
        autoRaceConnection:Disconnect()
        autoRaceConnection=nil
    end
    if not state then return end

    local last=0
    autoRaceConnection=RunService.Heartbeat:Connect(function()
        if not _G.AutoRaceAbilityRunning then return end
        local now=tick()
        if now-last<.5 then return end
        last=now

        pcall(function()
            local c=LocalPlayer.Character
            if c and c:FindFirstChild("HumanoidRootPart") and commE then
                commE:FireServer("ActivateAbility")
            end
        end)
    end)
end

local function SetAutoRaceV4(state)
    _G.AutoRaceV4Running=state

    if autoRaceV4Connection then
        autoRaceV4Connection:Disconnect()
        autoRaceV4Connection=nil
    end
    if not state then return end

    local last=0
    autoRaceV4Connection=RunService.Heartbeat:Connect(function()
        if not _G.AutoRaceV4Running then return end
        local now=tick()
        if now-last<.1 then return end
        last=now

        pcall(function()
            local c=LocalPlayer.Character
            if not c or not c:FindFirstChild("HumanoidRootPart") then return end

            local b=LocalPlayer:FindFirstChild("Backpack")
            local a=b and b:FindFirstChild("Awakening")
            local r=a and a:FindFirstChild("RemoteFunction")
            if r then r:InvokeServer(true) end
        end)
    end)
end

RunService.RenderStepped:Connect(function(dt)
    local c=GetCharacter()
    if not c then return end

    local h=c:FindFirstChildOfClass("Humanoid")
    if not h then return end

    if JumpEnabled then
        UpdateJump(h)
    elseif h.JumpPower~=50 then
        h.JumpPower=50
    end

    if DashEnabled then
        UpdateDash(c,h,dt)
    end
end)

-- BUSO
local function CheckAndEnableBuso()
    local c=LocalPlayer.Character
    if not c then return end

    local b=c:FindFirstChild("HasBuso")
    if not b or (b:IsA("BoolValue") and not b.Value) then
        if CommF then
            pcall(function()
                CommF:InvokeServer("Buso")
            end)
        end
    end
end

-- ESP CONFIG
ENV.ESPConfig=ENV.ESPConfig or {
    ShowName=true,
    ShowDistance=true,
    ShowLevel=true,
    ShowBounty=true,
    ShowHealth=true,
    ShowStatus=true,
    ShowAllTeams=true,
    Pirates=true,
    Marines=true
}

ENV.COLORS={
    Pirates=Color3.fromRGB(255,35,75),
    Marines=Color3.fromRGB(0,190,255),
    Neutral=Color3.fromRGB(230,230,240),
    White=Color3.fromRGB(255,255,255),
    Muted=Color3.fromRGB(170,170,190),
    HPBG=Color3.fromRGB(8,8,14),
    HPHigh=Color3.fromRGB(0,255,120),
    HPMid=Color3.fromRGB(255,220,0),
    HPLow=Color3.fromRGB(255,35,65),
    Level=Color3.fromRGB(255,220,0),
    Bounty=Color3.fromRGB(255,60,210),
    PvPOn=Color3.fromRGB(50,255,100),
    PvPOff=Color3.fromRGB(255,50,80),
    SafeZoneOn=Color3.fromRGB(0,235,255),
    SafeZoneOff=Color3.fromRGB(255,125,30),
    Combat=Color3.fromRGB(255,215,0),
    Outline=Color3.fromRGB(5,5,10)
}

local ESP=ENV.ESPConfig
local C=ENV.COLORS

if ENV.__ESPCleanup then
    pcall(ENV.__ESPCleanup)
end

local Registry={}
local GlobalConns={}
local SafeZones={}
local SafeZoneCacheTime=0

-- HELPERS
local function Hex(c)
    return string.format(
        "#%02X%02X%02X",
        math.floor(c.R*255+.5),
        math.floor(c.G*255+.5),
        math.floor(c.B*255+.5)
    )
end

local function Colored(text,color)
    return string.format(
        '<font color="%s">%s</font>',
        Hex(color),
        tostring(text)
    )
end

local function FormatNumber(n)
    if type(n)~="number" then return tostring(n) end
    if n>=1e9 then return string.format("%.1fB",n/1e9) end
    if n>=1e6 then return string.format("%.1fM",n/1e6) end
    if n>=1e3 then return string.format("%.1fK",n/1e3) end
    return tostring(n)
end

-- SAFE ZONE
local function RefreshSafeZones()
    SafeZones={}
    local o=Workspace:FindFirstChild("_WorldOrigin")
    local f=o and o:FindFirstChild("SafeZones")

    if not f then
        SafeZoneCacheTime=tick()
        return
    end

    for _,z in ipairs(f:GetChildren()) do
        if z:IsA("BasePart") then
            local m=z:FindFirstChildOfClass("SpecialMesh")
            SafeZones[#SafeZones+1]={
                Position=z.Position,
                Radius=m and m.Scale.X*.5 or math.max(z.Size.X,z.Size.Z)*.5
            }
        end
    end

    SafeZoneCacheTime=tick()
end

local function IsSafeZone(c)
    if not c then return false end

    local root=c:FindFirstChild("HumanoidRootPart")
    if not root then return false end

    if tick()-SafeZoneCacheTime>=5 then
        RefreshSafeZones()
    end

    for _,z in ipairs(SafeZones) do
        local d=root.Position-z.Position
        if d.X*d.X+d.Y*d.Y+d.Z*d.Z<=z.Radius^2 then
            return true
        end
    end

    return false
end

-- PLAYER DATA
local function GetTeam(p)
    if not p or not p.Parent then
        return "Player",C.White,false
    end

    local name=p.Team and p.Team.Name or "Neutral"

    if ESP.ShowAllTeams then
        return name,C[name] or C.Neutral,true
    end

    if name=="Pirates" then
        return name,C.Pirates,ESP.Pirates==true
    end

    if name=="Marines" then
        return name,C.Marines,ESP.Marines==true
    end

    return name,C.Neutral,true
end

local function GetLevel(p)
    local d=p:FindFirstChild("Data")
    local l=d and d:FindFirstChild("Level")

    if l then return l.Value end

    local s=p:FindFirstChild("leaderstats")
    l=s and s:FindFirstChild("Level")

    return l and l.Value or "?"
end

local function GetBounty(p)
    local s=p:FindFirstChild("leaderstats")
    local b=s and s:FindFirstChild("Bounty/Honor")
    return b and b.Value or 0
end

local function GetStatus(p)
    local off=p:GetAttribute("PvpDisabled")==true
    local c=p.Character

    local safe=p:GetAttribute("SafeZone")==true
        or (c and c:GetAttribute("SafeZone")==true)
        or IsSafeZone(c)
        or (c and c:FindFirstChild("TempSafeZone")~=nil)

    local combat=p:GetAttribute("InCombat")
    if c then
        combat=combat or c:GetAttribute("InCombat")
    end

    combat=combat==true or combat==1 or combat=="1"

    return
        off and "OFF" or "ON",
        off and C.PvPOff or C.PvPOn,
        safe and "SAFE" or "NORMAL",
        safe and C.SafeZoneOn or C.SafeZoneOff,
        combat and "COMBAT" or "READY",
        combat and C.Combat or C.Muted
end

-- UI
local function MakeLabel(parent,name,order,height,size)
    local l=Instance.new("TextLabel")
    l.Name=name
    l.LayoutOrder=order
    l.Size=UDim2.new(1,0,0,height)
    l.BackgroundTransparency=1
    l.RichText=true
    l.Text=""
    l.TextSize=size
    l.Font=Enum.Font.GothamBold
    l.TextColor3=C.White
    l.TextStrokeColor3=C.Outline
    l.TextStrokeTransparency=0
    l.TextXAlignment=Enum.TextXAlignment.Center
    l.TextYAlignment=Enum.TextYAlignment.Center
    l.Parent=parent
    return l
end

local function BuildUI(gui)
    local card=Instance.new("Frame")
    card.Name="Card"
    card.AnchorPoint=Vector2.new(.5,1)
    card.Position=UDim2.new(.5,0,1,0)
    card.Size=UDim2.new(0,190,0,0)
    card.AutomaticSize=Enum.AutomaticSize.Y
    card.BackgroundTransparency=1
    card.BorderSizePixel=0
    card.Parent=gui

    local pad=Instance.new("UIPadding")
    pad.PaddingTop=UDim.new(0,6)
    pad.PaddingBottom=UDim.new(0,6)
    pad.PaddingLeft=UDim.new(0,8)
    pad.PaddingRight=UDim.new(0,8)
    pad.Parent=card

    local layout=Instance.new("UIListLayout")
    layout.SortOrder=Enum.SortOrder.LayoutOrder
    layout.HorizontalAlignment=Enum.HorizontalAlignment.Center
    layout.Padding=UDim.new(0,3)
    layout.Parent=card

    local name=MakeLabel(card,"Name",1,16,12)
    local status=MakeLabel(card,"Status",2,12,9)
    local info=MakeLabel(card,"Info",3,13,10)

    local hp=Instance.new("Frame")
    hp.Name="HPBG"
    hp.LayoutOrder=4
    hp.Size=UDim2.new(1,0,0,11)
    hp.BackgroundColor3=C.HPBG
    hp.BackgroundTransparency=.1
    hp.BorderSizePixel=0
    hp.ClipsDescendants=true
    hp.Parent=card
    Instance.new("UICorner",hp).CornerRadius=UDim.new(1,0)

    local stroke=Instance.new("UIStroke")
    stroke.Thickness=1
    stroke.Color=Color3.fromRGB(60,60,80)
    stroke.Parent=hp

    local fill=Instance.new("Frame")
    fill.Name="Fill"
    fill.Size=UDim2.new(1,0,1,0)
    fill.BackgroundColor3=C.HPHigh
    fill.BorderSizePixel=0
    fill.Parent=hp
    Instance.new("UICorner",fill).CornerRadius=UDim.new(1,0)

    local grad=Instance.new("UIGradient")
    grad.Rotation=90
    grad.Color=ColorSequence.new(
        Color3.fromRGB(255,255,255),
        Color3.fromRGB(150,150,150)
    )
    grad.Parent=fill

    local hpText=Instance.new("TextLabel")
    hpText.Name="HPText"
    hpText.Size=UDim2.new(1,0,1,0)
    hpText.BackgroundTransparency=1
    hpText.Text=""
    hpText.TextSize=8
    hpText.Font=Enum.Font.GothamBold
    hpText.TextColor3=C.White
    hpText.TextStrokeColor3=C.Outline
    hpText.TextStrokeTransparency=.3
    hpText.ZIndex=3
    hpText.Parent=hp

    return {
        Card=card,
        Name=name,
        Status=status,
        Info=info,
        HPBG=hp,
        Fill=fill,
        HPText=hpText
    }
end

local HP_TWEEN=TweenInfo.new(.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)

-- ESP
local function CreateESP(player)
    if player==LocalPlayer or Registry[player] then return end

    local entry={
        Conns={},
        CharConns={},
        Token=0,
        Gui=nil,
        Update=nil
    }

    Registry[player]=entry

    local function ClearCharacter()
        for _,c in ipairs(entry.CharConns) do
            pcall(function()
                c:Disconnect()
            end)
        end

        table.clear(entry.CharConns)

        if entry.Gui then
            pcall(function()
                entry.Gui:Destroy()
            end)
            entry.Gui=nil
        end

        entry.Update=nil
    end

    entry.Destroy=function()
        entry.Token=entry.Token+1
        ClearCharacter()

        for _,c in ipairs(entry.Conns) do
            pcall(function()
                c:Disconnect()
            end)
        end

        table.clear(entry.Conns)
        Registry[player]=nil
    end

    local function Setup(character)
        entry.Token=entry.Token+1
        local token=entry.Token

        ClearCharacter()

        if not character then return end

        local head,humanoid

        for _=1,120 do
            if token~=entry.Token or not player.Parent or not character.Parent then
                return
            end

            head=character:FindFirstChild("Head")
            humanoid=character:FindFirstChildOfClass("Humanoid")

            if head and humanoid then break end
            task.wait(.25)
        end

        if not head or not humanoid then return end
        if token~=entry.Token or not player.Parent then return end

        local old=head:FindFirstChild("PlayerESP")
        if old then old:Destroy() end

        local _,_,enabled=GetTeam(player)

        local gui=Instance.new("BillboardGui")
        gui.Name="PlayerESP"
        gui.Adornee=head
        gui.Size=UDim2.fromOffset(220,110)
        gui.StudsOffset=Vector3.new(0,2.6,0)
        gui.AlwaysOnTop=true
        gui.LightInfluence=0
        gui.MaxDistance=10000000
        gui.Enabled=enabled
        gui.Parent=head

        entry.Gui=gui

        local ui=BuildUI(gui)

        local function UpdateHealth(value)
            if not ui.Fill.Parent then return end

            local max=math.max(humanoid.MaxHealth,1)
            local hp=math.clamp(tonumber(value) or 0,0,max)
            local percent=hp/max
            local color=percent>.65 and C.HPHigh
                or percent>.30 and C.HPMid
                or C.HPLow

            TweenService:Create(ui.Fill,HP_TWEEN,{
                Size=UDim2.new(percent,0,1,0),
                BackgroundColor3=color
            }):Play()

            ui.HPText.Text=string.format(
                "%s / %s",
                FormatNumber(math.floor(hp)),
                FormatNumber(math.floor(max))
            )
        end

        local function Update()
            if not gui.Parent or token~=entry.Token then return end

            local teamName,teamColor,teamEnabled=GetTeam(player)
            gui.Enabled=teamEnabled

            if not teamEnabled then return end

            ui.Name.Visible=ESP.ShowName
            ui.Status.Visible=ESP.ShowStatus
            ui.HPBG.Visible=ESP.ShowHealth
            ui.Info.Visible=ESP.ShowLevel or ESP.ShowBounty

            local distanceText=""

            if ESP.ShowDistance and LocalPlayer.Character then
                local myRoot=LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                local targetRoot=character:FindFirstChild("HumanoidRootPart")

                if myRoot and targetRoot then
                    local d=math.floor((myRoot.Position-targetRoot.Position).Magnitude)
                    distanceText="  "..Colored(d.."m",C.Muted)
                end
            end

            ui.Name.Text=string.format(
                "%s %s%s",
                Colored("["..string.upper(tostring(teamName)).."]",teamColor),
                Colored(player.DisplayName,C.White),
                distanceText
            )

            local pvp,pvpColor,safe,safeColor,combat,combatColor=GetStatus(player)
            local sep=Colored("  |  ",C.Muted)

            ui.Status.Text=table.concat({
                Colored("PvP ",C.Muted)..Colored(pvp,pvpColor),
                Colored(safe,safeColor),
                Colored(combat,combatColor)
            },sep)

            local parts={}

            if ESP.ShowLevel then
                parts[#parts+1]=Colored("LVL "..tostring(GetLevel(player)),C.Level)
            end

            if ESP.ShowBounty then
                parts[#parts+1]=Colored("💎 "..FormatNumber(GetBounty(player)),C.Bounty)
            end

            ui.Info.Text=table.concat(parts,sep)
        end

        Update()
        UpdateHealth(humanoid.Health)

        table.insert(
            entry.CharConns,
            humanoid.HealthChanged:Connect(UpdateHealth)
        )

        table.insert(
            entry.CharConns,
            humanoid:GetPropertyChangedSignal("MaxHealth"):Connect(function()
                UpdateHealth(humanoid.Health)
            end)
        )

        table.insert(
            entry.CharConns,
            character.AncestryChanged:Connect(function(_,parent)
                if not parent and token==entry.Token then
                    ClearCharacter()
                end
            end)
        )

        entry.Update=Update
    end

    local function SafeSetup(character)
        if not character then return end

        task.spawn(function()
            local ok,err=pcall(function()
                Setup(character)
            end)

            if not ok then
                warn("[ESP]",err)
            end
        end)
    end

    table.insert(
        entry.Conns,
        player.CharacterAdded:Connect(SafeSetup)
    )

    if player.Character then
        SafeSetup(player.Character)
    end
end

-- ESP LOOP
local acc=0

table.insert(
    GlobalConns,
    RunService.Heartbeat:Connect(function(dt)
        acc=acc+dt

        if acc<.1 then return end
        acc=0

        for _,entry in pairs(Registry) do
            if entry.Update then
                local ok,err=pcall(entry.Update)
                if not ok then
                    warn("[ESP]",err)
                end
            end
        end
    end)
)

table.insert(
    GlobalConns,
    Players.PlayerAdded:Connect(CreateESP)
)

table.insert(
    GlobalConns,
    Players.PlayerRemoving:Connect(function(player)
        local entry=Registry[player]
        if entry then
            entry.Destroy()
        end
    end)
)

for _,player in ipairs(Players:GetPlayers()) do
    CreateESP(player)
end

-- CLEANUP
ENV.__ESPCleanup=function()
    for _,c in ipairs(GlobalConns) do
        pcall(function()
            c:Disconnect()
        end)
    end

    table.clear(GlobalConns)

    for _,entry in pairs(Registry) do
        pcall(function()
            entry.Destroy()
        end)
    end

    table.clear(Registry)
end

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Camera = Workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

if CoreGui:FindFirstChild("CustomMobileTogglesStyle") then
    CoreGui.CustomMobileTogglesStyle:Destroy()
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomMobileTogglesStyle"
screenGui.Parent = CoreGui
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local BTN_W, BTN_H = 148, 42
local DRAG_THRESHOLD = 8

local OFF_BG = Color3.fromRGB(20,20,26)
local OFF_BG2 = Color3.fromRGB(30,30,38)
local OFF_STROKE = Color3.fromRGB(55,55,68)
local OFF_TEXT = Color3.fromRGB(170,170,185)
local OFF_TRACK = Color3.fromRGB(50,50,62)
local OFF_KNOB = Color3.fromRGB(190,190,205)
local OFF_STATUS = Color3.fromRGB(100,100,115)

local KNOB_OFF = UDim2.new(0,3,0.5,0)
local KNOB_ON = UDim2.new(1,-15,0.5,0)

local function tween(obj,time,props)
    TweenService:Create(
        obj,
        TweenInfo.new(time,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
        props
    ):Play()
end

local function createDraggableButton(text,accentColor,x,y,callback)
    local center = Vector2.new(x + BTN_W/2,y + BTN_H/2)

    local button = Instance.new("TextButton")
    button.AnchorPoint = Vector2.new(.5,.5)
    button.Size = UDim2.fromOffset(BTN_W,BTN_H)
    button.Position = UDim2.fromOffset(center.X,center.Y)
    button.BackgroundColor3 = Color3.new(1,1,1)
    button.BackgroundTransparency = .08
    button.BorderSizePixel = 0
    button.AutoButtonColor = false
    button.Text = ""
    button.Active = true
    button.Parent = screenGui

    Instance.new("UICorner",button).CornerRadius = UDim.new(0,12)

    local scale = Instance.new("UIScale",button)

    local gradient = Instance.new("UIGradient",button)
    gradient.Rotation = 90
    gradient.Color = ColorSequence.new(OFF_BG2,OFF_BG)

    local stroke = Instance.new("UIStroke",button)
    stroke.Color = OFF_STROKE
    stroke.Thickness = 1.5

    local bar = Instance.new("Frame",button)
    bar.AnchorPoint = Vector2.new(0,.5)
    bar.Size = UDim2.fromOffset(3,18)
    bar.Position = UDim2.new(0,8,.5,0)
    bar.BackgroundColor3 = OFF_STROKE
    bar.BorderSizePixel = 0
    Instance.new("UICorner",bar).CornerRadius = UDim.new(1,0)

    local label = Instance.new("TextLabel",button)
    label.Size = UDim2.new(1,-74,0,18)
    label.Position = UDim2.fromOffset(20,6)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = OFF_TEXT
    label.TextSize = 12
    label.Font = Enum.Font.GothamBold
    label.TextXAlignment = Enum.TextXAlignment.Left

    local status = Instance.new("TextLabel",button)
    status.Size = UDim2.new(1,-74,0,12)
    status.Position = UDim2.fromOffset(20,24)
    status.BackgroundTransparency = 1
    status.Text = "OFF"
    status.TextColor3 = OFF_STATUS
    status.TextSize = 10
    status.Font = Enum.Font.GothamMedium
    status.TextXAlignment = Enum.TextXAlignment.Left

    local track = Instance.new("Frame",button)
    track.AnchorPoint = Vector2.new(0,.5)
    track.Size = UDim2.fromOffset(32,18)
    track.Position = UDim2.new(1,-42,.5,0)
    track.BackgroundColor3 = OFF_TRACK
    track.BorderSizePixel = 0
    track.ClipsDescendants = true
    Instance.new("UICorner",track).CornerRadius = UDim.new(1,0)

    local knob = Instance.new("Frame",track)
    knob.AnchorPoint = Vector2.new(0,.5)
    knob.Size = UDim2.fromOffset(12,12)
    knob.Position = KNOB_OFF
    knob.BackgroundColor3 = OFF_KNOB
    knob.BorderSizePixel = 0
    Instance.new("UICorner",knob).CornerRadius = UDim.new(1,0)

    local dragging,dragInput,isDragging = false,nil,false
    local dragStart,startCenter
    local activeState = false

    local function updateVisual(state,fire)
        state = state == true

        if activeState == state and not fire then
            return
        end

        activeState = state

        if state then
            gradient.Color = ColorSequence.new(
                accentColor:Lerp(Color3.new(0,0,0),.72),
                Color3.fromRGB(16,16,22)
            )

            tween(stroke,.2,{Color=accentColor,Thickness=2})
            tween(bar,.2,{
                BackgroundColor3=accentColor,
                Size=UDim2.fromOffset(3,26)
            })
            tween(label,.2,{TextColor3=Color3.new(1,1,1)})
            tween(track,.2,{BackgroundColor3=accentColor})
            tween(knob,.2,{
                Position=KNOB_ON,
                BackgroundColor3=Color3.new(1,1,1)
            })
            tween(status,.2,{TextColor3=accentColor})
            status.Text = "ON"
        else
            gradient.Color = ColorSequence.new(OFF_BG2,OFF_BG)

            tween(stroke,.2,{Color=OFF_STROKE,Thickness=1.5})
            tween(bar,.2,{
                BackgroundColor3=OFF_STROKE,
                Size=UDim2.fromOffset(3,18)
            })
            tween(label,.2,{TextColor3=OFF_TEXT})
            tween(track,.2,{BackgroundColor3=OFF_TRACK})
            tween(knob,.2,{
                Position=KNOB_OFF,
                BackgroundColor3=OFF_KNOB
            })
            tween(status,.2,{TextColor3=OFF_STATUS})
            status.Text = "OFF"
        end

        if fire and callback then
            callback(activeState)
        end
    end

    button.InputBegan:Connect(function(input)
        if input.UserInputType ~= Enum.UserInputType.MouseButton1
            and input.UserInputType ~= Enum.UserInputType.Touch then
            return
        end

        dragging = true
        isDragging = false
        dragStart = input.Position
        startCenter = center

        tween(scale,.1,{Scale=.95})

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
                tween(scale,.12,{Scale=1})
            end
        end)
    end)

    button.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input ~= dragInput or not dragging then
            return
        end

        local delta = input.Position - dragStart

        if not isDragging then
            if math.abs(delta.X) < DRAG_THRESHOLD
                and math.abs(delta.Y) < DRAG_THRESHOLD then
                return
            end
            isDragging = true
        end

        local size = Camera.ViewportSize

        local newX = math.clamp(
            startCenter.X + delta.X,
            BTN_W/2,
            size.X - BTN_W/2
        )

        local newY = math.clamp(
            startCenter.Y + delta.Y,
            BTN_H/2,
            size.Y - BTN_H/2
        )

        center = Vector2.new(newX,newY)
        button.Position = UDim2.fromOffset(newX,newY)
    end)

    button.MouseButton1Click:Connect(function()
        if isDragging then
            return
        end

        updateVisual(not activeState,true)
    end)

    return {
        Instance = button,
        Set = function(state)
            updateVisual(state,false)
        end
    }
end

--==================================================
-- FOLLOW
--==================================================

local FollowEnabled = false
local FollowDistance = 300
local TpBehindDistance = 5
local FollowKeybind = Enum.KeyCode.E

local currentTarget
local teleportBtn
local FollowToggle
local activeTween
local lastTargetUpdate = 0
local updateDelay = .5
local TELEPORT_DURATION = .05

local followCombatCache = {}
local followSafeZoneCache = {}
local lastCacheClear = tick()

local function ClearCache()
    if tick() - lastCacheClear >= .2 then
        table.clear(followCombatCache)
        table.clear(followSafeZoneCache)
        lastCacheClear = tick()
    end
end

local function IsCombat(player,char)
    if not player then return false end
    if followCombatCache[player] ~= nil then
        return followCombatCache[player]
    end

    local v = player:GetAttribute("InCombat")
        or player:GetAttribute("Combat")
        or player:GetAttribute("CombatTag")

    if v == true or v == 1 or v == "1" then
        followCombatCache[player] = true
        return true
    end

    local t = player:GetAttribute("CombatTimer")
        or player:GetAttribute("InCombatTime")

    if type(t) == "number"
        and t > Workspace:GetServerTimeNow() then
        followCombatCache[player] = true
        return true
    end

    if char then
        local cv = char:GetAttribute("InCombat")
            or char:GetAttribute("Combat")
            or char:GetAttribute("CombatTag")

        if cv == true or cv == 1 or cv == "1" then
            followCombatCache[player] = true
            return true
        end

        local obj = char:FindFirstChild("InCombat")
            or char:FindFirstChild("Combat")
            or char:FindFirstChild("CombatTag")
            or char:FindFirstChild("PvpTag")

        if obj and obj:IsA("ValueBase") then
            if not obj:IsA("BoolValue")
                or obj.Value == true then
                followCombatCache[player] = true
                return true
            end
        end
    end

    followCombatCache[player] = false
    return false
end

local safeZones = Workspace:FindFirstChild("_WorldOrigin")
    and Workspace._WorldOrigin:FindFirstChild("SafeZones")

local function IsSafeRadius(char)
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root or not safeZones then return false end

    for _,zone in ipairs(safeZones:GetChildren()) do
        if zone:IsA("BasePart") then
            local radius = math.max(zone.Size.X,zone.Size.Z)/2
            local mesh = zone:FindFirstChildOfClass("SpecialMesh")

            if mesh then
                radius = mesh.Scale.X/2 *
                    math.max(zone.Size.X,zone.Size.Z)
            end

            if (root.Position-zone.Position).Magnitude <= radius then
                return true
            end
        end
    end

    return false
end

local function IsSafe(player,char)
    if not player then return false end
    if followSafeZoneCache[player] ~= nil then
        return followSafeZoneCache[player]
    end

    if IsCombat(player,char) then
        followSafeZoneCache[player] = false
        return false
    end

    local result =
        player:GetAttribute("SafeZone") == true
        or (char and char:GetAttribute("SafeZone") == true)
        or IsSafeRadius(char)
        or (char and char:FindFirstChild("TempSafeZone") ~= nil)

    followSafeZoneCache[player] = result
    return result
end

local function ShouldIgnore(char,player)
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum and hum.Health <= 0 then return true end

    local enemies = Workspace:FindFirstChild("Enemies")

    if enemies and char:IsDescendantOf(enemies) then
        return false
    end

    if not player or player == LocalPlayer then
        return true
    end

    if player:GetAttribute("PvpDisabled") == true then
        return true
    end

    if IsSafe(player,char) then
        return true
    end

    if LocalPlayer.Team
        and LocalPlayer.Team.Name == "Marines"
        and player.Team == LocalPlayer.Team then
        return true
    end

    return false
end

local function GetClosestPlayerTarget()
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then return nil end

    local closest
    local shortest = FollowDistance

    for _,player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character
            and not ShouldIgnore(player.Character,player) then

            local tRoot =
                player.Character:FindFirstChild("HumanoidRootPart")

            local hum =
                player.Character:FindFirstChildOfClass("Humanoid")

            if tRoot and hum and hum.Health > 0 then
                local dist =
                    (root.Position-tRoot.Position).Magnitude

                if dist < shortest then
                    shortest = dist
                    closest = player
                end
            end
        end
    end

    return closest
end

local function StopFollow()
    if activeTween then
        activeTween:Cancel()
        activeTween = nil
    end
end

local function FollowTarget(player)
    -- ไม่มีเป้าหมาย = หยุดเฉพาะการทำงาน
    -- ไม่แตะ CurrentTarget
    if not player or not player.Parent then
        StopFollow()
        return false
    end

    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChildOfClass("Humanoid")

    local targetChar = player.Character
    local targetRoot =
        targetChar and targetChar:FindFirstChild("HumanoidRootPart")

    local targetHum =
        targetChar and targetChar:FindFirstChildOfClass("Humanoid")

    -- ตัวเราไม่พร้อม
    if not root or not hum or hum.Health <= 0 then
        StopFollow()
        return false
    end

    -- เป้าหมายยังไม่มี Character / กำลังเกิดใหม่
    if not targetChar or not targetRoot or not targetHum then
        StopFollow()
        return false
    end

    -- เป้าหมายตาย
    if targetHum.Health <= 0 then
        StopFollow()
        return false
    end

    -- เช็คระยะ
    local distance =
        (root.Position - targetRoot.Position).Magnitude

    -- หลุดระยะ = หยุด แต่ "ไม่ยกเลิก CurrentTarget"
    if distance > FollowDistance then
        StopFollow()
        return false
    end

    ------------------------------------------------------------
    -- อยู่ในระยะแล้ว -> ทำงานต่อ
    ------------------------------------------------------------

    local targetCF = targetRoot.CFrame

    local behind =
        targetCF * CFrame.new(0, 0, TpBehindDistance)

    local params = RaycastParams.new()

    params.FilterType =
        Enum.RaycastFilterType.Exclude

    params.FilterDescendantsInstances = {
        char,
        targetChar
    }

    local hit = Workspace:Raycast(
        behind.Position + Vector3.new(0, 5, 0),
        Vector3.new(0, -15, 0),
        params
    )

    local pos = behind.Position

    if hit then
        pos =
            hit.Position
            + Vector3.new(0, 3, 0)
    end

    local cf = CFrame.new(
        pos,
        pos + targetCF.LookVector
    )

    -- ยกเลิก Tween เก่าก่อนสร้างใหม่
    if activeTween then
        activeTween:Cancel()
        activeTween = nil
    end

    activeTween = TweenService:Create(
        root,
        TweenInfo.new(
            TELEPORT_DURATION,
            Enum.EasingStyle.Linear
        ),
        {
            CFrame = cf
        }
    )

    activeTween:Play()

    return true
end

----------------------------------------------------------------
-- Follow Loop
----------------------------------------------------------------

task.spawn(function()
    while true do
        task.wait(0.05)

        if CurrentTarget then
            FollowTarget(CurrentTarget)
        else
            StopFollow()
        end
    end
end)

--==================================================
-- CAMERA LOCK
--==================================================

local camlockBtn = createDraggableButton(
    "Camera Lock",
    Color3.fromRGB(0,229,255),
    20,
    66,
    function(state)
        getgenv().CamlockEnabled = state

        if not state then
            getgenv().CurrentTarget = nil
        end
    end
)

--==================================================
-- FOLLOW STATE
--==================================================

local FollowSyncing = false
local FollowNotifyCooldown = false

local function SetFollowState(state,updateUI,message)
    state = state == true

    if FollowEnabled == state then
        if teleportBtn then
            teleportBtn.Set(state)
        end
        return
    end

    FollowEnabled = state

    if state then
        currentTarget = GetClosestPlayerTarget()
        lastTargetUpdate = 0
    else
        currentTarget = nil

        if activeTween then
            activeTween:Cancel()
            activeTween = nil
        end
    end

    if teleportBtn then
        teleportBtn.Set(state)
    end

    if updateUI and FollowToggle
        and FollowToggle.Set
        and not FollowSyncing then

        FollowSyncing = true

        pcall(function()
            FollowToggle:Set(state)
        end)

        task.defer(function()
            FollowSyncing = false
        end)
    end

    if WindUI and WindUI.Notify
        and not FollowNotifyCooldown then

        FollowNotifyCooldown = true

        WindUI:Notify({
            Title = "Destiny Hub",
            Content = message
                or (state
                    and "HARDCORE ON [LOCKED]"
                    or "HARDCORE OFF"),
            Icon = state and "power" or "power-off",
            Duration = 1.5
        })

        task.delay(.2,function()
            FollowNotifyCooldown = false
        end)
    end
end

teleportBtn = createDraggableButton(
    "Teleport Player",
    Color3.fromRGB(180,110,255),
    176,
    66,
    function(state)
        SetFollowState(state,true)
    end
)

local function DisableFollowSystem(message)
    if not FollowEnabled then
        teleportBtn.Set(false)
        return
    end

    SetFollowState(
        false,
        true,
        message or "Target lost! System off."
    )
end

--==================================================
-- LOOP
--==================================================

RunService.RenderStepped:Connect(function()
    if not FollowEnabled then
        currentTarget = nil
        return
    end

    ClearCache()

    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChildOfClass("Humanoid")

    if not root or not hum or hum.Health <= 0 then
        DisableFollowSystem("You died!")
        return
    end

    local now = tick()

    if now - lastTargetUpdate >= updateDelay then
        lastTargetUpdate = now

        if not currentTarget
            or not currentTarget.Character
            or ShouldIgnore(
                currentTarget.Character,
                currentTarget
            ) then

            currentTarget = GetClosestPlayerTarget()
        end
    end

    if currentTarget then
        if not FollowTarget(currentTarget) then
            DisableFollowSystem("Target lost! System off.")
        end
    else
        currentTarget = GetClosestPlayerTarget()
    end
end)

--==================================================
-- KEY E
--==================================================

UserInputService.InputBegan:Connect(function(input,processed)
    if processed then return end

    if input.UserInputType == Enum.UserInputType.Keyboard
        and input.KeyCode == FollowKeybind then

        SetFollowState(
            not FollowEnabled,
            true
        )
    end
end)



local toggleState = false
local soruCooldown = 1
local MIN_COOLDOWN = 0.1
local runId = 0

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local function setSoru(soruScript, on)
    pcall(function() soruScript.Enabled = on end)
    pcall(function() soruScript.Disabled = not on end)
end

-- หา Soru แบบครั้งเดียว ไม่รอ (ไม่เจอจะได้ nil)
local function findSoru()
    local char = player.Character
    local soruScript = char and char:FindFirstChild("Soru")
    if soruScript then return soruScript end

    local characters = workspace:FindFirstChild("Characters")
    local charFolder = characters and characters:FindFirstChild(player.Name)
    return charFolder and charFolder:FindFirstChild("Soru")
end

local Toggle = System:Toggle({
    Title = "Infinite Soru",
    Type = "Checkbox",
    Desc = "Unlimited Soru Latest update",
    Flag = "SoruToggle",

    Callback = function(state)
        toggleState = state
        runId = runId + 1 -- ให้ลูปเก่าหยุด

        if not state then
            return
        end

        local myId = runId

        task.spawn(function()
            local lastSoru = nil

            while toggleState and runId == myId do
                local soruScript = findSoru()

                if soruScript then
                    lastSoru = soruScript
                    local half = math.max(tonumber(soruCooldown) or 1, MIN_COOLDOWN) / 2

                    setSoru(soruScript, true)
                    task.wait(half)
                    if not toggleState or runId ~= myId then break end

                    setSoru(soruScript, false)
                    task.wait(half)
                else
                    -- ยังไม่เจอ Soru (กำลังรีสปอน) ลองใหม่เรื่อยๆ ไม่หยุดลูป
                    task.wait(1)
                end
            end

            -- ปิดสวิตช์แล้ว: คืนสถานะเปิดปกติ (ถ้าไม่มีรอบใหม่มาแทน)
            if runId == myId and lastSoru and lastSoru.Parent then
                setSoru(lastSoru, true)
            end
        end)
    end
})



System:Divider() 

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer

local defenseProtocolEnabled = false -- เปิดใช้งานทันที
local isEmergencyAscending = false

local healthTriggerThreshold = 30 -- เพิ่มเลือดขั้นต่ำให้ทำงานไวขึ้น (เช่น เลือดเหลือ 30% หนีทันที)
local healthRecoveryThreshold = 100 -- เลือดฟื้นกลับมาถึง 85% ถึงจะกลับลงมาสู้ต่อ
local ascentVelocity = 200 -- เพิ่มความเร็วในการพุ่งขึ้นฟ้าให้หนีพ้นระยะสกิล AOE

local blockedStates = {
    Enum.HumanoidStateType.Ragdoll,       -- สถานะตัวอ่อน/ล้ม
    Enum.HumanoidStateType.FallingDown,   -- สถานะโดนกระแทกล้ม
    Enum.HumanoidStateType.Physics,       -- สถานะถูกควบคุมแรงฟิสิกส์ภายนอก
    Enum.HumanoidStateType.PlatformStanding -- สถานะลอยตัว/ทรงตัวบนแพลตฟอร์ม
}
local function executeDefenseProtocol(character, humanoid, rootPart)
    if not defenseProtocolEnabled or not humanoid or humanoid.Health <= 0 or not rootPart then
        return
    end

    local maxHealth = humanoid.MaxHealth > 0 and humanoid.MaxHealth or 100
    local healthPercent = (humanoid.Health / maxHealth) * 100

    if healthPercent <= healthTriggerThreshold and not isEmergencyAscending then
        isEmergencyAscending = true
        
        pcall(function()
            humanoid.PlatformStand = true
            humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
        end)

        local destination = rootPart.CFrame + Vector3.new(0, 400, 0)
        local tween = TweenService:Create(
            rootPart,
            TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            {CFrame = destination}
        )
        tween:Play()
    end

    if isEmergencyAscending then
        pcall(function()
            humanoid.PlatformStand = true
            for _, state in ipairs(blockedStates) do
                humanoid:SetStateEnabled(state, false)
            end
        end)

        rootPart.AssemblyLinearVelocity = Vector3.new(0, ascentVelocity, 0)
        rootPart.AssemblyAngularVelocity = Vector3.zero

        local destroyHeight = workspace.FallenPartsDestroyHeight or -500
        if rootPart.Position.Y < destroyHeight + 400 then
            rootPart.CFrame = rootPart.CFrame + Vector3.new(0, 150, 0)
        end

        if healthPercent >= healthRecoveryThreshold then
            isEmergencyAscending = false
            
            pcall(function()
                humanoid.PlatformStand = false
                for _, state in ipairs(blockedStates) do
                    humanoid:SetStateEnabled(state, true)
                end
            end)
            
            rootPart.AssemblyLinearVelocity = Vector3.zero
        end

        return
    end
end
RunService.Heartbeat:Connect(function()
    if not defenseProtocolEnabled then return end

    local character = LocalPlayer.Character
    if not character then return end

    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local rootPart = character:FindFirstChild("HumanoidRootPart")

    if humanoid and rootPart then
        executeDefenseProtocol(character, humanoid, rootPart)
    end
end)
local SafetyMode = System:Section({
    Title = "Safety Mode",
    Icon = "shield-alert"
})
local ShieldToggle = System:Toggle({
    Title = "Safety Mode",
    Type = "Checkbox",
    Desc = "Automatically escapes and flies up when HP is critical",
    Value = false,
    Locked = false,
    Flag = "defense_protocol_toggle",

    Callback = function(value)
        defenseProtocolEnabled = value

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
    Type = "Checkbox",
    Desc = "Enables high-speed mode to reduce lag and improve smoothness.",
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
                for _, connection in ipairs(getconnections(btn.MouseButton1Click)) do
                    connection:Fire()
                end
            end
        end
    end
})
local Input = System:Input({
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
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local isAntiCCEnabled = false 

local blockedStates = {
    Enum.HumanoidStateType.Ragdoll,      -- สถานะตัวอ่อน/ล้ม
    Enum.HumanoidStateType.FallingDown,  -- สถานะโดนกระแทกล้ม
    Enum.HumanoidStateType.Physics,      -- สถานะถูกควบคุมแรงฟิสิกส์ภายนอก
    Enum.HumanoidStateType.PlatformStanding -- สถานะลอยตัว/ทรงตัวบนแพลตฟอร์ม
}
local function applyCrowdControl(humanoid, enableAntiCC)
    if not humanoid then return end

    pcall(function()
        for _, state in ipairs(blockedStates) do
            humanoid:SetStateEnabled(state, not enableAntiCC)
        end
    end)
end

LocalPlayer.CharacterAdded:Connect(function(character)
    if isAntiCCEnabled then
        local humanoid = character:WaitForChild("Humanoid", 5)
        if humanoid then
            applyCrowdControl(humanoid, true)
        end
    end
end)
local Toggle = CombatTab:Toggle({
    Title = "Anti-Stun",
    Type = "Checkbox",
    Desc  = "Blocks stun effects.",
    Value = false,
    Locked = false,
    Flag = "anti_cc_toggle",
    Callback = function(state)
        isAntiCCEnabled = state

        local character = LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChild("Humanoid")
            applyCrowdControl(humanoid, state)
        end
    end
})
CombatTab:Toggle({
    Title = "CamLock (PC/Mobile)",
    Type = "Checkbox",
    Desc  = "Lock onto targets instantly.",
    Flag  = "camlock_toggle",
    Value = getgenv().CamlockEnabled,
    Callback = function(state)
        getgenv().CamlockEnabled = state
        if not state then
            getgenv().CurrentTarget = nil
        end
    end,
})
CombatTab:Toggle({
    Title = "Silent Aim",
    Desc  = "Hit shots without precise crosshairs.",
    Type =  "Checkbox",
    Flag  = "silent_aim_toggle",
    Value =getgenv().SilentAimEnabled,
    Callback = function(state)
        getgenv().SilentAimEnabled = state
        
        if not state then
            getgenv().CurrentTarget = nil
            if Snapline then 
                Snapline.Visible = false 
            end
        end
    end
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
    Callback = function(state)
        
        getgenv().FOVRadius = state
        
        if getgenv().SilentAimMode == "FOV" then
            getgenv().SavedFOVRadius = state
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
    Type =  "Checkbox",
    Desc  = "Display FOV circle boundary.",
    Flag  = "show_fov_toggle",
    Value = getgenv().ShowFOV,
    Callback = function(state)
        getgenv().ShowFOV = state
        if FOVUI then 
            FOVUI.Visible = state 
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
    Type =  "Checkbox",
    Desc  = "Render line to active target.",
    Flag  = "show_snapline_toggle",
    Value = getgenv().ShowTracer,
    Callback = function(state)
        getgenv().ShowTracer = state
        if not state and Snapline then
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
    Callback = function(state)
        getgenv().MaxDistance = state
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
    Type =  "Checkbox",
    Desc = "Increases your attack speed automatically",
    Flag = "FastAttack",
    Value = false,
    Callback = function(state)
        SetFastAttack(state)
    end,
})
local Slider = GeneralTab:Slider({
    Title = "Attack Speed",
    Type =  "Checkbox",
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
    Type =  "Checkbox",
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
    Type =  "Checkbox",
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
    Type =  "Checkbox",
    Desc = "Auto Race V4 activate & upgrade.",
    Flag = "AutoRaceV4_Toggle",
    Value = false,
    Callback = function(state)
        SetAutoRaceV4(state)
    end,
})

GeneralTab:Toggle({
    Title = "Auto Race V3",
    Type =  "Checkbox",
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
    LastSeaLevel = nil,      -- ระดับน้ำล่าสุดที่เจอจริง
    LastHumanoid = nil,
}

local IceWalkUtils = {}

function IceWalkUtils.SetStates(hum, enabled)
    hum:SetStateEnabled(Enum.HumanoidStateType.Swimming, enabled)
    hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, enabled)
end

function IceWalkUtils.Cleanup()
    if IceWalkConfig.FloorConnection then
        IceWalkConfig.FloorConnection:Disconnect()
        IceWalkConfig.FloorConnection = nil
    end

    if IceWalkConfig.GiantFloor then
        IceWalkConfig.GiantFloor:Destroy()
        IceWalkConfig.GiantFloor = nil
    end

    local hum = IceWalkConfig.LastHumanoid
    if hum and hum.Parent then
        IceWalkUtils.SetStates(hum, true)
    end

    IceWalkConfig.LastSeaLevel = nil
    IceWalkConfig.LastHumanoid = nil
end

function IceWalkUtils.GetOrCreateFloor()
    local floor = IceWalkConfig.GiantFloor
    if not floor or not floor.Parent then
        floor = Instance.new("Part")
        floor.Name = "IceWalkFloor"
        floor.Size = Vector3.new(2048, 2, 2048)
        floor.Anchored = true
        floor.CanCollide = true
        floor.CanTouch = false
        floor.CanQuery = false
        floor.CastShadow = false
        floor.Transparency = 1
        floor.Parent = Workspace
        IceWalkConfig.GiantFloor = floor
    end
    return floor
end

GeneralTab:Toggle({
    Title = "Walking on Water",
    Type =  "Checkbox",
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
        raycastParams.IgnoreWater = false

        local RAY_RATE = 0.1       -- Raycast ทุก 0.1 วินาที
        local rayElapsed = RAY_RATE -- ให้ยิงทันทีในเฟรมแรก
        local DEFAULT_SEA = -2.8

        -- ใช้ Stepped: ทำงานก่อนฟิสิกส์คำนวณ พื้นจะได้อยู่ที่เดิมทันเวลา
        IceWalkConfig.FloorConnection = RunService.Stepped:Connect(function(_, dt)
            if not IceWalkConfig.FloorRunning then return end

            local character = LocalPlayer.Character
            if not character then return end

            local rootPart = character:FindFirstChild("HumanoidRootPart")
            local hum = character:FindFirstChildOfClass("Humanoid")
            if not rootPart or not hum then return end

            if not floorPart.Parent then
                floorPart = IceWalkUtils.GetOrCreateFloor()
            end

            -- Humanoid ตัวใหม่ (หลังตาย/รีสปอน) -> ปิด State ใหม่
            if IceWalkConfig.LastHumanoid ~= hum then
                IceWalkConfig.LastHumanoid = hum
                IceWalkUtils.SetStates(hum, false)
            end

            local pos = rootPart.Position

            -- Raycast แบบจำกัดความถี่ + เริ่มยิงจากสูงขึ้น กันกรณีตัวจมไปแล้ว
           -- Raycast แบบจำกัดความถี่ + เริ่มยิงจากสูงขึ้น กันกรณีตัวจมไปแล้ว
            rayElapsed = rayElapsed + dt
            if rayElapsed >= RAY_RATE then
                rayElapsed = 0
                raycastParams.FilterDescendantsInstances = { character, floorPart }

                local result = Workspace:Raycast(
                    pos + Vector3.new(0, 30, 0),
                    Vector3.new(0, -120, 0),
                    raycastParams
                )

                if result and result.Material == Enum.Material.Water then
                    IceWalkConfig.LastSeaLevel = result.Position.Y
                end
            end

            -- ถ้ายังไม่เคยเจอน้ำ ใช้ค่า default / ถ้าเจอแล้วจำค่าล่าสุดไว้
            local seaLevel = IceWalkConfig.LastSeaLevel or DEFAULT_SEA

            -- พื้นตามตัวทุกเฟรม (แค่เซ็ต Position ไม่หนัก)
            -- ผิวบนของพื้น = seaLevel (พื้นหนา 2 จึงเลื่อนลง 1)
            floorPart.Position = Vector3.new(pos.X, seaLevel - 1, pos.Z)

            -- กันจม: ถ้าต่ำกว่าผิวน้ำ (และอยู่ในช่วงที่เป็นน้ำจริง) ให้ดึงขึ้น
            if pos.Y < seaLevel + 1 and pos.Y > seaLevel - 40 then
                if hum:GetState() == Enum.HumanoidStateType.Swimming then
                    hum:ChangeState(Enum.HumanoidStateType.Running)
                end

                if pos.Y < seaLevel + 0.5 then
                    rootPart.CFrame = rootPart.CFrame + Vector3.new(0, (seaLevel + 4) - pos.Y, 0)
                    rootPart.AssemblyLinearVelocity = Vector3.new(
                        rootPart.AssemblyLinearVelocity.X, 0, rootPart.AssemblyLinearVelocity.Z
                    )
                end
            end
        end)
    end,
})

GeneralTab:Divider() 

GeneralTab:Toggle({
    Title = "Jump Boost",
    Type =  "Checkbox",
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
    Callback = function(state)
        JumpMultiplier = state
    end,
})
GeneralTab:Toggle({
    Title = "Speed Dash",
    Type =  "Checkbox",
    Desc = "Enables fast forward dashing ability.",
    Flag = "DashToggle",
    Value = false,
    Callback = function(state)
        DashEnabled = state
    end,
})
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
    Callback = function(state)
        DashMultiplier = state
    end,
})
Visuals:Toggle({
    Title = "Show Name",
    Type =  "Checkbox",
    Desc = "Displays player usernames.",
    Flag = "ESP_Name",
    Value = true,
    Callback = function(state)
        ESPConfig.ShowName = state
    end,
})
Visuals:Toggle({
    Title = "Show Distance",
    Type =  "Checkbox",
    Desc = "Shows distance to players.",
    Flag = "ESP_Distance",
    Value = true,
    Callback = function(state)
        ESPConfig.ShowDistance = state
    end,
})
Visuals:Toggle({
    Title = "Show Level",
    Type =  "Checkbox",
    Desc = "Displays player levels.",
    Flag = "ESP_Level",
    Value = true,
    Callback = function(state)
        ESPConfig.ShowLevel = state
    end,
})
Visuals:Toggle({
    Title = "Show Bounty",
    Type =  "Checkbox",
    Desc = "Shows current bounty or honor.",
    Flag = "ESP_Bounty",
    Value = true,
    Callback = function(state)
        ESPConfig.ShowBounty = state
    end,
})
Visuals:Toggle({
    Title = "Show Health",
    Type =  "Checkbox",
    Desc = "Renders health bars and percentages.",
    Flag = "ESP_HP",
    Value = true,
    Callback = function(state)
        ESPConfig.ShowHealth = state
    end,
})
Visuals:Toggle({
    Title = "Show Player Status",
    Type =  "Checkbox",
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
    Type = "Checkbox",
    Desc = "Tracks and follows your target.",
    Flag = "FollowToggle",
    Value = false,
    Callback = function(state)
        SetFollowState(state, false)
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
local LocalPlayer = Players.LocalPlayer
local noclipConnection = nil

local function setNoclip(state)
    local character = LocalPlayer.Character
    if not character then return end

    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = not state
        end
    end
end

Config:Toggle({
    Title = "Noclip",
    Type =  "Checkbox",
    Desc = "Walk through walls.",
    Flag = "NoclipToggle",
    Value = false,

    Callback = function(state)
        -- ป้องกัน Connection เก่าค้าง
        if noclipConnection then
            noclipConnection:Disconnect()
            noclipConnection = nil
        end

        if state then
            setNoclip(true)

            noclipConnection = RunService.Stepped:Connect(function()
                setNoclip(true)
            end)
        else
            setNoclip(false)
        end
    end,
})

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.5)

    if noclipConnection then
        setNoclip(true)
    end
end)


Config:Toggle({
    Title = "Camera Lock",
    Type =  "Checkbox",
    Desc = "ซ่อน/แสดง ปุ่ม Camera Lock",
    Flag = "ToggleCamlockUI",
    Value = true,

    Callback = function(Value)
        if camlockBtn and camlockBtn.Instance then
            camlockBtn.Instance.Visible = Value
        end
    end,
})

Config:Toggle({
    Title = "Teleport Player",
    Type =  "Checkbox",
    Desc = "ซ่อน/แสดง ปุ่ม Teleport Player",
    Flag = "ToggleTeleportUI",
    Value = true,

    Callback = function(Value)
        if teleportBtn and teleportBtn.Instance then
            teleportBtn.Instance.Visible = Value
        end
    end,
})

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
    local localPlayer = Players.LocalPlayer
    local myChar = localPlayer.Character
    if not myChar then return end
    
    local myRoot = myChar:FindFirstChild("HumanoidRootPart")
    if not myRoot then return end

    local humanoid = myChar:FindFirstChildOfClass("Humanoid")
    if humanoid and humanoid.Health > 0 then
        humanoid.PlatformStand = true
    else
        return
    end

    local targetPos = targetCFrame.Position
    local currentPos = myRoot.Position
    local distance = (targetPos - currentPos).Magnitude
    
    local maxDistance = (Bounty and Bounty.Flags and Bounty.Flags.SafeModeDistanceSlider) or 150
    local enemyDistanceOffset = (Bounty and Bounty.Flags and Bounty.Flags.EnemyDistanceSlider) or 0
    
    -- ==========================================
    -- 1. ระยะประชิด: ล็อคตำแหน่งและรันคอมโบ
    -- ==========================================
    if distance <= maxDistance then
        local targetRoot = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
        
        -- คำนวณตำแหน่งด้านหลังศัตรู พร้อมหันหน้ามองเป้าหมายเสมอเพื่อความสมูท
        local desiredCFrame
        if targetRoot then
            -- อยู่ด้านหลังเป้าหมาย และหันหน้าเข้าหาเป้าหมาย
            local offsetPos = targetRoot.CFrame * Vector3.new(0, 3, enemyDistanceOffset)
            desiredCFrame = CFrame.new(offsetPos, targetRoot.Position)
        else
            desiredCFrame = CFrame.new(myRoot.Position, targetPos) * CFrame.new(0, 3, enemyDistanceOffset)
        end
        
        -- ใช้ Lerp ความเร็วสูงแต่นุ่มนวล (ปรับค่า 0.35 ให้สูงขึ้นถ้าอยากให้ติดหนึบ หรือต่ำลงถ้าอยากให้สมูทสนิท)
        myRoot.CFrame = myRoot.CFrame:Lerp(desiredCFrame, 0.4)
        
        -- ล้างค่าความเร็วเชิงเส้นและเชิงมุมเพื่อไม่ให้ตัวละครไหลหรือสะดุด
        myRoot.AssemblyLinearVelocity = Vector3.zero
        myRoot.AssemblyAngularVelocity = Vector3.zero

        -- ระบบคอมโบสกิล
        if distance <= 100 then
            if tick() - lastComboTime >= comboCooldown then
                lastComboTime = tick()
                
                task.spawn(function()
                    if selectedMeleeSkills and selectedMeleeSkills[1] ~= "None" then
                        executeSkills(selectedMeleeSkills, "Melee")
                        task.wait(0.02)
                    end
                    
                    if selectedSwordSkills and selectedSwordSkills[1] ~= "None" then
                        executeSkills(selectedSwordSkills, "Sword")
                        task.wait(0.02)
                    end
                    
                    if selectedFruitSkills and selectedFruitSkills[1] ~= "None" then
                        executeSkills(selectedFruitSkills, "Fruit")
                        task.wait(0.02)
                    end
                    
                    if selectedGunSkills and selectedGunSkills[1] ~= "None" then
                        executeSkills(selectedGunSkills, "Gun")
                    end
                end)
            end
        end
        return
    end

    if distance > 0 then
        local direction = (targetPos - currentPos).Unit
        local currentSpeed = speed or (Bounty and Bounty.Flags and Bounty.Flags.FlySpeed) or 220
        local clampedSpeed = math.min(currentSpeed, 220)
        
        local targetVelocity = direction * clampedSpeed
        myRoot.AssemblyLinearVelocity = myRoot.AssemblyLinearVelocity:Lerp(targetVelocity, 0.25)
        myRoot.AssemblyAngularVelocity = Vector3.zero
        
        local lookAtCFrame = CFrame.lookAt(currentPos, targetPos)
        myRoot.CFrame = myRoot.CFrame:Lerp(lookAtCFrame, 0.25)
    end
end

local hopServersEnabled = false

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

local targetKillCount = {}
local MAX_KILLS_PER_TARGET = 3

local function isTargetBlocked(player)
    if not player then
        return true
    end

    return (targetKillCount[player.UserId] or 0) >= MAX_KILLS_PER_TARGET
end

local function registerTargetKill(player)
    if not player then
        return
    end

    local userId = player.UserId
    targetKillCount[userId] = (targetKillCount[userId] or 0) + 1
end

local function resetTargetKillCount(player)
    if player then
        targetKillCount[player.UserId] = nil
    end
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

    local playerList = updatePlayerCache()

    for _, targetPlayer in ipairs(playerList) do

        -- ข้ามเป้าหมายที่ถูกข้ามตามเงื่อนไขเดิม
        -- และข้ามเป้าหมายที่ครบ 3 ครั้งแล้ว
        if not shouldSkipTarget(targetPlayer, LocalPlayer)
            and not isTargetBlocked(targetPlayer) then

            local char = targetPlayer.Character

            if char then
                local targetRoot = char:FindFirstChild("HumanoidRootPart")
                local targetHum = char:FindFirstChildOfClass("Humanoid")

                if targetHum
                    and targetHum.Health > 0
                    and targetRoot then

                    local inSafeZone = false

                    pcall(function()
                        if isPlayerInSafeZone then
                            inSafeZone =
                                isPlayerInSafeZone(targetPlayer, char)
                        end
                    end)

                    if not inSafeZone then
                        local pvpDisabled =
                            targetPlayer:GetAttribute("PvpDisabled")
                            or char:GetAttribute("PvpDisabled")

                        if pvpDisabled ~= true then
                            local targetLevel =
                                getPlayerLevel(targetPlayer)

                            local isLevelValid = true

                            if type(myLevel) == "number"
                                and type(targetLevel) == "number" then

                                if math.abs(myLevel - targetLevel) > 800 then
                                    isLevelValid = false
                                end
                            end

                            if isLevelValid then
                                local distance =
                                    (targetRoot.Position - myRoot.Position).Magnitude

                                if distance <= 15000
                                    and distance < shortestDistance then

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

    cachedNearestTarget = {
        root = nearestTargetRoot,
        char = nearestTargetChar,
        distance = shortestDistance,
        player = nearestTargetPlayer
    }

    return cachedNearestTarget
end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local combatUI

local function findCombatUI()
    if combatUI and combatUI.Parent then
        return combatUI
    end

    combatUI = nil

    for _, obj in ipairs(PlayerGui:GetDescendants()) do
        if (obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox"))
            and not obj:GetFullName():find("Settings")
            and not obj:GetFullName():find("HUDButtonBar") then

            if string.lower(obj.Text or ""):find("in combat", 1, true) then
                combatUI = obj
                break
            end
        end
    end

    return combatUI
end

local function isPlayerInCombat2()
    local ui = findCombatUI()
    return ui ~= nil and ui.Parent ~= nil and ui.Visible == true
end

local function runAutoBounty(deltaTime)
    if not autoBountyEnabled or not isTeamSwitchVerified then
        return
    end

    local myChar = LocalPlayer.Character
    if not myChar then return end

    local rootPart = myChar:FindFirstChild("HumanoidRootPart")
    local charHumanoid = myChar:FindFirstChildOfClass("Humanoid")
    if not rootPart or not charHumanoid then return end

    if defenseProtocolEnabled and charHumanoid.Health > 0 then
        local maxHp = charHumanoid.MaxHealth > 0
            and charHumanoid.MaxHealth
            or 100

        local hpPercent = (charHumanoid.Health / maxHp) * 100

        if hpPercent <= healthTriggerThreshold then
            if not isEmergencyAscending then
                isEmergencyAscending = true

                getgenv().EmergencyY = rootPart.Position.Y + 800

                rootPart.AssemblyLinearVelocity = Vector3.zero
                rootPart.AssemblyAngularVelocity = Vector3.zero
                charHumanoid.PlatformStand = true
            end
        end

        if isEmergencyAscending then
            charHumanoid.PlatformStand = true

            local pos = rootPart.Position
            local targetY = getgenv().EmergencyY or (pos.Y + 800)

            if pos.Y < targetY then
                local newY = math.min(
                    pos.Y + (ascentVelocity * deltaTime),
                    targetY
                )

                rootPart.CFrame = CFrame.new(
                    pos.X,
                    newY,
                    pos.Z
                )
            end

            rootPart.AssemblyLinearVelocity = Vector3.zero
            rootPart.AssemblyAngularVelocity = Vector3.zero

            local destroyHeight = workspace.FallenPartsDestroyHeight or -500

            if rootPart.Position.Y < destroyHeight + 400 then
                rootPart.CFrame = rootPart.CFrame + Vector3.new(0, 300, 0)
            end

            if hpPercent < healthRecoveryThreshold then
                return
            end

            isEmergencyAscending = false
            getgenv().EmergencyY = nil

            charHumanoid.PlatformStand = false
            rootPart.AssemblyLinearVelocity = Vector3.zero
            rootPart.AssemblyAngularVelocity = Vector3.zero

            return
        end
    end

    -- ==========================================
    -- 🎯 AUTO BOUNTY
    -- ==========================================

    local myLevel = getPlayerLevel(LocalPlayer)
    local targetData = findNearestTarget(
        LocalPlayer,
        rootPart,
        myLevel
    )

    local nearestTargetRoot = targetData and targetData.root
    local nearestTargetChar = targetData and targetData.char
    local shortestDistance = targetData and targetData.distance or math.huge

    if nearestTargetRoot
        and nearestTargetChar
        and charHumanoid.Health > 0
        and shortestDistance <= 10000 then

        pcall(function()
            smoothFlyTo(
                nearestTargetRoot.CFrame,
                flySpeed,
                deltaTime,
                nearestTargetChar,
                shortestDistance
            )
        end)

        return
    end

    -- ==========================================
    -- 🌐 SERVER HOP
    -- ==========================================

    if not hopServersEnabled then return end
    if isPlayerInCombat2() then return end

    for i = 1, 30 do
        if not autoBountyEnabled or not hopServersEnabled then
            return
        end

        if isEmergencyAscending then
            return
        end

        if isPlayerInCombat2() then
            local browser = LocalPlayer.PlayerGui:FindFirstChild("ServerBrowser")
            if browser then
                browser.Enabled = false
            end
            return
        end

        local nData = findNearestTarget(
            LocalPlayer,
            rootPart,
            myLevel
        )

        if nData
            and nData.root
            and nData.distance <= 10000 then

            local browser = LocalPlayer.PlayerGui:FindFirstChild("ServerBrowser")
            if browser then
                browser.Enabled = false
            end

            return
        end

        task.wait(0.3)
    end

    if not autoBountyEnabled or not hopServersEnabled then return end
    if isPlayerInCombat2() then return end
    if isEmergencyAscending then return end

    local browserGui = LocalPlayer.PlayerGui:WaitForChild("ServerBrowser")
    browserGui.Enabled = true

    task.wait(1)

    while autoBountyEnabled and hopServersEnabled do
        if isEmergencyAscending then
            browserGui.Enabled = false
            return
        end

        if isPlayerInCombat2() then
            browserGui.Enabled = false
            return
        end

        local nData = findNearestTarget(
            LocalPlayer,
            rootPart,
            myLevel
        )

        if nData
            and nData.root
            and nData.distance <= 10000 then

            browserGui.Enabled = false
            return
        end

        local frame = browserGui:FindFirstChild("Frame", true)

        if frame then
            for _, i in ipairs(frame:GetDescendants()) do
                if not autoBountyEnabled
                    or not hopServersEnabled
                    or isEmergencyAscending then

                    browserGui.Enabled = false
                    return
                end

                if i:IsA("TextButton")
                    and (i.Text == "Join" or i.Name == "JoinButton") then

                    if firesignal then
                        firesignal(i.MouseButton1Click)
                    end

                    task.wait(0.3)

                elseif i:IsA("ScrollingFrame") then
                    i.CanvasPosition =
                        i.CanvasPosition + Vector2.new(0, 150)
                end
            end
        end

        task.wait(1)
    end

    browserGui.Enabled = false
end
local Toggle = Bounty:Toggle({
    Title = "Auto Bounty",
    Type =  "Checkbox",
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
    Type = "Checkbox", -- กำหนดให้เป็นแบบ Checkbox ตามในรูป
    Desc = "Automatically hop servers when no target found",
    Flag = "HopServers_Toggle",
    Default = false,
    Callback = function(state)
        hopServersEnabled = state
    end
})

local Toggle = Bounty:Toggle({
    Title = "Enable PvP",
    Type = "Checkbox",
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
                    
                    pcall(function()
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

local function Bounty_FormatNumber(number)
    number = tonumber(number) or 0

    if number >= 1e9 then
        return string.format("%.1fB", number / 1e9)
    elseif number >= 1e6 then
        return string.format("%.1fM", number / 1e6)
    elseif number >= 1e3 then
        return string.format("%.1fK", number / 1e3)
    end

    return tostring(number)
end

local function Bounty_GetDesc(player)
    local valid = Bounty_IsValid(player)

    local statusColor = valid and "#4ADE80" or "#F87171"
    local statusText = valid and "Ready" or "Not Ready"

    local level = Bounty_GetLevel(player)
    local bounty = Bounty_FormatNumber(Bounty_GetBounty(player))

    return string.format(
        '<font color="%s">● %s</font>  <font color="#71717A">•</font>  ' ..
        '<font color="#A1A1AA">Lv.</font> <font color="#F4F4F5">%s</font>  <font color="#71717A">•</font>  ' ..
        '<font color="#A1A1AA">Bounty</font> <font color="#FBBF24">%s</font>',
        statusColor,
        statusText,
        tostring(level),
        bounty
    )
end

local function Bounty_CreatePlayer(player)
    if player == LocalPlayer or playerControls[player.UserId] then
        return
    end

    selectedPlayers[player.UserId] = false

    -- ชื่อสั้น กระชับ
    local displayName = player.DisplayName
    if #displayName > 16 then
        displayName = string.sub(displayName, 1, 16) .. "..."
    end

    playerControls[player.UserId] = Bounty:Toggle({
        Title = displayName,

        Desc = Bounty_GetDesc(player),

        Value = false,
        Type =  "Checkbox",
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
    if humanoid and humanoid.Health > 0 then 
        humanoid.PlatformStand = true 
    else
        return
    end

    local targetPos = targetCFrame.Position
    local distance = (targetPos - root.Position).Magnitude

    local maxDistance =
        (Bounty and Bounty.Flags and Bounty.Flags.SafeModeDistanceSlider) or 150

    local offset =
        (Bounty and Bounty.Flags and Bounty.Flags.EnemyDistanceSlider) or 0

    if distance <= maxDistance then
        local targetRoot = targetCharacter and targetCharacter:FindFirstChild("HumanoidRootPart")
        
        -- คำนวณตำแหน่งเป้าหมายปลายทาง
        local desiredCFrame = targetRoot 
            and targetRoot.CFrame * CFrame.new(0, 3, offset)
            or CFrame.new(root.Position, targetPos) * CFrame.new(0, 3, offset)

        -- ✅ ใช้ Lerp เล็กน้อยแทนการย้าย CFrame ดิบๆ ป้องกันอาการตัวสั่น/กระตุก
        root.CFrame = root.CFrame:Lerp(desiredCFrame, 0.4)
        
        -- ล้างแรงเหวี่ยง
        root.Velocity = Vector3.zero
        root.AssemblyLinearVelocity = Vector3.zero
        root.AssemblyAngularVelocity = Vector3.zero

        -- ระบบคอมโบสกิล (ย้ายมาใช้ task.spawn และลดดีเลย์ให้รัวขึ้นแบบไม่บล็อกเฟรม)
        if distance <= 100 and tick() - lastComboTime >= comboCooldown then
            lastComboTime = tick()

            task.spawn(function()
                if selectedMeleeSkills and selectedMeleeSkills[1] ~= "None" then
                    executeSkills(selectedMeleeSkills, "Melee")
                    task.wait(0.02)
                end

                if selectedSwordSkills and selectedSwordSkills[1] ~= "None" then
                    executeSkills(selectedSwordSkills, "Sword")
                    task.wait(0.02)
                end

                if selectedFruitSkills and selectedFruitSkills[1] ~= "None" then
                    executeSkills(selectedFruitSkills, "Fruit")
                    task.wait(0.02)
                end

                if selectedGunSkills and selectedGunSkills[1] ~= "None" then
                    executeSkills(selectedGunSkills, "Gun")
                end
            end)
        end

        return
    end

    -- ✅ ช่วงกำลังบินพุ่งเข้าหาเป้าหมาย
    local direction = targetPos - root.Position
    if direction.Magnitude > 0 then
        direction = direction.Unit
        local finalSpeed = math.min(speed or flySpeed or 50, 220)

        root.AssemblyLinearVelocity = direction * finalSpeed
        root.AssemblyAngularVelocity = Vector3.zero
        
        -- ใช้ Lerp กับการหันหน้า ป้องกันหน้าจอสะบัดกระชาก
        local lookAtCFrame = CFrame.lookAt(root.Position, root.Position + direction)
        root.CFrame = root.CFrame:Lerp(lookAtCFrame, 0.3)
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





local Players = game:GetService("Players")
local LP = Players.LocalPlayer

-- =========================================================
-- Palette
-- =========================================================
local C = {
    Green  = "#4ADE80",
    Amber  = "#FBBF24",
    Red    = "#F87171",
    Cyan   = "#A78BFA",
    Purple = "#C4B5FD",
    Muted  = "#9CA3BC",
    Dim    = "#3B3F58",
    White  = "#F5F3FF",
}

local function rgb(hex)
    hex = hex:gsub("#", "")
    return Color3.fromRGB(
        tonumber(hex:sub(1, 2), 16),
        tonumber(hex:sub(3, 4), 16),
        tonumber(hex:sub(5, 6), 16)
    )
end

local function colorFor(pct)
    if pct >= 90 then return C.Green end
    if pct >= 60 then return C.Amber end
    return C.Red
end

local function gradeFor(pct)
    if pct >= 95 then return "S" end
    if pct >= 85 then return "A" end
    if pct >= 70 then return "B" end
    if pct >= 50 then return "C" end
    return "D"
end


local function bar(pct, len)
    len = len or 20
    local n = math.clamp(math.floor(pct / 100 * len + .5), 0, len)

    return string.format(
        '<font color="%s">%s</font><font color="%s">%s</font>',
        colorFor(pct),
        string.rep("━", n),
        C.Dim,
        string.rep("─", len - n)
    )
end


local function font(color, text)
    return string.format('<font color="%s">%s</font>', color, text)
end

-- =========================================================
-- Executor / Player info
-- =========================================================
local executorName = "Unknown"
pcall(function()
    if type(identifyexecutor) == "function" then
        local n = identifyexecutor()
        if n then executorName = tostring(n) end
    elseif type(getexecutorname) == "function" then
        local n = getexecutorname()
        if n then executorName = tostring(n) end
    end
end)

local username = LP and LP.Name or "Unknown"
local displayName = LP and LP.DisplayName or username

-- =========================================================
-- Checks
-- =========================================================
local function isFn(v) return type(v) == "function" end

local checks = {
    -- Executor
    { "Executor", "identifyexecutor", function() return isFn(identifyexecutor) end },
    { "Executor", "getexecutorname",  function() return isFn(getexecutorname) end },

    -- Environment
    { "Environment", "getgenv", function() return isFn(getgenv) end },
    { "Environment", "getfenv", function() return isFn(getfenv) end },
    { "Environment", "setfenv", function() return isFn(setfenv) end },
    { "Environment", "_G",      function() return type(_G) == "table" end },

    -- Hooking
    { "Hooking", "hookmetamethod",   function() return isFn(hookmetamethod) end },
    { "Hooking", "hookfunction",     function() return isFn(hookfunction) end },
    { "Hooking", "newcclosure",      function() return isFn(newcclosure) end },
    { "Hooking", "getnamecallmethod",function() return isFn(getnamecallmethod) end },
    { "Hooking", "getrawmetatable",  function() return isFn(getrawmetatable) end },
    { "Hooking", "setreadonly",      function() return isFn(setreadonly) end },
    { "Hooking", "isreadonly",       function() return isFn(isreadonly) end },

    -- Input
    { "Input", "firesignal",         function() return isFn(firesignal) end },
    { "Input", "fireclickdetector",  function() return isFn(fireclickdetector) end },
    { "Input", "fireproximityprompt",function() return isFn(fireproximityprompt) end },
    { "Input", "getconnections",     function() return isFn(getconnections) end },

    -- File System
    { "File System", "makefolder", function() return isFn(makefolder) end },
    { "File System", "isfolder",   function() return isFn(isfolder) end },
    { "File System", "isfile",     function() return isFn(isfile) end },
    { "File System", "writefile",  function() return isFn(writefile) end },
    { "File System", "readfile",   function() return isFn(readfile) end },
    { "File System", "appendfile", function() return isFn(appendfile) end },
    { "File System", "delfile",    function() return isFn(delfile) end },
    { "File System", "listfiles",  function() return isFn(listfiles) end },

    -- HTTP
    { "HTTP", "game:HttpGet",  function() return isFn(game.HttpGet) end },
    { "HTTP", "request",       function() return isFn(request) end },
    { "HTTP", "http_request",  function() return isFn(http_request) end },
    { "HTTP", "syn.request",   function()
        local genv = isFn(getgenv) and getgenv() or _G
        local s = rawget(genv, "syn")
        return type(s) == "table" and isFn(s.request)
    end },

    -- Drawing
    { "Drawing", "Drawing.new",       function() return type(Drawing) == "table" and isFn(Drawing.new) end },
    { "Drawing", "isrenderobj",       function() return isFn(isrenderobj) end },
    { "Drawing", "getrenderproperty", function() return isFn(getrenderproperty) end },
    { "Drawing", "setrenderproperty", function() return isFn(setrenderproperty) end },

    -- Roblox API
    { "Roblox API", "RaycastParams.new", function()
        return RaycastParams ~= nil and isFn(RaycastParams.new)
    end },
    { "Roblox API", "TweenService:Create", function()
        local ts = game:GetService("TweenService")
        return ts ~= nil and isFn(ts.Create)
    end },

    -- Utility
    { "Utility", "setclipboard",     function() return isFn(setclipboard) end },
    { "Utility", "setfpscap",        function() return isFn(setfpscap) end },
    { "Utility", "cloneref",         function() return isFn(cloneref) end },
    { "Utility", "compareinstances", function() return isFn(compareinstances) end },
}

-- =========================================================
-- Run checks + statistics
-- =========================================================
local results, categories = {}, {}
local total, working = #checks, 0

for _, c in ipairs(checks) do
    local cat, name, fn = c[1], c[2], c[3]
    local ok, res = pcall(fn)
    local pass = (ok and res) and true or false

    results[#results + 1] = { Category = cat, Name = name, Working = pass }

    local entry = categories[cat]
    if not entry then
        entry = { Total = 0, Working = 0, Items = {} }
        categories[cat] = entry
    end

    entry.Total = entry.Total + 1
    entry.Items[#entry.Items + 1] = { Name = name, Working = pass }

    if pass then
        entry.Working = entry.Working + 1
        working = working + 1
    end
end

local missing = total - working
local percentage = total > 0 and math.floor(working / total * 100) or 0
local grade = gradeFor(percentage)
local mainColor = colorFor(percentage)

-- =========================================================
-- Dashboard (hero card)
-- =========================================================
local line = font(C.Dim, "━━━━━━━━━━━━━━━━━━━━")

local dashboardText = table.concat({
    string.format('<b>%s</b>  %s', font(C.White, "SYSTEM OVERVIEW"), font(C.Muted, "• live scan")),
    line,
    string.format('%s  Executor     %s', font(C.Cyan, "◆"), font(C.Cyan, "<b>" .. executorName .. "</b>")),
    string.format('%s  Username     %s', font(C.Purple, "◆"), font(C.White, username)),
    string.format('%s  Display      %s', font(C.Purple, "◆"), font(C.White, displayName)),
    "",
    string.format('%s  Compatibility  %s  %s', font(mainColor, "◆"), font(mainColor, "<b>" .. percentage .. "%</b>"), font(mainColor, "Rank " .. grade)),
    bar(percentage, 24),
    "",
    string.format('%s  %s     %s  %s     %s  %s',
        font(C.Green, "✓"), font(C.White, working .. " working"),
        font(C.Red, "✗"), font(C.White, missing .. " missing"),
        font(C.Muted, "Σ"), font(C.White, total .. " total")),
    line,
    string.format('%s <b>%s</b>%s\n%s %s',
        font(C.Muted, "Welcome back,"), font(C.White, displayName), font(C.Muted, "."),
        font(C.Muted, "Enjoy your experience with"), font(C.Purple, "<b>Destiny Hub</b> ✦")),
}, "\n")

local function copyToClipboard(text, label)
    local ok, err = pcall(function()
        if isFn(setclipboard) then
            setclipboard(text)
        else
            error("setclipboard is not available")
        end
    end)
    if not ok then
        warn("[Destiny Hub] " .. label .. " error: " .. tostring(err))
    end
end

-- plain text report for the "Copy Report" button
local function buildReport()
    local out = {
        "Destiny Hub | Compatibility Report",
        "Executor: " .. executorName,
        string.format("Score: %d%% (Rank %s) - %d/%d", percentage, grade, working, total),
        "",
    }
    for _, r in ipairs(results) do
        out[#out + 1] = string.format("[%s] %s (%s)", r.Working and "OK" or "--", r.Name, r.Category)
    end
    return table.concat(out, "\n")
end

Home:Paragraph({
    Title = "✦ Destiny Hub | Dashboard",
    Desc = dashboardText,

    ImageSize = 50,
    Thumbnail = "rbxassetid://71825656372618",
    ThumbnailSize = 70,
    Buttons = {
        {
            Title = "Discord",
            Callback = function()
                copyToClipboard("https://discord.gg/hUMaVECvBz", "Clipboard")
            end,
        },
        {
            Title = "Report",
            Callback = function()
                copyToClipboard(buildReport(), "Report")
            end,
        },
    },
})
local categoryOrder = {
    "Executor", "Environment", "Hooking", "Input", "File System",
    "HTTP", "Drawing", "Roblox API", "Utility",
}
local categoryIcons = {
    ["Executor"]    = "terminal",
    ["Environment"] = "layers",
    ["Hooking"]     = "anchor",
    ["Input"]       = "mouse-pointer-click",
    ["File System"] = "folder",
    ["HTTP"]        = "globe",
    ["Drawing"]     = "pen-tool",
    ["Roblox API"]  = "box",
    ["Utility"]     = "wrench",
}
Home:Divider()
for _, catName in ipairs(categoryOrder) do
    local cat = categories[catName]
    if cat then
        local pct = math.floor(cat.Working / cat.Total * 100)
        local col = colorFor(pct)

        local rows = {
            string.format("%s  %s  %s",
                bar(pct, 16),
                font(col, "<b>" .. pct .. "%</b>"),
                font(C.Muted, string.format("(%d/%d)", cat.Working, cat.Total))),
            font(C.Dim, "────────────────────────"),
        }

        for _, it in ipairs(cat.Items) do
            if it.Working then
                rows[#rows + 1] = string.format("%s  %s  %s",
                    font(C.Green, "✓"), font(C.White, it.Name), font(C.Muted, "· available"))
            else
                rows[#rows + 1] = string.format("%s  %s  %s",
                    font(C.Red, "✗"), font(C.White, it.Name), font(C.Red, "· unavailable"))
            end
        end

        Home:Paragraph({
            Title = catName,
            Desc = table.concat(rows, "\n"),
            Image = categoryIcons[catName] or "layers",
            ImageSize = 22,
        })
    end
end
