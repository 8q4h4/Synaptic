local compile = shared.Modules.Yueliang
local createExecutable = shared.Modules.FiOne

local httpService = game:GetService("HttpService")

getfenv().script = nil

local randomChance = math.random(1, 25)
if randomChance == 6 then
	return function()
		return;
	end
else
	return function(source, env)
		local executable
		local env = env or getfenv(2)
		local name = (env.script and env.script:GetFullName())

		local ran, failureReason = pcall(function()
			local compiledBytecode = compile(source, name)
			executable = createExecutable(compiledBytecode, env)
		end)

		if ran then
			return setfenv(executable, env)
		end

		return nil, failureReason
	end
end
