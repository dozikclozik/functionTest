local DozikLibrary = {}
local LocalPlayer = game.Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

-- WINDOW
function DozikLibrary:CreateWindow(boolean)
	
	local function CreateInfoLabel(parent, About, Info)
		if parent and About and Info then
		local label = Instance.new("TextButton", parent)
		label.Text = About .. Info
		label.TextScaled  = true
		label.Size = UDim2.new(1, 0,0.15, 0)
		label.Font = Enum.Font.Highway
		label.BackgroundTransparency = 0.5
		label.BackgroundColor = BrickColor.new("Really black")
		label.TextColor = BrickColor.new("Really black")
		
		label.MouseButton1Click:Connect(function()
			setclipboard(tostring(Info))
			DozikLibrary.Notify("Info copied!", "", 1)
		end)
		end
	end
	
	if boolean then
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
		
		local ScrllForInfo = Instance.new("ScrollingFrame", Two_Frame)
		ScrllForInfo.Name = "ScrllForInfo"
		ScrllForInfo.Size = UDim2.new(0.423, 0,0.902, 0)
		ScrllForInfo.Position = UDim2.new(0, 0,0.097, 0)
		ScrllForInfo.ScrollBarThickness = 3
		ScrllForInfo.BorderSizePixel = 0
		ScrllForInfo.BackgroundColor3 = Color3.new(0.160784, 0.364706, 0.0509804)
		ScrllForInfo.AutomaticCanvasSize = Enum.AutomaticSize.Y
		
		local UIListLayoutInfo = Instance.new("UIListLayout", ScrllForInfo)
		UIListLayoutInfo.Padding = UDim.new(0, 10)
		UIListLayoutInfo.SortOrder = Enum.SortOrder.LayoutOrder
		
		CreateInfoLabel(ScrllForInfo, "Game Id: ", game.PlaceId)
		
		local success, productInfo = pcall(function()
			return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
		end)
		CreateInfoLabel(ScrllForInfo, "Game name: ", productInfo.Name)
		
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

return DozikLibrary
