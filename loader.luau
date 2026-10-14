-- ============================================================
--  Cheat During Test | Official Automation Hub
--  Developer: myheisenberg
--  Protected by Platoboost & Fluent UI Renewed
-- ============================================================

local ok, err = pcall(function()
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/myheisenberg/Cheat-During-Test/main/main.luau"))()
end)

if not ok then
    warn("[Cheat-During-Test Loader Error]:", err)
end
