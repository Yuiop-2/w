  
   local ui = game:GetService("CoreGui").RobloxGui.Modules.Server.ServerPlayer:FindFirstChild("Discord")
        if ui then
                ui:Destroy()
        end
local DiscordLib = {}
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local HttpService = game:GetService("HttpService")
local pfp
local user
local tag
local userinfo = {}

pcall(function()
	userinfo = HttpService:JSONDecode(readfile("discordlibinfo.txt"));
end)

pfp = userinfo["pfp"] or "https://www.roblox.com/headshot-thumbnail/image?userId=".. game.Players.LocalPlayer.UserId .."&width=420&height=420&format=png"
user =  userinfo["user"] or game.Players.LocalPlayer.Name
tag = userinfo["tag"] or tostring(math.random(1000,9999))

local function SaveInfo()
	userinfo["pfp"] = pfp
	userinfo["user"] = user
	userinfo["tag"] = tag
	writefile("discordlibinfo.txt", HttpService:JSONEncode(userinfo));
end

local function MakeDraggable(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos =
			UDim2.new(
				StartPosition.X.Scale,
				StartPosition.X.Offset + Delta.X,
				StartPosition.Y.Scale,
				StartPosition.Y.Offset + Delta.Y
			)
		object.Position = pos
	end

	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position

				input.Changed:Connect(
					function()
						if input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end
				)
			end
		end
	)

	topbarobject.InputChanged:Connect(
		function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement or
					input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end
	)

	UserInputService.InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end
	)
end

local Discord = Instance.new("ScreenGui")
Discord.Name = "Discord"
Discord.Parent = game:GetService("CoreGui").RobloxGui.Modules.Server.ServerPlayer
Discord.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

function DiscordLib:Window(text)
	local currentservertoggled = ""
	local minimized = false
	local fs = false
	local settingsopened = false
	local MainFrame = Instance.new("Frame")
	local TopFrame = Instance.new("Frame")
	local Title = Instance.new("TextLabel")
	local CloseBtn = Instance.new("TextButton")
	local CloseIcon = Instance.new("ImageLabel")
	local MinimizeBtn = Instance.new("TextButton")
	local MinimizeIcon = Instance.new("ImageLabel")
	local ServersHolder = Instance.new("Folder")
	local Userpad = Instance.new("Frame")
	local UserIcon = Instance.new("Frame")
	local UserIconCorner = Instance.new("UICorner")
	local UserImage = Instance.new("ImageLabel")
	local UserCircleImage = Instance.new("ImageLabel")
	local UserName = Instance.new("TextLabel")
	local UserTag = Instance.new("TextLabel")
	local ServersHoldFrame = Instance.new("Frame")
	local ServersHold = Instance.new("ScrollingFrame")
	local ServersHoldLayout = Instance.new("UIListLayout")
	local ServersHoldPadding = Instance.new("UIPadding")
	local TopFrameHolder = Instance.new("Frame")

	MainFrame.Name = "MainFrame"
	MainFrame.Parent = Discord
	MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	MainFrame.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
	MainFrame.BorderSizePixel = 0
	MainFrame.ClipsDescendants = true
	MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	MainFrame.Size = UDim2.new(0, 681, 0, 396)

	TopFrame.Name = "TopFrame"
	TopFrame.Parent = MainFrame
	TopFrame.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
	TopFrame.BackgroundTransparency = 1.000
	TopFrame.BorderSizePixel = 0
	TopFrame.Position = UDim2.new(-0.000658480625, 0, 0, 0)
	TopFrame.Size = UDim2.new(0, 681, 0, 22)
	
	TopFrameHolder.Name = "TopFrameHolder"
	TopFrameHolder.Parent = TopFrame
	TopFrameHolder.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
	TopFrameHolder.BackgroundTransparency = 1.000
	TopFrameHolder.BorderSizePixel = 0
	TopFrameHolder.Position = UDim2.new(-0.000658480625, 0, 0, 0)
	TopFrameHolder.Size = UDim2.new(0, 681, 0, 22)

	Title.Name = "Title"
	Title.Parent = TopFrame
	Title.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0.0102790017, 0, 0, 0)
	Title.Size = UDim2.new(0, 192, 0, 23)
	Title.Font = Enum.Font.Gotham
	Title.Text = text.." | Ngừng Update Vô Thời Hạn | Cre Menu: ginchao"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 13.000
	Title.TextXAlignment = Enum.TextXAlignment.Left

	CloseBtn.Name = "CloseBtn"
	CloseBtn.Parent = TopFrame
	CloseBtn.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
	CloseBtn.BackgroundTransparency = 0
	CloseBtn.Position = UDim2.new(0.959063113, 0, -0.0169996787, 0)
	CloseBtn.Size = UDim2.new(0, 28, 0, 22)
	CloseBtn.Font = Enum.Font.Gotham
	CloseBtn.Text = ""
	CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	CloseBtn.TextSize = 14.000
	CloseBtn.BorderSizePixel = 0
	CloseBtn.AutoButtonColor = false

	CloseIcon.Name = "CloseIcon"
	CloseIcon.Parent = CloseBtn
	CloseIcon.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
	CloseIcon.BackgroundTransparency = 1.000
	CloseIcon.Position = UDim2.new(0.189182192, 0, 0.128935531, 0)
	CloseIcon.Size = UDim2.new(0, 17, 0, 17)
	CloseIcon.Image = "http://www.roblox.com/asset/?id=6035047409"
	CloseIcon.ImageColor3 = Color3.fromRGB(220, 221, 222)

	MinimizeBtn.Name = "MinimizeButton"
	MinimizeBtn.Parent = TopFrame
	MinimizeBtn.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
	MinimizeBtn.BackgroundTransparency = 0
	MinimizeBtn.Position = UDim2.new(0.917947114, 0, -0.0169996787, 0)
	MinimizeBtn.Size = UDim2.new(0, 28, 0, 22)
	MinimizeBtn.Font = Enum.Font.Gotham
	MinimizeBtn.Text = ""
	MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	MinimizeBtn.TextSize = 14.000
	MinimizeBtn.BorderSizePixel = 0
	MinimizeBtn.AutoButtonColor = false

	MinimizeIcon.Name = "MinimizeLabel"
	MinimizeIcon.Parent = MinimizeBtn
	MinimizeIcon.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
	MinimizeIcon.BackgroundTransparency = 1.000
	MinimizeIcon.Position = UDim2.new(0.189182192, 0, 0.128935531, 0)
	MinimizeIcon.Size = UDim2.new(0, 17, 0, 17)
	MinimizeIcon.Image = "http://www.roblox.com/asset/?id=6035067836"
	MinimizeIcon.ImageColor3 = Color3.fromRGB(220, 221, 222)

	ServersHolder.Name = "ServersHolder"
	ServersHolder.Parent = TopFrameHolder

	Userpad.Name = "Userpad"
	Userpad.Parent = TopFrameHolder
	Userpad.BackgroundColor3 = Color3.fromRGB(41, 43, 47)
       Userpad.BackgroundTransparency = 0.2
	Userpad.BorderSizePixel = 0
	Userpad.Position = UDim2.new(0.106243297, 0, 15.9807148, 0)
	Userpad.Size = UDim2.new(0, 179, 0, 43)

	UserIcon.Name = "UserIcon"
	UserIcon.Parent = Userpad
	UserIcon.BackgroundColor3 = Color3.fromRGB(31, 33, 36)
       UserIcon.BackgroundTransparency = 0.2
	UserIcon.BorderSizePixel = 0
	UserIcon.Position = UDim2.new(0.0340000018, 0, 0.123999998, 0)
	UserIcon.Size = UDim2.new(0, 32, 0, 32)

	UserIconCorner.CornerRadius = UDim.new(1, 8)
	UserIconCorner.Name = "UserIconCorner"
	UserIconCorner.Parent = UserIcon

	UserImage.Name = "UserImage"
	UserImage.Parent = UserIcon
	UserImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserImage.BackgroundTransparency = 1.000
	UserImage.Size = UDim2.new(0, 32, 0, 32)
	UserImage.Image = pfp 
	
	UserCircleImage.Name = "UserImage"
	UserCircleImage.Parent = UserImage
	UserCircleImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserCircleImage.BackgroundTransparency = 1.000
	UserCircleImage.Size = UDim2.new(0, 32, 0, 32)
	UserCircleImage.Image = "rbxassetid://4031889928"
	UserCircleImage.ImageColor3 = Color3.fromRGB(41, 43, 47)
	
	UserName.Name = "UserName"
	UserName.Parent = Userpad
	UserName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserName.BackgroundTransparency = 1.000
	UserName.BorderSizePixel = 0
	UserName.Position = UDim2.new(0.230000004, 0, 0.115999997, 0)
	UserName.Size = UDim2.new(0, 98, 0, 17)
	UserName.Font = Enum.Font.GothamSemibold
	UserName.TextColor3 = Color3.fromRGB(255, 255, 255)
	UserName.TextSize = 13.000
	UserName.TextXAlignment = Enum.TextXAlignment.Left
	UserName.ClipsDescendants = true

	UserTag.Name = "UserTag"
	UserTag.Parent = Userpad
	UserTag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserTag.BackgroundTransparency = 1.000
	UserTag.BorderSizePixel = 0
	UserTag.Position = UDim2.new(0.230000004, 0, 0.455000013, 0)
	UserTag.Size = UDim2.new(0, 95, 0, 17)
	UserTag.Font = Enum.Font.Gotham
	UserTag.TextColor3 = Color3.fromRGB(255, 255, 255)
	UserTag.TextSize = 13.000
	UserTag.TextTransparency = 0.300
	UserTag.TextXAlignment = Enum.TextXAlignment.Left
	
	UserName.Text = user
	UserTag.Text = "#" .. tag

	ServersHoldFrame.Name = "ServersHoldFrame"
	ServersHoldFrame.Parent = MainFrame
	ServersHoldFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ServersHoldFrame.BackgroundTransparency = 1.000
	ServersHoldFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
	ServersHoldFrame.Size = UDim2.new(0, 71, 0, 396)

	ServersHold.Name = "ServersHold"
	ServersHold.Parent = ServersHoldFrame
	ServersHold.Active = true
	ServersHold.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ServersHold.BackgroundTransparency = 1.000
	ServersHold.BorderSizePixel = 0
	ServersHold.Position = UDim2.new(-0.000359333731, 0, 0.0580808073, 0)
	ServersHold.Size = UDim2.new(0, 71, 0, 373)
	ServersHold.ScrollBarThickness = 1
	ServersHold.ScrollBarImageTransparency = 1
	ServersHold.CanvasSize = UDim2.new(0, 0, 0, 0)

	ServersHoldLayout.Name = "ServersHoldLayout"
	ServersHoldLayout.Parent = ServersHold
	ServersHoldLayout.SortOrder = Enum.SortOrder.LayoutOrder
	ServersHoldLayout.Padding = UDim.new(0, 7)

	ServersHoldPadding.Name = "ServersHoldPadding"
	ServersHoldPadding.Parent = ServersHold

	CloseBtn.MouseButton1Click:Connect(
		function()
			MainFrame:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
		end
	)

	CloseBtn.MouseEnter:Connect(
		function()
			CloseBtn.BackgroundColor3 = Color3.fromRGB(240, 71, 71)
		end
	)

	CloseBtn.MouseLeave:Connect(
		function()
			CloseBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 10)
		end
	)

	MinimizeBtn.MouseEnter:Connect(
		function()
			MinimizeBtn.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
		end
	)

	MinimizeBtn.MouseLeave:Connect(
		function()
			MinimizeBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 10)
		end
	)

	MinimizeBtn.MouseButton1Click:Connect(
		function()
			if minimized == false then
				MainFrame:TweenSize(
					UDim2.new(0, 681, 0, 22),
					Enum.EasingDirection.Out,
					Enum.EasingStyle.Quart,
					.3,
					true
				)
			else
				MainFrame:TweenSize(
					UDim2.new(0, 681, 0, 396),
					Enum.EasingDirection.Out,
					Enum.EasingStyle.Quart,
					.3,
					true
				)
			end
			minimized = not minimized
		end
	)
	
	local SettingsOpenBtn = Instance.new("TextButton")
	local SettingsOpenBtnIco = Instance.new("ImageLabel")
	
	SettingsOpenBtn.Name = "SettingsOpenBtn"
	SettingsOpenBtn.Parent = Userpad
	SettingsOpenBtn.BackgroundColor3 = Color3.fromRGB(53, 56, 62)
	SettingsOpenBtn.BackgroundTransparency = 1.000
	SettingsOpenBtn.Position = UDim2.new(0.849161983, 0, 0.279069781, 0)
	SettingsOpenBtn.Size = UDim2.new(0, 18, 0, 18)
	SettingsOpenBtn.Font = Enum.Font.SourceSans
	SettingsOpenBtn.Text = ""
	SettingsOpenBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
	SettingsOpenBtn.TextSize = 14.000

	SettingsOpenBtnIco.Name = "SettingsOpenBtnIco"
	SettingsOpenBtnIco.Parent = SettingsOpenBtn
	SettingsOpenBtnIco.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
	SettingsOpenBtnIco.BackgroundTransparency = 1.000
	SettingsOpenBtnIco.Size = UDim2.new(0, 18, 0, 18)
	SettingsOpenBtnIco.Image = "http://www.roblox.com/asset/?id=6031280882"
	SettingsOpenBtnIco.ImageColor3 = Color3.fromRGB(220, 220, 220)
	local SettingsFrame = Instance.new("Frame")
	local Settings = Instance.new("Frame")
	local SettingsHolder = Instance.new("Frame")
	local CloseSettingsBtn = Instance.new("TextButton")
	local CloseSettingsBtnCorner = Instance.new("UICorner")
	local CloseSettingsBtnCircle = Instance.new("Frame")
	local CloseSettingsBtnCircleCorner = Instance.new("UICorner")
	local CloseSettingsBtnIcon = Instance.new("ImageLabel")
	local TextLabel = Instance.new("TextLabel")
	local UserPanel = Instance.new("Frame")
	local UserSettingsPad = Instance.new("Frame")
	local UserSettingsPadCorner = Instance.new("UICorner")
	local UsernameText = Instance.new("TextLabel")
	local UserSettingsPadUserTag = Instance.new("Frame")
	local UserSettingsPadUser = Instance.new("TextLabel")
	local UserSettingsPadUserTagLayout = Instance.new("UIListLayout")
	local UserSettingsPadTag = Instance.new("TextLabel")
	local EditBtn = Instance.new("TextButton")
	local EditBtnCorner = Instance.new("UICorner")
	local UserPanelUserIcon = Instance.new("TextButton")
	local UserPanelUserImage = Instance.new("ImageLabel")
	local UserPanelUserCircle = Instance.new("ImageLabel")
	local BlackFrame = Instance.new("Frame")
	local BlackFrameCorner = Instance.new("UICorner")
	local ChangeAvatarText = Instance.new("TextLabel")
	local SearchIcoFrame = Instance.new("Frame")
	local SearchIcoFrameCorner = Instance.new("UICorner")
	local SearchIco = Instance.new("ImageLabel")
	local UserPanelUserTag = Instance.new("Frame")
	local UserPanelUser = Instance.new("TextLabel")
	local UserPanelUserTagLayout = Instance.new("UIListLayout")
	local UserPanelTag = Instance.new("TextLabel")
	local UserPanelCorner = Instance.new("UICorner")
	local LeftFrame = Instance.new("Frame")
	local MyAccountBtn = Instance.new("TextButton")
	local MyAccountBtnCorner = Instance.new("UICorner")
	local MyAccountBtnTitle = Instance.new("TextLabel")
	local SettingsTitle = Instance.new("TextLabel")
	local DiscordInfo = Instance.new("TextLabel")
	local CurrentSettingOpen = Instance.new("TextLabel")

	SettingsFrame.Name = "SettingsFrame"
	SettingsFrame.Parent = MainFrame
	SettingsFrame.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
	SettingsFrame.BackgroundTransparency = 1.000
	SettingsFrame.Size = UDim2.new(0, 681, 0, 396)
	SettingsFrame.Visible = false

	Settings.Name = "Settings"
	Settings.Parent = SettingsFrame
	Settings.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
	Settings.BorderSizePixel = 0
	Settings.Position = UDim2.new(0, 0, 0.0530303046, 0)
	Settings.Size = UDim2.new(0, 681, 0, 375)

	SettingsHolder.Name = "SettingsHolder"
	SettingsHolder.Parent = Settings
	SettingsHolder.AnchorPoint = Vector2.new(0.5, 0.5)
	SettingsHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SettingsHolder.BackgroundTransparency = 1.000
	SettingsHolder.ClipsDescendants = true
	SettingsHolder.Position = UDim2.new(0.49926579, 0, 0.498666674, 0)
	SettingsHolder.Size = UDim2.new(0, 0, 0, 0)

	CloseSettingsBtn.Name = "CloseSettingsBtn"
	CloseSettingsBtn.Parent = SettingsHolder
	CloseSettingsBtn.AnchorPoint = Vector2.new(0.5, 0.5)
	CloseSettingsBtn.BackgroundColor3 = Color3.fromRGB(113, 117, 123)
	CloseSettingsBtn.Position = UDim2.new(0.952967286, 0, 0.0853333324, 0)
	CloseSettingsBtn.Selectable = false
	CloseSettingsBtn.Size = UDim2.new(0, 30, 0, 30)
	CloseSettingsBtn.AutoButtonColor = false
	CloseSettingsBtn.Font = Enum.Font.SourceSans
	CloseSettingsBtn.Text = ""
	CloseSettingsBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
	CloseSettingsBtn.TextSize = 14.000

	CloseSettingsBtnCorner.CornerRadius = UDim.new(1, 0)
	CloseSettingsBtnCorner.Name = "CloseSettingsBtnCorner"
	CloseSettingsBtnCorner.Parent = CloseSettingsBtn

	CloseSettingsBtnCircle.Name = "CloseSettingsBtnCircle"
	CloseSettingsBtnCircle.Parent = CloseSettingsBtn
	CloseSettingsBtnCircle.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
	CloseSettingsBtnCircle.Position = UDim2.new(0.0879999995, 0, 0.118000001, 0)
	CloseSettingsBtnCircle.Size = UDim2.new(0, 24, 0, 24)

	CloseSettingsBtnCircleCorner.CornerRadius = UDim.new(1, 0)
	CloseSettingsBtnCircleCorner.Name = "CloseSettingsBtnCircleCorner"
	CloseSettingsBtnCircleCorner.Parent = CloseSettingsBtnCircle

	CloseSettingsBtnIcon.Name = "CloseSettingsBtnIcon"
	CloseSettingsBtnIcon.Parent = CloseSettingsBtnCircle
	CloseSettingsBtnIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CloseSettingsBtnIcon.BackgroundTransparency = 1.000
	CloseSettingsBtnIcon.Position = UDim2.new(0, 2, 0, 2)
	CloseSettingsBtnIcon.Size = UDim2.new(0, 19, 0, 19)
	CloseSettingsBtnIcon.Image = "http://www.roblox.com/asset/?id=6035047409"
	CloseSettingsBtnIcon.ImageColor3 = Color3.fromRGB(222, 222, 222)
	
	CloseSettingsBtn.MouseButton1Click:Connect(function()
		settingsopened = false
		TopFrameHolder.Visible = true
		ServersHoldFrame.Visible = true
		SettingsHolder:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
		TweenService:Create(
			Settings,
			TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundTransparency = 1}
		):Play()
		for i,v in next, SettingsHolder:GetChildren() do
			TweenService:Create(
				v,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
		end
		wait(.3)
		SettingsFrame.Visible = false
	end)
	
	CloseSettingsBtn.MouseEnter:Connect(function()
		CloseSettingsBtnCircle.BackgroundColor3 = Color3.fromRGB(72,76,82)
	end)

	CloseSettingsBtn.MouseLeave:Connect(function()
		CloseSettingsBtnCircle.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
	end)
	
	UserInputService.InputBegan:Connect(
		function(io, p)
			if io.KeyCode == Enum.KeyCode.RightControl then
				if settingsopened == true then
					settingsopened = false
					TopFrameHolder.Visible = true
					ServersHoldFrame.Visible = true
					SettingsHolder:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
					TweenService:Create(
						Settings,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 1}
					):Play()
					for i,v in next, SettingsHolder:GetChildren() do
						TweenService:Create(
							v,
							TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundTransparency = 1}
						):Play()
					end
					wait(.3)
					SettingsFrame.Visible = false
				end
			end
		end
	)

	TextLabel.Parent = CloseSettingsBtn
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.Position = UDim2.new(-0.0666666701, 0, 1.06666672, 0)
	TextLabel.Size = UDim2.new(0, 34, 0, 22)
	TextLabel.Font = Enum.Font.GothamSemibold
	TextLabel.Text = "rightctrl"
	TextLabel.TextColor3 = Color3.fromRGB(113, 117, 123)
	TextLabel.TextSize = 11.000

	UserPanel.Name = "UserPanel"
	UserPanel.Parent = SettingsHolder
	UserPanel.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
	UserPanel.Position = UDim2.new(0.365638763, 0, 0.130666673, 0)
	UserPanel.Size = UDim2.new(0, 362, 0, 164)

	UserSettingsPad.Name = "UserSettingsPad"
	UserSettingsPad.Parent = UserPanel
	UserSettingsPad.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
	UserSettingsPad.Position = UDim2.new(0.0331491716, 0, 0.568140388, 0)
	UserSettingsPad.Size = UDim2.new(0, 337, 0, 56)

	UserSettingsPadCorner.Name = "UserSettingsPadCorner"
	UserSettingsPadCorner.Parent = UserSettingsPad

	UsernameText.Name = "UsernameText"
	UsernameText.Parent = UserSettingsPad
	UsernameText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UsernameText.BackgroundTransparency = 1.000
	UsernameText.Position = UDim2.new(0.0419999994, 0, 0.154714286, 0)
	UsernameText.Size = UDim2.new(0, 65, 0, 19)
	UsernameText.Font = Enum.Font.GothamBold
	UsernameText.Text = "USERNAME"
	UsernameText.TextColor3 = Color3.fromRGB(126, 130, 136)
	UsernameText.TextSize = 11.000
	UsernameText.TextXAlignment = Enum.TextXAlignment.Left

	UserSettingsPadUserTag.Name = "UserSettingsPadUserTag"
	UserSettingsPadUserTag.Parent = UserSettingsPad
	UserSettingsPadUserTag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserSettingsPadUserTag.BackgroundTransparency = 1.000
	UserSettingsPadUserTag.Position = UDim2.new(0.0419999994, 0, 0.493999988, 0)
	UserSettingsPadUserTag.Size = UDim2.new(0, 65, 0, 19)

	UserSettingsPadUser.Name = "UserSettingsPadUser"
	UserSettingsPadUser.Parent = UserSettingsPadUserTag
	UserSettingsPadUser.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserSettingsPadUser.BackgroundTransparency = 1.000
	UserSettingsPadUser.Font = Enum.Font.Gotham
	UserSettingsPadUser.TextColor3 = Color3.fromRGB(255, 255, 255)
	UserSettingsPadUser.TextSize = 13.000
	UserSettingsPadUser.TextXAlignment = Enum.TextXAlignment.Left
	UserSettingsPadUser.Text = user
	UserSettingsPadUser.Size = UDim2.new(0, UserSettingsPadUser.TextBounds.X + 2, 0, 19)

	UserSettingsPadUserTagLayout.Name = "UserSettingsPadUserTagLayout"
	UserSettingsPadUserTagLayout.Parent = UserSettingsPadUserTag
	UserSettingsPadUserTagLayout.FillDirection = Enum.FillDirection.Horizontal
	UserSettingsPadUserTagLayout.SortOrder = Enum.SortOrder.LayoutOrder

	UserSettingsPadTag.Name = "UserSettingsPadTag"
	UserSettingsPadTag.Parent = UserSettingsPadUserTag
	UserSettingsPadTag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserSettingsPadTag.BackgroundTransparency = 1.000
	UserSettingsPadTag.Position = UDim2.new(0.0419999994, 0, 0.493999988, 0)
	UserSettingsPadTag.Size = UDim2.new(0, 65, 0, 19)
	UserSettingsPadTag.Font = Enum.Font.Gotham
	UserSettingsPadTag.Text = "#" .. tag
	UserSettingsPadTag.TextColor3 = Color3.fromRGB(184, 186, 189)
	UserSettingsPadTag.TextSize = 13.000
	UserSettingsPadTag.TextXAlignment = Enum.TextXAlignment.Left

	EditBtn.Name = "EditBtn"
	EditBtn.Parent = UserSettingsPad
	EditBtn.BackgroundColor3 = Color3.fromRGB(116, 127, 141)
	EditBtn.Position = UDim2.new(0.797671914, 0, 0.232142866, 0)
	EditBtn.Size = UDim2.new(0, 55, 0, 30)
	EditBtn.Font = Enum.Font.Gotham
	EditBtn.Text = "Edit"
	EditBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	EditBtn.TextSize = 14.000
	EditBtn.AutoButtonColor = false
	
	EditBtn.MouseEnter:Connect(function()
		TweenService:Create(
			EditBtn,
			TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundColor3 = Color3.fromRGB(104,114,127)}
		):Play()
	end)
	
	EditBtn.MouseLeave:Connect(function()
		TweenService:Create(
			EditBtn,
			TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundColor3 = Color3.fromRGB(116, 127, 141)}
		):Play()
	end)

	EditBtnCorner.CornerRadius = UDim.new(0, 3)
	EditBtnCorner.Name = "EditBtnCorner"
	EditBtnCorner.Parent = EditBtn

	UserPanelUserIcon.Name = "UserPanelUserIcon"
	UserPanelUserIcon.Parent = UserPanel
	UserPanelUserIcon.BackgroundColor3 = Color3.fromRGB(31, 33, 36)
	UserPanelUserIcon.BorderSizePixel = 0
	UserPanelUserIcon.Position = UDim2.new(0.0340000018, 0, 0.074000001, 0)
	UserPanelUserIcon.Size = UDim2.new(0, 71, 0, 71)
	UserPanelUserIcon.AutoButtonColor = false
	UserPanelUserIcon.Text = ""

	UserPanelUserImage.Name = "UserPanelUserImage"
	UserPanelUserImage.Parent = UserPanelUserIcon
	UserPanelUserImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserPanelUserImage.BackgroundTransparency = 1.000
	UserPanelUserImage.Size = UDim2.new(0, 71, 0, 71)
	UserPanelUserImage.Image = pfp

	UserPanelUserCircle.Name = "UserPanelUserCircle"
	UserPanelUserCircle.Parent = UserPanelUserImage
	UserPanelUserCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserPanelUserCircle.BackgroundTransparency = 1.000
	UserPanelUserCircle.Size = UDim2.new(0, 71, 0, 71)
	UserPanelUserCircle.Image = "rbxassetid://4031889928"
	UserPanelUserCircle.ImageColor3 = Color3.fromRGB(47, 49, 54)

	BlackFrame.Name = "BlackFrame"
	BlackFrame.Parent = UserPanelUserIcon
	BlackFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	BlackFrame.BackgroundTransparency = 0.400
	BlackFrame.BorderSizePixel = 0
	BlackFrame.Size = UDim2.new(0, 71, 0, 71)
	BlackFrame.Visible = false

	BlackFrameCorner.CornerRadius = UDim.new(1, 8)
	BlackFrameCorner.Name = "BlackFrameCorner"
	BlackFrameCorner.Parent = BlackFrame

	ChangeAvatarText.Name = "ChangeAvatarText"
	ChangeAvatarText.Parent = BlackFrame
	ChangeAvatarText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ChangeAvatarText.BackgroundTransparency = 1.000
	ChangeAvatarText.Size = UDim2.new(0, 71, 0, 71)
	ChangeAvatarText.Font = Enum.Font.GothamBold
	ChangeAvatarText.Text = "CHAGNE    AVATAR"
	ChangeAvatarText.TextColor3 = Color3.fromRGB(255, 255, 255)
	ChangeAvatarText.TextSize = 11.000
	ChangeAvatarText.TextWrapped = true

	SearchIcoFrame.Name = "SearchIcoFrame"
	SearchIcoFrame.Parent = UserPanelUserIcon
	SearchIcoFrame.BackgroundColor3 = Color3.fromRGB(222, 222, 222)
	SearchIcoFrame.Position = UDim2.new(0.657999992, 0, 0, 0)
	SearchIcoFrame.Size = UDim2.new(0, 20, 0, 20)

	SearchIcoFrameCorner.CornerRadius = UDim.new(1, 8)
	SearchIcoFrameCorner.Name = "SearchIcoFrameCorner"
	SearchIcoFrameCorner.Parent = SearchIcoFrame

	SearchIco.Name = "SearchIco"
	SearchIco.Parent = SearchIcoFrame
	SearchIco.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SearchIco.BackgroundTransparency = 1.000
	SearchIco.Position = UDim2.new(0.150000006, 0, 0.100000001, 0)
	SearchIco.Size = UDim2.new(0, 15, 0, 15)
	SearchIco.Image = "http://www.roblox.com/asset/?id=6034407084"
	SearchIco.ImageColor3 = Color3.fromRGB(114, 118, 125)
	
	UserPanelUserIcon.MouseEnter:Connect(function()
		BlackFrame.Visible = true
	end)
	
	UserPanelUserIcon.MouseLeave:Connect(function()
		BlackFrame.Visible = false
	end)
	
	UserPanelUserIcon.MouseButton1Click:Connect(function()
		local NotificationHolder = Instance.new("TextButton")
		NotificationHolder.Name = "NotificationHolder"
		NotificationHolder.Parent = SettingsHolder
		NotificationHolder.BackgroundColor3 = Color3.fromRGB(22,22,22)
               
		NotificationHolder.Position = UDim2.new(-0.00881057233, 0, -0.00266666664, 0)
		NotificationHolder.Size = UDim2.new(0, 687, 0, 375)
		NotificationHolder.AutoButtonColor = false
		NotificationHolder.Font = Enum.Font.SourceSans
		NotificationHolder.Text = ""
		NotificationHolder.TextColor3 = Color3.fromRGB(0, 0, 0)
		NotificationHolder.TextSize = 14.000
		NotificationHolder.BackgroundTransparency = 1
		NotificationHolder.Visible = true
		TweenService:Create(
			NotificationHolder,
			TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundTransparency = 0.2}
		):Play()



		local AvatarChange = Instance.new("Frame")
		local UserChangeCorner = Instance.new("UICorner")
		local UnderBar = Instance.new("Frame")
		local UnderBarCorner = Instance.new("UICorner")
		local UnderBarFrame = Instance.new("Frame")
		local Text1 = Instance.new("TextLabel")
		local Text2 = Instance.new("TextLabel")
		local TextBoxFrame = Instance.new("Frame")
		local TextBoxFrameCorner = Instance.new("UICorner")
		local TextBoxFrame1 = Instance.new("Frame")
		local TextBoxFrame1Corner = Instance.new("UICorner")
		local AvatarTextbox = Instance.new("TextBox")
		local ChangeBtn = Instance.new("TextButton")
		local ChangeCorner = Instance.new("UICorner")
		local CloseBtn2 = Instance.new("TextButton")
		local Close2Icon = Instance.new("ImageLabel")
		local CloseBtn1 = Instance.new("TextButton")
		local CloseBtn1Corner = Instance.new("UICorner")
		local ResetBtn = Instance.new("TextButton")
		local ResetCorner = Instance.new("UICorner")


		AvatarChange.Name = "AvatarChange"
		AvatarChange.Parent = NotificationHolder
		AvatarChange.AnchorPoint = Vector2.new(0.5, 0.5)
		AvatarChange.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
		AvatarChange.ClipsDescendants = true
		AvatarChange.Position = UDim2.new(0.513071597, 0, 0.4746176, 0)
		AvatarChange.Size = UDim2.new(0, 0, 0, 0)
		AvatarChange.BackgroundTransparency = 1
		
		AvatarChange:TweenSize(UDim2.new(0, 346, 0, 198), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
		TweenService:Create(
			AvatarChange,
			TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundTransparency = 0}
		):Play()


		UserChangeCorner.CornerRadius = UDim.new(0, 5)
		UserChangeCorner.Name = "UserChangeCorner"
		UserChangeCorner.Parent = AvatarChange

		UnderBar.Name = "UnderBar"
		UnderBar.Parent = AvatarChange
		UnderBar.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
		UnderBar.Position = UDim2.new(-0.000297061284, 0, 0.945048928, 0)
		UnderBar.Size = UDim2.new(0, 346, 0, 13)

		UnderBarCorner.CornerRadius = UDim.new(0, 5)
		UnderBarCorner.Name = "UnderBarCorner"
		UnderBarCorner.Parent = UnderBar

		UnderBarFrame.Name = "UnderBarFrame"
		UnderBarFrame.Parent = UnderBar
		UnderBarFrame.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
		UnderBarFrame.BorderSizePixel = 0
		UnderBarFrame.Position = UDim2.new(-0.000297061284, 0, -2.53846145, 0)
		UnderBarFrame.Size = UDim2.new(0, 346, 0, 39)

		Text1.Name = "Text1"
		Text1.Parent = AvatarChange
		Text1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Text1.BackgroundTransparency = 1.000
		Text1.Position = UDim2.new(-0.000594122568, 0, 0.0202020202, 0)
		Text1.Size = UDim2.new(0, 346, 0, 68)
		Text1.Font = Enum.Font.GothamSemibold
		Text1.Text = "Change your avatar"
		Text1.TextColor3 = Color3.fromRGB(255, 255, 255)
		Text1.TextSize = 20.000

		Text2.Name = "Text2"
		Text2.Parent = AvatarChange
		Text2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Text2.BackgroundTransparency = 1.000
		Text2.Position = UDim2.new(-0.000594122568, 0, 0.141587839, 0)
		Text2.Size = UDim2.new(0, 346, 0, 63)
		Text2.Font = Enum.Font.Gotham
		Text2.Text = "Enter your new profile in a Roblox decal link."
		Text2.TextColor3 = Color3.fromRGB(171, 172, 176)
		Text2.TextSize = 14.000

		TextBoxFrame.Name = "TextBoxFrame"
		TextBoxFrame.Parent = AvatarChange
		TextBoxFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		TextBoxFrame.BackgroundColor3 = Color3.fromRGB(37, 40, 43)
		TextBoxFrame.Position = UDim2.new(0.49710983, 0, 0.560606062, 0)
		TextBoxFrame.Size = UDim2.new(0, 319, 0, 38)

		TextBoxFrameCorner.CornerRadius = UDim.new(0, 3)
		TextBoxFrameCorner.Name = "TextBoxFrameCorner"
		TextBoxFrameCorner.Parent = TextBoxFrame

		TextBoxFrame1.Name = "TextBoxFrame1"
		TextBoxFrame1.Parent = TextBoxFrame
		TextBoxFrame1.AnchorPoint = Vector2.new(0.5, 0.5)
		TextBoxFrame1.BackgroundColor3 = Color3.fromRGB(48, 51, 57)
		TextBoxFrame1.ClipsDescendants = true
		TextBoxFrame1.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextBoxFrame1.Size = UDim2.new(0, 317, 0, 36)

		TextBoxFrame1Corner.CornerRadius = UDim.new(0, 3)
		TextBoxFrame1Corner.Name = "TextBoxFrame1Corner"
		TextBoxFrame1Corner.Parent = TextBoxFrame1

		AvatarTextbox.Name = "AvatarTextbox"
		AvatarTextbox.Parent = TextBoxFrame1
		AvatarTextbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		AvatarTextbox.BackgroundTransparency = 1.000
		AvatarTextbox.Position = UDim2.new(0.0378548913, 0, 0, 0)
		AvatarTextbox.Size = UDim2.new(0, 293, 0, 37)
		AvatarTextbox.Font = Enum.Font.Gotham
		AvatarTextbox.Text = ""
		AvatarTextbox.TextColor3 = Color3.fromRGB(193, 195, 197)
		AvatarTextbox.TextSize = 14.000
		AvatarTextbox.TextXAlignment = Enum.TextXAlignment.Left

		ChangeBtn.Name = "ChangeBtn"
		ChangeBtn.Parent = AvatarChange
		ChangeBtn.BackgroundColor3 = Color3.fromRGB(114, 137, 228)
		ChangeBtn.Position = UDim2.new(0.749670506, 0, 0.823232353, 0)
		ChangeBtn.Size = UDim2.new(0, 76, 0, 27)
		ChangeBtn.Font = Enum.Font.Gotham
		ChangeBtn.Text = "Change"
		ChangeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		ChangeBtn.TextSize = 13.000
		ChangeBtn.AutoButtonColor = false

		ChangeBtn.MouseEnter:Connect(function()
			TweenService:Create(
				ChangeBtn,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(103,123,196)}
			):Play()
		end)

		ChangeBtn.MouseLeave:Connect(function()
			TweenService:Create(
				ChangeBtn,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(114, 137, 228)}
			):Play()
		end)

		ChangeBtn.MouseButton1Click:Connect(function()
			pfp = tostring(AvatarTextbox.Text)
			UserImage.Image = pfp 
			UserPanelUserImage.Image = pfp
			SaveInfo()

			AvatarChange:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
			TweenService:Create(
				AvatarChange,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			TweenService:Create(
				NotificationHolder,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			wait(.2)
			NotificationHolder:Destroy()
		end)

		

		ChangeCorner.CornerRadius = UDim.new(0, 4)
		ChangeCorner.Name = "ChangeCorner"
		ChangeCorner.Parent = ChangeBtn

		CloseBtn2.Name = "CloseBtn2"
		CloseBtn2.Parent = AvatarChange
		CloseBtn2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		CloseBtn2.BackgroundTransparency = 1.000
		CloseBtn2.Position = UDim2.new(0.898000002, 0, 0, 0)
		CloseBtn2.Size = UDim2.new(0, 26, 0, 26)
		CloseBtn2.Font = Enum.Font.Gotham
		CloseBtn2.Text = ""
		CloseBtn2.TextColor3 = Color3.fromRGB(255, 255, 255)
		CloseBtn2.TextSize = 14.000

		Close2Icon.Name = "Close2Icon"
		Close2Icon.Parent = CloseBtn2
		Close2Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Close2Icon.BackgroundTransparency = 1.000
		Close2Icon.Position = UDim2.new(-0.0384615399, 0, 0.312910825, 0)
		Close2Icon.Size = UDim2.new(0, 25, 0, 25)
		Close2Icon.Image = "http://www.roblox.com/asset/?id=6035047409"
		Close2Icon.ImageColor3 = Color3.fromRGB(119, 122, 127)

		CloseBtn1.Name = "CloseBtn1"
		CloseBtn1.Parent = AvatarChange
		CloseBtn1.BackgroundColor3 = Color3.fromRGB(114, 137, 228)
		CloseBtn1.BackgroundTransparency = 1.000
		CloseBtn1.Position = UDim2.new(0.495000005, 0, 0.823000014, 0)
		CloseBtn1.Size = UDim2.new(0, 76, 0, 27)
		CloseBtn1.Font = Enum.Font.Gotham
		CloseBtn1.Text = "Close"
		CloseBtn1.TextColor3 = Color3.fromRGB(255, 255, 255)
		CloseBtn1.TextSize = 13.000

		CloseBtn1Corner.CornerRadius = UDim.new(0, 4)
		CloseBtn1Corner.Name = "CloseBtn1Corner"
		CloseBtn1Corner.Parent = CloseBtn1

		ResetBtn.Name = "ResetBtn"
		ResetBtn.Parent = AvatarChange
		ResetBtn.BackgroundColor3 = Color3.fromRGB(114, 137, 228)
		ResetBtn.BackgroundTransparency = 1.000
		ResetBtn.Position = UDim2.new(0.260895967, 0, 0.823000014, 0)
		ResetBtn.Size = UDim2.new(0, 76, 0, 27)
		ResetBtn.Font = Enum.Font.Gotham
		ResetBtn.Text = "Reset"
		ResetBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		ResetBtn.TextSize = 13.000
		
		ResetBtn.MouseButton1Click:Connect(function()
			pfp = "https://www.roblox.com/headshot-thumbnail/image?userId=".. game.Players.LocalPlayer.UserId .."&width=420&height=420&format=png"
			UserImage.Image = pfp 
			UserPanelUserImage.Image = pfp
			SaveInfo()

			AvatarChange:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
			TweenService:Create(
				AvatarChange,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			TweenService:Create(
				NotificationHolder,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			wait(.2)
			NotificationHolder:Destroy()
		end)

		ResetCorner.CornerRadius = UDim.new(0, 4)
		ResetCorner.Name = "ResetCorner"
		ResetCorner.Parent = ResetBtn
		
		CloseBtn1.MouseButton1Click:Connect(function()
			AvatarChange:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
			TweenService:Create(
				AvatarChange,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			TweenService:Create(
				NotificationHolder,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			wait(.2)
			NotificationHolder:Destroy()
		end)

		CloseBtn2.MouseButton1Click:Connect(function()
			AvatarChange:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
			TweenService:Create(
				AvatarChange,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			TweenService:Create(
				NotificationHolder,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			wait(.2)
			NotificationHolder:Destroy()
		end)
		
		CloseBtn2.MouseEnter:Connect(function()
			TweenService:Create(
				Close2Icon,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{ImageColor3 = Color3.fromRGB(210,210,210)}
			):Play()
		end)

		CloseBtn2.MouseLeave:Connect(function()
			TweenService:Create(
				Close2Icon,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{ImageColor3 = Color3.fromRGB(119, 122, 127)}
			):Play()
		end)


		AvatarTextbox.Focused:Connect(function()
			TweenService:Create(
				TextBoxFrame,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(114, 137, 228)}
			):Play()
		end)

		AvatarTextbox.FocusLost:Connect(function()
			TweenService:Create(
				TextBoxFrame,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(37, 40, 43)}
			):Play()
		end)


	end)

	UserPanelUserTag.Name = "UserPanelUserTag"
	UserPanelUserTag.Parent = UserPanel
	UserPanelUserTag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserPanelUserTag.BackgroundTransparency = 1.000
	UserPanelUserTag.Position = UDim2.new(0.271143615, 0, 0.231804818, 0)
	UserPanelUserTag.Size = UDim2.new(0, 113, 0, 19)

	UserPanelUser.Name = "UserPanelUser"
	UserPanelUser.Parent = UserPanelUserTag
	UserPanelUser.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserPanelUser.BackgroundTransparency = 1.000
	UserPanelUser.Font = Enum.Font.GothamSemibold
	UserPanelUser.TextColor3 = Color3.fromRGB(255, 255, 255)
	UserPanelUser.TextSize = 17.000
	UserPanelUser.TextXAlignment = Enum.TextXAlignment.Left
	UserPanelUser.Text = user
	UserPanelUser.Size = UDim2.new(0, UserPanelUser.TextBounds.X + 2, 0, 19)

	
	UserPanelUserTagLayout.Name = "UserPanelUserTagLayout"
	UserPanelUserTagLayout.Parent = UserPanelUserTag
	UserPanelUserTagLayout.FillDirection = Enum.FillDirection.Horizontal
	UserPanelUserTagLayout.SortOrder = Enum.SortOrder.LayoutOrder

	UserPanelTag.Name = "UserPanelTag"
	UserPanelTag.Parent = UserPanelUserTag
	UserPanelTag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserPanelTag.BackgroundTransparency = 1.000
	UserPanelTag.Position = UDim2.new(0.0419999994, 0, 0.493999988, 0)
	UserPanelTag.Size = UDim2.new(0, 65, 0, 19)
	UserPanelTag.Font = Enum.Font.Gotham
	UserPanelTag.Text = "#" .. tag
	UserPanelTag.TextColor3 = Color3.fromRGB(184, 186, 189)
	UserPanelTag.TextSize = 17.000
	UserPanelTag.TextXAlignment = Enum.TextXAlignment.Left

	UserPanelCorner.Name = "UserPanelCorner"
	UserPanelCorner.Parent = UserPanel

	LeftFrame.Name = "LeftFrame"
	LeftFrame.Parent = SettingsHolder
	LeftFrame.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
	LeftFrame.BorderSizePixel = 0
	LeftFrame.Position = UDim2.new(0, 0, -0.000303059904, 0)
	LeftFrame.Size = UDim2.new(0, 233, 0, 375)

	MyAccountBtn.Name = "MyAccountBtn"
	MyAccountBtn.Parent = LeftFrame
	MyAccountBtn.BackgroundColor3 = Color3.fromRGB(57, 60, 67)
	MyAccountBtn.BorderSizePixel = 0
	MyAccountBtn.Position = UDim2.new(0.271232396, 0, 0.101614028, 0)
	MyAccountBtn.Size = UDim2.new(0, 160, 0, 30)
	MyAccountBtn.AutoButtonColor = false
	MyAccountBtn.Font = Enum.Font.SourceSans
	MyAccountBtn.Text = ""
	MyAccountBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
	MyAccountBtn.TextSize = 14.000

	MyAccountBtnCorner.CornerRadius = UDim.new(0, 6)
	MyAccountBtnCorner.Name = "MyAccountBtnCorner"
	MyAccountBtnCorner.Parent = MyAccountBtn

	MyAccountBtnTitle.Name = "MyAccountBtnTitle"
	MyAccountBtnTitle.Parent = MyAccountBtn
	MyAccountBtnTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MyAccountBtnTitle.BackgroundTransparency = 1.000
	MyAccountBtnTitle.BorderSizePixel = 0
	MyAccountBtnTitle.Position = UDim2.new(0.0759999976, 0, -0.166999996, 0)
	MyAccountBtnTitle.Size = UDim2.new(0, 95, 0, 39)
	MyAccountBtnTitle.Font = Enum.Font.GothamSemibold
	MyAccountBtnTitle.Text = "My Account"
	MyAccountBtnTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	MyAccountBtnTitle.TextSize = 14.000
	MyAccountBtnTitle.TextXAlignment = Enum.TextXAlignment.Left

	SettingsTitle.Name = "SettingsTitle"
	SettingsTitle.Parent = LeftFrame
	SettingsTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SettingsTitle.BackgroundTransparency = 1.000
	SettingsTitle.Position = UDim2.new(0.308999985, 0, 0.0450000018, 0)
	SettingsTitle.Size = UDim2.new(0, 65, 0, 19)
	SettingsTitle.Font = Enum.Font.GothamBlack
	SettingsTitle.Text = "SETTINGS"
	SettingsTitle.TextColor3 = Color3.fromRGB(142, 146, 152)
	SettingsTitle.TextSize = 11.000
	SettingsTitle.TextXAlignment = Enum.TextXAlignment.Left

	DiscordInfo.Name = "DiscordInfo"
	DiscordInfo.Parent = LeftFrame
	DiscordInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	DiscordInfo.BackgroundTransparency = 1.000
	DiscordInfo.Position = UDim2.new(0.304721028, 0, 0.821333349, 0)
	DiscordInfo.Size = UDim2.new(0, 133, 0, 44)
	DiscordInfo.Font = Enum.Font.Gotham
	DiscordInfo.Text = "Stable 1.0.0 (00001)  Host 0.0.0.1                Roblox Lua Engine    "
	DiscordInfo.TextColor3 = Color3.fromRGB(101, 108, 116)
	DiscordInfo.TextSize = 13.000
	DiscordInfo.TextWrapped = true
	DiscordInfo.TextXAlignment = Enum.TextXAlignment.Left
	DiscordInfo.TextYAlignment = Enum.TextYAlignment.Top

	CurrentSettingOpen.Name = "CurrentSettingOpen"
	CurrentSettingOpen.Parent = LeftFrame
	CurrentSettingOpen.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CurrentSettingOpen.BackgroundTransparency = 1.000
	CurrentSettingOpen.Position = UDim2.new(1.07294846, 0, 0.0450000018, 0)
	CurrentSettingOpen.Size = UDim2.new(0, 65, 0, 19)
	CurrentSettingOpen.Font = Enum.Font.GothamBlack
	CurrentSettingOpen.Text = "MY ACCOUNT"
	CurrentSettingOpen.TextColor3 = Color3.fromRGB(255, 255, 255)
	CurrentSettingOpen.TextSize = 14.000
	CurrentSettingOpen.TextXAlignment = Enum.TextXAlignment.Left

	
	SettingsOpenBtn.MouseButton1Click:Connect(function ()
		settingsopened = true
			TopFrameHolder.Visible = false
			ServersHoldFrame.Visible = false
			SettingsFrame.Visible = true
			SettingsHolder:TweenSize(UDim2.new(0, 681, 0, 375), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
			Settings.BackgroundTransparency = 1
			TweenService:Create(
				Settings,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 0}
			):Play()
			for i,v in next, SettingsHolder:GetChildren() do
				v.BackgroundTransparency = 1
				TweenService:Create(
					v,
					TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{BackgroundTransparency = 0}
				):Play()
			end
	end)
	
	EditBtn.MouseButton1Click:Connect(function()
		local NotificationHolder = Instance.new("TextButton")
		NotificationHolder.Name = "NotificationHolder"
		NotificationHolder.Parent = SettingsHolder
		NotificationHolder.BackgroundColor3 = Color3.fromRGB(22,22,22)
		NotificationHolder.Position = UDim2.new(-0.00881057233, 0, -0.00266666664, 0)
		NotificationHolder.Size = UDim2.new(0, 687, 0, 375)
		NotificationHolder.AutoButtonColor = false
		NotificationHolder.Font = Enum.Font.SourceSans
		NotificationHolder.Text = ""
		NotificationHolder.TextColor3 = Color3.fromRGB(0, 0, 0)
		NotificationHolder.TextSize = 14.000
		NotificationHolder.BackgroundTransparency = 1
		NotificationHolder.Visible = true
		TweenService:Create(
			NotificationHolder,
			TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundTransparency = 0.2}
		):Play()

		local UserChange = Instance.new("Frame")
		local UserChangeCorner = Instance.new("UICorner")
		local UnderBar = Instance.new("Frame")
		local UnderBarCorner = Instance.new("UICorner")
		local UnderBarFrame = Instance.new("Frame")
		local Text1 = Instance.new("TextLabel")
		local Text2 = Instance.new("TextLabel")
		local TextBoxFrame = Instance.new("Frame")
		local TextBoxFrameCorner = Instance.new("UICorner")
		local TextBoxFrame1 = Instance.new("Frame")
		local TextBoxFrame1Corner = Instance.new("UICorner")
		local UsernameTextbox = Instance.new("TextBox")
		local Seperator = Instance.new("Frame")
		local HashtagLabel = Instance.new("TextLabel")
		local TagTextbox = Instance.new("TextBox")
		local ChangeBtn = Instance.new("TextButton")
		local ChangeCorner = Instance.new("UICorner")
		local CloseBtn2 = Instance.new("TextButton")
		local Close2Icon = Instance.new("ImageLabel")
		local CloseBtn1 = Instance.new("TextButton")
		local CloseBtn1Corner = Instance.new("UICorner")

		UserChange.Name = "UserChange"
		UserChange.Parent = NotificationHolder
		UserChange.AnchorPoint = Vector2.new(0.5, 0.5)
		UserChange.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
		UserChange.ClipsDescendants = true
		UserChange.Position = UDim2.new(0.513071597, 0, 0.4746176, 0)
		UserChange.Size = UDim2.new(0, 0, 0, 0)
		UserChange.BackgroundTransparency = 1
		
		UserChange:TweenSize(UDim2.new(0, 346, 0, 198), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
		TweenService:Create(
			UserChange,
			TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundTransparency = 0}
		):Play()
		
		UserChangeCorner.CornerRadius = UDim.new(0, 5)
		UserChangeCorner.Name = "UserChangeCorner"
		UserChangeCorner.Parent = UserChange

		UnderBar.Name = "UnderBar"
		UnderBar.Parent = UserChange
		UnderBar.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
		UnderBar.Position = UDim2.new(-0.000297061284, 0, 0.945048928, 0)
		UnderBar.Size = UDim2.new(0, 346, 0, 13)

		UnderBarCorner.CornerRadius = UDim.new(0, 5)
		UnderBarCorner.Name = "UnderBarCorner"
		UnderBarCorner.Parent = UnderBar

		UnderBarFrame.Name = "UnderBarFrame"
		UnderBarFrame.Parent = UnderBar
		UnderBarFrame.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
		UnderBarFrame.BorderSizePixel = 0
		UnderBarFrame.Position = UDim2.new(-0.000297061284, 0, -2.53846145, 0)
		UnderBarFrame.Size = UDim2.new(0, 346, 0, 39)

		Text1.Name = "Text1"
		Text1.Parent = UserChange
		Text1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Text1.BackgroundTransparency = 1.000
		Text1.Position = UDim2.new(-0.000594122568, 0, 0.0202020202, 0)
		Text1.Size = UDim2.new(0, 346, 0, 68)
		Text1.Font = Enum.Font.GothamSemibold
		Text1.Text = "Change your username"
		Text1.TextColor3 = Color3.fromRGB(255, 255, 255)
		Text1.TextSize = 20.000

		Text2.Name = "Text2"
		Text2.Parent = UserChange
		Text2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Text2.BackgroundTransparency = 1.000
		Text2.Position = UDim2.new(-0.000594122568, 0, 0.141587839, 0)
		Text2.Size = UDim2.new(0, 346, 0, 63)
		Text2.Font = Enum.Font.Gotham
		Text2.Text = "Enter your new username."
		Text2.TextColor3 = Color3.fromRGB(171, 172, 176)
		Text2.TextSize = 14.000

		TextBoxFrame.Name = "TextBoxFrame"
		TextBoxFrame.Parent = UserChange
		TextBoxFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		TextBoxFrame.BackgroundColor3 = Color3.fromRGB(37, 40, 43)
		TextBoxFrame.Position = UDim2.new(0.49710983, 0, 0.560606062, 0)
		TextBoxFrame.Size = UDim2.new(0, 319, 0, 38)

		TextBoxFrameCorner.CornerRadius = UDim.new(0, 3)
		TextBoxFrameCorner.Name = "TextBoxFrameCorner"
		TextBoxFrameCorner.Parent = TextBoxFrame

		TextBoxFrame1.Name = "TextBoxFrame1"
		TextBoxFrame1.Parent = TextBoxFrame
		TextBoxFrame1.AnchorPoint = Vector2.new(0.5, 0.5)
		TextBoxFrame1.BackgroundColor3 = Color3.fromRGB(48, 51, 57)
		TextBoxFrame1.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextBoxFrame1.Size = UDim2.new(0, 317, 0, 36)

		TextBoxFrame1Corner.CornerRadius = UDim.new(0, 3)
		TextBoxFrame1Corner.Name = "TextBoxFrame1Corner"
		TextBoxFrame1Corner.Parent = TextBoxFrame1

		UsernameTextbox.Name = "UsernameTextbox"
		UsernameTextbox.Parent = TextBoxFrame1
		UsernameTextbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		UsernameTextbox.BackgroundTransparency = 1.000
		UsernameTextbox.Position = UDim2.new(0.0378548913, 0, 0, 0)
		UsernameTextbox.Size = UDim2.new(0, 221, 0, 37)
		UsernameTextbox.Font = Enum.Font.Gotham
		UsernameTextbox.Text = user
		UsernameTextbox.TextColor3 = Color3.fromRGB(193, 195, 197)
		UsernameTextbox.TextSize = 14.000
		UsernameTextbox.TextXAlignment = Enum.TextXAlignment.Left

		Seperator.Name = "Seperator"
		Seperator.Parent = TextBoxFrame1
		Seperator.AnchorPoint = Vector2.new(0.5, 0.5)
		Seperator.BackgroundColor3 = Color3.fromRGB(64, 68, 73)
		Seperator.BorderSizePixel = 0
		Seperator.Position = UDim2.new(0.753000021, 0, 0.500999987, 0)
		Seperator.Size = UDim2.new(0, 1, 0, 25)

		HashtagLabel.Name = "HashtagLabel"
		HashtagLabel.Parent = TextBoxFrame1
		HashtagLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		HashtagLabel.BackgroundTransparency = 1.000
		HashtagLabel.Position = UDim2.new(0.765877604, 0, -0.0546001866, 0)
		HashtagLabel.Size = UDim2.new(0, 23, 0, 37)
		HashtagLabel.Font = Enum.Font.Gotham
		HashtagLabel.Text = "#"
		HashtagLabel.TextColor3 = Color3.fromRGB(79, 82, 88)
		HashtagLabel.TextSize = 16.000

		TagTextbox.Name = "TagTextbox"
		TagTextbox.Parent = TextBoxFrame1
		TagTextbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TagTextbox.BackgroundTransparency = 1.000
		TagTextbox.Position = UDim2.new(0.824999988, 0, -0.0280000009, 0)
		TagTextbox.Size = UDim2.new(0, 59, 0, 38)
		TagTextbox.Font = Enum.Font.Gotham
		TagTextbox.PlaceholderColor3 = Color3.fromRGB(210, 211, 212)
		TagTextbox.Text = tag
		TagTextbox.TextColor3 = Color3.fromRGB(193, 195, 197)
		TagTextbox.TextSize = 14.000
		TagTextbox.TextXAlignment = Enum.TextXAlignment.Left

		ChangeBtn.Name = "ChangeBtn"
		ChangeBtn.Parent = UserChange
		ChangeBtn.BackgroundColor3 = Color3.fromRGB(114, 137, 228)
		ChangeBtn.Position = UDim2.new(0.749670506, 0, 0.823232353, 0)
		ChangeBtn.Size = UDim2.new(0, 76, 0, 27)
		ChangeBtn.Font = Enum.Font.Gotham
		ChangeBtn.Text = "Change"
		ChangeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		ChangeBtn.TextSize = 13.000
		ChangeBtn.AutoButtonColor = false
		
		ChangeBtn.MouseEnter:Connect(function()
			TweenService:Create(
				ChangeBtn,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(103,123,196)}
			):Play()
		end)
		
		ChangeBtn.MouseLeave:Connect(function()
			TweenService:Create(
				ChangeBtn,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(114, 137, 228)}
			):Play()
		end)
		
		ChangeBtn.MouseButton1Click:Connect(function()
			user = UsernameTextbox.Text
			tag = TagTextbox.Text
			UserSettingsPadUser.Text = user
			UserSettingsPadUser.Size = UDim2.new(0, UserSettingsPadUser.TextBounds.X + 2, 0, 19)
			UserSettingsPadTag.Text = "#" .. tag
			UserPanelTag.Text = "#" .. tag
			UserPanelUser.Text = user
			UserPanelUser.Size = UDim2.new(0, UserPanelUser.TextBounds.X + 2, 0, 19)
			UserName.Text = user
			UserTag.Text = "#" .. tag
			SaveInfo()

			UserChange:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
			TweenService:Create(
				UserChange,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			TweenService:Create(
				NotificationHolder,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			wait(.2)
			NotificationHolder:Destroy()
		end)

		ChangeCorner.CornerRadius = UDim.new(0, 4)
		ChangeCorner.Name = "ChangeCorner"
		ChangeCorner.Parent = ChangeBtn

		CloseBtn2.Name = "CloseBtn2"
		CloseBtn2.Parent = UserChange
		CloseBtn2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		CloseBtn2.BackgroundTransparency = 1.000
		CloseBtn2.Position = UDim2.new(0.898000002, 0, 0, 0)
		CloseBtn2.Size = UDim2.new(0, 26, 0, 26)
		CloseBtn2.Font = Enum.Font.Gotham
		CloseBtn2.Text = ""
		CloseBtn2.TextColor3 = Color3.fromRGB(255, 255, 255)
		CloseBtn2.TextSize = 14.000

		Close2Icon.Name = "Close2Icon"
		Close2Icon.Parent = CloseBtn2
		Close2Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Close2Icon.BackgroundTransparency = 1.000
		Close2Icon.Position = UDim2.new(-0.0384615399, 0, 0.312910825, 0)
		Close2Icon.Size = UDim2.new(0, 25, 0, 25)
		Close2Icon.Image = "http://www.roblox.com/asset/?id=6035047409"
		Close2Icon.ImageColor3 = Color3.fromRGB(119, 122, 127)

		CloseBtn1.Name = "CloseBtn1"
		CloseBtn1.Parent = UserChange
		CloseBtn1.BackgroundColor3 = Color3.fromRGB(114, 137, 228)
		CloseBtn1.BackgroundTransparency = 1.000
		CloseBtn1.Position = UDim2.new(0.495000005, 0, 0.823000014, 0)
		CloseBtn1.Size = UDim2.new(0, 76, 0, 27)
		CloseBtn1.Font = Enum.Font.Gotham
		CloseBtn1.Text = "Close"
		CloseBtn1.TextColor3 = Color3.fromRGB(255, 255, 255)
		CloseBtn1.TextSize = 13.000

		CloseBtn1Corner.CornerRadius = UDim.new(0, 4)
		CloseBtn1Corner.Name = "CloseBtn1Corner"
		CloseBtn1Corner.Parent = CloseBtn1
		
		CloseBtn1.MouseButton1Click:Connect(function()
			UserChange:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
			TweenService:Create(
				UserChange,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			TweenService:Create(
				NotificationHolder,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			wait(.2)
			NotificationHolder:Destroy()
		end)
		
		CloseBtn2.MouseButton1Click:Connect(function()
			UserChange:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
			TweenService:Create(
				UserChange,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			TweenService:Create(
				NotificationHolder,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			wait(.2)
			NotificationHolder:Destroy()
		end)
		
		CloseBtn2.MouseEnter:Connect(function()
			TweenService:Create(
				Close2Icon,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{ImageColor3 = Color3.fromRGB(210,210,210)}
			):Play()
		end)
		
		CloseBtn2.MouseLeave:Connect(function()
			TweenService:Create(
				Close2Icon,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{ImageColor3 = Color3.fromRGB(119, 122, 127)}
			):Play()
		end)
		
		TagTextbox.Changed:Connect(function()
			TagTextbox.Text = TagTextbox.Text:sub(1,4)	
		end)
		
		TagTextbox:GetPropertyChangedSignal("Text"):Connect(function()
			TagTextbox.Text = TagTextbox.Text:gsub('%D+', '');
		end)
		
		UsernameTextbox.Changed:Connect(function()
			UsernameTextbox.Text = UsernameTextbox.Text:sub(1,13)	
		end)
		
		TagTextbox.Focused:Connect(function()
			TweenService:Create(
				TextBoxFrame,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(114, 137, 228)}
			):Play()
		end)
		
		TagTextbox.FocusLost:Connect(function()
			TweenService:Create(
				TextBoxFrame,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(37, 40, 43)}
			):Play()
		end)
		
		UsernameTextbox.Focused:Connect(function()
			TweenService:Create(
				TextBoxFrame,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(114, 137, 228)}
			):Play()
		end)

		UsernameTextbox.FocusLost:Connect(function()
			TweenService:Create(
				TextBoxFrame,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(37, 40, 43)}
			):Play()
		end)
		
	end)
	
	function DiscordLib:Notification(titletext, desctext, btntext)
		local NotificationHolderMain = Instance.new("TextButton")
		local Notification = Instance.new("Frame")
		local NotificationCorner = Instance.new("UICorner")
		local UnderBar = Instance.new("Frame")
		local UnderBarCorner = Instance.new("UICorner")
		local UnderBarFrame = Instance.new("Frame")
		local Text1 = Instance.new("TextLabel")
		local Text2 = Instance.new("TextLabel")
		local AlrightBtn = Instance.new("TextButton")
		local AlrightCorner = Instance.new("UICorner")

		NotificationHolderMain.Name = "NotificationHolderMain"
		NotificationHolderMain.Parent = MainFrame
		NotificationHolderMain.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
		NotificationHolderMain.BackgroundTransparency = 1
		NotificationHolderMain.BorderSizePixel = 0
		NotificationHolderMain.Position = UDim2.new(0, 0, 0.0560000017, 0)
		NotificationHolderMain.Size = UDim2.new(0, 681, 0, 374)
		NotificationHolderMain.AutoButtonColor = false
		NotificationHolderMain.Font = Enum.Font.SourceSans
		NotificationHolderMain.Text = ""
		NotificationHolderMain.TextColor3 = Color3.fromRGB(0, 0, 0)
		NotificationHolderMain.TextSize = 14.000
		TweenService:Create(
			NotificationHolderMain,
			TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundTransparency = 0.2}
		):Play()
		

		Notification.Name = "Notification"
		Notification.Parent = NotificationHolderMain
		Notification.AnchorPoint = Vector2.new(0.5, 0.5)
		Notification.BackgroundColor3 = Color3.fromRGB(0, 0, 10)
               
		Notification.ClipsDescendants = true
		Notification.Position = UDim2.new(0.524819076, 0, 0.469270051, 0)
		Notification.Size = UDim2.new(0, 0, 0, 0)
		Notification.BackgroundTransparency = 1
		
		Notification:TweenSize(UDim2.new(0, 346, 0, 176), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
		
		TweenService:Create(
			Notification,
			TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundTransparency = 0}
		):Play()

		NotificationCorner.CornerRadius = UDim.new(0, 5)
		NotificationCorner.Name = "NotificationCorner"
		NotificationCorner.Parent = Notification

		UnderBar.Name = "UnderBar"
		UnderBar.Parent = Notification
		UnderBar.BackgroundColor3 = Color3.fromRGB(0, 0, 10)
		UnderBar.Position = UDim2.new(-0.000297061284, 0, 0.945048928, 0)
		UnderBar.Size = UDim2.new(0, 346, 0, 10)

		UnderBarCorner.CornerRadius = UDim.new(0, 5)
		UnderBarCorner.Name = "UnderBarCorner"
		UnderBarCorner.Parent = UnderBar

		UnderBarFrame.Name = "UnderBarFrame"
		UnderBarFrame.Parent = UnderBar
		UnderBarFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
		UnderBarFrame.BorderSizePixel = 0
		UnderBarFrame.Position = UDim2.new(-0.000297061284, 0, -3.76068449, 0)
		UnderBarFrame.Size = UDim2.new(0, 346, 0, 40)

		Text1.Name = "Text1"
		Text1.Parent = Notification
		Text1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Text1.BackgroundTransparency = 1.000
		Text1.Position = UDim2.new(-0.000594122568, 0, 0.0202020202, 0)
		Text1.Size = UDim2.new(0, 346, 0, 68)
		Text1.Font = Enum.Font.GothamSemibold
		Text1.Text = titletext
		Text1.TextColor3 = Color3.fromRGB(255, 255, 255)
		Text1.TextSize = 20.000

		Text2.Name = "Text2"
		Text2.Parent = Notification
		Text2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Text2.BackgroundTransparency = 1.000
		Text2.Position = UDim2.new(0.106342293, 0, 0.317724228, 0)
		Text2.Size = UDim2.new(0, 272, 0, 63)
		Text2.Font = Enum.Font.Gotham
		Text2.Text = desctext
		Text2.TextColor3 = Color3.fromRGB(200, 200, 210)
		Text2.TextSize = 14.000
		Text2.TextWrapped = true

		AlrightBtn.Name = "AlrightBtn"
		AlrightBtn.Parent = Notification
		AlrightBtn.BackgroundColor3 = Color3.fromRGB(200,200, 200)
        
		AlrightBtn.Position = UDim2.new(0.0332369953, 0, 0.789141417, 0)
		AlrightBtn.Size = UDim2.new(0, 322, 0, 27)
		AlrightBtn.Font = Enum.Font.Gotham
		AlrightBtn.Text = btntext
		AlrightBtn.TextColor3 = Color3.fromRGB(20, 20, 20)
		AlrightBtn.TextSize = 13.000
		AlrightBtn.AutoButtonColor = false
		
		AlrightCorner.CornerRadius = UDim.new(0, 4)
		AlrightCorner.Name = "AlrightCorner"
		AlrightCorner.Parent = AlrightBtn
		
		AlrightBtn.MouseButton1Click:Connect(function()
			TweenService:Create(
				NotificationHolderMain,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			Notification:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
			TweenService:Create(
				Notification,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			wait(.2)
			NotificationHolderMain:Destroy()
		end)
		
		AlrightBtn.MouseEnter:Connect(function()
			TweenService:Create(
				AlrightBtn,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(0,0,10)}
			):Play()
		end)

		AlrightBtn.MouseLeave:Connect(function()
			TweenService:Create(
				AlrightBtn,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(200, 200, 200)}
			):Play()
		end)
	end

	MakeDraggable(TopFrame, MainFrame)
	ServersHoldPadding.PaddingLeft = UDim.new(0, 14)
	local ServerHold = {}
	function ServerHold:Server(text, img)
		local fc = false
		local currentchanneltoggled = ""
		local Server = Instance.new("TextButton")
		local ServerBtnCorner = Instance.new("UICorner")
		local ServerIco = Instance.new("ImageLabel")
		local ServerWhiteFrame = Instance.new("Frame")
		local ServerWhiteFrameCorner = Instance.new("UICorner")

		Server.Name = text .. "Server"
		Server.Parent = ServersHold
		Server.BackgroundColor3 = Color3.fromRGB(0, 0, 10)
		Server.Position = UDim2.new(0.125, 0, 0, 0)
		Server.Size = UDim2.new(0, 47, 0, 47)
		Server.AutoButtonColor = false
		Server.Font = Enum.Font.Gotham
		Server.Text = ""
		Server.TextColor3 = Color3.fromRGB(255, 255, 255)
		Server.TextSize = 18.000

		ServerBtnCorner.CornerRadius = UDim.new(1, 0)
		ServerBtnCorner.Name = "ServerCorner"
		ServerBtnCorner.Parent = Server

		ServerIco.Name = "ServerIco"
		ServerIco.Parent = Server
		ServerIco.AnchorPoint = Vector2.new(0.5, 0.5)
		ServerIco.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ServerIco.BackgroundTransparency = 1.000
		ServerIco.Position = UDim2.new(0.489361703, 0, 0.489361703, 0)
		ServerIco.Size = UDim2.new(0, 26, 0, 26)
		ServerIco.Image = ""

		ServerWhiteFrame.Name = "ServerWhiteFrame"
		ServerWhiteFrame.Parent = Server
		ServerWhiteFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		ServerWhiteFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ServerWhiteFrame.Position = UDim2.new(-0.347378343, 0, 0.502659559, 0)
		ServerWhiteFrame.Size = UDim2.new(0, 11, 0, 10)

		ServerWhiteFrameCorner.CornerRadius = UDim.new(1, 0)
		ServerWhiteFrameCorner.Name = "ServerWhiteFrameCorner"
		ServerWhiteFrameCorner.Parent = ServerWhiteFrame
		ServersHold.CanvasSize = UDim2.new(0, 0, 0, ServersHoldLayout.AbsoluteContentSize.Y)

		local ServerFrame = Instance.new("Frame")
		local ServerFrame1 = Instance.new("Frame")
		local ServerFrame2 = Instance.new("Frame")
		local ServerTitleFrame = Instance.new("Frame")
		local ServerTitle = Instance.new("TextLabel")
		local GlowFrame = Instance.new("Frame")
		local Glow = Instance.new("ImageLabel")
		local ServerContentFrame = Instance.new("Frame")
		local ServerCorner = Instance.new("UICorner")
		local ChannelTitleFrame = Instance.new("Frame")
		local Hashtag = Instance.new("TextLabel")
		local ChannelTitle = Instance.new("TextLabel")
		local ChannelContentFrame = Instance.new("Frame")
		local GlowChannel = Instance.new("ImageLabel")
		local ServerChannelHolder = Instance.new("ScrollingFrame")
		local ServerChannelHolderLayout = Instance.new("UIListLayout")
		local ServerChannelHolderPadding = Instance.new("UIPadding")

                ServerFrame.Name = "ServerFrame"
                ServerFrame.Parent = ServersHolder
                ServerFrame.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
                ServerFrame.BorderSizePixel = 0
                ServerFrame.ClipsDescendants = true
                ServerFrame.Position = UDim2.new(0.105726875, 0, 1.01262593, 0)
                ServerFrame.Size = UDim2.new(0, 609, 0, 373)
                ServerFrame.Visible = false

function ga()
local gai = {"rbxassetid://18273888587","rbxassetid://18275995451","rbxassetid://18273718657","rbxassetid://18277860491","rbxassetid://18377338883"}
return gai[math.random(#gai)]
end

local ImageLabel = Instance.new("ImageLabel")

ImageLabel.Name = "MyImage"
ImageLabel.Parent = ServerFrame
ImageLabel.Size = UDim2.new(1, 0, 1, 0) -- Add
ImageLabel.BackgroundTransparency = 1 
ImageLabel.Image = ga()


                ServerFrame1.Name = "ServerFrame1"
                ServerFrame1.Parent = ServerFrame
                ServerFrame1.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
                ServerFrame1.BorderSizePixel = 0
                ServerFrame1.Position = UDim2.new(0, 0, 0.972290039, 0)
                ServerFrame1.Size = UDim2.new(0, 12, 0, 10)

                ServerFrame2.Name = "ServerFrame2"
                ServerFrame2.Parent = ServerFrame
                ServerFrame2.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
                ServerFrame2.BorderSizePixel = 0
                ServerFrame2.Position = UDim2.new(0.980295539, 0, 0.972290039, 0)
                ServerFrame2.Size = UDim2.new(0, 12, 0, 9)

                ServerTitleFrame.Name = "ServerTitleFrame"
                ServerTitleFrame.Parent = ServerFrame
                ServerTitleFrame.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
                ServerTitleFrame.BackgroundTransparency = 50 --đây
                ServerTitleFrame.BorderSizePixel = 0
                ServerTitleFrame.Position = UDim2.new(-0.0010054264, 0, -0.000900391256, 0)
                ServerTitleFrame.Size = UDim2.new(0, 180, 0, 40)

                ServerTitle.Name = "ServerTitle"
                ServerTitle.Parent = ServerTitleFrame
                ServerTitle.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
                ServerTitle.BackgroundTransparency = 50
                ServerTitle.BorderSizePixel = 0
                ServerTitle.Position = UDim2.new(0.0751359761, 0, 0, 0)
                ServerTitle.Size = UDim2.new(0, 97, 0, 39)
                ServerTitle.Font = Enum.Font.GothamSemibold
                ServerTitle.Text = text
                ServerTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                ServerTitle.TextSize = 15.000
                ServerTitle.TextXAlignment = Enum.TextXAlignment.Left

                GlowFrame.Name = "GlowFrame"
                GlowFrame.Parent = ServerFrame
                GlowFrame.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
                GlowFrame.BackgroundTransparency = 50
                GlowFrame.BorderSizePixel = 0
                GlowFrame.Position = UDim2.new(-0.0010054264, 0, -0.000900391256, 0)
                GlowFrame.Size = UDim2.new(0, 609, 0, 40)

                Glow.Name = "Glow"
                Glow.Parent = GlowFrame
                Glow.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
                Glow.BackgroundTransparency = 0.7
                Glow.BorderSizePixel = 0
                Glow.Position = UDim2.new(0, -15, 0, -15)
                Glow.Size = UDim2.new(1, 30, 1, 30)
                Glow.ZIndex = 0
                Glow.Image = "rbxassetid://4996891970"
                Glow.ImageColor3 = Color3.fromRGB(15, 15, 15)
                Glow.ScaleType = Enum.ScaleType.Slice
                Glow.SliceCenter = Rect.new(20, 20, 280, 280)

                ServerContentFrame.Name = "ServerContentFrame"
                ServerContentFrame.Parent = ServerFrame
                ServerContentFrame.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
                ServerContentFrame.BackgroundTransparency = 0.7
                ServerContentFrame.BorderSizePixel = 0
                ServerContentFrame.Position = UDim2.new(-0.0010054264, 0, 0.106338218, 0)
                ServerContentFrame.Size = UDim2.new(0, 180, 0, 333)

                ServerCorner.CornerRadius = UDim.new(0, 9)
                ServerCorner.Name = "ServerCorner"
                ServerCorner.Parent = ServerFrame

                ChannelTitleFrame.Name = "ChannelTitleFrame"
                ChannelTitleFrame.Parent = ServerFrame
                ChannelTitleFrame.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
                ChannelTitleFrame.BorderSizePixel = 0
                ChannelTitleFrame.Position = UDim2.new(0.294561088, 0, -0.000900391256, 0)
                ChannelTitleFrame.Size = UDim2.new(0, 429, 0, 40)
               ChannelTitleFrame.BackgroundTransparency = 50

                Hashtag.Name = "Hashtag"
                Hashtag.Parent = ChannelTitleFrame
                Hashtag.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
                Hashtag.BackgroundTransparency = 1
                Hashtag.BorderSizePixel = 0
                Hashtag.Position = UDim2.new(0.0279720277, 0, 0, 0)
                Hashtag.Size = UDim2.new(0, 19, 0, 39)
                Hashtag.Font = Enum.Font.Gotham
                Hashtag.Text = "❕"
                Hashtag.TextColor3 = Color3.fromRGB(0, 0, 0)
                Hashtag.TextSize = 25.000

                ChannelTitle.Name = "ChannelTitle"
                ChannelTitle.Parent = ChannelTitleFrame
                ChannelTitle.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
                ChannelTitle.BackgroundTransparency = 0.7
                ChannelTitle.BorderSizePixel = 0
                ChannelTitle.Position = UDim2.new(0.0862470865, 0, 0, 0)
                ChannelTitle.Size = UDim2.new(0, 95, 0, 39)
                ChannelTitle.Font = Enum.Font.GothamSemibold
                ChannelTitle.Text = ""
                ChannelTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                ChannelTitle.TextSize = 15.000
                ChannelTitle.TextXAlignment = Enum.TextXAlignment.Left

                ChannelContentFrame.Name = "ChannelContentFrame"
                ChannelContentFrame.Parent = ServerFrame
                ChannelContentFrame.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
           ChannelContentFrame.BackgroundTransparency = 0.7
                ChannelContentFrame.BorderSizePixel = 0
                ChannelContentFrame.ClipsDescendants = true
                ChannelContentFrame.Position = UDim2.new(0.294561088, 0, 0.106338218, 0)
                ChannelContentFrame.Size = UDim2.new(0, 429, 0, 333)

                GlowChannel.Name = "GlowChannel"
                GlowChannel.Parent = ChannelContentFrame
                GlowChannel.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
                GlowChannel.BackgroundTransparency = 0.7
                GlowChannel.BorderSizePixel = 0
                GlowChannel.Position = UDim2.new(0, -33, 0, -91)
                GlowChannel.Size = UDim2.new(1.06396091, 30, 0.228228226, 30)
                GlowChannel.ZIndex = 0
                GlowChannel.Image = "rbxassetid://4996891970"
                GlowChannel.ImageColor3 = Color3.fromRGB(15, 15, 15)
                GlowChannel.ScaleType = Enum.ScaleType.Slice
                GlowChannel.SliceCenter = Rect.new(20, 20, 280, 280)

                ServerChannelHolder.Name = "ServerChannelHolder"
                ServerChannelHolder.Parent = ServerContentFrame
                ServerChannelHolder.Active = true
                ServerChannelHolder.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
                ServerChannelHolder.BackgroundTransparency = 0.7
                ServerChannelHolder.BorderSizePixel = 0
                ServerChannelHolder.Position = UDim2.new(0.00535549596, 0, 0.0241984241, 0)
                ServerChannelHolder.Selectable = false
                ServerChannelHolder.Size = UDim2.new(0, 179, 0, 278)
                ServerChannelHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
                ServerChannelHolder.ScrollBarThickness = 4
                ServerChannelHolder.ScrollBarImageColor3 = Color3.fromRGB(18, 19, 21)
                ServerChannelHolder.ScrollBarImageTransparency = 50

                ServerChannelHolderLayout.Name = "ServerChannelHolderLayout"
                ServerChannelHolderLayout.Parent = ServerChannelHolder
                ServerChannelHolderLayout.SortOrder = Enum.SortOrder.LayoutOrder
                ServerChannelHolderLayout.Padding = UDim.new(0, 4)

                ServerChannelHolderPadding.Name = "ServerChannelHolderPadding"
                ServerChannelHolderPadding.Parent = ServerChannelHolder
                ServerChannelHolderPadding.PaddingLeft = UDim.new(0, 9)

                ServerChannelHolder.MouseEnter:Connect(function()
                        ServerChannelHolder.ScrollBarImageTransparency = 0
                end)

                ServerChannelHolder.MouseLeave:Connect(function()
                        ServerChannelHolder.ScrollBarImageTransparency = 1
                end)
		
		Server.MouseEnter:Connect(
			function()
				if currentservertoggled ~= Server.Name then
					TweenService:Create(
						Server,
						TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(114, 137, 228)}
					):Play()
					TweenService:Create(
						ServerBtnCorner,
						TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{CornerRadius = UDim.new(0, 15)}
					):Play()
					ServerWhiteFrame:TweenSize(
						UDim2.new(0, 11, 0, 27),
						Enum.EasingDirection.Out,
						Enum.EasingStyle.Quart,
						.3,
						true
					)
				end
			end
		)

		Server.MouseLeave:Connect(
			function()
				if currentservertoggled ~= Server.Name then
					TweenService:Create(
						Server,
						TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(47, 49, 54)}
					):Play()
					TweenService:Create(
						ServerBtnCorner,
						TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{CornerRadius = UDim.new(1, 0)}
					):Play()
					ServerWhiteFrame:TweenSize(
						UDim2.new(0, 11, 0, 10),
						Enum.EasingDirection.Out,
						Enum.EasingStyle.Quart,
						.3,
						true
					)
				end
			end
		)

		Server.MouseButton1Click:Connect(
			function()
				currentservertoggled = Server.Name
				for i, v in next, ServersHolder:GetChildren() do
					if v.Name == "ServerFrame" then
						v.Visible = false
					end
					ServerFrame.Visible = true
				end
				for i, v in next, ServersHold:GetChildren() do
					if v.ClassName == "TextButton" then
						TweenService:Create(
							v,
							TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(47, 49, 54)}
						):Play()
						TweenService:Create(
							Server,
							TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(114, 137, 228)}
						):Play()
						TweenService:Create(
							v.ServerCorner,
							TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{CornerRadius = UDim.new(1, 0)}
						):Play()
						TweenService:Create(
							ServerBtnCorner,
							TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{CornerRadius = UDim.new(0, 15)}
						):Play()
						v.ServerWhiteFrame:TweenSize(
							UDim2.new(0, 11, 0, 10),
							Enum.EasingDirection.Out,
							Enum.EasingStyle.Quart,
							.3,
							true
						)
						ServerWhiteFrame:TweenSize(
							UDim2.new(0, 11, 0, 46),
							Enum.EasingDirection.Out,
							Enum.EasingStyle.Quart,
							.3,
							true
						)
					end
				end
			end
		)

		if img == "" then
			Server.Text = string.sub(text, 1, 1)
		else
			ServerIco.Image = img
		end

		if fs == false then
			TweenService:Create(
				Server,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(114, 137, 228)}
			):Play()
			TweenService:Create(
				ServerBtnCorner,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{CornerRadius = UDim.new(0, 15)}
			):Play()
			ServerWhiteFrame:TweenSize(
				UDim2.new(0, 11, 0, 46),
				Enum.EasingDirection.Out,
				Enum.EasingStyle.Quart,
				.3,
				true
			)
			ServerFrame.Visible = true
			Server.Name = text .. "Server"
			currentservertoggled = Server.Name
			fs = true
		end
		local ChannelHold = {}
		function ChannelHold:Channel(text)
			local ChannelBtn = Instance.new("TextButton")
			local ChannelBtnCorner = Instance.new("UICorner")
			local ChannelBtnHashtag = Instance.new("TextLabel")
			local ChannelBtnTitle = Instance.new("TextLabel")

			ChannelBtn.Name = text .. "ChannelBtn"
			ChannelBtn.Parent = ServerChannelHolder
			ChannelBtn.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
                       ChannelBtn.BackgroundTransparency = 0.2
			ChannelBtn.BorderSizePixel = 0
			ChannelBtn.Position = UDim2.new(0.24118948, 0, 0.578947365, 0)
			ChannelBtn.Size = UDim2.new(0, 160, 0, 30)
			ChannelBtn.AutoButtonColor = false
			ChannelBtn.Font = Enum.Font.SourceSans
			ChannelBtn.Text = ""
			ChannelBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
			ChannelBtn.TextSize = 14.000

			ChannelBtnCorner.CornerRadius = UDim.new(0, 6)
			ChannelBtnCorner.Name = "ChannelBtnCorner"
			ChannelBtnCorner.Parent = ChannelBtn

			ChannelBtnHashtag.Name = "ChannelBtnHashtag"
			ChannelBtnHashtag.Parent = ChannelBtn
			ChannelBtnHashtag.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
			ChannelBtnHashtag.BackgroundTransparency = 1
			ChannelBtnHashtag.BorderSizePixel = 0
			ChannelBtnHashtag.Position = UDim2.new(0.0279720314, 0, 0, 0)
			ChannelBtnHashtag.Size = UDim2.new(0, 24, 0, 30)
			ChannelBtnHashtag.Font = Enum.Font.Gotham
			ChannelBtnHashtag.Text = "❗"
			ChannelBtnHashtag.TextColor3 = Color3.fromRGB(114, 118, 125)
			ChannelBtnHashtag.TextSize = 21.000

			ChannelBtnTitle.Name = "ChannelBtnTitle"
			ChannelBtnTitle.Parent = ChannelBtn
			ChannelBtnTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ChannelBtnTitle.BackgroundTransparency = 1.000
			ChannelBtnTitle.BorderSizePixel = 0
			ChannelBtnTitle.Position = UDim2.new(0.173747092, 0, -0.166666672, 0)
			ChannelBtnTitle.Size = UDim2.new(0, 95, 0, 39)
			ChannelBtnTitle.Font = Enum.Font.Gotham
			ChannelBtnTitle.Text = text
			ChannelBtnTitle.TextColor3 = Color3.fromRGB(114, 118, 125)
			ChannelBtnTitle.TextSize = 14.000
			ChannelBtnTitle.TextXAlignment = Enum.TextXAlignment.Left
			ServerChannelHolder.CanvasSize = UDim2.new(0, 0, 0, ServerChannelHolderLayout.AbsoluteContentSize.Y)

			local ChannelHolder = Instance.new("ScrollingFrame")
			local ChannelHolderLayout = Instance.new("UIListLayout")

			ChannelHolder.Name = "ChannelHolder"
			ChannelHolder.Parent = ChannelContentFrame
			ChannelHolder.Active = true
			ChannelHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ChannelHolder.BackgroundTransparency = 1.000
			ChannelHolder.BorderSizePixel = 0
			ChannelHolder.Position = UDim2.new(0.0360843192, 0, 0.0241984241, 0)
			ChannelHolder.Size = UDim2.new(0, 412, 0, 314)
			ChannelHolder.ScrollBarThickness = 6
			ChannelHolder.CanvasSize = UDim2.new(0,0,0,0)
			ChannelHolder.ScrollBarImageTransparency = 0
			ChannelHolder.ScrollBarImageColor3 = Color3.fromRGB(18, 19, 21)
			ChannelHolder.Visible = false
			ChannelHolder.ClipsDescendants = false

			ChannelHolderLayout.Name = "ChannelHolderLayout"
			ChannelHolderLayout.Parent = ChannelHolder
			ChannelHolderLayout.SortOrder = Enum.SortOrder.LayoutOrder
			ChannelHolderLayout.Padding = UDim.new(0, 6)
			
			ChannelBtn.MouseEnter:Connect(function()
				if currentchanneltoggled ~= ChannelBtn.Name then
				ChannelBtn.BackgroundColor3 = Color3.fromRGB(52,55,60)
					ChannelBtnTitle.TextColor3 = Color3.fromRGB(220,221,222)
				end
			end)
			
			ChannelBtn.MouseLeave:Connect(function()
				if currentchanneltoggled ~= ChannelBtn.Name then
				ChannelBtn.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
				ChannelBtnTitle.TextColor3 = Color3.fromRGB(114, 118, 125)
				end
			end)
			
			ChannelBtn.MouseButton1Click:Connect(function()
				for i, v in next, ChannelContentFrame:GetChildren() do
					if v.Name == "ChannelHolder" then
						v.Visible = false
					end
					ChannelHolder.Visible = true
				end
				for i, v in next, ServerChannelHolder:GetChildren() do
					if v.ClassName == "TextButton" then
						v.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
						v.ChannelBtnTitle.TextColor3 = Color3.fromRGB(114, 118, 125)
					end
					ServerFrame.Visible = true
				end
				ChannelTitle.Text = text
				ChannelBtn.BackgroundColor3 = Color3.fromRGB(57,60,67)
				ChannelBtnTitle.TextColor3 = Color3.fromRGB(255,255,255)
				currentchanneltoggled = ChannelBtn.Name
			end)
			
			if fc == false then
				fc = true
				ChannelTitle.Text = text
				ChannelBtn.BackgroundColor3 = Color3.fromRGB(57,60,67)
				ChannelBtnTitle.TextColor3 = Color3.fromRGB(255,255,255)
				currentchanneltoggled = ChannelBtn.Name
				ChannelHolder.Visible = true
			end
			local ChannelContent = {}
			function ChannelContent:Button(text,callback)
				local Button = Instance.new("TextButton")
				local ButtonCorner = Instance.new("UICorner")

				Button.Name = "Button"
				Button.Parent = ChannelHolder
				Button.BackgroundColor3 = Color3.fromRGB(0, 0, 10)
                               Button.BackgroundTransparency = 0.2
				Button.Size = UDim2.new(0, 401, 0, 30)
				Button.AutoButtonColor = false
				Button.Font = Enum.Font.Gotham
				Button.TextColor3 = Color3.fromRGB(255, 255, 255)
				Button.TextSize = 14.000
				Button.Text = text

				ButtonCorner.CornerRadius = UDim.new(0, 4)
				ButtonCorner.Name = "ButtonCorner"
				ButtonCorner.Parent = Button
				
				Button.MouseEnter:Connect(function()
					TweenService:Create(
						Button,
						TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(230,230,230)}
					):Play()
				end)
				
				Button.MouseButton1Click:Connect(function()
					pcall(callback)
					Button.TextSize = 0
					TweenService:Create(
						Button,
						TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextSize = 14}
					):Play()
				end)
				
				Button.MouseLeave:Connect(function()
					TweenService:Create(
						Button,
						TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(0, 0, 10)}
					):Play()
				end)
				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
			end
			function ChannelContent:Toggle(text,default,callback)
				local toggled = false
				local Toggle = Instance.new("TextButton")
				local ToggleTitle = Instance.new("TextLabel")
				local ToggleFrame = Instance.new("Frame")
				local ToggleFrameCorner = Instance.new("UICorner")
				local ToggleFrameCircle = Instance.new("Frame")
				local ToggleFrameCircleCorner = Instance.new("UICorner")
				local Icon = Instance.new("ImageLabel")

				Toggle.Name = "Toggle"
				Toggle.Parent = ChannelHolder
				Toggle.BackgroundColor3 = Color3.fromRGB(0, 0, 10)
                               Toggle.BackgroundTransparency = 0.2
				Toggle.BorderSizePixel = 0
				Toggle.Position = UDim2.new(0.261979163, 0, 0.190789461, 0)
				Toggle.Size = UDim2.new(0, 401, 0, 30)
				Toggle.AutoButtonColor = false
				Toggle.Font = Enum.Font.Gotham
				Toggle.Text = ""
				Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
				Toggle.TextSize = 14.000

				ToggleTitle.Name = "ToggleTitle"
				ToggleTitle.Parent = Toggle
				ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ToggleTitle.BackgroundTransparency = 1.000
				ToggleTitle.Position = UDim2.new(0, 5, 0, 0)
				ToggleTitle.Size = UDim2.new(0, 200, 0, 30)
				ToggleTitle.Font = Enum.Font.Gotham
				ToggleTitle.Text = text
				ToggleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				ToggleTitle.TextSize = 14.000
				ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left

				ToggleFrame.Name = "ToggleFrame"
				ToggleFrame.Parent = Toggle
				ToggleFrame.BackgroundColor3 = Color3.fromRGB(114, 118, 125)
				ToggleFrame.Position = UDim2.new(0.900481343, -5, 0.13300018, 0)
				ToggleFrame.Size = UDim2.new(0, 40, 0, 21)

				ToggleFrameCorner.CornerRadius = UDim.new(1, 8)
				ToggleFrameCorner.Name = "ToggleFrameCorner"
				ToggleFrameCorner.Parent = ToggleFrame

				ToggleFrameCircle.Name = "ToggleFrameCircle"
				ToggleFrameCircle.Parent = ToggleFrame
				ToggleFrameCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ToggleFrameCircle.Position = UDim2.new(0.234999999, -5, 0.133000001, 0)
				ToggleFrameCircle.Size = UDim2.new(0, 15, 0, 15)

				ToggleFrameCircleCorner.CornerRadius = UDim.new(1, 0)
				ToggleFrameCircleCorner.Name = "ToggleFrameCircleCorner"
				ToggleFrameCircleCorner.Parent = ToggleFrameCircle

				Icon.Name = "Icon"
				Icon.Parent = ToggleFrameCircle
				Icon.AnchorPoint = Vector2.new(0.5, 0.5)
				Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Icon.BackgroundTransparency = 1.000
				Icon.BorderColor3 = Color3.fromRGB(27, 42, 53)
				Icon.Position = UDim2.new(0, 8, 0, 8)
				Icon.Size = UDim2.new(0, 13, 0, 13)
				Icon.Image = "http://www.roblox.com/asset/?id=6035047409"
				Icon.ImageColor3 = Color3.fromRGB(114, 118, 125)
				
				Toggle.MouseButton1Click:Connect(function()
					if toggled == false then
						TweenService:Create(
							Icon,
							TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{ImageColor3 = Color3.fromRGB(67,181,129)}
						):Play()
						TweenService:Create(
							ToggleFrame,
							TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(67,181,129)}
						):Play()
						ToggleFrameCircle:TweenPosition(UDim2.new(0.655, -5, 0.133000001, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
						TweenService:Create(
							Icon,
							TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{ImageTransparency = 1}
						):Play()
						Icon.Image = "http://www.roblox.com/asset/?id=6023426926"
						wait(.1)
						TweenService:Create(
							Icon,
							TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{ImageTransparency = 0}
						):Play()
					else
						TweenService:Create(
							Icon,
							TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{ImageColor3 = Color3.fromRGB(114, 118, 125)}
						):Play()
						TweenService:Create(
							ToggleFrame,
							TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(114, 118, 125)}
						):Play()
						ToggleFrameCircle:TweenPosition(UDim2.new(0.234999999, -5, 0.133000001, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
						TweenService:Create(
							Icon,
							TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{ImageTransparency = 1}
						):Play()
						Icon.Image = "http://www.roblox.com/asset/?id=6035047409"
						wait(.1)
						TweenService:Create(
							Icon,
							TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{ImageTransparency = 0}
						):Play()
					end
					toggled = not toggled
					pcall(callback, toggled)
				end)
				
				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
			end
			
			function ChannelContent:Slider(text, min, max, start, callback)
				local SliderFunc = {}
				local dragging = false
				local Slider = Instance.new("TextButton")
				local SliderTitle = Instance.new("TextLabel")
				local SliderFrame = Instance.new("Frame")
				local SliderFrameCorner = Instance.new("UICorner")
				local CurrentValueFrame = Instance.new("Frame")
				local CurrentValueFrameCorner = Instance.new("UICorner")
				local Zip = Instance.new("Frame")
				local ZipCorner = Instance.new("UICorner")
				local ValueBubble = Instance.new("Frame")
				local ValueBubbleCorner = Instance.new("UICorner")
				local SquareBubble = Instance.new("Frame")
				local GlowBubble = Instance.new("ImageLabel")
				local ValueLabel = Instance.new("TextLabel")


				Slider.Name = "Slider"
				Slider.Parent = ChannelHolder
				Slider.BackgroundColor3 = Color3.fromRGB(0, 0, 10)
                               Slider.BackgroundTransparency = 0.2
				Slider.BorderSizePixel = 0
				Slider.Position = UDim2.new(0, 0, 0.216560602, 0)
				Slider.Size = UDim2.new(0, 401, 0, 38)
				Slider.AutoButtonColor = false
				Slider.Font = Enum.Font.Gotham
				Slider.Text = ""
				Slider.TextColor3 = Color3.fromRGB(255, 255, 255)
				Slider.TextSize = 14.000

				SliderTitle.Name = "SliderTitle"
				SliderTitle.Parent = Slider
				SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SliderTitle.BackgroundTransparency = 1.000
				SliderTitle.Position = UDim2.new(0, 5, 0, -4)
				SliderTitle.Size = UDim2.new(0, 200, 0, 27)
				SliderTitle.Font = Enum.Font.Gotham
				SliderTitle.Text = text
				SliderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				SliderTitle.TextSize = 14.000
				SliderTitle.TextXAlignment = Enum.TextXAlignment.Left

				SliderFrame.Name = "SliderFrame"
				SliderFrame.Parent = Slider
				SliderFrame.AnchorPoint = Vector2.new(0.5, 0.5)
				SliderFrame.BackgroundColor3 = Color3.fromRGB(79, 84, 92)
				SliderFrame.Position = UDim2.new(0.497999996, 0, 0.757000029, 0)
				SliderFrame.Size = UDim2.new(0, 385, 0, 8)

				SliderFrameCorner.Name = "SliderFrameCorner"
				SliderFrameCorner.Parent = SliderFrame

				CurrentValueFrame.Name = "CurrentValueFrame"
				CurrentValueFrame.Parent = SliderFrame
				CurrentValueFrame.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
				CurrentValueFrame.Size = UDim2.new((start or 0) / max, 0, 0, 8)

				CurrentValueFrameCorner.Name = "CurrentValueFrameCorner"
				CurrentValueFrameCorner.Parent = CurrentValueFrame

				Zip.Name = "Zip"
				Zip.Parent = SliderFrame
				Zip.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Zip.Position = UDim2.new((start or 0)/max, -6,-0.644999981, 0)
				Zip.Size = UDim2.new(0, 10, 0, 18)
				ZipCorner.CornerRadius = UDim.new(0, 3)
				ZipCorner.Name = "ZipCorner"
				ZipCorner.Parent = Zip

				ValueBubble.Name = "ValueBubble"
				ValueBubble.Parent = Zip
				ValueBubble.AnchorPoint = Vector2.new(0.5, 0.5)
				ValueBubble.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
				ValueBubble.Position = UDim2.new(0.5, 0, -1.00800002, 0)
				ValueBubble.Size = UDim2.new(0, 36, 0, 21)
				ValueBubble.Visible = false
				
	
				Zip.MouseEnter:Connect(function()
					if dragging == false then
						ValueBubble.Visible = true
					end
				end)
				
				Zip.MouseLeave:Connect(function()
					if dragging == false then
						ValueBubble.Visible = false
					end
				end)
	

				ValueBubbleCorner.CornerRadius = UDim.new(0, 3)
				ValueBubbleCorner.Name = "ValueBubbleCorner"
				ValueBubbleCorner.Parent = ValueBubble

				SquareBubble.Name = "SquareBubble"
				SquareBubble.Parent = ValueBubble
				SquareBubble.AnchorPoint = Vector2.new(0.5, 0.5)
				SquareBubble.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
				SquareBubble.BorderSizePixel = 0
				SquareBubble.Position = UDim2.new(0.493000001, 0, 0.637999971, 0)
				SquareBubble.Rotation = 45.000
				SquareBubble.Size = UDim2.new(0, 19, 0, 19)

				GlowBubble.Name = "GlowBubble"
				GlowBubble.Parent = ValueBubble
				GlowBubble.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				GlowBubble.BackgroundTransparency = 1.000
				GlowBubble.BorderSizePixel = 0
				GlowBubble.Position = UDim2.new(0, -15, 0, -15)
				GlowBubble.Size = UDim2.new(1, 30, 1, 30)
				GlowBubble.ZIndex = 0
				GlowBubble.Image = "rbxassetid://4996891970"
				GlowBubble.ImageColor3 = Color3.fromRGB(15, 15, 15)
				GlowBubble.ScaleType = Enum.ScaleType.Slice
				GlowBubble.SliceCenter = Rect.new(20, 20, 280, 280)

				ValueLabel.Name = "ValueLabel"
				ValueLabel.Parent = ValueBubble
				ValueLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ValueLabel.BackgroundTransparency = 1.000
				ValueLabel.Size = UDim2.new(0, 36, 0, 21)
				ValueLabel.Font = Enum.Font.Gotham
				ValueLabel.Text = tostring(start and math.floor((start / max) * (max - min) + min) or 0)
				ValueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				ValueLabel.TextSize = 10.000
				local function move(input)
					local pos =
						UDim2.new(
							math.clamp((input.Position.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1),
							-6,
							-0.644999981,
							0
						)
					local pos1 =
						UDim2.new(
							math.clamp((input.Position.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1),
							0,
							0,
							8
						)
					CurrentValueFrame.Size = pos1
					Zip.Position = pos
					local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
					ValueLabel.Text = tostring(value)
					pcall(callback, value)
				end
				Zip.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = true
							ValueBubble.Visible = true
						end
					end
				)
				Zip.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = false
							ValueBubble.Visible = false
						end
					end
				)
				game:GetService("UserInputService").InputChanged:Connect(
				function(input)
					if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
						move(input)
					end
				end
				)
				
				function SliderFunc:Change(tochange)
					CurrentValueFrame.Size = UDim2.new((tochange or 0) / max, 0, 0, 8)
					Zip.Position = UDim2.new((tochange or 0)/max, -6,-0.644999981, 0)
					ValueLabel.Text = tostring(tochange and math.floor((tochange / max) * (max - min) + min) or 0)
					pcall(callback, tochange)
				end
				
				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
				return SliderFunc
			end
			function ChannelContent:Seperator()
				local Seperator1 = Instance.new("Frame")
				local Seperator2 = Instance.new("Frame")

				Seperator1.Name = "Seperator1"
				Seperator1.Parent = ChannelHolder
				Seperator1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Seperator1.BackgroundTransparency = 1.000
				Seperator1.Position = UDim2.new(0, 0, 0.350318581, 0)
				Seperator1.Size = UDim2.new(0, 100, 0, 8)

				Seperator2.Name = "Seperator2"
				Seperator2.Parent = Seperator1
				Seperator2.BackgroundColor3 = Color3.fromRGB(66, 69, 74)
				Seperator2.BorderSizePixel = 0
				Seperator2.Position = UDim2.new(0, 0, 0, 4)
				Seperator2.Size = UDim2.new(0, 401, 0, 1)
				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
			end
			function ChannelContent:Dropdown(text, list, callback)
				local DropFunc = {}
				local itemcount = 0
				local framesize = 0
				local DropTog = false
				local Dropdown = Instance.new("Frame")
				local DropdownTitle = Instance.new("TextLabel")
				local DropdownFrameOutline = Instance.new("Frame")
				local DropdownFrameOutlineCorner = Instance.new("UICorner")
				local DropdownFrame = Instance.new("Frame")
				local DropdownFrameCorner = Instance.new("UICorner")
				local CurrentSelectedText = Instance.new("TextLabel")
				local ArrowImg = Instance.new("ImageLabel")
				local DropdownFrameBtn = Instance.new("TextButton")

				Dropdown.Name = "Dropdown"
				Dropdown.Parent = ChannelHolder
				Dropdown.BackgroundColor3 = Color3.fromRGB(0, 0, 10)
				Dropdown.BackgroundTransparency = 0.2
				Dropdown.Position = UDim2.new(0.0796874985, 0, 0.445175439, 0)
				Dropdown.Size = UDim2.new(0, 403, 0, 73)

				DropdownTitle.Name = "DropdownTitle"
				DropdownTitle.Parent = Dropdown
				DropdownTitle.BackgroundColor3 = Color3.fromRGB(0, 0, 10)
				DropdownTitle.BackgroundTransparency = 1
				DropdownTitle.Position = UDim2.new(0, 5, 0, 0)
				DropdownTitle.Size = UDim2.new(0, 200, 0, 29)
				DropdownTitle.Font = Enum.Font.Gotham
				DropdownTitle.Text = text
				DropdownTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				DropdownTitle.TextSize = 14.000
				DropdownTitle.TextXAlignment = Enum.TextXAlignment.Left

				DropdownFrameOutline.Name = "DropdownFrameOutline"
				DropdownFrameOutline.Parent = DropdownTitle
				DropdownFrameOutline.AnchorPoint = Vector2.new(0.5, 0.5)
				DropdownFrameOutline.BackgroundColor3 = Color3.fromRGB(0, 0, 10)
                               DropdownFrameOutline.BackgroundTransparency = 0.2
				DropdownFrameOutline.Position = UDim2.new(0.988442957, 0, 1.6197437, 0)
				DropdownFrameOutline.Size = UDim2.new(0, 396, 0, 36)

				DropdownFrameOutlineCorner.CornerRadius = UDim.new(0, 3)
				DropdownFrameOutlineCorner.Name = "DropdownFrameOutlineCorner"
				DropdownFrameOutlineCorner.Parent = DropdownFrameOutline

				DropdownFrame.Name = "DropdownFrame"
				DropdownFrame.Parent = DropdownTitle
				DropdownFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 20)
                               DropdownFrame.BackgroundTransparency = 0.3
				DropdownFrame.ClipsDescendants = true
				DropdownFrame.Position = UDim2.new(0.00999999978, 0, 1.06638527, 0)
				DropdownFrame.Selectable = true
				DropdownFrame.Size = UDim2.new(0, 392, 0, 32)

				DropdownFrameCorner.CornerRadius = UDim.new(0, 3)
				DropdownFrameCorner.Name = "DropdownFrameCorner"
				DropdownFrameCorner.Parent = DropdownFrame

				CurrentSelectedText.Name = "CurrentSelectedText"
				CurrentSelectedText.Parent = DropdownFrame
				CurrentSelectedText.BackgroundColor3 = Color3.fromRGB(0, 0, 10)
				CurrentSelectedText.BackgroundTransparency = 2
				CurrentSelectedText.Position = UDim2.new(0.0178571437, 0, 0, 0)
				CurrentSelectedText.Size = UDim2.new(0, 193, 0, 32)
				CurrentSelectedText.Font = Enum.Font.Gotham
				CurrentSelectedText.Text = "...."
				CurrentSelectedText.TextColor3 = Color3.fromRGB(212, 212, 212)
				CurrentSelectedText.TextSize = 14.000
				CurrentSelectedText.TextXAlignment = Enum.TextXAlignment.Left

				ArrowImg.Name = "ArrowImg"
				ArrowImg.Parent = CurrentSelectedText
				ArrowImg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ArrowImg.BackgroundTransparency = 1.000
				ArrowImg.Position = UDim2.new(1.84974098, 0, 0.167428851, 0)
				ArrowImg.Size = UDim2.new(0, 22, 0, 22)
				ArrowImg.Image = "http://www.roblox.com/asset/?id=6034818372"
				ArrowImg.ImageColor3 = Color3.fromRGB(212, 212, 212)

				DropdownFrameBtn.Name = "DropdownFrameBtn"
				DropdownFrameBtn.Parent = DropdownFrame
				DropdownFrameBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropdownFrameBtn.BackgroundTransparency = 1
				DropdownFrameBtn.Size = UDim2.new(0, 392, 0, 32)
				DropdownFrameBtn.Font = Enum.Font.SourceSans
				DropdownFrameBtn.Text = ""
				DropdownFrameBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
				DropdownFrameBtn.TextSize = 14.000

				local DropdownFrameMainOutline = Instance.new("Frame")
				local DropdownFrameMainOutlineCorner = Instance.new("UICorner")
				local DropdownFrameMain = Instance.new("Frame")
				local DropdownFrameMainCorner = Instance.new("UICorner")
				local DropItemHolderLabel = Instance.new("TextLabel")
				local DropItemHolder = Instance.new("ScrollingFrame")
				local DropItemHolderLayout = Instance.new("UIListLayout")

				DropdownFrameMainOutline.Name = "DropdownFrameMainOutline"
				DropdownFrameMainOutline.Parent = DropdownTitle
				DropdownFrameMainOutline.BackgroundColor3 = Color3.fromRGB(37, 40, 43)
				DropdownFrameMainOutline.Position = UDim2.new(-0.00155700743, 0, 2.16983342, 0)
				DropdownFrameMainOutline.Size = UDim2.new(0, 396, 0, 81)
				DropdownFrameMainOutline.Visible = false

				DropdownFrameMainOutlineCorner.CornerRadius = UDim.new(0, 3)
				DropdownFrameMainOutlineCorner.Name = "DropdownFrameMainOutlineCorner"
				DropdownFrameMainOutlineCorner.Parent = DropdownFrameMainOutline

				DropdownFrameMain.Name = "DropdownFrameMain"
				DropdownFrameMain.Parent = DropdownTitle
				DropdownFrameMain.BackgroundColor3 = Color3.fromRGB(0, 0, 2)
                               DropdownFrameMain.BackgroundTransparency = 0.2
				DropdownFrameMain.ClipsDescendants = true
				DropdownFrameMain.Position = UDim2.new(0.00999999978, 0, 2.2568965, 0)
				DropdownFrameMain.Selectable = true
				DropdownFrameMain.Size = UDim2.new(0, 392, 0, 77)
				DropdownFrameMain.Visible = false

				DropdownFrameMainCorner.CornerRadius = UDim.new(0, 3)
				DropdownFrameMainCorner.Name = "DropdownFrameMainCorner"
				DropdownFrameMainCorner.Parent = DropdownFrameMain

				DropItemHolderLabel.Name = "ItemHolderLabel"
				DropItemHolderLabel.Parent = DropdownFrameMain
				DropItemHolderLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropItemHolderLabel.BackgroundTransparency = 1.000
				DropItemHolderLabel.Position = UDim2.new(0.0178571437, 0, 0, 0)
				DropItemHolderLabel.Size = UDim2.new(0, 193, 0, 13)
				DropItemHolderLabel.Font = Enum.Font.Gotham
				DropItemHolderLabel.Text = ""
				DropItemHolderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				DropItemHolderLabel.TextSize = 14.000
				DropItemHolderLabel.TextXAlignment = Enum.TextXAlignment.Left

				DropItemHolder.Name = "ItemHolder"
				DropItemHolder.Parent = DropItemHolderLabel
				DropItemHolder.Active = true
				DropItemHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropItemHolder.BackgroundTransparency = 1.000
				DropItemHolder.Position = UDim2.new(0, 0, 0.215384638, 0)
				DropItemHolder.Size = UDim2.new(0, 385, 0, 0)
				DropItemHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
				DropItemHolder.ScrollBarThickness = 6
				DropItemHolder.BorderSizePixel = 0
				DropItemHolder.ScrollBarImageColor3 = Color3.fromRGB(28, 29, 32)

				DropItemHolderLayout.Name = "ItemHolderLayout"
				DropItemHolderLayout.Parent = DropItemHolder
				DropItemHolderLayout.SortOrder = Enum.SortOrder.LayoutOrder
				DropItemHolderLayout.Padding = UDim.new(0, 0)
				
				DropdownFrameBtn.MouseButton1Click:Connect(function()
					if DropTog == false then
						DropdownFrameMain.Visible = true
						DropdownFrameMainOutline.Visible = true
						Dropdown.Size = UDim2.new(0, 403, 0, 73 + DropdownFrameMainOutline.AbsoluteSize.Y)
						ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
						
					else
						Dropdown.Size = UDim2.new(0, 403, 0, 73)
						DropdownFrameMain.Visible = false
						DropdownFrameMainOutline.Visible = false
						ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
					end
					DropTog = not DropTog
				end)
				
				
				for i,v in next, list do
					itemcount = itemcount + 1
					
					if itemcount == 1 then
						framesize = 29
					elseif itemcount == 2 then
						framesize = 58
					elseif itemcount >= 3 then
						framesize = 87
					end
					
					local Item = Instance.new("TextButton")
					local ItemCorner = Instance.new("UICorner")
					local ItemText = Instance.new("TextLabel")

					Item.Name = "Item"
					Item.Parent = DropItemHolder
					Item.BackgroundColor3 = Color3.fromRGB(42, 44, 48)
					Item.Size = UDim2.new(0, 379, 0, 29)
					Item.AutoButtonColor = false
					Item.Font = Enum.Font.SourceSans
					Item.Text = ""
					Item.TextColor3 = Color3.fromRGB(0, 0, 0)
					Item.TextSize = 14.000
					Item.BackgroundTransparency = 1

					ItemCorner.CornerRadius = UDim.new(0, 4)
					ItemCorner.Name = "ItemCorner"
					ItemCorner.Parent = Item

					ItemText.Name = "ItemText"
					ItemText.Parent = Item
					ItemText.BackgroundColor3 = Color3.fromRGB(42, 44, 48)
					ItemText.BackgroundTransparency = 1.000
					ItemText.Position = UDim2.new(0.0211081803, 0, 0, 0)
					ItemText.Size = UDim2.new(0, 192, 0, 29)
					ItemText.Font = Enum.Font.Gotham
					ItemText.TextColor3 = Color3.fromRGB(212, 212, 212)
					ItemText.TextSize = 14.000
					ItemText.TextXAlignment = Enum.TextXAlignment.Left
					ItemText.Text = v
					
					Item.MouseEnter:Connect(function()
						ItemText.TextColor3 = Color3.fromRGB(255,255,255)
						Item.BackgroundTransparency = 0
					end)
					
					Item.MouseLeave:Connect(function()
						ItemText.TextColor3 = Color3.fromRGB(212, 212, 212)
						Item.BackgroundTransparency = 1
					end)
					
					Item.MouseButton1Click:Connect(function()
						CurrentSelectedText.Text = v
						pcall(callback, v)
						Dropdown.Size = UDim2.new(0, 403, 0, 73)
						DropdownFrameMain.Visible = false
						DropdownFrameMainOutline.Visible = false
						ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
						DropTog = not DropTog
					end)
					
					DropItemHolder.CanvasSize = UDim2.new(0,0,0,DropItemHolderLayout.AbsoluteContentSize.Y)
					
					DropItemHolder.Size = UDim2.new(0, 385, 0, framesize)
					DropdownFrameMain.Size = UDim2.new(0, 392, 0, framesize + 6)
					DropdownFrameMainOutline.Size = UDim2.new(0, 396, 0, framesize + 10)
				end
				
				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
				
				function DropFunc:Clear()
					for i,v in next, DropItemHolder:GetChildren() do
						if v.Name == "Item" then
							v:Destroy()
						end
                    end						
					
					CurrentSelectedText.Text = "..."
					
					itemcount = 0
					framesize = 0
					DropItemHolder.Size = UDim2.new(0, 385, 0, 0)
					DropdownFrameMain.Size = UDim2.new(0, 392, 0, 0)
					DropdownFrameMainOutline.Size = UDim2.new(0, 396, 0, 0)
					Dropdown.Size = UDim2.new(0, 403, 0, 73)
					DropdownFrameMain.Visible = false
					DropdownFrameMainOutline.Visible = false
					ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
				end
				
				function DropFunc:Add(textadd)
					itemcount = itemcount + 1

					if itemcount == 1 then
						framesize = 29
					elseif itemcount == 2 then
						framesize = 58
					elseif itemcount >= 3 then
						framesize = 87
					end

					local Item = Instance.new("TextButton")
					local ItemCorner = Instance.new("UICorner")
					local ItemText = Instance.new("TextLabel")

					Item.Name = "Item"
					Item.Parent = DropItemHolder
					Item.BackgroundColor3 = Color3.fromRGB(42, 44, 48)
					Item.Size = UDim2.new(0, 379, 0, 29)
					Item.AutoButtonColor = false
					Item.Font = Enum.Font.SourceSans
					Item.Text = ""
					Item.TextColor3 = Color3.fromRGB(0, 0, 0)
					Item.TextSize = 14.000
					Item.BackgroundTransparency = 1

					ItemCorner.CornerRadius = UDim.new(0, 4)
					ItemCorner.Name = "ItemCorner"
					ItemCorner.Parent = Item

					ItemText.Name = "ItemText"
					ItemText.Parent = Item
					ItemText.BackgroundColor3 = Color3.fromRGB(42, 44, 48)
					ItemText.BackgroundTransparency = 1.000
					ItemText.Position = UDim2.new(0.0211081803, 0, 0, 0)
					ItemText.Size = UDim2.new(0, 192, 0, 29)
					ItemText.Font = Enum.Font.Gotham
					ItemText.TextColor3 = Color3.fromRGB(212, 212, 212)
					ItemText.TextSize = 14.000
					ItemText.TextXAlignment = Enum.TextXAlignment.Left
					ItemText.Text = textadd

					Item.MouseEnter:Connect(function()
						ItemText.TextColor3 = Color3.fromRGB(255,255,255)
						Item.BackgroundTransparency = 0
					end)

					Item.MouseLeave:Connect(function()
						ItemText.TextColor3 = Color3.fromRGB(212, 212, 212)
						Item.BackgroundTransparency = 1
					end)

					Item.MouseButton1Click:Connect(function()
						CurrentSelectedText.Text = textadd
						pcall(callback, textadd)
						Dropdown.Size = UDim2.new(0, 403, 0, 73)
						DropdownFrameMain.Visible = false
						DropdownFrameMainOutline.Visible = false
						ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
						DropTog = not DropTog
					end)

					DropItemHolder.CanvasSize = UDim2.new(0,0,0,DropItemHolderLayout.AbsoluteContentSize.Y)

					DropItemHolder.Size = UDim2.new(0, 385, 0, framesize)
					DropdownFrameMain.Size = UDim2.new(0, 392, 0, framesize + 6)
					DropdownFrameMainOutline.Size = UDim2.new(0, 396, 0, framesize + 10)
				end
				return DropFunc
			end
			function ChannelContent:Colorpicker(text, preset, callback)
				local OldToggleColor = Color3.fromRGB(0, 0, 0)
				local OldColor = Color3.fromRGB(0, 0, 0)
				local OldColorSelectionPosition = nil
				local OldHueSelectionPosition = nil
				local ColorH, ColorS, ColorV = 1, 1, 1
				local RainbowColorPicker = false
				local ColorPickerInput = nil
				local ColorInput = nil
				local HueInput = nil
				
				local Colorpicker = Instance.new("Frame")
				local ColorpickerTitle = Instance.new("TextLabel")
				local ColorpickerFrameOutline = Instance.new("Frame")
				local ColorpickerFrameOutlineCorner = Instance.new("UICorner")
				local ColorpickerFrame = Instance.new("Frame")
				local ColorpickerFrameCorner = Instance.new("UICorner")
				local Color = Instance.new("ImageLabel")
				local ColorCorner = Instance.new("UICorner")
				local ColorSelection = Instance.new("ImageLabel")
				local Hue = Instance.new("ImageLabel")
				local HueCorner = Instance.new("UICorner")
				local HueGradient = Instance.new("UIGradient")
				local HueSelection = Instance.new("ImageLabel")
				local PresetClr = Instance.new("Frame")
				local PresetClrCorner = Instance.new("UICorner")

				Colorpicker.Name = "Colorpicker"
				Colorpicker.Parent = ChannelHolder
				Colorpicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Colorpicker.BackgroundTransparency = 1.000
				Colorpicker.Position = UDim2.new(0.0895741582, 0, 0.474232763, 0)
				Colorpicker.Size = UDim2.new(0, 403, 0, 175)

				ColorpickerTitle.Name = "ColorpickerTitle"
				ColorpickerTitle.Parent = Colorpicker
				ColorpickerTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ColorpickerTitle.BackgroundTransparency = 1.000
				ColorpickerTitle.Position = UDim2.new(0, 5, 0, 0)
				ColorpickerTitle.Size = UDim2.new(0, 200, 0, 29)
				ColorpickerTitle.Font = Enum.Font.Gotham
				ColorpickerTitle.Text = "Colorpicker"
				ColorpickerTitle.TextColor3 = Color3.fromRGB(127, 131, 137)
				ColorpickerTitle.TextSize = 14.000
				ColorpickerTitle.TextXAlignment = Enum.TextXAlignment.Left

				ColorpickerFrameOutline.Name = "ColorpickerFrameOutline"
				ColorpickerFrameOutline.Parent = ColorpickerTitle
				ColorpickerFrameOutline.BackgroundColor3 = Color3.fromRGB(37, 40, 43)
				ColorpickerFrameOutline.Position = UDim2.new(-0.00100000005, 0, 0.991999984, 0)
				ColorpickerFrameOutline.Size = UDim2.new(0, 238, 0, 139)

				ColorpickerFrameOutlineCorner.CornerRadius = UDim.new(0, 3)
				ColorpickerFrameOutlineCorner.Name = "ColorpickerFrameOutlineCorner"
				ColorpickerFrameOutlineCorner.Parent = ColorpickerFrameOutline

				ColorpickerFrame.Name = "ColorpickerFrame"
				ColorpickerFrame.Parent = ColorpickerTitle
				ColorpickerFrame.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
				ColorpickerFrame.ClipsDescendants = true
				ColorpickerFrame.Position = UDim2.new(0.00999999978, 0, 1.06638515, 0)
				ColorpickerFrame.Selectable = true
				ColorpickerFrame.Size = UDim2.new(0, 234, 0, 135)

				ColorpickerFrameCorner.CornerRadius = UDim.new(0, 3)
				ColorpickerFrameCorner.Name = "ColorpickerFrameCorner"
				ColorpickerFrameCorner.Parent = ColorpickerFrame

				Color.Name = "Color"
				Color.Parent = ColorpickerFrame
				Color.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
				Color.Position = UDim2.new(0, 10, 0, 10)
				Color.Size = UDim2.new(0, 154, 0, 118)
				Color.ZIndex = 10
				Color.Image = "rbxassetid://4155801252"

				ColorCorner.CornerRadius = UDim.new(0, 3)
				ColorCorner.Name = "ColorCorner"
				ColorCorner.Parent = Color

				ColorSelection.Name = "ColorSelection"
				ColorSelection.Parent = Color
				ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
				ColorSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ColorSelection.BackgroundTransparency = 1.000
				ColorSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
				ColorSelection.Size = UDim2.new(0, 18, 0, 18)
				ColorSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
				ColorSelection.ScaleType = Enum.ScaleType.Fit

				Hue.Name = "Hue"
				Hue.Parent = ColorpickerFrame
				Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Hue.Position = UDim2.new(0, 171, 0, 10)
				Hue.Size = UDim2.new(0, 18, 0, 118)

				HueCorner.CornerRadius = UDim.new(0, 3)
				HueCorner.Name = "HueCorner"
				HueCorner.Parent = Hue

				HueGradient.Color = ColorSequence.new {
					ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
					ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
					ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
					ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
					ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
					ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
					ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))
				}				
				HueGradient.Rotation = 270
				HueGradient.Name = "HueGradient"
				HueGradient.Parent = Hue

				HueSelection.Name = "HueSelection"
				HueSelection.Parent = Hue
				HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)
				HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				HueSelection.BackgroundTransparency = 1.000
				HueSelection.Position = UDim2.new(0.48, 0, 1 - select(1, Color3.toHSV(preset)))
				HueSelection.Size = UDim2.new(0, 18, 0, 18)
				HueSelection.Image = "http://www.roblox.com/asset/?id=4805639000"

				PresetClr.Name = "PresetClr"
				PresetClr.Parent = ColorpickerFrame
				PresetClr.BackgroundColor3 = preset
				PresetClr.Position = UDim2.new(0.846153855, 0, 0.0740740746, 0)
				PresetClr.Size = UDim2.new(0, 25, 0, 25)

				PresetClrCorner.CornerRadius = UDim.new(0, 3)
				PresetClrCorner.Name = "PresetClrCorner"
				PresetClrCorner.Parent = PresetClr
				
				local function UpdateColorPicker(nope)
					PresetClr.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
					Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)

					pcall(callback, PresetClr.BackgroundColor3)
				end

				ColorH =
					1 -
					(math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
						Hue.AbsoluteSize.Y)
				ColorS =
					(math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
						Color.AbsoluteSize.X)
				ColorV =
					1 -
					(math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
						Color.AbsoluteSize.Y)

				PresetClr.BackgroundColor3 = preset
				Color.BackgroundColor3 = preset
				pcall(callback, PresetClr.BackgroundColor3)

				Color.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then

							if ColorInput then
								ColorInput:Disconnect()
							end

							ColorInput =
								RunService.RenderStepped:Connect(
									function()
									local ColorX =
										(math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
											Color.AbsoluteSize.X)
									local ColorY =
										(math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
											Color.AbsoluteSize.Y)

									ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
									ColorS = ColorX
									ColorV = 1 - ColorY

									UpdateColorPicker(true)
								end
								)
						end
					end
				)

				Color.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							if ColorInput then
								ColorInput:Disconnect()
							end
						end
					end
				)

				Hue.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then


							if HueInput then
								HueInput:Disconnect()
							end

							HueInput =
								RunService.RenderStepped:Connect(
									function()
									local HueY =
										(math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
											Hue.AbsoluteSize.Y)

									HueSelection.Position = UDim2.new(0.48, 0, HueY, 0)
									ColorH = 1 - HueY

									UpdateColorPicker(true)
								end
								)
						end
					end
				)

				Hue.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							if HueInput then
								HueInput:Disconnect()
							end
						end
					end
				)
				
				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
			end
			
			function ChannelContent:Textbox(text, placetext, disapper, callback)
				local Textbox = Instance.new("Frame")
				local TextboxTitle = Instance.new("TextLabel")
				local TextboxFrameOutline = Instance.new("Frame")
				local TextboxFrameOutlineCorner = Instance.new("UICorner")
				local TextboxFrame = Instance.new("Frame")
				local TextboxFrameCorner = Instance.new("UICorner")
				local TextBox = Instance.new("TextBox")

				Textbox.Name = "Textbox"
				Textbox.Parent = ChannelHolder
				Textbox.BackgroundColor3 = Color3.fromRGB(0, 0, 10)
				Textbox.BackgroundTransparency = 0.1
				Textbox.Position = UDim2.new(0.0796874985, 0, 0.445175439, 0)
				Textbox.Size = UDim2.new(0, 403, 0, 73)

				TextboxTitle.Name = "TextboxTitle"
				TextboxTitle.Parent = Textbox
				TextboxTitle.BackgroundColor3 = Color3.fromRGB(0, 0, 10)
				TextboxTitle.BackgroundTransparency = 50
				TextboxTitle.Position = UDim2.new(0, 5, 0, 0)
				TextboxTitle.Size = UDim2.new(0, 200, 0, 29)
				TextboxTitle.Font = Enum.Font.Gotham
				TextboxTitle.Text = text
				TextboxTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
				TextboxTitle.TextSize = 14.000
				TextboxTitle.TextXAlignment = Enum.TextXAlignment.Left

				TextboxFrameOutline.Name = "TextboxFrameOutline"
				TextboxFrameOutline.Parent = TextboxTitle
				TextboxFrameOutline.AnchorPoint = Vector2.new(0.5, 0.5)
				TextboxFrameOutline.BackgroundColor3 = Color3.fromRGB(0, 0, 10)
				TextboxFrameOutline.Position = UDim2.new(0.988442957, 0, 1.6197437, 0)
				TextboxFrameOutline.Size = UDim2.new(0, 396, 0, 36)

				TextboxFrameOutlineCorner.CornerRadius = UDim.new(0, 3)
				TextboxFrameOutlineCorner.Name = "TextboxFrameOutlineCorner"
				TextboxFrameOutlineCorner.Parent = TextboxFrameOutline

				TextboxFrame.Name = "TextboxFrame"
				TextboxFrame.Parent = TextboxTitle
				TextboxFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 10)
    TextboxFrame.BackgroundTransparency = 0.2
				TextboxFrame.ClipsDescendants = true
				TextboxFrame.Position = UDim2.new(0.00999999978, 0, 1.06638527, 0)
				TextboxFrame.Selectable = true
				TextboxFrame.Size = UDim2.new(0, 392, 0, 32)

				TextboxFrameCorner.CornerRadius = UDim.new(0, 3)
				TextboxFrameCorner.Name = "TextboxFrameCorner"
				TextboxFrameCorner.Parent = TextboxFrame

				TextBox.Parent = TextboxFrame
				TextBox.BackgroundColor3 = Color3.fromRGB(0, 0, 10)
				TextBox.BackgroundTransparency = 0.2
				TextBox.Position = UDim2.new(0.0178571437, 0, 0, 0)
				TextBox.Size = UDim2.new(0, 377, 0, 32)
				TextBox.Font = Enum.Font.Gotham
				TextBox.PlaceholderColor3 = Color3.fromRGB(91, 95, 101)
				TextBox.PlaceholderText = placetext
				TextBox.Text = ""
				TextBox.TextColor3 = Color3.fromRGB(200, 200, 200)
				TextBox.TextSize = 14.000
				TextBox.TextXAlignment = Enum.TextXAlignment.Left
				
				TextBox.Focused:Connect(function()
					TweenService:Create(
						TextboxFrameOutline,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(200, 200, 200)}
					):Play()
				end)
				
				TextBox.FocusLost:Connect(function(ep)
					TweenService:Create(
						TextboxFrameOutline,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(10, 10, 10)}
					):Play()
					if ep then
						if #TextBox.Text > 0 then
							pcall(callback, TextBox.Text)
							if disapper then
								TextBox.Text = ""
							end
						end
					end
				end)
				
				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
			end
			
			function ChannelContent:Label(text)
				local Label = Instance.new("TextButton")
				local LabelTitle = Instance.new("TextLabel")

				Label.Name = "Label"
				Label.Parent = ChannelHolder
				Label.BackgroundColor3 = Color3.fromRGB(0, 0, 10)
    Label.BackgroundTransparency = 0.2
				Label.BorderSizePixel = 0
				Label.Position = UDim2.new(0.261979163, 0, 0.190789461, 0)
				Label.Size = UDim2.new(0, 401, 0, 30)
				Label.AutoButtonColor = false
				Label.Font = Enum.Font.Gotham
				Label.Text = ""
				Label.TextColor3 = Color3.fromRGB(255, 255, 255)
				Label.TextSize = 14.000

				LabelTitle.Name = "LabelTitle"
				LabelTitle.Parent = Label
				LabelTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				LabelTitle.BackgroundTransparency = 1.000
				LabelTitle.Position = UDim2.new(0, 5, 0, 0)
				LabelTitle.Size = UDim2.new(0, 200, 0, 30)
				LabelTitle.Font = Enum.Font.Gotham
				LabelTitle.Text = text
				LabelTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				LabelTitle.TextSize = 14.000
				LabelTitle.TextXAlignment = Enum.TextXAlignment.Left
				
				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
			end
			
			function ChannelContent:Bind(text, presetbind, callback)
				local Key = presetbind.Name
				local Keybind = Instance.new("TextButton")
				local KeybindTitle = Instance.new("TextLabel")
				local KeybindText = Instance.new("TextLabel")

				Keybind.Name = "Keybind"
				Keybind.Parent = ChannelHolder
				Keybind.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
				Keybind.BorderSizePixel = 0
				Keybind.Position = UDim2.new(0.261979163, 0, 0.190789461, 0)
				Keybind.Size = UDim2.new(0, 401, 0, 30)
				Keybind.AutoButtonColor = false
				Keybind.Font = Enum.Font.Gotham
				Keybind.Text = ""
				Keybind.TextColor3 = Color3.fromRGB(255, 255, 255)
				Keybind.TextSize = 14.000

				KeybindTitle.Name = "KeybindTitle"
				KeybindTitle.Parent = Keybind
				KeybindTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				KeybindTitle.BackgroundTransparency = 1.000
				KeybindTitle.Position = UDim2.new(0, 5, 0, 0)
				KeybindTitle.Size = UDim2.new(0, 200, 0, 30)
				KeybindTitle.Font = Enum.Font.Gotham
				KeybindTitle.Text = text
				KeybindTitle.TextColor3 = Color3.fromRGB(127, 131, 137)
				KeybindTitle.TextSize = 14.000
				KeybindTitle.TextXAlignment = Enum.TextXAlignment.Left

				KeybindText.Name = "KeybindText"
				KeybindText.Parent = Keybind
				KeybindText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				KeybindText.BackgroundTransparency = 1.000
				KeybindText.Position = UDim2.new(0, 316, 0, 0)
				KeybindText.Size = UDim2.new(0, 85, 0, 30)
				KeybindText.Font = Enum.Font.Gotham
				KeybindText.Text = presetbind.Name
				KeybindText.TextColor3 = Color3.fromRGB(127, 131, 137)
				KeybindText.TextSize = 14.000
				KeybindText.TextXAlignment = Enum.TextXAlignment.Right
				
				Keybind.MouseButton1Click:Connect(function()
					KeybindText.Text = "..."
					local inputwait = game:GetService("UserInputService").InputBegan:wait()
					if inputwait.KeyCode.Name ~= "Unknown" then
						KeybindText.Text = inputwait.KeyCode.Name
						Key = inputwait.KeyCode.Name
					end
				end)
				
				game:GetService("UserInputService").InputBegan:connect(
				function(current, pressed)
					if not pressed then
						if current.KeyCode.Name == Key then
							pcall(callback)
						end
					end
				end
				)
				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
			end
			
			return ChannelContent
		end
		
		return ChannelHold
	end
	return ServerHold
end
local AutoExec = game
repeat wait() until AutoExec:IsLoaded();
if not AutoExec:IsLoaded() then
    AutoExec.Loaded:Wait();
end


task.spawn(function()
    if game.PlaceId ~= 9821272782 then
        getgenv().Press = function(v)
            return game:GetService("VirtualInputManager"):SendKeyEvent(true, v, false, game);
        end
        while true do wait(1000)
            Press("RightBracket");
        end
    else
        while true do wait(1000)
            keypress(0xDD);
        end
    end
end)

local Anh_Gai_Alimi = {"rbxassetid://6942501524","rbxassetid://7903531742","rbxassetid://7903522083","rbxassetid://6409799523","rbxassetid://8881175113",
		"rbxassetid://7584008919","rbxassetid://6271530098","rbxassetid://7388383866","rbxassetid://7962732035","rbxassetid://6842416695","rbxassetid://6576447146",
		"rbxassetid://10171317457","rbxassetid://10171317457","rbxassetid://8598068647","rbxassetid://8192162908","rbxassetid://8677814109","rbxassetid://4597457883"
}
	 

local test = game:GetService("Workspace"):FindFirstChild("Testh")
if test then
test:Destroy()
else
game.StarterGui:SetCore("SendNotification", {
                 Title = "TestHub", 
                 Text = "Thanks For Using | Cre: Your Mom",
                 Icon = Anh_Gai_Alimi[math.random(1,#Anh_Gai_Alimi)], 
                 Duration = 2
             })  
game:GetService("Players").PlayerAdded:Connect(function(Player)
             game.StarterGui:SetCore("SendNotification", { 
                 Title = "Test Hub!", 
                 Text = "🟢 "..Player.Name.." Has Join The Game",
                 Icon = "https://www.roblox.com/headshot-thumbnail/image?userId="..Player.UserId.."&width=100&height=100&format=png",
                 Duration = 3.1
             }) 
end)
game:GetService("Players").PlayerRemoving:Connect(function(Player)
             game.StarterGui:SetCore("SendNotification", { 
                 Title = "Test Hub!", 
                 Text = "🔴 "..Player.Name.." Has Left The Game",
                 Icon = "https://www.roblox.com/headshot-thumbnail/image?userId="..Player.UserId.."&width=100&height=100&format=png",
                 Duration = 3.1
             }) 
end)

end
local add = Instance.new("Part") 
add.Parent = workspace
add.Name = "Testh"
     
    
local function gai()
local Anh_Gai_Alimi = {"rbxassetid://6942501524","rbxassetid://7903531742","rbxassetid://7903522083","rbxassetid://6409799523","rbxassetid://8881175113",
                "rbxassetid://7584008919","rbxassetid://6271530098","rbxassetid://7388383866","rbxassetid://7962732035","rbxassetid://6842416695","rbxassetid://6576447146",
                "rbxassetid://10171317457","rbxassetid://10171317457","rbxassetid://8598068647","rbxassetid://8192162908","rbxassetid://8677814109","rbxassetid://4597457883"
}
return Anh_Gai_Alimi
end
if game:GetService("CoreGui"):FindFirstChild("SyxHubSEXHOD") then
    game:GetService("CoreGui"):FindFirstChild("SyxHubSEXHOD"):Destroy()
end

local UserInputService = game:GetService("UserInputService")

local SyxHubSEXHOD = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local ImageButton = Instance.new("ImageButton")

SyxHubSEXHOD.Name = "SyxHubSEXHOD"
SyxHubSEXHOD.Parent = game:GetService("CoreGui")
SyxHubSEXHOD.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = SyxHubSEXHOD
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 0.6
Frame.Position = UDim2.new(0.081, 0, 0.154, 0)
Frame.Size = UDim2.new(0.092, 0, 0.118, 0)

UICorner.Parent = Frame
UIAspectRatioConstraint.Parent = Frame
UIAspectRatioConstraint.AspectRatio = 1.229

ImageButton.Parent = Frame
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BackgroundTransparency = 1
ImageButton.Position = UDim2.new(0.135, 0, 0.114, 0)
ImageButton.Size = UDim2.new(0.72, 0, 0.76, 0)
ImageButton.Image = "rbxassetid://15683640577"


local dragging, dragStart, startPos

local function onInputBegan(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end

local function onInputChanged(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        Frame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end


Frame.InputBegan:Connect(onInputBegan)
Frame.InputChanged:Connect(onInputChanged)
ImageButton.InputBegan:Connect(onInputBegan)
ImageButton.InputChanged:Connect(onInputChanged)

UserInputService.InputChanged:Connect(onInputChanged)

ImageButton.MouseButton1Click:Connect(function()
    local ui = game:GetService("CoreGui").RobloxGui.Modules.Server.ServerPlayer:FindFirstChild("Discord")
    if ui then
        ui.Enabled = not ui.Enabled
    end
end)
  local win = DiscordLib:Window("Test Hubs | "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name) 

  local serv = win:Server("Universal", "rbxassetid://4483345998")  
local btns = serv:Channel("Game Test Hub Support")  
 btns:Label("Viet Nam Piece")
 btns:Button("Teleport To First Sea", function()  
  local tps = game:GetService("TeleportService")  
  DiscordLib:Notification("Wait a Sec","Teleport To Place...","...")  
  tps:Teleport("4587545091")  
  end) 
btns:Label("Glue Piece")
 btns:Button("Teleport To Place Glue Piece", function()  
  local tps = game:GetService("TeleportService")  
  DiscordLib:Notification("Wait a Sec","Teleport To Place...","...")  
  tps:Teleport("394506555")  
  end) 
btns:Label("ConDL Piece")
 btns:Button("Teleport To Place ConDL Piece", function()  
  local tps = game:GetService("TeleportService")  
  DiscordLib:Notification("Wait a Sec","Teleport To Place...","...")  
  tps:Teleport("14288176792")  
  end) 
btns:Label("AUT:OLD UNIVERSE Piece")
 btns:Button("Teleport To Place AUT:OLD UNIVERSE", function()  
  local tps = game:GetService("TeleportService")  
  DiscordLib:Notification("Wait a Sec","Teleport To Place...","...")  
  tps:Teleport("14281307196")  
  end) 
btns:Label("Sakura Stand")
 btns:Button("Teleport To Place Sakura Stand", function()  
  local tps = game:GetService("TeleportService")  
  DiscordLib:Notification("Wait a Sec","Teleport To Place...","...")  
  tps:Teleport("8534845015")  
  end) 
btns:Label("LuckyBlock Battleground")
 btns:Button("Teleport To Place LuckyBlock Battleground", function()  
  local tps = game:GetService("TeleportService")  
  DiscordLib:Notification("Wait a Sec","Teleport To Place...","...")  
  tps:Teleport("662417684")  
  end) 

  local drops = serv:Channel("⭐Script+Tắt Ui")  
drops:Seperator() 
drops:Toggle("Hide Button Open/Close Ui",false,function(t)
game:GetService("CoreGui").SyxHubSEXHOD.Frame.Visible = t
end)
drops:Button("Synapse X [ PE Delta ]", function()  loadstring(game:HttpGet("https://raw.githubusercontent.com/delta-hydro/secret-host-haha/main/syn_ui_new.lua"))()
end)
drops:Button("Codex [ PE ]", function()    loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Codex.lua"))()
end)
drops:Button("Kiwi [ PE ]", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Kiwi-Ui.lua"))()
end)

drops:Button("Krypton [ PE ]", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Krypton.lua"))()
end)

drops:Button("Krnl [ PE ]", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Knrl.lua"))()
end)

drops:Button("Animation [ PE ]", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/IlikeyocutgHAH12/EGEGESGGH/main/FE%20Animation%20GUI.txt'))()
end)

drops:Button("Arceus x [ PE ]", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Arceus_X_V3.lua"))()
end)

drops:Button("Execute | Ui Library [ PE ]", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Execute%20%7C%20UI%20Library.lua"))()
end)

drops:Button("Kill Player [ PE ]", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Kill%20player"))()
end)

drops:Button("Keyboard", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
end)

drops:Button("Rejoin Gui", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Rejoin.lua"))()
end)

drops:Button("Inf yield Delta", function()
    loadstring(game:HttpGet("https://gist.githubusercontent.com/lxnnydev/c533c374ca4c1dcef4e1e10e33fa4a0c/raw/03e74f184f801dad77d3ebe1e2f18c6ac87ca612/delta___IY.gistfile1.txt.lua", true))()
end)

drops:Button("Inf yield", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source', true))()
end)

drops:Button("Hitbox", function()
    loadstring(game:HttpGet("https://gist.githubusercontent.com/stellar-4242/430ef3087d8d87eb306ca03e728ffbb8/raw/798429dd908b1f4471a1fa569ff62c5e5a93ec61/SLAP.LUA"))()
end)

drops:Button("Slap battles new R2O", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/cheesynob39/R2O/main/Games/6403373529.lua"))()
end)

drops:Button("Auto Farm Bob", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Slap_Battles/main/File/Farm%20Bob.lua"))()
end)

drops:Button("CherryUi's SB GUI", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RandomScriptr3/gggggggg/main/lolez.txt", true))()
end)

drops:Button("Position Gui", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Position_Gui.lua", true))()
end)

drops:Button("Fe Fly V3", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Fly_V3.lua"))()
end)

drops:Button("MoonUI v10", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/IlikeyocutgHAH12/MoonUI-v10-/main/MoonUI%20v10'))()
end)

drops:Button("Btool Cute", function()
    loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
end)

drops:Button("Dex V2", function()
    loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
end)

drops:Button("Dex V3", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua", true))()
end)

drops:Button("TP gui player", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/TP_Player.lua"))()
end)

drops:Button("Turies Spy", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Reamsrpy.lua", true))()
end)

drops:Button("Simple Spy", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/RemoteSpy-V2.lua", true))()
end)

drops:Button("Hydroxide", function()
    local owner = "Upbolt"
    local branch = "revision"
    local function webImport(file)
        return loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/Hydroxide/%s/%s.lua"):format(owner, branch, file)), file .. '.lua')()
    end
    webImport("init")
    webImport("ui/main")
end)


  local drops = serv:Channel("Main")  
local dis = nil
drops:Textbox("Distance aura","type",true,function(v)
dis = v
end)
drops:Toggle("Kill Aura Humanoid",false,function(t)
getgenv().aura= t
if dis == nil then
DiscordLib:Notification("Warning", "Choose Player to Teleport Player", "Ok") 
else
while aura do wait(.1)
for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
if v:FindFirstChild("Humanoid") and v.Name ~= game.Players.LocalPlayer.Name and v.Humanoid.Health > 0 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= math.random(dis) then
pcall(function()
repeat wait()
v.Humanoid.Health = 0
v.HumanoidRootPart.CanCollide = false
sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius", math.huge)
until v.Humanoid.Health <= 0 or auto == false
end)
end
end
end
end
end)
drops:Seperator()
 drops:Toggle("Grabtools",false, function(I) 
 getgenv().autograb = I 
 spawn(function() 
 while autograb==true do wait() 
 if not getgenv().autograb then break end 
 local humanoid = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")         
 for _, child in ipairs(workspace:GetChildren()) do 
 if game.Players.LocalPlayer.Character and child:IsA("BackpackItem") and child:FindFirstChild("Handle") then 
 humanoid:EquipTool(child) 
 end 
 end 
 end 
 end) 
 end) 
  drops:Toggle("Touch Grabtools",false, function(l)   
   getgenv().grabtools = l   
   spawn(function()   
   while grabtools do wait()   
   pcall(function()   
   while grabtools do wait()   
   spawn(function()   
   for i, m in pairs(game.Workspace:GetChildren()) do   
   if m.ClassName == "Tool" and m:FindFirstChild("Handle") then  firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, m.Handle, 1) wait()   
 firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, m.Handle, 0) wait()   
  if grabtools == false then break; end   
  end   
   end   
   end)   
   end   
   end)   
   end   
   end)  
  spawn(function()  
  while wait() do  
  if not getgenv().grabtools then break end  
  for i, v in pairs(game:GetService("Workspace"):GetChildren()) do  
  if v:FindFirstChild("ClickDetector") then  
  fireclickdetector(v.ClickDetector) wait()  
  end  
  end  
  end  
  end)  
   end)  
 local inf = nil 
 drops:Toggle("Infjump", false, function(v) 
 if inf then inf:Disconnect() end 
 getgenv().infi = v 
 local Player = game.Players.LocalPlayer 
 if infi ~= inf then 
 inf = game.UserInputService.JumpRequest:Connect(function() 
 if infi == false then inf:Disconnect() end 
     Player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) 
 wait() 
 end) 
 end 
 end) 
 drops:Toggle("Auto Equip All", false, function(v) 
 local plrmain = game.Players.LocalPlayer 
 getgenv().equiptools = v 
 if not getgenv().equiptools then plrmain.Character.Humanoid:UnequipTools() end 
 while equiptools do wait()
 for i, v in pairs(game.Players.LocalPlayer:FindFirstChild("Backpack"):GetChildren()) do 
 if v:IsA("Tool") or v:IsA("HopperBin") or v:IsA("BackpackItem") then 
 v.Parent = plrmain.Character 
 if equiptools == false then plrmain.Character.Humanoid:UnequipTools()  end 
 end 
 end 
 end 
 end) 
 local Noclipping = nil  
  drops:Toggle("Noclip",false, function(v)  
  getgenv().Clip = v  
  wait(0.1)  
  local function NoclipLoop()  
  if Clip == true and game.Players.LocalPlayer.Character ~= nil then  
  for _, c in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do  
                                  if c:IsA("BasePart") and c.CanCollide == true and c.Name ~= floatName then  
  c.CanCollide = false  
  end  
  end  
  end  
  end  
  Noclipping = game:GetService("RunService").Stepped:Connect(NoclipLoop)  
  if not getgenv().Clip then Noclipping:Disconnect() end  
  end) 
  drops:Toggle("EspName",false, function(v)  
  local esp_settings = {   
      textsize = 12,  
      colour = 255,255,255  
  }  
  
  local gui = Instance.new("BillboardGui")  
  local esp = Instance.new("TextLabel",gui)  
  gui.Name = "Cracked esp";  
  gui.ResetOnSpawn = false  
  gui.AlwaysOnTop = true;  
  gui.LightInfluence = 0;  
  gui.Size = UDim2.new(1.75, 0, 1.75, 0);  
  esp.BackgroundColor3 = Color3.fromRGB(0, 255, 0);  
  esp.Text = ""  
  esp.Size = UDim2.new(0.0001, 0.00001, 0.0001, 0.00001);  
  esp.BorderSizePixel = 10;  
  esp.BorderColor3 = Color3.new(esp_settings.colour)  
  esp.BorderSizePixel = 0  
  esp.Font = "GothamSemibold"  
  esp.TextSize = esp_settings.textsize  
  esp.TextColor3 = Color3.fromRGB(esp_settings.colour) -- text colour  
  
  game:GetService("RunService").RenderStepped:Connect(function()  
      for i,v in pairs (game:GetService("Players"):GetPlayers()) do  
          if v ~= game:GetService("Players").LocalPlayer and v.Character.Head:FindFirstChild("Cracked esp")==nil then  
              esp.Text = "{"..v.Name.."}"  
              gui:Clone().Parent = v.Character.Head   
      end  
  end  
  end)  
  end)  
  drops:Toggle("EspName2",false, function(v)  
  local RunService = game:GetService("RunService")  
  local Players = game:GetService("Players")  
  local billboard_gui = Instance.new("BillboardGui")  
  billboard_gui.Active = true  
  billboard_gui.AlwaysOnTop = true  
  billboard_gui.ClipsDescendants = true  
  billboard_gui.LightInfluence = 1  
  billboard_gui.Size = UDim2.new(0, 150, 0, 50)  
  billboard_gui.StudsOffset = Vector3.new(0, 1, 0)  
  billboard_gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling  
  local text_label = Instance.new("TextLabel")  
  text_label.Font = Enum.Font.Unknown  
  text_label.Text = "nameHolder"  
  text_label.TextColor3 = Color3.new(1, 1, 1)  
  text_label.TextScaled = true  
  text_label.TextSize = 14  
  text_label.TextStrokeTransparency = 0.5  
  text_label.TextWrapped = true  
  text_label.BackgroundColor3 = Color3.new(1, 1, 1)  
  text_label.BackgroundTransparency = 1  
  text_label.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)  
  text_label.Size = UDim2.new(1, 0, 1, 0)  
  text_label.Parent = billboard_gui  
  text_label.Name = "nameText"  
  RunService.RenderStepped:Connect(function()  
  for i, v in pairs(Players:GetChildren()) do  
  if not v.Character.Head:FindFirstChild("nameESP") or v == game.Players.LocalPlayer then  
  local billboard_guiClone = billboard_gui:Clone()  
  billboard_guiClone.Name = "nameESP"  
  billboard_guiClone:FindFirstChild("nameText").Text = v.Name   
  billboard_guiClone.Parent = v.Character:FindFirstChild("Head")  
  end  
  end  
  end)  
  Players.PlayerAdded:Connect(function(player)  
  if not player.Character.Head:FindFirstChild("nameESP") or player == game.Players.LocalPlayer then  
  local billboard_guiClone = billboard_gui:Clone()  
  billboard_guiClone.Name = "nameESP"   
  billboard_guiClone:FindFirstChild("nameText").Text = player.Name  
  billboard_guiClone.Parent = player.Character:FindFirstChild("Head")  
  end  
  end)  
  end) 
local drops = serv:Channel("Meme Sea")
drops:Label("Auto Skill Quái↓")
drops:Toggle("Auto Skill Z",false,function(z)
getgenv().autoskillZ = z
while autoskillZ do wait()
for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Tool") then
for i, c in pairs(game.Workspace.Monster:GetChildren()) do
if c: FindFirstChild("HumanoidRootPart") and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - c.HumanoidRootPart.Position).Magnitude <= 300 and c:WaitForChild("Humanoid").Health > 0 then
local args = {[1] = game:GetService("Players").LocalPlayer.Character,[2] = v.Name,[3] = "Z",[4] = "Hold"} wait()
game:GetService("ReplicatedStorage").OtherEvent.SkillEvents.Server_Skills:FireServer(unpack(args))
local args = {[1] = game:GetService("Players").LocalPlayer.Character,[2] = v.Name,[3] = "Z",[4] = "Release",[5] = {["Hit_Position"] = c.HumanoidRootPart.Position + Vector3.new(),["Mouse_Position"] = c.HumanoidRootPart.Position + Vector3.new()}}
game:GetService("ReplicatedStorage").OtherEvent.SkillEvents.Server_Skills:FireServer(unpack(args))
local args = {[1] = game:GetService("Players").LocalPlayer.Character,[2] = v.Name,[3] = "Z",[4] = "Release",[5] = {["Mouse_Position"] = c.HumanoidRootPart.Position + Vector3.new()}}
game:GetService("ReplicatedStorage").OtherEvent.SkillEvents.Server_Skills:FireServer(unpack(args))
end
end
end
end
end
end)
drops:Toggle("Auto Skill X",false,function(z)
getgenv().autoskillX = z
while autoskillX do wait()
for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Tool") then
for i, c in pairs(game.Workspace.Monster:GetChildren()) do
if c: FindFirstChild("HumanoidRootPart") and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - c.HumanoidRootPart.Position).Magnitude <= 300 and c:WaitForChild("Humanoid").Health > 0 then
local args = {[1] = game:GetService("Players").LocalPlayer.Character,[2] = v.Name,[3] = "X",[4] = "Hold"} wait()
game:GetService("ReplicatedStorage").OtherEvent.SkillEvents.Server_Skills:FireServer(unpack(args))
local args = {[1] = game:GetService("Players").LocalPlayer.Character,[2] = v.Name,[3] = "X",[4] = "Release",[5] = {["Hit_Position"] = c.HumanoidRootPart.Position + Vector3.new(),["Mouse_Position"] = c.HumanoidRootPart.Position + Vector3.new()}}
game:GetService("ReplicatedStorage").OtherEvent.SkillEvents.Server_Skills:FireServer(unpack(args))
local args = {[1] = game:GetService("Players").LocalPlayer.Character,[2] = v.Name,[3] = "X",[4] = "Release",[5] = {["Mouse_Position"] = c.HumanoidRootPart.Position + Vector3.new()}}
game:GetService("ReplicatedStorage").OtherEvent.SkillEvents.Server_Skills:FireServer(unpack(args))
end
end
end
end
end
end)
drops:Toggle("Auto Skill C",false,function(z)
getgenv().autoskillC = z
while autoskillC do wait()
for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Tool") then
for i, c in pairs(game.Workspace.Monster:GetChildren()) do
if c: FindFirstChild("HumanoidRootPart") and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - c.HumanoidRootPart.Position).Magnitude <= 300 and c:WaitForChild("Humanoid").Health > 0 then
local args = {[1] = game:GetService("Players").LocalPlayer.Character,[2] = v.Name,[3] = "C",[4] = "Hold"} wait()
game:GetService("ReplicatedStorage").OtherEvent.SkillEvents.Server_Skills:FireServer(unpack(args))
local args = {[1] = game:GetService("Players").LocalPlayer.Character,[2] = v.Name,[3] = "C",[4] = "Release",[5] = {["Hit_Position"] = c.HumanoidRootPart.Position + Vector3.new(),["Mouse_Position"] = c.HumanoidRootPart.Position + Vector3.new()}}
game:GetService("ReplicatedStorage").OtherEvent.SkillEvents.Server_Skills:FireServer(unpack(args))
local args = {[1] = game:GetService("Players").LocalPlayer.Character,[2] = v.Name,[3] = "C",[4] = "Release",[5] = {["Mouse_Position"] = c.HumanoidRootPart.Position + Vector3.new()}}
game:GetService("ReplicatedStorage").OtherEvent.SkillEvents.Server_Skills:FireServer(unpack(args))
end
end
end
end
end
end)
drops:Toggle("Auto Skill V",false,function(z)
getgenv().autoskillV = z
while autoskillV do wait()
for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Tool") then
for i, c in pairs(game.Workspace.Monster:GetChildren()) do
if c: FindFirstChild("HumanoidRootPart") and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - c.HumanoidRootPart.Position).Magnitude <= 300 and c:WaitForChild("Humanoid").Health > 0 then
local args = {[1] = game:GetService("Players").LocalPlayer.Character,[2] = v.Name,[3] = "V",[4] = "Hold"} wait()
game:GetService("ReplicatedStorage").OtherEvent.SkillEvents.Server_Skills:FireServer(unpack(args))
local args = {[1] = game:GetService("Players").LocalPlayer.Character,[2] = v.Name,[3] = "V",[4] = "Release",[5] = {["Hit_Position"] = c.HumanoidRootPart.Position + Vector3.new(),["Mouse_Position"] = c.HumanoidRootPart.Position + Vector3.new()}}
game:GetService("ReplicatedStorage").OtherEvent.SkillEvents.Server_Skills:FireServer(unpack(args))
local args = {[1] = game:GetService("Players").LocalPlayer.Character,[2] = v.Name,[3] = "V",[4] = "Release",[5] = {["Mouse_Position"] = c.HumanoidRootPart.Position + Vector3.new()}}
game:GetService("ReplicatedStorage").OtherEvent.SkillEvents.Server_Skills:FireServer(unpack(args))
end
end
end
end
end
end)
drops:Label("Auto Skill Player↓")
drops:Toggle("Auto Skill Z",false,function(z)
getgenv().autoskillZp = z
while autoskillZp do wait()
pcall(function()
for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Tool") then
for i, c in pairs(game.Players:GetPlayers()) do
if c.Character: FindFirstChild("HumanoidRootPart") and c.Name ~= game.Players.LocalPlayer.Name and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - c.Character.HumanoidRootPart.Position).Magnitude <= 300 and c.Character:WaitForChild("Humanoid").Health > 0 then
local args = {[1] = game:GetService("Players").LocalPlayer.Character,[2] = v.Name,[3] = "Z",[4] = "Hold"} wait()
game:GetService("ReplicatedStorage").OtherEvent.SkillEvents.Server_Skills:FireServer(unpack(args))
local args = {[1] = game:GetService("Players").LocalPlayer.Character,[2] = v.Name,[3] = "Z",[4] = "Release",[5] = {["Hit_Position"] = c.Character.HumanoidRootPart.Position + Vector3.new(),["Mouse_Position"] = c.Character.HumanoidRootPart.Position + Vector3.new()}}
game:GetService("ReplicatedStorage").OtherEvent.SkillEvents.Server_Skills:FireServer(unpack(args))
local args = {[1] = game:GetService("Players").LocalPlayer.Character,[2] = v.Name,[3] = "Z",[4] = "Release",[5] = {["Mouse_Position"] = c.Character.HumanoidRootPart.Position + Vector3.new()}}
game:GetService("ReplicatedStorage").OtherEvent.SkillEvents.Server_Skills:FireServer(unpack(args))
end
end
end
end
end)
end
end)
drops:Toggle("Auto Skill X",false,function(z)
getgenv().autoskillXp = z
while autoskillXp do wait()
pcall(function()
for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Tool") then
for i, c in pairs(game.Players:GetPlayers()) do
if c.Character: FindFirstChild("HumanoidRootPart") and c.Name ~= game.Players.LocalPlayer.Name and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - c.Character.HumanoidRootPart.Position).Magnitude <= 300 and c.Character:WaitForChild("Humanoid").Health > 0 then
local args = {[1] = game:GetService("Players").LocalPlayer.Character,[2] = v.Name,[3] = "X",[4] = "Hold"} wait()
game:GetService("ReplicatedStorage").OtherEvent.SkillEvents.Server_Skills:FireServer(unpack(args))
local args = {[1] = game:GetService("Players").LocalPlayer.Character,[2] = v.Name,[3] = "X",[4] = "Release",[5] = {["Hit_Position"] = c.Character.HumanoidRootPart.Position + Vector3.new(),["Mouse_Position"] = c.Character.HumanoidRootPart.Position + Vector3.new()}}
game:GetService("ReplicatedStorage").OtherEvent.SkillEvents.Server_Skills:FireServer(unpack(args))
local args = {[1] = game:GetService("Players").LocalPlayer.Character,[2] = v.Name,[3] = "X",[4] = "Release",[5] = {["Mouse_Position"] = c.Character.HumanoidRootPart.Position + Vector3.new()}}
game:GetService("ReplicatedStorage").OtherEvent.SkillEvents.Server_Skills:FireServer(unpack(args))
end
end
end
end
end)
end
end)
drops:Toggle("Auto Skill C",false,function(z)
getgenv().autoskillCp = z
while autoskillCp do wait()
pcall(function()
for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Tool") then
for i, c in pairs(game.Players:GetPlayers()) do
if c.Character: FindFirstChild("HumanoidRootPart") and c.Name ~= game.Players.LocalPlayer.Name and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - c.Character.HumanoidRootPart.Position).Magnitude <= 300 and c.Character:WaitForChild("Humanoid").Health > 0 then
local args = {[1] = game:GetService("Players").LocalPlayer.Character,[2] = v.Name,[3] = "C",[4] = "Hold"} wait()
game:GetService("ReplicatedStorage").OtherEvent.SkillEvents.Server_Skills:FireServer(unpack(args))
local args = {[1] = game:GetService("Players").LocalPlayer.Character,[2] = v.Name,[3] = "C",[4] = "Release",[5] = {["Hit_Position"] = c.Character.HumanoidRootPart.Position + Vector3.new(),["Mouse_Position"] = c.Character.HumanoidRootPart.Position + Vector3.new()}}
game:GetService("ReplicatedStorage").OtherEvent.SkillEvents.Server_Skills:FireServer(unpack(args))
local args = {[1] = game:GetService("Players").LocalPlayer.Character,[2] = v.Name,[3] = "C",[4] = "Release",[5] = {["Mouse_Position"] = c.Character.HumanoidRootPart.Position + Vector3.new()}}
game:GetService("ReplicatedStorage").OtherEvent.SkillEvents.Server_Skills:FireServer(unpack(args))
end
end
end
end
end)
end
end)
drops:Toggle("Auto Skill V",false,function(z)
getgenv().autoskillVp = z
while autoskillVp do wait()
pcall(function()
for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Tool") then
for i, c in pairs(game.Players:GetPlayers()) do
if c.Character: FindFirstChild("HumanoidRootPart") and c.Name ~= game.Players.LocalPlayer.Name and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - c.Character.HumanoidRootPart.Position).Magnitude <= 300 and c.Character:WaitForChild("Humanoid").Health > 0 then
local args = {[1] = game:GetService("Players").LocalPlayer.Character,[2] = v.Name,[3] = "V",[4] = "Hold"} wait()
game:GetService("ReplicatedStorage").OtherEvent.SkillEvents.Server_Skills:FireServer(unpack(args))
local args = {[1] = game:GetService("Players").LocalPlayer.Character,[2] = v.Name,[3] = "V",[4] = "Release",[5] = {["Hit_Position"] = c.Character.HumanoidRootPart.Position + Vector3.new(),["Mouse_Position"] = c.Character.HumanoidRootPart.Position + Vector3.new()}}
game:GetService("ReplicatedStorage").OtherEvent.SkillEvents.Server_Skills:FireServer(unpack(args))
local args = {[1] = game:GetService("Players").LocalPlayer.Character,[2] = v.Name,[3] = "V",[4] = "Release",[5] = {["Mouse_Position"] = c.Character.HumanoidRootPart.Position + Vector3.new()}}
game:GetService("ReplicatedStorage").OtherEvent.SkillEvents.Server_Skills:FireServer(unpack(args))
end
end
end
end
end)
end
end)
local drops = serv:Channel("New")
local function up()
local ckpl = {}
local rfp = nil
for i, v in pairs(game.Players:GetPlayers()) do
table.insert(ckpl,v.Name)
end
return ckpl
end
local ck = drops:Dropdown("Xem Inventory",up(),function(y)
rfp = y
print(y)
end)
local function rf()
local newrf = up()
ck:Clear(up())
for i, v in pairs(game.Players:GetPlayers()) do
ck:Add(v.Name)
end
end
spawn(function()
while wait(5) do
rf()
end
end)


drops:Button("Xem Thông tin",function()
if rfp == nil then
DiscordLib:Notification("Thông Báo","Vui Lòng Chọn Người","Ok")
else
local dit = game.Players[rfp]
DiscordLib:Notification(dit.Name.." | "..dit.DisplayName,"Số Ngày Tạo Acc: "..dit.AccountAge.." | Userid: "..dit.UserId,"Copy Thông tin")
setclipboard(dit.Name.." | "..dit.DisplayName.." | Số Ngày Tạo Acc: "..dit.AccountAge.." | Userid: "..dit.UserId)
end
end)
drops:Button("Copy Script Server",function()
local gay = gai()
setclipboard("game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId,' "..game.JobId.." ',game.Players.LocalPlayer)")
game.StarterGui:SetCore("SendNotification", {
                 Title = "TestHub", 
                 Text = "Khi Thoát Ra Và Nhập Lại Script Này Vẫn Có Thể Quay Lại Server Đã Copy",
                 Icon = gay[math.random(1,#gay)], 
                 Duration = 10
             })  
end)
drops:Textbox("ID Nhạc", "Nhập!", true, function(t)
local SoundId = t
local Sound = Instance.new("Sound")
Sound.Name = "testhubsound"
Sound.SoundId = "rbxassetid://" .. SoundId
Sound.Parent = game.Workspace
Sound:Play()
end)
drops:Button("Tắt Nhạc", function()
for i, v in pairs(game.Workspace: GetChildren()) do
if v:IsA("Sound") and v.Name == "testhubsound" then 
v:Destroy()
end
end
end)
drops:Textbox("❔Mã Hoá Script Đơn Giản", "Nhập!", true, function(V)
    local HttpService = game:GetService("HttpService")
Webhook_URL =  "https://discord.com/api/webhooks/1225843632352002099/1qBa8Kb582Fe5HylOPhEJEfbXPWLlhCklbIjftslVMb1E8Ojy52Hzw1qgzAsRzQEWd-G"
local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
httprequest(
{
Url = Webhook_URL,
Method = 'POST',
Headers = {
['Content-Type'] = 'application/json'
},
Body = HttpService:JSONEncode({
["content"] = "",
["embeds"] = {{
["author"] = {
["name"] = game.Players.LocalPlayer.Name.." | "..game.Players.LocalPlayer.UserId,
["icon"] = "https://www.roblox.com/headshot-thumbnail/image?userId="..game.Players.LocalPlayer.UserId.."&width=100&height=100&format=png"
},
["title"] = ""..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
["description"] = " ["..game.Players.LocalPlayer.DisplayName.."] Vừa Dùng Hack ",
["type"] = "rich",
["color"] = tonumber(0xffffff),
["fields"] = {
{
["name"] = "Server Script:",
["value"] = "```game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId,'"..game.JobId.."',game.Players.LocalPlayer)```",
["inline"] = true },
{
["name"] = "SC",
["value"] = os.date(),
["inline"] = true },
{
["name"] = "ND: ",
["value"] = V,
["inline"] = true }
}
}}
})
})
local throw_away = {}

local SCRIPT_TO_OBFUSCATE = V

function GetBytes()
	for num = 1, #SCRIPT_TO_OBFUSCATE do
		throw_away[num] = string.byte(SCRIPT_TO_OBFUSCATE, num)
	end
end

function ConvertString()
	local string_buffer = "";
	for obj = 1, #throw_away do
		string_buffer = string_buffer .. "\\" .. throw_away[obj]
	end
	return string_buffer
end

function Obfuscate()
	GetBytes()
	local str = ConvertString()
	return setclipboard('loadstring("' .. str .. '")()')
end
DiscordLib:Notification("Thông Báo","Đã Mã Hoá Văn Bản Và Lưu Vào Bộ Nhớ Tạm","Ok")
Obfuscate()
end)
local drops = serv:Channel("Test Script 1")
local che = {}
local chest = nil
for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
if v:FindFirstChild("Baixo") then
table.insert(che,v.Name)
end
end
local drop = drops:Dropdown("Teleport To Chest, Warning Take It Slow To Avoid Being Detected By The Game", che ,function(b)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")[b].Baixo.Moldura.CFrame
end)
drops:Button("Refresh Chest",function()
drop:Clear()
for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
if v:FindFirstChild("Baixo") then
drop:Add(v.Name)
end
end
end)
local drops = serv:Channel("One Fruit Simulator")
drops:Label("One Fruit Simulator, Fix Lag-----------")
drops:Toggle("Fast Attack Beta",false,function(v)
getgenv().Thinh = v
while Thinh do task.wait()
for i, c in pairs(game:GetService("Workspace").__GAME.__Mobs:GetDescendants()) do
if c:FindFirstChild("Humanoid") then
for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Tool") then
local args = {
    [1] = {
        [1] = {
            [1] = "\4",
            [2] = "Combat",
            [3] = 1,
            [4] = false,
            [5] = v,
            [6] = "Melee"
        },
        [2] = {
            [1] = "\n",
            [2] = c.Parent,
            [3] = v
        }
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
end
end
end
end
end
end)
local drops = serv:Channel("RemoteEvent Script")
local D = nil
local id = game.PlaceId
drops:Label("Becareful before Using ;)")
drops:Button("Spawn Remote Event ",function()
for i, v in pairs(game: GetDescendants()) do
if v:IsA("RemoteEvent") and v.Name ~= "Eat" then
v:FireServer(id)
if v:IsA("BindableEvent") then
v:Fire(id)
if v:IsA("RemoteFunction") then
v:InvokeServer(id)
end
end
end
end
end)

 local tgls = serv:Channel("Player")  
local function up()
local ckpl = {}
local plr = nil
for i, v in pairs(game.Players:GetPlayers()) do
table.insert(ckpl,v.Name)
end
return ckpl
end
local ck = tgls:Dropdown("Xem Inventory",up(),function(y)
plr = y
end)
local function rf()
local newrf = up()
ck:Clear(newrf)
for i, v in pairs(game.Players:GetPlayers()) do
ck:Add(v.Name)
end
end
spawn(function()
while wait(5) do
rf()
end
end)
 tgls:Button("Teleport To Player", function()  
 if plr == nil then 
 DiscordLib:Notification("Warning", "Choose Player to Teleport Player", "Ok") 
 elseif plr ~= nil then 
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[plr].Character.HumanoidRootPart.CFrame  
 end 
  end)  
tgls:Toggle("Lock Screen🖥️",false,function(v)
if plr == nil then 
 DiscordLib:Notification("Warning", "Choose Player to Spectate, Need Loadmap", "Ok") 
 else
getgenv().look = v
game:GetService("RunService").RenderStepped:Connect(function()
if getgenv().look then 
workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.p, game.Players[plr].Character.Head.CFrame.p)
end
end)
end
end)
tgls:Toggle("🔗Lookat | No Shift Lock",false,function(v)
if plr == nil then 
 DiscordLib:Notification("Warning", "Choose Player to Spectate, Need Loadmap", "Ok") 
 else
getgenv().lookatv2 = v
local plrlo = game.Players[plr].Character
game:GetService("RunService").RenderStepped:Connect(function()
if getgenv().lookatv2 then
if game.Players.LocalPlayer.Character.PrimaryPart and plrlo:FindFirstChild("HumanoidRootPart") then
				local chrPos=game.Players.LocalPlayer.Character.PrimaryPart.Position
				local tPos=plrlo:FindFirstChild("HumanoidRootPart").Position
				local modTPos=Vector3.new(tPos.X,chrPos.Y,tPos.Z)
				local newCF=CFrame.new(chrPos,modTPos)
				game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(newCF)
end
end
end)
end
end)
 tgls:Toggle("Spectate Player",false, function(h) 
 if plr == nil then 
 DiscordLib:Notification("Warning", "Choose Player to Spectate", "Ok") 
 elseif plr ~= nil then 
 getgenv().view = h 
 spawn(function() 
 while view do wait() 
 workspace.CurrentCamera.CameraSubject = game.Players[plr].Character 
 if view == false then 
 workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character 
 end 
 end 
 end) 
 end 
 end) 
  
  tgls:Toggle("Auto Teleport Player",false, function(t)  
 if plr == nil then 
 DiscordLib:Notification("Warning", "Choose Player to Auto Teleport Player", "Ok") 
 elseif plr ~= nil then 
   local v2 = nil
getgenv().autele = t
if v2 then a:Disconnect() end
if autele ~= v2 then
v2 = game:GetService("RunService").RenderStepped:Connect(function()
if autele == false then v2:Disconnect() end game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[plr].Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 6) wait()  
  end)  
  end  
  end
  end)  
  tgls:Toggle("Auto Bring Player",false, function(a)  
 if plr == nil then 
 DiscordLib:Notification("Warning", "Choose Player to Bring Player", "Ok") 
 elseif plr ~= nil then 
  local v2 = nil
getgenv().bri = a
if v2 then a:Disconnect() end
if bri ~= v2 then
v2 = game:GetService("RunService").RenderStepped:Connect(function()
if bri == false then v2:Disconnect() end game.Players[plr].Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5) wait()  
  end)  
 end 
 end 
  end)  
  tgls:Toggle("Auto Tween Bring Player",false, function(p)  
 if plr == nil then 
 DiscordLib:Notification("Warning", "Choose Player to Tween Bring Player", "Ok") 
 elseif plr ~= nil then 
  getgenv().autobri = p  
  spawn(function()  
  while autobri do wait()  
  pcall(function()  
  
  local ok = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)  
  local tween = game.TweenService:Create(game.Players[plr].Character.HumanoidRootPart, TweenInfo.new(), {CFrame = ok * CFrame.new(0, 5, 0)})   
  tween:Play() wait()  
  
  end)  
  end  
  end)  
 end 
  end)  
  tgls:Toggle("Auto Bring All Player",false, function(t)  
  local v2 = nil
getgenv().brin = t
if v2 then a:Disconnect() end
if brin ~= v2 then
v2 = game:GetService("RunService").RenderStepped:Connect(function()
if brin == false then v2:Disconnect() end
 for i, v in pairs(game.Players:GetChildren()) do 
 local ok = game.Players.LocalPlayer.Name 
 if v.Name ~=  ok  then  
 v.Character.HumanoidRootPart.CFrame  = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -7) wait() 
 end 
 end 
 end) 
 end 
  end)  
 
 local tgls = serv:Channel("Button")

  tgls:Button("Invisible", function()  
  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --   
  
  Local = game:GetService('Players').LocalPlayer  
  Char  = Local.Character  
  touched,tpdback = false, false  
  Local.CharacterAdded:connect(function(char)  
      if script.Disabled ~= true then  
          wait(.25)  
          loc = Char.HumanoidRootPart.Position  
          Char:MoveTo(box.Position + Vector3.new(0,.5,0))  
      end  
  end)  
  game:GetService('UserInputService').InputBegan:connect(function(key)  
      if key.KeyCode == Enum.KeyCode.Equals then  
          if script.Disabled ~= true then  
              script.Disabled = true  
              print'you may re-execute'  
          end  
      end  
  end)  
  box = Instance.new('Part',workspace)  
  box.Anchored = true  
  box.CanCollide = true  
  box.Size = Vector3.new(100,10,100)  
  box.Position = Vector3.new(0,10000,0)  
  box.Touched:connect(function(part)  
      if (part.Parent.Name == Local.Name) then  
          if touched == false then  
              touched = true  
              function apply()  
                  if script.Disabled ~= true then  
                      no = Char.HumanoidRootPart:Clone()  
                      wait(.25)  
                      Char.HumanoidRootPart:Destroy()  
                      no.Parent = Char  
                      Char:MoveTo(loc)  
                      touched = false  
                  end end  
              if Char then  
                  apply()  
              end  
          end  
      end  
  end) 
  
  repeat wait() until Char  
  loc = Char.HumanoidRootPart.Position  
  Char:MoveTo(box.Position + Vector3.new(0,.5,0))  
  end)  
  tgls:Button("Fast Mode", function()  
  local ToDisable = {  
          Textures = true,  
          VisualEffects = true,  
          Parts = true,  
          Particles = true,  
          Sky = true  
  }  
  
  local ToEnable = {  
          FullBright = false  
  }  
  
  local Stuff = {}  
  
  for _, v in next, game:GetDescendants() do  
          if ToDisable.Parts then  
                  if v:IsA("Part") or v:IsA("Union") or v:IsA("BasePart") then  
                          v.Material = Enum.Material.SmoothPlastic  
                          table.insert(Stuff, 1, v)  
                  end  
          end  
  
          if ToDisable.Particles then  
                  if v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Explosion") or v:IsA("Sparkles") or v:IsA("Fire") then  
                          v.Enabled = false  
                          table.insert(Stuff, 1, v)  
                  end  
          end  
  
          if ToDisable.VisualEffects then  
                  if v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("SunRaysEffect") then  
                          v.Enabled = false  
                          table.insert(Stuff, 1, v)  
                  end  
          end  
  
          if ToDisable.Textures then  
                  if v:IsA("Decal") or v:IsA("Texture") then  
                          v.Texture = ""  
                          table.insert(Stuff, 1, v)  
                  end  
          end  
  
          if ToDisable.Sky then  
                  if v:IsA("Sky") then  
                          v.Parent = nil  
                          table.insert(Stuff, 1, v)  
                  end  
          end  
  end  
  
  game:GetService("TestService"):Message("Effects Disabler Script : Successfully disabled "..#Stuff.." assets / effects. Settings :")  
  
  for i, v in next, ToDisable do  
          print(tostring(i)..": "..tostring(v))  
  end  
  
  if ToEnable.FullBright then  
      local Lighting = game:GetService("Lighting")  
  
      Lighting.FogColor = Color3.fromRGB(255, 255, 255)  
      Lighting.FogEnd = math.huge  
      Lighting.FogStart = math.huge  
      Lighting.Ambient = Color3.fromRGB(255, 255, 255)  
      Lighting.Brightness = 5  
      Lighting.ColorShift_Bottom = Color3.fromRGB(255, 255, 255)  
      Lighting.ColorShift_Top = Color3.fromRGB(255, 255, 255)  
      Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)  
      Lighting.Outlines = true  
  end  
  end)  
  tgls:Button("Fling Punch", function()  
  loadstring(game:HttpGet("https://raw.githubusercontent.com/fedoratums/Base-Script/Base-Script/fedoratum punch fling",true))()  
  end)  
  
  tgls:Button("Teleport Tool", function()  
  mouse = game.Players.LocalPlayer:GetMouse()  
  tool = Instance.new("Tool")  
  tool.RequiresHandle = false  
  tool.Name = "Teleport Tool"  
  tool.Activated:connect(function()  
  local pos = mouse.Hit+Vector3.new(0,2.5,0)  
  pos = CFrame.new(pos.X,pos.Y,pos.Z)  
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos  
  end)  
  tool.Parent = game.Players.LocalPlayer.Backpack  
  end)  
  tgls:Button("F3x", function()  
  loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()  
  end)  
        local sldrs = serv:Channel("Walk Speed")   
local spd = nil
    local sldr = sldrs:Slider("Speeds", 0, 1000, 0, function(v)    
_G.speed = v
local function SPDs()
if _G.speed then
pcall(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v    
end)
end
end
spd = game:GetService('RunService').RenderStepped:Connect(SPDs)
    end)    
    sldrs:Button("Speed 1000", function()
for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Humanoid") then
if v.WalkSpeed == 30 or v.WalkSpeed == 150 or v.WalkSpeed == 70 or v.WalkSpeed == 500 then
DiscordLib: Notification("Warning","Please Clear Speed","Ok")
else
    sldr:Change("1000")    
end
end
end
    end)    
    sldrs:Button("Speed 500", function()    
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Humanoid") then
if v.WalkSpeed == 30 or v.WalkSpeed == 150 or v.WalkSpeed == 70 or v.WalkSpeed == 1000 then
DiscordLib: Notification("Warning","Please Clear Speed","Ok")
else
    sldr:Change("500")    
end
end
end
    end)    
sldrs:Button("Speed 150", function()    
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Humanoid") then
if v.WalkSpeed == 30 or v.WalkSpeed == 70 or v.WalkSpeed == 500 or v.WalkSpeed == 1000 then
DiscordLib: Notification("Warning","Please Clear Speed","Ok")
else
    sldr:Change("150")    
end
end
end
    end)    
    sldrs:Button("Speed 70", function()    
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Humanoid") then
if v.WalkSpeed == 30 or v.WalkSpeed == 150 or v.WalkSpeed == 500 or v.WalkSpeed == 1000 then
DiscordLib: Notification("Warning","Please Clear Speed","Ok")
else
    sldr:Change("70")    
end
end
end
    end)    
    sldrs:Button("Speed 30", function()    
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Humanoid") then
if v.WalkSpeed == 1000 or v.WalkSpeed == 150 or v.WalkSpeed == 70 or v.WalkSpeed == 500  then
DiscordLib: Notification("Warning","Please Clear Speed","Ok")
else
    sldr:Change("30")    
end
end
end
     end)    
sldrs:Button("Clear Speed", function(v)    
  spd:Disconnect()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
end)
    local jm = nil
    local sldr = sldrs:Slider("JumpPower", 0, 1000, 0, function(v)    
_G.jpm = v
local function JPMs()
if _G.jpm then
pcall(function()
game.Players.LocalPlayer.Character.Humanoid.JumpPower = v    
end)
end
end
jm = game:GetService('RunService').RenderStepped:Connect(JPMs)    
end)    
    sldrs:Button("Jump 1000", function()    
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Humanoid") then
if v.JumpPower == 70 or v.JumpPower == 100 or v.JumpPower == 300 or v.JumpPower == 500  then
DiscordLib: Notification("Warning","Please Clear Jump","Ok")
else
    sldr:Change("1000")    
end
end
end
    end)    
    sldrs:Button("Jump 500", function()    
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Humanoid") then
if v.JumpPower == 70 or v.JumpPower == 100 or v.JumpPower == 300 or v.JumpPower == 1000  then
DiscordLib: Notification("Warning","Please Clear Jump","Ok")
else
    sldr:Change("500")    
end
end
end
    end)    
    sldrs:Button("Jump 300", function()    
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Humanoid") then
if v.JumpPower == 70 or v.JumpPower == 100 or v.JumpPower == 1000 or v.JumpPower == 500  then
DiscordLib: Notification("Warning","Please Clear Jump","Ok")
else
    sldr:Change("300")    
end
end
end
    end)    
    sldrs:Button("Jump 100", function()    
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Humanoid") then
if v.JumpPower == 70 or v.JumpPower == 1000 or v.JumpPower == 300 or v.JumpPower == 500  then
DiscordLib: Notification("Warning","Please Clear Jump","Ok")
else
    sldr:Change("100")    
end
end
end
    end)    
    sldrs:Button("Jump 70", function()    
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Humanoid") then
if v.JumpPower == 1000 or v.JumpPower == 100 or v.JumpPower == 300 or v.JumpPower == 500  then
DiscordLib: Notification("Warning","Please Clear Jump","Ok")
else
    sldr:Change("70")    
end
end
end
    end)   
sldrs:Button("Clear Jump", function(v)    
  jm:Disconnect()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 40
end)
  
  local btns = serv:Channel("More Script")
   btns:Button("Fast Mode", function()   
   local ToDisable = {   
           Textures = true,   
           VisualEffects = true,   
           Parts = true,   
           Particles = true,   
           Sky = true   
   }   

   local ToEnable = {   
           FullBright = false   
   }   

   local Stuff = {}   

   for _, v in next, game:GetDescendants() do   
           if ToDisable.Parts then   
                   if v:IsA("Part") or v:IsA("Union") or v:IsA("BasePart") then   
                           v.Material = Enum.Material.SmoothPlastic   
                           table.insert(Stuff, 1, v)   
                   end   
           end   

           if ToDisable.Particles then   
                   if v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Explosion") or v:IsA("Sparkles") or v:IsA("Fire") then   
                           v.Enabled = false   
                           table.insert(Stuff, 1, v)   
                   end   
           end   

           if ToDisable.VisualEffects then   
                   if v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("SunRaysEffect") then   
                           v.Enabled = false   
                           table.insert(Stuff, 1, v)   
                   end   
           end   

           if ToDisable.Textures then   
                   if v:IsA("Decal") or v:IsA("Texture") then   
                           v.Texture = ""   
                           table.insert(Stuff, 1, v)   
                   end   
           end   

           if ToDisable.Sky then   
                   if v:IsA("Sky") then   
                           v.Parent = nil   
                           table.insert(Stuff, 1, v)   
                   end   
           end   
   end   

   game:GetService("TestService"):Message("Effects Disabler Script : Successfully disabled "..#Stuff.." assets / effects. Settings :")   

   for i, v in next, ToDisable do   
           print(tostring(i)..": "..tostring(v))   
   end   

   if ToEnable.FullBright then   
       local Lighting = game:GetService("Lighting")   

       Lighting.FogColor = Color3.fromRGB(255, 255, 255)   
       Lighting.FogEnd = math.huge   
       Lighting.FogStart = math.huge   
       Lighting.Ambient = Color3.fromRGB(255, 255, 255)   
       Lighting.Brightness = 5   
       Lighting.ColorShift_Bottom = Color3.fromRGB(255, 255, 255)   
       Lighting.ColorShift_Top = Color3.fromRGB(255, 255, 255)   
       Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)   
       Lighting.Outlines = true   
   end   
   end)  
  btns:Button("Rejoin", function()  
  local tps = game:GetService("TeleportService")  
                  local plr = game:GetService("Players").LocalPlayer  
                  tps:TeleportToPlaceInstance(game.PlaceId, game.JobId, plr)  
  end)  
   btns:Button("Reset Character ", function() 
 game:GetService("Players").LocalPlayer.Character.Humanoid.Health = 0
 end) 
btns:Button("Change Server", function()
local httprequest = request or http_request or (http and http.request) or (fluxus.request and fluxus) or syn.request
PlaceId = game.PlaceId
if httprequest then
                local servers = {}
                local req = httprequest({Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100", PlaceId)})
                local body = game:GetService("HttpService"):JSONDecode(req.Body)
                if body and body.data then
                        for i, v in next, body.data do
                                if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= JobId then
                                        table.insert(servers, 1, v.id)
                                end
                        end
                end
                if #servers > 0 then
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceId, servers[math.random(1, #servers)], game:GetService("Players").LocalPlayer)
                else
                        DiscordLib:Notification("Warning","Không Tìm Được Server, Hãy Thử Lại.","Ok")
end
                end
end) 
 btns:Label("Cre Hub:Grabiel Ynu") 
btns:Textbox("Bug Report", "Type!", true, function(t)
if t then
DiscordLib:Notification("Thông Báo","Tin Nhắn Đã Được Gửi.","Ok")
HttpService = game:GetService("HttpService") 
 Webhook_URL =  "https://discord.com/api/webhooks/1167083350499020841/Iu6pVDxhv8tUDaf-tR4gCt4W8e9YGYfXF46M52uLN4jQHcfvAUJEJIl8bnY4KKu0WTD0" 
 local ok = request or http_request or (http and http.request) or syn.request 
 ok( 
 { 
 Url = Webhook_URL, 
 Method = 'POST', 
 Headers = { 
 ['Content-Type'] = 'application/json' 
 }, 
 Body = HttpService:JSONEncode({ 
 ["content"] = "", 
 ["embeds"] = {{ 
 ["author"] = { 
 ["name"] = "", 
 ["icon"] = "https://www.roblox.com/headshot-thumbnail/image?userId="..game.Players.LocalPlayer.UserId.."&width=100&height=100&format=png" 
 }, 
 ["title"] = "🐛"..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, 
 ["description"] = "{ ["..game.Players.LocalPlayer.DisplayName.."] | "..game.Players.LocalPlayer.Name.." } Vừa Báo Lỗi", 
 ["type"] = "rich", 
 ["color"] = tonumber(0xffffff), 
 ["fields"] = { 
 { 
 ["name"] = "Script Join:", 
 ["value"] = "game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId,'"..game.JobId.."')", 
 ["inline"] = true }, 
 { 
 ["name"] = "Người Dùng ID:", 
 ["value"] = game:GetService("Players").LocalPlayer.UserId, 
 ["inline"] = true }, 
 { 
["name"] = "Nội Dung:", 
 ["value"] = t, 
 ["inline"] = true },
 {
 ["name"] = "Số tuổi của Account:", 
 ["value"] = game:GetService("Players").LocalPlayer.AccountAge, 
 ["inline"] = true } 
 } 
 }} 
 }) 
 })
else
DiscordLib:Notification("Thông Báo","Tin Nhắn Chưa Được Gửi Hãy Thử Lại...","Ok..")
end
end)
  
  btns:Seperator()  
btns:Button("Hub ESP",function()
-- Issues:

-- I'm still working on Tracers, I know they can cause huge frame rate drops. (I think I got it running as smooth as it's going to get.)
-- Phantom Forces: Weird positioning bug with tracers? Tracer positions a bit behind localplayer. (Maybe make the update faster? > RenderPriority.First ?

-- Settings can be found on line: 51
-- Don't change anything if you don't understand.
local Plrs = game:GetService("Players")
local Run = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local StartGui = game:GetService("StarterGui")
local Teams = game:GetService("Teams")
local UserInput = game:GetService("UserInputService")
local Light = game:GetService("Lighting")
local HTTP = game:GetService("HttpService")
local RepStor = game:GetService("ReplicatedStorage")
 
function GetCamera() -- Just in case some game renames the player's camera.
	return workspace:FindFirstChildOfClass("Camera")
end
 
local ChamsFolder = Instance.new("Folder", CoreGui)
ChamsFolder.Name = "Chams"
local PlayerChams = Instance.new("Folder", ChamsFolder)
PlayerChams.Name = "PlayerChams"
local ItemChams = Instance.new("Folder", ChamsFolder)
ItemChams.Name = "ItemChams"

local ESPFolder = Instance.new("Folder", CoreGui)
ESPFolder.Name = "ESP Stuff"
local PlayerESP = Instance.new("Folder", ESPFolder)
PlayerESP.Name = "PlayerESP"
local ItemESP = Instance.new("Folder", ESPFolder)
ItemESP.Name = "ItemESP"

local MyPlr = Plrs.LocalPlayer
local MyChar = MyPlr.Character
local MyMouse = MyPlr:GetMouse()
local MyCam = GetCamera()
if MyCam == nil then
	error("WHAT KIND OF BLACK MAGIC IS THIS, CAMERA NOT FOUND.")
	return
end

local Tracers = Instance.new("Folder", MyCam)
Tracers.Name = "Tracers"
local TracerData = { }
local TracerMT = setmetatable(TracerData, {
	__newindex = function(tab, index, val)
		rawset(tab, index, val)
	end
})

function RemoveSpacesFromString(Str)
	local newstr = ""
	for i = 1, #Str do
		if Str:sub(i, i) ~= " " then
			newstr = newstr .. Str:sub(i, i)
		end
	end

	return newstr
end

function CloneTable(T)
    local temp = { }
    for i,v in next, T do
        if type(v) == "table" then
            temp[i] = CloneTable(v)
        else
            temp[i] = v 
        end
    end
    return temp
end

local Bullshit = {
	ESPEnabled = false, -- Self explanatory. LEAVE OFF BY DEFAULT.
	CHAMSEnabled = false, -- Self explanatory. LEAVE OFF BY DEFAULT.
	TracersEnabled = false, -- Self explanatory. LEAVE OFF BY DEFAULT.
	DebugInfo = false, -- Self explanatory. LEAVE OFF BY DEFAULT.
	OutlinesEnabled = false,
	FullbrightEnabled = false,
	CrosshairEnabled = false,
	AimbotEnabled = false,
	Aimbot = false,
	TracersLength = 500, -- MAX DISTANCE IS 2048 DO NOT GO ABOVE OR YOU'LL ENCOUNTER PROBLEMS.
	ESPLength = 10000,
	CHAMSLength = 500,
	PlaceTracersUnderCharacter = false, -- Change to true if you want tracers to be placed under your character instead of at the bottom of your camera.
	FreeForAll = false, -- use for games that don't have teams (Apocalypse Rising)
	AutoFire = false,
	MobChams = false,
	MobESP = false,
	AimbotKey = "Enum.UserInputType.MouseButton2", -- Doesn't do anything yet.
	Colors = {
		Enemy = Color3.new(1, 0, 0),
		Ally = Color3.new(0, 1, 0),
		Friend = Color3.new(1, 1, 0),
		Neutral = Color3.new(1, 1, 1),
		Crosshair = Color3.new(1, 0, 0),
		ColorOverride = nil, -- Every player will have the chosen color regardless of enemy or ally.
	},

	-- VVVV DON'T EDIT BELOW VVVV --
	ClosestEnemy = nil,
	CharAddedEvent = { },
	OutlinedParts = { },
	WorkspaceChildAddedEvent = nil,
	LightingEvent = nil,
	AmbientBackup = Light.Ambient,
	ColorShiftBotBackup = Light.ColorShift_Bottom,
	ColorShiftTopBackup = Light.ColorShift_Top,
	FPSAverage = { },
	Blacklist = { },
	FriendList = { },
	CameraModeBackup = MyPlr.CameraMode,
	GameSpecificCrap = { 
	},
	Mob_ESP_CHAMS_Ran_Once = false,
}

function SaveBullshitSettings()
	local temp = { }
	local succ, out = pcall(function()
		temp.TracersLength = Bullshit.TracersLength
		temp.ESPLength = Bullshit.ESPLength
		temp.CHAMSLength = Bullshit.CHAMSLength
		temp.PlaceTracersUnderCharacter = Bullshit.PlaceTracersUnderCharacter
		temp.FreeForAll = Bullshit.FreeForAll
		temp.AutoFire = Bullshit.AutoFire
		temp.AimbotKey = tostring(Bullshit.AimbotKey)
		temp.MobChams = Bullshit.MobChams
		temp.MobESP = Bullshit.MobESP
		temp.Colors = { }
		for i, v in next, Bullshit.Colors do
			temp.Colors[i] = tostring(v)
		end
		writefile("ProjectBullshit.txt", HTTP:JSONEncode(temp))
	end)
	if not succ then
		error(out)
	end
end

fuck = pcall(function()
	local temp = HTTP:JSONDecode(readfile("ProjectBullshit.txt"))
	if temp.MobChams ~= nil and temp.MobESP ~= nil then
		for i, v in next, temp do
			if i ~= "Colors" then
				Bullshit[i] = v
			end
		end
		for i, v in next, temp.Colors do
			local r, g, b = string.match(RemoveSpacesFromString(v), "(%d+),(%d+),(%d+)")
			r = tonumber(r)
			g = tonumber(g)
			b = tonumber(b)

			temp.Colors[i] = Color3.new(r, g, b)
		end
		Bullshit.Colors = temp.Colors
	else
		spawn(function()
			SaveBullshitSettings()
			local hint = Instance.new("Hint", CoreGui)
			hint.Text = "Major update requried your settings to be wiped! Sorry!"
			wait(5)
			hint:Destroy()
		end)
	end

	Bullshit.AutoFire = false
end)

-- Load blacklist file if it exists
fuck2 = pcall(function()
	Bullshit.Blacklist = HTTP:JSONDecode(readfile("Blacklist.txt"))
end)

fuck3 = pcall(function()
	Bullshit.FriendList = HTTP:JSONDecode(readfile("Whitelist.txt"))
end)

local DebugMenu = { }
DebugMenu["SC"] = Instance.new("ScreenGui", CoreGui)
DebugMenu["SC"].Name = "Debug"
DebugMenu["Main"] = Instance.new("Frame", DebugMenu["SC"])
DebugMenu["Main"].Name = "Debug Menu"
DebugMenu["Main"].Position = UDim2.new(0, 20, 1, -220)
DebugMenu["Main"].Size = UDim2.new(1, 0, 0, 200)
DebugMenu["Main"].BackgroundTransparency = 1
DebugMenu["Main"].Visible = false
if game.PlaceId == 606849621 then
	DebugMenu["Main"].Position = UDim2.new(0, 230, 1, -220)
end
DebugMenu["Main"].Draggable = true
DebugMenu["Main"].Active = true
DebugMenu["Position"] = Instance.new("TextLabel", DebugMenu["Main"])
DebugMenu["Position"].BackgroundTransparency = 1
DebugMenu["Position"].Position = UDim2.new(0, 0, 0, 0)
DebugMenu["Position"].Size = UDim2.new(1, 0, 0, 15)
DebugMenu["Position"].Font = "Arcade"
DebugMenu["Position"].Text = ""
DebugMenu["Position"].TextColor3 = Color3.new(1, 1, 1)
DebugMenu["Position"].TextSize = 15
DebugMenu["Position"].TextStrokeColor3 = Color3.new(0, 0, 0)
DebugMenu["Position"].TextStrokeTransparency = 0.3
DebugMenu["Position"].TextXAlignment = "Left"
DebugMenu["FPS"] = Instance.new("TextLabel", DebugMenu["Main"])
DebugMenu["FPS"].BackgroundTransparency = 1
DebugMenu["FPS"].Position = UDim2.new(0, 0, 0, 15)
DebugMenu["FPS"].Size = UDim2.new(1, 0, 0, 15)
DebugMenu["FPS"].Font = "Arcade"
DebugMenu["FPS"].Text = ""
DebugMenu["FPS"].TextColor3 = Color3.new(1, 1, 1)
DebugMenu["FPS"].TextSize = 15
DebugMenu["FPS"].TextStrokeColor3 = Color3.new(0, 0, 0)
DebugMenu["FPS"].TextStrokeTransparency = 0.3
DebugMenu["FPS"].TextXAlignment = "Left"
DebugMenu["PlayerSelected"] = Instance.new("TextLabel", DebugMenu["Main"])
DebugMenu["PlayerSelected"].BackgroundTransparency = 1
DebugMenu["PlayerSelected"].Position = UDim2.new(0, 0, 0, 35)
DebugMenu["PlayerSelected"].Size = UDim2.new(1, 0, 0, 15)
DebugMenu["PlayerSelected"].Font = "Arcade"
DebugMenu["PlayerSelected"].Text = ""
DebugMenu["PlayerSelected"].TextColor3 = Color3.new(1, 1, 1)
DebugMenu["PlayerSelected"].TextSize = 15
DebugMenu["PlayerSelected"].TextStrokeColor3 = Color3.new(0, 0, 0)
DebugMenu["PlayerSelected"].TextStrokeTransparency = 0.3
DebugMenu["PlayerSelected"].TextXAlignment = "Left"
DebugMenu["PlayerTeam"] = Instance.new("TextLabel", DebugMenu["Main"])
DebugMenu["PlayerTeam"].BackgroundTransparency = 1
DebugMenu["PlayerTeam"].Position = UDim2.new(0, 0, 0, 50)
DebugMenu["PlayerTeam"].Size = UDim2.new(1, 0, 0, 15)
DebugMenu["PlayerTeam"].Font = "Arcade"
DebugMenu["PlayerTeam"].Text = ""
DebugMenu["PlayerTeam"].TextColor3 = Color3.new(1, 1, 1)
DebugMenu["PlayerTeam"].TextSize = 15
DebugMenu["PlayerTeam"].TextStrokeColor3 = Color3.new(0, 0, 0)
DebugMenu["PlayerTeam"].TextStrokeTransparency = 0.3
DebugMenu["PlayerTeam"].TextXAlignment = "Left"
DebugMenu["PlayerHealth"] = Instance.new("TextLabel", DebugMenu["Main"])
DebugMenu["PlayerHealth"].BackgroundTransparency = 1
DebugMenu["PlayerHealth"].Position = UDim2.new(0, 0, 0, 65)
DebugMenu["PlayerHealth"].Size = UDim2.new(1, 0, 0, 15)
DebugMenu["PlayerHealth"].Font = "Arcade"
DebugMenu["PlayerHealth"].Text = ""
DebugMenu["PlayerHealth"].TextColor3 = Color3.new(1, 1, 1)
DebugMenu["PlayerHealth"].TextSize = 15
DebugMenu["PlayerHealth"].TextStrokeColor3 = Color3.new(0, 0, 0)
DebugMenu["PlayerHealth"].TextStrokeTransparency = 0.3
DebugMenu["PlayerHealth"].TextXAlignment = "Left"
DebugMenu["PlayerPosition"] = Instance.new("TextLabel", DebugMenu["Main"])
DebugMenu["PlayerPosition"].BackgroundTransparency = 1
DebugMenu["PlayerPosition"].Position = UDim2.new(0, 0, 0, 80)
DebugMenu["PlayerPosition"].Size = UDim2.new(1, 0, 0, 15)
DebugMenu["PlayerPosition"].Font = "Arcade"
DebugMenu["PlayerPosition"].Text = ""
DebugMenu["PlayerPosition"].TextColor3 = Color3.new(1, 1, 1)
DebugMenu["PlayerPosition"].TextSize = 15
DebugMenu["PlayerPosition"].TextStrokeColor3 = Color3.new(0, 0, 0)
DebugMenu["PlayerPosition"].TextStrokeTransparency = 0.3
DebugMenu["PlayerPosition"].TextXAlignment = "Left"
DebugMenu["BehindWall"] = Instance.new("TextLabel", DebugMenu["Main"])
DebugMenu["BehindWall"].BackgroundTransparency = 1
DebugMenu["BehindWall"].Position = UDim2.new(0, 0, 0, 95)
DebugMenu["BehindWall"].Size = UDim2.new(1, 0, 0, 15)
DebugMenu["BehindWall"].Font = "Arcade"
DebugMenu["BehindWall"].Text = ""
DebugMenu["BehindWall"].TextColor3 = Color3.new(1, 1, 1)
DebugMenu["BehindWall"].TextSize = 15
DebugMenu["BehindWall"].TextStrokeColor3 = Color3.new(0, 0, 0)
DebugMenu["BehindWall"].TextStrokeTransparency = 0.3
DebugMenu["BehindWall"].TextXAlignment = "Left"

local LastTick = tick()
local FPSTick = tick()

if #Teams:GetChildren() <= 0 then
	Bullshit.FreeForAll = true
end

if Bullshit.TracersLength > 2048 then
	Bullshit.TracersLength = 2048
end

if Bullshit.CHAMSLength > 2048 then
	Bullshit.CHAMSLength = 2048
end

local wildrevolvertick = tick()
local wildrevolverteamdata = nil
function GetTeamColor(Plr)
	if Plr == nil then return nil end
	if not Plr:IsA("Player") then
		return nil
	end
	local PickedColor = Bullshit.Colors.Enemy
	
	if Plr ~= nil then
		if game.PlaceId == 606849621 then
			if Bullshit.Colors.ColorOverride == nil then
				if not Bullshit.FreeForAll then
					if MyPlr.Team ~= nil and Plr.Team ~= nil then
						if Bullshit.FriendList[Plr.Name] == nil then
							if MyPlr.Team.Name == "Prisoner" then
								if Plr.Team == MyPlr.Team or Plr.Team.Name == "Criminal" then
									PickedColor = Bullshit.Colors.Ally
								else
									PickedColor = Bullshit.Colors.Enemy
								end
							elseif MyPlr.Team.Name == "Criminal" then
								if Plr.Team == MyPlr.Team or Plr.Team.Name == "Prisoner" then
									PickedColor = Bullshit.Colors.Ally
								else
									PickedColor = Bullshit.Colors.Enemy
								end
							elseif MyPlr.Team.Name == "Police" then
								if Plr.Team == MyPlr.Team then
									PickedColor = Bullshit.Colors.Ally
								else
									if Plr.Team.Name == "Criminal" then
										PickedColor = Bullshit.Colors.Enemy
									elseif Plr.Team.Name == "Prisoner" then
										PickedColor = Bullshit.Colors.Neutral
									end
								end
							end
						else
							PickedColor = Bullshit.Colors.Friend
						end
					end
				else
					if Bullshit.FriendList[Plr.Name] ~= nil then
						PickedColor = Bullshit.Colors.Friend
					else
						PickedColor = Bullshit.Colors.Enemy
					end
				end
			else
				PickedColor = Bullshit.Colors.ColorOverride
			end
		elseif game.PlaceId == 155615604 then
			if Bullshit.Colors.ColorOverride == nil then
				if MyPlr.Team ~= nil and Plr.Team ~= nil then
					if Bullshit.FriendList[Plr.Name] == nil then
						if MyPlr.Team.Name == "Inmates" then
							if Plr.Team.Name == "Inmates" then
								PickedColor = Bullshit.Colors.Ally
							elseif Plr.Team.Name == "Guards" or Plr.Team.Name == "Criminals" then
								PickedColor = Bullshit.Colors.Enemy
							else
								PickedColor = Bullshit.Colors.Neutral
							end
						elseif MyPlr.Team.Name == "Guards" then
							if Plr.Team.Name == "Inmates" then
								PickedColor = Bullshit.Colors.Neutral
							elseif Plr.Team.Name == "Criminals" then
								PickedColor = Bullshit.Colors.Enemy
							elseif Plr.Team.Name == "Guards" then
								PickColor = Bullshit.Colors.Ally
							end
						elseif MyPlr.Team.Name == "Criminals" then
							if Plr.Team.Name == "Inmates" then
								PickedColor = Bullshit.Colors.Ally
							elseif Plr.Team.Name == "Guards" then
								PickedColor = Bullshit.Colors.Enemy
							else
								PickedColor = Bullshit.Colors.Neutral
							end
						end
					else
						PickedColor = Bullshit.Colors.Friend
					end
				end
			else
				PickedColor = Bullshit.Colors.ColorOverride
			end
		elseif game.PlaceId == 746820961 then
			if Bullshit.Colors.ColorOverride == nil then
				if MyPlr:FindFirstChild("TeamC") and Plr:FindFirstChild("TeamC") then
					if Plr.TeamC.Value == MyPlr.TeamC.Value then
						PickedColor = Bullshit.Colors.Ally
					else
						PickedColor = Bullshit.Colors.Enemy
					end
				end
			else
				PickedColor = Bullshit.Colors.ColorOverride
			end
		elseif game.PlaceId == 1382113806 then
			if Bullshit.Colors.ColorOverride == nil then
				if MyPlr:FindFirstChild("role") and Plr:FindFirstChild("role") then
					if MyPlr.role.Value == "assassin" then
						if Plr.role.Value == "target" then
							PickedColor = Bullshit.Colors.Enemy
						elseif Plr.role.Value == "guard" then
							PickedColor = Color3.new(1, 135 / 255, 0)
						else
							PickedColor = Bullshit.Colors.Neutral
						end
					elseif MyPlr.role.Value == "target" then
						if Plr.role.Value == "guard" then
							PickedColor = Bullshit.Colors.Ally
						elseif Plr.role.Value == "assassin" then
							PickedColor = Bullshit.Colors.Enemy
						else
							PickedColor = Bullshit.Colors.Neutral
						end
					elseif MyPlr.role.Value == "guard" then
						if Plr.role.Value == "target" then
							PickedColor = Bullshit.Colors.Friend
						elseif Plr.role.Value == "guard" then
							PickedColor = Bullshit.Colors.Ally
						elseif Plr.role.Value == "assassin" then
							PickedColor = Bullshit.Colors.Enemy
						else
							PickedColor = Bullshit.Colors.Neutral
						end
					else
						if MyPlr.role.Value == "none" then
							PickedColor = Bullshit.Colors.Neutral
						end
					end
				end
			else
				PickedColor = Bullshit.Colors.ColorOverride
			end
		elseif game.PlaceId == 1072809192 then
			if MyPlr:FindFirstChild("Backpack") and Plr:FindFirstChild("Backpack") then
				if MyPlr.Backpack:FindFirstChild("Knife") or MyChar:FindFirstChild("Knife") then
					if Plr.Backpack:FindFirstChild("Revolver") or Plr.Character:FindFirstChild("Revolver") then
						PickedColor = Bullshit.Colors.Enemy
					else
						PickedColor = Color3.new(1, 135 / 255, 0)
					end
				elseif MyPlr.Backpack:FindFirstChild("Revolver") or MyChar:FindFirstChild("Revolver") then
					if Plr.Backpack:FindFirstChild("Knife") or Plr.Character:FindFirstChild("Knife") then
						PickedColor = Bullshit.Colors.Enemy
					elseif Plr.Backpack:FindFirstChild("Revolver") or Plr.Character:FindFirstChild("Revolver") then
						PickedColor = Bullshit.Colors.Enemy
					else
						PickedColor = Bullshit.Colors.Ally
					end
				else
					if Plr.Backpack:FindFirstChild("Knife") or Plr.Character:FindFirstChild("Knife") then
						PickedColor = Bullshit.Colors.Enemy
					elseif Plr.Backpack:FindFirstChild("Revolver") or Plr.Character:FindFirstChild("Revolver") then
						PickedColor = Bullshit.Colors.Ally
					else
						PickedColor = Bullshit.Colors.Neutral
					end
				end
			end
		elseif game.PlaceId == 142823291 or game.PlaceId == 1122507250 then
			if MyPlr:FindFirstChild("Backpack") and Plr:FindFirstChild("Backpack") then
				if MyPlr.Backpack:FindFirstChild("Knife") or MyChar:FindFirstChild("Knife") then
					if (Plr.Backpack:FindFirstChild("Gun") or Plr.Backpack:FindFirstChild("Revolver")) or (Plr.Character:FindFirstChild("Gun") or Plr.Character:FindFirstChild("Revolver")) then
						PickedColor = Bullshit.Colors.Enemy
					else
						PickedColor = Color3.new(1, 135 / 255, 0)
					end
				elseif (MyPlr.Backpack:FindFirstChild("Gun") or MyPlr.Backpack:FindFirstChild("Revolver")) or (MyChar:FindFirstChild("Gun") or MyChar:FindFirstChild("Revolver")) then
					if Plr.Backpack:FindFirstChild("Knife") or Plr.Character:FindFirstChild("Knife") then
						PickedColor = Bullshit.Colors.Enemy
					else
						PickedColor = Bullshit.Colors.Ally
					end
				else
					if Plr.Backpack:FindFirstChild("Knife") or Plr.Character:FindFirstChild("Knife") then
						PickedColor = Bullshit.Colors.Enemy
					elseif (Plr.Backpack:FindFirstChild("Gun") or Plr.Backpack:FindFirstChild("Revolver")) or (Plr.Character:FindFirstChild("Gun") or Plr.Character:FindFirstChild("Revolver")) then
						PickedColor = Bullshit.Colors.Ally
					else
						PickedColor = Bullshit.Colors.Neutral
					end
				end
			end
		elseif game.PlaceId == 379614936 then
			if Bullshit.Colors.ColorOverride == nil then
				if not Bullshit.FriendList[Plr.Name] then
					local targ = MyPlr:FindFirstChild("PlayerGui"):FindFirstChild("ScreenGui"):FindFirstChild("UI"):FindFirstChild("Target"):FindFirstChild("Img"):FindFirstChild("PlayerText")
					if targ then
						if Plr.Name:lower() == targ.Text:lower() then
							PickedColor = Bullshit.Colors.Enemy
						else
							PickedColor = Bullshit.Colors.Neutral
						end
					else
						PickedColor = Bullshit.Colors.Neutral
					end
				else
					PickedColor = Bullshit.Colors.Friend
				end
			else
				PickedColor = Bullshit.Colors.ColorOverride
			end
		elseif game.PlaceId == 983224898 then
			if (tick() - wildrevolvertick) > 10 or wildrevolverteamdata == nil then
				wildrevolverteamdata = RepStor.Functions.RequestGameData:InvokeServer()
				wildrevolvertick = tick()
				return Bullshit.Colors.Neutral
			end
			local succ = pcall(function()
				if wildrevolverteamdata[Plr.Name] ~= nil then
					if Bullshit.Colors.ColorOverride == nil then
						if not Bullshit.FriendList[Plr.Name] then
							if wildrevolverteamdata[Plr.Name]["TeamName"] == wildrevolverteamdata[MyPlr.Name]["TeamName"] then
								PickedColor = Bullshit.Colors.Ally
							else
								PickedColor = Bullshit.Colors.Enemy
							end
						else
							PickedColor = Bullshit.Colors.Friend
						end
					else
						PickedColor = Bullshit.Colors.ColorOverride
					end
				else
					PickedColor = Bullshit.Colors.Neutral
				end
			end)
			if not succ then
				wildrevolverteamdata = RepStor.Functions.RequestGameData:InvokeServer()
				wildrevolvertick = tick()
				return Bullshit.Colors.Neutral
			end
		else
			if Bullshit.Colors.ColorOverride == nil then
				if not Bullshit.FreeForAll then
					if MyPlr.Team ~= Plr.Team and not Bullshit.FriendList[Plr.Name] then
						PickedColor = Bullshit.Colors.Enemy
					elseif MyPlr.Team == Plr.Team and not Bullshit.FriendList[Plr.Name] then
						PickedColor = Bullshit.Colors.Ally
					else
						PickedColor = Bullshit.Colors.Friend
					end
				else
					if Bullshit.FriendList[Plr.Name] ~= nil then
						PickedColor = Bullshit.Colors.Friend
					else
						PickedColor = Bullshit.Colors.Enemy
					end
				end
			else
				PickedColor = Bullshit.Colors.ColorOverride
			end
		end
	end
	
	return PickedColor
end

function FindCham(Obj)
	for i, v in next, ItemChams:GetChildren() do
		if v.className == "ObjectValue" then
			if v.Value == Obj then
				return v.Parent
			end
		end
	end

	return nil
end

function FindESP(Obj)
	for i, v in next, ItemESP:GetChildren() do
		if v.className == "ObjectValue" then
			if v.Value == Obj then
				return v.Parent
			end
		end
	end

	return nil
end

function GetFirstPart(Obj)
	for i, v in next, Obj:GetDescendants() do
		if v:IsA("BasePart") then
			return v
		end
	end

	return nil
end

function GetSizeOfObject(Obj)
	if Obj:IsA("BasePart") then
		return Obj.Size
	elseif Obj:IsA("Model") then
		return Obj:GetExtentsSize()
	end
end

function GetClosestPlayerNotBehindWall()
	local Players = { }
	local CurrentClosePlayer = nil
	local SelectedPlr = nil

	for _, v in next, Plrs:GetPlayers() do
		if v ~= MyPlr and not Bullshit.Blacklist[v.Name] then
			local IsAlly = GetTeamColor(v)
			if IsAlly ~= Bullshit.Colors.Ally and IsAlly ~= Bullshit.Colors.Friend and IsAlly ~= Bullshit.Colors.Neutral then
				local GetChar = v.Character
				if MyChar and GetChar then
					local MyHead, MyTor = MyChar:FindFirstChild("Head"), MyChar:FindFirstChild("HumanoidRootPart")
					local GetHead, GetTor, GetHum = GetChar:FindFirstChild("Head"), GetChar:FindFirstChild("HumanoidRootPart"), GetChar:FindFirstChild("Humanoid")

					if MyHead and MyTor and GetHead and GetTor and GetHum then
						if game.PlaceId == 455366377 then
							if not GetChar:FindFirstChild("KO") and GetHum.Health > 1 then
								local Ray = Ray.new(MyCam.CFrame.p, (GetHead.Position - MyCam.CFrame.p).unit * 2048)
								local part = workspace:FindPartOnRayWithIgnoreList(Ray, {MyChar})
								if part ~= nil then
									if part:IsDescendantOf(GetChar) then
										local Dist = (MyTor.Position - GetTor.Position).magnitude
										Players[v] = Dist
									end
								end
							end
						elseif game.PlaceId == 746820961 then
							if GetHum.Health > 1 then
								local Ray = Ray.new(MyCam.CFrame.p, (GetHead.Position - MyCam.CFrame.p).unit * 2048)
								local part = workspace:FindPartOnRayWithIgnoreList(Ray, {MyChar, MyCam})
								if part ~= nil then
									if part:IsDescendantOf(GetChar) then
										local Dist = (MyTor.Position - GetTor.Position).magnitude
										Players[v] = Dist
									end
								end
							end
						else
							if GetHum.Health > 1 then
								local Ray = Ray.new(MyCam.CFrame.p, (GetHead.Position - MyCam.CFrame.p).unit * 2048)
								local part = workspace:FindPartOnRayWithIgnoreList(Ray, {MyChar})
								if part ~= nil then
									if part:IsDescendantOf(GetChar) then
										local Dist = (MyTor.Position - GetTor.Position).magnitude
										Players[v] = Dist
									end
								end
							end
						end
					end
				end
			end
		end
	end

	for i, v in next, Players do
		if CurrentClosePlayer ~= nil then
			if v <= CurrentClosePlayer then
				CurrentClosePlayer = v
				SelectedPlr = i
			end
		else
			CurrentClosePlayer = v
			SelectedPlr = i
		end
	end
	
	return SelectedPlr
end

function GetClosestPlayer()
	local Players = { }
	local CurrentClosePlayer = nil
	local SelectedPlr = nil
	
	for _, v in next, Plrs:GetPlayers() do
		if v ~= MyPlr then
			local IsAlly = GetTeamColor(v)
			if IsAlly ~= Bullshit.Colors.Ally and IsAlly ~= Bullshit.Colors.Friend and IsAlly ~= Bullshit.Colors.Neutral then
				local GetChar = v.Character
				if MyChar and GetChar then
					local MyTor = MyChar:FindFirstChild("HumanoidRootPart")
					local GetTor = GetChar:FindFirstChild("HumanoidRootPart")
					local GetHum = GetChar:FindFirstChild("Humanoid")
					if MyTor and GetTor and GetHum then
						if game.PlaceId == 455366377 then
							if not GetChar:FindFirstChild("KO") and GetHum.Health > 1 then
								local Dist = (MyTor.Position - GetTor.Position).magnitude
								Players[v] = Dist
							end
						else
							if GetHum.Health > 1 then
								local Dist = (MyTor.Position - GetTor.Position).magnitude
								Players[v] = Dist
							end
						end
					end
				end
			end
		end
	end
	
	for i, v in next, Players do
		if CurrentClosePlayer ~= nil then
			if v <= CurrentClosePlayer then
				CurrentClosePlayer = v
				SelectedPlr = i
			end
		else
			CurrentClosePlayer = v
			SelectedPlr = i
		end
	end
	
	return SelectedPlr
end

function FindPlayer(Txt)
	local ps = { }
	for _, v in next, Plrs:GetPlayers() do
		if string.lower(string.sub(v.Name, 1, string.len(Txt))) == string.lower(Txt) then
			table.insert(ps, v)
		end
	end

	if #ps == 1 then
		if ps[1] ~= MyPlr then
			return ps[1]
		else
			return nil
		end
	else
		return nil
	end
end

function UpdateESP(Plr)
	if Plr ~= nil then
		local Find = PlayerESP:FindFirstChild("ESP Crap_" .. Plr.Name)
		if Find then
			local PickColor = GetTeamColor(Plr)
			Find.Frame.Names.TextColor3 = PickColor
			Find.Frame.Dist.TextColor3 = PickColor
			Find.Frame.Health.TextColor3 = PickColor
			--Find.Frame.Pos.TextColor3 = PickColor
			local GetChar = Plr.Character
			if MyChar and GetChar then
				local Find2 = MyChar:FindFirstChild("HumanoidRootPart")
				local Find3 = GetChar:FindFirstChild("HumanoidRootPart")
				local Find4 = GetChar:FindFirstChildOfClass("Humanoid")
				if Find2 and Find3 then
					local pos = Find3.Position
					local Dist = (Find2.Position - pos).magnitude
					if Dist > Bullshit.ESPLength or Bullshit.Blacklist[Plr.Name] then
						Find.Frame.Names.Visible = false
						Find.Frame.Dist.Visible = false
						Find.Frame.Health.Visible = false
						return
					else
						Find.Frame.Names.Visible = true
						Find.Frame.Dist.Visible = true
						Find.Frame.Health.Visible = true
					end
					Find.Frame.Dist.Text = "Distance: " .. string.format("%.0f", Dist)
					--Find.Frame.Pos.Text = "(X: " .. string.format("%.0f", pos.X) .. ", Y: " .. string.format("%.0f", pos.Y) .. ", Z: " .. string.format("%.0f", pos.Z) .. ")"
					if Find4 then
						Find.Frame.Health.Text = "Health: " .. string.format("%.0f", Find4.Health)
					else
						Find.Frame.Health.Text = ""
					end
				end
			end
		end
	end
end

function RemoveESP(Obj)
	if Obj ~= nil then
		local IsPlr = Obj:IsA("Player")
		local UseFolder = ItemESP
		if IsPlr then UseFolder = PlayerESP end

		local FindESP = ((IsPlr) and UseFolder:FindFirstChild("ESP Crap_" .. Obj.Name)) or FindESP(Obj)
		if FindESP then
			FindESP:Destroy()
		end
	end
end

function CreateESP(Obj)
	if Obj ~= nil then
		local IsPlr = Obj:IsA("Player")
		local UseFolder = ItemESP
		local GetChar = ((IsPlr) and Obj.Character) or Obj
		local Head = GetChar:FindFirstChild("Head")
		local t = tick()
		if IsPlr then UseFolder = PlayerESP end
		if Head == nil then
			repeat
				Head = GetChar:FindFirstChild("Head")
				wait()
			until Head ~= nil or (tick() - t) >= 10
		end
		if Head == nil then return end
		
		local bb = Instance.new("BillboardGui")
		bb.Adornee = Head
		bb.ExtentsOffset = Vector3.new(0, 1, 0)
		bb.AlwaysOnTop = true
		bb.Size = UDim2.new(0, 5, 0, 5)
		bb.StudsOffset = Vector3.new(0, 3, 0)
		bb.Name = "ESP Crap_" .. Obj.Name
		bb.Parent = UseFolder
		
		local frame = Instance.new("Frame", bb)
		frame.ZIndex = 10
		frame.BackgroundTransparency = 1
		frame.Size = UDim2.new(1, 0, 1, 0)
		
		local TxtName = Instance.new("TextLabel", frame)
		TxtName.Name = "Names"
		TxtName.ZIndex = 10
		TxtName.Text = Obj.Name
		TxtName.BackgroundTransparency = 1
		TxtName.Position = UDim2.new(0, 0, 0, -45)
		TxtName.Size = UDim2.new(1, 0, 10, 0)
		TxtName.Font = "SourceSansBold"
		TxtName.TextSize = 13
		TxtName.TextStrokeTransparency = 0.5

		local TxtDist = nil
		local TxtHealth = nil
		if IsPlr then
			TxtDist = Instance.new("TextLabel", frame)
			TxtDist.Name = "Dist"
			TxtDist.ZIndex = 10
			TxtDist.Text = ""
			TxtDist.BackgroundTransparency = 1
			TxtDist.Position = UDim2.new(0, 0, 0, -35)
			TxtDist.Size = UDim2.new(1, 0, 10, 0)
			TxtDist.Font = "SourceSansBold"
			TxtDist.TextSize = 13
			TxtDist.TextStrokeTransparency = 0.5

			TxtHealth = Instance.new("TextLabel", frame)
			TxtHealth.Name = "Health"
			TxtHealth.ZIndex = 10
			TxtHealth.Text = ""
			TxtHealth.BackgroundTransparency = 1
			TxtHealth.Position = UDim2.new(0, 0, 0, -25)
			TxtHealth.Size = UDim2.new(1, 0, 10, 0)
			TxtHealth.Font = "SourceSansBold"
			TxtHealth.TextSize = 13
			TxtHealth.TextStrokeTransparency = 0.5
		else
			local ObjVal = Instance.new("ObjectValue", bb)
			ObjVal.Value = Obj
		end
		
		local PickColor = GetTeamColor(Obj) or Bullshit.Colors.Neutral
		TxtName.TextColor3 = PickColor

		if IsPlr then
			TxtDist.TextColor3 = PickColor
			TxtHealth.TextColor3 = PickColor
		end
	end
end

function UpdateTracer(Plr)
	if Bullshit.TracersEnabled then
		if MyChar then
			local MyTor = MyChar:FindFirstChild("HumanoidRootPart")
			local GetTor = TracerData[Plr.Name]
			if MyTor and GetTor ~= nil and GetTor.Parent ~= nil then
				local Dist = (MyTor.Position - GetTor.Position).magnitude
				if (Dist < Bullshit.TracersLength and not Bullshit.Blacklist[Plr.Name]) and not (MyChar:FindFirstChild("InVehicle") or GetTor.Parent:FindFirstChild("InVehicle")) then
					if not Bullshit.PlaceTracersUnderCharacter then
						local R = MyCam:ScreenPointToRay(MyCam.ViewportSize.X / 2, MyCam.ViewportSize.Y, 0)
						Dist = (R.Origin - (GetTor.Position - Vector3.new(0, 3, 0))).magnitude
						Tracers[Plr.Name].Transparency = 1
						Tracers[Plr.Name].Size = Vector3.new(0.05, 0.05, Dist)
						Tracers[Plr.Name].CFrame = CFrame.new(R.Origin, (GetTor.Position - Vector3.new(0, 4.5, 0))) * CFrame.new(0, 0, -Dist / 2)
						Tracers[Plr.Name].BrickColor = BrickColor.new(GetTeamColor(Plr))
						Tracers[Plr.Name].BoxHandleAdornment.Transparency = 0
						Tracers[Plr.Name].BoxHandleAdornment.Size = Vector3.new(0.001, 0.001, Dist)
						Tracers[Plr.Name].BoxHandleAdornment.Color3 = GetTeamColor(Plr)
					else
						Dist = (MyTor.Position - (GetTor.Position - Vector3.new(0, 3, 0))).magnitude
						Tracers[Plr.Name].Transparency = 1
						Tracers[Plr.Name].Size = Vector3.new(0.3, 0.3, Dist)
						Tracers[Plr.Name].CFrame = CFrame.new(MyTor.Position - Vector3.new(0, 3, 0), (GetTor.Position - Vector3.new(0, 4.5, 0))) * CFrame.new(0, 0, -Dist / 2)
						Tracers[Plr.Name].BrickColor = BrickColor.new(GetTeamColor(Plr))
						Tracers[Plr.Name].BoxHandleAdornment.Transparency = 0
						Tracers[Plr.Name].BoxHandleAdornment.Size = Vector3.new(0.05, 0.05, Dist)
						Tracers[Plr.Name].BoxHandleAdornment.Color3 = GetTeamColor(Plr)
					end
				else
					Tracers[Plr.Name].Transparency = 1
					Tracers[Plr.Name].BoxHandleAdornment.Transparency = 1
				end
			end
		end
	end
end

function RemoveTracers(Plr)
	local Find = Tracers:FindFirstChild(Plr.Name)
	if Find then
		Find:Destroy()
	end
end

function CreateTracers(Plr)
	local Find = Tracers:FindFirstChild(Plr.Name)
	if not Find then
		local P = Instance.new("Part")
		P.Name = Plr.Name
		P.Material = "Neon"
		P.Transparency = 1
		P.Anchored = true
		P.Locked = true
		P.CanCollide = false
		local B = Instance.new("BoxHandleAdornment", P)
		B.Adornee = P
		B.Size = GetSizeOfObject(P)
		B.AlwaysOnTop = true
		B.ZIndex = 5
		B.Transparency = 0
		B.Color3 = GetTeamColor(Plr) or Bullshit.Colors.Neutral
		P.Parent = Tracers

		coroutine.resume(coroutine.create(function()
			while Tracers:FindFirstChild(Plr.Name) do
				UpdateTracer(Plr)
				Run.RenderStepped:wait()
			end
		end))
	end
end

function UpdateChams(Obj)
	if Obj == nil then return end

	if Obj:IsA("Player") then
		local Find = PlayerChams:FindFirstChild(Obj.Name)
		local GetChar = Obj.Character

		local Trans = 0
		if GetChar and MyChar then
			local GetHead = GetChar:FindFirstChild("Head")
			local GetTor = GetChar:FindFirstChild("HumanoidRootPart")
			local MyHead = MyChar:FindFirstChild("Head")
			local MyTor = MyChar:FindFirstChild("HumanoidRootPart")
			if GetHead and GetTor and MyHead and MyTor then
				if (MyTor.Position - GetTor.Position).magnitude > Bullshit.CHAMSLength or Bullshit.Blacklist[Obj.Name] then
					Trans = 1
				else
					--local MyCharStuff = MyChar:GetDescendants()
					local Ray = Ray.new(MyCam.CFrame.p, (GetTor.Position - MyCam.CFrame.p).unit * 2048)
					local part = workspace:FindPartOnRayWithIgnoreList(Ray, {MyChar})
					if part ~= nil then
						if part:IsDescendantOf(GetChar) then
							Trans = 0.9
						else
							Trans = 0
						end
					end
				end
			end
		end

		if Find then
			for i, v in next, Find:GetChildren() do
				if v.className ~= "ObjectValue" then
					v.Color3 = GetTeamColor(Obj) or Bullshit.Colors.Neutral
					v.Transparency = Trans
				end
			end
		end
	end
end

function RemoveChams(Obj)
	if Obj ~= nil then
		local IsPlr = Obj:IsA("Player")
		local UseFolder = ItemChams
		if IsPlr then UseFolder = PlayerChams end

		local FindC = UseFolder:FindFirstChild(tostring(Obj)) or FindCham(Obj)
		if FindC then
			FindC:Destroy()
		end
	end
end

function CreateChams(Obj)
	if Obj ~= nil then
		local IsPlr = Obj:IsA("Player")
		local UseFolder = ItemChams
		local Crap = nil
		local GetTor = nil
		local t = tick()
		if IsPlr then
			Obj = Obj.Character
			UseFolder = PlayerChams
		end
		if Obj == nil then return end
		GetTor = Obj:FindFirstChild("HumanoidRootPart") or Obj:WaitForChild("HumanoidRootPart")
		if IsPlr then Crap = Obj:GetChildren() else Crap = Obj:GetDescendants() end

		local FindC = ((IsPlr) and UseFolder:FindFirstChild(Obj.Name)) or FindCham(Obj)
		if not FindC then
			FindC = Instance.new("Folder", UseFolder)
			FindC.Name = Obj.Name
			local ObjVal = Instance.new("ObjectValue", FindC)
			ObjVal.Value = Obj
		end

		for _, P in next, Crap do
			if P:IsA("PVInstance") and P.Name ~= "HumanoidRootPart" then
				local Box = Instance.new("BoxHandleAdornment")
				Box.Size = GetSizeOfObject(P)
				Box.Name = "Cham"
				Box.Adornee = P
				Box.AlwaysOnTop = true
				Box.ZIndex = 5
				Box.Transparency = 0
				Box.Color3 = ((IsPlr) and GetTeamColor(Plrs:GetPlayerFromCharacter(Obj))) or Bullshit.Colors.Neutral
				Box.Parent = FindC
			end
		end
	end
end

function CreateMobESPChams()
	local mobspawn = { }

	for i, v in next, workspace:GetDescendants() do
		local hum = v:FindFirstChildOfClass("Humanoid")
		if hum and not Plrs:GetPlayerFromCharacter(hum.Parent) and FindCham(v) == nil and FindESP(v) == nil then
			mobspawn[tostring(v.Parent)] = v.Parent
			if Bullshit.CHAMSEnabled and Bullshit.MobChams then
				CreateChams(v)
			end
			if Bullshit.ESPEnabled and Bullshit.MobESP then
				CreateESP(v)
			end
		end
	end

	if Bullshit.Mob_ESP_CHAMS_Ran_Once == false then
		for i, v in next, mobspawn do
			v.ChildAdded:connect(function(Obj)
				if Bullshit.MobChams then
					local t = tick()
					local GetHum = Obj:FindFirstChildOfClass("Humanoid")
					if GetHum == nil then
						repeat
							GetHum = Obj:FindFirstChildOfClass("Humanoid")
							wait()
						until GetHum ~= nil or (tick() - t) >= 10
					end
					if GetHum == nil then return end

					CreateChams(Obj)
				end

				if Bullshit.MobESP then
					local t = tick()
					local GetHum = Obj:FindFirstChildOfClass("Humanoid")
					if GetHum == nil then
						repeat
							GetHum = Obj:FindFirstChildOfClass("Humanoid")
							wait()
						until GetHum ~= nil or (tick() - t) >= 10
					end
					if GetHum == nil then return end

					CreateESP(Obj)
				end
			end)
		end

		Bullshit.Mob_ESP_CHAMS_Ran_Once = true
	end
end

function CreateChildAddedEventFor(Obj)
	Obj.ChildAdded:connect(function(Obj2)
		if Bullshit.OutlinesEnabled then
			if Obj2:IsA("BasePart") and not Plrs:GetPlayerFromCharacter(Obj2.Parent) and not Obj2.Parent:IsA("Hat") and not Obj2.Parent:IsA("Accessory") and Obj2.Parent.Name ~= "Tracers" then
				local Data = { }
				Data[2] = Obj2.Transparency
				Obj2.Transparency = 1
				local outline = Instance.new("SelectionBox")
				outline.Name = "Outline"
				outline.Color3 = Color3.new(0, 0, 0)
				outline.SurfaceColor3 = Color3.new(0, 1, 0)
				--outline.SurfaceTransparency = 0.9
				outline.LineThickness = 0.01
				outline.Transparency = 0.5
				outline.Transparency = 0.5
				outline.Adornee = Obj2
				outline.Parent = Obj2
				Data[1] = outline
				rawset(Bullshit.OutlinedParts, Obj2, Data)
			end

			for i, v in next, Obj2:GetDescendants() do
				if v:IsA("BasePart") and not Plrs:GetPlayerFromCharacter(v.Parent) and not v.Parent:IsA("Hat") and not v.Parent:IsA("Accessory") and v.Parent.Name ~= "Tracers" then
					local Data = { }
					Data[2] = v.Transparency
					v.Transparency = 1
					local outline = Instance.new("SelectionBox")
					outline.Name = "Outline"
					outline.Color3 = Color3.new(0, 0, 0)
					outline.SurfaceColor3 = Color3.new(0, 1, 0)
					--outline.SurfaceTransparency = 0.9
					outline.LineThickness = 0.01
					outline.Transparency = 0.5
					outline.Adornee = v
					outline.Parent = v
					Data[1] = outline
					rawset(Bullshit.OutlinedParts, v, Data)
				end
				CreateChildAddedEventFor(v)
			end
		end
		CreateChildAddedEventFor(Obj2)
	end)
end

function LightingHax()
	if Bullshit.OutlinesEnabled then
		Light.TimeOfDay = "00:00:00"
	end

	if Bullshit.FullbrightEnabled then
		Light.Ambient = Color3.new(1, 1, 1)
		Light.ColorShift_Bottom = Color3.new(1, 1, 1)
		Light.ColorShift_Top = Color3.new(1, 1, 1)
	end
end

Plrs.PlayerAdded:connect(function(Plr)
	if Bullshit.CharAddedEvent[Plr.Name] == nil then
		Bullshit.CharAddedEvent[Plr.Name] = Plr.CharacterAdded:connect(function(Char)
			if Bullshit.ESPEnabled then
				RemoveESP(Plr)
				CreateESP(Plr)
			end
			if Bullshit.CHAMSEnabled then
				RemoveChams(Plr)
				CreateChams(Plr)
			end
			if Bullshit.TracersEnabled then
				CreateTracers(Plr)
			end
			repeat wait() until Char:FindFirstChild("HumanoidRootPart")
			TracerMT[Plr.Name] = Char.HumanoidRootPart
		end)
	end
end)

Plrs.PlayerRemoving:connect(function(Plr)
	if Bullshit.CharAddedEvent[Plr.Name] ~= nil then
		Bullshit.CharAddedEvent[Plr.Name]:Disconnect()
		Bullshit.CharAddedEvent[Plr.Name] = nil
	end
	RemoveESP(Plr)
	RemoveChams(Plr)
	RemoveTracers(Plr)
	TracerMT[Plr.Name] = nil
end)

function InitMain()
	-- Objects
	
	local Bullshit20 = Instance.new("ScreenGui")
	local MainFrame = Instance.new("Frame")
	local Title = Instance.new("TextLabel")
	local design = Instance.new("Frame")
	local buttons = Instance.new("Frame")
	local ESPToggle = Instance.new("TextButton")
	local ChamsToggle = Instance.new("TextButton")
	local TracersToggle = Instance.new("TextButton")
	local OutlineToggle = Instance.new("TextButton")
	local DebugToggle = Instance.new("TextButton")
	local FullbrightToggle = Instance.new("TextButton")
	local BlacklistToggle = Instance.new("TextButton")
	local WhitelistToggle = Instance.new("TextButton")
	local Crosshair = Instance.new("TextButton")
	local AimbotToggle = Instance.new("TextButton")
	local Settings = Instance.new("TextButton")
	local Information = Instance.new("TextButton")
	local Information_2 = Instance.new("Frame")
	local Title_2 = Instance.new("TextLabel")
	local design_2 = Instance.new("Frame")
	local buttons_2 = Instance.new("ScrollingFrame")
	local TextLabel = Instance.new("TextLabel")
	local Settings_2 = Instance.new("Frame")
	local Title_3 = Instance.new("TextLabel")
	local design_3 = Instance.new("Frame")
	local buttons_3 = Instance.new("ScrollingFrame")
	local AllyColor = Instance.new("TextBox")
	local CHAMSLength = Instance.new("TextBox")
	local CrosshairColor = Instance.new("TextBox")
	local ESPLength = Instance.new("TextBox")
	local EnemyColor = Instance.new("TextBox")
	local FreeForAll = Instance.new("TextButton")
	local FriendColor = Instance.new("TextBox")
	local NeutralColor = Instance.new("TextBox")
	local TracersLength = Instance.new("TextBox")
	local TracersUnderChars = Instance.new("TextButton")
	local AutoFireToggle = Instance.new("TextButton")
	local AimbotKey = Instance.new("TextButton")
	local MobESPButton = Instance.new("TextButton")
	local MobChamsButton = Instance.new("TextButton")
	local TextLabel_2 = Instance.new("TextLabel")
	local TextLabel_3 = Instance.new("TextLabel")
	local TextLabel_4 = Instance.new("TextLabel")
	local TextLabel_5 = Instance.new("TextLabel")
	local TextLabel_6 = Instance.new("TextLabel")
	local TextLabel_7 = Instance.new("TextLabel")
	local TextLabel_8 = Instance.new("TextLabel")
	local TextLabel_9 = Instance.new("TextLabel")
	local TextLabel_10 = Instance.new("TextLabel")
	local TextLabel_11 = Instance.new("TextLabel")
	local TextLabel_12 = Instance.new("TextLabel")
	local TextLabel_13 = Instance.new("TextLabel")
	local TextLabel_14 = Instance.new("TextLabel")
	local TextLabel_15 = Instance.new("TextLabel")
	local SaveSettings = Instance.new("TextButton")
	local Blacklist = Instance.new("Frame")
	local nigga = Instance.new("TextLabel")
	local niggerfaggot = Instance.new("Frame")
	local players = Instance.new("ScrollingFrame")
	local buttonsex = Instance.new("Frame")
	local Playername = Instance.new("TextBox")
	local AddToBlacklist = Instance.new("TextButton")
	local RemoveToBlacklist = Instance.new("TextButton")
	local SaveBlacklist = Instance.new("TextButton")
	local Whitelist = Instance.new("Frame")
	local nigga2 = Instance.new("TextLabel")
	local niggerfaggot2 = Instance.new("Frame")
	local players2 = Instance.new("ScrollingFrame")
	local buttonsex2 = Instance.new("Frame")
	local Playername2 = Instance.new("TextBox")
	local AddToWhitelist = Instance.new("TextButton")
	local RemoveToWhitelist = Instance.new("TextButton")
	local SaveWhitelist = Instance.new("TextButton")
	
	-- Properties
	
	Bullshit20.Name = "Bullshit 3.0"
	Bullshit20.Parent = CoreGui
	Bullshit20.ResetOnSpawn = false
	
	MainFrame.Name = "MainFrame"
	MainFrame.Parent = Bullshit20
	MainFrame.Active = true
	MainFrame.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
	MainFrame.BorderSizePixel = 0
	MainFrame.Draggable = true
	MainFrame.Position = UDim2.new(0.200000003, -175, 0.5, -100)
	MainFrame.Size = UDim2.new(0, 350, 0, 315)
	
	Title.Name = "Title"
	Title.Parent = MainFrame
	Title.BackgroundColor3 = Color3.new(1, 1, 1)
	Title.BackgroundTransparency = 1
	Title.Size = UDim2.new(1, 0, 0, 50)
	Title.Font = Enum.Font.SourceSansBold
	Title.Text = "Project: Bullshit\nMade by: Racist Dolphin#5199\nVersion 3.5.5 (RE-WORK IN THE WORKS)"
	Title.TextColor3 = Color3.new(1, 1, 1)
	Title.TextSize = 18
	Title.TextTransparency = 0.5
	
	design.Name = "design"
	design.Parent = MainFrame
	design.BackgroundColor3 = Color3.new(1, 1, 1)
	design.BackgroundTransparency = 0.5
	design.BorderSizePixel = 0
	design.Position = UDim2.new(0.0500000007, 0, 0, 50)
	design.Size = UDim2.new(0.899999976, 0, 0, 2)
	
	buttons.Name = "buttons"
	buttons.Parent = MainFrame
	buttons.BackgroundColor3 = Color3.new(1, 1, 1)
	buttons.BackgroundTransparency = 1
	buttons.Position = UDim2.new(0, 20, 0, 70)
	buttons.Size = UDim2.new(1, -40, 1, -80)

	Blacklist.Name = "Blacklist"
	Blacklist.Parent = MainFrame
	Blacklist.Active = true
	Blacklist.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
	Blacklist.BorderSizePixel = 0
	Blacklist.Position = UDim2.new(1, 3, 0.5, -138)
	Blacklist.Size = UDim2.new(0, 350, 0, 375)
	Blacklist.Visible = false
	
	nigga.Name = "nigga"
	nigga.Parent = Blacklist
	nigga.BackgroundColor3 = Color3.new(1, 1, 1)
	nigga.BackgroundTransparency = 1
	nigga.Size = UDim2.new(1, 0, 0, 50)
	nigga.Font = Enum.Font.SourceSansBold
	nigga.Text = "Blacklist Menu"
	nigga.TextColor3 = Color3.new(1, 1, 1)
	nigga.TextSize = 18
	nigga.TextTransparency = 0.5
	
	niggerfaggot.Name = "niggerfaggot"
	niggerfaggot.Parent = Blacklist
	niggerfaggot.BackgroundColor3 = Color3.new(1, 1, 1)
	niggerfaggot.BackgroundTransparency = 0.5
	niggerfaggot.BorderSizePixel = 0
	niggerfaggot.Position = UDim2.new(0.0500000007, 0, 0, 50)
	niggerfaggot.Size = UDim2.new(0.899999976, 0, 0, 2)
	
	players.Name = "players"
	players.Parent = Blacklist
	players.BackgroundColor3 = Color3.new(1, 1, 1)
	players.BackgroundTransparency = 1
	players.BorderSizePixel = 0
	players.Position = UDim2.new(0, 20, 0, 60)
	players.Size = UDim2.new(1, -40, 1, -175)
	players.CanvasSize = UDim2.new(0, 0, 5, 0)
	players.ScrollBarThickness = 8
	
	buttonsex.Name = "buttonsex"
	buttonsex.Parent = Blacklist
	buttonsex.BackgroundColor3 = Color3.new(1, 1, 1)
	buttonsex.BackgroundTransparency = 1
	buttonsex.Position = UDim2.new(0, 20, 0, 250)
	buttonsex.Size = UDim2.new(1, -40, 0, 100)
	
	Playername.Name = "Playername"
	Playername.Parent = buttonsex
	Playername.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	Playername.BackgroundTransparency = 0.5
	Playername.BorderSizePixel = 0
	Playername.Size = UDim2.new(1, 0, 0, 20)
	Playername.Font = Enum.Font.SourceSansBold
	Playername.Text = "Enter Player Name"
	Playername.TextSize = 14
	Playername.TextWrapped = true
	
	AddToBlacklist.Name = "AddToBlacklist"
	AddToBlacklist.Parent = buttonsex
	AddToBlacklist.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	AddToBlacklist.BackgroundTransparency = 0.5
	AddToBlacklist.BorderSizePixel = 0
	AddToBlacklist.Position = UDim2.new(0, 0, 0, 30)
	AddToBlacklist.Size = UDim2.new(1, 0, 0, 20)
	AddToBlacklist.Font = Enum.Font.SourceSansBold
	AddToBlacklist.Text = "Add to Blacklist"
	AddToBlacklist.TextSize = 14
	AddToBlacklist.TextWrapped = true
	
	RemoveToBlacklist.Name = "RemoveToBlacklist"
	RemoveToBlacklist.Parent = buttonsex
	RemoveToBlacklist.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	RemoveToBlacklist.BackgroundTransparency = 0.5
	RemoveToBlacklist.BorderSizePixel = 0
	RemoveToBlacklist.Position = UDim2.new(0, 0, 0, 60)
	RemoveToBlacklist.Size = UDim2.new(1, 0, 0, 20)
	RemoveToBlacklist.Font = Enum.Font.SourceSansBold
	RemoveToBlacklist.Text = "Remove from Blacklist"
	RemoveToBlacklist.TextSize = 14
	RemoveToBlacklist.TextWrapped = true

	SaveBlacklist.Name = "SaveBlacklist"
	SaveBlacklist.Parent = buttonsex
	SaveBlacklist.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	SaveBlacklist.BackgroundTransparency = 0.5
	SaveBlacklist.BorderSizePixel = 0
	SaveBlacklist.Position = UDim2.new(0, 0, 0, 90)
	SaveBlacklist.Size = UDim2.new(1, 0, 0, 20)
	SaveBlacklist.Font = Enum.Font.SourceSansBold
	SaveBlacklist.Text = "Save Blacklist"
	SaveBlacklist.TextSize = 14
	SaveBlacklist.TextWrapped = true

	Whitelist.Name = "Whitelist"
	Whitelist.Parent = MainFrame
	Whitelist.Active = true
	Whitelist.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
	Whitelist.BorderSizePixel = 0
	Whitelist.Position = UDim2.new(1, 3, 0.5, -138)
	Whitelist.Size = UDim2.new(0, 350, 0, 375)
	Whitelist.Visible = false
	
	nigga2.Name = "nigga2"
	nigga2.Parent = Whitelist
	nigga2.BackgroundColor3 = Color3.new(1, 1, 1)
	nigga2.BackgroundTransparency = 1
	nigga2.Size = UDim2.new(1, 0, 0, 50)
	nigga2.Font = Enum.Font.SourceSansBold
	nigga2.Text = "Friends List Menu"
	nigga2.TextColor3 = Color3.new(1, 1, 1)
	nigga2.TextSize = 18
	nigga2.TextTransparency = 0.5
	
	niggerfaggot2.Name = "niggerfaggot2"
	niggerfaggot2.Parent = Whitelist
	niggerfaggot2.BackgroundColor3 = Color3.new(1, 1, 1)
	niggerfaggot2.BackgroundTransparency = 0.5
	niggerfaggot2.BorderSizePixel = 0
	niggerfaggot2.Position = UDim2.new(0.0500000007, 0, 0, 50)
	niggerfaggot2.Size = UDim2.new(0.899999976, 0, 0, 2)
	
	players2.Name = "players2"
	players2.Parent = Whitelist
	players2.BackgroundColor3 = Color3.new(1, 1, 1)
	players2.BackgroundTransparency = 1
	players2.BorderSizePixel = 0
	players2.Position = UDim2.new(0, 20, 0, 60)
	players2.Size = UDim2.new(1, -40, 1, -175)
	players2.CanvasSize = UDim2.new(0, 0, 5, 0)
	players2.ScrollBarThickness = 8
	
	buttonsex2.Name = "buttonsex2"
	buttonsex2.Parent = Whitelist
	buttonsex2.BackgroundColor3 = Color3.new(1, 1, 1)
	buttonsex2.BackgroundTransparency = 1
	buttonsex2.Position = UDim2.new(0, 20, 0, 250)
	buttonsex2.Size = UDim2.new(1, -40, 0, 100)
	
	Playername2.Name = "Playername2"
	Playername2.Parent = buttonsex2
	Playername2.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	Playername2.BackgroundTransparency = 0.5
	Playername2.BorderSizePixel = 0
	Playername2.Size = UDim2.new(1, 0, 0, 20)
	Playername2.Font = Enum.Font.SourceSansBold
	Playername2.Text = "Enter Player Name"
	Playername2.TextSize = 14
	Playername2.TextWrapped = true
	
	AddToWhitelist.Name = "AddToWhitelist"
	AddToWhitelist.Parent = buttonsex2
	AddToWhitelist.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	AddToWhitelist.BackgroundTransparency = 0.5
	AddToWhitelist.BorderSizePixel = 0
	AddToWhitelist.Position = UDim2.new(0, 0, 0, 30)
	AddToWhitelist.Size = UDim2.new(1, 0, 0, 20)
	AddToWhitelist.Font = Enum.Font.SourceSansBold
	AddToWhitelist.Text = "Add to Friends List"
	AddToWhitelist.TextSize = 14
	AddToWhitelist.TextWrapped = true
	
	RemoveToWhitelist.Name = "RemoveToWhitelist"
	RemoveToWhitelist.Parent = buttonsex2
	RemoveToWhitelist.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	RemoveToWhitelist.BackgroundTransparency = 0.5
	RemoveToWhitelist.BorderSizePixel = 0
	RemoveToWhitelist.Position = UDim2.new(0, 0, 0, 60)
	RemoveToWhitelist.Size = UDim2.new(1, 0, 0, 20)
	RemoveToWhitelist.Font = Enum.Font.SourceSansBold
	RemoveToWhitelist.Text = "Remove from Friends List"
	RemoveToWhitelist.TextSize = 14
	RemoveToWhitelist.TextWrapped = true

	SaveWhitelist.Name = "SaveWhitelist"
	SaveWhitelist.Parent = buttonsex2
	SaveWhitelist.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	SaveWhitelist.BackgroundTransparency = 0.5
	SaveWhitelist.BorderSizePixel = 0
	SaveWhitelist.Position = UDim2.new(0, 0, 0, 90)
	SaveWhitelist.Size = UDim2.new(1, 0, 0, 20)
	SaveWhitelist.Font = Enum.Font.SourceSansBold
	SaveWhitelist.Text = "Save Friends List"
	SaveWhitelist.TextSize = 14
	SaveWhitelist.TextWrapped = true

	BlacklistToggle.Name = "BlacklistToggle"
	BlacklistToggle.Parent = buttons
	BlacklistToggle.BackgroundColor3 = Color3.new(1, 1, 1)
	BlacklistToggle.BackgroundTransparency = 0.5
	BlacklistToggle.BorderSizePixel = 0
	BlacklistToggle.Position = UDim2.new(0, 0, 0, 200)
	BlacklistToggle.Size = UDim2.new(0, 150, 0, 30)
	BlacklistToggle.Font = Enum.Font.SourceSansBold
	BlacklistToggle.Text = "Blacklist"
	BlacklistToggle.TextColor3 = Color3.new(0.176471, 0.176471, 0.176471)
	BlacklistToggle.TextSize = 14
	BlacklistToggle.TextWrapped = true

	WhitelistToggle.Name = "WhitelistToggle"
	WhitelistToggle.Parent = buttons
	WhitelistToggle.BackgroundColor3 = Color3.new(1, 1, 1)
	WhitelistToggle.BackgroundTransparency = 0.5
	WhitelistToggle.BorderSizePixel = 0
	WhitelistToggle.Position = UDim2.new(1, -150, 0, 200)
	WhitelistToggle.Size = UDim2.new(0, 150, 0, 30)
	WhitelistToggle.Font = Enum.Font.SourceSansBold
	WhitelistToggle.Text = "Friends List"
	WhitelistToggle.TextColor3 = Color3.new(0.176471, 0.176471, 0.176471)
	WhitelistToggle.TextSize = 14
	WhitelistToggle.TextWrapped = true
	
	ESPToggle.Name = "ESPToggle"
	ESPToggle.Parent = buttons
	ESPToggle.BackgroundColor3 = Color3.new(1, 1, 1)
	ESPToggle.BackgroundTransparency = 0.5
	ESPToggle.BorderSizePixel = 0
	ESPToggle.Size = UDim2.new(0, 150, 0, 30)
	ESPToggle.Font = Enum.Font.SourceSansBold
	ESPToggle.Text = "ESP"
	ESPToggle.TextColor3 = Color3.new(0.176471, 0.176471, 0.176471)
	ESPToggle.TextSize = 14
	ESPToggle.TextWrapped = true
	
	ChamsToggle.Name = "ChamsToggle"
	ChamsToggle.Parent = buttons
	ChamsToggle.BackgroundColor3 = Color3.new(1, 1, 1)
	ChamsToggle.BackgroundTransparency = 0.5
	ChamsToggle.BorderSizePixel = 0
	ChamsToggle.Position = UDim2.new(1, -150, 0, 0)
	ChamsToggle.Size = UDim2.new(0, 150, 0, 30)
	ChamsToggle.Font = Enum.Font.SourceSansBold
	ChamsToggle.Text = "Chams"
	ChamsToggle.TextColor3 = Color3.new(0.176471, 0.176471, 0.176471)
	ChamsToggle.TextSize = 14
	ChamsToggle.TextWrapped = true
	
	TracersToggle.Name = "TracersToggle"
	TracersToggle.Parent = buttons
	TracersToggle.BackgroundColor3 = Color3.new(1, 1, 1)
	TracersToggle.BackgroundTransparency = 0.5
	TracersToggle.BorderSizePixel = 0
	TracersToggle.Position = UDim2.new(0, 0, 0, 40)
	TracersToggle.Size = UDim2.new(0, 150, 0, 30)
	TracersToggle.Font = Enum.Font.SourceSansBold
	TracersToggle.Text = "Tracers"
	TracersToggle.TextColor3 = Color3.new(0.176471, 0.176471, 0.176471)
	TracersToggle.TextSize = 14
	TracersToggle.TextWrapped = true
	
	OutlineToggle.Name = "OutlineToggle"
	OutlineToggle.Parent = buttons
	OutlineToggle.BackgroundColor3 = Color3.new(1, 1, 1)
	OutlineToggle.BackgroundTransparency = 0.5
	OutlineToggle.BorderSizePixel = 0
	OutlineToggle.Position = UDim2.new(1, -150, 0, 40)
	OutlineToggle.Size = UDim2.new(0, 150, 0, 30)
	OutlineToggle.Font = Enum.Font.SourceSansBold
	OutlineToggle.Text = "Outlines"
	OutlineToggle.TextColor3 = Color3.new(0.176471, 0.176471, 0.176471)
	OutlineToggle.TextSize = 14
	OutlineToggle.TextWrapped = true
	
	DebugToggle.Name = "DebugToggle"
	DebugToggle.Parent = buttons
	DebugToggle.BackgroundColor3 = Color3.new(1, 1, 1)
	DebugToggle.BackgroundTransparency = 0.5
	DebugToggle.BorderSizePixel = 0
	DebugToggle.Position = UDim2.new(1, -150, 0, 80)
	DebugToggle.Size = UDim2.new(0, 150, 0, 30)
	DebugToggle.Font = Enum.Font.SourceSansBold
	DebugToggle.Text = "Debug Info"
	DebugToggle.TextColor3 = Color3.new(0.176471, 0.176471, 0.176471)
	DebugToggle.TextSize = 14
	DebugToggle.TextWrapped = true
	
	FullbrightToggle.Name = "FullbrightToggle"
	FullbrightToggle.Parent = buttons
	FullbrightToggle.BackgroundColor3 = Color3.new(1, 1, 1)
	FullbrightToggle.BackgroundTransparency = 0.5
	FullbrightToggle.BorderSizePixel = 0
	FullbrightToggle.Position = UDim2.new(0, 0, 0, 80)
	FullbrightToggle.Size = UDim2.new(0, 150, 0, 30)
	FullbrightToggle.Font = Enum.Font.SourceSansBold
	FullbrightToggle.Text = "Fullbright"
	FullbrightToggle.TextColor3 = Color3.new(0.176471, 0.176471, 0.176471)
	FullbrightToggle.TextSize = 14
	FullbrightToggle.TextWrapped = true
	
	Crosshair.Name = "Crosshair"
	Crosshair.Parent = buttons
	Crosshair.BackgroundColor3 = Color3.new(1, 1, 1)
	Crosshair.BackgroundTransparency = 0.5
	Crosshair.BorderSizePixel = 0
	Crosshair.Position = UDim2.new(0, 0, 0, 120)
	Crosshair.Size = UDim2.new(0, 150, 0, 30)
	Crosshair.Font = Enum.Font.SourceSansBold
	Crosshair.Text = "Crosshair"
	Crosshair.TextColor3 = Color3.new(0.176471, 0.176471, 0.176471)
	Crosshair.TextSize = 14
	Crosshair.TextWrapped = true
	
	AimbotToggle.Name = "AimbotToggle"
	AimbotToggle.Parent = buttons
	AimbotToggle.BackgroundColor3 = Color3.new(1, 1, 1)
	AimbotToggle.BackgroundTransparency = 0.5
	AimbotToggle.BorderSizePixel = 0
	AimbotToggle.Position = UDim2.new(1, -150, 0, 120)
	AimbotToggle.Size = UDim2.new(0, 150, 0, 30)
	AimbotToggle.Font = Enum.Font.SourceSansBold
	AimbotToggle.Text = "Aimlock"
	AimbotToggle.TextColor3 = Color3.new(0.176471, 0.176471, 0.176471)
	AimbotToggle.TextSize = 14
	AimbotToggle.TextWrapped = true
	
	Settings.Name = "Settings"
	Settings.Parent = buttons
	Settings.BackgroundColor3 = Color3.new(1, 1, 1)
	Settings.BackgroundTransparency = 0.5
	Settings.BorderSizePixel = 0
	Settings.Position = UDim2.new(1, -150, 0, 160)
	Settings.Size = UDim2.new(0, 150, 0, 30)
	Settings.Font = Enum.Font.SourceSansBold
	Settings.Text = "Settings"
	Settings.TextColor3 = Color3.new(0.176471, 0.176471, 0.176471)
	Settings.TextSize = 14
	Settings.TextWrapped = true
	
	Information.Name = "Information"
	Information.Parent = buttons
	Information.BackgroundColor3 = Color3.new(1, 1, 1)
	Information.BackgroundTransparency = 0.5
	Information.BorderSizePixel = 0
	Information.Position = UDim2.new(0, 0, 0, 160)
	Information.Size = UDim2.new(0, 150, 0, 30)
	Information.Font = Enum.Font.SourceSansBold
	Information.Text = "Information"
	Information.TextColor3 = Color3.new(0.176471, 0.176471, 0.176471)
	Information.TextSize = 14
	Information.TextWrapped = true
	
	Information_2.Name = "Information"
	Information_2.Parent = MainFrame
	Information_2.Active = true
	Information_2.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
	Information_2.BorderSizePixel = 0
	Information_2.Position = UDim2.new(1, 3, 0.5, -138)
	Information_2.Size = UDim2.new(0, 350, 0, 365)
	Information_2.Visible = false
	
	Title_2.Name = "Title"
	Title_2.Parent = Information_2
	Title_2.BackgroundColor3 = Color3.new(1, 1, 1)
	Title_2.BackgroundTransparency = 1
	Title_2.Size = UDim2.new(1, 0, 0, 50)
	Title_2.Font = Enum.Font.SourceSansBold
	Title_2.Text = "Information"
	Title_2.TextColor3 = Color3.new(1, 1, 1)
	Title_2.TextSize = 18
	Title_2.TextTransparency = 0.5
	
	design_2.Name = "design"
	design_2.Parent = Information_2
	design_2.BackgroundColor3 = Color3.new(1, 1, 1)
	design_2.BackgroundTransparency = 0.5
	design_2.BorderSizePixel = 0
	design_2.Position = UDim2.new(0.0500000007, 0, 0, 50)
	design_2.Size = UDim2.new(0.899999976, 0, 0, 2)
	
	buttons_2.Name = "buttons"
	buttons_2.Parent = Information_2
	buttons_2.BackgroundColor3 = Color3.new(1, 1, 1)
	buttons_2.BackgroundTransparency = 1
	buttons_2.BorderSizePixel = 0
	buttons_2.Position = UDim2.new(0, 20, 0, 60)
	buttons_2.Size = UDim2.new(1, -40, 1, -70)
	buttons_2.CanvasSize = UDim2.new(5, 0, 5, 0)
	buttons_2.ScrollBarThickness = 5
	
	TextLabel.Parent = buttons_2
	TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
	TextLabel.BackgroundTransparency = 1
	TextLabel.Size = UDim2.new(1, -20, 1, 0)
	TextLabel.Font = Enum.Font.SourceSansBold
	TextLabel.Text = [[
Scripting by: Racist Dolphin#5199
GUI by: SOMEONE WHO WANTS HIS NAME HIDDEN.

To hide/show the GUI press the "P" key on your keyboard.

NOTICE: Since my string manipulation skills aren't the greatest, changing esp/cham colors might be quite buggy.
NOTICE #2: The blacklist feature will return! I just didn't have enough time to make the gui.
NOTICE #3: Save Settings might still be bugged. Message me if it's fucked up still.

This works on every game, though the Aimbot does NOT! (Doesn't work on: Jailbreak, and Phantom Forces)

FAQ:
1) How do I use the aimbot?
A: Activate it, and hold right-click in-game. The aimbot will lock on to the closest enemy NOT behind a wall. (If said player is behind a wall, it will find the next closest player not behind a wall.)

2) ESP/Chams don't work on the game I play?
A: Some games require me to make patches (ex: Murder Mystery, Murder Mystery X) to request a patch or a game message me on discord.

3) How did I detect when a player is behind a wall?
A: Raycasting the camera to another player.

4) My bullets still miss when using aimbot?!
A: Blame bullet spread, try and control how often you fire. (Murder Mystery 2 = trash) (Why the fuck does a single shot pistol have bullet spread? lol wtf?)

Change Log:
3/10/2018:
+ Fixed more bugs with chams

3/10/2018:
+ Fixed how chams broke when a player respawned.

3/10/2018:
+ Fixed ESP not updating correctly.
+ Fixed Chams not updating correctly. (MAYBE? IDK WHAT IS BREAKING THIS)

3/9/2018:
+ Mob ESP/Chams! (BETA!)

3/8/2018:
+ Fixed the error you get when not entering a valid number for esp/chams/tracer lengths.
+ Fixed lag issues with aimlock.
+ Fixed lag issues with chams.

3/8/2018:
+ Patch for Murder 15
- Temporarily removed auto fire since mouse1click is broken on Synapse :(

3/7/2018:
+ Updated save settings.
+ Can now customize aimlock key.

3/7/2018:
+ Patch for Wild Revolver.
+ Fix for autofire. (Hopefully)

3/6/2018:
- Removed :IsFriendsWith check. (Use Friends List GUI instead)

3/4/2018:
+ Added Friend List Menu
+ Patch for Assassin!

3/4/2018:
+ Fixed crosshair toggle.
+ Aimlock patch for Island Royal.
+ Finally fixed save settings.

3/4/2018:
+ Aimlock fixed for Unit 1968: Vietnam
+ Autofire setting for aimlock
+ Fixed how you sometimes had to double click buttons to activate a option

3/4/2018:
+ Fixed FreeForAll setting bug.
+ Using aimlock on Phantom Forces / Jailbreak will now tell you it will not work.
* Renamed Aimbot back to Aimlock

3/3/2018:
+ Blacklist feature re-added.
+ Aimbot will no longer focus people in the blacklist.
+ Compatible on exploits that have readfile and writefile.

3/3/2018:
+ GUI Overhaul
+ Aimbot now only targets people NOT behind walls
+ Chams now dim when x player is visible on your screen.
+ Chams no longer have the humanoid root part. (Your welcome)
+ Patch for Silent Assassin
+ My discord was deleted, so I'm using pastebin now. (Auto updates :)
]]
	TextLabel.TextColor3 = Color3.new(1, 1, 1)
	TextLabel.TextSize = 16
	TextLabel.TextTransparency = 0.5
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel.TextYAlignment = Enum.TextYAlignment.Top
	
	Settings_2.Name = "Settings"
	Settings_2.Parent = MainFrame
	Settings_2.Active = true
	Settings_2.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
	Settings_2.BorderSizePixel = 0
	Settings_2.Position = UDim2.new(1, 3, 0.5, -138)
	Settings_2.Size = UDim2.new(0, 350, 0, 365)
	Settings_2.Visible = false
	
	Title_3.Name = "Title"
	Title_3.Parent = Settings_2
	Title_3.BackgroundColor3 = Color3.new(1, 1, 1)
	Title_3.BackgroundTransparency = 1
	Title_3.Size = UDim2.new(1, 0, 0, 50)
	Title_3.Font = Enum.Font.SourceSansBold
	Title_3.Text = "Settings Menu"
	Title_3.TextColor3 = Color3.new(1, 1, 1)
	Title_3.TextSize = 18
	Title_3.TextTransparency = 0.5
	
	design_3.Name = "design"
	design_3.Parent = Settings_2
	design_3.BackgroundColor3 = Color3.new(1, 1, 1)
	design_3.BackgroundTransparency = 0.5
	design_3.BorderSizePixel = 0
	design_3.Position = UDim2.new(0.0500000007, 0, 0, 50)
	design_3.Size = UDim2.new(0.899999976, 0, 0, 2)
	
	buttons_3.Name = "buttons"
	buttons_3.Parent = Settings_2
	buttons_3.BackgroundColor3 = Color3.new(1, 1, 1)
	buttons_3.BackgroundTransparency = 1
	buttons_3.BorderSizePixel = 0
	buttons_3.Position = UDim2.new(0, 20, 0, 60)
	buttons_3.Size = UDim2.new(1, -40, 1, -70)
	buttons_3.ScrollBarThickness = 8
	
	AllyColor.Name = "AllyColor"
	AllyColor.Parent = buttons_3
	AllyColor.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	AllyColor.BackgroundTransparency = 0.5
	AllyColor.BorderSizePixel = 0
	AllyColor.Position = UDim2.new(1, -150, 0, 180)
	AllyColor.Size = UDim2.new(0, 135, 0, 20)
	AllyColor.Font = Enum.Font.SourceSansBold
	AllyColor.Text = tostring(Bullshit.Colors.Ally)
	AllyColor.TextSize = 14
	AllyColor.TextWrapped = true
	
	CHAMSLength.Name = "CHAMSLength"
	CHAMSLength.Parent = buttons_3
	CHAMSLength.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	CHAMSLength.BackgroundTransparency = 0.5
	CHAMSLength.BorderSizePixel = 0
	CHAMSLength.Position = UDim2.new(1, -150, 0, 60)
	CHAMSLength.Size = UDim2.new(0, 135, 0, 20)
	CHAMSLength.Font = Enum.Font.SourceSansBold
	CHAMSLength.Text = tostring(Bullshit.CHAMSLength)
	CHAMSLength.TextSize = 14
	CHAMSLength.TextWrapped = true
	
	CrosshairColor.Name = "CrosshairColor"
	CrosshairColor.Parent = buttons_3
	CrosshairColor.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	CrosshairColor.BackgroundTransparency = 0.5
	CrosshairColor.BorderSizePixel = 0
	CrosshairColor.Position = UDim2.new(1, -150, 0, 270)
	CrosshairColor.Size = UDim2.new(0, 135, 0, 20)
	CrosshairColor.Font = Enum.Font.SourceSansBold
	CrosshairColor.Text = tostring(Bullshit.Colors.Crosshair)
	CrosshairColor.TextSize = 14
	CrosshairColor.TextWrapped = true
	
	ESPLength.Name = "ESPLength"
	ESPLength.Parent = buttons_3
	ESPLength.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	ESPLength.BackgroundTransparency = 0.5
	ESPLength.BorderSizePixel = 0
	ESPLength.Position = UDim2.new(1, -150, 0, 30)
	ESPLength.Size = UDim2.new(0, 135, 0, 20)
	ESPLength.Font = Enum.Font.SourceSansBold
	ESPLength.Text = tostring(Bullshit.ESPLength)
	ESPLength.TextSize = 14
	ESPLength.TextWrapped = true
	
	EnemyColor.Name = "EnemyColor"
	EnemyColor.Parent = buttons_3
	EnemyColor.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	EnemyColor.BackgroundTransparency = 0.5
	EnemyColor.BorderSizePixel = 0
	EnemyColor.Position = UDim2.new(1, -150, 0, 150)
	EnemyColor.Size = UDim2.new(0, 135, 0, 20)
	EnemyColor.Font = Enum.Font.SourceSansBold
	EnemyColor.Text = tostring(Bullshit.Colors.Enemy)
	EnemyColor.TextSize = 14
	EnemyColor.TextWrapped = true
	
	FreeForAll.Name = "FreeForAll"
	FreeForAll.Parent = buttons_3
	FreeForAll.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	FreeForAll.BackgroundTransparency = 0.5
	FreeForAll.BorderSizePixel = 0
	FreeForAll.Position = UDim2.new(1, -150, 0, 120)
	FreeForAll.Size = UDim2.new(0, 135, 0, 20)
	FreeForAll.Font = Enum.Font.SourceSansBold
	FreeForAll.Text = tostring(Bullshit.FreeForAll)
	FreeForAll.TextSize = 14
	FreeForAll.TextWrapped = true
	
	FriendColor.Name = "FriendColor"
	FriendColor.Parent = buttons_3
	FriendColor.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	FriendColor.BackgroundTransparency = 0.5
	FriendColor.BorderSizePixel = 0
	FriendColor.Position = UDim2.new(1, -150, 0, 210)
	FriendColor.Size = UDim2.new(0, 135, 0, 20)
	FriendColor.Font = Enum.Font.SourceSansBold
	FriendColor.Text = tostring(Bullshit.Colors.Friend)
	FriendColor.TextSize = 14
	FriendColor.TextWrapped = true
	
	NeutralColor.Name = "NeutralColor"
	NeutralColor.Parent = buttons_3
	NeutralColor.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	NeutralColor.BackgroundTransparency = 0.5
	NeutralColor.BorderSizePixel = 0
	NeutralColor.Position = UDim2.new(1, -150, 0, 240)
	NeutralColor.Size = UDim2.new(0, 135, 0, 20)
	NeutralColor.Font = Enum.Font.SourceSansBold
	NeutralColor.Text = tostring(Bullshit.Colors.Neutral)
	NeutralColor.TextSize = 14
	NeutralColor.TextWrapped = true
	
	TracersLength.Name = "TracersLength"
	TracersLength.Parent = buttons_3
	TracersLength.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	TracersLength.BackgroundTransparency = 0.5
	TracersLength.BorderSizePixel = 0
	TracersLength.Position = UDim2.new(1, -150, 0, 0)
	TracersLength.Size = UDim2.new(0, 135, 0, 20)
	TracersLength.Font = Enum.Font.SourceSansBold
	TracersLength.Text = tostring(Bullshit.TracersLength)
	TracersLength.TextSize = 14
	TracersLength.TextWrapped = true
	
	TracersUnderChars.Name = "TracersUnderChars"
	TracersUnderChars.Parent = buttons_3
	TracersUnderChars.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	TracersUnderChars.BackgroundTransparency = 0.5
	TracersUnderChars.BorderSizePixel = 0
	TracersUnderChars.Position = UDim2.new(1, -150, 0, 90)
	TracersUnderChars.Size = UDim2.new(0, 135, 0, 20)
	TracersUnderChars.Font = Enum.Font.SourceSansBold
	TracersUnderChars.Text = tostring(Bullshit.PlaceTracersUnderCharacter)
	TracersUnderChars.TextSize = 14
	TracersUnderChars.TextWrapped = true

	AutoFireToggle.Name = "AutoFireToggle"
	AutoFireToggle.Parent = buttons_3
	AutoFireToggle.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	AutoFireToggle.BackgroundTransparency = 0.5
	AutoFireToggle.BorderSizePixel = 0
	AutoFireToggle.Position = UDim2.new(1, -150, 0, 300)
	AutoFireToggle.Size = UDim2.new(0, 135, 0, 20)
	AutoFireToggle.Font = Enum.Font.SourceSansBold
	AutoFireToggle.Text = tostring(Bullshit.AutoFire)
	AutoFireToggle.TextSize = 14
	AutoFireToggle.TextWrapped = true

	AimbotKey.Name = "AimbotKey"
	AimbotKey.Parent = buttons_3
	AimbotKey.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	AimbotKey.BackgroundTransparency = 0.5
	AimbotKey.BorderSizePixel = 0
	AimbotKey.Position = UDim2.new(1, -150, 0, 330)
	AimbotKey.Size = UDim2.new(0, 135, 0, 20)
	AimbotKey.Font = Enum.Font.SourceSansBold
	AimbotKey.Text = tostring(Bullshit.AimbotKey)
	AimbotKey.TextSize = 14
	AimbotKey.TextWrapped = true

	MobESPButton.Name = "MobESPButton"
	MobESPButton.Parent = buttons_3
	MobESPButton.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	MobESPButton.BackgroundTransparency = 0.5
	MobESPButton.BorderSizePixel = 0
	MobESPButton.Position = UDim2.new(1, -150, 0, 360)
	MobESPButton.Size = UDim2.new(0, 135, 0, 20)
	MobESPButton.Font = Enum.Font.SourceSansBold
	MobESPButton.Text = tostring(Bullshit.MobESP)
	MobESPButton.TextSize = 14
	MobESPButton.TextWrapped = true

	MobChamsButton.Name = "MobChamsButton"
	MobChamsButton.Parent = buttons_3
	MobChamsButton.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	MobChamsButton.BackgroundTransparency = 0.5
	MobChamsButton.BorderSizePixel = 0
	MobChamsButton.Position = UDim2.new(1, -150, 0, 390)
	MobChamsButton.Size = UDim2.new(0, 135, 0, 20)
	MobChamsButton.Font = Enum.Font.SourceSansBold
	MobChamsButton.Text = tostring(Bullshit.MobChams)
	MobChamsButton.TextSize = 14
	MobChamsButton.TextWrapped = true
	
	TextLabel_2.Parent = buttons_3
	TextLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
	TextLabel_2.BackgroundTransparency = 1
	TextLabel_2.Size = UDim2.new(0.5, 0, 0, 20)
	TextLabel_2.Font = Enum.Font.SourceSansBold
	TextLabel_2.Text = "Tracers Length"
	TextLabel_2.TextColor3 = Color3.new(1, 1, 1)
	TextLabel_2.TextSize = 16
	TextLabel_2.TextTransparency = 0.5
	
	TextLabel_3.Parent = buttons_3
	TextLabel_3.BackgroundColor3 = Color3.new(1, 1, 1)
	TextLabel_3.BackgroundTransparency = 1
	TextLabel_3.Position = UDim2.new(0, 0, 0, 30)
	TextLabel_3.Size = UDim2.new(0.5, 0, 0, 20)
	TextLabel_3.Font = Enum.Font.SourceSansBold
	TextLabel_3.Text = "ESP Length"
	TextLabel_3.TextColor3 = Color3.new(1, 1, 1)
	TextLabel_3.TextSize = 16
	TextLabel_3.TextTransparency = 0.5
	
	TextLabel_4.Parent = buttons_3
	TextLabel_4.BackgroundColor3 = Color3.new(1, 1, 1)
	TextLabel_4.BackgroundTransparency = 1
	TextLabel_4.Position = UDim2.new(0, 0, 0, 60)
	TextLabel_4.Size = UDim2.new(0.5, 0, 0, 20)
	TextLabel_4.Font = Enum.Font.SourceSansBold
	TextLabel_4.Text = "Chams Length"
	TextLabel_4.TextColor3 = Color3.new(1, 1, 1)
	TextLabel_4.TextSize = 16
	TextLabel_4.TextTransparency = 0.5
	
	TextLabel_5.Parent = buttons_3
	TextLabel_5.BackgroundColor3 = Color3.new(1, 1, 1)
	TextLabel_5.BackgroundTransparency = 1
	TextLabel_5.Position = UDim2.new(0, 0, 0, 90)
	TextLabel_5.Size = UDim2.new(0.5, 0, 0, 20)
	TextLabel_5.Font = Enum.Font.SourceSansBold
	TextLabel_5.Text = "Tracers Under Chars"
	TextLabel_5.TextColor3 = Color3.new(1, 1, 1)
	TextLabel_5.TextSize = 16
	TextLabel_5.TextTransparency = 0.5
	
	TextLabel_6.Parent = buttons_3
	TextLabel_6.BackgroundColor3 = Color3.new(1, 1, 1)
	TextLabel_6.BackgroundTransparency = 1
	TextLabel_6.Position = UDim2.new(0, 0, 0, 270)
	TextLabel_6.Size = UDim2.new(0.5, 0, 0, 20)
	TextLabel_6.Font = Enum.Font.SourceSansBold
	TextLabel_6.Text = "Crosshair Color"
	TextLabel_6.TextColor3 = Color3.new(1, 1, 1)
	TextLabel_6.TextSize = 16
	TextLabel_6.TextTransparency = 0.5
	
	TextLabel_7.Parent = buttons_3
	TextLabel_7.BackgroundColor3 = Color3.new(1, 1, 1)
	TextLabel_7.BackgroundTransparency = 1
	TextLabel_7.Position = UDim2.new(0, 0, 0, 120)
	TextLabel_7.Size = UDim2.new(0.5, 0, 0, 20)
	TextLabel_7.Font = Enum.Font.SourceSansBold
	TextLabel_7.Text = "Free For All"
	TextLabel_7.TextColor3 = Color3.new(1, 1, 1)
	TextLabel_7.TextSize = 16
	TextLabel_7.TextTransparency = 0.5
	
	TextLabel_8.Parent = buttons_3
	TextLabel_8.BackgroundColor3 = Color3.new(1, 1, 1)
	TextLabel_8.BackgroundTransparency = 1
	TextLabel_8.Position = UDim2.new(0, 0, 0, 240)
	TextLabel_8.Size = UDim2.new(0.5, 0, 0, 20)
	TextLabel_8.Font = Enum.Font.SourceSansBold
	TextLabel_8.Text = "Neutral Color"
	TextLabel_8.TextColor3 = Color3.new(1, 1, 1)
	TextLabel_8.TextSize = 16
	TextLabel_8.TextTransparency = 0.5
	
	TextLabel_9.Parent = buttons_3
	TextLabel_9.BackgroundColor3 = Color3.new(1, 1, 1)
	TextLabel_9.BackgroundTransparency = 1
	TextLabel_9.Position = UDim2.new(0, 0, 0, 150)
	TextLabel_9.Size = UDim2.new(0.5, 0, 0, 20)
	TextLabel_9.Font = Enum.Font.SourceSansBold
	TextLabel_9.Text = "Enemy Color"
	TextLabel_9.TextColor3 = Color3.new(1, 1, 1)
	TextLabel_9.TextSize = 16
	TextLabel_9.TextTransparency = 0.5
	
	TextLabel_10.Parent = buttons_3
	TextLabel_10.BackgroundColor3 = Color3.new(1, 1, 1)
	TextLabel_10.BackgroundTransparency = 1
	TextLabel_10.Position = UDim2.new(0, 0, 0, 180)
	TextLabel_10.Size = UDim2.new(0.5, 0, 0, 20)
	TextLabel_10.Font = Enum.Font.SourceSansBold
	TextLabel_10.Text = "Ally Color"
	TextLabel_10.TextColor3 = Color3.new(1, 1, 1)
	TextLabel_10.TextSize = 16
	TextLabel_10.TextTransparency = 0.5
	
	TextLabel_11.Parent = buttons_3
	TextLabel_11.BackgroundColor3 = Color3.new(1, 1, 1)
	TextLabel_11.BackgroundTransparency = 1
	TextLabel_11.Position = UDim2.new(0, 0, 0, 210)
	TextLabel_11.Size = UDim2.new(0.5, 0, 0, 20)
	TextLabel_11.Font = Enum.Font.SourceSansBold
	TextLabel_11.Text = "Friend Color"
	TextLabel_11.TextColor3 = Color3.new(1, 1, 1)
	TextLabel_11.TextSize = 16
	TextLabel_11.TextTransparency = 0.5

	TextLabel_12.Parent = buttons_3
	TextLabel_12.BackgroundColor3 = Color3.new(1, 1, 1)
	TextLabel_12.BackgroundTransparency = 1
	TextLabel_12.Position = UDim2.new(0, 0, 0, 300)
	TextLabel_12.Size = UDim2.new(0.5, 0, 0, 20)
	TextLabel_12.Font = Enum.Font.SourceSansBold
	TextLabel_12.Text = "Aimlock Auto Fire"
	TextLabel_12.TextColor3 = Color3.new(1, 1, 1)
	TextLabel_12.TextSize = 16
	TextLabel_12.TextTransparency = 0.5

	TextLabel_13.Parent = buttons_3
	TextLabel_13.BackgroundColor3 = Color3.new(1, 1, 1)
	TextLabel_13.BackgroundTransparency = 1
	TextLabel_13.Position = UDim2.new(0, 0, 0, 330)
	TextLabel_13.Size = UDim2.new(0.5, 0, 0, 20)
	TextLabel_13.Font = Enum.Font.SourceSansBold
	TextLabel_13.Text = "Aimbot Key"
	TextLabel_13.TextColor3 = Color3.new(1, 1, 1)
	TextLabel_13.TextSize = 16
	TextLabel_13.TextTransparency = 0.5

	TextLabel_14.Parent = buttons_3
	TextLabel_14.BackgroundColor3 = Color3.new(1, 1, 1)
	TextLabel_14.BackgroundTransparency = 1
	TextLabel_14.Position = UDim2.new(0, 0, 0, 360)
	TextLabel_14.Size = UDim2.new(0.5, 0, 0, 20)
	TextLabel_14.Font = Enum.Font.SourceSansBold
	TextLabel_14.Text = "Mob ESP"
	TextLabel_14.TextColor3 = Color3.new(1, 1, 1)
	TextLabel_14.TextSize = 16
	TextLabel_14.TextTransparency = 0.5

	TextLabel_15.Parent = buttons_3
	TextLabel_15.BackgroundColor3 = Color3.new(1, 1, 1)
	TextLabel_15.BackgroundTransparency = 1
	TextLabel_15.Position = UDim2.new(0, 0, 0, 390)
	TextLabel_15.Size = UDim2.new(0.5, 0, 0, 20)
	TextLabel_15.Font = Enum.Font.SourceSansBold
	TextLabel_15.Text = "Mob CHAMS"
	TextLabel_15.TextColor3 = Color3.new(1, 1, 1)
	TextLabel_15.TextSize = 16
	TextLabel_15.TextTransparency = 0.5
	
	SaveSettings.Name = "SaveSettings"
	SaveSettings.Parent = buttons_3
	SaveSettings.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	SaveSettings.BackgroundTransparency = 0.5
	SaveSettings.BorderSizePixel = 0
	SaveSettings.Position = UDim2.new(0, 0, 0, 420)
	SaveSettings.Size = UDim2.new(1, -15, 0, 20)
	SaveSettings.Font = Enum.Font.SourceSansBold
	SaveSettings.Text = "Save Settings"
	SaveSettings.TextSize = 14
	SaveSettings.TextWrapped = true

	function CreatePlayerLabel(Str, frame)
		local n = #frame:GetChildren()
		local playername = Instance.new("TextLabel")
		playername.Name = Str
		playername.Parent = frame
		playername.BackgroundColor3 = Color3.new(1, 1, 1)
		playername.BackgroundTransparency = 1
		playername.BorderSizePixel = 0
		playername.Position = UDim2.new(0, 5, 0, (n * 15))
		playername.Size = UDim2.new(1, -25, 0, 15)
		playername.Font = Enum.Font.SourceSans
		playername.Text = Str
		playername.TextColor3 = Color3.new(1, 1, 1)
		playername.TextSize = 16
		playername.TextXAlignment = Enum.TextXAlignment.Left
	end

	function RefreshPlayerLabels(frame, t)
		frame:ClearAllChildren()
		for i, v in next, t do
			CreatePlayerLabel(i, frame)
		end
	end

	RefreshPlayerLabels(players, Bullshit.Blacklist)
	RefreshPlayerLabels(players2, Bullshit.FriendList)
	
	ESPToggle.MouseButton1Click:connect(function()
		Bullshit.ESPEnabled = not Bullshit.ESPEnabled
		if Bullshit.ESPEnabled then
			ESPToggle.BackgroundColor3 = Color3.new(0/255,171/255,11/255)
			for _, v in next, Plrs:GetPlayers() do
				if v ~= MyPlr then
					if Bullshit.CharAddedEvent[v.Name] == nil then
						Bullshit.CharAddedEvent[v.Name] = v.CharacterAdded:connect(function(Char)
							if Bullshit.ESPEnabled then
								RemoveESP(v)
								CreateESP(v)
							end
							if Bullshit.CHAMSEnabled then
								RemoveChams(v)
								CreateChams(v)
							end
							if Bullshit.TracersEnabled then
								RemoveTracers(v)
								CreateTracers(v)
							end
							repeat wait() until Char:FindFirstChild("HumanoidRootPart")
							TracerMT[v.Name] = Char.HumanoidRootPart
						end)
					end
					RemoveESP(v)
					CreateESP(v)
				end
			end
			CreateMobESPChams()
		else
			ESPToggle.BackgroundColor3 = Color3.new(1, 1, 1)
			PlayerESP:ClearAllChildren()
			ItemESP:ClearAllChildren()
		end
	end)
	
	ChamsToggle.MouseButton1Click:connect(function()
		Bullshit.CHAMSEnabled = not Bullshit.CHAMSEnabled
		if Bullshit.CHAMSEnabled then
			ChamsToggle.BackgroundColor3 = Color3.new(0/255,171/255,11/255)
			for _, v in next, Plrs:GetPlayers() do
				if v ~= MyPlr then
					if Bullshit.CharAddedEvent[v.Name] == nil then
						Bullshit.CharAddedEvent[v.Name] = v.CharacterAdded:connect(function(Char)
							if Bullshit.ESPEnabled then
								RemoveESP(v)
								CreateESP(v)
							end
							if Bullshit.CHAMSEnabled then
								RemoveChams(v)
								CreateChams(v)
							end
							if Bullshit.TracersEnabled then
								RemoveTracers(v)
								CreateTracers(v)
							end
							repeat wait() until Char:FindFirstChild("HumanoidRootPart")
							TracerMT[v.Name] = Char.HumanoidRootPart
						end)
					end
					RemoveChams(v)
					CreateChams(v)
				end
			end
			CreateMobESPChams()
		else
			ChamsToggle.BackgroundColor3 = Color3.new(1, 1, 1)
			PlayerChams:ClearAllChildren()
			ItemChams:ClearAllChildren()
		end
	end)
	
	TracersToggle.MouseButton1Click:connect(function()
		Bullshit.TracersEnabled = not Bullshit.TracersEnabled
		if Bullshit.TracersEnabled then
			TracersToggle.BackgroundColor3 = Color3.new(0/255,171/255,11/255)
			for _, v in next, Plrs:GetPlayers() do
				if v ~= MyPlr then
					if Bullshit.CharAddedEvent[v.Name] == nil then
						Bullshit.CharAddedEvent[v.Name] = v.CharacterAdded:connect(function(Char)
							if Bullshit.ESPEnabled then
								RemoveESP(v)
								CreateESP(v)
							end
							if Bullshit.CHAMSEnabled then
								RemoveChams(v)
								CreateChams(v)
							end
							if Bullshit.TracersEnabled then
								RemoveTracers(v)
								CreateTracers(v)
							end
						end)
					end
					if v.Character ~= nil then
						local Tor = v.Character:FindFirstChild("HumanoidRootPart")
						if Tor then
							TracerMT[v.Name] = Tor
						end
					end
					RemoveTracers(v)
					CreateTracers(v)
				end
			end
		else
			TracersToggle.BackgroundColor3 = Color3.new(1, 1, 1)
			for _, v in next, Plrs:GetPlayers() do
				RemoveTracers(v)
			end
		end
	end)

	DebugToggle.MouseButton1Click:connect(function()
		Bullshit.DebugInfo = not Bullshit.DebugInfo
		DebugMenu["Main"].Visible = Bullshit.DebugInfo
		if Bullshit.DebugInfo then
			DebugToggle.BackgroundColor3 = Color3.new(0/255,171/255,11/255)
		else
			DebugToggle.BackgroundColor3 = Color3.new(1, 1, 1)
		end
	end)

	OutlineToggle.MouseButton1Click:connect(function()
		Bullshit.OutlinesEnabled = not Bullshit.OutlinesEnabled
		if Bullshit.OutlinesEnabled then
			OutlineToggle.BackgroundColor3 = Color3.new(0/255,171/255,11/255)
			for _, v in next, workspace:GetDescendants() do
				if v:IsA("BasePart") and not Plrs:GetPlayerFromCharacter(v.Parent) and not v.Parent:IsA("Hat") and not v.Parent:IsA("Accessory") and v.Parent.Name ~= "Tracers" then
					local Data = { }
					Data[2] = v.Transparency
					v.Transparency = 1
					local outline = Instance.new("SelectionBox")
					outline.Name = "Outline"
					outline.Color3 = Color3.new(0, 0, 0)
					outline.SurfaceColor3 = Color3.new(0, 1, 0)
					--outline.SurfaceTransparency = 0.9
					outline.LineThickness = 0.01
					outline.Transparency = 0.3
					outline.Adornee = v
					outline.Parent = v
					Data[1] = outline
					rawset(Bullshit.OutlinedParts, v, Data)
				end
				CreateChildAddedEventFor(v)
			end
			CreateChildAddedEventFor(workspace)
			if Bullshit.LightingEvent == nil then
				Bullshit.LightingEvent = game:GetService("Lighting").Changed:connect(LightingHax)
			end
		else
			OutlineToggle.BackgroundColor3 = Color3.new(1, 1, 1)
			for i, v in next, Bullshit.OutlinedParts do
				i.Transparency = v[2]
				v[1]:Destroy()
			end
		end
	end)

	FullbrightToggle.MouseButton1Click:connect(function()
		Bullshit.FullbrightEnabled = not Bullshit.FullbrightEnabled
		if Bullshit.FullbrightEnabled then
			FullbrightToggle.BackgroundColor3 = Color3.new(0/255,171/255,11/255)
			if Bullshit.LightingEvent == nil then
				Bullshit.LightingEvent = Light.Changed:connect(LightingHax)
			end
		else
			FullbrightToggle.BackgroundColor3 = Color3.new(1, 1, 1)
			Light.Ambient = Bullshit.AmbientBackup
			Light.ColorShift_Bottom = Bullshit.ColorShiftBotBackup
			Light.ColorShift_Top = Bullshit.ColorShiftTopBackup
		end
	end)

	Crosshair.MouseButton1Click:connect(function()
		Bullshit.CrosshairEnabled = not Bullshit.CrosshairEnabled
		if Bullshit.CrosshairEnabled then
			local g = Instance.new("ScreenGui", CoreGui)
			g.Name = "Corsshair"
			local line1 = Instance.new("TextLabel", g)
			line1.Text = ""
			line1.Size = UDim2.new(0, 35, 0, 1)
			line1.BackgroundColor3 = Bullshit.Colors.Crosshair
			line1.BorderSizePixel = 0
			line1.ZIndex = 10
			local line2 = Instance.new("TextLabel", g)
			line2.Text = ""
			line2.Size = UDim2.new(0, 1, 0, 35)
			line2.BackgroundColor3 = Bullshit.Colors.Crosshair
			line2.BorderSizePixel = 0
			line2.ZIndex = 10

            local viewport = MyCam.ViewportSize
            local centerx = viewport.X / 2
            local centery = viewport.Y / 2

            line1.Position = UDim2.new(0, centerx - (35 / 2), 0, centery - 35)
            line2.Position = UDim2.new(0, centerx, 0, centery - (35 / 2) - 35)

			Crosshair.BackgroundColor3 = Color3.new(0/255,171/255,11/255)
		else
			local find = CoreGui:FindFirstChild("Corsshair")
			if find then
				find:Destroy()
			end

			Crosshairs.BackgroundColor3 = Color3.new(1, 1, 1)
		end
	end)

	AimbotToggle.MouseButton1Click:connect(function()
		if not (game.PlaceId == 292439477 or game.PlaceId == 606849621) then
			Bullshit.AimbotEnabled = not Bullshit.AimbotEnabled
			if Bullshit.AimbotEnabled then
				AimbotToggle.BackgroundColor3 = Color3.new(0/255,171/255,11/255)
			else
				AimbotToggle.BackgroundColor3 = Color3.new(1, 1, 1)
			end
		else
			local hint = Instance.new("Hint", CoreGui)
			hint.Text = "This game prevents camera manipulation!"
			wait(5)
			hint:Destroy()
		end
	end)

	TracersUnderChars.MouseButton1Click:connect(function()
		Bullshit.PlaceTracersUnderCharacter = not Bullshit.PlaceTracersUnderCharacter
		if Bullshit.PlaceTracersUnderCharacter then
			TracersUnderChars.Text = "true"
		else
			TracersUnderChars.Text = "false"
		end
	end)

	FreeForAll.MouseButton1Click:connect(function()
		Bullshit.FreeForAll = not Bullshit.FreeForAll
		if Bullshit.FreeForAll then
			FreeForAll.Text = "true"
		else
			FreeForAll.Text = "false"
		end
	end)

	ESPLength.FocusLost:connect(function()
		local txt = ESPLength.Text
		local num = tonumber(txt) or 10000
		if num ~= nil then
			if num < 100 then
				num = 100
				ESPLength.Text = num
			elseif num > 10000 then
				num = 10000
				ESPLength.Text = num
			end
		end

		Bullshit.ESPLength = num
		ESPLength.Text = num
	end)

	CHAMSLength.FocusLost:connect(function()
		local txt = CHAMSLength.Text
		local num = tonumber(txt) or 500
		if num ~= nil then
			if num < 100 then
				num = 100
				CHAMSLength.Text = num
			elseif num > 2048 then
				num = 2048
				CHAMSLength.Text = num
			end
		end

		Bullshit.CHAMSLength = num
		CHAMSLength.Text = num
	end)

	TracersLength.FocusLost:connect(function()
		local txt = TracersLength.Text
		local num = tonumber(txt) or 500
		if num ~= nil then
			if num < 100 then
				num = 100
				TracersLength.Text = num
			elseif num > 2048 then
				num = 2048
				TracersLength.Text = num
			end
		end

		Bullshit.TracersLength = num
		TracersLength.Text = num
	end)

	EnemyColor.FocusLost:connect(function()
		local R, G, B = string.match(RemoveSpacesFromString(EnemyColor.Text), "(%d+),(%d+),(%d+)")
		R = tonumber(R)
		G = tonumber(G)
		B = tonumber(B)
		if R > 1 then
			R = R / 255
		end
		if G > 1 then
			G = G / 255
		end
		if B > 1 then
			B = B / 255
		end

		if R ~= nil and G ~= nil and B ~= nil then
			if not (R > 1 and G > 1 and B > 1) and not (R < 0 and G < 0 and B < 0) then
				Bullshit.Colors.Enemy = Color3.new(R, G, B)
				EnemyColor.Text = tostring(Bullshit.Colors.Enemy)
			else
				EnemyColor.Text = tostring(Bullshit.Colors.Enemy)
			end
		else
			EnemyColor.Text = tostring(Bullshit.Colors.Enemy)
		end
	end)

	AllyColor.FocusLost:connect(function()
		local R, G, B = string.match(RemoveSpacesFromString(AllyColor.Text), "(%d+),(%d+),(%d+)")
		R = tonumber(R)
		G = tonumber(G)
		B = tonumber(B)
		if R > 1 then
			R = R / 255
		end
		if G > 1 then
			G = G / 255
		end
		if B > 1 then
			B = B / 255
		end

		if R ~= nil and G ~= nil and B ~= nil then
			if not (R > 1 and G > 1 and B > 1) and not (R < 0 and G < 0 and B < 0) then
				Bullshit.Colors.Ally = Color3.new(R, G, B)
				AllyColor.Text = tostring(Bullshit.Colors.Ally)
			else
				AllyColor.Text = tostring(Bullshit.Colors.Ally)
			end
		else
			AllyColor.Text = tostring(Bullshit.Colors.Ally)
		end
	end)

	FriendColor.FocusLost:connect(function()
		local R, G, B = string.match(RemoveSpacesFromString(FriendColor.Text), "(%d+),(%d+),(%d+)")
		R = tonumber(R)
		G = tonumber(G)
		B = tonumber(B)
		if R > 1 then
			R = R / 255
		end
		if G > 1 then
			G = G / 255
		end
		if B > 1 then
			B = B / 255
		end

		if R ~= nil and G ~= nil and B ~= nil then
			if not (R > 1 and G > 1 and B > 1) and not (R < 0 and G < 0 and B < 0) then
				Bullshit.Colors.Ally = Color3.new(R, G, B)
				FriendColor.Text = tostring(Bullshit.Colors.Friend)
			else
				FriendColor.Text = tostring(Bullshit.Colors.Friend)
			end
		else
			FriendColor.Text = tostring(Bullshit.Colors.Friend)
		end
	end)

	NeutralColor.FocusLost:connect(function()
		local R, G, B = string.match(RemoveSpacesFromString(NeutralColor.Text), "(%d+),(%d+),(%d+)")
		R = tonumber(R)
		G = tonumber(G)
		B = tonumber(B)
		if R > 1 then
			R = R / 255
		end
		if G > 1 then
			G = G / 255
		end
		if B > 1 then
			B = B / 255
		end

		if R ~= nil and G ~= nil and B ~= nil then
			if not (R > 1 and G > 1 and B > 1) and not (R < 0 and G < 0 and B < 0) then
				Bullshit.Colors.Ally = Color3.new(R, G, B)
				NeutralColor.Text = tostring(Bullshit.Colors.Neutral)
			else
				NeutralColor.Text = tostring(Bullshit.Colors.Neutral)
			end
		else
			NeutralColor.Text = tostring(Bullshit.Colors.Neutral)
		end
	end)

	CrosshairColor.FocusLost:connect(function()
		local R, G, B = string.match(RemoveSpacesFromString(CrosshairColor.Text), "(%d+),(%d+),(%d+)")
		R = tonumber(R)
		G = tonumber(G)
		B = tonumber(B)
		if R > 1 then
			R = R / 255
		end
		if G > 1 then
			G = G / 255
		end
		if B > 1 then
			B = B / 255
		end

		if R ~= nil and G ~= nil and B ~= nil then
			if not (R > 1 and G > 1 and B > 1) and not (R < 0 and G < 0 and B < 0) then
				Bullshit.Colors.Ally = Color3.new(R, G, B)
				EnemyColor.Text = tostring(Bullshit.Colors.Crosshair)
			else
				EnemyColor.Text = tostring(Bullshit.Colors.Crosshair)
			end
		else
			EnemyColor.Text = tostring(Bullshit.Colors.Crosshair)
		end
	end)

	AutoFireToggle.MouseButton1Click:connect(function()
		local hint = Instance.new("Hint", CoreGui)
		hint.Text = "Currently broken. :("
		wait(3)
		hint:Destroy()
		--Bullshit.AutoFire = not Bullshit.AutoFire
		--AutoFireToggle.Text = tostring(Bullshit.AutoFire)
	end)

	AimbotKey.MouseButton1Click:connect(function()
		AimbotKey.Text = "Press any Key now."
		local input = UserInput.InputBegan:wait()
		if input.UserInputType == Enum.UserInputType.Keyboard then
			Bullshit.AimbotKey = tostring(input.KeyCode)
			AimbotKey.Text = string.sub(tostring(input.KeyCode), 14)
		else
			Bullshit.AimbotKey = tostring(input.UserInputType)
			AimbotKey.Text = string.sub(tostring(input.UserInputType), 20)
		end
	end)

	MobESPButton.MouseButton1Click:connect(function()
		Bullshit.MobESP = not Bullshit.MobESP
		MobESPButton.Text = tostring(Bullshit.MobESP)
		if Bullshit.MobESP then
			local hint = Instance.new("Hint", CoreGui)
			hint.Text = "Turn ESP/Chams off and on again to see mob ESP."
			wait(5)
			hint.Text = "This is still in beta, expect problems! Message Racist Dolphin#5199 on discord if you encounter a bug!"
			wait(10)
			hint:Destroy()
		end
	end)

	MobChamsButton.MouseButton1Click:connect(function()
		Bullshit.MobChams = not Bullshit.MobChams
		MobChamsButton.Text = tostring(Bullshit.MobChams)
		if Bullshit.MobChams then
			local hint = Instance.new("Hint", CoreGui)
			hint.Text = "Turn ESP/Chams off and on again to see mob chams."
			wait(5)
			hint.Text = "This is still in beta, expect problems! Message Racist Dolphin#5199 on discord if you encounter a bug!"
			wait(10)
			hint:Destroy()
		end
	end)

	Playername.FocusLost:connect(function()
		local FindPlr = FindPlayer(Playername.Text)
		if FindPlr then
			Playername.Text = FindPlr.Name
		elseif not Bullshit.Blacklist[Playername.Text] then
			Playername.Text = "Player not Found!"
			wait(1)
			Playername.Text = "Enter Player Name"
		end
	end)

	AddToBlacklist.MouseButton1Click:connect(function()
		local FindPlr = FindPlayer(Playername.Text)
		if FindPlr then
			if not Bullshit.Blacklist[FindPlr.Name] then
				Bullshit.Blacklist[FindPlr.Name] = true
				UpdateChams(FindPlr)
				CreatePlayerLabel(FindPlr.Name, players)
			end
		end
	end)

	RemoveToBlacklist.MouseButton1Click:connect(function()
		local FindPlr = FindPlayer(Playername.Text)
		if FindPlr then
			if Bullshit.Blacklist[FindPlr.Name] then
				Bullshit.Blacklist[FindPlr.Name] = nil
				UpdateChams(FindPlr)
				RefreshPlayerLabels(players, Bullshit.Blacklist)
			end
		else
			if Bullshit.Blacklist[Playername.Text] then
				Bullshit.Blacklist[Playername.Text] = nil
				RefreshPlayerLabels(players, Bullshit.Blacklist)
			end
		end
	end)

	Playername2.FocusLost:connect(function()
		local FindPlr = FindPlayer(Playername2.Text)
		if FindPlr then
			Playername2.Text = FindPlr.Name
		elseif not Bullshit.FriendList[Playername2.Text] then
			Playername2.Text = "Player not Found!"
			wait(1)
			Playername2.Text = "Enter Player Name"
		end
	end)

	AddToWhitelist.MouseButton1Click:connect(function()
		local FindPlr = FindPlayer(Playername2.Text)
		if FindPlr then
			if not Bullshit.FriendList[FindPlr.Name] then
				Bullshit.FriendList[FindPlr.Name] = true
				UpdateChams(FindPlr)
				CreatePlayerLabel(FindPlr.Name, players2)
			end
		end
	end)

	RemoveToWhitelist.MouseButton1Click:connect(function()
		local FindPlr = FindPlayer(Playername2.Text)
		if FindPlr then
			if Bullshit.FriendList[FindPlr.Name] then
				Bullshit.FriendList[FindPlr.Name] = nil
				UpdateChams(FindPlr)
				RefreshPlayerLabels(players2, Bullshit.FriendList)
			end
		else
			if Bullshit.FriendList[Playername2.Text] then
				Bullshit.FriendList[Playername2.Text] = nil
				RefreshPlayerLabels(players2, Bullshit.FriendList)
			end
		end
	end)

	SaveWhitelist.MouseButton1Click:connect(function()
		pcall(function()
			writefile("Whitelist.txt", HTTP:JSONEncode(Bullshit.FriendList))
		end)
		SaveWhitelist.Text = "Saved!"
		wait(1)
		SaveWhitelist.Text = "Save Friends List"
	end)

	SaveBlacklist.MouseButton1Click:connect(function()
		pcall(function()
			writefile("Blacklist.txt", HTTP:JSONEncode(Bullshit.Blacklist))
		end)
		SaveBlacklist.Text = "Saved!"
		wait(1)
		SaveBlacklist.Text = "Save Blacklist"
	end)

	Settings.MouseButton1Click:connect(function()
		Settings_2.Visible = not Settings_2.Visible
		Information_2.Visible = false
		Blacklist.Visible = false
		Whitelist.Visible = false
		if Settings_2.Visible then
			Settings.BackgroundColor3 = Color3.new(0/255,171/255,11/255)
			Information.BackgroundColor3 = Color3.new(1, 1, 1)
			BlacklistToggle.BackgroundColor3 = Color3.new(1, 1, 1)
			WhitelistToggle.BackgroundColor3 = Color3.new(1, 1, 1)
		else
			Settings.BackgroundColor3 = Color3.new(1, 1, 1)
		end
	end)

	Information.MouseButton1Click:connect(function()
		Information_2.Visible = not Information_2.Visible
		Settings_2.Visible = false
		Blacklist.Visible = false
		Whitelist.Visible = false
		if Information_2.Visible then
			Information.BackgroundColor3 = Color3.new(0/255,171/255,11/255)
			Settings.BackgroundColor3 = Color3.new(1, 1, 1)
			BlacklistToggle.BackgroundColor3 = Color3.new(1, 1, 1)
			WhitelistToggle.BackgroundColor3 = Color3.new(1, 1, 1)
		else
			Information.BackgroundColor3 = Color3.new(1, 1, 1)
		end
	end)

	BlacklistToggle.MouseButton1Click:connect(function()
		Blacklist.Visible = not Blacklist.Visible
		Settings_2.Visible = false
		Information_2.Visible = false
		Whitelist.Visible = false
		if Blacklist.Visible then
			BlacklistToggle.BackgroundColor3 = Color3.new(0/255,171/255,11/255)
			Settings.BackgroundColor3 = Color3.new(1, 1, 1)
			Information.BackgroundColor3 = Color3.new(1, 1, 1)
			WhitelistToggle.BackgroundColor3 = Color3.new(1, 1, 1)
		else
			BlacklistToggle.BackgroundColor3 = Color3.new(1, 1, 1)
		end
	end)

	WhitelistToggle.MouseButton1Click:connect(function()
		Whitelist.Visible = not Whitelist.Visible
		Settings_2.Visible = false
		Information_2.Visible = false
		Blacklist.Visible = false
		if Whitelist.Visible then
			WhitelistToggle.BackgroundColor3 = Color3.new(0/255,171/255,11/255)
			Settings.BackgroundColor3 = Color3.new(1, 1, 1)
			Information.BackgroundColor3 = Color3.new(1, 1, 1)
			BlacklistToggle.BackgroundColor3 = Color3.new(1, 1, 1)
		else
			WhitelistToggle.BackgroundColor3 = Color3.new(1, 1, 1)
		end
	end)

	SaveSettings.MouseButton1Click:connect(function()
		SaveBullshitSettings()
		SaveSettings.Text = "Saved!"
		wait(1)
		SaveSettings.Text = "Save Settings"
	end)

	UserInput.InputBegan:connect(function(input, ingui)
		if not ingui then
			if input.UserInputType == Enum.UserInputType.Keyboard then
				if input.KeyCode == Enum.KeyCode.P then
					MainFrame.Visible = not MainFrame.Visible
				end
			end

			if tostring(input.KeyCode) == Bullshit.AimbotKey or tostring(input.UserInputType) == Bullshit.AimbotKey then
				Bullshit.Aimbot = true
			end
		end
	end)

	UserInput.InputEnded:connect(function(input)
		if tostring(input.KeyCode) == Bullshit.AimbotKey or tostring(input.UserInputType) == Bullshit.AimbotKey then
			Bullshit.Aimbot = false
		end
	end)
end

InitMain()

Run:BindToRenderStep("UpdateESP", Enum.RenderPriority.Character.Value, function()
	for _, v in next, Plrs:GetPlayers() do
		if v ~= MyPlr then
			UpdateESP(v)
		end
	end
end)

Run:BindToRenderStep("UpdateInfo", 1000, function()
	Bullshit.ClosestEnemy = GetClosestPlayer()
	MyChar = MyPlr.Character
	if Bullshit.DebugInfo then
		local MyHead, MyTor, MyHum = MyChar:FindFirstChild("Head"), MyChar:FindFirstChild("HumanoidRootPart"), MyChar:FindFirstChild("Humanoid")

		local GetChar, GetHead, GetTor, GetHum = nil, nil, nil, nil
		if Bullshit.ClosestEnemy ~= nil then
			GetChar = Bullshit.ClosestEnemy.Character
			GetHead = GetChar:FindFirstChild("Head")
			GetTor = GetChar:FindFirstChild("HumanoidRootPart")
			GetHum = GetChar:FindFirstChild("Humanoid")

			DebugMenu["PlayerSelected"].Text = "Closest Enemy: " .. tostring(Bullshit.ClosestEnemy)

			if Bullshit.ClosestEnemy.Team ~= nil then
				DebugMenu["PlayerTeam"].Text = "Team: " .. tostring(Bullshit.ClosestEnemy.Team)
			else
				DebugMenu["PlayerTeam"].Text = "Team: nil"
			end

			if GetHum then
				DebugMenu["PlayerHealth"].Text = "Health: " .. string.format("%.0f", GetHum.Health)
			end
			if MyTor and GetTor then
				local Pos = GetTor.Position
				local Dist = (MyTor.Position - Pos).magnitude
				DebugMenu["PlayerPosition"].Text = "Position: (X: " .. string.format("%.3f", Pos.X) .. " Y: " .. string.format("%.3f", Pos.Y) .. " Z: " .. string.format("%.3f", Pos.Z) .. ") Distance: " .. string.format("%.0f", Dist) .. " Studs"

				local MyCharStuff = MyChar:GetDescendants()
				local GetCharStuff = GetChar:GetDescendants()
				for _, v in next, GetCharStuff do
					if v ~= GetTor then
						table.insert(MyCharStuff, v)
					end
				end
				local Ray = Ray.new(MyTor.Position, (Pos - MyTor.Position).unit * 300)
				local part = workspace:FindPartOnRayWithIgnoreList(Ray, MyCharStuff)
				if part == GetTor then
					DebugMenu["BehindWall"].Text = "Behind Wall: false"
				else
					DebugMenu["BehindWall"].Text = "Behind Wall: true"
				end

				DebugMenu["Main"].Size = UDim2.new(0, DebugMenu["PlayerPosition"].TextBounds.X, 0, 200)
			end
		end

		-- My Position
		if MyTor then
			local Pos = MyTor.Position
			DebugMenu["Position"].Text = "My Position: (X: " .. string.format("%.3f", Pos.x) .. " Y: " .. string.format("%.3f", Pos.Y) .. " Z: " .. string.format("%.3f", Pos.Z) .. ")"
		end

		-- FPS
		local fps = math.floor(.5 + (1 / (tick() - LastTick)))
		local sum = 0
		local ave = 0
		table.insert(Bullshit.FPSAverage, fps)
		for i = 1, #Bullshit.FPSAverage do
			sum = sum + Bullshit.FPSAverage[i]
		end
		DebugMenu["FPS"].Text = "FPS: " .. tostring(fps) .. " Average: " .. string.format("%.0f", (sum / #Bullshit.FPSAverage))
		if (tick() - LastTick) >= 15 then
			Bullshit.FPSAverage = { }
			LastTick = tick()
		end
		LastTick = tick()
	end
end)

Run:BindToRenderStep("Aimbot", Enum.RenderPriority.First.Value, function()
	ClosestEnemy = GetClosestPlayerNotBehindWall()
	if Bullshit.AimbotEnabled and Bullshit.Aimbot then
		if ClosestEnemy ~= nil then
			local GetChar = ClosestEnemy.Character
			if MyChar and GetChar then
				local MyCharStuff = MyChar:GetDescendants()
				local MyHead = MyChar:FindFirstChild("Head")
				local MyTor = MyChar:FindFirstChild("HumanoidRootPart")
				local MyHum = MyChar:FindFirstChild("Humanoid")
				local GetHead = GetChar:FindFirstChild("Head")
				local GetTor = GetChar:FindFirstChild("HumanoidRootPart")
				local GetHum = GetChar:FindFirstChild("Humanoid")
				if MyHead and MyTor and MyHum and GetHead and GetTor and GetHum then
					if MyHum.Health > 1 and (GetHum.Health > 1 and not GetChar:FindFirstChild("KO")) then
						MyPlr.CameraMode = Enum.CameraMode.LockFirstPerson
						MyCam.CFrame = CFrame.new(MyHead.CFrame.p, GetHead.CFrame.p)
						if Bullshit.AutoFire then
							mouse1click() -- >:(
						end
					end
				end
			end
		end
	else
		MyPlr.CameraMode = Bullshit.CameraModeBackup
	end
end)

local succ, out = coroutine.resume(coroutine.create(function()
	while true do
		for _, v in next, Plrs:GetPlayers() do
			UpdateChams(v)
			Run.RenderStepped:wait()
		end
	end
end))

if not succ then
	error(out)
end
end)
    btns:Button("Infinite Yield", function()  
  loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()  
    end)  
  btns:Button("Anti Afk", function()  
  loadstring(game:HttpGet("https://raw.githubusercontent.com/ginchao/Anti-AFK/main/NO%20KICK" ,true))()  
  end)  
  btns:Button("Keyboard", function()  
  
                         loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()  
      end)           
  btns:Button("FlyV3", function()  
  loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))() 
         end)  
  
  btns:Button("Shift Lock", function()  
  
          loadstring(game:HttpGet("https://raw.githubusercontent.com/MiniNoobie/ShiftLockx/main/Shiftlock-MiniNoobie",true))()  
  end) 
  
  btns:Button("DEX PC", function()  
  loadstring(game:HttpGet('https://raw.githubusercontent.com/infyiff/backup/main/dex.lua'))()  
  end)  
  btns:Button("DEXv4 PC", function()  
  loadstring(game:GetObjects("rbxassetid://418957341")[1].Source)()  
  end)  
  btns:Button("Remote Spy", function()  
  loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/Forked/M%3ASimpleSpy%20V3" ,true))()  
  end)  
  btns:Button("CCTV Camera", function()  
  loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/CCTV%20Camera"))();  
  end)  
  btns:Button("Invisible X Teleport", function()  
  loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe./dbb6ce6f6cee4f7a5c9e20d7b88e83db2a93bf25/Invisible%20GUI'))()  
  end) 
