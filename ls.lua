-- TYMM'S SECRET PANEL (V2)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- Security check
if player.Name ~= "Tymm7czek" then return end

-- Main UI logic
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "TymmLoadstringMenu"

local main = Instance.new("Frame", screenGui)
main.Size = UDim2.new(0, 220, 0, 280)
main.Position = UDim2.new(0.5, -110, 0.4, 0)
main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
main.Active = true
main.Draggable = true

local corner = Instance.new("UICorner", main)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "TYMM'S EXECUTOR"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold

-- Feature Logic
local function addBtn(txt, yPos, color, func)
    local b = Instance.new("TextButton", main)
    b.Size = UDim2.new(0.9, 0, 0, 35)
    b.Position = UDim2.new(0.05, 0, 0, yPos)
    b.Text = txt
    b.BackgroundColor3 = color
    b.TextColor3 = Color3.new(1, 1, 1)
    b.Font = Enum.Font.Gotham
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(func)
end

-- 1. Speed (God Speed)
addBtn("Super Speed", 50, Color3.fromRGB(0, 120, 255), function()
    local hum = player.Character:FindFirstChildOfClass("Humanoid")
    hum.WalkSpeed = (hum.WalkSpeed == 16 and 100 or 16)
end)

-- 2. Fly (Simple Float)
local flying = false
addBtn("Toggle Float", 95, Color3.fromRGB(0, 200, 100), function()
    flying = not flying
    local root = player.Character:FindFirstChild("HumanoidRootPart")
    if flying then
        local bv = Instance.new("BodyVelocity", root)
        bv.Name = "TymmFly"
        bv.Velocity = Vector3.new(0,0,0)
        bv.MaxForce = Vector3.new(0, 9e9, 0)
    else
        if root:FindFirstChild("TymmFly") then root.TymmFly:Destroy() end
    end
end)

-- 3. Rainbow UI
local rainbow = false
addBtn("Rainbow Mode", 140, Color3.fromRGB(200, 0, 200), function()
    rainbow = not rainbow
end)

-- 4. Infinite Jump
local infJump = false
game:GetService("UserInputService").JumpRequest:Connect(function()
    if infJump then
        player.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)
addBtn("Inf Jump", 185, Color3.fromRGB(200, 100, 0), function()
    infJump = not infJump
end)

-- 5. Self Destruct (Clean UI)
addBtn("Remove Menu", 230, Color3.fromRGB(150, 0, 0), function()
    screenGui:Destroy()
end)

RunService.RenderStepped:Connect(function()
    if rainbow then
        main.BackgroundColor3 = Color3.fromHSV(tick() % 5 / 5, 0.7, 0.7)
    end
end)
