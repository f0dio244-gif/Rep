-- RECEIVE THE PLAYER
local player = ... 

print("--- [GH SCRIPT] Loading started... ---")

if not player then return end

print("[GH SCRIPT] Building UI for " .. player.Name)

local PlayerGui = player:WaitForChild("PlayerGui")

-- 1. Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TymmMenu"
screenGui.ResetOnSpawn = false
screenGui.Parent = PlayerGui -- SET PARENT MANUALLY

-- 2. Create Main Frame
local main = Instance.new("Frame")
main.Name = "MainFrame"
main.Size = UDim2.new(0, 200, 0, 150)
main.Position = UDim2.new(0.5, -100, 0.4, 0)
main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
main.Active = true
main.Draggable = true
main.Parent = screenGui -- SET PARENT MANUALLY

-- 3. Create UICorner (This was the line causing the error)
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = main -- SET PARENT MANUALLY

-- 4. Create Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 1, 0)
title.Text = "TYMM IS HERE"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.Parent = main -- SET PARENT MANUALLY

print("--- [GH SCRIPT] SUCCESS! UI should be visible. ---")
