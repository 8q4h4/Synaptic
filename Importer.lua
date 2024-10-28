shared.Modules = {}

local modules = {
	{
		Name = "language",
		URL = "https://raw.githubusercontent.com/8q4h4/Synaptic/refs/heads/main/language.lua",
	},
	{
		Name = "Lexer",
		URL = "https://raw.githubusercontent.com/8q4h4/Synaptic/refs/heads/main/Lexer.lua",
	},
	{
		Name = "FiOne",
		URL = "https://raw.githubusercontent.com/8q4h4/Synaptic/refs/heads/main/FiOne.lua",
	},
	{
		Name = "Yueliang",
		URL = "https://raw.githubusercontent.com/8q4h4/Synaptic/refs/heads/main/Yueliang.lua",
	},
	{
		Name = "LuaState",
		URL = "https://raw.githubusercontent.com/8q4h4/Synaptic/refs/heads/main/LuaState.lua",
	},
	{
		Name = "Settings",
		URL = "https://raw.githubusercontent.com/8q4h4/Synaptic/refs/heads/main/Settings.lua",
	},
	{
		Name = "HighLight",
		URL = "https://raw.githubusercontent.com/8q4h4/Synaptic/refs/heads/main/HighLight.lua",
	},
	{
		Name = "Engine",
		URL = "https://raw.githubusercontent.com/8q4h4/Synaptic/refs/heads/main/Engine.lua",
	},
	{
		Name = "UI",
		URL = "https://raw.githubusercontent.com/8q4h4/Synaptic/refs/heads/main/UI.lua",
	},
	{
		Name = "Templates",
		URL = "https://raw.githubusercontent.com/8q4h4/Synaptic/refs/heads/main/Templates.lua",
	},
	{
		Name = "lexer",
		URL = "https://raw.githubusercontent.com/8q4h4/Synaptic/refs/heads/main/lexer.lua",
	},
}

return function(context, state, network)
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
	elseif context.SynEnviroment == "LIVE" then
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
		
		warn("Synaptic codebase has been successfully downloaded. Preparing for execution...", getCodeBase)
		
		-- LUA STATE
		
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
					print(i, v)
					shared.Modules[i] = shared.Modules.LuaState(v)()
				end
			end
			
			print("Synaptic functions and modules have been loaded and initialized successfully!")
		end
	end
end
