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

    Slider = Color3.fromHex("#3b82f6"),       -- สีหลอด Slider
    SliderThumb = Color3.fromHex("#FFFFFF"),  -- สีปุ่มลาก Slider
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
    Title = "Control Panel",
})

local Home = Window:Tab({
    Title = "Changelog",
    Icon = "clipboard-list"
})


local GeneralTab = Window:Tab({
    Title = "General",
    Icon = "gauge"
})



Window:Divider() 
Window:Section({
    Title = "Combat(PvP)",
})

local CombatTab = Window:Tab({
    Title = "Combat",
    Icon = "swords"
})

local Visuals = Window:Tab({ 
    Title = "Visuals (ESP)",
    Icon = "crosshair" 
})

local Macro = Window:Tab({ 
    Title = "Macro / PC",
    Icon = "package" 
})




Window:Divider() 
Window:Section({
    Title = "Player & Configuration",
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

-- ตรวจจับประเภทอุปกรณ์ (Device Detection)
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
        "• Status: [ <font color='#00FF00'>%s</font> ]\n• Executor: <font color='#00BFFF'>%s</font>\n• Device: <font color='#FFA500'>%s</font>\n• Created By: <font color='#FF4500'>%s</font>\n• Updated Status: <font color='#00FF00'>%s</font>\n• Last Updated: <font color='#FFFF00'>%s</font>\n• Player: <font color='#FF69B4'>%s (@%s)</font>\n\n────────────────────────\n🌟 Welcome back! Thanks for using our premium script hub.",
        statusText,
        executorName,
        deviceText,
        scriptCreator,
        isScriptUpdated,
        updateDate,
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

local FPS = Home:Input({
    Title = "FPS Unlocker ",
    Icon = "user",
    Desc = "Enter your desired max FPS ",
    Flag = "FPSUnlocker",
    Default = "60",
    Placeholder = "Enter max FPS...",
    Callback = function(text)
        local num = tonumber(text)
        if num then
            -- กำหนดขอบเขตความปลอดภัย (เช่น ไม่ต่ำกว่า 1 และไม่เกิน 9999)
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

local MyConfig = Window.ConfigManager:Config("DestinyConfig")

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

-- ปุ่ม Reset
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




local Configjson = Config:Section({ Title = "Config.json" })


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
                -- ตรวจสอบและสร้างโฟลเดอร์ย่อยทีละระดับแบบปลอดภัย
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

task.spawn(function()
    task.wait()
    pcall(function()
        MyConfig:Load()
    end)
end)










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
local UserInputService = game:GetService("UserInputService")

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

-- ตั้งค่าบล็อกคอมโบ
local MacroSettings = {
    Block1 = { Weapon = "Sword", Skill = "Z", Hold = 0.1, Wait = 0.4, Delay = 0.05 },
    Block2 = { Weapon = "Sword", Skill = "X", Hold = 0.1, Wait = 0.4, Delay = 0.05 },
    Block3 = { Weapon = "Melee", Skill = "Z", Hold = 1.0, Wait = 0.4, Delay = 0.05 },
    Block4 = { Weapon = "Melee", Skill = "X", Hold = 2.0, Wait = 0.4, Delay = 0.05 },
    Block5 = { Weapon = "Melee", Skill = "C", Hold = 0.1, Wait = 0.4, Delay = 0.05 },
    Block6 = { Weapon = "Blox Fruit", Skill = "Z", Hold = 0.1, Wait = 0.4, Delay = 0.05 },
    Block7 = { Weapon = "Blox Fruit", Skill = "X", Hold = 0.1, Wait = 0.4, Delay = 0.05 },
    Block8 = { Weapon = "Gun", Skill = "Z", Hold = 0.1, Wait = 0.4, Delay = 0.05 }
}

local isRunning = false
local macroEnabled = true
local currentEquippedWeapon = nil

-- ตรวจสอบว่าเป็นมือถือหรือไม่
local function IsMobileDevice()
    return UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
end

-- ==================== ฟังก์ชันสำหรับ PC ====================
local function PressPCKey(keyName, holdDuration)
    local keyCode = Enum.KeyCode[keyName]
    if not keyCode then return end

    VirtualInputManager:SendKeyEvent(true, keyCode, false, game)
    task.wait(holdDuration > 0 and holdDuration or 0.05)
    VirtualInputManager:SendKeyEvent(false, keyCode, false, game)
end

local function EquipWeaponPC(weaponType)
    if weaponType == "None" then return end
    if currentEquippedWeapon == weaponType then return end

    local keyToPress = nil
    if weaponType == "Melee" then
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
        currentEquippedWeapon = weaponType
        task.wait(0.08)
    end
end

local function ExecuteActionPC(skill, holdDuration)
    if skill == "Jump" then
        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
        task.wait(holdDuration > 0 and holdDuration or 0.05)
        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
    elseif skill == "Click (M1)" then
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
        task.wait(holdDuration > 0 and holdDuration or 0.05)
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
    elseif skill ~= "None" then
        PressPCKey(skill, holdDuration)
    end
end

-- ==================== ฟังก์ชันสำหรับมือถือ (Mobile เฉพาะตัว) ====================
-- ฟังก์ชันจำลองการทัชสกรีน ณ ตำแหน่งพิกัด X, Y บนหน้าจอ
local function TouchScreenAt(x, y, holdDuration)
    VirtualInputManager:SendTouchEvent(1, true, x, y, game)
    task.wait(holdDuration > 0 and holdDuration or 0.05)
    VirtualInputManager:SendTouchEvent(1, false, x, y, game)
end

local function PressMobileSkill(skillName)
    local skillsFolder = PlayerGui:FindFirstChild("Main") and PlayerGui.Main:FindFirstChild("Skills")
    if not skillsFolder then return end

    local targetButton = nil
    
    -- วนหาปุ่มสกิลตามโครงสร้าง UI ในมือถือ (Z, X, C, V, F)
    for _, child in ipairs(skillsFolder:GetChildren()) do
        if child.Name == skillName or (child:FindFirstChild("Title") and child.Title.Text == skillName) then
            local mobileBtn = child:FindFirstChild("Mobile") or child:FindFirstChild("_Mobile")
            if not mobileBtn then
                for _, sub in ipairs(child:GetDescendants()) do
                    if sub.Name == "Mobile" or sub.Name == "_Mobile" then
                        mobileBtn = sub
                        break
                    end
                end
            end
            
            if mobileBtn then
                targetButton = mobileBtn
                break
            end
        end
    end

    -- หากเจอ UI ปุ่มสกิลบนมือถือ ให้กดทัชที่ตำแหน่งนั้นทันที
    if targetButton and targetButton:IsA("GuiObject") then
        local pos = targetButton.AbsolutePosition + (targetButton.AbsoluteSize / 2)
        TouchScreenAt(pos.X, pos.Y, 0.05)
    end
end

local function EquipWeaponMobile(weaponType)
    if weaponType == "None" then return end
    if currentEquippedWeapon == weaponType then return end

    -- บนมือถือ Blox Fruits จะมีปุ่มช่องเก็บอาวุธ/สลอตด้านล่าง (สามารถปรับตำแหน่งพิกัดปุ่มสลับอาวุธบนจอ หรือใช้การกดปุ่ม Slot)
    -- ตรงนี้ใช้ระบบจำลองการกด Slot อาวุธ หรือถ้าเป็นระบบทัชสล็อต สามารถแก้พิกัดตรงนี้ได้ครับ
    local keyToPress = nil
    if weaponType == "Melee" then
        keyToPress = Enum.KeyCode.One
    elseif weaponType == "Blox Fruit" then
        keyToPress = Enum.KeyCode.Two
    elseif weaponType == "Sword" then
        keyToPress = Enum.KeyCode.Three
    elseif weaponType == "Gun" then
        keyToPress = Enum.KeyCode.Four
    end

    if keyToPress then
        -- บนมือถือบาง Executor รองรับ SendKeyEvent สำหรับปุ่มลัด
        VirtualInputManager:SendKeyEvent(true, keyToPress, false, game)
        task.wait(0.05)
        VirtualInputManager:SendKeyEvent(false, keyToPress, false, game)
        currentEquippedWeapon = weaponType
        task.wait(0.08)
    end
end

local function ExecuteActionMobile(skill, holdDuration)
    if skill == "Jump" then
        -- จำลองปุ่มกระโดดบนมือถือ (หรือใช้ Touch ทับปุ่ม Jump ถ้ามี)
        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
        task.wait(holdDuration > 0 and holdDuration or 0.05)
        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
    elseif skill == "Click (M1)" then
        -- จำลองการกดโจมตีธรรมดาบนมือถือ (กดทัชกลางจอหรือตำแหน่งปุ่มตี)
        local screenSize = workspace.CurrentCamera.ViewportSize
        TouchScreenAt(screenSize.X / 2, screenSize.Y / 2, holdDuration)
    elseif skill ~= "None" then
        PressMobileSkill(skill)
    end
end

-- ==================== ฟังก์ชันหลักรันคอมโบ ====================
_G.RunComboMacro = function()
    if not macroEnabled then return end
    if isRunning then return end
    
    task.spawn(function()
        isRunning = true
        currentEquippedWeapon = nil
        
        local isMobile = IsMobileDevice()

        for i = 1, 8 do
            local block = MacroSettings["Block" .. i]
            if block and block.Weapon ~= "None" and block.Skill ~= "None" then
                
                if isMobile then
                    EquipWeaponMobile(block.Weapon)
                    ExecuteActionMobile(block.Skill, block.Hold)
                else
                    EquipWeaponPC(block.Weapon)
                    ExecuteActionPC(block.Skill, block.Hold)
                end
                
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
for i = 1, 8 do
    local blockKey = "Block" .. i
    local section = Macro:Section({ Title = "Block " .. i })

    Macro:Dropdown({
        Title = "Weapon",
        Desc = "Select weapon type",
        Values = WeaponList,
        Value = MacroSettings[blockKey].Weapon,
        Flag = "block" .. i .. "_weapon",
        Callback = function(selected)
            if selected then
                MacroSettings[blockKey].Weapon = selected
            end
        end
    })

    Macro:Dropdown({
        Title = "Skill / Action",
        Desc = "Select skill to use",
        Values = SkillActionList,
        Value = MacroSettings[blockKey].Skill,
        Flag = "block" .. i .. "_skill",
        Callback = function(selected)
            if selected then
                MacroSettings[blockKey].Skill = selected
            end
        end
    })

    Macro:Input({
        Title = "Hold Duration",
        Desc = "Time to hold key/click (seconds)",
        Value = tostring(MacroSettings[blockKey].Hold),
        Flag = "block" .. i .. "_hold",
        Callback = function(val) 
            MacroSettings[blockKey].Hold = tonumber(val) or 0.1 
        end
    })

    Macro:Input({
        Title = "Skill Wait Time",
        Desc = "Wait time for skill animation (seconds)",
        Value = tostring(MacroSettings[blockKey].Wait),
        Flag = "block" .. i .. "_wait",
        Callback = function(val) 
            MacroSettings[blockKey].Wait = tonumber(val) or 0.4 
        end
    })

    Macro:Input({
        Title = "Delay",
        Desc = "Delay after action (seconds)",
        Value = tostring(MacroSettings[blockKey].Delay),
        Flag = "block" .. i .. "_delay",
        Callback = function(val) 
            MacroSettings[blockKey].Delay = tonumber(val) or 0.05 
        end
    })
end

Config:Keybind({
    Title = "Run Combo Macro",
    Value = "",
    Flag = "RunComboMacro_Keybind",
    Callback = function(key)
        _G.RunComboMacro()
    end
})

-- ปุ่มลอยบนหน้าจอสำหรับมือถือ (Floating Button)
createButton("Macro", Color3.fromRGB(0, 170, 255), false, function(state)
    _G.RunComboMacro() 
end)
