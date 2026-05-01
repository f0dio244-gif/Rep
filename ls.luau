-- CHECKPOINT 1: Script started
print("--- [GH SCRIPT] Loading started... ---")

local player = ... 

-- CHECKPOINT 2: Checking the player object
if player then
	print("[GH SCRIPT] Received player: " .. player.Name)
else
	print("[GH SCRIPT] ERROR: No player object received!")
	return
end

if player.Name ~= "Tymm7czek" then 
	print("[GH SCRIPT] Name mismatch. Stopping.")
	return 
end

-- CHECKPOINT 3: Attempting UI Build
print("[GH SCRIPT] Building UI for Tymm7czek...")

local PlayerGui = player:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TymmMenu"
screenGui.ResetOnSpawn = false
screenGui.Parent = PlayerGui

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 200, 0, 100)
main.Position = UDim2.new(0.5, -100, 0.4, 0)
main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
main.Active = true
main.Draggable = true
main.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 1, 0)
title.Text = "LOGGED IN: TYMM"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Parent = main

-- FINAL CHECKPOINT
print("--- [GH SCRIPT] UI Successfully Parented! ---")
