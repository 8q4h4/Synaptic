local engine = shared.Modules.Engine
local highlight = shared.Modules.HighLight
local UI = shared.Modules.UI

local uis = game:GetService("UserInputService")
local httpService = game:GetService("HttpService")
local tweenService = game:GetService("TweenService")

local templates = {}

function templates:newLine(context, parent, code)
	engine:stabilizeData(context)
	context.CurrentLine = context.CurrentLine + 1
	
	local LineTemplate = Instance.new("Frame")
	local LineNumber = Instance.new("TextLabel")
	local Code = Instance.new("TextBox")
	local Display = Instance.new("TextLabel")
	local highlightedLine = Instance.new("Frame")
	
	context.Lines[context.CurrentLine] = LineTemplate
	
	LineTemplate.Name = "LineTemplate"
	LineTemplate.Parent = parent
	LineTemplate.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LineTemplate.BackgroundTransparency = 1.000
	LineTemplate.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LineTemplate.BorderSizePixel = 0
	LineTemplate.Size = UDim2.new(1, 0, 0.044, 0)
	LineTemplate.LayoutOrder = context.CurrentLine

	LineNumber.Name = "LineNumber"
	LineNumber.Parent = LineTemplate
	LineNumber.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LineNumber.BackgroundTransparency = 1.000
	LineNumber.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LineNumber.BorderSizePixel = 0
	LineNumber.Size = UDim2.new(0.0831946731, 0, 1, 0)
	LineNumber.Font = Enum.Font.SourceSans
	LineNumber.Text = context.CurrentLine
	LineNumber.TextColor3 = Color3.fromRGB(255, 255, 255)
	LineNumber.TextSize = 14.000
	LineNumber.TextXAlignment = Enum.TextXAlignment.Right

	Code.Name = "Code"
	Code.Parent = LineTemplate
	Code.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Code.BackgroundTransparency = 1.000
	Code.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Code.BorderSizePixel = 0
	Code.Position = UDim2.new(0.0965058208, 0, 0, 0)
	Code.Size = UDim2.new(0.903494179, 0, 1, 0)
	Code.Font = Enum.Font.Arimo
	Code.Text = code or ""
	Code.TextColor3 = Color3.fromRGB(30, 30, 30)
	Code.TextSize = 14.000
	Code.TextTransparency = 0
	Code.TextXAlignment = Enum.TextXAlignment.Left
	Code.ClearTextOnFocus = false
	Code.ZIndex = 2
	
	Display.Name = "Display"
	Display.Parent = LineTemplate
	Display.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Display.BackgroundTransparency = 1.000
	Display.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Display.BorderSizePixel = 0
	Display.Position = UDim2.new(0.0965058208, 0, 0, 0)
	Display.Size = UDim2.new(0.903494179, 0, 1, 0)
	Display.Font = Enum.Font.Arimo
	Display.Text = ""
	Display.TextColor3 = Color3.fromRGB(255, 255, 255)
	Display.TextSize = 14.000
	Display.TextXAlignment = Enum.TextXAlignment.Left
	Display.RichText = true
	Display.ZIndex = 2
	
	highlightedLine.Name = "Highlight"
	highlightedLine.Parent = LineTemplate
	highlightedLine.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
	highlightedLine.BackgroundTransparency = .9
	highlightedLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
	highlightedLine.BorderSizePixel = 0
	highlightedLine.Position = UDim2.new(0.0965058208, 0, 0, 0)
	highlightedLine.Size = UDim2.new(1, 0, 1, 0)
	highlightedLine.Visible = false
	
	Code:GetPropertyChangedSignal("Text"):Connect(function()
		Display.Text = highlight:Convert(Code.Text)
	end)
	
	Display.Text = highlight:Convert(Code.Text)
	
	--templates:focusLine(context, context.CurrentLine)
	Code:CaptureFocus()
	templates:update(context)
end

function templates:update(context)
	for i, v in pairs(context.Lines) do
		if v and v:IsA("Frame") then
			v.LayoutOrder = i
			if v:FindFirstChild("LineNumber") then
				v:FindFirstChild("LineNumber").Text = i
			end
			if i == context.CurrentLine and v:FindFirstChild("Highlight") then
				v:FindFirstChild("Highlight").Visible = true
			elseif v:FindFirstChild("Highlight") then
				v:FindFirstChild("Highlight").Visible = false
			end
		end
	end
end

function templates:removeLine(context)
	if context.Lines[context.CurrentLine] and context.Lines[context.CurrentLine].Code then
		context.Lines[context.CurrentLine]:Destroy()
		
 		engine:stabilizeDataAfterLineRemoval(context)
		context.CurrentLine -= 1
		
		if context.Lines[context.CurrentLine] and context.Lines[context.CurrentLine].Code then
			context.Lines[context.CurrentLine].Code:CaptureFocus()
		end
	end
	
	templates:update(context)
end

function templates:checkLineFocus(context)
	local getBox = uis:GetFocusedTextBox()
	print(getBox)
	if getBox then
		for i, v in pairs(context.Lines) do
			print(getBox.Parent, v, getBox == v)
			if getBox.Parent == v then
				return true
			end
		end
	end
	return false
end

function templates:changeToLine(context, line)
	local findLine = context.Lines[line]
	if findLine and findLine.Code then
		findLine.Code:CaptureFocus()
		context.CurrentLine = line
	end
	templates:update(context)
end

function templates:lineUp(context)
	templates:changeToLine(context, context.CurrentLine - 1)
end

function templates:lineDown(context)
	templates:changeToLine(context, context.CurrentLine + 1)
end

function templates:loadUI(context)
	local getUI = UI(context)
	if getUI then
		local tabContainer = getUI:FindFirstChild("Main").Containers.Executor:FindFirstChild("TabContainer")
		local mainContainer = getUI:FindFirstChild("Main").Containers.Executor:FindFirstChild("Main")
		local bottomBar = getUI:FindFirstChild("Main").Containers.Executor:FindFirstChild("BottomBar")
		
		local titleContainer = getUI:FindFirstChild("Main"):FindFirstChild("Title")

		local function newTab()
			local tabNumber = context.TabAmount + 1

			-- Create new TabButton and Container for the tab
			local TabTemplate = Instance.new("TextButton")
			local Icon = Instance.new("ImageLabel")
			local CloseButton_2 = Instance.new("TextButton")
			local Container = Instance.new("ScrollingFrame")
			local UIListLayout_3 = Instance.new("UIListLayout")

			-- Tab Button setup
			TabTemplate.Name = "TabTemplate" .. tabNumber
			TabTemplate.Parent = tabContainer
			TabTemplate.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			TabTemplate.Size = UDim2.new(0, 125, 0, 25)
			TabTemplate.Font = Enum.Font.ArimoBold
			TabTemplate.Text = "Tab " .. tabNumber
			TabTemplate.TextColor3 = Color3.fromRGB(255, 255, 255)
			TabTemplate.BorderColor3 = Color3.fromRGB(145, 145, 145)
			TabTemplate.TextSize = 14

			Icon.Name = "Icon"
			Icon.Parent = TabTemplate
			Icon.BackgroundTransparency = 1
			Icon.Position = UDim2.new(0.03, 0, 0.2, 0)
			Icon.Size = UDim2.new(0, 15, 0, 15)
			Icon.Image = "rbxassetid://7072723389"

			CloseButton_2.Name = "CloseButton"
			CloseButton_2.Parent = TabTemplate
			CloseButton_2.BackgroundTransparency = 1
			CloseButton_2.Position = UDim2.new(0.84, 0, 0.08, 0)
			CloseButton_2.Size = UDim2.new(0, 20, 0, 20)
			CloseButton_2.Font = Enum.Font.ArimoBold
			CloseButton_2.Text = "X"
			CloseButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
			CloseButton_2.TextSize = 14

			-- Tab Container setup
			Container.Name = "Tab" .. tabNumber
			Container.Parent = mainContainer
			Container.BackgroundTransparency = 1
			Container.Size = UDim2.new(1, 0, 1, 0)
			Container.CanvasSize = UDim2.new(1, 0, 1, 0)
			Container.ScrollBarThickness = 4
			Container.BorderSizePixel = 1
			Container.BorderColor3 = Color3.fromRGB(145, 145, 145)
			Container.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
			Container.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
			Container.AutomaticCanvasSize = Enum.AutomaticSize.XY

			UIListLayout_3.Parent = Container
			UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
			
			local function updateTabUI(activeTabNumber)
				for i, tabData in pairs(context.Tabs) do
					tabData.Container.Visible = false
					tabData.TabButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
				end

				local activeTabData = context.Tabs[activeTabNumber]
				activeTabData.Container.Visible = true
				activeTabData.TabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

				context.CurrentTab = activeTabNumber
				context.CurrentLine = activeTabData.CurrentLine
				context.CurrentBox = activeTabData.CurrentBox
				context.Lines = activeTabData.Lines
			end
			
			-- Initialize tab-specific data in context
			context.Tabs[tabNumber] = {
				Container = Container,
				TabButton = TabTemplate,
				CurrentLine = 0,
				CurrentBox = nil,
				Lines = {}
			}

			-- Increment tab count and set current tab to new tab
			context.TabAmount = context.TabAmount + 1
			context.CurrentTab = tabNumber

			-- Update the UI to show the new tab
			updateTabUI(tabNumber)

			-- Attach click event to switch tabs
			TabTemplate.MouseButton1Down:Connect(function()
				updateTabUI(tabNumber)
			end)
			
			CloseButton_2.MouseButton1Down:Connect(function()
				if tabNumber == 1 then
					return;
				end
				-- Hide and clear tab visuals
				TabTemplate.Visible = false
				context.Tabs[tabNumber].Container.Visible = false

				-- Remove the tab from context.Tabs and update TabAmount
				context.Tabs[tabNumber] = nil
				context.TabAmount -= 1

				-- Only switch tabs if the deleted tab was the active one
				if context.CurrentTab == tabNumber then
					local activeTabs = {}
					for i, v in pairs(context.Tabs) do
						if v then
							table.insert(activeTabs, {index = i, tab = v})
						end
					end

					-- If there are active tabs, select the nearest remaining tab
					if #activeTabs > 0 then
						local newTabNumber
						if tabNumber > 1 and context.Tabs[tabNumber - 1] then
							newTabNumber = tabNumber - 1  -- Select the previous tab if available
						else
							newTabNumber = activeTabs[1].index  -- Otherwise, pick the first active tab
						end
						context.CurrentTab = newTabNumber
						updateTabUI(context.CurrentTab)
					else
						-- If no tabs remain, clear CurrentTab
						context.CurrentTab = nil
					end
				end
			end)

			
			if context.TabAmount == 1 then
				templates:newLine(context, Container, "print(\"Hello world!\")")
			else
				templates:newLine(context, Container)
			end
			
			getUI:FindFirstChild("Main").Containers.MouseEnter:Connect(function()
				getUI:FindFirstChild("Main").Draggable = false
			end)
			
			getUI:FindFirstChild("Main").Containers.MouseLeave:Connect(function()
				getUI:FindFirstChild("Main").Draggable = true
			end)
		end

		-- Initial tab creation
		newTab()
		tabContainer.NewTab.MouseButton1Click:Connect(newTab)
		
		bottomBar.AttachButton.MouseButton1Click:Connect(function()
			titleContainer.Status.BackgroundColor3 = Color3.fromRGB(255, 255, 127)
			
			-- Create CLVM
			local lState = engine:createCLVM()
			if lState then
				--engine:notification(context, "Successfully attached!")
			else
				engine:notification(context, "Synaptic Injection error. (0x101)")
				return;
			end
						
			local uuid = httpService:GenerateGUID(false)
						
			-- Check CLVM
			local compiledTest = lState("_G[\"".. uuid .. "\"] = true")
			if compiledTest then
				compiledTest()
				
				wait(math.random(201, 982) / 250)
				
				if _G[uuid] == true then
					titleContainer.Status.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
					engine:notification(context, "Successfully attached!")
					context.LuaState = lState
				else
					engine:notification(context, "Synaptic Injection error. (0x102)")
					return;
				end
			else
				print(compiledTest)
				engine:notification(context, "Synaptic Injection error. (0x103)")
				return;
			end
		end)
		
		bottomBar.ClearButton.MouseButton1Click:Connect(function()
			context.CurrentLine = #context.Lines
			for i, v in pairs(context.Lines) do
				templates:removeLine(context)
			end
						
			templates:newLine(context, context.Tabs[context.CurrentTab].Container)
		end)
		
		bottomBar.ExecuteButton.MouseButton1Click:Connect(function()
			if context.LuaState then
				local src = engine:compileSource(context)
				local compile = context.LuaState(src)
				
				if compile then
					compile()
				else
					engine:notification(context, "Failed to execute. (0x104)")
				end
			else
				engine:notification(context, "Execution failed! Please attach before executing scripts. (0x105)")
			end
		end)
		
		titleContainer.CloseButton.MouseButton1Click:Connect(function()
			getUI:Destroy()
			context = nil;
		end)
		
		titleContainer.MinimizeButton.MouseButton1Click:Connect(function()
			getUI.Enabled = false
		end)
		
		titleContainer.Text = "Synaptic v".. context.SynVersion
		context.UI = getUI
		
		local loadingScreen = getUI:FindFirstChild("Main"):FindFirstChild("LoadingScreen")
		loadingScreen.Position = UDim2.new(0, 0, 0, 0)
		getUI:FindFirstChild("Main").Containers.Visible = false
		
		return function()
			wait(math.random(34, 98) / 10)
			getUI:FindFirstChild("Main").Containers.Visible = true
			
			loadingScreen:TweenPosition(UDim2.new(0, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, .75, true)
			tweenService:Create(loadingScreen, TweenInfo.new(.375, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
		end
	end
end

return templates
