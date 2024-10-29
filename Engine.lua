local engine = {}

function engine:getAllLines(context)
	local a = 0;
	for i, v in pairs(context.Lines) do
		a = a + 1
	end
	return a;
end

function engine:copyTable(tab)
	local new = {}
	for i, v in pairs(tab) do
		new[i] = v;
	end
	return new;
end

function engine:stabilizeData(context)
	local allLines = engine:getAllLines(context)
		
	if allLines == context.CurrentLine then
		return;
	end
	
	local newLineData = {}
	local copyLineData = engine:copyTable(context.Lines)
	
	for i, v in pairs(copyLineData) do
		if i > context.CurrentLine then
			newLineData[i + 1] = v
		else
			newLineData[i] = v
		end
	end

	newLineData[context.CurrentLine + 1] = nil
	
	for i, v in pairs(newLineData) do
		if v and v.LayoutOrder then
			v.LayoutOrder = i
		end
	end
	
	context.Lines = newLineData
end

function engine:stabilizeDataAfterLineRemoval(context)
	local allLines = engine:getAllLines(context)

	-- Early return if there's no line to remove or if it's the only line
	if allLines <= 1 or allLines < context.CurrentLine then
		return
	end

	local newLineData = {}
	local copyLineData = engine:copyTable(context.Lines)

	for i, v in pairs(copyLineData) do
		if i < context.CurrentLine then
			-- Keep lines before the removed line as they are
			newLineData[i] = v
		elseif i > context.CurrentLine then
			-- Shift lines after the removed line down by one
			newLineData[i - 1] = v
		end
	end

	-- Update LayoutOrder to match the new indices
	for i, v in pairs(newLineData) do
		if v and v.LayoutOrder then
			v.LayoutOrder = i
		end
	end

	-- Assign the new table to context.Lines
	context.Lines = newLineData
end

function engine:compileSource(context)
	local source = ""
	
	for i, v in pairs(context.Lines) do
		if v and v:FindFirstChild("Code") then
			local newLineChar = "\n"
			
			if i == #context.Lines then
				newLineChar = ""
			end
			
			source = source .. v.Code.Text .. newLineChar
		end
	end
	
	return source
end

function engine:splitLines(source)
	local lines = {}
	for line in source:gmatch("([^\n]*)\n?") do
		if line ~= "" then
			table.insert(lines, line)
		end
	end
	return lines
end

function engine:notification(context, msg)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Synaptic v".. context.SynVersion,
		Text = msg,
		Duration = 5,
	})
end

function engine:createCLVM()
	local takeChance = math.random(1, 25)
	local cooldown = math.random(241, 986) / 100
	if takeChance == 4 then
		return;
	end
	
	wait(cooldown)
	
	local CLVM = require(script.Parent.LuaState)
	if CLVM then
		return CLVM;
	end
end

return engine
