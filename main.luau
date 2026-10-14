-- ============================================================
--  CHEAT DURING TEST - ANSWER KEY BOT v9.3
--  - SINGLE OWNER: only the farmer controls hands
--  - Farmer: equips phone and fires photo in the SAME TICK
--  - Photo watchdog: aborts in 0.15s if teacher turns
--  - Conservative safety: real wall block or walking away
--  - Cycle resets if it stalls over 10s
--  - Auto PENCIL on idle hands (less anxiety, innocent look)
--  Settings:
--    _G.BOT.doPhoto = false / _G.BOT.pause = true / _G.BOT.enabled = false
-- ============================================================

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
local PlayerAnswerTable = ReplicatedStorage:WaitForChild("PlayerAnswerTable")
local ToolAction = ReplicatedStorage.ToolEvents:WaitForChild("ToolAction")
local PlayAnimation = ReplicatedStorage.ToolEvents:WaitForChild("PlayAnimation")
local ShopInventoryAction = ReplicatedStorage:WaitForChild("ShopInventoryAction")

-- SETTINGS (evidence-based: catching = teacher GAZE, not distance)
local SAFE_DISTANCE = 4      -- risk only when right next to you (punch range)
local SAFE_DOT = -0.25       -- head AND body must clearly face away
local STABLE_TIME = 0.8      -- continuous safe time before photo
local FACE_MEMORY = 1.2      -- wait time after teacher looked at us
local CYCLE_COOLDOWN = 2.5   -- min wait after answer/abort
local CYCLE_TIMEOUT = 10     -- cycle resets if not done in this many seconds
local ANXIETY_PAUSE = 60
local ANXIETY_RESUME = 40
local ANXIETY_PENCIL = 85

-- live tuning from GUI sliders (local constant = default)
local function T(name, default)
    local t = _G.BOT_TUNES
    local v = t and t[name]
    if type(v) == "number" then return v end
    return default
end


local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ServiceID = "34572"
local HWID = (gethwid and gethwid()) or (get_hwid and get_hwid()) or (pcall(function() return game:GetService("RbxAnalyticsService"):GetClientId() end) and game:GetService("RbxAnalyticsService"):GetClientId()) or tostring(LocalPlayer.UserId)
local SavePath = "CheatBot_Key.txt"

local function CheckWhitelist(key)
    if not key or key == "" then return false end
    key = string.gsub(key, "^%s*(.-)%s*$", "%1")
    local ok, res = pcall(function()
        return game:HttpGet("https://api.platoboost.net/public/whitelist/" .. ServiceID .. "?identifier=" .. HWID .. "&key=" .. key)
    end)
    if ok and res then
        local decodeOK, data = pcall(function() return HttpService:JSONDecode(res) end)
        if decodeOK and data and data.success and data.data and data.data.valid == true then
            return true
        end
    end
    return false
end

local function GetKeyURL()
    local req = (syn and syn.request) or (http and http.request) or http_request or request or (fluxus and fluxus.request)
    if req then
        local ok, res = pcall(function()
            return req({
                Url = "https://api.platoboost.net/public/start",
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = HttpService:JSONEncode({
                    service = 34572,
                    identifier = HWID
                })
            })
        end)
        if ok and res and res.Body then
            local decodeOK, data = pcall(function() return HttpService:JSONDecode(res.Body) end)
            if decodeOK and data and data.success and data.data and data.data.url then
                return data.data.url
            end
        end
    end
    return "https://gateway.platoboost.com/a/34572?id=" .. HWID
end

local function CreateKeyModal(onSuccess)
    -- Check auto-saved key first
    if isfile and readfile and isfile(SavePath) then
        local savedKey = readfile(SavePath)
        if savedKey and savedKey ~= "" then
            if CheckWhitelist(savedKey) then
                onSuccess()
                return
            end
        end
    end

    local parent = (gethui and gethui()) or CoreGui:FindFirstChild("RobloxGui") or CoreGui
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "CheatBot_AuthModal"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- Main Card
    local Card = Instance.new("Frame")
    Card.Name = "Card"
    Card.Size = UDim2.fromOffset(380, 230)
    Card.AnchorPoint = Vector2.new(0.5, 0.5)
    Card.Position = UDim2.fromScale(0.5, 0.5)
    Card.BackgroundColor3 = Color3.fromRGB(20, 20, 24)
    Card.BorderSizePixel = 0
    Card.Parent = ScreenGui

    local CardCorner = Instance.new("UICorner")
    CardCorner.CornerRadius = UDim.new(0, 14)
    CardCorner.Parent = Card

    local CardStroke = Instance.new("UIStroke")
    CardStroke.Color = Color3.fromRGB(48, 48, 58)
    CardStroke.Thickness = 1.2
    CardStroke.Parent = Card

    -- Top Glow Accent
    local AccentGlow = Instance.new("Frame")
    AccentGlow.Size = UDim2.new(1, 0, 0, 2)
    AccentGlow.Position = UDim2.new(0, 0, 0, 0)
    AccentGlow.BackgroundColor3 = Color3.fromRGB(59, 130, 246)
    AccentGlow.BorderSizePixel = 0
    AccentGlow.Parent = Card

    local AccentGlowCorner = Instance.new("UICorner")
    AccentGlowCorner.CornerRadius = UDim.new(0, 14)
    AccentGlowCorner.Parent = AccentGlow

    -- Header Icon
    local Icon = Instance.new("ImageLabel")
    Icon.Size = UDim2.fromOffset(26, 26)
    Icon.Position = UDim2.fromOffset(22, 20)
    Icon.BackgroundTransparency = 1
    Icon.Image = "rbxassetid://6031086173" -- shield/key icon
    Icon.ImageColor3 = Color3.fromRGB(59, 130, 246)
    Icon.Parent = Card

    -- Title
    local Title = Instance.new("TextLabel")
    Title.Text = "Cheat Bot Authentication"
    Title.TextColor3 = Color3.fromRGB(245, 245, 250)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 15
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Size = UDim2.new(1, -90, 0, 18)
    Title.Position = UDim2.fromOffset(56, 17)
    Title.BackgroundTransparency = 1
    Title.AutoLocalize = false
    Title.Parent = Card

    -- Subtitle
    local Subtitle = Instance.new("TextLabel")
    Subtitle.Text = "24-Hour License • Powered by Platoboost"
    Subtitle.TextColor3 = Color3.fromRGB(140, 140, 155)
    Subtitle.Font = Enum.Font.Gotham
    Subtitle.TextSize = 11
    Subtitle.TextXAlignment = Enum.TextXAlignment.Left
    Subtitle.Size = UDim2.new(1, -90, 0, 14)
    Subtitle.Position = UDim2.fromOffset(56, 36)
    Subtitle.BackgroundTransparency = 1
    Subtitle.AutoLocalize = false
    Subtitle.Parent = Card

    -- Close Button
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.fromOffset(24, 24)
    CloseBtn.Position = UDim2.new(1, -34, 0, 18)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
    CloseBtn.Text = "✕"
    CloseBtn.TextColor3 = Color3.fromRGB(160, 160, 175)
    CloseBtn.Font = Enum.Font.GothamMedium
    CloseBtn.TextSize = 11
    CloseBtn.AutoLocalize = false
    CloseBtn.Parent = Card

    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 6)
    CloseCorner.Parent = CloseBtn

    CloseBtn.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    -- Divider
    local Divider = Instance.new("Frame")
    Divider.Size = UDim2.new(1, -44, 0, 1)
    Divider.Position = UDim2.fromOffset(22, 64)
    Divider.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    Divider.BorderSizePixel = 0
    Divider.Parent = Card

    -- Input Box Frame
    local InputFrame = Instance.new("Frame")
    InputFrame.Size = UDim2.new(1, -44, 0, 42)
    InputFrame.Position = UDim2.fromOffset(22, 78)
    InputFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 32)
    InputFrame.BorderSizePixel = 0
    InputFrame.Parent = Card

    local InputCorner = Instance.new("UICorner")
    InputCorner.CornerRadius = UDim.new(0, 8)
    InputCorner.Parent = InputFrame

    local InputStroke = Instance.new("UIStroke")
    InputStroke.Color = Color3.fromRGB(44, 44, 56)
    InputStroke.Thickness = 1
    InputStroke.Parent = InputFrame

    local TextBox = Instance.new("TextBox")
    TextBox.Size = UDim2.new(1, -24, 1, 0)
    TextBox.Position = UDim2.fromOffset(12, 0)
    TextBox.BackgroundTransparency = 1
    TextBox.PlaceholderText = "Paste your license key here..."
    TextBox.PlaceholderColor3 = Color3.fromRGB(110, 110, 125)
    TextBox.TextColor3 = Color3.fromRGB(240, 240, 245)
    TextBox.Font = Enum.Font.Gotham
    TextBox.TextSize = 12
    TextBox.ClearTextOnFocus = false
    TextBox.TextXAlignment = Enum.TextXAlignment.Left
    TextBox.AutoLocalize = false
    TextBox.Parent = InputFrame

    TextBox.Focused:Connect(function()
        TweenService:Create(InputStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(59, 130, 246)}):Play()
    end)
    TextBox.FocusLost:Connect(function()
        TweenService:Create(InputStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(44, 44, 56)}):Play()
    end)

    -- Status Label
    local Status = Instance.new("TextLabel")
    Status.Text = ""
    Status.TextColor3 = Color3.fromRGB(239, 68, 68)
    Status.Font = Enum.Font.GothamMedium
    Status.TextSize = 10
    Status.TextXAlignment = Enum.TextXAlignment.Left
    Status.Size = UDim2.new(1, -44, 0, 14)
    Status.Position = UDim2.fromOffset(22, 124)
    Status.BackgroundTransparency = 1
    Status.AutoLocalize = false
    Status.Parent = Card

    -- Button Row
    local GetKeyBtn = Instance.new("TextButton")
    GetKeyBtn.Size = UDim2.new(0.48, -4, 0, 38)
    GetKeyBtn.Position = UDim2.fromOffset(22, 146)
    GetKeyBtn.BackgroundColor3 = Color3.fromRGB(32, 32, 40)
    GetKeyBtn.Text = "Get Key (Copy Link)"
    GetKeyBtn.TextColor3 = Color3.fromRGB(200, 200, 215)
    GetKeyBtn.Font = Enum.Font.GothamMedium
    GetKeyBtn.TextSize = 12
    GetKeyBtn.AutoLocalize = false
    GetKeyBtn.Parent = Card

    local GetKeyCorner = Instance.new("UICorner")
    GetKeyCorner.CornerRadius = UDim.new(0, 8)
    GetKeyCorner.Parent = GetKeyBtn

    local GetKeyStroke = Instance.new("UIStroke")
    GetKeyStroke.Color = Color3.fromRGB(46, 46, 58)
    GetKeyStroke.Thickness = 1
    GetKeyStroke.Parent = GetKeyBtn

    local VerifyBtn = Instance.new("TextButton")
    VerifyBtn.Size = UDim2.new(0.48, -4, 0, 38)
    VerifyBtn.Position = UDim2.new(0.52, 2, 0, 146)
    VerifyBtn.BackgroundColor3 = Color3.fromRGB(59, 130, 246)
    VerifyBtn.Text = "Verify Key"
    VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    VerifyBtn.Font = Enum.Font.GothamBold
    VerifyBtn.TextSize = 12
    VerifyBtn.AutoLocalize = false
    VerifyBtn.Parent = Card

    local VerifyCorner = Instance.new("UICorner")
    VerifyCorner.CornerRadius = UDim.new(0, 8)
    VerifyCorner.Parent = VerifyBtn

    -- Footer note
    local Footer = Instance.new("TextLabel")
    Footer.Text = "Complete 1 quick task on LootLabs to obtain your key."
    Footer.TextColor3 = Color3.fromRGB(115, 115, 130)
    Footer.Font = Enum.Font.Gotham
    Footer.TextSize = 10
    Footer.Size = UDim2.new(1, -44, 0, 16)
    Footer.Position = UDim2.fromOffset(22, 196)
    Footer.BackgroundTransparency = 1
    Footer.AutoLocalize = false
    Footer.Parent = Card

    -- Button Actions
    GetKeyBtn.MouseButton1Click:Connect(function()
        GetKeyBtn.Text = "Fetching Link..."
        local url = GetKeyURL()
        if setclipboard then
            setclipboard(url)
            GetKeyBtn.Text = "Copied to Clipboard! ✓"
            Status.TextColor3 = Color3.fromRGB(34, 197, 94)
            Status.Text = "Link copied! Open browser and complete task."
            task.delay(2.5, function()
                GetKeyBtn.Text = "Get Key (Copy Link)"
            end)
        else
            Status.TextColor3 = Color3.fromRGB(239, 68, 68)
            Status.Text = "Clipboard unsupported: " .. url
        end
    end)

    local isVerifying = false
    VerifyBtn.MouseButton1Click:Connect(function()
        if isVerifying then return end
        local input = TextBox.Text
        if not input or input == "" then
            Status.TextColor3 = Color3.fromRGB(239, 68, 68)
            Status.Text = "Please enter your license key."
            return
        end

        isVerifying = true
        VerifyBtn.Text = "Verifying..."
        Status.TextColor3 = Color3.fromRGB(140, 140, 155)
        Status.Text = "Validating key with Platoboost..."

        task.spawn(function()
            local valid = CheckWhitelist(input)
            if valid then
                if writefile then
                    pcall(writefile, SavePath, input)
                end
                Status.TextColor3 = Color3.fromRGB(34, 197, 94)
                Status.Text = "Key Verified! Loading Cheat Bot..."
                VerifyBtn.BackgroundColor3 = Color3.fromRGB(34, 197, 94)
                VerifyBtn.Text = "Success! ✓"

                task.wait(0.7)
                TweenService:Create(Card, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                    Size = UDim2.fromOffset(300, 180),
                    BackgroundTransparency = 1
                }):Play()
                task.wait(0.3)
                ScreenGui:Destroy()
                onSuccess()
            else
                Status.TextColor3 = Color3.fromRGB(239, 68, 68)
                Status.Text = "Invalid or expired key. Please get a new one."
                VerifyBtn.Text = "Verify Key"
                isVerifying = false
            end
        end)
    end)

    -- Draggable card implementation
    local dragging, dragInput, dragStart, startPos
    Card.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = Card.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    Card.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            Card.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    ScreenGui.Parent = parent
end

-- Load Fluent UI library
local Fluent = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/myheisenberg/Fluent-Renewed/main/Fluent.luau"))()

local function StartCheatBot()
if _G.BOT then _G.BOT.enabled = false end
if _G.BOT_CLEANUP then pcall(_G.BOT_CLEANUP) end

local B = {
    enabled = true,
    doPhoto = true,
    pause = false,
    key = {},
    submitted = {},
    correctCount = 0,
    wrongCount = 0,
    log = {},
    phoneResults = {},
    lastPhotoAt = 0,
    lastAct = 0,
    anxiety = 0,
    pencilMode = false,
    dead = false,
    safeSince = nil,
    cycleActive = false,
    cycleStart = nil,
    abortCount = 0,
}
_G.BOT = B

local function log(msg)
    table.insert(B.log, tostring(msg))
    if #B.log > 40 then table.remove(B.log, 1) end
end


-- ---------------- PHONE LISTENER ----------------
if not _G.PDHooked then
    _G.PDHooked = true
    ReplicatedStorage.ToolEvents.PhoneDisplay.OnClientEvent:Connect(function(phoneName, action, a, b)
        local B2 = _G.BOT
        if not B2 then return end
        table.insert(B2.phoneResults, {name = phoneName, action = action, a = a, b = b})
        if #B2.phoneResults > 60 then table.remove(B2.phoneResults, 1) end
        if action == "SetAnswer" and type(a) == "string" then
            local txt = a:gsub("<br%s*/?>", "\n")
            for qNum, letter in txt:gmatch("(%d+)%s*[%.:%-]?%s*([A-D])") do
                local q = tonumber(qNum)
                if q and not B2.key[q] then B2.key[q] = letter end
            end
            B2.lastCaptureAt = os.clock()
            B2.lastPhotoAt = os.clock()
            B2.cycleActive = false
            B2.cycleStart = nil
            log("Answer received: " .. txt)
            pcall(function()
                PlayAnimation:FireServer("Phone1", "stop")
                local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if hum then hum:UnequipTools() end
            end)
            -- equip pencil immediately
            task.wait(0.3)
            pcall(function()
                local char = LocalPlayer.Character
                if char and not char:FindFirstChild("Pencil") then
                    local pencil = LocalPlayer.Backpack:FindFirstChild("Pencil")
                    if pencil then char:FindFirstChildOfClass("Humanoid"):EquipTool(pencil) end
                end
            end)
        end
    end)
end

-- ---------------- HELPERS ----------------
-- telefonu ELDE ETMEDEN bul (equip yok! state attribute'u backpack'te de okunur)
local function findPhone()
    local char = LocalPlayer.Character
    return (char and char:FindFirstChild("Phone1")) or LocalPlayer.Backpack:FindFirstChild("Phone1")
end

local function lowerPhone()
    pcall(function()
        PlayAnimation:FireServer("Phone1", "stop")
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum:UnequipTools() end
    end)
end

local function equipPencil(silent)
    local char = LocalPlayer.Character
    if not char then return end
    if char:FindFirstChild("Pencil") then return end
    local pencil = LocalPlayer.Backpack:FindFirstChild("Pencil")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if pencil and hum then
        hum:UnequipTools()
        hum:EquipTool(pencil)
        if not silent then log("Anxiety high -> pencil equipped") end
    end
end

local function readAnxiety()
    local char = LocalPlayer.Character
    return tonumber(char and char:GetAttribute("Anxiety")) or 0
end

local function isDead()
    local char = LocalPlayer.Character
    if not char then return true end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum and hum.Health <= 0 then return true end
    if char:GetAttribute("DeathSequenceActive") == true then return true end
    return false
end

local function getTeacher()
    -- ONCE KENDI SINIFIMIZIN ogretmenini bul, yoksa en yakini
    local myHum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    local seat = myHum and myHum.SeatPart
    local myClass = seat and seat:GetAttribute("ClassroomId")
    if not myClass and seat and seat:GetAttribute("SeatId") then
        myClass = tostring(seat:GetAttribute("SeatId")):match("^(%a+Class)")
    end
    if not myClass then
        myClass = LocalPlayer:GetAttribute("AssignedClassroomId")
    end
    local best, bestDist
    local fallback, fallbackDist
    for _, m in ipairs(Workspace:GetChildren()) do
        if m:IsA("Model") and m.Name:find("Teacher") and m:FindFirstChildOfClass("Humanoid") then
            local hrp = m:FindFirstChild("HumanoidRootPart") or m.PrimaryPart
            local dist = hrp and (hrp.Position - (myHum and myHum.RootPart and myHum.RootPart.Position or Vector3.zero)).Magnitude or 9999
            if m:GetAttribute("TeacherClassroom") == myClass then
                if not best or dist < bestDist then
                    best, bestDist = m, dist
                end
            end
            if not fallback or dist < fallbackDist then
                fallback, fallbackDist = m, dist
            end
        end
    end
    return best or fallback
end

local function isRealWall(instance)
    if not instance or not instance:IsA("BasePart") then return false end
    return instance.Size.Magnitude > 8
end

-- KATI guvenlik: mesafe + hareket yonu + govde/kafa yonu + gercek duvar
local function teacherSafe()
    local t = getTeacher()
    if not t then
        B.teacherInfo = "no teacher"
        return true
    end
    local hrp = t:FindFirstChild("HumanoidRootPart") or t.PrimaryPart
    local head = t:FindFirstChild("Head")
    local myHum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    local me = (myHum and myHum.SeatPart) or (LocalPlayer.Character and LocalPlayer.Character.PrimaryPart)
    if not hrp or not me then
        B.teacherInfo = "position ?"
        return false
    end
    local toMe = me.Position - hrp.Position
    local dist = toMe.Magnitude

    -- ROTATION TRACKING: fast turning is dangerous (can turn back)
    local curLook = hrp.CFrame.LookVector
    if B.lastLook and B.lastLook:Dot(curLook) < 0.95 then
        B.lastFaceTime = os.clock() -- turning -> wait
    end
    B.lastLook = curLook

    -- real wall block -> ALL sample points must be blocked
    -- (single ray misleads: doorway diagonal sight - caught this way in forensics)
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Exclude
    params.FilterDescendantsInstances = {t, LocalPlayer.Character}
    local origin = (head or hrp).Position
    local myHum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    local seat = myHum and myHum.SeatPart
    local targets = {
        me.Position + Vector3.new(0, 2.2, 0),  -- kafam
        me.Position,                             -- govdem
    }
    if seat then
        local half = seat.Size.X * 0.45
        table.insert(targets, seat.Position + seat.CFrame.RightVector * half)
        table.insert(targets, seat.Position - seat.CFrame.RightVector * half)
    end
    local allBlocked = true
    for _, tp in ipairs(targets) do
        local hit = Workspace:Raycast(origin, tp - origin, params)
        if not (hit and isRealWall(hit.Instance)) then
            allBlocked = false
            break
        end
    end
    if allBlocked then
        B.teacherInfo = string.format("d=%.0f fully blocked SAFE", dist)
        return true
    end

    -- movement: walking toward us is risky (can turn back even if not facing)
    local vel = hrp.AssemblyLinearVelocity
    if vel.Magnitude > 1 then
        local velDot = vel.Unit:Dot(toMe.Unit)
        if velDot > 0.3 then
            B.lastFaceTime = os.clock()
            B.teacherInfo = string.format("d=%.0f approaching RISK", dist)
            return false
        end
        -- while walking: facing us = risky, otherwise safe
        local bd = hrp.CFrame.LookVector:Dot(toMe.Unit)
        if bd > 0.25 then
            B.lastFaceTime = os.clock()
            B.teacherInfo = string.format("d=%.0f facing us risk", dist)
            return false
        end
        B.teacherInfo = string.format("d=%.0f moving away SAFE", dist)
        return true
    end

    -- sadece DIBINDEYSE mesafe riski (yumruk menzili)
    if dist < SAFE_DISTANCE then
        B.teacherInfo = string.format("d=%.0f right next to us RISK!", dist)
        return false
    end

    -- yon: KAFAYA (gercek bakis!) VE govde net baska yone bakmali
    local bodyDot = hrp.CFrame.LookVector:Dot(toMe.Unit)
    local headDot = bodyDot
    if head then
        headDot = head.CFrame.LookVector:Dot(toMe.Unit)
    end
    if bodyDot > 0.25 or headDot > 0.25 then
        B.lastFaceTime = os.clock() -- looking at us
    end
    local safe = bodyDot < SAFE_DOT and headDot < SAFE_DOT
    B.teacherInfo = string.format("d=%.0f bd=%.2f hd=%.2f %s", dist, bodyDot, headDot,
        safe and "SAFE" or "LOOKING!")
    return safe
end

-- R-kagidi + masadaki kagida gorsel isaret
local function syncPaperVisual()
    local pg = LocalPlayer.PlayerGui
    local ap = pg:FindFirstChild("AnswerPaperScreenGui")
    if ap then
        for _, ch in ipairs(ap:GetChildren()) do
            if ch:IsA("GuiObject") and ch.Name ~= "CloseButton" and ch.Name ~= "MobileCloseButton" then
                for q, l in pairs(B.submitted) do
                    local frame = ch:FindFirstChild(tostring(q))
                    local btn = frame and frame:FindFirstChild(l)
                    if btn and btn:IsA("GuiObject") then
                        btn.Visible = true
                        btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                        btn.BackgroundTransparency = 0
                    end
                end
            end
        end
    end
    local myHum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    local seat = myHum and myHum.SeatPart
    if seat then
        for _, d in ipairs(seat:GetDescendants()) do
            if d:IsA("SurfaceGui") and d.Name == "AnswerPaperSurfaceGui"
                and d:GetAttribute("OwnerUserId") == LocalPlayer.UserId then
                local paper = d:FindFirstChild("Paper")
                for q, l in pairs(B.submitted) do
                    local frame = paper and paper:FindFirstChild(tostring(q))
                    local btn = frame and frame:FindFirstChild(l)
                    if btn and btn:IsA("GuiObject") then
                        btn.Visible = true
                        btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                        btn.BackgroundTransparency = 0
                    end
                end
            end
        end
    end
end

local function submitAnswer(q, letter)
    if Workspace:GetAttribute("GameStatus") ~= "Assessment In Progress" then return false end
    local seq = Workspace:GetAttribute("AssessmentSequenceId")
    local ok, accepted, isCorrect = pcall(function()
        return PlayerAnswerTable:InvokeServer(q, letter, nil, seq)
    end)
    if ok and accepted then
        B.submitted[q] = letter
        if isCorrect then B.correctCount += 1 else B.wrongCount += 1 end
        log(q .. "=" .. letter .. (isCorrect and " CORRECT" or " WRONG"))
        syncPaperVisual()
        return true
    end
    return false
end

-- ---------------- MAIN LOOP: fill the paper ----------------
task.spawn(function()
    while B.enabled do
        local ok, err = pcall(function()
            local status = Workspace:GetAttribute("GameStatus")
            local seq = Workspace:GetAttribute("AssessmentSequenceId")
            if B.lastSeq ~= seq then
                B.lastSeq = seq
                B.key = {}
                B.submitted = {}
                B.correctCount = 0
                B.wrongCount = 0
            end
            if status == "Assessment In Progress" and not isDead() then
                local answers = PlayerAnswerTable:InvokeServer()
                if type(answers) == "table" then
                    B.totalQ = 0
                    for i = 1, 60 do
                        if answers[i] ~= nil then B.totalQ = i end
                    end
                    local pending = {}
                    for i = 1, (B.totalQ or 0) do
                        if B.key[i] and answers[i] == "UNANSWERED" then
                            table.insert(pending, i)
                        end
                    end
                    B.pendingCount = #pending
                    if #pending > 0 then
                        local q = pending[math.random(#pending)]
                        submitAnswer(q, B.key[q])
                    end
                end
            end
        end)
        if not ok then log("SUBMIT ERROR: " .. tostring(err)) end
        task.wait(0.5 + math.random() * 0.5)
    end
end)

-- ---------------- PHOTO WATCHDOG: abort mid-shot ----------------
task.spawn(function()
    while B.enabled do
        pcall(function()
            if B.cycleActive then
                local abort = false
                local neden = ""
                if isDead() then
                    abort = true
                    neden = "death"
                else
                    -- EARLY WARNING: teacher started moving (can round a corner)
                    local t = getTeacher()
                    local myHum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                    local me = (myHum and myHum.SeatPart) or (LocalPlayer.Character and LocalPlayer.Character.PrimaryPart)
                    if t and me then
                        local hrp = t:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            local toMe = me.Position - hrp.Position
                            local dist = toMe.Magnitude
                            local vel = hrp.AssemblyLinearVelocity
                            local velMag = vel.Magnitude
                            -- EARLY WARNING: only when TOWARD US (normal patrol should not abort!)
                            local approaching = velMag > 5 and velMag > 0 and vel.Unit:Dot(toMe.Unit) > 0.15
                            if approaching then
                                abort = true
                                neden = string.format("teacher approaching v=%.0f", velMag)
                            elseif B.cycleStartDist and dist < B.cycleStartDist * 0.85 then
                                abort = true
                                neden = string.format("teacher closing in d=%.0f", dist)
                            elseif not teacherSafe() then
                                abort = true
                                neden = "facing us"
                            end
                        end
                    else
                        if not teacherSafe() then
                            abort = true
                            neden = "facing us"
                        end
                    end
                end
                if abort then
                    lowerPhone()
                    B.cycleActive = false
                    B.cycleStart = nil
                    B.abortCount += 1
                    B.lastPhotoAt = os.clock()
                    B.lastAbortAt = os.clock()
                    B.resumeSince = nil
                    log("ABORT! " .. neden .. " (#" .. B.abortCount .. ")")
                    task.wait(0.3)
                    equipPencil(true)
                end
            end
        end)
        task.wait(0.15)
    end
end)

-- ---------------- FARMER: tek sahip, ayni tick'te equip+ates ----------------
task.spawn(function()
    while B.enabled do
        local ok, err = pcall(function()
            local status = Workspace:GetAttribute("GameStatus")

            -- prepare inventory during intermission too (phone + pencil)
            if status ~= "Assessment In Progress" then
                if not findPhone() or not LocalPlayer.Backpack:FindFirstChild("Pencil") then
                    if not B.interCollect or os.clock() - B.interCollect > 15 then
                        B.interCollect = os.clock()
                        if not findPhone() then
                            ShopInventoryAction:FireServer("Collect", "Phone1")
                        end
                        if not LocalPlayer.Backpack:FindFirstChild("Pencil") then
                            ShopInventoryAction:FireServer("Collect", "Pencil")
                        end
                    end
                end
                return
            end
            if not B.doPhoto or B.pause then return end

            if isDead() then
                if not B.dead then
                    B.dead = true
                    B.cycleActive = false
                    B.cycleStart = nil
                    log("Death/caught -> bot paused")
                end
                return
            elseif B.dead then
                B.dead = false
                log("Alive -> resuming")
            end

            B.anxiety = readAnxiety()

            if B.anxiety >= T("ANXIETY_PENCIL", ANXIETY_PENCIL) and not B.pencilMode then
                B.pencilMode = true
                equipPencil()
                return
            end
            if B.pencilMode then
                if B.anxiety > 60 then return end
                B.pencilMode = false
                log("Anxiety dropped -> back to phone")
            end

            -- telefonu once BUL (equip yok)
            local phone = findPhone()
            if not phone then
                local seq = Workspace:GetAttribute("AssessmentSequenceId")
                if B.triedCollect ~= seq then
                    B.triedCollect = seq
                    ShopInventoryAction:FireServer("Collect", "Phone1")
                    task.wait(0.3)
                    ShopInventoryAction:FireServer("Collect", "Pencil")
                    log("Phone + pencil requested from locker")
                end
                return
            end

            local state = phone:GetAttribute("PhoneState")
            if state == nil then
                -- PhoneState attribute is set server-side upon EQUIP.
                -- Guvenliyse kisaca equip edip state'i olustur, sonra devam.
                if not teacherSafe() then return end
                local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if not hum then return end
                if phone.Parent ~= LocalPlayer.Character then
                    hum:EquipTool(phone)
                end
                task.wait(0.6)
                state = phone:GetAttribute("PhoneState")
                if state == nil then
                    lowerPhone()
                    return
                end
                -- state initialized; if gates fail, pencil-idle loop lowers it in 3s
            end
            B.phoneState = state

            -- MID-CYCLE states: handled even when cycleActive is false
            -- (fixes infinite ReadyToLoad stall after abort)
            if state == "ReadyToLoad" or state == "Paused" then
                -- FORENSIC LESSON: after abort, do not re-raise phone on a momentary
                -- "safe" flicker (last catch happened this way). Strict after abort,
                -- dogal dongude hizli devam.
                local sinceAbort = os.clock() - (B.lastAbortAt or 0)
                if sinceAbort < T("CYCLE_COOLDOWN", CYCLE_COOLDOWN) then
                    -- fresh abort: do not touch phone, lower if held (pencil takes over)
                    if phone.Parent == LocalPlayer.Character then
                        lowerPhone()
                    end
                    return
                end
                local memNeeded = sinceAbort < 10 and T("FACE_MEMORY", FACE_MEMORY) or 1.0
                if os.clock() - (B.lastFaceTime or 0) < memNeeded then return end
                if teacherSafe() then
                    if sinceAbort < 10 then
                        -- after abort: stability window required
                        if not B.resumeSince then
                            B.resumeSince = os.clock()
                            return
                        end
                        if os.clock() - B.resumeSince < T("STABLE_TIME", STABLE_TIME) then return end
                    end
                    B.resumeSince = nil
                    -- safe: equip phone and LOAD (same tick)
                    local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                    if hum then
                        if phone.Parent ~= LocalPlayer.Character then
                            hum:EquipTool(phone)
                        end
                        B.lastAct = os.clock()
                        B.cycleActive = true
                        B.cycleStart = os.clock()
                        local t = getTeacher()
                        local myHum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                        local me = (myHum and myHum.SeatPart) or (LocalPlayer.Character and LocalPlayer.Character.PrimaryPart)
                        B.cycleStartDist = (t and me and t.PrimaryPart) and (me.Position - t.PrimaryPart.Position).Magnitude or nil
                        PlayAnimation:FireServer("Phone1", "SecondUse")
                        ToolAction:FireServer(phone, "SecondUse")
                        log(state == "Paused" and "loading devam (gvenli)" or "load baslatildi")
                    end
                else
                    B.resumeSince = nil
                    if phone.Parent == LocalPlayer.Character then
                        lowerPhone()
                    end
                end
                return
            end
            B.resumeSince = nil
            if state == "Loading" or state == "TakingPhoto" then
                if phone.Parent == LocalPlayer.Character then
                    -- held: keep watchdog active (so it can abort)
                    if not B.cycleActive then
                        B.cycleActive = true
                        B.cycleStart = os.clock()
                    end
                    if B.cycleStart and os.clock() - B.cycleStart > CYCLE_TIMEOUT then
                        lowerPhone()
                        B.cycleActive = false
                        B.cycleStart = nil
                        B.lastPhotoAt = os.clock()
                        log("Cycle stuck -> reset")
                    end
                else
                    -- not held: server finishes loading by itself, wait
                    if B.cycleActive then
                        B.cycleActive = false
                        B.cycleStart = nil
                    end
                end
                return
            end

            -- new cycle start conditions
            if state ~= "NeedsPhoto" and state ~= "Complete" then return end
            if B.totalQ and B.totalQ > 0 then
                local known = 0
                for _ in pairs(B.key) do known += 1 end
                if known >= B.totalQ then return end
            end
            if (B.pendingCount or 0) > 0 then return end
            if os.clock() - B.lastPhotoAt < T("CYCLE_COOLDOWN", CYCLE_COOLDOWN) then return end

            -- stabil guvenlik
            if teacherSafe() then
                if not B.safeSince then
                    B.safeSince = os.clock()
                    return
                end
                if os.clock() - B.safeSince < T("STABLE_TIME", STABLE_TIME) then return end
            else
                B.safeSince = nil
                return
            end
            B.safeSince = nil

            -- GAZE MEMORY: if teacher looked at us in the last 2.5s /
            -- turned or got close, wait (do not trust momentary "safe")
            if os.clock() - (B.lastFaceTime or 0) < T("FACE_MEMORY", FACE_MEMORY) then return end

            -- all green: equip and fire NOW in the same tick (pencil loop cannot interfere)
            local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if not hum then return end
            if phone.Parent ~= LocalPlayer.Character then
                hum:EquipTool(phone)
            end
            local now = os.clock()
            B.lastAct = now
            B.lastPhotoAt = now
            B.cycleActive = true
            B.cycleStart = now
            B.cycleStartDist = nil
            local t = getTeacher()
            local myHum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            local me = (myHum and myHum.SeatPart) or (LocalPlayer.Character and LocalPlayer.Character.PrimaryPart)
            if t and me and t.PrimaryPart then
                B.cycleStartDist = (me.Position - t.PrimaryPart.Position).Magnitude
            end
            PlayAnimation:FireServer("Phone1", "Use")
            ToolAction:FireServer(phone, "Use")
            log("Photo taken (watchdog active)")
        end)
        if not ok then log("FARMER ERROR: " .. tostring(err)) end
        task.wait(0.7)
    end
end)

-- ---------------- PENCIL IDLE: pencil when hands free (NEVER touch phone) ----------------
task.spawn(function()
    while B.enabled do
        pcall(function()
            local status = Workspace:GetAttribute("GameStatus")
            if status ~= "Assessment In Progress" then return end
            if isDead() or B.cycleActive then return end
            local char = LocalPlayer.Character
            if not char then return end
            -- HUNG PHONE cleanup: phone in hand with NeedsPhoto/nil state
            -- if idle over 3s, lower it (avoid clashing with init/fire window)
            local ph = char:FindFirstChild("Phone1")
            if ph then
                local st = ph:GetAttribute("PhoneState")
                if st == nil or st == "NeedsPhoto" then
                    if not B.phoneIdleSince then
                        B.phoneIdleSince = os.clock()
                    elseif os.clock() - B.phoneIdleSince > 3 then
                        lowerPhone()
                        B.phoneIdleSince = nil
                        log("Idle phone -> lowered")
                    end
                else
                    B.phoneIdleSince = nil
                end
                return -- elde telefon varken kalem takma
            end
            B.phoneIdleSince = nil
            if char:FindFirstChild("Pencil") then return end
            local pencil = LocalPlayer.Backpack:FindFirstChild("Pencil")
            if pencil then
                char:FindFirstChildOfClass("Humanoid"):EquipTool(pencil)
            end
        end)
        task.wait(1)
    end
end)

-- ---------------- GORSEL SENKRON + GUI ----------------
task.spawn(function()
    while B.enabled do
        pcall(function()
            B.anxiety = readAnxiety()
            syncPaperVisual()
            -- refresh teacher info EVERY tick (never stale while farmer waits)
            if Workspace:GetAttribute("GameStatus") == "Assessment In Progress" then
                teacherSafe()
            end

            local keyParts = {}
            for q, l in pairs(B.key) do
                local mark = B.submitted[q] and (B.submitted[q] == l and "+" or "?") or "-"
                table.insert(keyParts, q .. ":" .. l .. mark)
            end
            table.sort(keyParts, function(a, b)
                return tonumber(a:match("^(%d+):")) < tonumber(b:match("^(%d+):"))
            end)
            local anxTxt = tostring(math.floor(B.anxiety))
            if B.pencilMode then anxTxt = anxTxt .. " (PENCIL)" end
            if B.anxPaused then anxTxt = anxTxt .. " (paused)" end
            if B.dead then anxTxt = anxTxt .. " [DEAD]" end
            if B.cycleActive then anxTxt = anxTxt .. " [PHOTO]" end
            local keyText = table.concat(keyParts, "  ")
            local lastLogs = {}
            for i = math.max(1, #B.log - 6), #B.log do
                if B.log[i] then table.insert(lastLogs, B.log[i]) end
            end
            local logText = table.concat(lastLogs, "\n")

            -- Fluent panel updates (write only on change, no spam)
            -- _G.BOT_FLUENT uzerinden erisim: GUI blogu dosya sonunda yuklenir
            pcall(function()
                local F = _G.BOT_FLUENT
                if not F or not F.durumPar then return end
                local durumText = string.format("%s | Seq %s\nQuestions: %s | Phone: %s %s",
                    tostring(Workspace:GetAttribute("GameStatus")),
                    tostring(Workspace:GetAttribute("AssessmentSequenceId")),
                    tostring(B.totalQ or 0),
                    tostring(B.phoneState or "-"),
                    B.cycleActive and "[TAKING PHOTO]" or "")
                if durumText ~= F.lastInfoText then
                    F.lastInfoText = durumText
                    F.durumPar:SetContent(durumText)
                end
                local ogText = tostring(B.teacherInfo or "?") .. (B.dead and "\n!! DEAD / CAUGHT !!" or "")
                if ogText ~= F.lastOgText then
                    F.lastOgText = ogText
                    F.ogretmenPar:SetContent(ogText)
                end
                local kayText = anxTxt .. (B.abortCount > 0 and ("\nAborts: " .. B.abortCount) or "")
                if kayText ~= F.lastKayText then
                    F.lastKayText = kayText
                    F.kaygiPar:SetContent(kayText)
                end
                local kaText = string.format("Correct: %d / Wrong: %d\nKnown: %d/%s",
                    B.correctCount, B.wrongCount, #keyParts, tostring(B.totalQ or "?"))
                if kaText ~= F.lastKaText then
                    F.lastKaText = kaText
                    F.kagitPar:SetContent(kaText)
                end
                if keyText ~= F.lastKeyText then
                    F.lastKeyText = keyText
                    F.keyPar:SetContent(keyText ~= "" and keyText or "No answers yet")
                end
                if logText ~= F.lastLogText then
                    F.lastLogText = logText
                    F.logPar:SetContent(logText)
                end
            end)
        end)
        task.wait(0.5)
    end
end)

-- ---------------- ADLI KAYIT: yakalanma anini cozumle ----------------
-- last 12s teacher geometry + freeze on catch
B.forensics = {}
task.spawn(function()
    while B.enabled do
        pcall(function()
            local t = getTeacher()
            local char = LocalPlayer.Character
            if t and char then
                local hrp = t:FindFirstChild("HumanoidRootPart")
                local head = t:FindFirstChild("Head")
                local hum = char:FindFirstChildOfClass("Humanoid")
                local me = (hum and hum.SeatPart) or char.PrimaryPart
                if hrp and me then
                    local toMe = me.Position - hrp.Position
                    local rec = {
                        t = math.floor(os.clock() * 10) / 10,
                        d = math.floor(toMe.Magnitude * 10) / 10,
                        bd = math.floor(hrp.CFrame.LookVector:Dot(toMe.Unit) * 100) / 100,
                        hd = head and math.floor(head.CFrame.LookVector:Dot(toMe.Unit) * 100) / 100 or -99,
                        vel = math.floor(hrp.AssemblyLinearVelocity.Magnitude * 10) / 10,
                        ph = char:FindFirstChild("Phone1") and 1 or 0,
                        anim = char:GetAttribute("IsPlayingAnimation") and 1 or 0,
                        camYaw = math.floor((char:GetAttribute("CameraLookYawDegrees") or 0)),
                        st = char:FindFirstChild("Phone1") and tostring(char.Phone1:GetAttribute("PhoneState")) or "-",
                    }
                    table.insert(B.forensics, rec)
                    if #B.forensics > 120 then table.remove(B.forensics, 1) end
                end
            end
        end)
        task.wait(0.1)
    end
end)
LocalPlayer:GetAttributeChangedSignal("CaughtCheatingTransitionActive"):Connect(function()
    if LocalPlayer:GetAttribute("CaughtCheatingTransitionActive") == true and _G.BOT then
        _G.BOT.CAUGHT_DUMP = table.clone(_G.BOT.forensics)
        table.insert(_G.BOT.log, "YAKALANDIK! adli kayit donduruldu (" .. #_G.BOT.CAUGHT_DUMP .. " kayit)")
    end
end)

log("Bot started")
print("[CevapBotu] v9.3 active")

-- ---------------- GUI (Fluent Renewed - resmi v1.0.5) ----------------
-- silent retried download: GUI guaranteed even if first execute has slow HTTP
local Fluent = nil
local fluentErr = nil

for attempt = 1, 3 do
    local ok, result = pcall(function()
        return loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/myheisenberg/Fluent-Renewed/main/Fluent.luau"))()
    end)
    if ok and type(result) == "table" and type(result.CreateWindow) == "function" then
        Fluent = result
        break
    end
    fluentErr = tostring(result)
    task.wait(2)
end

local guiOK, guiErr = pcall(function()
if not Fluent then
    error("Fluent download failed (3 attempts): " .. tostring(fluentErr))
end

local Window = Fluent:CreateWindow{
    Title = "Cheat Bot",
    SubTitle = "by zynexdev",
    Size = UDim2.fromOffset(600, 440),
    TabWidth = 160,
    Theme = "Dark",
}

-- Fix: Disable Roblox AutoLocalize on all main UI labels
Fluent.GUI.DescendantAdded:Connect(function(v)
    if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") then
        v.AutoLocalize = false
    end
end)
for _, v in ipairs(Fluent.GUI:GetDescendants()) do
    if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") then
        v.AutoLocalize = false
    end
end

-- profile avatar (headshot) as tab icon via rbxthumb
local avatarIcon = "rbxthumb://type=AvatarHeadShot&id=" .. LocalPlayer.UserId .. "&w=150&h=150"

local Tabs = {
    Main = Window:CreateTab{ Title = "Dashboard", Icon = avatarIcon },
    Key = Window:CreateTab{ Title = "Answer Key", Icon = "key" },
    Set = Window:CreateTab{ Title = "Settings", Icon = "settings" },
    Log = Window:CreateTab{ Title = "Logs", Icon = "phosphor-list-bold" },
}

-- DASHBOARD
-- PROFILE: player name + author tag
local profileText = "Player: " .. LocalPlayer.DisplayName .. " (@" .. LocalPlayer.Name .. ")\nMade by zynexdev"
local profilePar = Tabs.Main:CreateParagraph("Profile", { Title = "Profile", Content = profileText })
local durumPar = Tabs.Main:CreateParagraph("Durum", { Title = "Status", Content = "starting..." })
local teacherPar = Tabs.Main:CreateParagraph("Teacher", { Title = "Teacher", Content = "-" })
local anxietyPar = Tabs.Main:CreateParagraph("Anxiety", { Title = "Anxiety", Content = "-" })
local paperPar = Tabs.Main:CreateParagraph("Paper", { Title = "Paper", Content = "-" })

Tabs.Main:CreateToggle("AutoPhoto", {
    Title = "Auto Photo",
    Description = "Farms answers via phone when teacher is safe",
    Default = true,
})
Tabs.Main:CreateToggle("Pause", {
    Title = "Pause",
    Description = "Temporarily stops all automation",
    Default = false,
})
Tabs.Main:CreateButton{
    Title = "Equip Pencil",
    Description = "Look innocent, reduce anxiety",
    Callback = function() equipPencil(true) end,
}
Tabs.Main:CreateButton{
    Title = "Lower Phone (abort)",
    Description = "Puts the phone down immediately",
    Callback = function()
        lowerPhone()
        if _G.BOT.cycleActive then
            _G.BOT.cycleActive = false
            _G.BOT.lastAbortAt = os.clock()
            _G.BOT.abortCount += 1
        end
    end,
}

-- ANSWER KEY TAB
local keyPar = Tabs.Key:CreateParagraph("KeyView", { Title = "Answer Key", Content = "No answers yet" })
local statsPar = Tabs.Key:CreateParagraph("Stats", { Title = "Stats", Content = "Correct: 0 / Wrong: 0" })

-- SETTINGS TAB
Tabs.Set:CreateSlider("StableTime", {
    Title = "Stable Safety Window (s)",
    Description = "Continuous safe time required before photo",
    Default = 0.8, Min = 0, Max = 3, Rounding = 1,
    Callback = function(v) _G.BOT_TUNES = _G.BOT_TUNES or {} _G.BOT_TUNES.STABLE_TIME = v end,
})
Tabs.Set:CreateSlider("FaceMemory", {
    Title = "Face Memory (s)",
    Description = "Wait time after teacher looked at us",
    Default = 1.2, Min = 0, Max = 5, Rounding = 1,
    Callback = function(v) _G.BOT_TUNES = _G.BOT_TUNES or {} _G.BOT_TUNES.FACE_MEMORY = v end,
})
Tabs.Set:CreateSlider("CycleCooldown", {
    Title = "Cycle Cooldown (s)",
    Description = "Minimum wait after photo/abort",
    Default = 2.5, Min = 0, Max = 10, Rounding = 1,
    Callback = function(v) _G.BOT_TUNES = _G.BOT_TUNES or {} _G.BOT_TUNES.CYCLE_COOLDOWN = v end,
})
Tabs.Set:CreateSlider("PencilThreshold", {
    Title = "Anxiety: Pencil Threshold",
    Description = "Auto-equips pencil at this anxiety level",
    Default = 85, Min = 50, Max = 95, Rounding = 0,
    Callback = function(v) _G.BOT_TUNES = _G.BOT_TUNES or {} _G.BOT_TUNES.ANXIETY_PENCIL = v end,
})

-- LOGS TAB
local logPar = Tabs.Log:CreateParagraph("LogView", { Title = "Recent Events", Content = "starting..." })

-- toggle callback'leri B'ye bagla (B local, burada erisilebilir)
-- AutoPhoto ve Pause icin Options kullan
local Options = Fluent.Options
if Options.AutoPhoto then
    Options.AutoPhoto:OnChanged(function()
        if _G.BOT then _G.BOT.doPhoto = Options.AutoPhoto.Value end
    end)
end
if Options.Pause then
    Options.Pause:OnChanged(function()
        if _G.BOT then _G.BOT.pause = Options.Pause.Value end
    end)
end

_G.BOT_CLEANUP = function() pcall(function() Fluent:Destroy() end) end

-- ---------------- EKLENTILER (SaveManager + InterfaceManager) ----------------
-- SaveManager: save/load bot settings as configs
-- InterfaceManager: GUI konumu/tema yonetimi
local addonOK, addonErr = pcall(function()
    local SaveManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/myheisenberg/Fluent-Renewed/main/Addons/SaveManager.luau"))()
    local InterfaceManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/myheisenberg/Fluent-Renewed/main/Addons/InterfaceManager.luau"))()

    SaveManager:SetLibrary(Fluent)
    InterfaceManager:SetLibrary(Fluent)

    SaveManager:IgnoreThemeSettings()
    SaveManager:SetIgnoreIndexes{}

    InterfaceManager:SetFolder("CheatBot")
    SaveManager:SetFolder("CheatBot/test-sirasinda-hile")

    InterfaceManager:BuildInterfaceSection(Tabs.Set)
    SaveManager:BuildConfigSection(Tabs.Set)

    SaveManager:LoadAutoloadConfig()
    _G.BOT_SAVEMANAGER = SaveManager
    _G.BOT_INTERFACEMANAGER = InterfaceManager
    log("Addons ready: SaveManager + InterfaceManager")
end)
if not addonOK then
    log("Addon ERROR: " .. tostring(addonErr))
    print("[CevapBotu] Addon ERROR: " .. tostring(addonErr))
end

_G.BOT_FLUENT = {
    Window = Window, profilePar = profilePar,
    durumPar = durumPar, ogretmenPar = teacherPar,
    kaygiPar = anxietyPar, kagitPar = paperPar, keyPar = keyPar,
    istatistikPar = statsPar, logPar = logPar,
    lastInfoText = "", lastKeyText = "", lastLogText = "",
    lastOgText = "", lastKayText = "", lastKaText = "",
}

-- caught notification
LocalPlayer:GetAttributeChangedSignal("CaughtCheatingTransitionActive"):Connect(function()
    if LocalPlayer:GetAttribute("CaughtCheatingTransitionActive") == true then
        pcall(function()
            Fluent:Notify{ Title = "CAUGHT!", Content = "Forensic dump saved", Duration = 6 }
        end)
    end
end)

-- Dashboard auto-selected on open (no empty right panel)
Window:SelectTab(1)

Fluent:Notify{ Title = "Cheat Bot v9.3", Content = "Made by zynexdev", Duration = 4 }
log("Fluent GUI ready")
end)
if not guiOK then
    log("GUI ERROR: " .. tostring(guiErr))
    print("[CevapBotu] GUI ERROR: " .. tostring(guiErr))
end











end

-- Launch Key System Modal
CreateKeyModal(StartCheatBot)
