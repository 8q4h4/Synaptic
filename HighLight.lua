local HighLight2 = shared.Modules.Settings
local HighLight = HighLight2.SyntaxColors

local TokenList = {}

local Lexer = shared.Modules.Lexer
local lexer = shared.Modules.lexer

function removeNewlines(instance)
	return instance:gsub("[\n\r]", "")
end

function HighLight:Convert(Src)
	local lines = string.split(Src, "\n")
	local hc = ""

	for linenum, Code in ipairs(lines) do
		TokenList[tostring(linenum)] = {}
		local HighlightedCode = ""
		local lastToken = ""

		for token, src in Lexer.scan(Code) do
			local sss = ""

			if HighLight[token] then
				sss = "<font color='" .. HighLight[token] .. "'>" .. src .. "</font>"
			else
				sss = "<font color='#cccccc'>" .. src .. "</font>"
			end

			if lastToken == ":" then
				sss = "<font color='" .. HighLight["method"] .. "'>" .. src .. "</font>"
			end

			HighlightedCode = HighlightedCode .. sss
			lastToken = src
		end
		
		hc = hc .. HighlightedCode .. (linenum < #lines and "\n" or "")
	end

	return removeNewlines(hc)
end

return HighLight
