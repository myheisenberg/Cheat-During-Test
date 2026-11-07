-- ============================================================
--  Cheat During Test | Official Automation Hub
--  Developer: myheisenberg
--  Secured by PandaAuth & Fluent UI Renewed
--  Service: Zynex Scripts (zynexscripts)
-- ============================================================

local ok, err = pcall(function()
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/myheisenberg/Cheat-During-Test/main/main.luau?t=" .. tostring(os.time())))()
end)

if not ok then
    warn("[Cheat-During-Test Loader Error]:", err)
end
