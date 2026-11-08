local Library, SaveManager, InterfaceManager, Extension = loadstring(game:HttpGet("https://raw.githubusercontent.com/StyearX/Ui-Library/refs/heads/main/Fluent-Reimagined/Fluent-Reimagined.lua"))()

local Players: Players = game:GetService("Players")
local UserInputService: UserInputService = game:GetService("UserInputService")
local SoundService: SoundService = game:GetService("SoundService")
local HttpService: HttpService = game:GetService("HttpService")
local RunService: RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

Library:Configure({
	AnimationSpeed = 2,
	ReducedMotion = false,
	CallbackErrors = true,
	PageTransition = true,
	Intro = true,
})

local Window = Library:CreateWindow({
	Title = "Fluent Reimagined",
	SubTitle = Library.Version,
	TitleIcon = "lucide:layout-dashboard",
	SidebarTitle = "Home",
	Size = UDim2.fromOffset(760, 540),
	Theme = "Dark",
	Acrylic = true,
	Layout = "Fluent",
	NavPosition = "Top",
	IconStyle = "Plain",
	PanelDepth = 1,
	MinimizeKey = Enum.KeyCode.LeftControl,
})

local ThemeModeMenu
local ThemeModeToggle
local ThemeModeSegmented

Window:AddBarButtonToggle({
	Icon = "hero:bell-slash",
	Default = false,
	Callback = function(Value)
		Library:MuteInternal(Value)
	end,
})

ThemeModeMenu = Window:Menu({
	Title = "Context Menu",
	Placement = "BottomRight",
	Width = 240,
	Dim = false,
	DoNotBlur = true,
	OnClose = function()
		if ThemeModeToggle and ThemeModeToggle:GetValue() then
			ThemeModeToggle:SetValue(false, true)
		end
	end,
})

ThemeModeSegmented = ThemeModeMenu:AddSection("Theme"):AddSegmented("BarThemeMode", {
	Title = "Mode",
	Options = { "Normal", "Light", "Dark" },
	Default = Library:GetEffectiveThemeMode(),
	Callback = function(Value)
		if not Library:IsThemeModeAllowed() then
			Library:Notify({
				Title = "Theme Mode",
				Content = "Unavailable for the " .. Library.Theme .. " theme",
				Duration = 2,
			})
			ThemeModeSegmented:SetValue("Normal", true)
			return
		end
		Library:SetThemeMode(Value)
	end,
})

Library.ThemeChanged:Connect(function()
	ThemeModeSegmented:SetValue(Library:GetEffectiveThemeMode(), true)
end)

ThemeModeToggle = Window:AddBarButtonToggle({
	Icon = "hero:bars-3",
	Default = false,
	Callback = function(Value)
		if Value then
			ThemeModeMenu:Open(ThemeModeToggle.Button.Frame, "BottomRight")
		else
			ThemeModeMenu:Close()
		end
	end,
})

local Navigator = {
	Components = Window:AddTabInHeader({ Title = "Components", Icon = "lucide:component", SidebarTitle = "Components" }),
	Settings = Window:AddTabInHeader({ Title = "Settings", Icon = "lucide:settings", SidebarTitle = "Settings" }),
}

local SubTabs = {
	Buttons = Navigator.Components:AddTab({ Title = "Buttons", Icon = "lucide:mouse-pointer-click" }),
	Inputs = Navigator.Components:AddTab({ Title = "Inputs", Icon = "lucide:text-cursor-input" }),
	Selection = Navigator.Components:AddTab({ Title = "Selection", Icon = "lucide:list-checks" }),
	Display = Navigator.Components:AddTab({ Title = "Display", Icon = "lucide:image" }),
	Overlays = Navigator.Components:AddTab({ Title = "Overlays", Icon = "lucide:layout" }),
	Appearance = Navigator.Settings:AddTab({ Title = "Appearance", Icon = "lucide:palette" }),
	Config = Navigator.Settings:AddTab({ Title = "Config", Icon = "lucide:folder" }),
}

Window:AddFooterButton({
	Title = "Unload",
	Icon = "lucide:power",
	Danger = true,
	Header = Navigator.Settings,
	Callback = function()
		Window:Dialog({
			Title = "Delete Window",
			Content = "Are you sure you want to delete this window? The interface will be unloaded.",
			Buttons = {
				{
					Title = "Yes, Delete Window",
					Variant = "Danger",
					Callback = function()
						Library:Destroy()
					end,
				},
				{ Title = "No, Keep Window" },
			},
		})
	end,
})

local BannerSection = SubTabs.Buttons:AddSection("Banner", { Icon = "gloam:tabler:layout-board" })

local Request = request or http_request or (syn and syn.request)

local function GetBody(Url)
	local Success, Body = pcall(function()
		if Request then
			return Request({ Url = Url, Method = "GET" }).Body
		end
		return game:HttpGet(Url, true)
	end)

	if Success and type(Body) == "string" and #Body > 0 then
		return Body
	end

	return nil
end

local function Fetch(Url)
	local Body = GetBody(Url)
	if not Body then
		return nil
	end

	local Success, Result = pcall(HttpService.JSONDecode, HttpService, Body)
	if Success then
		return Result
	end

	return nil
end

local function First(Response)
	return Response and Response.data and Response.data[1]
end

local function DownloadImage(Url, Name)
	local Body = Url and GetBody(Url)
	if not Body then
		return nil
	end

	local Path = "GameBanner_" .. Name .. ".png"
	if not pcall(writefile, Path, Body) then
		return nil
	end

	local Success, Asset = pcall(getcustomasset, Path)
	if Success then
		return Asset
	end

	return nil
end

local Banner = BannerSection:AddBanner("GameBanner", {
	Title = "Loading...",
	FooterLeft = "Place ID: " .. game.PlaceId,
	FooterRight = "Job ID: " .. game.JobId,
	Height = 210,
})

task.spawn(function()
	local Universe = Fetch(`https://apis.roblox.com/universes/v1/places/{game.PlaceId}/universe`)
	local UniverseId = Universe and Universe.universeId
	if not UniverseId then
		Banner:SetProperties({
			Title = "Unknown Game",
			Subtitle = "Failed to fetch game info",
		})
		return
	end

	local Details = First(Fetch(`https://games.roblox.com/v1/games?universeIds={UniverseId}`))
	local Icon = First(Fetch(`https://thumbnails.roblox.com/v1/games/icons?universeIds={UniverseId}&size=256x256&format=Png&isCircular=false`))
	local Cover = First(Fetch(`https://thumbnails.roblox.com/v1/games/multiget/thumbnails?universeIds={UniverseId}&countPerUniverse=1&size=768x432&format=Png&isCircular=false`))

	local IconUrl = Icon and Icon.imageUrl
	local CoverUrl = Cover and Cover.thumbnails and Cover.thumbnails[1] and Cover.thumbnails[1].imageUrl

	Banner:SetProperties({
		Title = Details and Details.name or "Unknown Game",
		Subtitle = Details and Details.creator and Details.creator.name or "Unknown Developer",
		Avatar = DownloadImage(IconUrl, "Icon"),
		Thumbnail = DownloadImage(CoverUrl, "Cover"),
	})
end)

local ParagraphSection = SubTabs.Buttons:AddSection("Paragraph", { Icon = "lucide:align-left" })

local DemoParagraph = ParagraphSection:AddParagraph({
	Title = "Default",
	Content = "Plain paragraph with tags and a badge.",
	Icon = "hero:information-circle",
	Badge = { Text = "New", Color = "Accent" },
})
DemoParagraph:AddTag("Tag A")
DemoParagraph:AddTag({ Text = "Tag B" })

ParagraphSection:AddParagraph({ Title = "Note", Content = "Note variant.", Variant = "Note" })
ParagraphSection:AddParagraph({ Title = "Warning", Content = "Warning variant.", Variant = "Warning" })
ParagraphSection:AddParagraph({ Title = "Info", Content = "Info variant.", Variant = "Info" })
ParagraphSection:AddParagraph({ Title = "Success", Content = "Success variant.", Variant = "Success" })
ParagraphSection:AddParagraph({ Title = "Danger", Content = "Danger variant.", Variant = "Danger" })

local ButtonSection = SubTabs.Buttons:AddSection("Button", { Icon = "lucide:mouse-pointer-click" })

local ContextMenu = Window:Menu({
	Title = "Context Menu",
	Placement = "BottomRight",
	Width = 220,
})
local ContextSection = ContextMenu:AddSection("Actions")
ContextSection:AddButton({
	Title = "Copy Job Id",
	Icon = "hero:clipboard-document",
	Callback = function()
		if setclipboard then
			setclipboard(tostring(game.JobId))
		end
		Library:Toast("Copied", 2)
	end,
})
ContextSection:AddButton({
	Title = "Rejoin",
	Icon = "hero:arrow-path",
	Callback = function()
		Library:Toast("Rejoin requested", 2)
	end,
})

ButtonSection:AddButton({
	Title = "Row with menu",
	Description = "Opens a context menu.",
	Icon = "hero:bars-3",
	Menu = ContextMenu,
	MenuPlacement = "BottomRight",
	Callback = function() end,
})

for _, Kind in { "Primary", "Tonal", "Danger", "Ghost", "Outline", "Accent" } do
	ButtonSection:AddButton({
		Title = Kind .. " pill",
		Description = "Variant = " .. Kind,
		Variant = Kind,
		ButtonText = Kind,
		ButtonIcon = "hero:bolt",
		ButtonSize = "Md",
		Callback = function()
			Library:Toast(Kind .. " pressed", 2)
		end,
	})
end

for _, Size in { "Sm", "Md", "Lg" } do
	ButtonSection:AddButton({
		Title = "Pill size " .. Size,
		Variant = "Primary",
		ButtonText = Size,
		ButtonSize = Size,
		Callback = function() end,
	})
end

ButtonSection:AddButton({ Title = "Icon", Variant = "Icon", ButtonIcon = "hero:star", Callback = function() end })
ButtonSection:AddButton({ Title = "IconTonal", Variant = "IconTonal", ButtonIcon = "hero:heart", Callback = function() end })
ButtonSection:AddButton({ Title = "IconDanger", Variant = "IconDanger", ButtonIcon = "hero:trash", IconSize = "Md", Callback = function() end })

for _, Kind in { "Wide", "WideTonal", "WideDanger", "WideOutline", "WideAccent" } do
	ButtonSection:AddButton({
		Title = Kind,
		Variant = Kind,
		ButtonIcon = "hero:rocket-launch",
		Callback = function()
			Library:Toast(Kind .. " pressed", 2)
		end,
	})
end

local function FillButtonVariants(Host)
	for _, Kind in { "Primary", "Tonal", "Danger", "Ghost", "Outline", "Accent" } do
		Host:AddButton({
			Title = Kind .. " pill",
			Description = "Variant = " .. Kind,
			Variant = Kind,
			ButtonText = Kind,
			ButtonIcon = "hero:bolt",
			ButtonSize = "Md",
			Callback = function()
				Library:Toast(Kind .. " pressed", 2)
			end,
		})
	end

	for _, Size in { "Sm", "Md", "Lg" } do
		Host:AddButton({
			Title = "Pill size " .. Size,
			Variant = "Primary",
			ButtonText = Size,
			ButtonSize = Size,
			Callback = function()
				Library:Toast("Size " .. Size .. " pressed", 2)
			end,
		})
	end

	Host:AddButton({ Title = "Icon", Variant = "Icon", ButtonIcon = "hero:star", Callback = function() end })
	Host:AddButton({ Title = "IconTonal", Variant = "IconTonal", ButtonIcon = "hero:heart", Callback = function() end })
	Host:AddButton({ Title = "IconDanger", Variant = "IconDanger", ButtonIcon = "hero:trash", IconSize = "Md", Callback = function() end })

	for _, Kind in { "Wide", "WideTonal", "WideDanger", "WideOutline", "WideAccent" } do
		Host:AddButton({
			Title = Kind,
			Variant = Kind,
			ButtonIcon = "hero:rocket-launch",
			Callback = function()
				Library:Toast(Kind .. " pressed", 2)
			end,
		})
	end
end

local ElementPopUp
local BuildElementPopUp

local PopUpSection = SubTabs.Buttons:AddSection("PopUp", { Icon = "lucide:layout" })

PopUpSection:AddButton({
	Title = "Button Variants",
	Description = "Create a PopUp containing every button variant.",
	Icon = "lucide:mouse-pointer-click",
	ButtonText = "Create",
	Callback = function()
		local VariantPopUp = Library:CreatePopUp({
			Title = "Button Variants",
			Subtitle = "All variants",
			Icon = "lucide:mouse-pointer-click",
			Size = Vector2.new(520, 420),
			MinSize = Vector2.new(360, 240),
			MaximizeSize = Vector2.new(780, 640),
			ResizeAble = true,
		})
		local VariantSection = VariantPopUp:AddSection("Variants", { Icon = "lucide:mouse-pointer-click" })
		FillButtonVariants(VariantSection)
	end,
})

PopUpSection:AddButton({
	Title = "Elements",
	Description = "Open a PopUp containing other elements.",
	Icon = "lucide:component",
	ButtonText = "Open",
	Callback = function()
		if ElementPopUp and not ElementPopUp.Destroyed then
			ElementPopUp:Open()
		else
			BuildElementPopUp()
		end
	end,
})

local LayoutSection = SubTabs.Buttons:AddSection("Space & Group", { Icon = "lucide:layout-list" })

LayoutSection:AddSpace({ Height = 8 })
LayoutSection:AddGap({ Height = 4 })

local DemoGroup = LayoutSection:AddGroup({
	Title = "Group",
	Icon = "lucide:folders",
	Accordion = true,
	Collapsed = false,
	Spacing = 12,
	Gap = 8,
})
DemoGroup:AddToggle("GroupToggle", { Title = "Toggle inside group", Default = false })
DemoGroup:AddButton({ Title = "Button inside group", Callback = function() end })

local LockedGroup = LayoutSection:AddGroup({
	Title = "Locked group",
	Icon = "lucide:lock",
	Locked = true,
	LockedReason = "Locked for demo",
	Collapsed = true,
	Accordion = true,
})
LockedGroup:AddParagraph({ Title = "Hidden", Content = "Unlock to see." })

local ToggleSection = SubTabs.Inputs:AddSection("Toggle", { Icon = "lucide:toggle-left" })

local SwitchToggle = ToggleSection:AddToggle("DemoSwitch", {
	Title = "Switch",
	Description = "Default variant.",
	Default = true,
	Callback = function(Value)
		print("Switch:", Value)
	end,
})
SwitchToggle:OnChanged(function(Value)
	print("Switch changed:", Value)
end)

ToggleSection:AddToggle("DemoSimplefield", {
	Title = "Simplefield",
	Description = "Variant = Simplefield.",
	Variant = "Simplefield",
	Default = true,
	Callback = function(Value)
		print("Simplefield:", Value)
	end,
})
ToggleSection:AddToggle("DemoRadio", { Title = "Radio", Variant = "Radio", Default = false })
ToggleSection:AddToggle("DemoCheck", { Title = "Check", Variant = "Check", Default = true })

local SliderSection = SubTabs.Inputs:AddSection("Slider", { Icon = "lucide:sliders-horizontal" })

local SliderVariants = {
	{ "Pill", 50 },
	{ "Wide", 30 },
	{ "Bubble", 70 },
	{ "Number", 20 },
	{ "Gradient", 40 },
}
for _, Entry in SliderVariants do
	SliderSection:AddSlider("DemoSlider" .. Entry[1], {
		Title = Entry[1],
		Description = "Variant = " .. Entry[1],
		Variant = Entry[1],
		Default = Entry[2],
		Min = 0,
		Max = 100,
		Rounding = 0,
		Suffix = "%",
		Callback = function(Value)
			print(Entry[1], Value)
		end,
	})
end
SliderSection:AddSlider("DemoSliderHue", {
	Title = "Hue",
	Variant = "Hue",
	Default = 180,
	Callback = function(Value)
		print("Hue", Value)
	end,
})
SliderSection:AddSlider("DemoSliderDecimal", {
	Title = "Decimal",
	Description = "Rounding = 2, Width = 180",
	Default = 0.5,
	Min = 0,
	Max = 1,
	Rounding = 2,
	Width = 180,
})

local ChoiceSection = SubTabs.Inputs:AddSection("Segmented & Dropdown", { Icon = "lucide:chevrons-up-down" })

ChoiceSection:AddSegmented("DemoSegmented", {
	Title = "Segmented",
	Options = { "Low", "Medium", "High" },
	Default = "Medium",
	Callback = function(Value)
		print("Segmented:", Value)
	end,
})
ChoiceSection:AddSegmented("DemoSegmentedInline", {
	Title = "Segmented inline",
	Variant = "Inline",
	Height = 28,
	Options = { "A", "B", "C" },
	Default = "A",
})

ChoiceSection:AddDropdown("DemoDropdown", {
	Title = "Dropdown",
	Values = { "Alpha", "Beta", "Gamma", "Delta" },
	Default = 1,
	Callback = function(Value)
		print("Dropdown:", Value)
	end,
})
ChoiceSection:AddDropdown("DemoDropdownCompact", {
	Title = "Compact",
	Variant = "Compact",
	Values = { "One", "Two", "Three" },
	Default = 2,
})
ChoiceSection:AddDropdown("DemoDropdownSegmented", {
	Title = "Dropdown segmented",
	Variant = "Segmented",
	Values = { "Left", "Center", "Right" },
	Default = 1,
})
ChoiceSection:AddDropdown("DemoDropdownMulti", {
	Title = "Multi",
	Description = "Multi select, searchable, AllowNull.",
	Values = { "Apple", "Banana", "Cherry", "Durian", "Elderberry", "Fig" },
	Multi = true,
	Searchable = true,
	SearchPlaceholder = "Search fruit...",
	AllowNull = true,
	Default = { "Apple", "Cherry" },
	Width = 180,
	Callback = function(Value)
		print("Multi:", HttpService:JSONEncode(Value))
	end,
})
ChoiceSection:AddDropdown("DemoDropdownTags", {
	Title = "Dropdown with tags",
	Values = { "Stable", "Beta", "Nightly" },
	Default = 1,
	Tags = {
		Hot = { Text = "HOT", Color = Color3.fromRGB(239, 68, 68) },
		New = { Text = "NEW", Color = Color3.fromRGB(34, 197, 94) },
	},
	ItemTags = {
		Stable = "New",
		Nightly = { "Hot", "New" },
	},
})

local SortSection = SubTabs.Inputs:AddSection("Dropdown Sort Order", { Icon = "lucide:arrow-down-az" })

local SortValues = { "Mango", "Fig", "Apple", "Blueberry", "Kiwi", "Cherry", "Banana" }
local SortModes = { "Load", "Reverse", "Alphabetical", "AlphabeticalReverse", "Length", "Selected", "Relevance" }

local SortDropdown = SortSection:AddDropdown("DemoSortDropdown", {
	Title = "Sorted dropdown",
	Description = "SortOrder follows the mode picked below.",
	Values = SortValues,
	Searchable = true,
	Multi = true,
	AllowNull = true,
	SortOrder = "Alphabetical",
	Default = { "Kiwi" },
	Width = 180,
})

SortSection:AddDropdown("DemoSortMode", {
	Title = "Sort mode",
	Values = SortModes,
	Default = "Alphabetical",
	Width = 180,
	Callback = function(Value)
		SortDropdown:SetSortOrder(Value)
	end,
})

SortSection:AddDropdown("DemoSortFunction", {
	Title = "Custom sort function",
	Description = "SortOrder = function(A, B) returns true when A comes first.",
	Values = SortValues,
	SortOrder = function(A, B)
		return #A > #B
	end,
	Default = 1,
	Width = 180,
})

for _, Mode in { "Length", "Selected" } do
	SortSection:AddDropdown("DemoSort" .. Mode, {
		Title = "SortOrder = " .. Mode,
		Values = SortValues,
		SortOrder = Mode,
		Default = 1,
		Width = 180,
	})
end

local TextSection = SubTabs.Inputs:AddSection("Input & Keybind", { Icon = "lucide:keyboard" })

for _, Kind in { "Field", "Bordered", "Standard", "Inline", "Search", "PanelSearch" } do
	TextSection:AddInput("DemoInput" .. Kind, {
		Title = "Input " .. Kind,
		Variant = Kind,
		Default = "",
		Placeholder = Kind .. "...",
		Finished = false,
		Callback = function(Value)
			print(Kind, Value)
		end,
	})
end
TextSection:AddInput("DemoInputNumeric", {
	Title = "Numeric",
	Description = "Numeric = true, MaxLength = 6, Finished = true",
	Numeric = true,
	Finished = true,
	MaxLength = 6,
	Default = "100",
	Width = 140,
})

TextSection:AddKeybind("DemoKeybind", {
	Title = "Keybind",
	Default = "RightShift",
	Mode = "Toggle",
	Callback = function(Value)
		print("Keybind active:", Value)
	end,
	ChangedCallback = function(New)
		print("Keybind changed:", New)
	end,
})
TextSection:AddKeybind("DemoKeybindHold", { Title = "Hold mode", Variant = "Keycap", Default = "E", Mode = "Hold" })
TextSection:AddKeybind("DemoKeybindAlways", { Title = "Always mode", Variant = "Chip", Default = "Q", Mode = "Always" })

local ColorSection = SubTabs.Selection:AddSection("Colorpicker & Swatches", { Icon = "lucide:pipette" })

local PickerVariants = {
	{ "Field", "Chromium" },
	{ "Swatch", "Fluent" },
	{ "Bar", "Wheel" },
	{ "Hex", "Chromium" },
}
for _, Entry in PickerVariants do
	ColorSection:AddColorpicker("DemoColor" .. Entry[1], {
		Title = "Colorpicker " .. Entry[1],
		Description = "PickerStyle = " .. Entry[2],
		Variant = Entry[1],
		PickerStyle = Entry[2],
		Default = Color3.fromRGB(88, 101, 242),
		Transparency = 0,
		Callback = function(Value)
			print(Entry[1], Value)
		end,
	})
end

local CheckSection = SubTabs.Selection:AddSection("CheckGroup", { Icon = "lucide:check-square" })

CheckSection:AddCheckGroup("DemoCheckGroup", {
	Title = "CheckGroup",
	Options = { "ESP", "Aimbot", "Fly", "Noclip" },
	Default = { ESP = true },
	Callback = function(Value)
		print("CheckGroup:", HttpService:JSONEncode(Value))
	end,
})
CheckSection:AddCheckGroup("DemoCheckGroupSimplefield", {
	Title = "CheckGroup (Simplefield)",
	Variant = "Simplefield",
	Options = { "Health", "Distance", "Weapon" },
	Default = { Health = true },
})
CheckSection:AddCheckGroup("DemoCheckGroupSwitch", {
	Title = "CheckGroup (Switch)",
	Variant = "Switch",
	Options = { "Chams", "Tracers", "Names" },
	Default = { Names = true },
})

local ProgressSection = SubTabs.Selection:AddSection("Progress", { Icon = "gloam:tabler:progress" })

local DemoProgress = ProgressSection:AddProgress({
	Title = "Progress (Row)",
	Value = 35,
	Min = 0,
	Max = 100,
	Suffix = "%",
})
ProgressSection:AddProgress({ Title = "Progress (Thin)", Variant = "Thin", Value = 60 })
ProgressSection:AddProgress({ Title = "Progress (Inline)", Variant = "Inline", Value = 80, Width = 170 })
local IndeterminateProgress = ProgressSection:AddProgress({ Title = "Indeterminate", Indeterminate = true })

ProgressSection:AddButton({
	Title = "Animate progress",
	Variant = "Primary",
	ButtonText = "Run",
	Callback = function()
		task.spawn(function()
			IndeterminateProgress:SetIndeterminate(true)
			for Step = 0, 100, 5 do
				DemoProgress:SetValue(Step)
				task.wait(0.05)
			end
			IndeterminateProgress:SetIndeterminate(false)
			IndeterminateProgress:SetValue(100)
		end)
	end,
})

local ViewportSection = SubTabs.Display:AddSection("Viewport", { Icon = "gloam:tabler:3d-cube-sphere" })

local PreviewModel = Instance.new("Part")
PreviewModel.Name = "PreviewPart"
PreviewModel.Size = Vector3.new(4, 4, 4)
PreviewModel.Color = Color3.fromRGB(88, 101, 242)
PreviewModel.Material = Enum.Material.SmoothPlastic
PreviewModel.Anchored = true

local DemoViewport = ViewportSection:AddViewport("DemoViewport", {
	Title = "Viewport",
	Object = PreviewModel,
	Clone = true,
	Height = 220,
	Interactive = true,
	Focused = true,
	AutoRotate = true,
	AutoRotateSpeed = 0.5,
	Smooth = true,
	Inertia = true,
	ZoomingSlider = true,
	Ambient = Color3.fromRGB(120, 120, 140),
	LightColor = Color3.fromRGB(255, 255, 255),
	LightDirection = Vector3.new(-1, -1, -1),
	BackgroundColor = Color3.fromRGB(20, 20, 26),
})

ViewportSection:AddToggle("DemoViewportRotate", {
	Title = "Auto rotate",
	Default = true,
	Callback = function(Value)
		DemoViewport:SetAutoRotate(Value, 0.5)
	end,
})
ViewportSection:AddButton({
	Title = "Reset camera",
	Variant = "Tonal",
	ButtonText = "Reset",
	Callback = function()
		DemoViewport:Reset()
	end,
})

local NotifySection = SubTabs.Overlays:AddSection("Notify & Toast", { Icon = "gloam:tabler:bell-ringing" })

for _, Kind in { "Info", "Success", "Warning", "Error" } do
	NotifySection:AddButton({
		Title = "Notify " .. Kind,
		Variant = "Tonal",
		ButtonText = "Show",
		Callback = function()
			Library:Notify({
				Title = Kind,
				Content = "This is a " .. string.lower(Kind) .. " notification.",
				SubContent = "SubContent line",
				Type = Kind,
				Duration = 4,
			})
		end,
	})
end

NotifySection:AddButton({
	Title = "Notify with buttons",
	Description = "Buttons row with Tonal and Accent variants.",
	Variant = "Tonal",
	ButtonText = "Show",
	Callback = function()
		Library:Notify({
			Title = "Notification",
			Content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ullamcorper sagittis leo at vulputate.",
			Icon = "gloam:tabler:book-2",
			Color = Color3.fromRGB(99, 91, 240),
			Duration = 10,
			Buttons = {
				{
					Title = "Button",
					Variant = "Tonal",
					Callback = function()
						Library:Toast("Tonal pressed", 2)
					end,
				},
				{
					Title = "Button",
					Variant = "Accent",
					Callback = function()
						Library:Toast("Accent pressed", 2)
					end,
				},
			},
		})
	end,
})

NotifySection:AddButton({
	Title = "Notify custom button colors",
	Description = "Each button uses its own Color.",
	Variant = "Tonal",
	ButtonText = "Show",
	Callback = function()
		Library:Notify({
			Title = "Custom colors",
			Content = "Buttons can use any color.",
			SubContent = "Keep = true leaves the notification open.",
			Icon = "gloam:tabler:mood-smile",
			Color = Color3.fromRGB(76, 190, 99),
			Duration = 12,
			Buttons = {
				{ Title = "Neutral", Keep = true },
				{ Title = "Warn", Color = Color3.fromRGB(250, 204, 70), Keep = true },
				{ Title = "Okay", Color = Color3.fromRGB(76, 190, 99) },
			},
		})
	end,
})

NotifySection:AddButton({
	Title = "Notify progress colors",
	Description = "Stacked notifications with different bar colors.",
	Variant = "Tonal",
	ButtonText = "Show",
	Callback = function()
		local Palette = {
			Color3.fromRGB(99, 91, 240),
			Color3.fromRGB(239, 68, 68),
			Color3.fromRGB(252, 211, 77),
		}

		for Index, Tint in Palette do
			Library:Notify({
				Title = "Notification",
				Content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
				Icon = "gloam:tabler:book-2",
				Color = Tint,
				Duration = 5 + Index * 3,
			})
		end
	end,
})

NotifySection:AddButton({
	Title = "Notify with action buttons",
	Description = "Action buttons appear left of the close button.",
	Variant = "Tonal",
	ButtonText = "Show",
	Callback = function()
		local Notice

		Notice = Library:Notify({
			Title = "Action buttons",
			Content = "Copy, pin and mute actions next to the close button.",
			Icon = "hero:bell",
			Type = "Info",
			Duration = 15,
			Actions = {
				{
					Icon = "hero:clipboard-document",
					Callback = function()
						if setclipboard then
							setclipboard("Action buttons")
						end
						Library:Toast("Copied", 2)
					end,
				},
				{
					Icon = "gloam:tabler:pin",
					Toggle = true,
					Default = false,
					Callback = function(Value)
						Library:Toast(Value and "Pinned" or "Unpinned", 2)
					end,
				},
				{
					Icon = "hero:bell-slash",
					Color = Color3.fromRGB(239, 68, 68),
					Close = true,
					Callback = function()
						Library:Toast("Muted", 2)
					end,
				},
			},
		})
	end,
})

NotifySection:AddButton({
	Title = "Notify full",
	Description = "Buttons, action buttons and progress together.",
	Variant = "Tonal",
	ButtonText = "Show",
	Callback = function()
		local Notice = Library:Notify({
			Title = "Update available",
			Content = "A new version is ready to install.",
			SubContent = "Version 2.0",
			Icon = "hero:arrow-down-tray",
			Color = Color3.fromRGB(10, 132, 255),
			Duration = 20,
			Actions = {
				{
					Icon = "hero:arrow-path",
					Callback = function(Self)
						Self:SetContent("Checked again just now.")
					end,
				},
			},
			Buttons = {
				{ Title = "Later" },
				{
					Title = "Install",
					Callback = function()
						Library:Toast("Installing", 2)
					end,
				},
			},
		})
	end,
})

NotifySection:AddButton({
	Title = "Toast",
	Variant = "Tonal",
	ButtonText = "Show",
	Callback = function()
		Library:Toast({
			Text = "Saved successfully",
			Duration = 3,
			Action = {
				Title = "Undo",
				Callback = function()
					print("Undo")
				end,
			},
		})
	end,
})

local DialogSection = SubTabs.Overlays:AddSection("Dialog, Modal & Menu", { Icon = "lucide:layout" })

DialogSection:AddButton({
	Title = "Dialog",
	Description = "Window:Dialog with buttons.",
	Callback = function()
		Window:Dialog({
			Title = "Confirm",
			Content = "Are you sure you want to continue?",
			Buttons = {
				{ Title = "Confirm", Variant = "Primary", Callback = function() print("Confirmed") end },
				{ Title = "Cancel", Callback = function() print("Cancelled") end },
			},
		})
	end,
})

DialogSection:AddButton({
	Title = "Dialog without blur",
	Description = "Window:Dialog with DoNotBlur = true.",
	Callback = function()
		Window:Dialog({
			Title = "No Blur",
			Content = "The background behind this dialog is not blurred.",
			DoNotBlur = true,
			Buttons = {
				{ Title = "Okay", Variant = "Primary" },
				{ Title = "Cancel" },
			},
		})
	end,
})

DialogSection:AddButton({
	Title = "Dialog with bars",
	Description = "Dialog with progress bars (SetBar).",
	Callback = function()
		local Dialog = Window:Dialog({
			Title = "Downloading",
			Content = "Please wait...",
			Bars = {
				{ Title = "Assets", Value = "0%" },
				{ Title = "Scripts", Value = "0%" },
			},
			Buttons = { { Title = "Close" } },
		})
		task.spawn(function()
			for Step = 0, 100, 10 do
				Dialog:SetBar(1, Step / 100, Step .. "%")
				Dialog:SetBar(2, math.min(1, Step / 80), math.min(100, math.floor(Step / 0.8)) .. "%")
				task.wait(0.15)
			end
		end)
	end,
})

DialogSection:AddButton({
	Title = "Paged dialog",
	Description = "Window:PagedDialog with headings and code blocks.",
	Callback = function()
		Window:PagedDialog({
			Title = "Getting started",
			Pages = {
				{
					Title = "Welcome",
					Blocks = {
						"Paged dialogs walk the user through steps.",
						{ Heading = "Tip" },
						"Use Next and Back to navigate.",
					},
				},
				{
					Title = "Example",
					Blocks = {
						"Copy this snippet:",
						{ Code = 'print("Hello, Fluent")' },
					},
				},
			},
			OnClose = function()
				print("Paged dialog closed")
			end,
		})
	end,
})

DialogSection:AddButton({
	Title = "Modal",
	Description = "Window:Modal with its own section and elements.",
	Callback = function()
		local Modal
		Modal = Window:Modal({
			Title = "Quick settings",
			Content = "Modal with form elements.",
			Closable = true,
			Dismissable = true,
			Build = function(Self)
				local Section = Self:AddSection("Options")
				Section:AddToggle("ModalToggle", { Title = "Enable feature", Default = true })
				Section:AddInput("ModalInput", { Title = "Name", Default = "", Placeholder = "Type here..." })
			end,
			Buttons = {
				{
					Title = "Apply",
					Variant = "Primary",
					Callback = function()
						print(HttpService:JSONEncode(Modal:GetValues()))
					end,
				},
				{ Title = "Cancel" },
			},
			OnClose = function()
				print("Modal closed")
			end,
		})
	end,
})

DialogSection:AddButton({
	Title = "Menu",
	Description = "Window:Menu opened from a button.",
	Variant = "Tonal",
	ButtonText = "Open",
	Menu = ContextMenu,
	MenuPlacement = "BottomRight",
	Callback = function() end,
})

SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:BuildConfigSection(SubTabs.Config)
SaveManager:SetFolder("Fluent Reimagined/Configs")

InterfaceManager:SetLibrary(Library)
InterfaceManager:SetFolder("Fluent Reimagined")
InterfaceManager:BuildInterfaceSection(SubTabs.Appearance)

Window:SelectTab(SubTabs.Buttons)

BuildElementPopUp = function()
	ElementPopUp = Library:CreatePopUp({
		Title = "Elements",
		Subtitle = "PopUp Test",
		Icon = "lucide:component",
		Size = Vector2.new(580, 420),
		MinSize = Vector2.new(420, 260),
		MaximizeSize = Vector2.new(860, 640),
		ResizeAble = true,
		SidebarTitle = "Elements",
	})

	local InputTab = ElementPopUp:AddTab({ Title = "Inputs", Icon = "lucide:text-cursor-input" })
	local ChoiceTab = ElementPopUp:AddTab({ Title = "Choices", Icon = "lucide:list-checks" })
	local InfoTab = ElementPopUp:AddTab({ Title = "Info", Icon = "hero:information-circle" })

	local ValueSection = InputTab:AddSection("Values", { Icon = "hero:adjustments-horizontal" })
	ValueSection:AddSlider("PopUpSliderPercent", {
		Title = "Slider",
		Description = "Default variant",
		Default = 50,
		Min = 0,
		Max = 100,
		Rounding = 0,
		Suffix = "%",
		Callback = function(Value)
			print("PopUp Slider", Value)
		end,
	})
	ValueSection:AddSlider("PopUpSliderHue", {
		Title = "Hue",
		Variant = "Hue",
		Default = 120,
		Callback = function(Value)
			print("PopUp Hue", Value)
		end,
	})
	ValueSection:AddSlider("PopUpSliderDecimal", {
		Title = "Decimal",
		Default = 0.5,
		Min = 0,
		Max = 1,
		Rounding = 2,
	})

	local TextSection = InputTab:AddSection("Text & Keys", { Icon = "lucide:keyboard" })
	TextSection:AddInput("PopUpInput", {
		Title = "Input",
		Default = "",
		Placeholder = "Type here...",
		Finished = false,
		Callback = function(Value)
			print("PopUp Input", Value)
		end,
	})
	TextSection:AddInput("PopUpInputNumeric", {
		Title = "Numeric",
		Numeric = true,
		Finished = true,
		MaxLength = 6,
		Default = "100",
		Width = 140,
	})
	TextSection:AddKeybind("PopUpKeybind", {
		Title = "Keybind",
		Default = "RightShift",
		Mode = "Toggle",
		Callback = function(Value)
			print("PopUp Keybind", Value)
		end,
	})
	TextSection:AddKeybind("PopUpKeybindHold", { Title = "Hold mode", Variant = "Keycap", Default = "E", Mode = "Hold" })

	local DropdownSection = ChoiceTab:AddSection("Dropdown", { Icon = "lucide:chevrons-up-down" })
	DropdownSection:AddDropdown("PopUpDropdown", {
		Title = "Dropdown",
		Values = { "Alpha", "Beta", "Gamma", "Delta" },
		Default = 1,
		Callback = function(Value)
			print("PopUp Dropdown", Value)
		end,
	})
	DropdownSection:AddDropdown("PopUpDropdownSegmented", {
		Title = "Segmented",
		Variant = "Segmented",
		Values = { "Left", "Center", "Right" },
		Default = 1,
	})
	DropdownSection:AddDropdown("PopUpDropdownMulti", {
		Title = "Multi",
		Values = { "Apple", "Banana", "Cherry", "Durian", "Elderberry", "Fig" },
		Multi = true,
		Searchable = true,
		AllowNull = true,
		Default = { "Apple", "Cherry" },
		Width = 180,
		Callback = function(Value)
			print("PopUp Multi", HttpService:JSONEncode(Value))
		end,
	})

	local ColorSection = ChoiceTab:AddSection("Colorpicker", { Icon = "lucide:pipette" })
	ColorSection:AddColorpicker("PopUpColorField", {
		Title = "Field",
		Variant = "Field",
		PickerStyle = "Chromium",
		Default = Color3.fromRGB(88, 101, 242),
		Transparency = 0,
		Callback = function(Value)
			print("PopUp Color", Value)
		end,
	})
	ColorSection:AddColorpicker("PopUpColorSwatch", {
		Title = "Swatch",
		Variant = "Swatch",
		PickerStyle = "Fluent",
		Default = Color3.fromRGB(34, 197, 94),
		Transparency = 0,
	})

	local InfoSection = InfoTab:AddSection("Info", { Icon = "hero:information-circle" })
	InfoSection:AddParagraph({ Title = "Note", Content = "Note variant inside a PopUp.", Variant = "Note" })
	InfoSection:AddParagraph({ Title = "Warning", Content = "Warning variant inside a PopUp.", Variant = "Warning" })
	InfoSection:AddParagraph({ Title = "Success", Content = "Success variant inside a PopUp.", Variant = "Success" })
	InfoSection:AddButton({
		Title = "Toast",
		Description = "Button inside the Elements PopUp.",
		Icon = "hero:bell",
		ButtonText = "Show",
		Callback = function()
			Library:Toast("Hello from PopUp", 2)
		end,
	})
end


Library:Notify({
	Title = "Fluent Reimagined",
	Content = "All Things loaded.",
	Duration = 4,
})

SaveManager:LoadAutoloadConfig()

-- Ignore this shit
local SerpentAsset = "rbxassetid://75930056598380"
local EyeAsset = "rbxassetid://71720413139220"
local SoundIds = { "7127123605", "137566474343039", "438666542", "257001341", "257000833", "7127123554", "131607746976396", "97325669841459", "109312518223078" }

local function ToColor(Value)
    if typeof(Value) == "ColorSequence" then
        return Value.Keypoints[1].Value
    end
    return Value
end

local function ButtonGradient()
    local Theme = Library:GetThemeData(Library.Theme)
    local Main = ToColor(Theme.AcrylicMain)
    local Border = ToColor(Theme.AcrylicBorder)
    local Background = Theme.AcrylicGradient
    if typeof(Background) ~= "ColorSequence" then
        Background = ColorSequence.new(Main)
    end
    local Keypoints = Background.Keypoints
    local StartColor = Keypoints[1].Value
    local EndColor = Keypoints[#Keypoints].Value
    local Stroke = ColorSequence.new({
        ColorSequenceKeypoint.new(0, StartColor),
        ColorSequenceKeypoint.new(0.33, EndColor),
        ColorSequenceKeypoint.new(0.66, Border),
        ColorSequenceKeypoint.new(1, StartColor),
    })
    return { Background = Background, Stroke = Stroke }
end

local function GetEyeColor(Data)
    local Best, BestScore = Color3.new(1, 1, 1), -1
    for _, Sequence in ipairs({ Data.Background, Data.Stroke }) do
        for _, Key in ipairs(Sequence.Keypoints) do
            local Color = Key.Value
            local Max = math.max(Color.R, Color.G, Color.B)
            local Min = math.min(Color.R, Color.G, Color.B)
            local Saturation = Max > 0 and (Max - Min) / Max or 0
            local Score = Max * (0.4 + Saturation)
            if Score > BestScore then
                Best, BestScore = Color, Score
            end
        end
    end
    return Best
end

local function MakeDraggable(TopBarObject, Object, Locked)
    local Dragging = false
    local DragInput
    local DragStart
    local StartPosition
    local Holding = false
    local HoldTime = 1
    local MoveCancelThreshold = 6
    local HoldToken = 0

    Object:SetAttribute("Locked", Locked or false)

    local function Update(Input)
        if Object:GetAttribute("Locked") then
            return
        end
        local Delta = Input.Position - DragStart
        if Delta.Magnitude > MoveCancelThreshold then
            Object:SetAttribute("Dragged", true)
        end
        Object.Position = UDim2.new(
            StartPosition.X.Scale,
            StartPosition.X.Offset + Delta.X,
            StartPosition.Y.Scale,
            StartPosition.Y.Offset + Delta.Y
        )
    end

    local function ToggleLock()
        local NewState = not Object:GetAttribute("Locked")
        Object:SetAttribute("Locked", NewState)
        Object:SetAttribute("Dragged", true)
        Dragging = false
        Library:Notify({
            Title = NewState and "Button Locked" or "Button Unlocked",
            Content = NewState and "This button is now locked in place." or "This button can now be moved.",
            Duration = 2,
        })
    end

    TopBarObject.InputBegan:Connect(function(Input)
        if Input.UserInputType ~= Enum.UserInputType.MouseButton1 and Input.UserInputType ~= Enum.UserInputType.Touch then
            return
        end

        Dragging = not Object:GetAttribute("Locked")
        Holding = true
        DragStart = Input.Position
        StartPosition = Object.Position
        Object:SetAttribute("Dragged", false)

        HoldToken += 1
        local Token = HoldToken

        task.delay(HoldTime, function()
            if Holding and Token == HoldToken then
                ToggleLock()
            end
        end)

        Input.Changed:Connect(function()
            if Input.UserInputState == Enum.UserInputState.End then
                Dragging = false
                Holding = false
            end
        end)
    end)

    TopBarObject.InputChanged:Connect(function(Input)
        if not DragStart then
            return
        end
        if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
            if (Input.Position - DragStart).Magnitude > MoveCancelThreshold then
                Holding = false
            end
            DragInput = Input
        end
    end)

    return UserInputService.InputChanged:Connect(function(Input)
        if Input == DragInput and Dragging then
            Update(Input)
        end
    end)
end

local OpenGui = Instance.new("ScreenGui")
OpenGui.Name = "openshit"
OpenGui.Parent = LocalPlayer.PlayerGui
OpenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
OpenGui.ResetOnSpawn = false

local OpenButton = Instance.new("TextButton")
OpenButton.Name = "mainopen"
OpenButton.Parent = OpenGui
OpenButton.BackgroundTransparency = 1
OpenButton.Position = UDim2.new(0.101969875, 0, 0.110441767, 0)
OpenButton.Size = UDim2.new(0, 64, 0, 42)
OpenButton.Text = ""
OpenButton.Visible = true

local BackgroundImage = Instance.new("ImageLabel")
BackgroundImage.Name = "RotatingBackground"
BackgroundImage.Parent = OpenButton
BackgroundImage.Size = UDim2.new(2.3, 0, 2.3, 0)
BackgroundImage.Position = UDim2.new(0.5, 0, 0.5, 0)
BackgroundImage.AnchorPoint = Vector2.new(0.5, 0.5)
BackgroundImage.BackgroundTransparency = 1
BackgroundImage.Image = SerpentAsset
BackgroundImage.SizeConstraint = Enum.SizeConstraint.RelativeXX
BackgroundImage.ZIndex = 0

local SerpentGradient = Instance.new("UIGradient")
SerpentGradient.Parent = BackgroundImage

local FrontImage = Instance.new("ImageLabel")
FrontImage.Name = "StaticIcon"
FrontImage.Parent = OpenButton
FrontImage.Size = UDim2.new(0.85, 0, 1, 0)
FrontImage.Position = UDim2.new(0.5, 0, 0.5, 0)
FrontImage.AnchorPoint = Vector2.new(0.5, 0.5)
FrontImage.BackgroundTransparency = 1
FrontImage.Image = EyeAsset
FrontImage.ZIndex = 1
FrontImage.ScaleType = Enum.ScaleType.Stretch

local FrontImageCorner = Instance.new("UICorner")
FrontImageCorner.CornerRadius = UDim.new(1, 0)
FrontImageCorner.Parent = FrontImage

local function RefreshColors()
    local Data = ButtonGradient()
    SerpentGradient.Color = Data.Stroke
    FrontImage.ImageColor3 = GetEyeColor(Data)
end

RefreshColors()

local ThemeConnection = Library.ThemeChanged:Connect(RefreshColors)

local Rotation = 0
local Speed = 90
local SpinToken = 0

local OpenConnection = RunService.Heartbeat:Connect(function(Delta)
    Rotation = (Rotation + Speed * Delta) % 360
    BackgroundImage.Rotation = Rotation

    SerpentGradient.Rotation = (SerpentGradient.Rotation + 60 * Delta) % 360
end)

local DragConnection = MakeDraggable(OpenButton, OpenButton, false)

local function PlaySound(SoundId)
    local Sound = Instance.new("Sound")
    Sound.SoundId = "rbxassetid://" .. SoundId
    Sound.Parent = SoundService
    Sound:Play()
    Sound.Ended:Connect(function()
        Sound:Destroy()
    end)
end

local function SpinBurst()
    SpinToken += 1
    local Token = SpinToken

    local function SmoothSpeed(Target, Duration)
        local Start = Speed
        local Steps = 30
        for Index = 1, Steps do
            if Token ~= SpinToken then
                return false
            end
            Speed = Start + (Target - Start) * (Index / Steps)
            task.wait(Duration / Steps)
        end
        Speed = Target
        return true
    end

    if not SmoothSpeed(360, 0.4) then
        return
    end
    task.wait(0.5)
    if not SmoothSpeed(180, 0.4) then
        return
    end
    task.wait(0.3)
    SmoothSpeed(90, 0.4)
end

OpenButton.MouseButton1Click:Connect(function()
    if OpenButton:GetAttribute("Dragged") then
        return
    end
    PlaySound(SoundIds[math.random(#SoundIds)])
    Window:Minimize()
    task.spawn(SpinBurst)
end)

Library.Events.Unloading:Connect(function()
    ThemeConnection:Disconnect()
    OpenConnection:Disconnect()
    DragConnection:Disconnect()
    OpenGui:Destroy()
end)
