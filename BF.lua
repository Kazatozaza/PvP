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





local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local VirtualInputManager = game:GetService("VirtualInputManager")

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

-- ฟังก์ชันจำลองการทัชสกรีน (ใช้สำหรับมือถือโดยเฉพาะ)
local function TouchScreenAt(x, y, holdDuration)
    VirtualInputManager:SendTouchEvent(1, true, x, y, game)
    task.wait(holdDuration > 0 and holdDuration or 0.05)
    VirtualInputManager:SendTouchEvent(1, false, x, y, game)
end

-- ฟังก์ชันกดเปลี่ยนอาวุธสำหรับมือถือ (คลิกปุ่มสลอตด้านล่างจอ หรือใช้คีย์ลัดช่อง 1-4)
local function EquipWeaponMobile(weaponType)
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

-- ฟังก์ชันกดสกิลจาก PlayerGui.Main.Skills โดยตรงตามภาพที่คุณส่งมา
local function PressMobileSkillUI(skillName)
    local skillsFolder = PlayerGui:FindFirstChild("Main") and PlayerGui.Main:FindFirstChild("Skills")
    if not skillsFolder then return end

    local targetButton = nil
    
    -- ค้นหาโฟลเดอร์สกิล เช่น Z, X, C, V, F ภายใน Main.Skills
    for _, skillFolder in ipairs(skillsFolder:GetChildren()) do
        if skillFolder.Name == skillName or (skillFolder:FindFirstChild("Title") and skillFolder.Title.Text == skillName) then
            -- เจาะจงหาปุ่ม "Mobile" หรือ "_Mobile" ตามโครงสร้างในภาพ Explorer ของคุณ
            targetButton = skillFolder:FindFirstChild("Mobile") or skillFolder:FindFirstChild("_Mobile")
            break
        end
    end

    -- ถ้าเจอ ให้คำนวณตำแหน่งพิกัด AbsolutePosition แล้วกดทัชลงไปทันที
    if targetButton and targetButton:IsA("GuiObject") then
        local pos = targetButton.AbsolutePosition + (targetButton.AbsoluteSize / 2)
        TouchScreenAt(pos.X, pos.Y, 0.05)
    end
end

-- ฟังก์ชันจัดการแอคชั่นทั้งหมดสำหรับมือถือ
local function ExecuteActionMobile(skill, holdDuration)
    if skill == "Jump" then
        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
        task.wait(holdDuration > 0 and holdDuration or 0.05)
        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
    elseif skill == "Click (M1)" then
        local screenSize = workspace.CurrentCamera.ViewportSize
        TouchScreenAt(screenSize.X / 2, screenSize.Y / 2, holdDuration)
    elseif skill ~= "None" then
        -- บังคับเรียกใช้ระบบกด UI หน้าจอโทรศัพท์ (PlayerGui.Main.Skills) ตรงๆ
        PressMobileSkillUI(skill)
    end
end

-- ฟังก์ชันหลักรันคอมโบสำหรับมือถือ
_G.RunComboMacro = function()
    if not macroEnabled then return end
    if isRunning then return end
    
    task.spawn(function()
        isRunning = true
        currentEquippedWeapon = nil
        
        for i = 1, 8 do
            local block = MacroSettings["Block" .. i]
            if block and block.Weapon ~= "None" and block.Skill ~= "None" then
                
                EquipWeaponMobile(block.Weapon)
                ExecuteActionMobile(block.Skill, block.Hold)
                
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
