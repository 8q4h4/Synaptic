return function(context)
	-- Gui to Lua
	-- Version: 3.2

	-- Instances:

	local MainUI = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local Title = Instance.new("TextLabel")
	local CloseButton = Instance.new("TextButton")
	local MinimizeButton = Instance.new("TextButton")
	local Status = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Containers = Instance.new("Frame")
	local Executor = Instance.new("Frame")
	local TabContainer = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	local NewTab = Instance.new("TextButton")
	local BottomBar = Instance.new("Frame")
	local ExecuteButton = Instance.new("TextButton")
	local UICorner_2 = Instance.new("UICorner")
	local Icon_2 = Instance.new("ImageLabel")
	local AttachButton = Instance.new("TextButton")
	local UICorner_3 = Instance.new("UICorner")
	local Icon_3 = Instance.new("ImageLabel")
	local ClearButton = Instance.new("TextButton")
	local UICorner_4 = Instance.new("UICorner")
	local Icon_4 = Instance.new("ImageLabel")
	local Console = Instance.new("ImageButton")
	local BottomLine = Instance.new("Frame")
	local ScriptHub = Instance.new("Frame")
	local SHLine = Instance.new("Frame")
	local ScriptContainer = Instance.new("ScrollingFrame")
	local UIListLayout_2 = Instance.new("UIListLayout")
	local TopLine = Instance.new("Frame")
	local TabLine = Instance.new("Frame")
	local Main_2 = Instance.new("Frame")
	local LoadingScreen = Instance.new("ImageLabel")
	local Logo = Instance.new("TextLabel")
	local LoadingStatus = Instance.new("TextLabel")

	--Properties:

	MainUI.Name = "MainUI"
	MainUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

	Main.Name = "Main"
	Main.Parent = MainUI
	Main.Active = true
	Main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Main.BorderSizePixel = 0
	Main.ClipsDescendants = true
	Main.Position = UDim2.new(0.240717009, 0, 0.108771928, 0)
	Main.Size = UDim2.new(0, 700, 0, 440)

	Title.Name = "Title"
	Title.Parent = Main
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(-0.000181012831, 0, -0.00219296548, 0)
	Title.Size = UDim2.new(0, 700, 0, 25)
	Title.Font = Enum.Font.ArimoBold
	Title.Text = "Synaptic v0.1.0"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 14.000

	CloseButton.Name = "CloseButton"
	CloseButton.Parent = Title
	CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CloseButton.BackgroundTransparency = 1.000
	CloseButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CloseButton.BorderSizePixel = 0
	CloseButton.Position = UDim2.new(0.962857127, 0, 0.0385961905, 0)
	CloseButton.Size = UDim2.new(0, 25, 0, 25)
	CloseButton.ZIndex = 2
	CloseButton.Font = Enum.Font.ArimoBold
	CloseButton.Text = "X"
	CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	CloseButton.TextSize = 14.000

	MinimizeButton.Name = "MinimizeButton"
	MinimizeButton.Parent = Title
	MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MinimizeButton.BackgroundTransparency = 1.000
	MinimizeButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MinimizeButton.BorderSizePixel = 0
	MinimizeButton.Position = UDim2.new(0.927142859, 0, 0.0385961905, 0)
	MinimizeButton.Size = UDim2.new(0, 25, 0, 25)
	MinimizeButton.ZIndex = 2
	MinimizeButton.Font = Enum.Font.Arial
	MinimizeButton.Text = "_"
	MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	MinimizeButton.TextSize = 14.000
	MinimizeButton.TextYAlignment = Enum.TextYAlignment.Top

	Status.Name = "Status"
	Status.Parent = Title
	Status.BackgroundColor3 = Color3.fromRGB(255, 89, 89)
	Status.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Status.BorderSizePixel = 0
	Status.Position = UDim2.new(0.00999999978, 0, 0.319999993, 0)
	Status.Size = UDim2.new(0, 10, 0, 10)

	UICorner.CornerRadius = UDim.new(1, 0)
	UICorner.Parent = Status

	Containers.Name = "Containers"
	Containers.Parent = Main
	Containers.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Containers.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Containers.BorderSizePixel = 0
	Containers.Position = UDim2.new(0, 0, 0.0545454547, 0)
	Containers.Size = UDim2.new(0, 700, 0, 416)

	Executor.Name = "Executor"
	Executor.Parent = Containers
	Executor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Executor.BackgroundTransparency = 1.000
	Executor.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Executor.BorderSizePixel = 0
	Executor.Size = UDim2.new(0, 699, 0, 416)

	TabContainer.Name = "TabContainer"
	TabContainer.Parent = Executor
	TabContainer.Active = true
	TabContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	TabContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabContainer.BorderSizePixel = 0
	TabContainer.Size = UDim2.new(0, 699, 0, 25)
	TabContainer.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	TabContainer.CanvasSize = UDim2.new(1, 0, 0, 0)
	TabContainer.ScrollBarThickness = 2
	TabContainer.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

	UIListLayout.Parent = TabContainer
	UIListLayout.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

	NewTab.Name = "NewTab"
	NewTab.Parent = TabContainer
	NewTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NewTab.BackgroundTransparency = 1.000
	NewTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
	NewTab.BorderSizePixel = 0
	NewTab.LayoutOrder = 1000
	NewTab.Position = UDim2.new(0.357653797, 0, 0, 0)
	NewTab.Size = UDim2.new(0, 25, 0, 25)
	NewTab.Font = Enum.Font.ArimoBold
	NewTab.Text = "+"
	NewTab.TextColor3 = Color3.fromRGB(255, 255, 255)
	NewTab.TextSize = 14.000

	BottomBar.Name = "BottomBar"
	BottomBar.Parent = Executor
	BottomBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	BottomBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	BottomBar.BorderSizePixel = 0
	BottomBar.Position = UDim2.new(0, 0, 0.927884638, 0)
	BottomBar.Size = UDim2.new(1.00143063, 0, 0.0120192356, 25)

	ExecuteButton.Name = "ExecuteButton"
	ExecuteButton.Parent = BottomBar
	ExecuteButton.BackgroundColor3 = Color3.fromRGB(125, 125, 125)
	ExecuteButton.BackgroundTransparency = 0.800
	ExecuteButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ExecuteButton.BorderSizePixel = 0
	ExecuteButton.Position = UDim2.new(0.465000004, 0, 0.133000001, 0)
	ExecuteButton.Size = UDim2.new(0, 120, 0, 22)
	ExecuteButton.Font = Enum.Font.ArimoBold
	ExecuteButton.Text = "Execute"
	ExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	ExecuteButton.TextSize = 14.000

	UICorner_2.CornerRadius = UDim.new(0, 4)
	UICorner_2.Parent = ExecuteButton

	Icon_2.Name = "Icon"
	Icon_2.Parent = ExecuteButton
	Icon_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Icon_2.BackgroundTransparency = 1.000
	Icon_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Icon_2.BorderSizePixel = 0
	Icon_2.Position = UDim2.new(0.0250000004, 0, 0.136000007, 0)
	Icon_2.Size = UDim2.new(0, 15, 0, 15)
	Icon_2.Image = "rbxassetid://7072720722"

	AttachButton.Name = "AttachButton"
	AttachButton.Parent = BottomBar
	AttachButton.BackgroundColor3 = Color3.fromRGB(125, 125, 125)
	AttachButton.BackgroundTransparency = 0.800
	AttachButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	AttachButton.BorderSizePixel = 0
	AttachButton.Position = UDim2.new(0.823000014, 0, 0.133000001, 0)
	AttachButton.Size = UDim2.new(0, 120, 0, 22)
	AttachButton.Font = Enum.Font.ArimoBold
	AttachButton.Text = "Attach"
	AttachButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	AttachButton.TextSize = 14.000

	UICorner_3.CornerRadius = UDim.new(0, 4)
	UICorner_3.Parent = AttachButton

	Icon_3.Name = "Icon"
	Icon_3.Parent = AttachButton
	Icon_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Icon_3.BackgroundTransparency = 1.000
	Icon_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Icon_3.BorderSizePixel = 0
	Icon_3.Position = UDim2.new(0.0250000004, 0, 0.136000007, 0)
	Icon_3.Size = UDim2.new(0, 15, 0, 15)
	Icon_3.Image = "rbxassetid://7072718226"

	ClearButton.Name = "ClearButton"
	ClearButton.Parent = BottomBar
	ClearButton.BackgroundColor3 = Color3.fromRGB(125, 125, 125)
	ClearButton.BackgroundTransparency = 0.800
	ClearButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ClearButton.BorderSizePixel = 0
	ClearButton.Position = UDim2.new(0.644428611, 0, 0.132999659, 0)
	ClearButton.Size = UDim2.new(0, 120, 0, 22)
	ClearButton.Font = Enum.Font.ArimoBold
	ClearButton.Text = "Clear"
	ClearButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	ClearButton.TextSize = 14.000

	UICorner_4.CornerRadius = UDim.new(0, 4)
	UICorner_4.Parent = ClearButton

	Icon_4.Name = "Icon"
	Icon_4.Parent = ClearButton
	Icon_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Icon_4.BackgroundTransparency = 1.000
	Icon_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Icon_4.BorderSizePixel = 0
	Icon_4.Position = UDim2.new(0.0250000004, 0, 0.136000007, 0)
	Icon_4.Size = UDim2.new(0, 15, 0, 15)
	Icon_4.Image = "rbxassetid://7072723727"

	Console.Name = "Console"
	Console.Parent = BottomBar
	Console.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Console.BackgroundTransparency = 1.000
	Console.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Console.BorderSizePixel = 0
	Console.Position = UDim2.new(0.00428571412, 0, 0.132999659, 0)
	Console.Size = UDim2.new(0, 22, 0, 22)
	Console.Image = "rbxassetid://7072723337"

	BottomLine.Name = "BottomLine"
	BottomLine.Parent = BottomBar
	BottomLine.BackgroundColor3 = Color3.fromRGB(145, 145, 145)
	BottomLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
	BottomLine.BorderSizePixel = 0
	BottomLine.Size = UDim2.new(1, 0, 0, 1)

	ScriptHub.Name = "ScriptHub"
	ScriptHub.Parent = Executor
	ScriptHub.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	ScriptHub.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ScriptHub.BorderSizePixel = 0
	ScriptHub.Position = UDim2.new(0.807010174, 0, 0.0600961521, 0)
	ScriptHub.Size = UDim2.new(0, 135, 0, 361)

	SHLine.Name = "SHLine"
	SHLine.Parent = ScriptHub
	SHLine.BackgroundColor3 = Color3.fromRGB(145, 145, 145)
	SHLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SHLine.BorderSizePixel = 0
	SHLine.Position = UDim2.new(0.00899999961, 0, 0, 0)
	SHLine.Size = UDim2.new(0, 1, 1, 0)

	ScriptContainer.Name = "ScriptContainer"
	ScriptContainer.Parent = ScriptHub
	ScriptContainer.Active = true
	ScriptContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScriptContainer.BackgroundTransparency = 1.000
	ScriptContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ScriptContainer.BorderSizePixel = 0
	ScriptContainer.Position = UDim2.new(0.0370370373, 0, 0.0193905812, 0)
	ScriptContainer.Size = UDim2.new(0, 130, 0, 354)
	ScriptContainer.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	ScriptContainer.CanvasSize = UDim2.new(0, 0, 0.949999988, 0)
	ScriptContainer.ScrollBarThickness = 1
	ScriptContainer.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

	UIListLayout_2.Parent = ScriptContainer
	UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

	TopLine.Name = "TopLine"
	TopLine.Parent = Executor
	TopLine.BackgroundColor3 = Color3.fromRGB(145, 145, 145)
	TopLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TopLine.BorderSizePixel = 0
	TopLine.Size = UDim2.new(1, 0, 0, 1)

	TabLine.Name = "TabLine"
	TabLine.Parent = Executor
	TabLine.BackgroundColor3 = Color3.fromRGB(145, 145, 145)
	TabLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabLine.BorderSizePixel = 0
	TabLine.Position = UDim2.new(-0.0014306152, 0, 0.0600961521, 0)
	TabLine.Size = UDim2.new(1, 0, 0, 1)

	Main_2.Name = "Main"
	Main_2.Parent = Executor
	Main_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Main_2.BackgroundTransparency = 1.000
	Main_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Main_2.BorderSizePixel = 0
	Main_2.Position = UDim2.new(-0.000283957546, 0, 0.0620783307, 0)
	Main_2.Size = UDim2.new(0, 564, 0, 360)

	LoadingScreen.Name = "LoadingScreen"
	LoadingScreen.Parent = Main
	LoadingScreen.Transparency = 1
	LoadingScreen.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LoadingScreen.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LoadingScreen.BorderSizePixel = 0
	LoadingScreen.Position = UDim2.new(0, 0, 1, 0)
	LoadingScreen.Size = UDim2.new(1, 0, 1, 0)
	LoadingScreen.Image = "rbxassetid://71489091921867"
	LoadingScreen.ScaleType = Enum.ScaleType.Crop
	LoadingStatus.ZIndex = 9999

	Logo.Name = "Logo"
	Logo.Parent = LoadingScreen
	Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Logo.BackgroundTransparency = 1.000
	Logo.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Logo.BorderSizePixel = 0
	Logo.Position = UDim2.new(0, 0, 0.393181831, 0)
	Logo.Size = UDim2.new(1, 0, 0.113636367, 50)
	Logo.Font = Enum.Font.ArimoBold
	Logo.Text = "SYNAPTIC"
	Logo.TextColor3 = Color3.fromRGB(255, 255, 255)
	Logo.TextScaled = true
	Logo.TextSize = 14.000
	Logo.TextStrokeTransparency = 0.700
	Logo.TextWrapped = true
	Logo.ZIndex = 9999

	LoadingStatus.Name = "LoadingStatus"
	LoadingStatus.Parent = LoadingScreen
	LoadingStatus.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LoadingStatus.BackgroundTransparency = 1.000
	LoadingStatus.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LoadingStatus.BorderSizePixel = 0
	LoadingStatus.Position = UDim2.new(0, 0, 0.62045455, 0)
	LoadingStatus.Size = UDim2.new(1, 0, -0.075000003, 50)
	LoadingStatus.Font = Enum.Font.ArimoBold
	LoadingStatus.Text = "Loading..."
	LoadingStatus.TextColor3 = Color3.fromRGB(255, 255, 255)
	LoadingStatus.TextScaled = true
	LoadingStatus.TextSize = 14.000
	LoadingStatus.TextStrokeTransparency = 0.700
	LoadingStatus.TextWrapped = true
	LoadingStatus.ZIndex = 9999
	
	return MainUI
end
