local DozikLibrary = {}
local LocalPlayer = game.Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

-- WINDOW

local ScrllForFunctions
local windowsCreated = false

local switching = false

local soundClick = Instance.new("Sound", game:GetService("SoundService"))
soundClick.Name = "ClickDozik"
soundClick.SoundId = "rbxassetid://9119713951"

Character:FindFirstChildOfClass("Humanoid").Died:Connect(function()
	if windowsCreated then
	windowsCreated = false
	soundClick:Destroy()
	end
end)

function DozikLibrary:CreateWindow(boolean)
	
	local function CreateInfoLabel(parent, About, Info)
		if parent and About and Info then
		local label = Instance.new("TextButton", parent)
		label.Text = About .. Info
		label.TextScaled  = true
		label.Size = UDim2.new(1, 0,0.15, 0)
		label.Font = Enum.Font.Highway
		label.BackgroundTransparency = 0.5
		label.BackgroundColor = BrickColor.new("White")
		label.TextColor = BrickColor.new("Really black")
		
		label.MouseButton1Click:Connect(function()
			setclipboard(tostring(Info))
			DozikLibrary.Notify("Info copied!", "", 1)
		end)
		end
	end
	
	if boolean and not windowsCreated then
		windowsCreated = true
		
		DozikLibrary.Notify("In progress.", "...", 1.5)
		local ScreenGui = Instance.new("ScreenGui", LocalPlayer.PlayerGui)
		ScreenGui.Name = "DozikLibrary"
		
		local Basis_Frame = Instance.new("Frame", ScreenGui)
		Basis_Frame.Active = true
		Basis_Frame.Draggable = true
		Basis_Frame.Name = "Basis_Frame"
		Basis_Frame.Position = UDim2.new(0.169, 0,0.226, 0)
		Basis_Frame.Size = UDim2.new(0.307, 0,0.249, 0)
		Basis_Frame.BackgroundColor3 = Color3.new(0, 0.827451, 0.027451)
		Basis_Frame.BorderSizePixel = 2
		
		local Two_Frame = Instance.new("Frame", Basis_Frame)
		Two_Frame.Name = "Two_Frame"
		Two_Frame.Position = UDim2.new(0.021, 0,0.046, 0)
		Two_Frame.Size = UDim2.new(0.957, 0,0.904, 0)
		Two_Frame.BackgroundColor3 = Color3.new(0.184314, 0.509804, 0.0313725)
		Two_Frame.BorderSizePixel = 0
		
		local DW = Instance.new("TextLabel", Two_Frame)
		DW.Name = "DW"
		DW.TextScaled = true
		DW.Text = "Dozik Window"
		DW.BackgroundTransparency = 1
		DW.Size = UDim2.new(0.198, 0,0.097, 0)
		DW.Position = UDim2.new(0.8, 0,-0, 0)
		DW.Font = Enum.Font.Nunito
		DW.TextColor = BrickColor.new("Really black")
		
		local Info_Button = Instance.new("TextButton", Two_Frame)
		Info_Button.Name = "Info_Button"
		Info_Button.Text = "Info"
		Info_Button.TextScaled = true
		Info_Button.Size = UDim2.new(0.203, 0, 0.097, 0)
		Info_Button.Position = UDim2.new(0, 0,-0, 0)
		Info_Button.BackgroundColor3 = Color3.new(0.0823529, 0.694118, 0.0156863)
		Info_Button.TextColor = BrickColor.new("Really black")
		Info_Button.BorderSizePixel = 0
		
		local Functions = Instance.new("TextButton", Two_Frame)
		Functions.Name = "Functions"
		Functions.Text = "Functions"
		Functions.TextScaled = true
		Functions.Size = UDim2.new(0.203, 0, 0.097, 0)
		Functions.Position = UDim2.new(0.234, 0,-0, 0)
		Functions.BackgroundColor3 = Color3.new(0.0823529, 0.694118, 0.0156863)
		Functions.TextColor = BrickColor.new("Really black")
		Functions.BorderSizePixel = 0
		
		local ScrllForInfo = Instance.new("ScrollingFrame", Two_Frame)
		ScrllForInfo.Name = "ScrllForInfo"
		ScrllForInfo.Size = UDim2.new(0.423, 0,0.902, 0)
		ScrllForInfo.Position = UDim2.new(0, 0,0.097, 0)
		ScrllForInfo.ScrollBarThickness = 3
		ScrllForInfo.BorderSizePixel = 0
		ScrllForInfo.BackgroundColor3 = Color3.new(0.160784, 0.364706, 0.0509804)
		ScrllForInfo.AutomaticCanvasSize = Enum.AutomaticSize.Y
		
		ScrllForFunctions = Instance.new("ScrollingFrame", Two_Frame)
		ScrllForFunctions.Name = "ScrllForFunctions"
		ScrllForFunctions.Visible = false
		ScrllForFunctions.Size = UDim2.new(0.423, 0,0.902, 0)
		ScrllForFunctions.Position = UDim2.new(0, 0,0.097, 0)
		ScrllForFunctions.ScrollBarThickness = 3
		ScrllForFunctions.BorderSizePixel = 0
		ScrllForFunctions.BackgroundColor3 = Color3.new(0.160784, 0.364706, 0.0509804)
		ScrllForFunctions.AutomaticCanvasSize = Enum.AutomaticSize.Y
		
		local UIListLayoutInfo = Instance.new("UIListLayout", ScrllForInfo)
		UIListLayoutInfo.Padding = UDim.new(0, 10)
		UIListLayoutInfo.SortOrder = Enum.SortOrder.LayoutOrder
		
		local function CreateAllInfoLabels()
		CreateInfoLabel(ScrllForInfo, "Game Id: ", game.PlaceId)
		local success, productInfo = pcall(function()
			return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
		end)
		CreateInfoLabel(ScrllForInfo, "Game name: ", productInfo.Name)
		CreateInfoLabel(ScrllForInfo, "Players in server: ", #game:GetService("Players"):GetPlayers())
		CreateInfoLabel(ScrllForInfo, "Your UserId: ", LocalPlayer.UserId)
		CreateInfoLabel(ScrllForInfo, "Your username: ", LocalPlayer.Name)
		end
		
		CreateAllInfoLabels()
		
		Functions.MouseButton1Click:Connect(function()
			if not switching then
				switching = true
				soundClick:Play()
				ScrllForInfo.Visible = false
				ScrllForFunctions.Visible = true
				task.wait()
			end
		end)
		
		Info_Button.MouseButton1Click:Connect(function()
			if switching then
			switching = false
			soundClick:Play()
			for index, element in pairs(ScrllForInfo:GetChildren()) do
				if not element:IsA("UIListLayout") then
				element:Destroy()
				end
			end
			CreateAllInfoLabels()
			ScrllForInfo.Visible = true
			ScrllForFunctions.Visible = false
			task.wait()
			end
		end)
	end
end

-- ADD BUTTON
function DozikLibrary:AddButton(ButtonName, OnClick)
	if windowsCreated then
		local TextButton = Instance.new("TextButton", ScrllForFunctions)
		TextButton.Text = ButtonName
		TextButton.TextScaled  = true
		TextButton.Size = UDim2.new(1, 0,0.15, 0)
		TextButton.Font = Enum.Font.Highway
		TextButton.BackgroundTransparency = 0.3
		TextButton.BackgroundColor = BrickColor.new("White")
		TextButton.TextColor = BrickColor.new("Really black")
		
		TextButton.MouseButton1Click:Connect(OnClick)
	end
end

-- NOTIFY
function DozikLibrary.Notify(Title, Text, Duration)
	if Title and Text and Duration then
		game.StarterGui:SetCore("SendNotification", {
			Title = Title,
			Text = Text,
			Duration = Duration
		})
	end
end

DozikLibrary:CreateWindow(true)


return DozikLibrary
