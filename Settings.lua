local Settings = {
	SyntaxColors = {

		["keyword"] = "#f86d7c"; -- local
		["builtin"] = "#84d6f7"; -- print
		["iden"]    = "#cccccc"; -- iden
		["string"]  = "#adf195"; -- ""
		["number"]  = "#ffc600"; -- 1234
		["boolian"] = "#ffc600"; -- true / false
		["null"]    = "#ffc600"; -- nil
		["comment"] = "#666666"; -- --[[]]
		["method"]  = "#fdfbac"; -- game:method()

	};
	
	BackgroundColors = {
		
		["Editor"]  = Color3.new(0.180392, 0.180392, 0.180392);  -- Editor Background Color
		["SideBar"] = Color3.new(0.176471, 0.176471, 0.176471);  -- SideBar Background Color(BROKEN)
		
	};
	
	Font = {
		
		["Editor"]  = Enum.Font.GothamBold;   -- Editor Font
		["SideBar"] = Enum.Font.Merriweather;  -- SideBar Font
		-- TODO: Add Font size 
		
	};
}

return Settings
