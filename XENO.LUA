-- VOID PAID VERZION - By Alex 🗽🥀

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local SoundService = game:GetService("SoundService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "VoidPaidVerzion"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- ====================== MÚSICA ======================
local backgroundMusic = Instance.new("Sound")
backgroundMusic.SoundId = "rbxassetid://124372849821652"
backgroundMusic.Volume = 0.5
backgroundMusic.Looped = true
backgroundMusic.Name = "VoidMusic"
backgroundMusic.Parent = SoundService
pcall(function() backgroundMusic:Play() end)

-- ====================== PANTALLA DE CARGA ======================
local loadingFrame = Instance.new("Frame")
loadingFrame.Size = UDim2.new(1, 0, 1, 0)
loadingFrame.BackgroundColor3 = Color3.fromRGB(25, 18, 40)
loadingFrame.Parent = screenGui

local loadTitle = Instance.new("TextLabel")
loadTitle.Size = UDim2.new(1, 0, 0, 80)
loadTitle.Position = UDim2.new(0, 0, 0.32, 0)
loadTitle.BackgroundTransparency = 1
loadTitle.Text = "VOID PAID VERZION"
loadTitle.TextColor3 = Color3.fromRGB(220, 180, 255)
loadTitle.TextScaled = true
loadTitle.Font = Enum.Font.GothamBold
loadTitle.Parent = loadingFrame

local credit = Instance.new("TextLabel")
credit.Size = UDim2.new(1, 0, 0, 30)
credit.Position = UDim2.new(0, 0, 0.48, 0)
credit.BackgroundTransparency = 1
credit.Text = "script made by Alex 🗽🥀"
credit.TextColor3 = Color3.fromRGB(200, 160, 255)
credit.TextScaled = true
credit.Font = Enum.Font.Gotham
credit.Parent = loadingFrame

local realText = Instance.new("TextLabel")
realText.Size = UDim2.new(1, 0, 0, 25)
realText.Position = UDim2.new(0, 0, 0.56, 0)
realText.BackgroundTransparency = 1
realText.Text = "real hasta la muerte cabron"
realText.TextColor3 = Color3.fromRGB(255, 140, 180)
realText.TextScaled = true
realText.Font = Enum.Font.Gotham
realText.Parent = loadingFrame

local barBg = Instance.new("Frame")
barBg.Size = UDim2.new(0.5, 0, 0, 6)
barBg.Position = UDim2.new(0.25, 0, 0.72, 0)
barBg.BackgroundColor3 = Color3.fromRGB(40, 30, 55)
barBg.Parent = loadingFrame
Instance.new("UICorner", barBg).CornerRadius = UDim.new(1, 0)

local loadingBar = Instance.new("Frame")
loadingBar.Size = UDim2.new(0, 0, 1, 0)
loadingBar.BackgroundColor3 = Color3.fromRGB(180, 120, 255)
loadingBar.Parent = barBg
Instance.new("UICorner", loadingBar).CornerRadius = UDim.new(1, 0)

pcall(function()
	TweenService:Create(loadingBar, TweenInfo.new(2.5, Enum.EasingStyle.Quad), {Size = UDim2.new(1, 0, 1, 0)}):Play()
end)

task.wait(3)
pcall(function()
	TweenService:Create(loadingFrame, TweenInfo.new(0.6), {BackgroundTransparency = 1}):Play()
end)
task.wait(0.7)
loadingFrame:Destroy()

-- ====================== BOTÓN FLOTANTE ======================
local openButton = Instance.new("TextButton")
openButton.Size = UDim2.new(0, 60, 0, 60)
openButton.Position = UDim2.new(0.9, 0, 0.8, 0)
openButton.BackgroundColor3 = Color3.fromRGB(160, 100, 255)
openButton.Text = "⚡"
openButton.TextScaled = true
openButton.Font = Enum.Font.GothamBold
openButton.TextColor3 = Color3.new(1, 1, 1)
openButton.Parent = screenGui
Instance.new("UICorner", openButton).CornerRadius = UDim.new(1, 0)

local btnDragging = false
local btnStart, btnStartPos
openButton.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		btnDragging = true
		btnStart = input.Position
		btnStartPos = openButton.Position
	end
end)
UserInputService.InputChanged:Connect(function(input)
	if btnDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - btnStart
		openButton.Position = UDim2.new(btnStartPos.X.Scale, btnStartPos.X.Offset + delta.X, btnStartPos.Y.Scale, btnStartPos.Y.Offset + delta.Y)
	end
end)
UserInputService.InputEnded:Connect(function() btnDragging = false end)

-- ====================== MENÚ ======================
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 280, 0, 520)
mainFrame.Position = UDim2.new(0.5, -140, 0.5, -260)
mainFrame.BackgroundColor3 = Color3.fromRGB(28, 20, 45)
mainFrame.Visible = false
mainFrame.Parent = screenGui
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 16)
Instance.new("UIStroke", mainFrame).Color = Color3.fromRGB(160, 100, 255)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 45)
title.BackgroundTransparency = 1
title.Text = "VOID PAID VERZION"
title.TextColor3 = Color3.fromRGB(220, 180, 255)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = mainFrame

local function createButton(text, yPos, color)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0.85, 0, 0, 38)
	btn.Position = UDim2.new(0.075, 0, yPos, 0)
	btn.BackgroundColor3 = color
	btn.Text = text
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.TextScaled = true
	btn.Font = Enum.Font.GothamBold
	btn.Parent = mainFrame
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
	return btn
end

local tpBtn = createButton("⚡ TELEPORT", 0.11, Color3.fromRGB(120, 70, 200))
local secretBtn = createButton("🏃 CAMINADORA SECRETA TP", 0.20, Color3.fromRGB(180, 100, 50))
local adminBtn = createButton("👑 ADMIN CAMINADORA", 0.29, Color3.fromRGB(200, 50, 150))
local godBtn = createButton("🛡️ GOD MODE: OFF", 0.38, Color3.fromRGB(180, 60, 80))
local jumpBtn = createButton("🦘 INFINITE JUMP: OFF", 0.47, Color3.fromRGB(80, 100, 200))

local speedBox = Instance.new("TextBox")
speedBox.Size = UDim2.new(0.55, 0, 0, 34)
speedBox.Position = UDim2.new(0.075, 0, 0.57, 0)
speedBox.BackgroundColor3 = Color3.fromRGB(35, 25, 50)
speedBox.Text = "16"
speedBox.TextColor3 = Color3.new(1, 1, 1)
speedBox.TextScaled = true
speedBox.Font = Enum.Font.GothamBold
speedBox.Parent = mainFrame
Instance.new("UICorner", speedBox).CornerRadius = UDim.new(0, 8)

local applyBtn = Instance.new("TextButton")
applyBtn.Size = UDim2.new(0.28, 0, 0, 34)
applyBtn.Position = UDim2.new(0.65, 0, 0.57, 0)
applyBtn.BackgroundColor3 = Color3.fromRGB(100, 70, 180)
applyBtn.Text = "SET"
applyBtn.TextColor3 = Color3.new(1, 1, 1)
applyBtn.TextScaled = true
applyBtn.Font = Enum.Font.GothamBold
applyBtn.Parent = mainFrame
Instance.new("UICorner", applyBtn).CornerRadius = UDim.new(0, 8)

local musicBtn = createButton("🎵 PAUSAR MÚSICA", 0.67, Color3.fromRGB(70, 50, 100))
local muteAllBtn = createButton("🔇 SILENCIAR JUEGO", 0.76, Color3.fromRGB(140, 50, 70))

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 32, 0, 32)
closeBtn.Position = UDim2.new(1, -40, 0, 8)
closeBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 70)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = mainFrame
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(1, 0)

-- ====================== COORDENADAS ======================
local targetPos = Vector3.new(-4628.9, 193.1, -185.7)
local secretPos = Vector3.new(-340.4, 0.6, 125.4)          -- Caminadora Secreta
local adminPos = Vector3.new(123.2, -467.9, -135.5)        -- Admin Caminadora ✅

local godEnabled = false
local jumpEnabled = false
local humanoid = nil

local function getHumanoid()
	local char = player.Character or player.CharacterAdded:Wait()
	humanoid = char:WaitForChild("Humanoid", 5)
end
pcall(getHumanoid)
player.CharacterAdded:Connect(function() pcall(getHumanoid) end)

tpBtn.MouseButton1Click:Connect(function()
	pcall(function()
		local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		if root then root.CFrame = CFrame.new(targetPos) end
	end)
end)

secretBtn.MouseButton1Click:Connect(function()
	pcall(function()
		local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		if root then root.CFrame = CFrame.new(secretPos) end
	end)
end)

adminBtn.MouseButton1Click:Connect(function()
	pcall(function()
		local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		if root then root.CFrame = CFrame.new(adminPos) end
	end)
end)

godBtn.MouseButton1Click:Connect(function()
	godEnabled = not godEnabled
	if godEnabled then
		godBtn.Text = "🛡️ GOD MODE: ON"
		godBtn.BackgroundColor3 = Color3.fromRGB(60, 160, 80)
	else
		godBtn.Text = "🛡️ GOD MODE: OFF"
		godBtn.BackgroundColor3 = Color3.fromRGB(180, 60, 80)
	end
end)

jumpBtn.MouseButton1Click:Connect(function()
	jumpEnabled = not jumpEnabled
	if jumpEnabled then
		jumpBtn.Text = "🦘 INFINITE JUMP: ON"
		jumpBtn.BackgroundColor3 = Color3.fromRGB(60, 160, 80)
	else
		jumpBtn.Text = "🦘 INFINITE JUMP: OFF"
		jumpBtn.BackgroundColor3 = Color3.fromRGB(80, 100, 200)
	end
end)

UserInputService.JumpRequest:Connect(function()
	if jumpEnabled and humanoid then
		pcall(function() humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end)
	end
end)

applyBtn.MouseButton1Click:Connect(function()
	local speed = tonumber(speedBox.Text)
	if speed and humanoid then humanoid.WalkSpeed = speed end
end)

musicBtn.MouseButton1Click:Connect(function()
	if backgroundMusic.Playing then
		backgroundMusic:Pause()
		musicBtn.Text = "🔇 REANUDAR"
	else
		backgroundMusic:Resume()
		musicBtn.Text = "🎵 PAUSAR MÚSICA"
	end
end)

muteAllBtn.MouseButton1Click:Connect(function()
	for _, sound in pairs(game:GetDescendants()) do
		if sound:IsA("Sound") and sound ~= backgroundMusic then
			pcall(function() sound.Volume = 0 sound:Stop() end)
		end
	end
end)

RunService.Heartbeat:Connect(function()
	if godEnabled and humanoid then
		pcall(function()
			humanoid.MaxHealth = 999999
			humanoid.Health = 999999
		end)
	end
end)

-- Abrir / Cerrar
local isOpen = false
openButton.MouseButton1Click:Connect(function()
	isOpen = not isOpen
	mainFrame.Visible = isOpen
end)
closeBtn.MouseButton1Click:Connect(function()
	isOpen = false
	mainFrame.Visible = false
end)

-- Draggable
local dragging = false
local dragStart, startPos
mainFrame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = mainFrame.Position
	end
end)
UserInputService.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - dragStart
		mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)
UserInputService.InputEnded:Connect(function() dragging = false end)

print("VOID PAID VERZION cargado - by Alex")
