--[[ 
    TYMM'S PRIVATE PANEL (GITHUB VERSION)
    Designed to be executed via server-side loadstring
]]

local player = ... -- Receives the player object from the loader
if not player or player.Name ~= "Tymm7czek" then return end

local RunService = game:GetService("RunService")
local PlayerGui = player:WaitForChild("PlayerGui")

-- Clean up any old versions of the menu
if PlayerGui:FindFirstChild("TymmMenu") then
	PlayerGui.TymmMenu:Destroy()
end

-------------------------------------------------------------------
-- UI CONSTRUCTION
-------------------------------------------------------------------

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TymmMenu"
screenGui.ResetOnSpawn = false
screenGui.Parent = PlayerGui

local main = Instance.new("Frame")
main.Name = "MainFrame"
main.Size = UDim2.new(0, 220, 0, 300)
main.Position = UDim2.new(0.5, -110, 0.4, 0)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true -- Allows you to move it around
main.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 45)
title.Text = "TYMM'S ADMIN"
title.TextColor3 = Color3.fromRGB(0, 170, 255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.Parent = main

-- Helper function for buttons
local function createButton(text, yPos, color, callback)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0.85, 0, 0, 38)
	btn.Position = UDim2.new(0.075, 0, 0, yPos)
	btn.Text = text
	btn.BackgroundColor3 = color
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Font = Enum.Font.GothamMedium
	btn.TextSize = 14
	btn.AutoButtonColor = true
	btn.Parent = main
	
	local btnCorner = Instance.new("UICorner")
	btnCorner.CornerRadius = UDim.new(0, 8)
	btnCorner.Parent = btn
	
	btn.MouseButton1Click:Connect(callback)
	return btn
end

-------------------------------------------------------------------
-- FEATURES
-------------------------------------------------------------------

-- 1. Speed Hack
local fast = false
createButton("Flash Speed", 60, Color3.fromRGB(40, 40, 45), function()
	fast = not fast
	local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
	if hum then
		hum.WalkSpeed = fast and 100 or 16
	end
end)

-- 2. Super Jump
local high = false
createButton("Super Jump", 105, Color3.fromRGB(40, 40, 45), function()
	high = not high
	local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
	if hum then
		hum.JumpPower = high and 150 or 50
		hum.UseJumpPower = true
	end
end)

-- 3. Noclip (Walk through walls)
local noclip = false
createButton("Noclip", 150, Color3.fromRGB(40, 40, 45), function()
	noclip = not noclip
end)

RunService.Stepped:Connect(function()
	if noclip and player.Character then
		for _, part in pairs(player.Character:GetDescendants()) do
			if part:IsA("BasePart") then
				part.CanCollide = false
			end
		end
	end
end)

-- 4. Rainbow Frame Toggle
local rainbow = false
createButton("Rainbow UI", 195, Color3.fromRGB(40, 40, 45), function()
	rainbow = not rainbow
end)

RunService.RenderStepped:Connect(function()
	if rainbow then
		main.BackgroundColor3 = Color3.fromHSV(tick() % 5 / 5, 0.6, 0.6)
	else
		main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	end
end)

-- 5. Self Destruct
createButton("Close & Remove", 245, Color3.fromRGB(180, 50, 50), function()
	screenGui:Destroy()
end)

print("Tymm's Panel fully initialized for: " .. player.Name)
