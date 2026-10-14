--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

local obf_stringchar = string.char;
local obf_stringbyte = string.byte;
local obf_stringsub = string.sub;
local obf_bitlib = bit32 or bit;
local obf_XOR = obf_bitlib.bxor;
local obf_tableconcat = table.concat;
local obf_tableinsert = table.insert;
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	local result = {};
	for i = 1, #LUAOBFUSACTOR_STR do
		obf_tableinsert(result, obf_stringchar(obf_XOR(obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_STR, i, i + 1)), obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), 1 + (i % #LUAOBFUSACTOR_KEY) + 1))) % 256));
	end
	return obf_tableconcat(result);
end
local v0 = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\229\212\222\32\232\136\194\12\199\202\216\32", "\126\177\163\187\69\134\219\167"));
local v1 = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\22\222\47\215\213\45\221\63\209\207\38\223\60\204\255\38", "\156\67\173\74\165"));
local v2 = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\28\163\93\6\143\35\84\34\190\74\19", "\38\84\215\41\118\220\70"));
local v3 = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\115\25\48\23\217\69\31", "\158\48\118\66\114"));
local v4 = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\155\40\17\47\118\183\232", "\155\203\68\112\86\19\197"));
local v5 = v4.LocalPlayer;
local v6 = LUAOBFUSACTOR_DECRYPT_STR_0("\21\137\99\171\18", "\152\38\189\86\156\32\24\133");
local v7 = (gethwid and gethwid()) or (get_hwid and get_hwid()) or (pcall(function()
	return game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\206\85\191\103\242\86\171\95\232\94\164\85\207\82\181\80\245\84\162", "\38\156\55\199")):GetClientId();
end) and game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\154\127\100\9\29\117\246\90\188\116\127\59\32\113\232\85\161\126\121", "\35\200\29\28\72\115\20\154")):GetClientId()) or tostring(v5.UserId);
local v8 = LUAOBFUSACTOR_DECRYPT_STR_0("\58\183\212\222\153\14\59\13\128\250\218\148\98\32\1\171", "\84\121\223\177\191\237\76");
local function v9(v14)
	if (not v14 or (v14 == "")) then
		return false;
	end
	v14 = string.gsub(v14, LUAOBFUSACTOR_DECRYPT_STR_0("\133\19\218\234\114\30\125\136\254\69\131\228", "\161\219\54\169\192\90\48\80"), LUAOBFUSACTOR_DECRYPT_STR_0("\12\19", "\69\41\34\96"));
	local v15, v16 = pcall(function()
		return game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\180\215\195\26\17\113\243\140\214\26\11\101\172\207\214\30\13\41\179\204\196\30\76\37\185\215\152\26\23\41\176\202\212\69\21\35\181\215\210\6\11\56\168\140", "\75\220\163\183\106\98") .. v6 .. LUAOBFUSACTOR_DECRYPT_STR_0("\93\179\143\50\215\22\179\141\62\220\16\231", "\185\98\218\235\87") .. v7 .. LUAOBFUSACTOR_DECRYPT_STR_0("\141\55\34\255\131", "\202\171\92\71\134\190") .. v14);
	end);
	if (v15 and v16) then
		local v435, v436 = pcall(function()
			return v2:JSONDecode(v16);
		end);
		if (v435 and v436 and v436.success and v436.data and (v436.data.valid == true)) then
			return true;
		end
	end
	return false;
end
local function v10()
	local v17 = (syn and syn.request) or (http and http.request) or http_request or request or (fluxus and fluxus.request);
	if v17 then
		local v437, v438 = pcall(function()
			return v17({[LUAOBFUSACTOR_DECRYPT_STR_0("\28\211\32", "\232\73\161\76")]=LUAOBFUSACTOR_DECRYPT_STR_0("\179\205\86\77\13\225\150\13\92\14\178\151\82\81\31\175\214\64\82\17\168\205\12\83\27\175\150\82\72\28\183\208\65\18\13\175\216\80\73", "\126\219\185\34\61"),[LUAOBFUSACTOR_DECRYPT_STR_0("\33\203\74\122\113\115", "\135\108\174\62\18\30\23\147")]=LUAOBFUSACTOR_DECRYPT_STR_0("\134\198\25\255", "\167\214\137\74\171\120\206\83"),[LUAOBFUSACTOR_DECRYPT_STR_0("\163\245\51\89\253\181\152", "\199\235\144\82\61\152")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\36\25\183\63\2\24\173\102\51\15\169\46", "\75\103\118\217")]=LUAOBFUSACTOR_DECRYPT_STR_0("\198\68\96\24\176\29\198\64\121\27\183\81\205\71\127\26", "\126\167\52\16\116\217")},[LUAOBFUSACTOR_DECRYPT_STR_0("\234\33\36\153", "\156\168\78\64\224\212\121")]=v2:JSONEncode({[LUAOBFUSACTOR_DECRYPT_STR_0("\20\235\183\216\14\237\160", "\174\103\142\197")]=34572,[LUAOBFUSACTOR_DECRYPT_STR_0("\95\44\90\54\49\87\254\95\45\77", "\152\54\72\63\88\69\62")]=v7})});
		end);
		if (v437 and v438 and v438.Body) then
			local v518, v519 = pcall(function()
				return v2:JSONDecode(v438.Body);
			end);
			if (v518 and v519 and v519.success and v519.data and v519.data.url) then
				return v519.data.url;
			end
		end
	end
	return LUAOBFUSACTOR_DECRYPT_STR_0("\220\208\250\76\199\158\161\19\211\197\250\89\195\197\247\18\196\200\239\72\219\198\225\83\199\208\160\95\219\201\161\93\155\151\186\9\131\150\177\85\208\153", "\60\180\164\142") .. v7;
end
local function v11(v18)
	if (isfile and readfile and isfile(v8)) then
		local v439 = readfile(v8);
		if (v439 and (v439 ~= "")) then
			if v9(v439) then
				v18();
				return;
			end
		end
	end
	for v355, v356 in ipairs({LUAOBFUSACTOR_DECRYPT_STR_0("\123\86\0\40\51\207\29\76\97\36\60\51\229\63\87\90\4\37", "\114\56\62\101\73\71\141"),LUAOBFUSACTOR_DECRYPT_STR_0("\158\229\206\193\182\253\233\193\182\236\204\193\188\214\248\204\189\232\207\132\154\230\207", "\164\216\137\187"),LUAOBFUSACTOR_DECRYPT_STR_0("\241\238\52\179\178\220\4\198\217\28\189\162\255\7", "\107\178\134\81\210\198\158")}) do
		local v357 = (gethui and gethui():FindFirstChild(v356)) or v3:FindFirstChild(v356);
		if v357 then
			v357:Destroy();
		end
		local v358 = v3:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\10\1\128\202\165\32\41\151\207", "\202\88\110\226\166")) and v3.RobloxGui:FindFirstChild(v356);
		if v358 then
			v358:Destroy();
		end
	end
	local v19 = (gethui and gethui()) or v3:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\241\0\128\251\197\219\40\151\254", "\170\163\111\226\151")) or v3;
	local v20 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\34\51\160\61\75\57\14\4\57", "\73\113\80\210\88\46\87"));
	v20.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\162\36\200\19\243\163\35\217\45\198\148\56\197\63\232\133\45\193", "\135\225\76\173\114");
	v20.ResetOnSpawn = false;
	v20.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
	v20.Parent = v19;
	local v26 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\46\232\160\164\142\168\179\14\226\182", "\199\122\141\216\208\204\221"));
	v26.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\130\203\21\226\116\247\180", "\150\205\189\112\144\24");
	v26.Text = "";
	v26.AutoButtonColor = false;
	v26.Size = UDim2.fromScale(1, 1);
	v26.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
	v26.BackgroundTransparency = 0.55;
	v26.BorderSizePixel = 0;
	v26.Parent = v20;
	local v35 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\3\150\190\65\1", "\112\69\228\223\44\100\232\113"));
	v35.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\247\30\21\215", "\230\180\127\103\179\214\28");
	v35.Size = UDim2.fromOffset(450, 255);
	v35.AnchorPoint = Vector2.new(0.5, 0.5);
	v35.Position = UDim2.fromScale(0.5, 0.5);
	v35.BackgroundTransparency = 1;
	v35.BorderSizePixel = 0;
	v35.Parent = v20;
	local v43 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\165\8\94\65\225\109\225\142\0\83", "\128\236\101\63\38\132\33"));
	v43.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\159\161\16\64\185\252", "\175\204\201\113\36\214\139");
	v43.AnchorPoint = Vector2.new(0.5, 0.5);
	v43.Position = UDim2.fromScale(0.5, 0.5);
	v43.Size = UDim2.new(1, 110, 1, 110);
	v43.BackgroundTransparency = 1;
	v43.Image = LUAOBFUSACTOR_DECRYPT_STR_0("\85\206\45\221\23\84\201\33\213\0\29\131\122\132\93\30\158\103\143\84\17\155\98", "\100\39\172\85\188");
	v43.ImageColor3 = Color3.fromRGB(0, 0, 0);
	v43.ImageTransparency = 0.5;
	v43.ScaleType = Enum.ScaleType.Slice;
	v43.SliceCenter = Rect.new(99, 99, 99, 99);
	v43.ZIndex = 1;
	v43.Parent = v35;
	local v57 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\139\106\184\141\54", "\83\205\24\217\224"));
	v57.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\196\196\206\54\225\215\194\40\232\193", "\93\134\165\173");
	v57.Size = UDim2.fromScale(1, 1);
	v57.BackgroundColor3 = Color3.fromRGB(36, 36, 42);
	v57.BackgroundTransparency = 0.22;
	v57.BorderSizePixel = 0;
	v57.ZIndex = 2;
	v57.Parent = v35;
	local v65 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\139\219\226\205\40\192\183\108", "\30\222\146\161\162\90\174\210"));
	v65.CornerRadius = UDim.new(0, 8);
	v65.Parent = v57;
	local v68 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\195\92\113\7\224", "\106\133\46\16"));
	v68.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\127\50\114\248\83\69\86\52", "\32\56\64\19\156\58");
	v68.Size = UDim2.fromScale(1, 1);
	v68.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	v68.BackgroundTransparency = 0.75;
	v68.BorderSizePixel = 0;
	v68.ZIndex = 2;
	v68.Parent = v35;
	local v76 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\111\225\198\89\72\252\133\72", "\224\58\168\133\54\58\146"));
	v76.CornerRadius = UDim.new(0, 8);
	v76.Parent = v68;
	local v79 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\108\127\108\239\116\130\142\14\87\66", "\107\57\54\43\157\21\230\231"));
	v79.Rotation = 90;
	v79.Color = ColorSequence.new(Color3.fromRGB(48, 48, 54), Color3.fromRGB(24, 24, 28));
	v79.Parent = v68;
	local v83 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\242\134\16\242\188\240\206\217\142\29", "\175\187\235\113\149\217\188"));
	v83.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\18\160\136\95\230", "\24\92\207\225\44\131\25");
	v83.Size = UDim2.fromScale(1, 1);
	v83.BackgroundTransparency = 1;
	v83.Image = LUAOBFUSACTOR_DECRYPT_STR_0("\89\209\160\77\8\110\78\199\177\72\65\50\4\138\225\26\67\46\31\135\234\30\76", "\29\43\179\216\44\123");
	v83.ImageTransparency = 0.94;
	v83.ScaleType = Enum.ScaleType.Tile;
	v83.TileSize = UDim2.new(0, 128, 0, 128);
	v83.ZIndex = 2;
	v83.Parent = v35;
	local v94 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\136\240\3\67\175\215\37\94", "\44\221\185\64"));
	v94.CornerRadius = UDim.new(0, 8);
	v94.Parent = v83;
	local v97 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\39\245\73\82\118", "\19\97\135\40\63"));
	v97.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\140\83\33\63\42\35", "\81\206\60\83\91\79");
	v97.Size = UDim2.fromScale(1, 1);
	v97.BackgroundTransparency = 1;
	v97.ZIndex = 4;
	v97.Parent = v35;
	local v103 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\123\130\243\125\61\205\72\182", "\196\46\203\176\18\79\163\45"));
	v103.CornerRadius = UDim.new(0, 8);
	v103.Parent = v97;
	local v106 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\141\11\77\10\54\244\228\189", "\143\216\66\30\126\68\155"));
	v106.Color = Color3.fromRGB(90, 90, 95);
	v106.Transparency = 0.5;
	v106.Thickness = 1;
	v106.Parent = v97;
	local v111 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\140\218\12\198\192", "\129\202\168\109\171\165\195\183"));
	v111.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\22\87\39\244\215\26\227", "\134\66\56\87\184\190\116");
	v111.Size = UDim2.new(1, -16, 0, 1);
	v111.Position = UDim2.fromOffset(8, 0);
	v111.BackgroundColor3 = Color3.fromRGB(96, 205, 255);
	v111.BackgroundTransparency = 0.4;
	v111.BorderSizePixel = 0;
	v111.ZIndex = 5;
	v111.Parent = v35;
	local v120 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\26\35\8\182\28", "\85\92\81\105\219\121\139\65"));
	v120.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\213\182\81\65\121\205", "\191\157\211\48\37\28");
	v120.Size = UDim2.new(1, 0, 0, 52);
	v120.BackgroundTransparency = 1;
	v120.ZIndex = 5;
	v120.Parent = v35;
	local v126 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\246\18\245\27\63\243\30\246\25\54", "\90\191\127\148\124"));
	v126.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\81\132\33\25", "\119\24\231\78");
	v126.Size = UDim2.fromOffset(22, 22);
	v126.Position = UDim2.fromOffset(20, 16);
	v126.BackgroundTransparency = 1;
	v126.Image = LUAOBFUSACTOR_DECRYPT_STR_0("\144\47\189\75\207\83\20\150\36\161\16\147\15\64\211\117\252\29\138\17\67\212\117\245\31\133\22\70", "\113\226\77\197\42\188\32");
	v126.ImageRectOffset = Vector2.new(320, 64);
	v126.ImageRectSize = Vector2.new(64, 64);
	v126.ImageColor3 = Color3.fromRGB(96, 205, 255);
	v126.ZIndex = 5;
	v126.Parent = v120;
	local v137 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\14\19\236\161\22\23\246\176\54", "\213\90\118\148"));
	v137.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\111\39\160\90\72", "\45\59\78\212\54");
	v137.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\51\94\134\138\146\110\143\255\4\22\162\158\146\38\168\254\4\95\128\138\146\39\162\254", "\144\112\54\227\235\230\78\205");
	v137.Font = Enum.Font.GothamBold;
	v137.TextSize = 16;
	v137.TextColor3 = Color3.fromRGB(245, 245, 245);
	v137.TextXAlignment = Enum.TextXAlignment.Left;
	v137.BackgroundTransparency = 1;
	v137.Position = UDim2.fromOffset(50, 12);
	v137.Size = UDim2.new(1, -60, 0, 18);
	v137.AutoLocalize = false;
	v137.ZIndex = 5;
	v137.Parent = v120;
	local v152 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\135\45\23\232\252\90\177\45\3", "\59\211\72\111\156\176"));
	v152.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\125\146\225\25\71\147\239\40", "\77\46\231\131");
	v152.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\159\90\162\69\168\20\175\79\175\70\246\75\191\77\246\84\181\20\181\79\180\64\191\78\175\81", "\32\218\52\214");
	v152.Font = Enum.Font.Gotham;
	v152.TextSize = 12;
	v152.TextColor3 = Color3.fromRGB(175, 175, 180);
	v152.TextXAlignment = Enum.TextXAlignment.Left;
	v152.BackgroundTransparency = 1;
	v152.Position = UDim2.fromOffset(50, 31);
	v152.Size = UDim2.new(1, -60, 0, 14);
	v152.AutoLocalize = false;
	v152.ZIndex = 5;
	v152.Parent = v120;
	local v166 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\104\5\48\165\244", "\58\46\119\81\200\145\208\37"));
	v166.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\9\131\52\181", "\86\75\236\80\204\201\221");
	v166.Size = UDim2.new(1, -40, 0, 115);
	v166.Position = UDim2.fromOffset(20, 58);
	v166.BackgroundTransparency = 1;
	v166.ZIndex = 5;
	v166.Parent = v35;
	local v173 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\84\83\118\136\251", "\235\18\33\23\229\158"));
	v173.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\121\180\209\174\68\156\211\186\93\191", "\219\48\218\161");
	v173.Size = UDim2.new(1, 0, 0, 38);
	v173.Position = UDim2.fromOffset(0, 6);
	v173.BackgroundColor3 = Color3.fromRGB(48, 48, 54);
	v173.BackgroundTransparency = 0.2;
	v173.BorderSizePixel = 0;
	v173.ZIndex = 5;
	v173.Parent = v166;
	local v182 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\209\88\95\70\201\65\229\246", "\128\132\17\28\41\187\47"));
	v182.CornerRadius = UDim.new(0, 4);
	v182.Parent = v173;
	local v185 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\52\27\53\46\79\14\57\3", "\61\97\82\102\90"));
	v185.Color = Color3.fromRGB(75, 75, 82);
	v185.Transparency = 0.6;
	v185.Thickness = 1;
	v185.Parent = v173;
	local v190 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\152\43\179\95\229\88\6", "\105\204\78\203\43\167\55\126"));
	v190.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\140\164\51\11\7", "\49\197\202\67\126\115\100\167");
	v190.PlaceholderText = LUAOBFUSACTOR_DECRYPT_STR_0("\7\90\204\61\133\22\85\50\66\159\33\133\68\91\121\21\145", "\62\87\59\191\73\224\54");
	v190.PlaceholderColor3 = Color3.fromRGB(150, 150, 155);
	v190.Text = "";
	v190.Font = Enum.Font.Gotham;
	v190.TextSize = 13;
	v190.TextColor3 = Color3.fromRGB(245, 245, 245);
	v190.TextXAlignment = Enum.TextXAlignment.Left;
	v190.ClearTextOnFocus = false;
	v190.BackgroundTransparency = 1;
	v190.Size = UDim2.new(1, -24, 1, 0);
	v190.Position = UDim2.fromOffset(12, 0);
	v190.AutoLocalize = false;
	v190.ZIndex = 6;
	v190.Parent = v173;
	local v206 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\193\16\251\196\226", "\169\135\98\154"));
	v206.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\226\121\32\93\254\50\220\196\101", "\168\171\23\68\52\157\83");
	v206.Size = UDim2.new(1, -4, 0, 1);
	v206.Position = UDim2.new(0, 2, 1, -1);
	v206.BackgroundColor3 = Color3.fromRGB(145, 145, 150);
	v206.BackgroundTransparency = 0.5;
	v206.BorderSizePixel = 0;
	v206.ZIndex = 6;
	v206.Parent = v173;
	v190.Focused:Connect(function()
		v0:Create(v173, TweenInfo.new(0.2), {[LUAOBFUSACTOR_DECRYPT_STR_0("\214\112\246\166\34\63\136\225\127\241\142\42\33\136\230\34", "\231\148\17\149\205\69\77")]=Color3.fromRGB(38, 38, 44),[LUAOBFUSACTOR_DECRYPT_STR_0("\162\166\196\240\80\237\143\178\201\255\99\237\129\169\212\235\86\237\133\169\196\226", "\159\224\199\167\155\55")]=0.1}):Play();
		v0:Create(v206, TweenInfo.new(0.2), {[LUAOBFUSACTOR_DECRYPT_STR_0("\213\242\63\217\240\225\51\199\249\247\31\221\251\252\46\129", "\178\151\147\92")]=Color3.fromRGB(96, 205, 255),[LUAOBFUSACTOR_DECRYPT_STR_0("\174\252\79\57\21\94\117\153\243\72\6\0\77\116\159\237\77\32\23\66\121\149", "\26\236\157\44\82\114\44")]=0,[LUAOBFUSACTOR_DECRYPT_STR_0("\25\39\207\94", "\59\74\78\181")]=UDim2.new(1, -2, 0, 2)}):Play();
	end);
	v190.FocusLost:Connect(function()
		v0:Create(v173, TweenInfo.new(0.2), {[LUAOBFUSACTOR_DECRYPT_STR_0("\7\208\89\81\180\55\222\79\84\183\6\222\86\85\161\118", "\211\69\177\58\58")]=Color3.fromRGB(48, 48, 54),[LUAOBFUSACTOR_DECRYPT_STR_0("\149\228\122\254\238\217\184\240\119\241\221\217\182\235\106\229\232\217\178\235\122\236", "\171\215\133\25\149\137")]=0.2}):Play();
		v0:Create(v206, TweenInfo.new(0.2), {[LUAOBFUSACTOR_DECRYPT_STR_0("\195\201\49\241\232\34\243\87\239\204\17\245\227\63\238\17", "\34\129\168\82\154\143\80\156")]=Color3.fromRGB(145, 145, 150),[LUAOBFUSACTOR_DECRYPT_STR_0("\167\179\48\0\79\92\134\144\188\55\63\90\79\135\150\162\50\25\77\64\138\156", "\233\229\210\83\107\40\46")]=0.5,[LUAOBFUSACTOR_DECRYPT_STR_0("\242\75\40\211", "\101\161\34\82\182")]=UDim2.new(1, -4, 0, 1)}):Play();
	end);
	local v215 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\220\8\65\234\247\227\128\43\228", "\78\136\109\57\158\187\130\226"));
	v215.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\13\43\248\229\43\44", "\145\94\95\153");
	v215.Text = 'Click \"Get Key\" to copy the verification link.';
	v215.Font = Enum.Font.Gotham;
	v215.TextSize = 12;
	v215.TextColor3 = Color3.fromRGB(155, 155, 160);
	v215.TextXAlignment = Enum.TextXAlignment.Left;
	v215.BackgroundTransparency = 1;
	v215.Position = UDim2.fromOffset(2, 50);
	v215.Size = UDim2.new(1, -4, 0, 20);
	v215.AutoLocalize = false;
	v215.ZIndex = 5;
	v215.Parent = v166;
	local v228 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\219\223\21\216\75", "\215\157\173\116\181\46"));
	v228.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\23\187\159\230\213\56\150\138\224", "\186\85\212\235\146");
	v228.Size = UDim2.new(1, 0, 0, 58);
	v228.Position = UDim2.new(0, 0, 1, -58);
	v228.BackgroundColor3 = Color3.fromRGB(30, 30, 34);
	v228.BackgroundTransparency = 0.2;
	v228.BorderSizePixel = 0;
	v228.ZIndex = 5;
	v228.Parent = v35;
	local v237 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\247\168\53\241\43\224\93\208", "\56\162\225\118\158\89\142"));
	v237.CornerRadius = UDim.new(0, 8);
	v237.Parent = v228;
	local v240 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\122\23\193\162\39", "\184\60\101\160\207\66"));
	v240.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\18\141\106\185\35", "\220\81\226\28");
	v240.Size = UDim2.new(1, 0, 0, 8);
	v240.Position = UDim2.new(0, 0, 0, 0);
	v240.BackgroundColor3 = Color3.fromRGB(30, 30, 34);
	v240.BackgroundTransparency = 0.2;
	v240.BorderSizePixel = 0;
	v240.ZIndex = 5;
	v240.Parent = v228;
	local v249 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\53\199\131\246\239", "\167\115\181\226\155\138"));
	v249.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\209\39\247", "\166\130\66\135\60\27\17");
	v249.Size = UDim2.new(1, 0, 0, 1);
	v249.Position = UDim2.new(0, 0, 0, 0);
	v249.BackgroundColor3 = Color3.fromRGB(60, 60, 66);
	v249.BackgroundTransparency = 0.4;
	v249.BorderSizePixel = 0;
	v249.ZIndex = 6;
	v249.Parent = v228;
	local v258 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\98\88\207\120\53", "\80\36\42\174\21"));
	v258.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\108\5\35\110\65\30\31\117\66\20\50\104", "\26\46\112\87");
	v258.Size = UDim2.new(1, -40, 1, 0);
	v258.Position = UDim2.fromOffset(20, 0);
	v258.BackgroundTransparency = 1;
	v258.ZIndex = 6;
	v258.Parent = v228;
	local v265 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\140\10\135\125\172\171\105\181\160\44\190\96", "\212\217\67\203\20\223\223\37"));
	v265.FillDirection = Enum.FillDirection.Horizontal;
	v265.HorizontalAlignment = Enum.HorizontalAlignment.Right;
	v265.VerticalAlignment = Enum.VerticalAlignment.Center;
	v265.Padding = UDim.new(0, 10);
	v265.Parent = v258;
	local v274 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\142\136\176\198\152\152\188\198\181\131", "\178\218\237\200"));
	v274.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\145\176\242\251\179\172\196\196\184", "\176\214\213\134");
	v274.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\211\168\162\148\131\83\64\180\229\149\219\184\79\25\216\164\184\223\225", "\57\148\205\214\180\200\54");
	v274.Font = Enum.Font.GothamMedium;
	v274.TextSize = 13;
	v274.TextColor3 = Color3.fromRGB(235, 235, 240);
	v274.Size = UDim2.fromOffset(155, 34);
	v274.BackgroundColor3 = Color3.fromRGB(48, 48, 54);
	v274.BackgroundTransparency = 0.1;
	v274.AutoButtonColor = false;
	v274.AutoLocalize = false;
	v274.ZIndex = 7;
	v274.Parent = v258;
	local v288 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\39\212\22\59\100\28\248\39", "\22\114\157\85\84"));
	v288.CornerRadius = UDim.new(0, 4);
	v288.Parent = v274;
	local v291 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\241\226\32\208\79\249\163\193", "\200\164\171\115\164\61\150"));
	v291.Color = Color3.fromRGB(75, 75, 82);
	v291.Transparency = 0.6;
	v291.Thickness = 1;
	v291.Parent = v274;
	v274.MouseEnter:Connect(function()
		v0:Create(v274, TweenInfo.new(0.15), {[LUAOBFUSACTOR_DECRYPT_STR_0("\156\245\0\78\132\172\251\22\75\135\157\251\15\74\145\237", "\227\222\148\99\37")]=Color3.fromRGB(62, 62, 70)}):Play();
	end);
	v274.MouseLeave:Connect(function()
		v0:Create(v274, TweenInfo.new(0.15), {[LUAOBFUSACTOR_DECRYPT_STR_0("\17\83\81\253\254\33\93\71\248\253\16\93\94\249\235\96", "\153\83\50\50\150")]=Color3.fromRGB(48, 48, 54)}):Play();
	end);
	local v296 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\105\115\107\8\81\190\89\73\121\125", "\45\61\22\19\124\19\203"));
	v296.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\247\23\31\252\4\105\155\213\28", "\217\161\114\109\149\98\16");
	v296.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\36\37\42\117\186\109\82\11\61\101", "\20\114\64\88\28\220");
	v296.Font = Enum.Font.GothamBold;
	v296.TextSize = 13;
	v296.TextColor3 = Color3.fromRGB(255, 255, 255);
	v296.Size = UDim2.fromOffset(120, 34);
	v296.BackgroundColor3 = Color3.fromRGB(0, 120, 212);
	v296.BackgroundTransparency = 0;
	v296.AutoButtonColor = false;
	v296.AutoLocalize = false;
	v296.ZIndex = 7;
	v296.Parent = v258;
	local v309 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\4\40\241\187\234\222\184\35", "\221\81\97\178\212\152\176"));
	v309.CornerRadius = UDim.new(0, 4);
	v309.Parent = v296;
	local v312 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\248\206\46\239\8\194\236\24", "\122\173\135\125\155"));
	v312.Color = Color3.fromRGB(96, 205, 255);
	v312.Transparency = 0.6;
	v312.Thickness = 1;
	v312.Parent = v296;
	v296.MouseEnter:Connect(function()
		v0:Create(v296, TweenInfo.new(0.15), {[LUAOBFUSACTOR_DECRYPT_STR_0("\166\192\3\178\56\35\199\145\207\4\154\48\61\199\150\146", "\168\228\161\96\217\95\81")]=Color3.fromRGB(16, 137, 230)}):Play();
	end);
	v296.MouseLeave:Connect(function()
		v0:Create(v296, TweenInfo.new(0.15), {[LUAOBFUSACTOR_DECRYPT_STR_0("\249\208\45\87\40\69\212\196\32\88\12\88\215\222\60\15", "\55\187\177\78\60\79")]=Color3.fromRGB(0, 120, 212)}):Play();
	end);
	v274.MouseButton1Click:Connect(function()
		local v359 = v10();
		if setclipboard then
			setclipboard(v359);
			v215.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\6\203\70\171\74\198\142\38\142\92\228\86\198\133\41\142\75\228\6\204\140\36\222\93\228\71\221\132\108\142\124\228\75\223\140\40\218\90\171\69\199\133\46\197\79\228\79\193\148\109\199\81\171\68\221\143\58\221\90\249\8", "\224\77\174\63\139\38\175");
			v215.TextColor3 = Color3.fromRGB(96, 205, 255);
		else
			v215.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\168\72\86\37\222\1", "\78\228\33\56") .. v359;
			v215.TextColor3 = Color3.fromRGB(240, 200, 80);
		end
	end);
	local v317 = false;
	v296.MouseButton1Click:Connect(function()
		if v317 then
			return;
		end
		local v360 = v190.Text;
		if (not v360 or (v360 == "")) then
			v215.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\254\114\183\2\150\203\62\162\2\150\218\123\242\26\138\219\108\242\8\128\215\62\187\13\145\193\62\166\11\128\142\106\183\27\145\142\120\187\6\137\202\62\180\10\151\221\106\252", "\229\174\30\210\99");
			v215.TextColor3 = Color3.fromRGB(255, 100, 100);
			return;
		end
		v317 = true;
		v296.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\56\229\131\82\230\52\55\28\163\200\31", "\89\123\141\230\49\141\93");
		v215.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\197\116\228\5\22\83\250\127\241\76\27\79\234\49\225\5\4\66\179\65\250\13\4\69\241\126\249\31\4\4\189\63", "\42\147\17\150\108\112");
		v215.TextColor3 = Color3.fromRGB(180, 180, 185);
		task.spawn(function()
			local v440 = v9(v360);
			if v440 then
				v215.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\36\163\52\63\241\237\29\175\43\118\226\236\79\181\56\124\228\237\28\181\43\106\235\228\22\231\109\83\232\233\11\175\35\120\167\234\0\178\99\49\169", "\136\111\198\77\31\135");
				v215.TextColor3 = Color3.fromRGB(100, 255, 120);
				if writefile then
					pcall(function()
						writefile(v8, v360);
					end);
				end
				task.wait(0.6);
				v20:Destroy();
				v18();
			else
				v215.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\43\7\177\87\177\237\19\233\13\27\231\83\165\244\30\187\7\13\231\93\184\253\89\233\50\5\162\87\174\225\87\174\7\29\231\87\253\234\18\190\66\2\162\79\243", "\201\98\105\199\54\221\132\119");
				v215.TextColor3 = Color3.fromRGB(255, 100, 100);
				v296.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\143\9\145\40\4\44\236\146\9\154", "\204\217\108\227\65\98\85");
				v317 = false;
			end
		end);
	end);
	local v318, v319, v320, v321;
	v35.InputBegan:Connect(function(v364)
		if ((v364.UserInputType == Enum.UserInputType.MouseButton1) or (v364.UserInputType == Enum.UserInputType.Touch)) then
			v318 = true;
			v320 = v364.Position;
			v321 = v35.Position;
			v364.Changed:Connect(function()
				if (v364.UserInputState == Enum.UserInputState.End) then
					v318 = false;
				end
			end);
		end
	end);
	v35.InputChanged:Connect(function(v365)
		if ((v365.UserInputType == Enum.UserInputType.MouseMovement) or (v365.UserInputType == Enum.UserInputType.Touch)) then
			v319 = v365;
		end
	end);
	v1.InputChanged:Connect(function(v366)
		if ((v366 == v319) and v318) then
			local v468 = v366.Position - v320;
			v35.Position = UDim2.new(v321.X.Scale, v321.X.Offset + v468.X, v321.Y.Scale, v321.Y.Offset + v468.Y);
		end
	end);
end
local v12 = loadstring(game:HttpGetAsync(LUAOBFUSACTOR_DECRYPT_STR_0("\86\215\225\245\63\154\17\140\231\228\59\142\89\202\225\237\57\194\75\208\240\247\47\207\80\215\240\235\56\142\93\204\248\170\33\217\86\198\252\246\41\206\92\198\231\226\99\230\82\214\240\235\56\141\108\198\251\224\59\197\90\140\248\228\37\206\17\229\249\240\41\206\74\141\249\240\45\213", "\160\62\163\149\133\76")))();
local function v13()
	local v322 = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\230\172\12\54\198\196\179", "\163\182\192\109\79"));
	local v323 = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\6\35\16\204\252\55\39\20\197\241\7\50\15\210\244\51\35", "\149\84\70\96\160"));
	local v324 = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\15\9\31\230\43\22\12\238\61", "\141\88\102\109"));
	local v325 = v322.LocalPlayer;
	local v326 = v323:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\131\95\203\105\31\47\116\207\160\68\207\98\46\60\87\205\182", "\161\211\51\170\16\122\93\53"));
	local v327 = v323.ToolEvents:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\207\161\189\36\218\173\166\33\244\160", "\72\155\206\210"));
	local v328 = v323.ToolEvents:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\118\118\85\23\18\72\115\89\15\39\79\117\90", "\83\38\26\52\110"));
	local v329 = v323:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\107\31\40\86\113\25\49\67\86\3\40\84\65\54\36\82\81\24\41", "\38\56\119\71"));
	local v330 = 4;
	local v331 = -0.25;
	local v332 = 0.8;
	local v333 = 1.2;
	local v334 = 2.5;
	local v335 = 10;
	local v336 = 60;
	local v337 = 40;
	local v338 = 85;
	local function v339(v367, v368)
		local v369 = _G.BOT_TUNES;
		local v370 = v369 and v369[v367];
		if (type(v370) == LUAOBFUSACTOR_DECRYPT_STR_0("\253\250\85\212\32\68", "\54\147\143\56\182\69")) then
			return v370;
		end
		return v368;
	end
	if _G.BOT then
		_G.BOT.enabled = false;
	end
	if _G.BOT_CLEANUP then
		pcall(_G.BOT_CLEANUP);
	end
	local v340 = {[LUAOBFUSACTOR_DECRYPT_STR_0("\211\143\254\75\211\211\133", "\191\182\225\159\41")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\47\29\24\93\132\147\205", "\162\75\114\72\53\235\231")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\156\61\81\241\86", "\98\236\92\36\130\51")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\175\28\21", "\80\196\121\108\218\37\200\213")]={},[LUAOBFUSACTOR_DECRYPT_STR_0("\19\102\0\114\66\26\158\5\119", "\234\96\19\98\31\43\110")]={},[LUAOBFUSACTOR_DECRYPT_STR_0("\5\16\64\213\169\113\159\37\16\71\201\184", "\235\102\127\50\167\204\18")]=0,[LUAOBFUSACTOR_DECRYPT_STR_0("\71\179\250\45\67\13\95\180\251\55", "\78\48\193\149\67\36")]=0,[LUAOBFUSACTOR_DECRYPT_STR_0("\60\17\135", "\33\80\126\224\120")]={},[LUAOBFUSACTOR_DECRYPT_STR_0("\252\160\12\202\89\222\173\16\209\80\248\187", "\60\140\200\99\164")]={},[LUAOBFUSACTOR_DECRYPT_STR_0("\139\245\23\50\146\143\251\16\41\131\147", "\194\231\148\100\70")]=0,[LUAOBFUSACTOR_DECRYPT_STR_0("\74\77\210\183\215\203\82", "\168\38\44\161\195\150")]=0,[LUAOBFUSACTOR_DECRYPT_STR_0("\129\242\154\127\53\252\175", "\118\224\156\226\22\80\136\214")]=0,[LUAOBFUSACTOR_DECRYPT_STR_0("\82\235\87\131\75\226\116\143\70\235", "\224\34\142\57")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\218\162\196\217", "\110\190\199\165\189\19\145\61")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\201\234\113\237\184\206\212\232\114", "\167\186\139\23\136\235")]=nil,[LUAOBFUSACTOR_DECRYPT_STR_0("\25\172\139\1\31\148\139\25\19\163\141", "\109\122\213\232")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\237\238\161\60\235\196\182\49\252\227", "\80\142\151\194")]=nil,[LUAOBFUSACTOR_DECRYPT_STR_0("\2\196\120\94\23\229\120\89\13\210", "\44\99\166\23")]=0};
	_G.BOT = v340;
	local function v341(v371)
		table.insert(v340.log, tostring(v371));
		if (#v340.log > 40) then
			table.remove(v340.log, 1);
		end
	end
	if not _G.PDHooked then
		_G.PDHooked = true;
		v323.ToolEvents.PhoneDisplay.OnClientEvent:Connect(function(v470, v471, v472, v473)
			local v474 = _G.BOT;
			if not v474 then
				return;
			end
			table.insert(v474.phoneResults, {[LUAOBFUSACTOR_DECRYPT_STR_0("\114\246\36\51", "\196\28\151\73\86\83")]=v470,[LUAOBFUSACTOR_DECRYPT_STR_0("\242\0\61\25\141\86", "\22\147\99\73\112\226\56\120")]=v471,a=v472,b=v473});
			if (#v474.phoneResults > 60) then
				table.remove(v474.phoneResults, 1);
			end
			if ((v471 == LUAOBFUSACTOR_DECRYPT_STR_0("\139\112\246\212\131\171\98\231\231", "\237\216\21\130\149")) and (type(v472) == LUAOBFUSACTOR_DECRYPT_STR_0("\145\90\77\86\190\206", "\62\226\46\63\63\208\169"))) then
				local v544 = v472:gsub(LUAOBFUSACTOR_DECRYPT_STR_0("\185\27\71\198\12\71\96\1\187", "\62\133\121\53\227\127\109\79"), "\n");
				for v578, v579 in v544:gmatch(LUAOBFUSACTOR_DECRYPT_STR_0("\88\81\54\190\159\235\177\90\47\119\187\140\235\239\45\75\119\230\156\230\153\49\89\22\200\159", "\194\112\116\82\149\182\206")) do
					local v580 = tonumber(v578);
					if (v580 and not v474.key[v580]) then
						v474.key[v580] = v579;
					end
				end
				v474.lastCaptureAt = os.clock();
				v474.lastPhotoAt = os.clock();
				v474.cycleActive = false;
				v474.cycleStart = nil;
				v341(LUAOBFUSACTOR_DECRYPT_STR_0("\24\166\95\15\197\240\78\43\173\79\29\201\244\11\61\242\12", "\110\89\200\44\120\160\130") .. v544);
				pcall(function()
					v328:FireServer(LUAOBFUSACTOR_DECRYPT_STR_0("\155\203\68\72\70\27", "\45\203\163\43\38\35\42\91"), LUAOBFUSACTOR_DECRYPT_STR_0("\193\145\211\51", "\52\178\229\188\67\231\201"));
					local v581 = v325.Character and v325.Character:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\9\84\93\5\249\83\42\37", "\67\65\33\48\100\151\60"));
					if v581 then
						v581:UnequipTools();
					end
				end);
				task.wait(0.3);
				pcall(function()
					local v582 = v325.Character;
					if (v582 and not v582:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\239\226\160\219\250\211", "\147\191\135\206\184"))) then
						local v626 = v325.Backpack:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\180\45\168\194\209\95", "\210\228\72\198\161\184\51"));
						if v626 then
							v582:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\30\92\254\17\125\193\63\77", "\174\86\41\147\112\19")):EquipTool(v626);
						end
					end
				end);
			end
		end);
	end
	local function v342()
		local v372 = v325.Character;
		return (v372 and v372:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\107\8\130\5\32\94", "\203\59\96\237\107\69\111\113"))) or v325.Backpack:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\20\30\163\239\52\161", "\183\68\118\204\129\81\144"));
	end
	local function v343()
		pcall(function()
			v328:FireServer(LUAOBFUSACTOR_DECRYPT_STR_0("\62\165\127\234\14\211", "\226\110\205\16\132\107"), LUAOBFUSACTOR_DECRYPT_STR_0("\248\215\239\201", "\33\139\163\128\185"));
			local v441 = v325.Character and v325.Character:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\127\77\9\223\89\87\13\218", "\190\55\56\100"));
			if v441 then
				v441:UnequipTools();
			end
		end);
	end
	local function v344(v373)
		local v374 = v325.Character;
		if not v374 then
			return;
		end
		if v374:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\102\170\50\29\26\239", "\147\54\207\92\126\115\131")) then
			return;
		end
		local v375 = v325.Backpack:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\61\52\59\126\4\114", "\30\109\81\85\29\109"));
		local v376 = v374:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\215\100\89\183\56\209\245\251", "\156\159\17\52\214\86\190"));
		if (v375 and v376) then
			v376:UnequipTools();
			v376:EquipTool(v375);
			if not v373 then
				v341(LUAOBFUSACTOR_DECRYPT_STR_0("\143\225\165\181\171\251\164\252\166\230\186\180\238\162\227\252\190\234\179\191\167\227\253\185\191\250\180\172\190\234\185", "\220\206\143\221"));
			end
		end
	end
	local function v345()
		local v377 = v325.Character;
		return tonumber(v377 and v377:GetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\167\115\53\30\221\216\203", "\178\230\29\77\119\184\172"))) or 0;
	end
	local function v346()
		local v378 = v325.Character;
		if not v378 then
			return true;
		end
		local v379 = v378:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\221\171\7\26\121\247\252\186", "\152\149\222\106\123\23"));
		if (v379 and (v379.Health <= 0)) then
			return true;
		end
		if (v378:GetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\249\35\247\87\189\238\35\231\86\176\211\37\243\98\182\201\47\224\70", "\213\189\70\150\35")) == true) then
			return true;
		end
		return false;
	end
	local function v347()
		local v380 = v325.Character and v325.Character:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\103\64\121\9\65\90\125\12", "\104\47\53\20"));
		local v381 = v380 and v380.SeatPart;
		local v382 = v381 and v381:GetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\128\64\128\15\175\29\172\67\140\53\184", "\111\195\44\225\124\220"));
		if (not v382 and v381 and v381:GetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\235\67\1\103\130\175", "\203\184\38\96\19\203"))) then
			v382 = tostring(v381:GetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\10\118\120\85\231\61", "\174\89\19\25\33"))):match(LUAOBFUSACTOR_DECRYPT_STR_0("\17\90\23\79\188\164\7\46\1\65\7", "\107\79\114\50\46\151\231"));
		end
		if not v382 then
			v382 = v325:GetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\24\181\166\32\141\55\178\196\26\170\180\58\153\43\184\207\52\143\177", "\160\89\198\213\73\234\89\215"));
		end
		local v383, v384;
		local v385, v386;
		for v442, v443 in ipairs(v324:GetChildren()) do
			if (v443:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\101\126\176\251\201", "\165\40\17\212\158")) and v443.Name:find(LUAOBFUSACTOR_DECRYPT_STR_0("\209\220\9\48\46\224\203", "\70\133\185\104\83")) and v443:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\44\80\73\43\199\11\76\64", "\169\100\37\36\74"))) then
				local v525 = v443:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\40\146\175\81\14\136\171\84\50\136\173\68\48\134\176\68", "\48\96\231\194")) or v443.PrimaryPart;
				local v526 = (v525 and (v525.Position - ((v380 and v380.RootPart and v380.RootPart.Position) or Vector3.zero)).Magnitude) or 9999;
				if (v443:GetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\252\95\15\46\17\221\189\160\196\91\29\62\11\215\160\142", "\227\168\58\110\77\121\184\207")) == v382) then
					if (not v383 or (v526 < v384)) then
						v383, v384 = v443, v526;
					end
				end
				if (not v385 or (v526 < v386)) then
					v385, v386 = v443, v526;
				end
			end
		end
		return v383 or v385;
	end
	local function v348(v387)
		if (not v387 or not v387:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\89\61\172\69\129\218\99\177", "\197\27\92\223\32\209\187\17"))) then
			return false;
		end
		return v387.Size.Magnitude > 8;
	end
	local function v349()
		local v388 = v347();
		if not v388 then
			v340.teacherInfo = LUAOBFUSACTOR_DECRYPT_STR_0("\13\80\131\239\6\94\192\243\6\77", "\155\99\63\163");
			return true;
		end
		local v389 = v388:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\170\196\172\140\183\139\139\213\147\130\182\144\178\208\179\153", "\228\226\177\193\237\217")) or v388.PrimaryPart;
		local v390 = v388:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\28\181\34\226", "\134\84\208\67"));
		local v391 = v325.Character and v325.Character:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\59\185\139\93\29\163\143\88", "\60\115\204\230"));
		local v392 = (v391 and v391.SeatPart) or (v325.Character and v325.Character.PrimaryPart);
		if (not v389 or not v392) then
			v340.teacherInfo = LUAOBFUSACTOR_DECRYPT_STR_0("\247\53\248\121\243\51\228\126\167\101", "\16\135\90\139");
			return false;
		end
		local v393 = v392.Position - v389.Position;
		local v394 = v393.Magnitude;
		local v395 = v389.CFrame.LookVector;
		if (v340.lastLook and (v340.lastLook:Dot(v395) < 0.95)) then
			v340.lastFaceTime = os.clock();
		end
		v340.lastLook = v395;
		local v397 = RaycastParams.new();
		v397.FilterType = Enum.RaycastFilterType.Exclude;
		v397.FilterDescendantsInstances = {v388,v325.Character};
		local v401 = (v390 or v389).Position;
		local v391 = v325.Character and v325.Character:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\124\97\11\50\64\91\113\80", "\24\52\20\102\83\46\52"));
		local v402 = v391 and v391.SeatPart;
		local v403 = {(v392.Position + Vector3.new(0, 2.2, 0)),v392.Position};
		if v402 then
			local v478 = v402.Size.X * 0.45;
			table.insert(v403, v402.Position + (v402.CFrame.RightVector * v478));
			table.insert(v403, v402.Position - (v402.CFrame.RightVector * v478));
		end
		local v404 = true;
		for v444, v445 in ipairs(v403) do
			local v446 = v324:Raycast(v401, v445 - v401, v397);
			if not (v446 and v348(v446.Instance)) then
				v404 = false;
				break;
			end
		end
		if v404 then
			v340.teacherInfo = string.format(LUAOBFUSACTOR_DECRYPT_STR_0("\192\114\100\106\95\194\111\39\49\3\200\54\97\38\3\203\44\42\33\11\132\28\0\2\42", "\111\164\79\65\68"), v394);
			return true;
		end
		local v405 = v389.AssemblyLinearVelocity;
		if (v405.Magnitude > 1) then
			local v480 = v405.Unit:Dot(v393.Unit);
			if (v480 > 0.3) then
				v340.lastFaceTime = os.clock();
				v340.teacherInfo = string.format(LUAOBFUSACTOR_DECRYPT_STR_0("\194\132\198\144\126\236\134\216\147\206\60\229\199\218\139\215\32\237\134\235\170\237\5", "\138\166\185\227\190\78"), v394);
				return false;
			end
			local v481 = v389.CFrame.LookVector:Dot(v393.Unit);
			if (v481 > 0.25) then
				v340.lastFaceTime = os.clock();
				v340.teacherInfo = string.format(LUAOBFUSACTOR_DECRYPT_STR_0("\207\41\128\121\2\37\89\205\117\198\62\92\36\89\222\103\133\37\91\48\18", "\121\171\20\165\87\50\67"), v394);
				return false;
			end
			v340.teacherInfo = string.format(LUAOBFUSACTOR_DECRYPT_STR_0("\194\101\252\120\233\4\134\53\182\32\176\12\193\120\184\33\184\27\134\11\152\16\156", "\98\166\88\217\86\217"), v394);
			return true;
		end
		if (v394 < v330) then
			v340.teacherInfo = string.format(LUAOBFUSACTOR_DECRYPT_STR_0("\242\171\60\79\214\218\182\228\112\6\142\200\182\248\124\25\146\156\226\249\57\20\149\156\196\223\74\42\199", "\188\150\150\25\97\230"), v394);
			return false;
		end
		local v406 = v389.CFrame.LookVector:Dot(v393.Unit);
		local v407 = v406;
		if v390 then
			v407 = v390.CFrame.LookVector:Dot(v393.Unit);
		end
		if ((v406 > 0.25) or (v407 > 0.25)) then
			v340.lastFaceTime = os.clock();
		end
		local v408 = (v406 < v331) and (v407 < v331);
		v340.teacherInfo = string.format(LUAOBFUSACTOR_DECRYPT_STR_0("\222\212\26\76\92\235\154\139\91\95\73\163\136\143\31\10\8\176\159\199\13\4\76\168\201", "\141\186\233\63\98\108"), v394, v406, v407, (v408 and LUAOBFUSACTOR_DECRYPT_STR_0("\194\203\10\147", "\69\145\138\76\214")) or LUAOBFUSACTOR_DECRYPT_STR_0("\92\224\166\162\150\56\87\142", "\118\16\175\233\233\223"));
		return v408;
	end
	local function v350()
		local v410 = v325.PlayerGui;
		local v411 = v410:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\170\138\38\172\235\153\77\138\148\48\169\221\136\111\142\129\59\156\251\130", "\29\235\228\85\219\142\235"));
		if v411 then
			for v527, v528 in ipairs(v411:GetChildren()) do
				if (v528:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\26\193\179\242\117\68\34\81\41", "\50\93\180\218\189\23\46\71")) and (v528.Name ~= LUAOBFUSACTOR_DECRYPT_STR_0("\253\168\84\95\65\254\93\202\176\84\66", "\40\190\196\59\44\36\188")) and (v528.Name ~= LUAOBFUSACTOR_DECRYPT_STR_0("\17\74\222\189\246\120\46\48\74\207\177\216\104\25\40\74\210", "\109\92\37\188\212\154\29"))) then
					for v593, v594 in pairs(v340.submitted) do
						local v595 = v528:FindFirstChild(tostring(v593));
						local v596 = v595 and v595:FindFirstChild(v594);
						if (v596 and v596:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\35\250\173\236\51\80\1\236\176", "\58\100\143\196\163\81"))) then
							v596.Visible = true;
							v596.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
							v596.BackgroundTransparency = 0;
						end
					end
				end
			end
		end
		local v412 = v325.Character and v325.Character:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\50\87\46\162\49\70\236\10", "\110\122\34\67\195\95\41\133"));
		local v413 = v412 and v412.SeatPart;
		if v413 then
			for v529, v530 in ipairs(v413:GetDescendants()) do
				if (v530:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\70\164\73\76\215\118\180\124\95\223", "\182\21\209\59\42")) and (v530.Name == LUAOBFUSACTOR_DECRYPT_STR_0("\150\89\214\10\36\172\135\86\213\24\51\141\162\69\195\28\34\187\144\66\204", "\222\215\55\165\125\65")) and (v530:GetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\3\198\200\31\224\244\254\79\62\248\194", "\42\76\177\166\122\146\161\141")) == v325.UserId)) then
					local v583 = v530:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\149\139\21\203\107", "\22\197\234\101\174\25"));
					for v597, v598 in pairs(v340.submitted) do
						local v599 = v583 and v583:FindFirstChild(tostring(v597));
						local v600 = v599 and v599:FindFirstChild(v598);
						if (v600 and v600:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\10\33\172\243\116\165\210\133\57", "\230\77\84\197\188\22\207\183"))) then
							v600.Visible = true;
							v600.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
							v600.BackgroundTransparency = 0;
						end
					end
				end
			end
		end
	end
	local function v351(v414, v415)
		if (v324:GetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\222\21\203\249\191\181\241\33\236\7", "\85\153\116\166\156\236\193\144")) ~= LUAOBFUSACTOR_DECRYPT_STR_0("\133\243\94\182\247\19\169\229\67\167\164\41\170\160\125\161\235\7\182\229\94\160", "\96\196\128\45\211\132")) then
			return false;
		end
		local v416 = v324:GetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\20\158\104\90\193\188\185\221\59\153\72\90\195\186\177\214\54\136\82\91", "\184\85\237\27\63\178\207\212"));
		local v417, v418, v419 = pcall(function()
			return v326:InvokeServer(v414, v415, nil, v416);
		end);
		if (v417 and v418) then
			v340.submitted[v414] = v415;
			if v419 then
				v340.correctCount = v340.correctCount + 1;
			else
				v340.wrongCount = v340.wrongCount + 1;
			end
			v341(v414 .. "=" .. v415 .. ((v419 and LUAOBFUSACTOR_DECRYPT_STR_0("\72\122\38\109\58\124\42\107", "\63\104\57\105")) or LUAOBFUSACTOR_DECRYPT_STR_0("\75\176\150\107\37\160", "\36\107\231\196")));
			v350();
			return true;
		end
		return false;
	end
	task.spawn(function()
		while v340.enabled do
			local v447, v448 = pcall(function()
				local v486 = v324:GetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\122\180\175\130\110\161\163\147\72\166", "\231\61\213\194"));
				local v487 = v324:GetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\40\190\46\118\26\190\48\118\7\185\14\118\24\184\56\125\10\168\20\119", "\19\105\205\93"));
				if (v340.lastSeq ~= v487) then
					v340.lastSeq = v487;
					v340.key = {};
					v340.submitted = {};
					v340.correctCount = 0;
					v340.wrongCount = 0;
				end
				if ((v486 == LUAOBFUSACTOR_DECRYPT_STR_0("\136\27\205\132\44\186\5\219\143\43\233\33\208\193\15\187\7\217\147\58\186\27", "\95\201\104\190\225")) and not v346()) then
					local v560 = v326:InvokeServer();
					if (type(v560) == LUAOBFUSACTOR_DECRYPT_STR_0("\187\202\195\194\170", "\174\207\171\161")) then
						v340.totalQ = 0;
						for v627 = 1, 60 do
							if (v560[v627] ~= nil) then
								v340.totalQ = v627;
							end
						end
						local v602 = {};
						for v628 = 1, v340.totalQ or 0 do
							if (v340.key[v628] and (v560[v628] == LUAOBFUSACTOR_DECRYPT_STR_0("\216\208\44\221\203\224\200\204\40\215", "\183\141\158\109\147\152"))) then
								table.insert(v602, v628);
							end
						end
						v340.pendingCount = #v602;
						if (#v602 > 0) then
							local v635 = v602[math.random(#v602)];
							v351(v635, v340.key[v635]);
						end
					end
				end
			end);
			if not v447 then
				v341(LUAOBFUSACTOR_DECRYPT_STR_0("\31\60\196\33\5\61\166\41\30\59\201\62\118\73", "\108\76\105\134") .. tostring(v448));
			end
			task.wait(0.5 + (math.random() * 0.5));
		end
	end);
	task.spawn(function()
		while v340.enabled do
			pcall(function()
				if v340.cycleActive then
					local v561 = false;
					local v562 = "";
					if v346() then
						v561 = true;
						v562 = LUAOBFUSACTOR_DECRYPT_STR_0("\239\192\176\245\198", "\174\139\165\209\129");
					else
						local v604 = v347();
						local v605 = v325.Character and v325.Character:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\139\166\239\192\200\12\121\124", "\24\195\211\130\161\166\99\16"));
						local v606 = (v605 and v605.SeatPart) or (v325.Character and v325.Character.PrimaryPart);
						if (v604 and v606) then
							local v636 = v604:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\110\22\228\45\93\25\79\7\219\35\92\2\118\2\251\56", "\118\38\99\137\76\51"));
							if v636 then
								local v654 = v606.Position - v636.Position;
								local v655 = v654.Magnitude;
								local v656 = v636.AssemblyLinearVelocity;
								local v657 = v656.Magnitude;
								local v658 = (v657 > 5) and (v657 > 0) and (v656.Unit:Dot(v654.Unit) > 0.15);
								if v658 then
									v561 = true;
									v562 = string.format(LUAOBFUSACTOR_DECRYPT_STR_0("\233\35\4\17\1\37\239\102\4\2\25\50\242\39\6\26\0\46\250\102\19\79\76\110\173\32", "\64\157\70\101\114\105"), v657);
								elseif (v340.cycleStartDist and (v655 < (v340.cycleStartDist * 0.85))) then
									v561 = true;
									v562 = string.format(LUAOBFUSACTOR_DECRYPT_STR_0("\84\173\166\224\24\69\186\231\224\28\79\187\174\237\23\0\161\169\163\20\29\237\233\179\22", "\112\32\200\199\131"), v655);
								elseif not v349() then
									v561 = true;
									v562 = LUAOBFUSACTOR_DECRYPT_STR_0("\42\81\95\177\205\172\98\57\67", "\66\76\48\60\216\163\203");
								end
							end
						elseif not v349() then
							v561 = true;
							v562 = LUAOBFUSACTOR_DECRYPT_STR_0("\188\135\122\250\81\201\100\175\149", "\68\218\230\25\147\63\174");
						end
					end
					if v561 then
						v343();
						v340.cycleActive = false;
						v340.cycleStart = nil;
						v340.abortCount = v340.abortCount + 1;
						v340.lastPhotoAt = os.clock();
						v340.lastAbortAt = os.clock();
						v340.resumeSince = nil;
						v341(LUAOBFUSACTOR_DECRYPT_STR_0("\140\8\124\126\130\236\106", "\214\205\74\51\44") .. v562 .. LUAOBFUSACTOR_DECRYPT_STR_0("\186\4\161", "\23\154\44\130\156") .. v340.abortCount .. ")");
						task.wait(0.3);
						v344(true);
					end
				end
			end);
			task.wait(0.15);
		end
	end);
	task.spawn(function()
		while v340.enabled do
			local v449, v450 = pcall(function()
				local v488 = v324:GetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\54\167\160\171\5\7\16\178\184\189", "\115\113\198\205\206\86"));
				if (v488 ~= LUAOBFUSACTOR_DECRYPT_STR_0("\165\68\237\95\151\68\243\95\138\67\190\115\138\23\206\72\139\80\236\95\151\68", "\58\228\55\158")) then
					if (not v342() or not v325.Backpack:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\132\140\222\45\53\161", "\85\212\233\176\78\92\205"))) then
						if (not v340.interCollect or ((os.clock() - v340.interCollect) > 15)) then
							v340.interCollect = os.clock();
							if not v342() then
								v329:FireServer(LUAOBFUSACTOR_DECRYPT_STR_0("\105\87\132\238\79\91\156", "\130\42\56\232"), LUAOBFUSACTOR_DECRYPT_STR_0("\218\189\43\237\69\110", "\95\138\213\68\131\32"));
							end
							if not v325.Backpack:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\26\45\175\64\127\38", "\22\74\72\193\35")) then
								v329:FireServer(LUAOBFUSACTOR_DECRYPT_STR_0("\15\118\232\84\41\122\240", "\56\76\25\132"), LUAOBFUSACTOR_DECRYPT_STR_0("\110\196\165\37\198\82", "\175\62\161\203\70"));
							end
						end
					end
					return;
				end
				if (not v340.doPhoto or v340.pause) then
					return;
				end
				if v346() then
					if not v340.dead then
						v340.dead = true;
						v340.cycleActive = false;
						v340.cycleStart = nil;
						v341(LUAOBFUSACTOR_DECRYPT_STR_0("\24\216\194\7\61\115\222\194\6\50\52\201\131\94\107\124\223\204\7\117\44\220\214\0\48\56", "\85\92\189\163\115"));
					end
					return;
				elseif v340.dead then
					v340.dead = false;
					v341(LUAOBFUSACTOR_DECRYPT_STR_0("\8\160\57\46\44\236\125\102\105\190\53\43\60\161\57\54\46", "\88\73\204\80"));
				end
				v340.anxiety = v345();
				if ((v340.anxiety >= v339(LUAOBFUSACTOR_DECRYPT_STR_0("\15\173\40\111\12\238\23\188\32\99\7\249\7\175", "\186\78\227\112\38\73"), v338)) and not v340.pencilMode) then
					v340.pencilMode = true;
					v344();
					return;
				end
				if v340.pencilMode then
					if (v340.anxiety > 60) then
						return;
					end
					v340.pencilMode = false;
					v341(LUAOBFUSACTOR_DECRYPT_STR_0("\221\89\229\92\86\110\229\23\249\71\92\106\236\82\249\21\30\36\188\85\252\86\88\58\232\88\189\69\91\117\242\82", "\26\156\55\157\53\51"));
				end
				local v490 = v342();
				if not v490 then
					local v565 = v324:GetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\173\203\5\220\171\67\129\221\24\205\139\85\157\205\19\215\187\85\165\220", "\48\236\184\118\185\216"));
					if (v340.triedCollect ~= v565) then
						v340.triedCollect = v565;
						v329:FireServer(LUAOBFUSACTOR_DECRYPT_STR_0("\198\178\91\60\202\55\241", "\84\133\221\55\80\175"), LUAOBFUSACTOR_DECRYPT_STR_0("\141\239\43\168\194\13", "\60\221\135\68\198\167"));
						task.wait(0.3);
						v329:FireServer(LUAOBFUSACTOR_DECRYPT_STR_0("\205\178\244\143\71\218\250", "\185\142\221\152\227\34"), LUAOBFUSACTOR_DECRYPT_STR_0("\104\192\89\249\74\63", "\151\56\165\55\154\35\83"));
						v341(LUAOBFUSACTOR_DECRYPT_STR_0("\144\75\10\224\165\3\78\174\176\70\11\237\169\79\69\252\165\82\16\235\179\87\0\234\224\69\23\225\173\3\9\225\163\72\0\252", "\142\192\35\101"));
					end
					return;
				end
				local v491 = v490:GetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\230\125\38\173\226\191\184\23\194\112", "\118\182\21\73\195\135\236\204"));
				if (v491 == nil) then
					if not v349() then
						return;
					end
					local v566 = v325.Character and v325.Character:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\32\41\23\65\10\2\244\12", "\157\104\92\122\32\100\109"));
					if not v566 then
						return;
					end
					if (v490.Parent ~= v325.Character) then
						v566:EquipTool(v490);
					end
					task.wait(0.6);
					v491 = v490:GetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\147\174\192\196\56\20\153\170\183\163", "\203\195\198\175\170\93\71\237"));
					if (v491 == nil) then
						v343();
						return;
					end
				end
				v340.phoneState = v491;
				if ((v491 == LUAOBFUSACTOR_DECRYPT_STR_0("\28\78\63\209\72\37\243\2\68\63\209", "\156\78\43\94\181\49\113")) or (v491 == LUAOBFUSACTOR_DECRYPT_STR_0("\66\233\209\176\14\71", "\25\18\136\164\195\107\35"))) then
					local v567 = os.clock() - (v340.lastAbortAt or 0);
					if (v567 < v339(LUAOBFUSACTOR_DECRYPT_STR_0("\203\20\138\99\87\131\226\151\199\1\141\96\69\146", "\216\136\77\201\47\18\220\161"), v334)) then
						if (v490.Parent == v325.Character) then
							v343();
						end
						return;
					end
					local v568 = ((v567 < 10) and v339(LUAOBFUSACTOR_DECRYPT_STR_0("\11\205\8\255\55\241\167\0\195\25\227", "\226\77\140\75\186\104\188"), v333)) or 1;
					if ((os.clock() - (v340.lastFaceTime or 0)) < v568) then
						return;
					end
					if v349() then
						if (v567 < 10) then
							if not v340.resumeSince then
								v340.resumeSince = os.clock();
								return;
							end
							if ((os.clock() - v340.resumeSince) < v339(LUAOBFUSACTOR_DECRYPT_STR_0("\138\250\241\29\99\156\241\228\22\98\156", "\47\217\174\176\95"), v332)) then
								return;
							end
						end
						v340.resumeSince = nil;
						local v619 = v325.Character and v325.Character:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\144\200\123\3\188\91\113\34", "\70\216\189\22\98\210\52\24"));
						if v619 then
							if (v490.Parent ~= v325.Character) then
								v619:EquipTool(v490);
							end
							v340.lastAct = os.clock();
							v340.cycleActive = true;
							v340.cycleStart = os.clock();
							local v641 = v347();
							local v642 = v325.Character and v325.Character:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\242\202\174\134\221\213\214\167", "\179\186\191\195\231"));
							local v643 = (v642 and v642.SeatPart) or (v325.Character and v325.Character.PrimaryPart);
							v340.cycleStartDist = (v641 and v643 and v641.PrimaryPart and (v643.Position - v641.PrimaryPart.Position).Magnitude) or nil;
							v328:FireServer(LUAOBFUSACTOR_DECRYPT_STR_0("\201\55\23\234\252\110", "\132\153\95\120"), LUAOBFUSACTOR_DECRYPT_STR_0("\130\183\13\34\249\222\149\162\183", "\192\209\210\110\77\151\186"));
							v327:FireServer(v490, LUAOBFUSACTOR_DECRYPT_STR_0("\211\6\33\230\241\192\213\16\39", "\164\128\99\66\137\159"));
							v341(((v491 == LUAOBFUSACTOR_DECRYPT_STR_0("\48\136\252\173\5\141", "\222\96\233\137")) and LUAOBFUSACTOR_DECRYPT_STR_0("\181\188\166\27\129\253\247\249\183\162\9\137\254\176\241\180\177\26\134\255\249\240", "\144\217\211\199\127\232\147")) or LUAOBFUSACTOR_DECRYPT_STR_0("\244\32\63\44\149\71\3\87\244\46\42\33\217\65\11", "\36\152\79\94\72\181\37\98"));
						end
					else
						v340.resumeSince = nil;
						if (v490.Parent == v325.Character) then
							v343();
						end
					end
					return;
				end
				v340.resumeSince = nil;
				if ((v491 == LUAOBFUSACTOR_DECRYPT_STR_0("\251\215\70\59\222\214\64", "\95\183\184\39")) or (v491 == LUAOBFUSACTOR_DECRYPT_STR_0("\129\62\236\47\90\135\50\189\48\243\41", "\98\213\95\135\70\52\224"))) then
					if (v490.Parent == v325.Character) then
						if not v340.cycleActive then
							v340.cycleActive = true;
							v340.cycleStart = os.clock();
						end
						if (v340.cycleStart and ((os.clock() - v340.cycleStart) > v335)) then
							v343();
							v340.cycleActive = false;
							v340.cycleStart = nil;
							v340.lastPhotoAt = os.clock();
							v341(LUAOBFUSACTOR_DECRYPT_STR_0("\221\186\202\123\81\190\176\221\98\87\245\227\132\41\20\236\166\218\114\64", "\52\158\195\169\23"));
						end
					elseif v340.cycleActive then
						v340.cycleActive = false;
						v340.cycleStart = nil;
					end
					return;
				end
				if ((v491 ~= LUAOBFUSACTOR_DECRYPT_STR_0("\84\185\55\112\149\5\115\132\110\179", "\235\26\220\82\20\230\85\27")) and (v491 ~= LUAOBFUSACTOR_DECRYPT_STR_0("\171\174\228\210\120\141\181\236", "\20\232\193\137\162"))) then
					return;
				end
				if (v340.totalQ and (v340.totalQ > 0)) then
					local v569 = 0;
					for v584 in pairs(v340.key) do
						v569 = v569 + 1;
					end
					if (v569 >= v340.totalQ) then
						return;
					end
				end
				if ((v340.pendingCount or 0) > 0) then
					return;
				end
				if ((os.clock() - v340.lastPhotoAt) < v339(LUAOBFUSACTOR_DECRYPT_STR_0("\1\230\230\138\194\179\52\94\13\243\225\137\208\162", "\17\66\191\165\198\135\236\119"), v334)) then
					return;
				end
				if v349() then
					if not v340.safeSince then
						v340.safeSince = os.clock();
						return;
					end
					if ((os.clock() - v340.safeSince) < v339(LUAOBFUSACTOR_DECRYPT_STR_0("\60\155\143\49\211\205\211\229\38\130\139", "\177\111\207\206\115\159\136\140"), v332)) then
						return;
					end
				else
					v340.safeSince = nil;
					return;
				end
				v340.safeSince = nil;
				if ((os.clock() - (v340.lastFaceTime or 0)) < v339(LUAOBFUSACTOR_DECRYPT_STR_0("\35\168\51\49\235\98\122\40\166\34\45", "\63\101\233\112\116\180\47"), v333)) then
					return;
				end
				local v495 = v325.Character and v325.Character:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\235\46\224\19\246\57\202\63", "\86\163\91\141\114\152"));
				if not v495 then
					return;
				end
				if (v490.Parent ~= v325.Character) then
					v495:EquipTool(v490);
				end
				local v496 = os.clock();
				v340.lastAct = v496;
				v340.lastPhotoAt = v496;
				v340.cycleActive = true;
				v340.cycleStart = v496;
				v340.cycleStartDist = nil;
				local v502 = v347();
				local v503 = v325.Character and v325.Character:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\123\30\121\114\52\92\2\112", "\90\51\107\20\19"));
				local v504 = (v503 and v503.SeatPart) or (v325.Character and v325.Character.PrimaryPart);
				if (v502 and v504 and v502.PrimaryPart) then
					v340.cycleStartDist = (v504.Position - v502.PrimaryPart.Position).Magnitude;
				end
				v328:FireServer(LUAOBFUSACTOR_DECRYPT_STR_0("\189\248\138\225\56\220", "\93\237\144\229\143"), LUAOBFUSACTOR_DECRYPT_STR_0("\32\229\245", "\38\117\150\144\121\107"));
				v327:FireServer(v490, LUAOBFUSACTOR_DECRYPT_STR_0("\24\168\235", "\90\77\219\142"));
				v341(LUAOBFUSACTOR_DECRYPT_STR_0("\214\12\46\45\67\71\110\231\15\36\55\12\79\109\231\16\34\49\72\8\125\166\5\34\45\69\17\127\175", "\26\134\100\65\89\44\103"));
			end);
			if not v449 then
				v341(LUAOBFUSACTOR_DECRYPT_STR_0("\215\194\2\14\129\195\163\21\17\150\222\209\106\99", "\196\145\131\80\67") .. tostring(v450));
			end
			task.wait(0.7);
		end
	end);
	task.spawn(function()
		while v340.enabled do
			pcall(function()
				local v505 = v324:GetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\57\177\11\13\43\252\31\164\19\27", "\136\126\208\102\104\120"));
				if (v505 ~= LUAOBFUSACTOR_DECRYPT_STR_0("\89\153\221\70\188\65\48\84\118\158\142\106\161\18\13\67\119\141\220\70\188\65", "\49\24\234\174\35\207\50\93")) then
					return;
				end
				if (v346() or v340.cycleActive) then
					return;
				end
				local v506 = v325.Character;
				if not v506 then
					return;
				end
				local v507 = v506:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\60\250\242\134\116\93", "\17\108\146\157\232"));
				if v507 then
					local v573 = v507:GetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\123\203\27\227\42\155\95\194\0\232", "\200\43\163\116\141\79"));
					if ((v573 == nil) or (v573 == LUAOBFUSACTOR_DECRYPT_STR_0("\145\51\56\135\163\196\235\176\34\50", "\131\223\86\93\227\208\148"))) then
						if not v340.phoneIdleSince then
							v340.phoneIdleSince = os.clock();
						elseif ((os.clock() - v340.phoneIdleSince) > 3) then
							v343();
							v340.phoneIdleSince = nil;
							v341(LUAOBFUSACTOR_DECRYPT_STR_0("\202\65\186\179\93\165\235\74\184\179\93\248\189\5\186\185\10\176\241\64\178", "\213\131\37\214\214\125"));
						end
					else
						v340.phoneIdleSince = nil;
					end
					return;
				end
				v340.phoneIdleSince = nil;
				if v506:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\22\46\43\188\232\42", "\129\70\75\69\223")) then
					return;
				end
				local v509 = v325.Backpack:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\118\206\253\234\117\227", "\143\38\171\147\137\28"));
				if v509 then
					v506:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\248\151\180\242\13\236\221\212", "\180\176\226\217\147\99\131")):EquipTool(v509);
				end
			end);
			task.wait(1);
		end
	end);
	task.spawn(function()
		while v340.enabled do
			pcall(function()
				v340.anxiety = v345();
				v350();
				if (v324:GetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\244\184\34\2\224\173\46\19\198\170", "\103\179\217\79")) == LUAOBFUSACTOR_DECRYPT_STR_0("\107\164\15\208\82\159\174\79\185\8\149\104\130\227\122\165\19\210\83\137\176\89", "\195\42\215\124\181\33\236")) then
					v349();
				end
				local v511 = {};
				for v531, v532 in pairs(v340.key) do
					local v533 = (v340.submitted[v531] and (((v340.submitted[v531] == v532) and "+") or "?")) or "-";
					table.insert(v511, v531 .. ":" .. v532 .. v533);
				end
				table.sort(v511, function(v534, v535)
					return tonumber(v534:match(LUAOBFUSACTOR_DECRYPT_STR_0("\51\17\114\58\110\177\87", "\152\109\57\87\94\69"))) < tonumber(v535:match(LUAOBFUSACTOR_DECRYPT_STR_0("\199\159\79\167\245\155\14", "\200\153\183\106\195\222\178\52")));
				end);
				local v512 = tostring(math.floor(v340.anxiety));
				if v340.pencilMode then
					v512 = v512 .. LUAOBFUSACTOR_DECRYPT_STR_0("\114\171\184\24\103\121\27\207\193", "\58\82\131\232\93\41");
				end
				if v340.anxPaused then
					v512 = v512 .. LUAOBFUSACTOR_DECRYPT_STR_0("\195\31\192\20\72\44\134\83\153", "\95\227\55\176\117\61");
				end
				if v340.dead then
					v512 = v512 .. LUAOBFUSACTOR_DECRYPT_STR_0("\88\69\7\110\138\60\67", "\203\120\30\67\43");
				end
				if v340.cycleActive then
					v512 = v512 .. LUAOBFUSACTOR_DECRYPT_STR_0("\177\30\125\199\246\197\10\112", "\185\145\69\45\143");
				end
				local v513 = table.concat(v511, LUAOBFUSACTOR_DECRYPT_STR_0("\202\95", "\188\234\127\121\198"));
				local v514 = {};
				for v536 = math.max(1, #v340.log - 6), #v340.log do
					if v340.log[v536] then
						table.insert(v514, v340.log[v536]);
					end
				end
				local v515 = table.concat(v514, "\n");
				pcall(function()
					local v537 = _G.BOT_FLUENT;
					if (not v537 or not v537.durumPar) then
						return;
					end
					local v538 = string.format("%s | Seq %s\nQuestions: %s | Phone: %s %s", tostring(v324:GetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\31\51\30\134\11\38\18\151\45\33", "\227\88\82\115"))), tostring(v324:GetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\98\12\169\162\17\96\78\26\180\179\49\118\82\10\191\169\1\118\106\27", "\19\35\127\218\199\98"))), tostring(v340.totalQ or 0), tostring(v340.phoneState or "-"), (v340.cycleActive and LUAOBFUSACTOR_DECRYPT_STR_0("\39\207\43\201\53\213\45\162\44\211\37\214\51\198", "\130\124\155\106")) or "");
					if (v538 ~= v537.lastInfoText) then
						v537.lastInfoText = v538;
						v537.durumPar:SetContent(v538);
					end
					local v539 = tostring(v340.teacherInfo or "?") .. ((v340.dead and "\n!! DEAD / CAUGHT !!") or "");
					if (v539 ~= v537.lastOgText) then
						v537.lastOgText = v539;
						v537.ogretmenPar:SetContent(v539);
					end
					local v540 = v512 .. (((v340.abortCount > 0) and ("\nAborts: " .. v340.abortCount)) or "");
					if (v540 ~= v537.lastKayText) then
						v537.lastKayText = v540;
						v537.kaygiPar:SetContent(v540);
					end
					local v541 = string.format("Correct: %d / Wrong: %d\nKnown: %d/%s", v340.correctCount, v340.wrongCount, #v511, tostring(v340.totalQ or "?"));
					if (v541 ~= v537.lastKaText) then
						v537.lastKaText = v541;
						v537.kagitPar:SetContent(v541);
					end
					if (v513 ~= v537.lastKeyText) then
						v537.lastKeyText = v513;
						v537.keyPar:SetContent(((v513 ~= "") and v513) or LUAOBFUSACTOR_DECRYPT_STR_0("\251\196\182\174\173\229\107\186\199\216\182\182\166\226", "\223\181\171\150\207\195\150\28"));
					end
					if (v515 ~= v537.lastLogText) then
						v537.lastLogText = v515;
						v537.logPar:SetContent(v515);
					end
				end);
			end);
			task.wait(0.5);
		end
	end);
	v340.forensics = {};
	task.spawn(function()
		while v340.enabled do
			pcall(function()
				local v516 = v347();
				local v517 = v325.Character;
				if (v516 and v517) then
					local v574 = v516:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\100\47\238\175\7\67\51\231\156\6\67\46\211\175\27\88", "\105\44\90\131\206"));
					local v575 = v516:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\215\229\179\189", "\94\159\128\210\217\104"));
					local v576 = v517:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\120\236\11\190\81\112\240\126", "\26\48\153\102\223\63\31\153"));
					local v577 = (v576 and v576.SeatPart) or v517.PrimaryPart;
					if (v574 and v577) then
						local v623 = v577.Position - v574.Position;
						local v624 = {t=(math.floor(os.clock() * 10) / 10),d=(math.floor(v623.Magnitude * 10) / 10),[LUAOBFUSACTOR_DECRYPT_STR_0("\0\68", "\147\98\32\141")]=(math.floor(v574.CFrame.LookVector:Dot(v623.Unit) * 100) / 100),[LUAOBFUSACTOR_DECRYPT_STR_0("\16\71", "\43\120\35\131\170\102\54")]=((v575 and (math.floor(v575.CFrame.LookVector:Dot(v623.Unit) * 100) / 100)) or -99),[LUAOBFUSACTOR_DECRYPT_STR_0("\66\3\139", "\228\52\102\231\214\197\208")]=(math.floor(v574.AssemblyLinearVelocity.Magnitude * 10) / 10),[LUAOBFUSACTOR_DECRYPT_STR_0("\14\232", "\182\126\128\21\170\138\235\121")]=((v517:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\187\210\58\232\131\66", "\102\235\186\85\134\230\115\80")) and 1) or 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\86\2\55\82", "\66\55\108\94\63\18\180")]=((v517:GetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\61\158\181\59\38\64\29\131\130\22\41\80\25\140\145\62\40\87", "\57\116\237\229\87\71")) and 1) or 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\169\176\224\222\118\249", "\39\202\209\141\135\23\142")]=math.floor(v517:GetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\220\50\4\15\32\249\211\60\6\1\11\249\232\23\12\13\32\253\250\32", "\152\159\83\105\106\82")) or 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\146\210", "\60\225\166\49\146\169")]=((v517:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\31\22\32\36\4\86", "\103\79\126\79\74\97")) and tostring(v517.Phone1:GetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\138\119\220\125\91\41\174\126\199\118", "\122\218\31\179\19\62")))) or "-")};
						table.insert(v340.forensics, v624);
						if (#v340.forensics > 120) then
							table.remove(v340.forensics, 1);
						end
					end
				end
			end);
			task.wait(0.1);
		end
	end);
	v325:GetAttributeChangedSignal(LUAOBFUSACTOR_DECRYPT_STR_0("\144\215\216\198\193\181\102\187\211\204\213\192\175\66\135\196\204\207\218\168\81\186\217\195\224\202\181\76\165\211", "\37\211\182\173\161\169\193")):Connect(function()
		if ((v325:GetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\212\59\88\222\32\111\154\255\63\76\205\33\117\190\195\40\76\215\59\114\173\254\53\67\248\43\111\176\225\63", "\217\151\90\45\185\72\27")) == true) and _G.BOT) then
			_G.BOT.CAUGHT_DUMP = table.clone(_G.BOT.forensics);
			table.insert(_G.BOT.log, LUAOBFUSACTOR_DECRYPT_STR_0("\250\93\204\51\122\226\82\195\59\125\130\60\230\22\90\202\60\236\19\79\202\104\167\22\89\205\120\242\0\67\207\120\242\82\30", "\54\163\28\135\114") .. #_G.BOT.CAUGHT_DUMP .. LUAOBFUSACTOR_DECRYPT_STR_0("\104\208\92\155\71\107\97", "\31\72\187\61\226\46"));
		end
	end);
	v341(LUAOBFUSACTOR_DECRYPT_STR_0("\225\9\87\146\84\106\37\209\18\70\214", "\68\163\102\35\178\39\30"));
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\133\83\223\209\2\165\161\30\170\101\231\135\21\236\205\66\254\113\217\211\10\163\134", "\113\222\16\186\167\99\213\227"));
	local v353, v354 = pcall(function()
		if not v12 then
			error(LUAOBFUSACTOR_DECRYPT_STR_0("\8\2\238\243\32\26\187\242\33\25\245\250\33\15\255\182\40\15\242\250\43\10\187\190\125\78\250\226\58\11\246\230\58\29\178\172\110", "\150\78\110\155") .. tostring(fluentErr));
		end
		local v420 = v12:CreateWindow({[LUAOBFUSACTOR_DECRYPT_STR_0("\177\204\51\237\161", "\32\229\165\71\129\196\126\223")]=LUAOBFUSACTOR_DECRYPT_STR_0("\224\129\193\128\149\149\225\134\208", "\181\163\233\164\225\225"),[LUAOBFUSACTOR_DECRYPT_STR_0("\99\158\60\67\89\159\50\114", "\23\48\235\94")]=LUAOBFUSACTOR_DECRYPT_STR_0("\126\195\152\71\78\61\215\100\222\221\75", "\178\28\186\184\61\55\83"),[LUAOBFUSACTOR_DECRYPT_STR_0("\247\196\93\57", "\149\164\173\39\92\146\110")]=UDim2.fromOffset(600, 440),[LUAOBFUSACTOR_DECRYPT_STR_0("\199\38\18\40\19\31\231\47", "\123\147\71\112\127\122")]=160,[LUAOBFUSACTOR_DECRYPT_STR_0("\248\197\135\124\67", "\38\172\173\226\17")]=LUAOBFUSACTOR_DECRYPT_STR_0("\105\16\62\228", "\143\45\113\76")});
		v12.GUI.DescendantAdded:Connect(function(v451)
			if (v451:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\140\189\4\40\148\185\30\57\180", "\92\216\216\124")) or v451:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\111\55\180\84\223\78\38\184\79\243", "\157\59\82\204\32")) or v451:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\12\59\251\238\203\229\203", "\209\88\94\131\154\137\138\179"))) then
				v451.AutoLocalize = false;
			end
		end);
		for v452, v453 in ipairs(v12.GUI:GetDescendants()) do
			if (v453:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\28\164\220\104\50\34\51\39\36", "\66\72\193\164\28\126\67\81")) or v453:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\211\41\176\76\4\99\243\56\167\86", "\22\135\76\200\56\70")) or v453:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\185\53\224\48\127\238\149", "\129\237\80\152\68\61"))) then
				v453.AutoLocalize = false;
			end
		end
		local v421 = LUAOBFUSACTOR_DECRYPT_STR_0("\67\170\28\231\20\2\85\83\242\75\188\8\14\72\84\245\37\229\29\3\89\67\128\1\242\24\36\80\94\188\66\250\24\74", "\56\49\200\100\147\124\119") .. v325.UserId .. LUAOBFUSACTOR_DECRYPT_STR_0("\138\41\226\161\153\110\249\248\145\111\234\160", "\144\172\94\223");
		local v422 = {[LUAOBFUSACTOR_DECRYPT_STR_0("\9\14\171\73", "\39\68\111\194")]=v420:CreateTab({[LUAOBFUSACTOR_DECRYPT_STR_0("\226\175\243\203\124", "\215\182\198\135\167\25")]=LUAOBFUSACTOR_DECRYPT_STR_0("\169\72\249\64\143\70\235\90\137", "\40\237\41\138"),[LUAOBFUSACTOR_DECRYPT_STR_0("\238\119\245\246", "\42\167\20\154\152")]=v421}),[LUAOBFUSACTOR_DECRYPT_STR_0("\97\251\187", "\65\42\158\194\34\17")]=v420:CreateTab({[LUAOBFUSACTOR_DECRYPT_STR_0("\46\46\70\0\40", "\142\122\71\50\108\77\141\123")]=LUAOBFUSACTOR_DECRYPT_STR_0("\52\172\236\15\62\7\226\212\29\34", "\91\117\194\159\120"),[LUAOBFUSACTOR_DECRYPT_STR_0("\51\30\49\22", "\68\122\125\94\120\85\145")]=LUAOBFUSACTOR_DECRYPT_STR_0("\28\25\214", "\218\119\124\175\62\168\185")}),[LUAOBFUSACTOR_DECRYPT_STR_0("\150\245\92", "\164\197\144\40")]=v420:CreateTab({[LUAOBFUSACTOR_DECRYPT_STR_0("\183\249\190\135\216", "\214\227\144\202\235\189")]=LUAOBFUSACTOR_DECRYPT_STR_0("\222\160\147\111\25\189\84\47", "\92\141\197\231\27\112\211\51"),[LUAOBFUSACTOR_DECRYPT_STR_0("\207\252\133\173", "\177\134\159\234\195")]=LUAOBFUSACTOR_DECRYPT_STR_0("\174\238\43\180\192\179\236\44", "\169\221\139\95\192")}),[LUAOBFUSACTOR_DECRYPT_STR_0("\242\132\120", "\70\190\235\31\95\66")]=v420:CreateTab({[LUAOBFUSACTOR_DECRYPT_STR_0("\142\235\14\234\224", "\133\218\130\122\134")]=LUAOBFUSACTOR_DECRYPT_STR_0("\16\240\228\215", "\88\92\159\131\164\188\195"),[LUAOBFUSACTOR_DECRYPT_STR_0("\169\45\176\69", "\189\224\78\223\43\183\139")]=LUAOBFUSACTOR_DECRYPT_STR_0("\62\244\133\5\209\38\243\152\91\205\39\239\158\91\195\33\240\142", "\161\78\156\234\118")})};
		local v423 = LUAOBFUSACTOR_DECRYPT_STR_0("\151\187\200\197\162\165\147\156", "\188\199\215\169") .. v325.DisplayName .. LUAOBFUSACTOR_DECRYPT_STR_0("\188\65\127", "\136\156\105\63\27") .. v325.Name .. ")\nMade by zynexdev";
		local v424 = v422.Main:CreateParagraph(LUAOBFUSACTOR_DECRYPT_STR_0("\43\158\118\50\18\128\124", "\84\123\236\25"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\196\130\190\27\169", "\213\144\235\202\119\204")]=LUAOBFUSACTOR_DECRYPT_STR_0("\19\10\209\44\33\47\72", "\45\67\120\190\74\72\67"),[LUAOBFUSACTOR_DECRYPT_STR_0("\3\45\227\177\252\134\250", "\137\64\66\141\197\153\232\142")]=v423});
		local v425 = v422.Main:CreateParagraph(LUAOBFUSACTOR_DECRYPT_STR_0("\39\197\48\179\133", "\232\99\176\66\198"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\216\40\60\10\126", "\76\140\65\72\102\27\237\153")]=LUAOBFUSACTOR_DECRYPT_STR_0("\121\206\23\198\194\18", "\222\42\186\118\178\183\97"),[LUAOBFUSACTOR_DECRYPT_STR_0("\126\227\74\158\88\226\80", "\234\61\140\36")]=LUAOBFUSACTOR_DECRYPT_STR_0("\50\201\187\96\27\40\211\189\60\65\111", "\111\65\189\218\18")});
		local v426 = v422.Main:CreateParagraph(LUAOBFUSACTOR_DECRYPT_STR_0("\119\78\26\54\3\89\189", "\207\35\43\123\85\107\60"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\68\163\180\230\124", "\25\16\202\192\138")]=LUAOBFUSACTOR_DECRYPT_STR_0("\201\206\172\225\161\241\239", "\148\157\171\205\130\201"),[LUAOBFUSACTOR_DECRYPT_STR_0("\0\219\122\61\212\248\55", "\150\67\180\20\73\177")]="-"});
		local v427 = v422.Main:CreateParagraph(LUAOBFUSACTOR_DECRYPT_STR_0("\172\22\2\68\136\12\3", "\45\237\120\122"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\227\225\182\32\210", "\76\183\136\194")]=LUAOBFUSACTOR_DECRYPT_STR_0("\91\232\253\49\85\91\13", "\116\26\134\133\88\48\47"),[LUAOBFUSACTOR_DECRYPT_STR_0("\61\206\174\240\184\124\10", "\18\126\161\192\132\221")]="-"});
		local v428 = v422.Main:CreateParagraph(LUAOBFUSACTOR_DECRYPT_STR_0("\111\41\190\1\68", "\54\63\72\206\100"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\252\80\81\118\224", "\27\168\57\37\26\133")]=LUAOBFUSACTOR_DECRYPT_STR_0("\29\171\108\173\197", "\183\77\202\28\200"),[LUAOBFUSACTOR_DECRYPT_STR_0("\52\60\135\28\18\61\157", "\104\119\83\233")]="-"});
		v422.Main:CreateToggle(LUAOBFUSACTOR_DECRYPT_STR_0("\212\237\51\45\115\253\247\51\45", "\35\149\152\71\66"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\45\225\86\188\63", "\90\121\136\34\208")]=LUAOBFUSACTOR_DECRYPT_STR_0("\230\27\65\17\135\62\93\17\211\1", "\126\167\110\53"),[LUAOBFUSACTOR_DECRYPT_STR_0("\25\21\61\251\206\54\45\4\39\247\210", "\95\93\112\78\152\188")]=LUAOBFUSACTOR_DECRYPT_STR_0("\231\244\151\24\247\254\211\207\230\146\16\246\173\146\215\252\132\85\244\182\221\207\240\197\2\236\187\220\129\225\128\20\231\182\215\211\181\140\6\164\173\211\199\240", "\178\161\149\229\117\132\222"),[LUAOBFUSACTOR_DECRYPT_STR_0("\172\222\219\173\180\26\178", "\67\232\187\189\204\193\118\198")]=true});
		v422.Main:CreateToggle(LUAOBFUSACTOR_DECRYPT_STR_0("\187\47\160\51\62", "\143\235\78\213\64\91\98"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\185\65\144\229\117", "\214\237\40\228\137\16")]=LUAOBFUSACTOR_DECRYPT_STR_0("\181\226\250\202\6", "\198\229\131\143\185\99"),[LUAOBFUSACTOR_DECRYPT_STR_0("\117\137\187\112\67\133\184\103\88\131\166", "\19\49\236\200")]=LUAOBFUSACTOR_DECRYPT_STR_0("\202\50\251\167\235\168\255\37\255\187\253\250\237\35\249\167\247\250\255\59\250\247\229\175\234\56\251\182\240\179\241\57", "\218\158\87\150\215\132"),[LUAOBFUSACTOR_DECRYPT_STR_0("\223\27\223\227\35\46\217", "\173\155\126\185\130\86\66")]=false});
		v422.Main({[LUAOBFUSACTOR_DECRYPT_STR_0("\209\175\174\203\141", "\140\133\198\218\167\232")]=LUAOBFUSACTOR_DECRYPT_STR_0("\144\63\161\116\148\245\30\177\115\135\188\34", "\228\213\78\212\29"),[LUAOBFUSACTOR_DECRYPT_STR_0("\163\73\165\6\249\142\92\162\12\228\137", "\139\231\44\214\101")]=LUAOBFUSACTOR_DECRYPT_STR_0("\245\224\9\85\80\184\63\24\214\236\3\80\4\253\113\4\220\235\19\93\21\241\48\24\193\230\3\74\9", "\118\185\143\102\62\112\209\81"),[LUAOBFUSACTOR_DECRYPT_STR_0("\127\113\37\234\167\20\31\51", "\88\60\16\73\134\197\117\124")]=function()
			v344(true);
		end});
		v422.Main({[LUAOBFUSACTOR_DECRYPT_STR_0("\100\227\236\196\68", "\33\48\138\152\168")]=LUAOBFUSACTOR_DECRYPT_STR_0("\94\25\39\84\211\119\66\30\63\95\196\119\58\23\50\94\211\35\59", "\87\18\118\80\49\161"),[LUAOBFUSACTOR_DECRYPT_STR_0("\104\27\201\163\162\69\14\206\169\191\66", "\208\44\126\186\192")]=LUAOBFUSACTOR_DECRYPT_STR_0("\199\15\176\213\84\232\193\75\183\10\172\201\26\249\137\74\248\13\170\134\29\241\196\75\243\19\165\210\17\240\208", "\46\151\122\196\166\116\156\169"),[LUAOBFUSACTOR_DECRYPT_STR_0("\198\236\74\22\249\228\238\77", "\155\133\141\38\122")]=function()
			v343();
			if _G.BOT.cycleActive then
				_G.BOT.cycleActive = false;
				_G.BOT.lastAbortAt = os.clock();
				_G.BOT.abortCount = _G.BOT.abortCount + 1;
			end
		end});
		local v429 = v422.Key:CreateParagraph(LUAOBFUSACTOR_DECRYPT_STR_0("\14\47\181\119\70\122\178", "\197\69\74\204\33\47\31"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\196\70\78\139\245", "\231\144\47\58")]=LUAOBFUSACTOR_DECRYPT_STR_0("\147\214\201\98\29\47\143\18\183\193", "\89\210\184\186\21\120\93\175"),[LUAOBFUSACTOR_DECRYPT_STR_0("\146\92\114\193\124\52\165", "\90\209\51\28\181\25")]=LUAOBFUSACTOR_DECRYPT_STR_0("\254\116\23\239\177\195\108\82\252\172\144\98\82\250", "\223\176\27\55\142")});
		local v430 = v422.Key:CreateParagraph(LUAOBFUSACTOR_DECRYPT_STR_0("\23\175\207\161\55", "\213\68\219\174"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\63\233\55\235\47", "\31\107\128\67\135\74\165\95")]=LUAOBFUSACTOR_DECRYPT_STR_0("\235\252\253\89\82", "\209\184\136\156\45\33"),[LUAOBFUSACTOR_DECRYPT_STR_0("\36\199\123\28\189\9\220", "\216\103\168\21\104")]=LUAOBFUSACTOR_DECRYPT_STR_0("\91\162\81\182\125\174\87\254\56\253\3\235\56\154\81\171\118\170\25\228\40", "\196\24\205\35")});
		v422.Set:CreateSlider(LUAOBFUSACTOR_DECRYPT_STR_0("\29\159\226\4\34\142\215\15\35\142", "\102\78\235\131"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\206\39\32\72\66", "\84\154\78\84\36\39\89\215")]=LUAOBFUSACTOR_DECRYPT_STR_0("\206\245\87\90\9\248\161\101\89\3\248\245\79\24\50\244\239\82\87\18\189\169\69\17", "\101\157\129\54\56"),[LUAOBFUSACTOR_DECRYPT_STR_0("\57\172\153\168\49\112\13\189\131\164\45", "\25\125\201\234\203\67")]=LUAOBFUSACTOR_DECRYPT_STR_0("\90\251\22\23\29\41\6\118\225\11\67\7\38\21\124\180\12\10\25\34\83\107\241\9\22\29\53\22\125\180\26\6\18\40\1\124\180\8\11\27\51\28", "\115\25\148\120\99\116\71"),[LUAOBFUSACTOR_DECRYPT_STR_0("\40\56\191\37\84\0\41", "\33\108\93\217\68")]=0.8,[LUAOBFUSACTOR_DECRYPT_STR_0("\246\66\175", "\205\187\43\193")]=0,[LUAOBFUSACTOR_DECRYPT_STR_0("\211\115\29", "\191\158\18\101")]=3,[LUAOBFUSACTOR_DECRYPT_STR_0("\247\204\146\185\171\204\205\128", "\207\165\163\231\215")]=1,[LUAOBFUSACTOR_DECRYPT_STR_0("\229\248\245\90\38\113\197\242", "\16\166\153\153\54\68")]=function(v454)
			_G.BOT_TUNES = _G.BOT_TUNES or {};
			_G.BOT_TUNES.STABLE_TIME = v454;
		end});
		v422.Set:CreateSlider(LUAOBFUSACTOR_DECRYPT_STR_0("\244\178\195\67\25\36\244\221\161\217", "\153\178\211\160\38\84\65"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\182\2\78\39\135", "\75\226\107\58")]=LUAOBFUSACTOR_DECRYPT_STR_0("\126\223\18\127\81\239\200\85\209\3\99\81\138\222\17", "\173\56\190\113\26\113\162"),[LUAOBFUSACTOR_DECRYPT_STR_0("\239\219\62\6\229\194\206\57\12\248\197", "\151\171\190\77\101")]=LUAOBFUSACTOR_DECRYPT_STR_0("\242\46\241\189\184\105\2\200\42\184\168\254\105\14\215\111\236\172\249\126\3\192\61\184\165\247\114\0\192\43\184\168\236\61\30\214", "\107\165\79\152\201\152\29"),[LUAOBFUSACTOR_DECRYPT_STR_0("\115\75\238\202\65\115\67", "\31\55\46\136\171\52")]=1.2,[LUAOBFUSACTOR_DECRYPT_STR_0("\252\33\210", "\148\177\72\188")]=0,[LUAOBFUSACTOR_DECRYPT_STR_0("\139\183\79", "\179\198\214\55")]=5,[LUAOBFUSACTOR_DECRYPT_STR_0("\194\3\103\120\65\218\254\11", "\179\144\108\18\22\37")]=1,[LUAOBFUSACTOR_DECRYPT_STR_0("\229\162\23\133\205\199\160\16", "\175\166\195\123\233")]=function(v455)
			_G.BOT_TUNES = _G.BOT_TUNES or {};
			_G.BOT_TUNES.FACE_MEMORY = v455;
		end});
		v422.Set:CreateSlider(LUAOBFUSACTOR_DECRYPT_STR_0("\204\219\94\69\245\204\205\82\69\244\224\213\83", "\144\143\162\61\41"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\212\218\9\92\119", "\83\128\179\125\48\18\231")]=LUAOBFUSACTOR_DECRYPT_STR_0("\126\174\240\209\66\94\126\184\252\209\67\17\74\185\179\149\84\87", "\126\61\215\147\189\39"),[LUAOBFUSACTOR_DECRYPT_STR_0("\92\250\14\70\106\246\13\81\113\240\19", "\37\24\159\125")]=LUAOBFUSACTOR_DECRYPT_STR_0("\247\175\123\75\215\179\120\2\205\167\124\86\154\167\115\86\223\180\53\82\210\169\97\77\149\167\119\77\200\178", "\34\186\198\21"),[LUAOBFUSACTOR_DECRYPT_STR_0("\220\13\195\92\215\244\28", "\162\152\104\165\61")]=2.5,[LUAOBFUSACTOR_DECRYPT_STR_0("\224\38\188", "\133\173\79\210\29\16")]=0,[LUAOBFUSACTOR_DECRYPT_STR_0("\160\125\245", "\75\237\28\141")]=10,[LUAOBFUSACTOR_DECRYPT_STR_0("\238\80\217\191\43\18\233\230", "\129\188\63\172\209\79\123\135")]=1,[LUAOBFUSACTOR_DECRYPT_STR_0("\99\229\234\193\66\229\229\198", "\173\32\132\134")]=function(v456)
			_G.BOT_TUNES = _G.BOT_TUNES or {};
			_G.BOT_TUNES.CYCLE_COOLDOWN = v456;
		end});
		v422.Set:CreateSlider(LUAOBFUSACTOR_DECRYPT_STR_0("\126\30\6\236\167\61\249\70\9\13\252\166\62\193\74", "\173\46\123\104\143\206\81"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\128\20\54\134\64", "\97\212\125\66\234\37\227")]=LUAOBFUSACTOR_DECRYPT_STR_0("\171\237\174\60\27\158\250\236\117\46\143\237\181\60\18\202\215\190\39\27\153\235\185\57\26", "\126\234\131\214\85"),[LUAOBFUSACTOR_DECRYPT_STR_0("\160\208\90\89\93\141\197\93\83\64\138", "\47\228\181\41\58")]=LUAOBFUSACTOR_DECRYPT_STR_0("\135\233\205\52\78\53\14\179\245\201\40\67\32\26\168\255\208\55\67\49\11\230\232\209\50\16\112\30\168\228\208\62\23\41\95\170\249\207\62\15", "\127\198\156\185\91\99\80"),[LUAOBFUSACTOR_DECRYPT_STR_0("\209\31\202\241\178\7\45", "\190\149\122\172\144\199\107\89")]=85,[LUAOBFUSACTOR_DECRYPT_STR_0("\31\12\255", "\158\82\101\145\158")]=50,[LUAOBFUSACTOR_DECRYPT_STR_0("\93\255\26", "\36\16\158\98\118")]=95,[LUAOBFUSACTOR_DECRYPT_STR_0("\242\25\214\245\92\225\41\226", "\133\160\118\163\155\56\136\71")]=0,[LUAOBFUSACTOR_DECRYPT_STR_0("\213\163\125\254\180\30\182\253", "\213\150\194\17\146\214\127")]=function(v457)
			_G.BOT_TUNES = _G.BOT_TUNES or {};
			_G.BOT_TUNES.ANXIETY_PENCIL = v457;
		end});
		local v431 = v422.Log:CreateParagraph(LUAOBFUSACTOR_DECRYPT_STR_0("\55\166\163\226\79\161\181", "\86\123\201\196\180\38\196\194"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\195\225\205\163\242", "\207\151\136\185")]=LUAOBFUSACTOR_DECRYPT_STR_0("\154\134\43\135\122\108\49\141\149\45\140\96\107", "\17\200\227\72\226\20\24"),[LUAOBFUSACTOR_DECRYPT_STR_0("\147\78\21\195\204\255\251", "\159\208\33\123\183\169\145\143")]=LUAOBFUSACTOR_DECRYPT_STR_0("\225\78\57\36\230\83\54\49\188\20\118", "\86\146\58\88")});
		local v432 = v12.Options;
		if v432.AutoPhoto then
			v432.AutoPhoto:OnChanged(function()
				if _G.BOT then
					_G.BOT.doPhoto = v432.AutoPhoto.Value;
				end
			end);
		end
		if v432.Pause then
			v432.Pause:OnChanged(function()
				if _G.BOT then
					_G.BOT.pause = v432.Pause.Value;
				end
			end);
		end
		_G.BOT_CLEANUP = function()
			pcall(function()
				v12:Destroy();
			end);
		end;
		local v433, v434 = pcall(function()
			local v458 = loadstring(game:HttpGetAsync(LUAOBFUSACTOR_DECRYPT_STR_0("\80\203\254\208\189\179\121\181\74\222\253\142\169\224\34\242\77\221\255\211\171\251\53\245\86\203\239\206\186\167\53\245\85\144\231\217\166\236\63\233\93\209\232\197\188\238\121\220\84\202\239\206\186\164\4\255\86\218\253\197\170\166\59\251\81\209\165\225\170\237\57\244\75\144\217\193\184\236\27\251\86\222\237\197\188\167\58\239\89\202", "\154\56\191\138\160\206\137\86")))();
			local v459 = loadstring(game:HttpGetAsync(LUAOBFUSACTOR_DECRYPT_STR_0("\142\77\225\151\111\96\206\131\148\88\226\201\123\51\149\196\147\91\224\148\121\40\130\195\136\77\240\137\104\116\130\195\139\22\248\158\116\63\136\223\131\87\247\130\110\61\206\234\138\76\240\137\104\119\179\201\136\92\226\130\120\117\140\205\143\87\186\166\120\62\142\194\149\22\220\137\104\63\147\202\135\90\240\170\125\52\128\203\131\75\187\139\105\59\148", "\172\230\57\149\231\28\90\225")))();
			v458:SetLibrary(v12);
			v459:SetLibrary(v12);
			v458:IgnoreThemeSettings();
			v458:SetIgnoreIndexes({});
			v459:SetFolder(LUAOBFUSACTOR_DECRYPT_STR_0("\33\162\131\211\60\249\13\190", "\187\98\202\230\178\72"));
			v458:SetFolder(LUAOBFUSACTOR_DECRYPT_STR_0("\2\233\161\49\94\3\238\176\127\94\36\242\176\125\89\40\243\165\35\67\47\229\165\125\66\40\237\161", "\42\65\129\196\80"));
			v459:BuildInterfaceSection(v422.Set);
			v458:BuildConfigSection(v422.Set);
			v458:LoadAutoloadConfig();
			_G.BOT_SAVEMANAGER = v458;
			_G.BOT_INTERFACEMANAGER = v459;
			v341(LUAOBFUSACTOR_DECRYPT_STR_0("\35\78\89\213\25\20\66\252\7\75\89\195\77\71\49\239\20\79\112\219\25\6\5\235\16\10\22\154\62\9\22\235\16\76\92\217\18\42\3\224\3\77\88\200", "\142\98\42\61\186\119\103\98"));
		end);
		if not v433 then
			v341(LUAOBFUSACTOR_DECRYPT_STR_0("\25\187\6\7\54\255\39\58\10\144\48\82\120", "\104\88\223\98") .. tostring(v434));
			print(LUAOBFUSACTOR_DECRYPT_STR_0("\127\212\231\216\3\253\102\248\246\219\63\173\101\243\230\193\12\173\97\197\208\225\48\183\4", "\141\36\151\130\174\98") .. tostring(v434));
		end
		_G.BOT_FLUENT = {[LUAOBFUSACTOR_DECRYPT_STR_0("\179\115\204\9\139\109", "\109\228\26\162")]=v420,[LUAOBFUSACTOR_DECRYPT_STR_0("\78\247\242\126\233\234\91\213\252\106", "\134\62\133\157\24\128")]=v424,[LUAOBFUSACTOR_DECRYPT_STR_0("\3\176\8\204\34\129\215\21", "\182\103\197\122\185\79\209")]=v425,[LUAOBFUSACTOR_DECRYPT_STR_0("\252\128\243\114\20\69\246\137\209\118\18", "\40\147\231\129\23\96")]=v426,[LUAOBFUSACTOR_DECRYPT_STR_0("\126\249\149\66\178\156\221\103", "\188\21\152\236\37\219\204")]=v427,[LUAOBFUSACTOR_DECRYPT_STR_0("\75\232\48\5\84\217\54\30", "\108\32\137\87")]=v428,[LUAOBFUSACTOR_DECRYPT_STR_0("\161\237\25\150\46\235", "\57\202\136\96\198\79\153\43")]=v429,[LUAOBFUSACTOR_DECRYPT_STR_0("\162\48\190\166\153\174\235\191\42\161\151\140\181", "\152\203\67\202\199\237\199")]=v430,[LUAOBFUSACTOR_DECRYPT_STR_0("\246\76\167\63\30\103", "\134\154\35\192\111\127\21\25")]=v431,[LUAOBFUSACTOR_DECRYPT_STR_0("\180\39\26\30\9\220\190\41\61\15\56\198", "\178\216\70\105\106\64")]="",[LUAOBFUSACTOR_DECRYPT_STR_0("\51\42\105\226\226\208\205\180\58\51\110", "\224\95\75\26\150\169\181\180")]="",[LUAOBFUSACTOR_DECRYPT_STR_0("\7\219\203\60\104\163\113\63\223\192\60", "\22\107\186\184\72\36\204")]="",[LUAOBFUSACTOR_DECRYPT_STR_0("\235\188\55\90\33\224\137\33\86\26", "\110\135\221\68\46")]="",[LUAOBFUSACTOR_DECRYPT_STR_0("\239\55\31\255\229\178\34\215\51\20\255", "\91\131\86\108\139\174\211")]="",[LUAOBFUSACTOR_DECRYPT_STR_0("\247\42\171\3\118\250\31\189\15\73", "\61\155\75\216\119")]=""};
		v325:GetAttributeChangedSignal(LUAOBFUSACTOR_DECRYPT_STR_0("\39\170\167\59\80\29\254\12\174\179\40\81\7\218\48\185\179\50\75\0\201\13\164\188\29\91\29\212\18\174", "\189\100\203\210\92\56\105")):Connect(function()
			if (v325:GetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\12\80\232\47\39\69\222\32\42\80\233\33\33\86\201\58\46\95\238\33\59\88\242\38\14\82\233\33\57\84", "\72\79\49\157")) == true) then
				pcall(function()
					v12:Notify({[LUAOBFUSACTOR_DECRYPT_STR_0("\188\185\37\176\141", "\220\232\208\81")]=LUAOBFUSACTOR_DECRYPT_STR_0("\214\159\208\23\4\110\224", "\193\149\222\133\80\76\58"),[LUAOBFUSACTOR_DECRYPT_STR_0("\229\82\65\198\195\83\91", "\178\166\61\47")]=LUAOBFUSACTOR_DECRYPT_STR_0("\221\69\250\127\196\45\242\73\168\126\223\51\235\10\251\123\220\59\255", "\94\155\42\136\26\170"),[LUAOBFUSACTOR_DECRYPT_STR_0("\160\42\52\180\144\54\41\187", "\213\228\95\70")]=6});
				end);
			end
		end);
		v420:SelectTab(1);
		v12:Notify({[LUAOBFUSACTOR_DECRYPT_STR_0("\30\178\214\136\114", "\23\74\219\162\228")]=LUAOBFUSACTOR_DECRYPT_STR_0("\26\238\67\174\47\121\196\73\187\123\47\191\8\252", "\91\89\134\38\207"),[LUAOBFUSACTOR_DECRYPT_STR_0("\103\225\198\34\22\222\51", "\71\36\142\168\86\115\176")]=LUAOBFUSACTOR_DECRYPT_STR_0("\242\160\118\186\67\188\79\9\197\184\124\186\27\186\83\95", "\41\191\193\18\223\99\222\54"),[LUAOBFUSACTOR_DECRYPT_STR_0("\143\51\213\43\190\162\41\201", "\202\203\70\167\74")]=4});
		v341(LUAOBFUSACTOR_DECRYPT_STR_0("\10\13\201\54\127\56\65\251\6\88\108\19\217\50\117\53", "\17\76\97\188\83"));
	end);
	if not v353 then
		v341(LUAOBFUSACTOR_DECRYPT_STR_0("\162\18\240\119\21\177\121\140\183\125\153", "\195\229\71\185\87\80\227\43") .. tostring(v354));
		print(LUAOBFUSACTOR_DECRYPT_STR_0("\219\223\5\70\238\240\222\15\68\250\221\188\39\101\198\160\217\50\98\192\210\166\64", "\143\128\156\96\48") .. tostring(v354));
	end
end
v11(v13);