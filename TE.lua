-- Code name "TE" © 2023 by zawadzki is licensed under CC BY-SA 4.0. To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/
local message = "TE is loaded, press V to open"
game.StarterGui:SetCore("SendNotification", {
    Title = "Made by zawadzki";
    Text = message;
    Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150";
    Duration = 5;
})

local gui = Instance.new("ScreenGui")
gui.Name = "TE"
gui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
gui.Enabled = false

local function toggleGUI()
gui.Enabled = not gui.Enabled
end

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
if input.KeyCode == Enum.KeyCode.V and not gameProcessed then
toggleGUI()
end
end)

local window = Instance.new("Frame")
window.Size = UDim2.new(0, 600, 0, 400)
window.Position = UDim2.new(0.5, -300, 0.5, -200)
window.BackgroundTransparency = 0
window.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
window.BorderSizePixel = 0
window.Parent = gui
gui.ResetOnSpawn = false


local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -30, 0, 0)
closeButton.Font = Enum.Font.SourceSansBold
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.Text = "X"
closeButton.TextSize = 15
closeButton.TextColor3 = Color3.new(255, 255, 255)
closeButton.BackgroundTransparency = 1
closeButton.Parent = window

-- connect a function to the close button to destroy the GUI
closeButton.MouseButton1Click:Connect(function()
    gui:Destroy()
    local message = "GUI destroyed."
game.StarterGui:SetCore("SendNotification", {
    Title = "TE";
    Text = message;
    Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150";
    Duration = 3;
})
end)

-- Make the frame draggable
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    window.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

window.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = window.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

window.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and dragInput == input then
    update(input)
end
end)



local logo = Instance.new("TextButton")
logo.Size = UDim2.new(0, 30, 0, 30)
logo.Position = UDim2.new(0, 0, 0, 0)
logo.Text = "TE"
logo.TextSize = 20
logo.TextColor3 = Color3.new(255, 255, 255)
logo.Font = Enum.Font.SciFi
logo.BackgroundTransparency = 1
logo.Parent = window


local rejoin = Instance.new("TextButton")
rejoin.Size = UDim2.new(0, 50, 0, 30)
rejoin.Position = UDim2.new(0, 50, 0, 0)
rejoin.Text = "Rejoin"
rejoin.TextSize = 10
rejoin.TextColor3 = Color3.new(255, 255, 255)
rejoin.BackgroundTransparency = 0
rejoin.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
rejoin.BorderSizePixel = 0
rejoin.Parent = window

local reset = Instance.new("TextButton")
reset.Size = UDim2.new(0, 50, 0, 30)
reset.Position = UDim2.new(0, 100, 0, 0)
reset.Text = "Reset"
reset.TextSize = 10
reset.TextColor3 = Color3.new(255, 255, 255)
reset.BackgroundTransparency = 0
reset.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
reset.BorderSizePixel = 0
reset.Parent = window

rejoin.MouseButton1Click:Connect(function()
game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
end)

reset.MouseButton1Click:Connect(function()
game.Players.LocalPlayer.Character:BreakJoints()
end)

local name = game.Players.LocalPlayer.DisplayName
local filteringenabled = game.Workspace.FilteringEnabled

local welcome = Instance.new("TextLabel")
welcome.Size = UDim2.new(1, -20, 0, 30)
welcome.Position = UDim2.new(0, 8, 0, 30)
welcome.BackgroundTransparency = 0.8
welcome.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
welcome.BorderSizePixel = 0
welcome.Font = Enum.Font.SciFi
welcome.TextSize = 18
welcome.TextColor3 = Color3.fromRGB(255, 255, 255)
welcome.Text = "Welcome to TE, "..tostring(name)
welcome.BackgroundTransparency = 1
welcome.Parent = window

local textbox = Instance.new("TextBox")
textbox.Size = UDim2.new(1, -20, 0, 30)
textbox.Position = UDim2.new(0, 8, 0, 60)
textbox.BackgroundTransparency = 0.8
textbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textbox.BorderSizePixel = 0
textbox.Font = Enum.Font.SourceSans
textbox.TextSize = 18
textbox.TextColor3 = Color3.fromRGB(0, 0, 0)
textbox.PlaceholderText = "Enter commands here"
textbox.Text = ""
textbox.TextWrapped = true
textbox.Parent = window


textbox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        if textbox.Text == "killgui" then
            loadstring(game:HttpGet("https://paste.gg/p/anonymous/92b80b4300ee43af9800777c1777698e/files/4e47b4c5d9f64bdaa2f958ff489666af/raw"))()
        end
    end
end)

textbox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        if textbox.Text == "flygui" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FEZEUJSR/flyGUI/main/FlyGUI-1.txt"))()
        end
    end
end)

textbox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        if textbox.Text == "balls" then
            balls()
        end
    end
end)

textbox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        if textbox.Text == "iy" then
            loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
        end
    end
end)

textbox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        if textbox.Text == "placeid" then
            print("Current place ID:", game.PlaceId)
        end
    end
end)

textbox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        if textbox.Text == "cmdx" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()
        end
    end
end)

textbox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        if textbox.Text == "tpose" then
            loadstring(game:HttpGet("https://paste.gg/p/anonymous/2efbae7f0f3f4fe28300683344256ddb/files/4910f8a51865402b8a91529bca95849e/raw", true))()
        end
    end
end)






local time = Instance.new("TextLabel")
time.Size = UDim2.new(0, 200, 0, 30)
time.Position = UDim2.new(0, 370, 0, 0)
time.Text = "Server Time:"
time.TextSize = 8
time.TextColor3 = Color3.new(255, 255, 255)
time.BackgroundTransparency = 0.5
time.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
time.BorderSizePixel = 0
time.Parent = window

local size = Instance.new("TextLabel")
size.Size = UDim2.new(0, 100, 0, 30)
size.Position = UDim2.new(0, 270, 0, 0)
size.Text = "Server Size:"
size.TextSize = 8
size.TextColor3 = Color3.new(255, 255, 255)
size.BackgroundTransparency = 0.5
size.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
size.BorderSizePixel = 0
size.Parent = window

local fps = Instance.new("TextLabel")
fps.Size = UDim2.new(0, 50, 0, 30)
fps.Position = UDim2.new(0, 220, 0, 0)
fps.Text = "FPS:"
fps.TextSize = 8
fps.TextColor3 = Color3.new(255, 255, 255)
fps.BackgroundTransparency = 0.5
fps.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
fps.BorderSizePixel = 0
fps.Parent = window

local FE = Instance.new("TextLabel")
FE.Size = UDim2.new(0, 50, 0, 30)
FE.Position = UDim2.new(0, 170, 0, 0)
FE.Text = "FE: "..tostring(filteringenabled)
FE.TextSize = 8
FE.TextColor3 = Color3.new(255, 255, 255)
FE.BackgroundTransparency = 0.5
FE.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
FE.BorderSizePixel = 0
FE.Parent = window
local RunService = game:GetService("RunService")

spawn(function()
	while true do
		time.Text = "Server Time: "..tostring(game:GetService('Workspace').DistributedGameTime)
		wait(.5)
	end
end)

spawn(function()
	while true do
		size.Text = "Server Size: "..tostring(game:GetService('Players').NumPlayers)
		wait(.5)
	end
end)

spawn(function()
	RunService.RenderStepped:Connect(function(frame)
		fps.Text = "FPS: "..(math.round(1/frame))
	end)
end)



local execFrame = Instance.new("ScrollingFrame")
execFrame.Size = UDim2.new(0, 580, 0, 250)
execFrame.Position = UDim2.new(0, 8, 0, 105)
execFrame.BackgroundTransparency = 1
execFrame.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
execFrame.BorderSizePixel = 1
execFrame.ScrollBarThickness = 5
execFrame.Parent = window

local exec = Instance.new("TextBox")
exec.Size = UDim2.new(0, 580, 0, 860)
exec.BackgroundTransparency = 0.8
exec.Font = Enum.Font.SourceSans
exec.TextSize = 15
exec.TextColor3 = Color3.fromRGB(255, 255, 255)
exec.PlaceholderText = "--You can't put much here so use loadstrings.                                                                                                      --made by nek205"
exec.Text = ""
exec.TextWrapped = true
exec.TextXAlignment = Enum.TextXAlignment.Left
exec.TextYAlignment = Enum.TextYAlignment.Top
exec.ClearTextOnFocus = false
exec.Parent = execFrame


local runButton = Instance.new("TextButton")
runButton.Text = "Run"
runButton.Size = UDim2.new(0.2, 0, 0.1, 0)
runButton.Position = UDim2.new(0.5, -60, 1, -40)
runButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
runButton.BackgroundTransparency = 0.8
runButton.TextColor3 = Color3.fromRGB(0, 0, 0)
runButton.Parent = window
local isMinimized = false

runButton.MouseButton1Click:Connect(function()
    local script = exec.Text
    loadstring(script)()
end)


print("")