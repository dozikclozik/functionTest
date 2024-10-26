local DozikLibrary = {}
local LocalPlayer = game.Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

local TweenService = game:GetService("TweenService")

-- WINDOW

local ScrllForFunctions
local ScrllForRemotes
local ScreenGui

local windowsCreated = false

local showed = true

if game:GetService("SoundService"):FindFirstChild("ClickDozik") then
	game:GetService("SoundService"):WaitForChild("ClickDozik"):Destroy()
end

local soundClick = Instance.new("Sound", game:GetService("SoundService"))
soundClick.Name = "ClickDozik"
soundClick.SoundId = "rbxassetid://9119713951"

Character:FindFirstChildOfClass("Humanoid").Died:Connect(function()
	if windowsCreated then
	windowsCreated = false
	soundClick:Destroy()
	end
end)

LocalPlayer.CharacterRemoving:Connect(function()
	if windowsCreated then
		windowsCreated = false
		soundClick:Destroy()
	end
end)

function DozikLibrary:CreateWindow(boolean)
	
	local DWText = "Dozik Window"
	
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
	
	local function CreateRemoteLabel(parent, RemoteType, Name, Event)
		if parent and RemoteType and Name then
			local label = Instance.new("TextButton", parent)
			label.Text = tostring(Name) .. " [" .. tostring(RemoteType) .. "]"
			label.TextScaled  = true
			label.Size = UDim2.new(1, 0,0.15, 0)
			label.Font = Enum.Font.Highway
			label.BackgroundTransparency = 0.3
			label.BackgroundColor = BrickColor.new("Dark orange")
			label.TextColor = BrickColor.new("Really black")
			
			label.MouseButton1Click:Connect(function()
				DozikLibrary:RemotesFrame(Event)
			end)
	end
	end
	
	if LocalPlayer.PlayerGui:FindFirstChild("DozikLibrary") then
		LocalPlayer.PlayerGui:FindFirstChild("DozikLibrary"):Destroy()
	end
	
	if boolean and not windowsCreated then
		windowsCreated = true
		
		DozikLibrary.Notify("Welcome to dozik hub.", "...", 1.5)
		
		ScreenGui = Instance.new("ScreenGui", LocalPlayer.PlayerGui)
		ScreenGui.Name = "DozikLibrary"
		
		local Basis_Frame = Instance.new("Frame", ScreenGui)
		Basis_Frame.Active = true
		Basis_Frame.Draggable = true
		Basis_Frame.Name = "Basis_Frame" 
		Basis_Frame.Position = UDim2.new(0.169, 0,0.226, 0)
		Basis_Frame.Size = UDim2.new(0.307, 0,0.249, 0)
		Basis_Frame.BackgroundColor3 = Color3.new(0, 0.827451, 0.027451)
		Basis_Frame.BorderSizePixel = 2
		
		local Two_Frame = Instance.new("Frame", Basis_Frame) local CornerForTwoFrame = Instance.new("UICorner", Two_Frame)
		Two_Frame.Name = "Two_Frame"
		Two_Frame.Position = UDim2.new(0.021, 0,0.046, 0)
		Two_Frame.Size = UDim2.new(0.957, 0,0.904, 0)
		Two_Frame.BackgroundColor3 = Color3.new(0.184314, 0.509804, 0.0313725)
		Two_Frame.BorderSizePixel = 0
		
		local Hide_Button = Instance.new("TextButton", Two_Frame)
		Hide_Button.Name = "Hide_Button"
		Hide_Button.Text = "Hide"
		Hide_Button.Font = Enum.Font.Oswald
		Hide_Button.TextScaled = true
		Hide_Button.Size = UDim2.new(0.132, 0,0.129, 0)
		Hide_Button.Position = UDim2.new(0.866, 0,0.87, 0)
		Hide_Button.BackgroundColor3 = Color3.new(0.141176, 0.309804, 0.0352941)
		Hide_Button.TextColor = BrickColor.new("White")
		Hide_Button.BorderSizePixel = 0
		
		local Open_Button = Instance.new("TextButton", Basis_Frame)
		Open_Button.Visible = false
		Open_Button.Name = "Open_Button"
		Open_Button.Text = "Open"
		Open_Button.Font = Enum.Font.Oswald
		Open_Button.TextScaled = true
		Open_Button.Size = UDim2.new(0.336, 0,0.986, 0)
		Open_Button.BackgroundTransparency = 0.5
		Open_Button.Position = UDim2.new(0.663, 0,0, 0)
		Open_Button.BackgroundColor = BrickColor.new("White")
		Open_Button.TextColor = BrickColor.new("Really black")
		Open_Button.BorderSizePixel = 0
		
		Hide_Button.MouseButton1Click:Connect(function()
			if showed then
				soundClick:Play()
				showed = false
				Two_Frame.Visible = false
				local tween = TweenService:Create(Basis_Frame, TweenInfo.new(1, Enum.EasingStyle.Quad), {Size = UDim2.new(0.16, 0,0.027, 0)})
				tween:Play()
				tween.Completed:Connect(function()
					Open_Button.Visible = true
				end)
			end
		end)
		
		Open_Button.MouseButton1Click:Connect(function()
			if not showed then
				soundClick:Play()
				showed = true
				Open_Button.Visible = false
				local tween = TweenService:Create(Basis_Frame, TweenInfo.new(1, Enum.EasingStyle.Quad), {Size = UDim2.new(0.307, 0,0.249, 0)})
				tween:Play()
				tween.Completed:Connect(function()
					Two_Frame.Visible = true
				end)
			end
		end)
		
		local DW = Instance.new("TextLabel", Two_Frame)
		DW.Name = "DW"
		DW.TextScaled = true
		DW.Text = ""
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
		
		Info_Button.MouseEnter:Connect(function()
			Info_Button.Text = "Info (click)"
		end)
		Info_Button.MouseLeave:Connect(function()
			Info_Button.Text = "Info"
		end)
		
		local Functions = Instance.new("TextButton", Two_Frame)
		Functions.Name = "Functions"
		Functions.Text = "Functions"
		Functions.TextScaled = true
		Functions.Size = UDim2.new(0.203, 0, 0.097, 0)
		Functions.Position = UDim2.new(0.234, 0,-0, 0)
		Functions.BackgroundColor3 = Color3.new(0.0823529, 0.694118, 0.0156863)
		Functions.TextColor = BrickColor.new("Really black")
		Functions.BorderSizePixel = 0
		
		Functions.MouseEnter:Connect(function()
			Functions.Text = "Functions (click)"
		end)
		Functions.MouseLeave:Connect(function()
			Functions.Text = "Functions"
		end)
		
		local RemotesButton = Instance.new("TextButton", Two_Frame)
		RemotesButton.Name = "Remotes_Button"
		RemotesButton.Text = "Remotes"
		RemotesButton.TextScaled = true
		RemotesButton.Size = UDim2.new(0.203, 0, 0.097, 0)
		RemotesButton.Position = UDim2.new(0.471, 0,-0, 0)
		RemotesButton.BackgroundColor3 = Color3.new(0.0823529, 0.694118, 0.0156863)
		RemotesButton.TextColor = BrickColor.new("Really black")
		RemotesButton.BorderSizePixel = 0
		
		RemotesButton.MouseEnter:Connect(function()
			RemotesButton.Text = "Remotes (click)"
		end)
		RemotesButton.MouseLeave:Connect(function()
			RemotesButton.Text = "Remotes"
		end)
		
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
		
		ScrllForRemotes = Instance.new("ScrollingFrame", Two_Frame)
		ScrllForRemotes.Name = "ScrllForRemotes"
		ScrllForRemotes.Visible = false
		ScrllForRemotes.Size = UDim2.new(0.423, 0,0.902, 0)
		ScrllForRemotes.Position = UDim2.new(0, 0,0.097, 0)
		ScrllForRemotes.ScrollBarThickness = 3
		ScrllForRemotes.BorderSizePixel = 0
		ScrllForRemotes.BackgroundColor3 = Color3.new(0.160784, 0.364706, 0.0509804)
		ScrllForRemotes.AutomaticCanvasSize = Enum.AutomaticSize.Y
		ScrllForRemotes.CanvasSize = UDim2.new(0, 0,100, 0)
		
		local SearchRemotesBox = Instance.new("TextBox", Two_Frame)
		SearchRemotesBox.Visible = false  							
		SearchRemotesBox.Name = "SearchBoxRemote"					local SearchRemoteButton = Instance.new("ImageButton", SearchRemotesBox)
		SearchRemotesBox.Text = ""									SearchRemoteButton.Image = "http://www.roblox.com/asset/?id=5492253050"
		SearchRemotesBox.PlaceholderText = "Search"					SearchRemoteButton.BackgroundColor3 = Color3.new(0.901961, 0.733333, 0.0666667)
		SearchRemotesBox.Font = Enum.Font.Nunito					SearchRemoteButton.BorderSizePixel = 0
		SearchRemotesBox.BackgroundColor = BrickColor.new("White")	SearchRemoteButton.ImageColor3 = Color3.new(255,255,255)
		SearchRemotesBox.BorderSizePixel = 1						SearchRemoteButton.Position = UDim2.new(1, 0, 0, 0)
		SearchRemotesBox.TextScaled = true							SearchRemoteButton.Size = UDim2.new(0.243, 0, 1, 0)
		SearchRemotesBox.Position = UDim2.new(0.548, 0, 0.29, 0)
		SearchRemotesBox.Size = UDim2.new(0.317, 0, 0.161, 0)
		
		local UIListLayoutInfo = Instance.new("UIListLayout", ScrllForInfo)
		UIListLayoutInfo.Padding = UDim.new(0, 10)
		UIListLayoutInfo.SortOrder = Enum.SortOrder.LayoutOrder
		
		local UIListLayoutFunctions = Instance.new("UIListLayout", ScrllForFunctions)
		UIListLayoutFunctions.Padding = UDim.new(0, 5)
		UIListLayoutFunctions.SortOrder = Enum.SortOrder.LayoutOrder
		
		local UIListLayoutRemotes = Instance.new("UIListLayout", ScrllForRemotes)
		UIListLayoutRemotes.Padding = UDim.new(0, 5)
		UIListLayoutRemotes.SortOrder = Enum.SortOrder.LayoutOrder
		
		
		local function CreateAllInfoLabels()
		CreateInfoLabel(ScrllForInfo, "Game Id: ", game.PlaceId)
		local success, productInfo = pcall(function()
			return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
		end)
		if success then
		CreateInfoLabel(ScrllForInfo, "Game name: ", productInfo.Name)
		else
		CreateInfoLabel(ScrllForInfo, "Error: ", "game name was not found")
		end
		
		CreateInfoLabel(ScrllForInfo, "Players in server: ", #game:GetService("Players"):GetPlayers())
		CreateInfoLabel(ScrllForInfo, "Your userId: ", LocalPlayer.UserId)
		CreateInfoLabel(ScrllForInfo, "Your username: ", LocalPlayer.Name)
		end
		
		local function FindAllRemotes(searchRequest)
			for index, element in pairs(ScrllForRemotes:GetChildren()) do -- CLEARING
				if not element:IsA("UIListLayout") then
					element:Destroy()
				end
			end
			
			for i, remote in pairs(game:GetDescendants()) do
				if remote:IsA("RemoteEvent") and not remote:FindFirstAncestor("DefaultChatSystemChatEvents") then
					if searchRequest ~= nil and string.find(string.lower(remote.Name), string.lower(tostring(searchRequest))) then
						CreateRemoteLabel(ScrllForRemotes, "RemoteEvent", remote.Name, remote)
					elseif searchRequest == nil then
						CreateRemoteLabel(ScrllForRemotes, "RemoteEvent", remote.Name, remote)
					end
				elseif remote:IsA("BindableEvent") and not remote:FindFirstAncestor("DefaultChatSystemChatEvents") then
					if searchRequest ~= nil and string.find(string.lower(remote.Name), string.lower(tostring(searchRequest))) then
						CreateRemoteLabel(ScrllForRemotes, "BindableEvent", remote.Name, remote)
					elseif searchRequest == nil then
						CreateRemoteLabel(ScrllForRemotes, "BindableEvent", remote.Name, remote)
					end
				elseif remote:IsA("RemoteFunction") and not remote:FindFirstAncestor("DefaultChatSystemChatEvents") then
					if searchRequest ~= nil and string.find(string.lower(remote.Name), string.lower(tostring(searchRequest))) then
						CreateRemoteLabel(ScrllForRemotes, "RemoteFunction", remote.Name, remote)
					elseif searchRequest == nil then
						CreateRemoteLabel(ScrllForRemotes, "RemoteFunction", remote.Name, remote)
					end
				end
			end
		end
		
		CreateAllInfoLabels()
		
		spawn(function()
		for i = 1, #DWText do
			local letter = string.sub(DWText, 1, i)
			DW.Text = letter
			task.wait(0.05)
		end
		end)
		
		-- MOUSE CLICK FUNCTIONS --
		SearchRemoteButton.MouseButton1Click:Connect(function()
			soundClick:Play()
			FindAllRemotes(SearchRemotesBox.Text)
			if SearchRemotesBox.Text ~= "" then
				DozikLibrary.Notify("Searching...", "", 1 + #ScrllForRemotes:GetChildren() / 200)
			end
		end)
		
		Functions.MouseButton1Click:Connect(function()
				soundClick:Play()
				ScrllForInfo.Visible = false
				ScrllForRemotes.Visible = false
				SearchRemotesBox.Visible = false
				ScrllForFunctions.Visible = true
				task.wait()
		end)
		
		RemotesButton.MouseButton1Click:Connect(function()
			soundClick:Play()
			FindAllRemotes()
			ScrllForInfo.Visible = false
			ScrllForFunctions.Visible = false
			ScrllForRemotes.Visible = true
			SearchRemotesBox.Visible = true
			task.wait()
		end)
		
		Info_Button.MouseButton1Click:Connect(function()
			soundClick:Play()
			for index, element in pairs(ScrllForInfo:GetChildren()) do
				if not element:IsA("UIListLayout") then
				element:Destroy()
				end
			end
			CreateAllInfoLabels()
			ScrllForRemotes.Visible = false
			ScrllForFunctions.Visible = false
			SearchRemotesBox.Visible = false
			ScrllForInfo.Visible = true
			task.wait()
		end)
		-- MOUSE CLICK FUNCTIONS --
	end
end

-- ADD BUTTON
function DozikLibrary:AddButton(CheatName, OnClick)
	if windowsCreated then
		local label = Instance.new("TextLabel", ScrllForFunctions)
		label.Text = CheatName
		label.TextScaled  = true
		label.Size = UDim2.new(0.682, 0,0.15, 0)
		label.Font = Enum.Font.Highway
		label.BackgroundTransparency = 0.3
		label.BackgroundColor = BrickColor.new("White")
		label.TextColor = BrickColor.new("Really black")
		label.TextXAlignment = Enum.TextXAlignment.Left
		
		local TextButton = Instance.new("TextButton", label)
		TextButton.Text = "Use"
		TextButton.TextScaled  = true
		TextButton.Size = UDim2.new(0.466, 0,0.989, 0)
		TextButton.Position = UDim2.new(1, 0,0, 0)
		TextButton.Font = Enum.Font.Highway
		TextButton.BackgroundTransparency = 0
		TextButton.BackgroundColor = BrickColor.new("Really black")
		TextButton.TextColor = BrickColor.new("White")
		
		TextButton.MouseButton1Click:Connect(OnClick)
	end
end

function DozikLibrary:RemotesFrame(Event)
	if windowsCreated and Event then
		
	local inputFields = {}
	local args = {}
	
	local Frame = Instance.new("Frame", ScreenGui)
	Frame.Active = true
	Frame.Draggable = true
	Frame.Name = "RemotesFrame"
	Frame.BackgroundTransparency = 0.3
	Frame.BackgroundColor = BrickColor.new("White")
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0.518, 0,0.475, 0)
	Frame.Size = UDim2.new(0.219, 0,0.182, 0)
	
	local AddButton = Instance.new("TextButton", Frame)
	AddButton.Name = "Add_Button"
	AddButton.TextScaled = true
	AddButton.BorderSizePixel = 0
	AddButton.BackgroundTransparency = 0.5
	AddButton.Text = "+"
	AddButton.Position = UDim2.new(0.853, 0,0.733, 0)
	AddButton.Size = UDim2.new(0.118, 0,0.267, 0)
	AddButton.TextColor = BrickColor.new("Really black")
	AddButton.BackgroundColor = BrickColor.new("White")
	
	local ScrollFrame = Instance.new("ScrollingFrame", Frame)
	ScrollFrame.Name = "ScrollFrame"
	ScrollFrame.CanvasSize = UDim2.new(0,0,50,0)
	ScrollFrame.ScrollBarThickness = 3
	ScrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
	ScrollFrame.BackgroundTransparency = 0.5
	ScrollFrame.BackgroundColor = BrickColor.new("White")
	ScrollFrame.BorderSizePixel = 0
	ScrollFrame.Size = UDim2.new(1, 0,0.733, 0)
	ScrollFrame.Position = UDim2.new(0, 0,0, 0)
	ScrollFrame.ScrollBarImageColor3 = Color3.new(0,0,0)
	
	local UIListLayout = Instance.new("UIListLayout", ScrollFrame)
	UIListLayout.Padding = UDim.new(0,5)
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	
	local Fire_Button = Instance.new("TextButton", Frame)
	Fire_Button.Name = "Fire_Button"
	Fire_Button.TextScaled = true
	Fire_Button.BorderSizePixel = 0
	Fire_Button.BackgroundTransparency = 0.5
	Fire_Button.Text = "Fire"
	Fire_Button.Position = UDim2.new(0.51, 0,0.733, 0)
	Fire_Button.Size = UDim2.new(0.31, 0,0.267, 0)
	Fire_Button.TextColor = BrickColor.new("Really black")
	Fire_Button.BackgroundColor3 = Color3.new(0.980392, 0.545098, 0.254902)
	
	local function CreateArgument()
	local EnterArgument = Instance.new("TextBox", ScrollFrame)
	EnterArgument.Name = "EnterArgument"
	EnterArgument.PlaceholderText = "Argument" .. " [" .. #ScrollFrame:GetChildren() - 1 .. "]"
	EnterArgument.TextXAlignment = Enum.TextXAlignment.Left
	EnterArgument.BackgroundColor = BrickColor.new("White")
	EnterArgument.Text = ""
	EnterArgument.TextScaled = true
	EnterArgument.BorderSizePixel = 0
	EnterArgument.TextColor = BrickColor.new("Really black")
	EnterArgument.Size = UDim2.new(0.853, 0,0.25, 0)
	EnterArgument.Font = Enum.Font.Oswald
	table.insert(inputFields, EnterArgument)
	
	local DeleteArgButton = Instance.new("TextButton", EnterArgument)
	DeleteArgButton.Name = "DeleteArg"
	DeleteArgButton.Text = "-"
	DeleteArgButton.TextScaled = true
	DeleteArgButton.BackgroundColor3 = Color3.new(0.384314, 0.384314, 0.384314)
	DeleteArgButton.TextColor = BrickColor.new("White")
	DeleteArgButton.Size = UDim2.new(0.173, 0,1, 0)
	DeleteArgButton.Position = UDim2.new(1, 0,0, 0)
	DeleteArgButton.BorderSizePixel = 0
	
	DeleteArgButton.MouseButton1Click:Connect(function()
		soundClick:Play()
		EnterArgument:Destroy()
	end)
	end
	
	CreateArgument()
	
	Fire_Button.MouseButton1Click:Connect(function()
		Frame:Destroy()
		for index, field in pairs(inputFields) do
			if field.Text ~= "" then
				table.insert(args, field.Text)
			else
				DozikLibrary.Notify("The field cannot be empty!", "", 2)
			end
		end
		if Event:IsA("RemoteEvent") then
			Event:FireServer(unpack(args))
			DozikLibrary.Notify(Event.Name .. " fired!", "", 2)
			table.clear(args)
		elseif Event:IsA("RemoteFunction") then
			Event:InvokeServer(unpack(args))
			DozikLibrary.Notify(Event.Name .. " invoked!", "", 2)
			table.clear(args)
		elseif Event:IsA("BindableEvent") then
			Event:Fire(unpack(args))
			DozikLibrary.Notify(Event.Name .. " fired!", "", 2)
			table.clear(args)
		else
			DozikLibrary.Notify("Error", "This event type was not found", 2)
			table.clear(args)
		end
	end)
	
	AddButton.MouseButton1Click:Connect(function()
		soundClick:Play()
		CreateArgument()
	end)
	
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
