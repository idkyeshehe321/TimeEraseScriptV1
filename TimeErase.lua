local char = game:GetService("Players").LocalPlayer.Character
local players = game:GetService("Players")

local timeErase = Instance.new("BoolValue")
timeErase.Name = "timeErase"
timeErase.Parent = char
timeErase.Value = false

timeErase:GetPropertyChangedSignal("Value"):Connect(function()
	if timeErase.Value == true then
		char:FindFirstChild("HumanoidRootPart").CFrame = char:FindFirstChild("HumanoidRootPart").CFrame + Vector3.new(0,1000,0)
		char:FindFirstChild("Humanoid").CameraOffset = Vector3.new(0,-1000,0)
		local sky = Instance.new("Sky")
		sky.Parent = game:GetService("Lighting")
		sky.Name = "TimeEraseSkyV1"
		sky.CelestialBodiesShown = true
		sky.MoonAngularSize = 11
		sky.MoonTextureId = "rbxasset://sky/moon.jpg"
		sky.SkyboxBk = "http://www.roblox.com/asset/?id=159454299"
		sky.SkyboxDn = "http://www.roblox.com/asset/?id=159454296"
		sky.SkyboxFt = "http://www.roblox.com/asset/?id=159454293"
		sky.SkyboxLf = "http://www.roblox.com/asset/?id=159454286"
		sky.SkyboxRt = "http://www.roblox.com/asset/?id=159454300"
		sky.SkyboxUp = "http://www.roblox.com/asset/?id=159454288"
		----
		sky.StarCount = 5000
		sky.SunAngularSize = 21
		sky.SunTextureId = ""
		for i, v in pairs(game.Players:GetDescendants()) do
			if v:IsA("Player") then
				local char = v.Character or v.CharacterAdded:Wait()
				local highlight = Instance.new("Highlight")
				highlight.Name = "TimeEraseHighlightV1"
				highlight.Parent = char
				highlight.OutlineColor = Color3.new(1, 0, 0)
				highlight.FillColor = Color3.new(1, 0, 0)
			end
		end
	end
while timeErase.Value == true do
	task.wait(.1)
	local part = Instance.new("Part")
	part.Size = Vector3.new(3,3,3)
	part.Parent = workspace
	part.Position = char:FindFirstChild("HumanoidRootPart").Position + Vector3.new(0,-4.5,0)
	part.Anchored = true
		part.Transparency = 1
		part.Name = "TimeErasePartV1"
	local part2 = Instance.new("Part")
	part2.Size = Vector3.new(3,3,3)
	part2.Parent = workspace
	part2.Position = char:FindFirstChild("HumanoidRootPart").Position + Vector3.new(0,4.5,0)
	part2.Anchored = true
		part2.Transparency = 1
		part2.Name = "TimeErasePartV2"
	end
	if timeErase.Value == false then
		char:FindFirstChild("Humanoid").CameraOffset = Vector3.new(0,0,0)
		char:FindFirstChild("HumanoidRootPart").CFrame = char:FindFirstChild("HumanoidRootPart").CFrame + Vector3.new(0,-500,0)
		game:GetService("Lighting"):FindFirstChild("TimeEraseSkyV1"):Destroy()
		for i, v in pairs(game.Players:GetDescendants()) do
			if v:IsA("Player") then
				local char = v.Character or v.CharacterAdded:Wait()
				if char:FindFirstChild("TimeEraseHighlightV1") then
					char:FindFirstChild("TimeEraseHighlightV1"):Destroy()
				end
			end
		end
		for i, v in pairs(game.Workspace:GetDescendants()) do
			if v.Name == "TimeErasePartV1" or v.Name == "TimeErasePartV2" then
				v:Destroy()
			end
		end
	end
end)

local uis = game:GetService("UserInputService")

uis.InputBegan:Connect(function(input, typing)
	if typing then return end
	if input.UserInputType == Enum.UserInputType.Keyboard then
		if input.KeyCode == Enum.KeyCode.E then
			if timeErase.Value == true then
				timeErase.Value = false
			else
				timeErase.Value = true
			end
		end
	end
end)
