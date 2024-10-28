local network = require(game:GetService("ReplicatedStorage").Network)

shared.Modules = {}

local modules = {
	{
		Name = "language",
		URL = "",
	},
	{
		Name = "Lexer",
		URL = "",
	},
	{
		Name = "FiOne",
		URL = "",
	},
	{
		Name = "Yueliang",
		URL = "",
	},
	{
		Name = "LuaState",
		URL = "",
	},
	{
		Name = "Settings",
		URL = "",
	},
	{
		Name = "HighLight",
		URL = "",
	},
	{
		Name = "Engine",
		URL = "",
	},
	{
		Name = "UI",
		URL = "",
	},
	{
		Name = "Templates",
		URL = "",
	},
	{
		Name = "lexer",
		URL = "",
	},
}

return function(context)
	warn([[-
	===================================================================================
	
	Synaptic module loading process...
	
	===================================================================================
	]])
	if context.SynEnviroment == "BETA" then
		local parent = script.Parent
		
		for i, v in pairs(modules) do
			local mod = parent:FindFirstChild(v.Name, true)
			if mod then
				local startTick = tick()
				shared.Modules[v.Name] = require(mod)
				
				print(("Module '%s' was successfully loaded. (%ss)"):format(v.Name, tick() - startTick))
			end
		end
		
		wait(math.random(10, 30) / 10)
	else
		local getCodeBase = {}
		
		for i, v in pairs(modules) do
			if v.URL then
				local startTick = tick()
				local getCode = network:fetch("6e956c817dc5893f59d059b", v.URL)
				if getCode then
					getCodeBase[v.Name] = getCode
					print(("Module '%s' was successfully loaded. (%ss)"):format(v.Name, tick() - startTick))
				end
			end
		end
		
		warn("Synaptic codebase has been successfully downloaded. Preparing for execution...")
		
		-- LUA STATE
		
		local RS = game:GetService("ReplicatedStorage")	
		local state = RS:WaitForChild("Modules"):WaitForChild("LuaState")

		if state then
			-- Clear enviroment for security reasons

			for i, v in pairs(getfenv()) do
				if v then
					pcall(function()
						getfenv()[i] = nil
					end)
				end
			end

			-- Start the state hook
			state = require(state)
		end
		
		if typeof(state) == "function" then
			print("ALS has been hooked, found and required. Starting custom lua Virtual Machine...")
			
			shared.Modules.FiOne = state(getCodeBase.FiOne)()
			shared.Modules.Yueliang = state(getCodeBase.Yueliang)()
			
			print("Preparing Synaptic's Lua State...")
			shared.Modules.LuaState = state(getCodeBase.LuaState)()
			
			getCodeBase.FiOne = nil;
			getCodeBase.Yueliang = nil;
			getCodeBase.LuaState = nil;
			
			for i, v in pairs(getCodeBase) do
				if v then
					shared.Modules[i] = shared.Modules.LuaState(v)()
				end
			end
			
			print("Synaptic functions and modules have been loaded and initialized successfully!")
		end
	end
end
