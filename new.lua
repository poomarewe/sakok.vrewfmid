-- Ichikawa Auto Farm Premium GUI - 24/7 SAFE VERSION (COMPLETE)
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- Remove any existing GUI
if Player.PlayerGui:FindFirstChild("IchikawaAutoFarmGUI") then
    Player.PlayerGui:FindFirstChild("IchikawaAutoFarmGUI"):Destroy()
end

-- Create main GUI
local GUI = Instance.new("ScreenGui")
GUI.Name = "IchikawaAutoFarmGUI"
GUI.ResetOnSpawn = false
GUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
GUI.Parent = Player.PlayerGui

-- Create main frame with dark background
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 350, 0, 350)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = GUI

-- Add green border glow effect
local BorderGlow = Instance.new("UIStroke")
BorderGlow.Color = Color3.fromRGB(0,0,0)
BorderGlow.Thickness = 1.5
BorderGlow.Parent = MainFrame

-- Add corner radius
local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 6)
Corner.Parent = MainFrame

-- Create title bar
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

-- Add corner radius to title bar
local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 6)
TitleCorner.Parent = TitleBar

-- Create title
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -40, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Text = "ICHIKAWA PREMIUM | 24/7 SAFE"
Title.Parent = TitleBar

-- Create close button
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Position = UDim2.new(1, -25, 0, 5)
CloseButton.BackgroundTransparency = 1
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 14
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Text = "×"
CloseButton.Parent = TitleBar

-- Create status display
local StatusDisplay = Instance.new("TextLabel")
StatusDisplay.Name = "StatusDisplay"
StatusDisplay.Size = UDim2.new(1, -40, 0, 20)
StatusDisplay.Position = UDim2.new(0, 20, 0, 45)
StatusDisplay.BackgroundTransparency = 1
StatusDisplay.Font = Enum.Font.GothamBold
StatusDisplay.TextSize = 14
StatusDisplay.TextColor3 = Color3.fromRGB(0, 255, 128)
StatusDisplay.Text = "STATUS: READY"
StatusDisplay.Parent = MainFrame

-- Create stats container
local StatsContainer = Instance.new("Frame")
StatsContainer.Name = "StatsContainer"
StatsContainer.Size = UDim2.new(1, -40, 0, 70)
StatsContainer.Position = UDim2.new(0, 20, 0, 67)
StatsContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
StatsContainer.BorderSizePixel = 0
StatsContainer.Parent = MainFrame

-- Add corner radius to stats container
local StatsCorner = Instance.new("UICorner")
StatsCorner.CornerRadius = UDim.new(0, 4)
StatsCorner.Parent = StatsContainer

-- Create stats labels
local function createStatLabel(name, text, posY)
    local Label = Instance.new("TextLabel")
    Label.Name = name
    Label.Size = UDim2.new(0.5, -10, 0, 20)
    Label.Position = UDim2.new(0, 10, 0, posY)
    Label.BackgroundTransparency = 1
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 12
    Label.TextColor3 = Color3.fromRGB(200, 200, 200)
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Text = text
    Label.Parent = StatsContainer
    
    local Value = Instance.new("TextLabel")
    Value.Name = name.."Value"
    Value.Size = UDim2.new(0.5, -10, 0, 20)
    Value.Position = UDim2.new(0.5, 0, 0, posY)
    Value.BackgroundTransparency = 1
    Value.Font = Enum.Font.GothamBold
    Value.TextSize = 12
    Value.TextColor3 = Color3.fromRGB(255, 255, 255)
    Value.TextXAlignment = Enum.TextXAlignment.Right
    Value.Text = "0"
    Value.Parent = StatsContainer
    
    return Value
end

local LapsValue = createStatLabel("Laps", "Laps Completed:", 5)
local RacesValue = createStatLabel("Races", "Races Completed:", 25)
local MoneyValue = createStatLabel("Money", "Money Earned:", 45)

-- Create farm buttons
local function createFarmButton(name, text, posY)
    local Button = Instance.new("TextButton")
    Button.Name = name
    Button.Size = UDim2.new(1, -40, 0, 35)
    Button.Position = UDim2.new(0, 20, 0, posY)
    Button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Button.BorderSizePixel = 0
    Button.Font = Enum.Font.GothamBold
    Button.TextSize = 14
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Text = text
    Button.Parent = MainFrame
    
    -- Add corner radius
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 4)
    ButtonCorner.Parent = Button
    
    -- Add hover effects
    Button.MouseEnter:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
    end)
    
    Button.MouseLeave:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
    end)
    
    Button.MouseButton1Down:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(0, 200, 100)}):Play()
    end)
    
    Button.MouseButton1Up:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
    end)
    
    return Button
end

local MoneyFarmButton = createFarmButton("MoneyFarmButton", "MONEY FARM ONLY", 145)
local LapsFarmButton = createFarmButton("LapsFarmButton", "LAPS FARM ONLY", 190)
local CombinedFarmButton = createFarmButton("CombinedFarmButton", "FARM LAPS AND MONEY AUTO", 235)
local StopAllButton = createFarmButton("StopAllButton", "STOP ALL FARMS", 280)

-- Make stop button red
StopAllButton.BackgroundColor3 = Color3.fromRGB(180, 30, 30)
StopAllButton.MouseEnter:Connect(function()
    TweenService:Create(StopAllButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(200, 40, 40)}):Play()
end)
StopAllButton.MouseLeave:Connect(function()
    TweenService:Create(StopAllButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(180, 30, 30)}):Play()
end)

-- Create session timer
local SessionTimer = Instance.new("TextLabel")
SessionTimer.Name = "SessionTimer"
SessionTimer.Size = UDim2.new(1, -40, 0, 20)
SessionTimer.Position = UDim2.new(0, 20, 0, 325)
SessionTimer.BackgroundTransparency = 1
SessionTimer.Font = Enum.Font.Gotham
SessionTimer.TextSize = 12
SessionTimer.TextColor3 = Color3.fromRGB(150, 150, 150)
SessionTimer.Text = "Session Time: 00:00:00"
SessionTimer.Parent = MainFrame

-- Function to toggle button state
local function toggleButtonState(button, active)
    if active then
        button.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
        button.Text = "STOP " .. string.gsub(button.Text, "STOP ", "")
    else
        button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        button.Text = string.gsub(button.Text, "STOP ", "")
    end
end

-- Function to reset all buttons
local function resetAllButtons()
    toggleButtonState(MoneyFarmButton, false)
    toggleButtonState(LapsFarmButton, false)
    toggleButtonState(CombinedFarmButton, false)
    StatusDisplay.Text = "STATUS: READY"
    StatusDisplay.TextColor3 = Color3.fromRGB(0, 255, 128)
end

-- Function to format numbers with commas
local function formatNumber(number)
    local formatted = tostring(number)
    local k
    while true do
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if k == 0 then break end
    end
    return formatted
end

-- ====================== 🔥 24/7 SAFETY SYSTEM 🔥 ======================

-- Enhanced global control system with force stop
_G.FARM_CONTROL = _G.FARM_CONTROL or {
    RaceLoopRunning = false,
    LapsTestLoop = false,
    CombinedFarmRunning = false,
    ForceStop = false,
    SafetyEnabled = true
}

-- Safety check function
local function shouldContinue(farmType)
    if _G.FARM_CONTROL.ForceStop then return false end
    if not _G.FARM_CONTROL.SafetyEnabled then return false end
    
    if farmType == "money" then
        return _G.FARM_CONTROL.RaceLoopRunning
    elseif farmType == "laps" then
        return _G.FARM_CONTROL.LapsTestLoop
    elseif farmType == "combined" then
        return _G.FARM_CONTROL.CombinedFarmRunning
    end
    
    return false
end

-- ====================== 🔥 CUSTOM CODE SECTION 🔥 ======================
-- PUT YOUR CUSTOM CODE HERE - RUNS AFTER PRESSING STOP ALL FARM
local function runCustomStopCode()
    -- 🔥 ADD YOUR CUSTOM CODE HERE 🔥
    
    print("🛑 Custom stop code executed!")
    
    -- Example custom actions (uncomment what you want):
    
    -- Teleport player to safe location
    pcall(function()
        local vim = game:GetService("VirtualInputManager")
        vim:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
        task.wait(0.1)
        vim:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
    end)
    
    -- Reset character (uncomment if needed)
    -- pcall(function()
    --     game:GetService("Players").LocalPlayer.Character:BreakJoints()
    -- end)
    
    -- Remove all vehicles (uncomment if needed)
    -- pcall(function()
    --     local deletecarargs = {[1] = "RemoveVehicle"}
    --     game:GetService("ReplicatedStorage"):WaitForChild("FrameworkEvent", 9e9):FireServer(unpack(deletecarargs))
    -- end)
    
    -- Custom notification
    notify("Custom Code", "Stop All Farm custom code executed!", 3)
    
    -- Add more custom code here as needed...
end

-- Script instance detection and cleanup
if _G.IchikawaAutoFarmRunning then
    -- Stop all previous farming loops
    _G.FARM_CONTROL.ForceStop = true
    _G.FARM_CONTROL.RaceLoopRunning = false
    _G.FARM_CONTROL.LapsTestLoop = false
    _G.FARM_CONTROL.CombinedFarmRunning = false
    
    -- Notify user
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Script Reloaded",
            Text = "Previous farm force stopped, reloading script...",
            Duration = 3
        })
    end)
    
    -- Wait for loops to terminate
    task.wait(2)
end

-- Mark this instance as running
_G.IchikawaAutoFarmRunning = true

-- Reset force stop for new instance
_G.FARM_CONTROL.ForceStop = false

-- Use global variables for loop control to allow cross-instance management
_G.RaceLoopRunning = false
_G.LapsTestLoop = false
_G.CombinedFarmRunning = false
_G.LapsFarmFirstTime = false

-- ====================== UTILITY FUNCTIONS ======================
-- Anti-AFK system
local antiAFK = game:service("VirtualUser")
game:service("Players").LocalPlayer.Idled:connect(function()
    if _G.FARM_CONTROL.SafetyEnabled then
        antiAFK:CaptureController()
        antiAFK:ClickButton2(Vector2.new())
        warn("✓ Anti-AFK activated")
    end
end)

-- Enhanced notification system
local function notify(title, text, duration)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = duration or 5
        })
    end)
end

-- Visual feedback system
local player = game:GetService("Players").LocalPlayer
local flashGui = Instance.new("ScreenGui")
flashGui.Name = "FarmFeedbackGui"
flashGui.ResetOnSpawn = false
flashGui.IgnoreGuiInset = true
flashGui.Parent = player:WaitForChild("PlayerGui")

local flashFrame = Instance.new("Frame")
flashFrame.Size = UDim2.new(1, 0, 1, 0)
flashFrame.BackgroundTransparency = 1
flashFrame.ZIndex = 999
flashFrame.BackgroundColor3 = Color3.new(1, 0, 0)
flashFrame.Parent = flashGui

local function flashColor(color)
    if _G.FARM_CONTROL.SafetyEnabled then
        flashFrame.BackgroundColor3 = color
        flashFrame.BackgroundTransparency = 0.5
        task.wait(0.3)
        flashFrame.BackgroundTransparency = 1
    end
end

-- Statistics tracking
local farmStats = {
    lapsCompleted = 0,
    racesCompleted = 0,
    moneyEarned = 0,
    startTime = 0,
    sessionDuration = 0
}

-- ====================== ENHANCED ERROR HANDLING ======================
local errorHandling = {
    maxRetries = 5,
    retryDelay = 3,
    errorCount = 0,
    lastErrorTime = 0,
    criticalErrors = 0
}

local function resetErrorCount()
    errorHandling.errorCount = 0
    errorHandling.criticalErrors = 0
end

local function handleError(errorMsg, isCritical)
    errorHandling.errorCount = errorHandling.errorCount + 1
    errorHandling.lastErrorTime = tick()
    
    if isCritical then
        errorHandling.criticalErrors = errorHandling.criticalErrors + 1
    end
    
    warn("⚠️ ERROR: " .. errorMsg)
    
    -- If too many critical errors, enable safety stop
    if errorHandling.criticalErrors >= 3 then
        _G.FARM_CONTROL.ForceStop = true
        notify("CRITICAL ERROR", "Too many critical errors. Force stopping all farms.", 10)
        return true
    end
    
    if errorHandling.errorCount >= errorHandling.maxRetries then
        notify("System Alert", "Multiple errors detected. Resetting farm...", 5)
        task.wait(2)
        errorHandling.errorCount = 0
        return true
    end
    
    notify("System Alert", "Error detected. Retrying in " .. errorHandling.retryDelay .. "s", 3)
    task.wait(errorHandling.retryDelay)
    return false
end

-- ====================== RACE ARGUMENTS ======================
local proxvoteargs = {
    [1] = "Goliath's Marathon",
    [2] = "Sprint",
    [3] = workspace:WaitForChild("Proximity Triggers", 9e9):WaitForChild(
        "Goliath's Marathon",
        9e9
    ):WaitForChild("Focus", 9e9),
    [4] = {
        ["Trigger"] = workspace:WaitForChild("Proximity Triggers", 9e9):WaitForChild(
            "Goliath's Marathon",
            9e9
        ):WaitForChild("Focus", 9e9),
        ["MaxRacers"] = 8
    },
    [5] = true
}

local proxstartargs = {
    [1] = "Goliath's Marathon",
    [2] = "Sprint",
    [3] = true,
    [4] = {
        ["Trigger"] = workspace:WaitForChild("Proximity Triggers", 9e9):WaitForChild(
            "Goliath's Marathon",
            9e9
        ):WaitForChild("Focus", 9e9),
        ["MaxRacers"] = 8
    },
    [5] = workspace:WaitForChild("Proximity Triggers", 9e9):WaitForChild(
        "Goliath's Marathon",
        9e9
    ):WaitForChild("Focus", 9e9)
}

-- 🔥 PUT YOUR CFRAME PATHS HERE 🔥
local newlapspath = {
    CFrame.new(253.22, 9.35, 3.91),
    CFrame.new(241.04, 9.35, 3.04),
    CFrame.new(204.20, 9.35, 0.59),
    CFrame.new(166.72, 9.35, 0.51),
    CFrame.new(128.43, 9.35, 2.25),
    CFrame.new(89.69, 9.35, 1.58),
    CFrame.new(51.77, 9.35, 1.20),
    CFrame.new(15.11, 9.35, 1.02),
    CFrame.new(-24.06, 9.35, 1.07),
    CFrame.new(-62.39, 9.35, 0.96),
    CFrame.new(-100.34, 9.35, -5.53),
    CFrame.new(-133.30, 9.35, -23.10),
    CFrame.new(-158.49, 9.35, -52.69),
    CFrame.new(-170.29, 9.35, -87.71),
    CFrame.new(-169.25, 9.35, -125.94),
    CFrame.new(-167.31, 9.35, -163.80),
    CFrame.new(-170.15, 9.35, -202.42),
    CFrame.new(-175.41, 9.35, -240.38),
    CFrame.new(-182.49, 9.35, -278.05),
    CFrame.new(-180.16, 9.35, -314.71),
    CFrame.new(-161.17, 9.35, -347.39),
    CFrame.new(-136.35, 9.35, -377.68),
    CFrame.new(-112.58, 9.35, -406.68),
    CFrame.new(-89.33, 9.91, -435.02),
    CFrame.new(-64.29, 11.62, -465.09),
    CFrame.new(-39.68, 14.42, -494.33),
    CFrame.new(-15.00, 17.76, -523.47),
    CFrame.new(9.77, 21.10, -552.54),
    CFrame.new(34.27, 24.40, -581.28),
    CFrame.new(59.39, 27.74, -610.04),
    CFrame.new(84.80, 31.05, -637.99),
    CFrame.new(110.31, 33.25, -665.96),
    CFrame.new(135.71, 33.62, -694.11),
    CFrame.new(160.92, 33.18, -723.53),
    CFrame.new(184.85, 32.77, -752.39),
    CFrame.new(204.69, 32.72, -785.55),
    CFrame.new(216.39, 32.76, -821.54),
    CFrame.new(219.81, 32.91, -859.21),
    CFrame.new(209.81, 32.90, -896.30),
    CFrame.new(194.51, 32.84, -930.95),
    CFrame.new(186.20, 32.76, -967.50),
    CFrame.new(180.39, 32.65, -1005.35),
    CFrame.new(179.73, 32.70, -1043.22),
    CFrame.new(185.09, 32.96, -1081.58),
    CFrame.new(192.37, 33.54, -1119.21),
    CFrame.new(199.71, 33.64, -1155.98),
    CFrame.new(207.40, 33.64, -1193.96),
    CFrame.new(214.76, 33.64, -1230.73),
    CFrame.new(222.36, 33.64, -1268.73),
    CFrame.new(229.72, 33.64, -1305.50),
    CFrame.new(237.24, 33.64, -1343.09),
    CFrame.new(244.52, 33.64, -1380.72),
    CFrame.new(248.07, 33.64, -1418.85),
    CFrame.new(246.76, 33.64, -1456.31),
    CFrame.new(241.98, 33.64, -1494.34),
    CFrame.new(235.51, 33.64, -1532.12),
    CFrame.new(229.09, 33.64, -1569.07),
    CFrame.new(222.24, 33.64, -1606.78),
    CFrame.new(215.00, 34.53, -1644.41),
    CFrame.new(207.48, 37.49, -1681.44),
    CFrame.new(200.09, 40.76, -1718.05),
    CFrame.new(192.44, 44.17, -1756.31),
    CFrame.new(185.34, 47.37, -1792.14),
    CFrame.new(177.85, 50.75, -1830.02),
    CFrame.new(170.43, 54.09, -1867.48),
    CFrame.new(162.78, 57.43, -1904.89),
    CFrame.new(155.25, 60.73, -1941.90),
    CFrame.new(147.79, 64.04, -1978.93),
    CFrame.new(140.29, 67.38, -2016.37),
    CFrame.new(132.96, 70.68, -2053.43),
    CFrame.new(125.49, 73.99, -2090.46),
    CFrame.new(117.69, 77.37, -2128.27),
    CFrame.new(109.98, 80.68, -2165.25),
    CFrame.new(102.41, 83.84, -2202.70),
    CFrame.new(94.50, 86.83, -2239.23),
    CFrame.new(85.70, 89.80, -2276.42),
    CFrame.new(76.16, 92.80, -2313.42),
    CFrame.new(65.65, 95.63, -2348.87),
    CFrame.new(52.94, 98.61, -2385.79),
    CFrame.new(38.85, 101.40, -2420.88),
    CFrame.new(22.30, 104.07, -2455.81),
    CFrame.new(3.53, 106.44, -2488.66),
    CFrame.new(-17.61, 108.51, -2519.55),
    CFrame.new(-42.20, 110.26, -2548.89),
    CFrame.new(-69.11, 111.58, -2574.96),
    CFrame.new(-98.99, 112.68, -2600.23),
    CFrame.new(-129.84, 113.35, -2621.53),
    CFrame.new(-164.13, 113.62, -2640.41),
    CFrame.new(-197.38, 113.61, -2655.87),
    CFrame.new(-233.06, 114.59, -2671.98),
    CFrame.new(-267.87, 116.28, -2685.79),
    CFrame.new(-305.39, 117.66, -2696.94),
    CFrame.new(-342.11, 118.94, -2707.86),
    CFrame.new(-377.19, 120.28, -2718.44),
    CFrame.new(-414.65, 121.72, -2729.79),
    CFrame.new(-451.44, 123.03, -2740.48),
    CFrame.new(-487.84, 124.39, -2749.38),
    CFrame.new(-524.93, 125.64, -2758.99),
    CFrame.new(-561.21, 126.88, -2768.42),
    CFrame.new(-598.99, 128.18, -2778.65),
    CFrame.new(-634.80, 129.40, -2789.69),
    CFrame.new(-670.66, 130.62, -2804.28),
    CFrame.new(-703.61, 131.56, -2822.93),
    CFrame.new(-734.04, 132.17, -2846.21),
    CFrame.new(-760.33, 132.44, -2873.48),
    CFrame.new(-783.58, 132.43, -2903.42),
    CFrame.new(-804.91, 132.24, -2935.24),
    CFrame.new(-821.90, 131.78, -2969.59),
    CFrame.new(-836.81, 131.87, -3003.99),
    CFrame.new(-851.55, 131.88, -3038.47),
    CFrame.new(-866.91, 131.70, -3074.49),
    CFrame.new(-881.44, 131.55, -3109.07),
    CFrame.new(-895.97, 131.48, -3143.64),
    CFrame.new(-910.86, 131.52, -3178.97),
    CFrame.new(-926.04, 131.48, -3213.26),
    CFrame.new(-943.04, 131.52, -3247.60),
    CFrame.new(-963.25, 131.55, -3281.15),
    CFrame.new(-985.47, 131.57, -3311.33),
    CFrame.new(-1011.27, 131.54, -3340.23),
    CFrame.new(-1038.79, 131.50, -3366.29),
    CFrame.new(-1067.99, 131.47, -3389.82),
    CFrame.new(-1099.66, 131.51, -3412.86),
    CFrame.new(-1130.88, 131.55, -3433.63),
    CFrame.new(-1162.81, 131.57, -3454.83),
    CFrame.new(-1194.98, 131.57, -3475.68),
    CFrame.new(-1227.22, 131.57, -3496.42),
    CFrame.new(-1258.61, 131.58, -3516.94),
    CFrame.new(-1289.96, 131.59, -3537.51),
    CFrame.new(-1323.06, 131.60, -3559.21),
    CFrame.new(-1355.04, 131.58, -3579.60),
    CFrame.new(-1386.73, 131.56, -3599.64),
    CFrame.new(-1418.89, 131.55, -3620.49),
    CFrame.new(-1451.15, 131.54, -3641.21),
    CFrame.new(-1484.32, 131.32, -3658.64),
    CFrame.new(-1520.83, 130.66, -3669.83),
    CFrame.new(-1559.06, 130.40, -3669.62),
    CFrame.new(-1595.72, 130.82, -3659.04),
    CFrame.new(-1627.21, 132.02, -3637.52),
    CFrame.new(-1649.04, 132.55, -3606.21),
    CFrame.new(-1661.99, 132.33, -3570.33),
    CFrame.new(-1662.18, 131.23, -3531.70),
    CFrame.new(-1653.21, 129.61, -3494.58),
    CFrame.new(-1642.13, 127.97, -3458.80),
    CFrame.new(-1631.08, 126.43, -3421.70),
    CFrame.new(-1620.27, 124.98, -3385.39),
    CFrame.new(-1609.25, 123.83, -3349.12),
    CFrame.new(-1597.79, 122.73, -3312.56),
    CFrame.new(-1586.69, 122.45, -3276.31),
    CFrame.new(-1575.78, 123.04, -3239.56),
    CFrame.new(-1565.32, 124.54, -3204.02),
    CFrame.new(-1554.28, 126.83, -3166.52),
    CFrame.new(-1543.39, 129.08, -3129.84),
    CFrame.new(-1532.44, 131.30, -3093.60),
    CFrame.new(-1521.23, 133.53, -3057.45),
    CFrame.new(-1509.97, 135.80, -3020.44),
    CFrame.new(-1498.85, 138.00, -2984.69),
    CFrame.new(-1487.54, 140.22, -2948.57),
    CFrame.new(-1476.31, 142.45, -2912.42),
    CFrame.new(-1465.12, 144.67, -2876.25),
    CFrame.new(-1453.83, 146.91, -2839.68),
    CFrame.new(-1442.66, 149.16, -2803.08),
    CFrame.new(-1431.71, 151.41, -2766.41),
    CFrame.new(-1420.82, 153.65, -2729.72),
    CFrame.new(-1409.62, 155.34, -2693.54),
    CFrame.new(-1398.58, 155.82, -2657.71),
    CFrame.new(-1387.35, 155.72, -2621.05),
    CFrame.new(-1375.63, 155.49, -2584.11),
    CFrame.new(-1364.50, 155.28, -2549.18),
    CFrame.new(-1352.36, 155.19, -2511.50),
    CFrame.new(-1340.77, 155.25, -2475.41),
    CFrame.new(-1330.00, 155.32, -2438.62),
    CFrame.new(-1322.67, 155.25, -2401.88),
    CFrame.new(-1319.13, 155.27, -2364.13),
    CFrame.new(-1321.27, 155.29, -2326.36),
    CFrame.new(-1329.56, 155.26, -2288.09),
    CFrame.new(-1339.90, 155.35, -2253.36),
    CFrame.new(-1352.05, 155.44, -2216.56),
    CFrame.new(-1364.17, 155.49, -2179.75),
    CFrame.new(-1375.92, 155.38, -2144.58),
    CFrame.new(-1389.03, 155.20, -2107.67),
    CFrame.new(-1401.75, 155.15, -2072.40),
    CFrame.new(-1414.17, 155.17, -2036.13),
    CFrame.new(-1426.57, 155.21, -2000.74),
    CFrame.new(-1437.59, 155.19, -1963.19),
    CFrame.new(-1439.46, 155.16, -1926.24),
    CFrame.new(-1434.30, 155.31, -1887.95),
    CFrame.new(-1417.15, 155.22, -1854.29),
    CFrame.new(-1393.47, 155.24, -1824.77),
    CFrame.new(-1363.56, 155.23, -1800.17),
    CFrame.new(-1334.09, 155.24, -1775.65),
    CFrame.new(-1305.19, 155.26, -1751.76),
    CFrame.new(-1274.59, 155.29, -1727.98),
    CFrame.new(-1244.31, 155.41, -1705.16),
    CFrame.new(-1214.34, 155.52, -1681.94),
    CFrame.new(-1184.58, 155.48, -1658.44),
    CFrame.new(-1154.56, 155.39, -1633.29),
    CFrame.new(-1130.02, 155.33, -1605.04),
    CFrame.new(-1112.19, 155.31, -1571.20),
    CFrame.new(-1102.20, 155.38, -1533.90),
    CFrame.new(-1101.34, 155.46, -1496.45),
    CFrame.new(-1109.80, 155.54, -1460.09),
    CFrame.new(-1128.87, 155.54, -1426.07),
    CFrame.new(-1154.88, 155.50, -1399.11),
    CFrame.new(-1187.08, 155.50, -1378.67),
    CFrame.new(-1223.76, 155.42, -1367.72),
    CFrame.new(-1261.98, 155.36, -1365.67),
    CFrame.new(-1299.86, 155.54, -1367.09),
    CFrame.new(-1337.70, 155.75, -1369.40),
    CFrame.new(-1375.88, 156.06, -1372.86),
    CFrame.new(-1414.52, 156.52, -1375.79),
    CFrame.new(-1451.09, 156.96, -1378.40),
    CFrame.new(-1490.15, 157.22, -1381.27),
    CFrame.new(-1527.52, 157.53, -1384.33),
    CFrame.new(-1566.13, 158.83, -1387.27),
    CFrame.new(-1603.47, 161.06, -1389.86),
    CFrame.new(-1640.75, 164.20, -1392.38),
    CFrame.new(-1678.79, 168.42, -1394.38),
    CFrame.new(-1716.75, 173.10, -1396.87),
    CFrame.new(-1753.87, 177.67, -1399.65),
    CFrame.new(-1791.82, 182.34, -1402.34),
    CFrame.new(-1828.95, 186.92, -1404.88),
    CFrame.new(-1867.74, 191.69, -1407.53),
    CFrame.new(-1904.87, 196.26, -1410.09),
    CFrame.new(-1942.83, 200.94, -1412.71),
    CFrame.new(-1979.55, 205.46, -1415.24),
    CFrame.new(-2017.89, 210.18, -1418.27),
    CFrame.new(-2055.88, 214.56, -1420.97),
    CFrame.new(-2093.98, 218.13, -1423.45),
    CFrame.new(-2130.92, 220.72, -1425.62),
    CFrame.new(-2169.96, 222.54, -1428.10),
    CFrame.new(-2207.78, 223.49, -1430.68),
    CFrame.new(-2245.61, 223.59, -1433.24),
    CFrame.new(-2283.85, 223.24, -1435.89),
    CFrame.new(-2321.66, 222.76, -1438.54),
    CFrame.new(-2359.87, 222.34, -1441.44),
    CFrame.new(-2398.07, 222.02, -1444.60),
    CFrame.new(-2436.32, 221.87, -1447.16),
    CFrame.new(-2473.80, 221.75, -1448.51),
    CFrame.new(-2512.81, 221.70, -1445.76),
    CFrame.new(-2549.64, 221.70, -1438.74),
    CFrame.new(-2585.48, 221.76, -1427.84),
    CFrame.new(-2620.65, 221.83, -1411.66),
    CFrame.new(-2651.78, 221.79, -1390.09),
    CFrame.new(-2680.58, 221.79, -1364.81),
    CFrame.new(-2705.68, 221.80, -1335.90),
    CFrame.new(-2727.16, 221.78, -1304.15),
    CFrame.new(-2747.97, 221.77, -1273.46),
    CFrame.new(-2769.05, 221.72, -1241.45),
    CFrame.new(-2790.28, 221.75, -1209.02),
    CFrame.new(-2810.85, 221.80, -1177.67),
    CFrame.new(-2831.97, 221.98, -1145.68),
    CFrame.new(-2853.27, 222.04, -1113.81),
    CFrame.new(-2874.06, 222.02, -1082.60),
    CFrame.new(-2895.49, 221.96, -1050.82),
    CFrame.new(-2918.44, 221.81, -1020.65),
    CFrame.new(-2944.87, 222.09, -992.33),
    CFrame.new(-2973.84, 222.67, -967.31),
    CFrame.new(-3006.70, 223.41, -947.61),
    CFrame.new(-3041.52, 224.43, -931.69),
    CFrame.new(-3077.42, 225.63, -921.04),
    CFrame.new(-3115.28, 226.94, -915.39),
    CFrame.new(-3153.54, 227.74, -916.33),
    CFrame.new(-3190.59, 228.13, -921.93),
    CFrame.new(-3227.93, 228.28, -930.51),
    CFrame.new(-3263.45, 227.93, -944.81),
    CFrame.new(-3297.52, 228.39, -962.36),
    CFrame.new(-3329.96, 229.68, -981.12),
    CFrame.new(-3363.54, 231.08, -999.55),
    CFrame.new(-3397.41, 232.72, -1017.41),
    CFrame.new(-3431.28, 234.37, -1035.27),
    CFrame.new(-3465.08, 236.13, -1053.28),
    CFrame.new(-3497.50, 237.82, -1071.21),
    CFrame.new(-3531.44, 239.53, -1089.83),
    CFrame.new(-3564.68, 240.98, -1108.01),
    CFrame.new(-3598.07, 242.27, -1125.94),
    CFrame.new(-3631.57, 243.56, -1143.66),
    CFrame.new(-3665.72, 244.88, -1161.93),
    CFrame.new(-3699.41, 246.18, -1180.17),
    CFrame.new(-3733.14, 247.48, -1198.35),
    CFrame.new(-3766.10, 248.76, -1216.19),
    CFrame.new(-3799.70, 250.06, -1234.60),
    CFrame.new(-3833.03, 251.37, -1253.48),
    CFrame.new(-3865.09, 252.67, -1274.44),
    CFrame.new(-3895.40, 253.96, -1297.84),
    CFrame.new(-3923.70, 255.20, -1322.43),
    CFrame.new(-3952.54, 256.50, -1348.87),
    CFrame.new(-3977.69, 257.69, -1376.09),
    CFrame.new(-4002.93, 258.92, -1405.47),
    CFrame.new(-4024.87, 260.09, -1436.79),
    CFrame.new(-4043.76, 261.19, -1469.64),
    CFrame.new(-4060.57, 262.25, -1503.60),
    CFrame.new(-4075.85, 263.27, -1538.74),
    CFrame.new(-4088.84, 264.25, -1574.75),
    CFrame.new(-4098.53, 265.15, -1612.26),
    CFrame.new(-4106.18, 265.97, -1648.53),
    CFrame.new(-4112.82, 266.79, -1686.69),
    CFrame.new(-4118.09, 267.60, -1724.23),
    CFrame.new(-4122.95, 268.73, -1761.40),
    CFrame.new(-4127.13, 270.14, -1799.89),
    CFrame.new(-4130.74, 272.30, -1837.57),
    CFrame.new(-4134.26, 275.01, -1875.23),
    CFrame.new(-4137.74, 277.74, -1913.30),
    CFrame.new(-4141.63, 280.48, -1951.34),
    CFrame.new(-4145.62, 283.18, -1988.95),
    CFrame.new(-4149.77, 285.89, -2026.54),
    CFrame.new(-4153.99, 288.62, -2064.55),
    CFrame.new(-4158.10, 291.33, -2102.14),
    CFrame.new(-4162.28, 294.09, -2140.55),
    CFrame.new(-4166.37, 296.80, -2178.14),
    CFrame.new(-4170.43, 299.50, -2215.75),
    CFrame.new(-4174.29, 302.21, -2253.38),
    CFrame.new(-4177.84, 304.91, -2291.03),
    CFrame.new(-4181.38, 307.65, -2329.10),
    CFrame.new(-4184.89, 310.35, -2366.76),
    CFrame.new(-4188.33, 313.00, -2403.59),
    CFrame.new(-4191.92, 315.79, -2442.49),
    CFrame.new(-4195.53, 318.21, -2480.15),
    CFrame.new(-4199.51, 319.72, -2517.83),
    CFrame.new(-4203.51, 320.21, -2555.53),
    CFrame.new(-4207.31, 320.04, -2593.26),
    CFrame.new(-4210.91, 319.60, -2631.42),
    CFrame.new(-4214.51, 319.16, -2669.17),
    CFrame.new(-4218.16, 318.86, -2706.91),
    CFrame.new(-4221.92, 318.71, -2745.06),
    CFrame.new(-4226.13, 318.65, -2783.16),
    CFrame.new(-4233.89, 318.71, -2821.07),
    CFrame.new(-4246.71, 318.78, -2857.17),
    CFrame.new(-4264.84, 318.80, -2890.42),
    CFrame.new(-4286.53, 318.88, -2921.50),
    CFrame.new(-4312.22, 318.99, -2949.31),
    CFrame.new(-4342.68, 318.99, -2972.56),
    CFrame.new(-4375.27, 319.10, -2992.64),
    CFrame.new(-4411.28, 319.11, -3006.82),
    CFrame.new(-4447.62, 319.00, -3014.01),
    CFrame.new(-4485.63, 319.06, -3018.99),
    CFrame.new(-4523.87, 319.18, -3021.49),
    CFrame.new(-4562.56, 319.33, -3023.36),
    CFrame.new(-4600.42, 319.63, -3025.22),
    CFrame.new(-4637.86, 319.98, -3027.07),
    CFrame.new(-4676.13, 320.41, -3029.17),
    CFrame.new(-4714.82, 320.82, -3031.12),
    CFrame.new(-4751.88, 321.05, -3032.69),
    CFrame.new(-4790.57, 320.99, -3034.43),
    CFrame.new(-4828.46, 320.66, -3036.09),
    CFrame.new(-4866.73, 320.30, -3038.02),
    CFrame.new(-4904.59, 319.94, -3040.14),
    CFrame.new(-4942.47, 319.68, -3041.70),
    CFrame.new(-4979.92, 319.49, -3043.53),
    CFrame.new(-5018.15, 319.34, -3046.23),
    CFrame.new(-5056.09, 319.09, -3053.72),
    CFrame.new(-5090.67, 318.98, -3070.07),
    CFrame.new(-5119.30, 318.99, -3095.28),
    CFrame.new(-5139.41, 319.07, -3126.80),
    CFrame.new(-5149.33, 319.20, -3163.19),
    CFrame.new(-5148.75, 319.39, -3202.25),
    CFrame.new(-5136.52, 319.60, -3238.41),
    CFrame.new(-5113.04, 319.69, -3267.93),
    CFrame.new(-5082.62, 319.83, -3290.39),
    CFrame.new(-5047.97, 319.94, -3307.74),
    CFrame.new(-5014.73, 320.04, -3324.17),
    CFrame.new(-4979.30, 320.08, -3340.87),
    CFrame.new(-4945.76, 320.12, -3356.68),
    CFrame.new(-4911.83, 320.15, -3372.64),
    CFrame.new(-4875.45, 320.10, -3388.19),
    CFrame.new(-4840.52, 319.90, -3400.63),
    CFrame.new(-4802.75, 319.77, -3410.97),
    CFrame.new(-4765.13, 319.60, -3415.37),
    CFrame.new(-4727.23, 319.46, -3415.01),
    CFrame.new(-4689.47, 319.46, -3411.78),
    CFrame.new(-4652.50, 319.61, -3405.56),
    CFrame.new(-4614.16, 319.69, -3397.58),
    CFrame.new(-4577.48, 319.76, -3389.82),
    CFrame.new(-4540.49, 319.78, -3381.52),
    CFrame.new(-4502.24, 319.72, -3373.15),
    CFrame.new(-4465.30, 319.59, -3364.61),
    CFrame.new(-4429.27, 319.40, -3355.90),
    CFrame.new(-4391.22, 319.34, -3346.68),
    CFrame.new(-4354.79, 319.28, -3337.85),
    CFrame.new(-4317.96, 319.27, -3328.92),
    CFrame.new(-4281.52, 319.28, -3320.10),
    CFrame.new(-4243.42, 319.28, -3310.92),
    CFrame.new(-4205.66, 319.29, -3302.23),
    CFrame.new(-4169.07, 319.33, -3296.31),
    CFrame.new(-4130.81, 319.33, -3294.27),
    CFrame.new(-4092.93, 319.30, -3295.63),
    CFrame.new(-4054.85, 319.31, -3299.89),
    CFrame.new(-4016.81, 319.33, -3307.23),
    CFrame.new(-3980.35, 319.35, -3317.57),
    CFrame.new(-3945.69, 319.31, -3331.86),
    CFrame.new(-3910.71, 319.39, -3347.51),
    CFrame.new(-3876.85, 319.50, -3366.33),
    CFrame.new(-3845.19, 319.59, -3386.43),
    CFrame.new(-3812.57, 319.70, -3407.37),
    CFrame.new(-3781.11, 319.76, -3427.78),
    CFrame.new(-3748.24, 319.77, -3449.10),
    CFrame.new(-3716.30, 319.69, -3468.72),
    CFrame.new(-3684.31, 319.54, -3489.83),
    CFrame.new(-3652.88, 319.54, -3511.03),
    CFrame.new(-3621.68, 319.55, -3531.82),
    CFrame.new(-3589.06, 319.66, -3553.49),
    CFrame.new(-3557.08, 319.76, -3574.63),
    CFrame.new(-3525.42, 319.80, -3594.73),
    CFrame.new(-3491.04, 319.73, -3612.51),
    CFrame.new(-3454.88, 319.76, -3625.14),
    CFrame.new(-3418.21, 319.69, -3629.77),
    CFrame.new(-3379.92, 319.60, -3627.99),
    CFrame.new(-3341.19, 319.81, -3622.63),
    CFrame.new(-3305.01, 319.89, -3608.99),
    CFrame.new(-3273.60, 319.92, -3590.15),
    CFrame.new(-3245.30, 319.88, -3564.38),
    CFrame.new(-3224.08, 319.61, -3532.55),
    CFrame.new(-3204.88, 319.67, -3499.86),
    CFrame.new(-3187.30, 319.86, -3467.70),
    CFrame.new(-3170.62, 319.91, -3434.11),
    CFrame.new(-3152.74, 320.07, -3398.32),
    CFrame.new(-3135.79, 320.27, -3364.40),
    CFrame.new(-3118.84, 320.51, -3330.47),
    CFrame.new(-3101.92, 320.82, -3296.54),
    CFrame.new(-3084.85, 321.12, -3261.75),
    CFrame.new(-3067.47, 321.41, -3227.59),
    CFrame.new(-3051.03, 321.58, -3195.28),
    CFrame.new(-3033.10, 321.33, -3159.99),
    CFrame.new(-3016.16, 320.88, -3126.53),
    CFrame.new(-2998.90, 320.42, -3091.84),
    CFrame.new(-2982.72, 320.11, -3058.47),
    CFrame.new(-2965.49, 319.92, -3023.77),
    CFrame.new(-2946.49, 319.74, -2990.03),
    CFrame.new(-2922.21, 319.71, -2960.45),
    CFrame.new(-2891.69, 319.68, -2938.86),
    CFrame.new(-2856.05, 319.69, -2925.05),
    CFrame.new(-2818.39, 319.68, -2921.15),
    CFrame.new(-2780.76, 319.92, -2922.99),
    CFrame.new(-2747.04, 319.79, -2940.76),
    CFrame.new(-2717.37, 319.78, -2964.97),
    CFrame.new(-2694.14, 319.85, -2994.81),
    CFrame.new(-2681.39, 319.81, -3030.39),
    CFrame.new(-2675.49, 319.90, -3068.23),
    CFrame.new(-2673.03, 320.10, -3106.48),
    CFrame.new(-2671.51, 320.25, -3143.94),
    CFrame.new(-2670.50, 320.25, -3182.26),
    CFrame.new(-2670.17, 320.10, -3219.77),
    CFrame.new(-2670.05, 320.06, -3258.94),
    CFrame.new(-2669.69, 320.07, -3296.45),
    CFrame.new(-2669.21, 320.16, -3335.62),
    CFrame.new(-2668.78, 320.24, -3373.13),
    CFrame.new(-2666.88, 320.27, -3411.41),
    CFrame.new(-2660.83, 320.31, -3448.37),
    CFrame.new(-2648.09, 320.22, -3485.37),
    CFrame.new(-2632.16, 320.18, -3519.30),
    CFrame.new(-2613.80, 320.28, -3552.92),
    CFrame.new(-2589.57, 320.26, -3583.02),
    CFrame.new(-2561.70, 320.17, -3608.73),
    CFrame.new(-2531.15, 320.15, -3631.79),
    CFrame.new(-2498.09, 320.13, -3651.18),
    CFrame.new(-2465.19, 320.26, -3669.16),
    CFrame.new(-2431.65, 320.35, -3686.84),
    CFrame.new(-2397.13, 320.33, -3704.43),
    CFrame.new(-2363.27, 320.17, -3721.50),
    CFrame.new(-2328.81, 320.10, -3738.27),
    CFrame.new(-2294.34, 320.07, -3755.04),
    CFrame.new(-2259.65, 320.15, -3772.30),
    CFrame.new(-2226.15, 320.11, -3790.05),
    CFrame.new(-2196.25, 320.04, -3812.48),
    CFrame.new(-2173.21, 320.09, -3843.47),
    CFrame.new(-2162.69, 320.10, -3879.29),
    CFrame.new(-2162.48, 320.23, -3917.43),
    CFrame.new(-2176.31, 320.22, -3952.09),
    CFrame.new(-2202.02, 320.12, -3980.17),
    CFrame.new(-2236.10, 320.06, -3999.23),
    CFrame.new(-2272.57, 320.12, -4007.48),
    CFrame.new(-2310.76, 320.31, -4010.67),
    CFrame.new(-2348.17, 320.56, -4013.20),
    CFrame.new(-2387.30, 321.24, -4014.64),
    CFrame.new(-2424.73, 323.19, -4015.82),
    CFrame.new(-2462.95, 325.91, -4016.86),
    CFrame.new(-2500.26, 329.16, -4018.57),
    CFrame.new(-2538.40, 332.50, -4020.52),
    CFrame.new(-2576.54, 335.84, -4022.51),
    CFrame.new(-2614.68, 339.18, -4024.49),
    CFrame.new(-2652.40, 342.49, -4026.44),
    CFrame.new(-2690.13, 345.79, -4028.40),
    CFrame.new(-2728.27, 349.13, -4030.37),
    CFrame.new(-2766.40, 352.47, -4032.46),
    CFrame.new(-2804.49, 355.81, -4035.06),
    CFrame.new(-2841.77, 359.07, -4037.50),
    CFrame.new(-2879.92, 361.98, -4039.91),
    CFrame.new(-2918.13, 364.29, -4041.83),
    CFrame.new(-2956.37, 365.99, -4043.89),
    CFrame.new(-2994.21, 367.09, -4046.00),
    CFrame.new(-3032.02, 367.60, -4048.73),
    CFrame.new(-3070.25, 367.56, -4051.49),
    CFrame.new(-3108.48, 367.16, -4054.26),
    CFrame.new(-3145.46, 366.66, -4056.94),
    CFrame.new(-3184.15, 366.19, -4059.00),
    CFrame.new(-3222.44, 365.83, -4060.75),
    CFrame.new(-3259.90, 365.70, -4062.57),
    CFrame.new(-3298.15, 365.68, -4064.99),
    CFrame.new(-3335.11, 365.71, -4073.11),
    CFrame.new(-3370.94, 365.76, -4087.79),
    CFrame.new(-3402.41, 365.80, -4108.05),
    CFrame.new(-3428.85, 365.68, -4135.74),
    CFrame.new(-3451.36, 365.69, -4166.20),
    CFrame.new(-3468.25, 365.69, -4201.01),
    CFrame.new(-3478.47, 365.71, -4237.05),
    CFrame.new(-3481.56, 365.67, -4275.18),
    CFrame.new(-3477.96, 365.65, -4313.30),
    CFrame.new(-3467.95, 365.65, -4350.69),
    CFrame.new(-3452.15, 365.66, -4384.20),
    CFrame.new(-3430.39, 365.73, -4416.71),
    CFrame.new(-3407.81, 365.79, -4446.66),
    CFrame.new(-3385.14, 365.86, -4477.06),
    CFrame.new(-3361.75, 365.84, -4507.96),
    CFrame.new(-3338.81, 365.71, -4537.62),
    CFrame.new(-3314.80, 365.57, -4568.03),
    CFrame.new(-3292.31, 365.51, -4598.04),
    CFrame.new(-3269.61, 365.47, -4628.41),
    CFrame.new(-3246.85, 365.48, -4659.26),
    CFrame.new(-3223.48, 365.50, -4689.65),
    CFrame.new(-3201.30, 365.50, -4719.88),
    CFrame.new(-3181.65, 365.50, -4752.28),
    CFrame.new(-3165.02, 365.44, -4787.27),
    CFrame.new(-3150.88, 365.45, -4822.44),
    CFrame.new(-3139.21, 365.48, -4858.95),
    CFrame.new(-3130.26, 365.55, -4896.20),
    CFrame.new(-3125.53, 365.54, -4934.24),
    CFrame.new(-3124.69, 365.48, -4972.12),
    CFrame.new(-3126.04, 365.49, -5009.59),
    CFrame.new(-3130.04, 365.54, -5047.70),
    CFrame.new(-3135.67, 365.55, -5085.62),
    CFrame.new(-3141.39, 365.55, -5123.53),
    CFrame.new(-3147.36, 365.51, -5160.54),
    CFrame.new(-3153.49, 365.49, -5198.37),
    CFrame.new(-3159.54, 365.52, -5235.78),
    CFrame.new(-3165.71, 365.55, -5274.02),
    CFrame.new(-3171.79, 365.58, -5311.85),
    CFrame.new(-3177.70, 365.72, -5349.31),
    CFrame.new(-3183.49, 365.83, -5386.36),
    CFrame.new(-3189.62, 365.90, -5424.18),
    CFrame.new(-3195.32, 365.91, -5461.66),
    CFrame.new(-3200.97, 365.86, -5499.58),
    CFrame.new(-3206.51, 365.80, -5537.50),
    CFrame.new(-3211.91, 365.74, -5574.59),
    CFrame.new(-3216.50, 365.71, -5612.65),
    CFrame.new(-3215.03, 365.72, -5650.84),
    CFrame.new(-3205.83, 365.64, -5688.02),
    CFrame.new(-3190.58, 365.61, -5723.11),
    CFrame.new(-3169.26, 365.55, -5754.44),
    CFrame.new(-3145.03, 365.70, -5783.54),
    CFrame.new(-3114.94, 365.81, -5807.85),
    CFrame.new(-3081.48, 365.83, -5824.71),
    CFrame.new(-3044.41, 365.84, -5835.43),
    CFrame.new(-3004.95, 365.74, -5838.16),
    CFrame.new(-2967.95, 365.76, -5835.63),
    CFrame.new(-2930.38, 365.92, -5828.46),
    CFrame.new(-2894.53, 366.00, -5812.90),
    CFrame.new(-2864.41, 365.91, -5790.60),
    CFrame.new(-2838.56, 365.86, -5763.61),
    CFrame.new(-2817.47, 365.74, -5730.63),
    CFrame.new(-2801.32, 365.78, -5697.29),
    CFrame.new(-2791.70, 365.76, -5660.24),
    CFrame.new(-2787.15, 365.87, -5622.21),
    CFrame.new(-2785.14, 366.21, -5583.94),
    CFrame.new(-2782.29, 367.62, -5547.02),
    CFrame.new(-2777.04, 370.06, -5507.87),
    CFrame.new(-2774.03, 372.91, -5470.19),
    CFrame.new(-2771.34, 376.14, -5433.34),
    CFrame.new(-2768.61, 379.52, -5394.83),
    CFrame.new(-2766.17, 382.82, -5357.15),
    CFrame.new(-2763.25, 386.13, -5319.47),
    CFrame.new(-2760.29, 389.47, -5281.39),
    CFrame.new(-2757.23, 392.85, -5242.92),
    CFrame.new(-2754.14, 396.15, -5205.29),
    CFrame.new(-2750.97, 399.27, -5167.64),
    CFrame.new(-2747.91, 401.04, -5129.89),
    CFrame.new(-2744.84, 401.28, -5092.09),
    CFrame.new(-2741.64, 400.82, -5054.32),
    CFrame.new(-2738.39, 400.24, -5016.97),
    CFrame.new(-2735.07, 399.79, -4978.78),
    CFrame.new(-2731.96, 399.54, -4940.57),
    CFrame.new(-2728.29, 399.43, -4901.99),
    CFrame.new(-2719.20, 399.41, -4864.38),
    CFrame.new(-2704.49, 399.42, -4829.92),
    CFrame.new(-2683.81, 399.47, -4797.71),
    CFrame.new(-2657.69, 399.46, -4770.88),
    CFrame.new(-2625.95, 399.46, -4748.04),
    CFrame.new(-2590.66, 399.35, -4733.26),
    CFrame.new(-2554.59, 399.27, -4724.83),
    CFrame.new(-2515.52, 399.19, -4722.67),
    CFrame.new(-2477.35, 399.26, -4725.76),
    CFrame.new(-2440.85, 399.32, -4734.31),
    CFrame.new(-2403.72, 399.31, -4743.88),
    CFrame.new(-2367.40, 399.33, -4753.24),
    CFrame.new(-2329.92, 399.38, -4763.06),
    CFrame.new(-2292.91, 399.45, -4773.03),
    CFrame.new(-2256.32, 399.65, -4782.94),
    CFrame.new(-2220.13, 399.72, -4792.74),
    CFrame.new(-2182.72, 399.71, -4802.86),
    CFrame.new(-2146.04, 399.65, -4812.48),
    CFrame.new(-2107.99, 399.53, -4819.67),
    CFrame.new(-2069.77, 399.54, -4822.00),
    CFrame.new(-2031.88, 399.46, -4816.41),
    CFrame.new(-1996.19, 399.45, -4805.27),
    CFrame.new(-1962.44, 399.32, -4785.45),
    CFrame.new(-1932.38, 399.32, -4762.38),
    CFrame.new(-1906.00, 399.41, -4734.70),
    CFrame.new(-1887.13, 399.33, -4701.88),
    CFrame.new(-1873.18, 399.36, -4667.09),
    CFrame.new(-1862.48, 399.49, -4630.29),
    CFrame.new(-1853.79, 399.53, -4592.96),
    CFrame.new(-1845.77, 399.80, -4555.90),
    CFrame.new(-1837.78, 399.79, -4519.26),
    CFrame.new(-1828.01, 399.75, -4481.79),
    CFrame.new(-1812.16, 399.73, -4447.40),
    CFrame.new(-1790.55, 399.70, -4416.28),
    CFrame.new(-1764.23, 399.74, -4388.47),
    CFrame.new(-1733.57, 399.72, -4366.98),
    CFrame.new(-1699.33, 399.81, -4348.90),
    CFrame.new(-1662.20, 399.86, -4338.18),
    CFrame.new(-1624.80, 399.77, -4336.39),
    CFrame.new(-1586.52, 399.64, -4342.20),
    CFrame.new(-1549.66, 399.62, -4352.59),
    CFrame.new(-1516.15, 399.60, -4369.33),
    CFrame.new(-1484.59, 399.66, -4390.32),
    CFrame.new(-1455.59, 399.87, -4415.82),
    CFrame.new(-1434.99, 399.84, -4447.53),
    CFrame.new(-1419.87, 399.83, -4482.71),
    CFrame.new(-1412.55, 399.75, -4519.02),
    CFrame.new(-1412.66, 399.60, -4558.11),
    CFrame.new(-1416.91, 399.60, -4595.36),
    CFrame.new(-1426.84, 399.72, -4633.17),
    CFrame.new(-1438.13, 400.08, -4668.93),
    CFrame.new(-1449.09, 400.83, -4705.64),
    CFrame.new(-1459.31, 401.33, -4741.71),
    CFrame.new(-1470.34, 400.97, -4778.85),
    CFrame.new(-1481.69, 399.70, -4814.12),
    CFrame.new(-1492.99, 397.40, -4850.68),
    CFrame.new(-1504.34, 394.67, -4888.06),
    CFrame.new(-1514.90, 392.02, -4924.39),
    CFrame.new(-1525.76, 389.38, -4960.63),
    CFrame.new(-1536.83, 386.71, -4997.24),
    CFrame.new(-1547.59, 384.09, -5033.07),
    CFrame.new(-1558.55, 381.41, -5069.72),
    CFrame.new(-1569.51, 379.03, -5106.38),
    CFrame.new(-1580.54, 377.42, -5143.48),
    CFrame.new(-1590.90, 376.63, -5179.07),
    CFrame.new(-1601.94, 376.54, -5215.77),
    CFrame.new(-1613.59, 376.12, -5252.29),
    CFrame.new(-1625.29, 375.56, -5288.78),
    CFrame.new(-1636.41, 375.16, -5324.59),
    CFrame.new(-1647.58, 374.99, -5361.27),
    CFrame.new(-1655.72, 374.94, -5398.67),
    CFrame.new(-1654.69, 374.88, -5436.86),
    CFrame.new(-1646.16, 374.93, -5474.60),
    CFrame.new(-1629.04, 374.96, -5507.85),
    CFrame.new(-1604.46, 375.01, -5536.55),
    CFrame.new(-1573.28, 375.03, -5558.75),
    CFrame.new(-1537.72, 375.05, -5572.68),
    CFrame.new(-1499.92, 375.11, -5578.37),
    CFrame.new(-1461.43, 375.00, -5571.92),
    CFrame.new(-1425.76, 374.97, -5558.11),
    CFrame.new(-1394.48, 375.00, -5537.48),
    CFrame.new(-1366.84, 375.13, -5509.98),
    CFrame.new(-1345.96, 375.00, -5478.33),
    CFrame.new(-1323.42, 374.94, -5448.37),
    CFrame.new(-1301.01, 374.99, -5417.78),
    CFrame.new(-1278.40, 375.07, -5386.81),
    CFrame.new(-1256.06, 375.10, -5356.18),
    CFrame.new(-1233.14, 375.04, -5325.45),
    CFrame.new(-1210.23, 374.98, -5295.24),
    CFrame.new(-1186.16, 375.02, -5264.88),
    CFrame.new(-1159.86, 374.99, -5237.58),
    CFrame.new(-1131.73, 374.98, -5210.93),
    CFrame.new(-1102.27, 374.98, -5186.42),
    CFrame.new(-1071.88, 375.00, -5163.75),
    CFrame.new(-1041.04, 375.09, -5141.00),
    CFrame.new(-1010.57, 375.16, -5119.13),
    CFrame.new(-978.66, 375.11, -5097.16),
    CFrame.new(-947.78, 374.94, -5075.89),
    CFrame.new(-915.78, 374.92, -5054.04),
    CFrame.new(-884.12, 374.91, -5032.45),
    CFrame.new(-853.62, 374.98, -5011.35),
    CFrame.new(-822.04, 374.99, -4988.90),
    CFrame.new(-793.38, 374.90, -4962.88),
    CFrame.new(-770.13, 374.88, -4933.03),
    CFrame.new(-752.61, 374.88, -4899.43),
    CFrame.new(-742.69, 374.85, -4862.50),
    CFrame.new(-739.83, 374.83, -4823.46),
    CFrame.new(-743.44, 374.89, -4786.23),
    CFrame.new(-755.35, 374.88, -4750.72),
    CFrame.new(-774.42, 374.84, -4718.03),
    CFrame.new(-800.35, 374.76, -4689.91),
    CFrame.new(-828.84, 374.82, -4664.27),
    CFrame.new(-857.51, 374.86, -4639.46),
    CFrame.new(-886.69, 375.00, -4615.24),
    CFrame.new(-915.85, 375.15, -4591.00),
    CFrame.new(-945.49, 375.05, -4566.03),
    CFrame.new(-971.99, 374.99, -4539.52),
    CFrame.new(-994.43, 375.02, -4507.55),
    CFrame.new(-1010.18, 375.12, -4473.11),
    CFrame.new(-1015.51, 375.10, -4436.64),
    CFrame.new(-1012.11, 375.03, -4397.65),
    CFrame.new(-1001.37, 375.01, -4361.36),
    CFrame.new(-984.54, 375.08, -4327.46),
    CFrame.new(-959.24, 375.09, -4298.20),
    CFrame.new(-929.74, 375.11, -4275.83),
    CFrame.new(-894.53, 375.11, -4260.01),
    CFrame.new(-857.22, 375.05, -4253.59),
    CFrame.new(-818.94, 375.06, -4254.00),
    CFrame.new(-781.23, 375.18, -4260.87),
    CFrame.new(-744.34, 375.70, -4269.58),
    CFrame.new(-707.38, 376.49, -4278.00),
    CFrame.new(-668.98, 376.58, -4285.70),
    CFrame.new(-631.27, 376.58, -4288.31),
    CFrame.new(-593.33, 376.58, -4283.20),
    CFrame.new(-558.77, 376.58, -4267.10),
    CFrame.new(-528.17, 376.58, -4244.75),
    CFrame.new(-501.85, 376.58, -4216.93),
    CFrame.new(-477.67, 375.94, -4188.28),
    CFrame.new(-453.32, 374.97, -4158.69),
    CFrame.new(-424.93, 374.84, -4133.75),
    CFrame.new(-389.72, 375.05, -4118.08),
    CFrame.new(-351.64, 375.41, -4114.49),
    CFrame.new(-313.77, 375.09, -4116.18),
    CFrame.new(-275.89, 374.98, -4117.72),
    CFrame.new(-238.39, 374.81, -4117.86)
}
local path = {
    CFrame.new(237.76, 15.25, -315.04),
    CFrame.new(217.57, 15.25, -360.96),
    CFrame.new(177.00, 15.68, -413.13),
    CFrame.new(122.84, 20.50, -471.22),
    CFrame.new(76.08, 25.23, -521.81),
    CFrame.new(47.76, 29.13, -555.05),
    CFrame.new(40.57, 31.55, -589.85),
    CFrame.new(93.33, 38.22, -648.81),
    CFrame.new(155.35, 39.17, -717.84),
    CFrame.new(198.90, 38.64, -773.34),
    CFrame.new(218.98, 38.74, -845.01),
    CFrame.new(199.41, 38.68, -926.73),
    CFrame.new(177.75, 38.68, -1006.68),
    CFrame.new(189.98, 39.16, -1099.49),
    CFrame.new(211.30, 39.54, -1205.34),
    CFrame.new(234.00, 39.54, -1321.79),
    CFrame.new(255.76, 39.54, -1438.58),
    CFrame.new(244.35, 39.54, -1549.86),
    CFrame.new(230.03, 40.40, -1643.11),
    CFrame.new(206.47, 51.76, -1774.91),
    CFrame.new(191.96, 60.23, -1870.70),
    CFrame.new(160.89, 69.05, -1967.41),
    CFrame.new(142.87, 74.04, -2022.03),
    CFrame.new(120.05, 80.07, -2091.47),
    CFrame.new(94.42, 88.09, -2181.49),
    CFrame.new(77.57, 98.08, -2305.63),
    CFrame.new(48.30, 105.96, -2402.89),
    CFrame.new(7.12, 114.00, -2503.65),
    CFrame.new(-44.41, 118.41, -2572.87),
    CFrame.new(-117.90, 119.97, -2623.34),
    CFrame.new(-205.16, 120.48, -2666.85),
    CFrame.new(-292.81, 120.45, -2665.91),
    CFrame.new(-328.97, 124.58, -2704.49),
    CFrame.new(-418.72, 127.51, -2728.08),
    CFrame.new(-502.30, 130.77, -2750.76),
    CFrame.new(-602.78, 134.27, -2778.04),
    CFrame.new(-681.52, 137.26, -2801.96),
    CFrame.new(-743.74, 138.39, -2851.68),
    CFrame.new(-810.05, 138.12, -2942.23),
    CFrame.new(-864.98, 137.56, -3076.14),
    CFrame.new(-903.39, 137.51, -3165.93),
    CFrame.new(-944.51, 137.56, -3253.82),
    CFrame.new(-1011.05, 137.45, -3340.28),
    CFrame.new(-1104.31, 137.34, -3414.61),
    CFrame.new(-1200.11, 137.63, -3481.60),
    CFrame.new(-1274.50, 137.66, -3530.04),
    CFrame.new(-1354.42, 137.66, -3581.86),
    CFrame.new(-1422.08, 137.50, -3623.59),
    CFrame.new(-1494.67, 137.20, -3664.53),
    CFrame.new(-1553.00, 136.31, -3670.47),
    CFrame.new(-1638.09, 138.26, -3622.75),
    CFrame.new(-1664.94, 137.63, -3543.02),
    CFrame.new(-1639.15, 133.18, -3439.46),
    CFrame.new(-1610.05, 129.67, -3345.96),
    CFrame.new(-1574.91, 129.00, -3237.17),
    CFrame.new(-1541.11, 135.28, -3125.18),
    CFrame.new(-1500.60, 143.22, -2996.22),
    CFrame.new(-1462.49, 151.06, -2868.37),
    CFrame.new(-1414.85, 160.79, -2708.80),
    CFrame.new(-1382.65, 161.52, -2602.49),
    CFrame.new(-1348.85, 161.13, -2503.68),
    CFrame.new(-1319.66, 161.26, -2391.94),
    CFrame.new(-1318.80, 161.45, -2316.75),
    CFrame.new(-1356.36, 161.46, -2200.02),
    CFrame.new(-1391.51, 161.15, -2104.94),
    CFrame.new(-1423.18, 161.21, -2013.96),
    CFrame.new(-1443.75, 161.36, -1930.83),
    CFrame.new(-1415.17, 161.06, -1852.68),
    CFrame.new(-1338.22, 161.04, -1780.93),
    CFrame.new(-1257.99, 161.25, -1714.38),
    CFrame.new(-1177.83, 161.24, -1650.30),
    CFrame.new(-1107.98, 161.46, -1570.36),
    CFrame.new(-1104.61, 161.40, -1478.38),
    CFrame.new(-1154.03, 161.57, -1396.58),
    CFrame.new(-1241.22, 161.70, -1359.48),
    CFrame.new(-1348.24, 161.96, -1366.53),
    CFrame.new(-1470.16, 163.06, -1378.48),
    CFrame.new(-1588.14, 165.91, -1389.60),
    CFrame.new(-1729.20, 180.54, -1398.15),
    CFrame.new(-1868.63, 197.70, -1407.43),
    CFrame.new(-1994.23, 213.18, -1417.26),
    CFrame.new(-2128.89, 226.51, -1425.69),
    CFrame.new(-2261.30, 229.39, -1433.93),
    CFrame.new(-2387.33, 227.94, -1442.31),
    CFrame.new(-2508.79, 227.70, -1447.47),
    CFrame.new(-2597.08, 227.47, -1419.52),
    CFrame.new(-2689.28, 227.56, -1352.71),
    CFrame.new(-2749.97, 227.55, -1266.84),
    CFrame.new(-2812.39, 227.74, -1171.89),
    CFrame.new(-2878.49, 227.96, -1075.13),
    CFrame.new(-2930.11, 228.20, -1000.62),
    CFrame.new(-3003.08, 229.55, -945.91),
    CFrame.new(-3092.32, 232.26, -916.92),
    CFrame.new(-3199.59, 234.43, -919.64),
    CFrame.new(-3314.23, 235.10, -969.13),
    CFrame.new(-3396.14, 238.76, -1011.66),
    CFrame.new(-3495.41, 243.60, -1065.05),
    CFrame.new(-3598.17, 248.11, -1121.57),
    CFrame.new(-3712.72, 252.56, -1184.82),
    CFrame.new(-3823.75, 256.88, -1246.50),
    CFrame.new(-3895.54, 260.03, -1306.86),
    CFrame.new(-3952.84, 262.64, -1360.55),
    CFrame.new(-4024.46, 266.18, -1448.49),
    CFrame.new(-4064.87, 268.72, -1525.03),
    CFrame.new(-4091.69, 270.63, -1599.26),
    CFrame.new(-4117.47, 273.62, -1731.18),
    CFrame.new(-4133.27, 280.89, -1875.07),
    CFrame.new(-4144.08, 288.52, -1981.17),
    CFrame.new(-4151.91, 297.37, -2104.75),
    CFrame.new(-4166.75, 305.55, -2218.25),
    CFrame.new(-4178.82, 314.37, -2340.96),
    CFrame.new(-4192.04, 322.40, -2452.45),
    CFrame.new(-4196.85, 325.06, -2497.63),
    CFrame.new(-4208.89, 325.63, -2627.14),
    CFrame.new(-4222.07, 324.59, -2740.08),
    CFrame.new(-4235.35, 324.66, -2826.80),
    CFrame.new(-4280.73, 324.57, -2909.39),
    CFrame.new(-4359.09, 324.65, -2978.46),
    CFrame.new(-4465.26, 324.96, -3017.32),
    CFrame.new(-4592.80, 325.56, -3026.24),
    CFrame.new(-4709.63, 326.71, -3032.92),
    CFrame.new(-4819.54, 326.62, -3038.43),
    CFrame.new(-4930.98, 325.58, -3042.49),
    CFrame.new(-5037.95, 325.12, -3048.76),
    CFrame.new(-5114.78, 325.00, -3087.49),
    CFrame.new(-5154.37, 325.44, -3174.74),
    CFrame.new(-5110.99, 325.75, -3272.60),
    CFrame.new(-5018.91, 325.87, -3321.19),
    CFrame.new(-4909.22, 325.57, -3365.73),
    CFrame.new(-4803.55, 325.46, -3408.13),
    CFrame.new(-4709.39, 325.62, -3417.95),
    CFrame.new(-4585.25, 325.94, -3395.95),
    CFrame.new(-4460.45, 325.55, -3365.83),
    CFrame.new(-4345.85, 325.17, -3336.80),
    CFrame.new(-4231.26, 325.01, -3310.46),
    CFrame.new(-4135.29, 325.32, -3293.39),
    CFrame.new(-4025.33, 325.53, -3300.61),
    CFrame.new(-3924.73, 325.56, -3336.30),
    CFrame.new(-3819.98, 325.78, -3399.47),
    CFrame.new(-3706.07, 325.57, -3471.92),
    CFrame.new(-3610.71, 325.18, -3532.93),
    CFrame.new(-3509.46, 325.20, -3597.34),
    CFrame.new(-3433.21, 325.92, -3632.32),
    CFrame.new(-3332.63, 326.04, -3624.23),
    CFrame.new(-3236.63, 325.82, -3556.07),
    CFrame.new(-3173.47, 326.00, -3445.23),
    CFrame.new(-3114.14, 326.60, -3327.26),
    CFrame.new(-3052.54, 327.47, -3201.59),
    CFrame.new(-2988.55, 326.12, -3071.06),
    CFrame.new(-2928.44, 325.64, -2965.96),
    CFrame.new(-2823.73, 325.67, -2919.77),
    CFrame.new(-2738.32, 325.66, -2947.03),
    CFrame.new(-2683.86, 325.72, -3020.76),
    CFrame.new(-2677.32, 325.90, -3134.61),
    CFrame.new(-2672.27, 326.03, -3256.94),
    CFrame.new(-2667.41, 326.09, -3380.05),
    CFrame.new(-2645.62, 326.13, -3492.55),
    CFrame.new(-2588.28, 326.04, -3581.69),
    CFrame.new(-2506.65, 326.11, -3648.37),
    CFrame.new(-2387.72, 326.19, -3708.51),
    CFrame.new(-2275.73, 326.06, -3763.85),
    CFrame.new(-2184.64, 325.99, -3824.66),
    CFrame.new(-2159.16, 326.19, -3896.61),
    CFrame.new(-2186.30, 326.15, -3967.12),
    CFrame.new(-2256.84, 326.20, -4008.49),
    CFrame.new(-2381.65, 327.04, -4013.78),
    CFrame.new(-2517.56, 336.59, -4020.49),
    CFrame.new(-2636.00, 346.96, -4026.98),
    CFrame.new(-2742.94, 356.33, -4033.66),
    CFrame.new(-2855.01, 366.12, -4039.30),
    CFrame.new(-2947.67, 371.59, -4044.38),
    CFrame.new(-3044.75, 373.50, -4052.38),
    CFrame.new(-3147.15, 372.55, -4057.01),
    CFrame.new(-3248.30, 371.67, -4061.58),
    CFrame.new(-3328.37, 371.84, -4067.47),
    CFrame.new(-3420.52, 371.64, -4125.18),
    CFrame.new(-3473.51, 371.56, -4218.06),
    CFrame.new(-3475.53, 371.63, -4330.40),
    CFrame.new(-3426.29, 371.88, -4428.07),
    CFrame.new(-3355.32, 371.68, -4514.17),
    CFrame.new(-3285.48, 371.49, -4604.33),
    CFrame.new(-3203.04, 371.48, -4715.45),
    CFrame.new(-3154.27, 371.36, -4812.73),
    CFrame.new(-3123.69, 371.50, -4946.04),
    CFrame.new(-3135.40, 371.40, -5078.09),
    CFrame.new(-3157.02, 371.43, -5224.78),
    CFrame.new(-3174.29, 371.58, -5341.75),
    CFrame.new(-3191.98, 371.71, -5452.23),
    CFrame.new(-3209.86, 371.56, -5572.87),
    CFrame.new(-3204.22, 371.27, -5679.36),
    CFrame.new(-3160.53, 371.18, -5758.71),
    CFrame.new(-3082.54, 371.47, -5820.42),
    CFrame.new(-2972.27, 371.48, -5833.70),
    CFrame.new(-2849.61, 371.31, -5766.76),
    CFrame.new(-2795.91, 371.43, -5665.23),
    CFrame.new(-2781.48, 372.64, -5564.21),
    CFrame.new(-2771.36, 381.72, -5437.06),
    CFrame.new(-2761.35, 392.75, -5311.33),
    CFrame.new(-2753.04, 401.90, -5207.11),
    CFrame.new(-2747.25, 406.86, -5134.43),
    CFrame.new(-2739.75, 406.48, -5040.59),
    CFrame.new(-2730.72, 405.36, -4927.56),
    CFrame.new(-2702.34, 405.19, -4829.98),
    CFrame.new(-2631.24, 405.05, -4756.51),
    CFrame.new(-2520.92, 405.20, -4720.93),
    CFrame.new(-2397.04, 405.25, -4744.71),
    CFrame.new(-2269.86, 405.49, -4779.31),
    CFrame.new(-2141.59, 405.58, -4814.20),
    CFrame.new(-2029.64, 405.50, -4818.40),
    CFrame.new(-1934.99, 405.22, -4764.57),
    CFrame.new(-1875.82, 405.35, -4679.78),
    CFrame.new(-1847.69, 405.59, -4569.48),
    CFrame.new(-1822.29, 405.60, -4468.15),
    CFrame.new(-1746.00, 405.75, -4372.21),
    CFrame.new(-1637.59, 405.72, -4335.94),
    CFrame.new(-1545.19, 405.85, -4348.41),
    CFrame.new(-1464.93, 405.81, -4404.24),
    CFrame.new(-1417.34, 405.76, -4489.29),
    CFrame.new(-1415.38, 405.76, -4607.23),
    CFrame.new(-1450.12, 407.05, -4720.03),
    CFrame.new(-1481.56, 405.25, -4820.92),
    CFrame.new(-1512.13, 398.33, -4919.27),
    CFrame.new(-1542.16, 390.81, -5022.18),
    CFrame.new(-1579.76, 383.31, -5144.54),
    CFrame.new(-1612.35, 381.89, -5258.66),
    CFrame.new(-1646.69, 380.77, -5365.97),
    CFrame.new(-1653.66, 380.82, -5447.45),
    CFrame.new(-1630.20, 380.76, -5502.86),
    CFrame.new(-1558.24, 381.09, -5568.67),
    CFrame.new(-1472.00, 380.58, -5568.67),
    CFrame.new(-1390.69, 380.55, -5525.63),
    CFrame.new(-1320.27, 380.82, -5443.17),
    CFrame.new(-1268.93, 381.02, -5373.95),
    CFrame.new(-1205.77, 380.89, -5289.23),
    CFrame.new(-1144.33, 380.91, -5222.63),
    CFrame.new(-1080.74, 380.52, -5180.26),
    CFrame.new(-1015.92, 380.92, -5129.08),
    CFrame.new(-950.19, 380.89, -5081.08),
    CFrame.new(-881.52, 380.78, -5030.11),
    CFrame.new(-817.30, 380.52, -4977.70),
    CFrame.new(-765.99, 380.53, -4917.84),
    CFrame.new(-745.46, 380.42, -4819.73),
    CFrame.new(-779.17, 380.43, -4719.70),
    CFrame.new(-847.11, 380.63, -4650.80),
    CFrame.new(-944.74, 380.92, -4565.50),
    CFrame.new(-1000.84, 380.86, -4491.04),
    CFrame.new(-1011.50, 380.87, -4401.50),
    CFrame.new(-977.29, 380.92, -4319.72),
    CFrame.new(-911.39, 380.83, -4270.20),
    CFrame.new(-784.92, 381.08, -4259.98),
    CFrame.new(-689.21, 382.49, -4279.91),
    CFrame.new(-583.26, 382.49, -4279.88),
    CFrame.new(-507.46, 382.49, -4219.92),
    CFrame.new(-446.53, 381.09, -4145.48),
    CFrame.new(-359.16, 381.69, -4108.96),
    CFrame.new(-218.51, 380.32, -4112.79),
    CFrame.new(-95.47, 380.41, -4093.28),
    CFrame.new(-14.71, 380.43, -4077.19),
    CFrame.new(83.10, 380.48, -4055.47),
    CFrame.new(178.39, 380.20, -4033.80),
    CFrame.new(246.26, 380.35, -4038.59),
    CFrame.new(285.60, 380.28, -4086.70),
    CFrame.new(268.21, 379.87, -4171.60),
    CFrame.new(238.74, 379.21, -4242.03),
    CFrame.new(217.03, 379.45, -4322.10),
    CFrame.new(274.23, 379.32, -4365.97),
    CFrame.new(340.63, 379.00, -4345.33),
    CFrame.new(422.21, 378.53, -4313.57),
    CFrame.new(489.85, 378.32, -4291.10),
    CFrame.new(550.42, 378.34, -4294.58),
    CFrame.new(616.90, 378.06, -4361.49),
    CFrame.new(671.08, 377.67, -4421.59),
    CFrame.new(790.78, 377.22, -4433.10),
    CFrame.new(902.73, 377.13, -4470.61),
    CFrame.new(954.45, 375.92, -4565.54),
    CFrame.new(937.43, 376.46, -4644.55),
    CFrame.new(842.17, 376.53, -4653.27),
    CFrame.new(738.27, 376.45, -4658.02),
    CFrame.new(636.29, 376.59, -4663.27),
    CFrame.new(544.67, 376.79, -4672.28),
    CFrame.new(502.18, 377.13, -4717.78),
    CFrame.new(534.26, 377.39, -4799.50),
    CFrame.new(629.20, 375.92, -4832.02),
    CFrame.new(734.74, 375.87, -4871.25),
    CFrame.new(777.21, 375.56, -4937.20),
    CFrame.new(770.37, 375.02, -5030.58),
    CFrame.new(745.65, 374.67, -5137.80),
    CFrame.new(775.62, 374.55, -5195.24),
    CFrame.new(837.91, 374.38, -5206.86),
    CFrame.new(891.01, 374.06, -5152.72),
    CFrame.new(951.53, 375.89, -5073.95),
    CFrame.new(1035.89, 376.94, -4969.20),
    CFrame.new(1100.92, 369.59, -4888.74),
    CFrame.new(1154.91, 358.13, -4821.95),
    CFrame.new(1215.32, 345.96, -4759.04),
    CFrame.new(1283.49, 335.28, -4716.15),
    CFrame.new(1327.13, 328.49, -4689.26),
    CFrame.new(1382.25, 317.12, -4626.64),
    CFrame.new(1445.45, 311.38, -4552.36),
    CFrame.new(1497.70, 311.26, -4491.33),
    CFrame.new(1544.02, 309.94, -4437.93),
    CFrame.new(1589.71, 309.13, -4360.72),
    CFrame.new(1561.56, 310.03, -4304.64),
    CFrame.new(1476.00, 309.44, -4288.13),
    CFrame.new(1394.35, 309.42, -4317.11),
    CFrame.new(1319.51, 309.14, -4392.96),
    CFrame.new(1236.32, 309.11, -4482.17),
    CFrame.new(1163.13, 309.35, -4497.21),
    CFrame.new(1106.70, 309.55, -4440.02),
    CFrame.new(1069.42, 309.48, -4291.56),
    CFrame.new(1013.79, 309.57, -4241.18),
    CFrame.new(883.76, 309.07, -4241.71),
    CFrame.new(743.67, 309.52, -4225.95),
    CFrame.new(686.04, 309.70, -4121.05),
    CFrame.new(654.68, 310.44, -4038.57),
    CFrame.new(616.94, 304.61, -3940.06),
    CFrame.new(578.82, 295.53, -3843.68),
    CFrame.new(530.51, 286.56, -3743.78),
    CFrame.new(454.85, 274.81, -3678.37),
    CFrame.new(322.79, 256.64, -3643.10),
    CFrame.new(256.55, 252.08, -3635.42),
    CFrame.new(154.24, 249.65, -3621.57),
    CFrame.new(68.66, 249.80, -3570.81),
    CFrame.new(42.54, 249.85, -3492.61),
    CFrame.new(82.71, 249.79, -3397.83),
    CFrame.new(170.27, 249.83, -3358.44),
    CFrame.new(252.21, 249.83, -3381.24),
    CFrame.new(349.91, 249.74, -3459.87),
    CFrame.new(447.74, 249.96, -3495.40),
    CFrame.new(588.27, 249.89, -3500.38),
    CFrame.new(684.06, 249.64, -3546.34),
    CFrame.new(751.40, 249.79, -3633.48),
    CFrame.new(761.03, 249.61, -3732.23),
    CFrame.new(740.71, 249.75, -3838.34),
    CFrame.new(747.65, 250.05, -3951.85),
    CFrame.new(833.82, 250.14, -4022.77),
    CFrame.new(949.59, 249.73, -4050.38),
    CFrame.new(1073.61, 249.70, -4105.00),
    CFrame.new(1177.41, 249.55, -4164.08),
    CFrame.new(1260.56, 249.92, -4175.21),
    CFrame.new(1287.64, 249.82, -4118.78),
    CFrame.new(1256.00, 250.08, -4061.19),
    CFrame.new(1184.19, 250.74, -4015.78),
    CFrame.new(1111.03, 247.84, -3969.51),
    CFrame.new(1035.73, 238.56, -3921.90),
    CFrame.new(967.52, 229.28, -3878.76),
    CFrame.new(886.82, 221.95, -3827.72),
    CFrame.new(851.69, 222.38, -3781.32),
    CFrame.new(875.67, 219.55, -3732.85),
    CFrame.new(928.36, 215.63, -3749.86),
    CFrame.new(1011.89, 206.77, -3796.85),
    CFrame.new(1089.28, 198.69, -3840.39),
    CFrame.new(1161.10, 192.92, -3839.86),
    CFrame.new(1194.86, 189.33, -3776.75),
    CFrame.new(1154.92, 188.40, -3678.54),
    CFrame.new(1109.23, 186.53, -3582.46),
    CFrame.new(1063.94, 176.60, -3487.94),
    CFrame.new(1022.25, 166.62, -3399.40),
    CFrame.new(984.17, 157.49, -3318.34),
    CFrame.new(947.69, 149.94, -3239.39),
    CFrame.new(912.93, 149.01, -3167.35),
    CFrame.new(877.28, 148.11, -3091.58),
    CFrame.new(889.40, 148.48, -3003.43),
    CFrame.new(954.85, 149.68, -2905.21),
    CFrame.new(1002.53, 147.34, -2840.87),
    CFrame.new(1063.35, 141.50, -2779.52),
    CFrame.new(1109.64, 135.90, -2711.17),
    CFrame.new(1166.09, 129.12, -2629.46),
    CFrame.new(1207.76, 127.82, -2567.44),
    CFrame.new(1251.45, 127.81, -2545.62),
    CFrame.new(1304.85, 127.45, -2571.35),
    CFrame.new(1402.64, 126.30, -2615.55),
    CFrame.new(1446.74, 126.07, -2619.12),
    CFrame.new(1488.51, 126.27, -2604.90),
    CFrame.new(1548.04, 126.32, -2518.02),
    CFrame.new(1597.18, 126.32, -2479.71),
    CFrame.new(1660.10, 126.29, -2451.25),
    CFrame.new(1691.92, 126.84, -2419.11),
    CFrame.new(1675.16, 126.94, -2380.78),
    CFrame.new(1623.51, 126.96, -2377.31),
    CFrame.new(1510.37, 126.49, -2416.08),
    CFrame.new(1445.61, 126.93, -2417.19),
    CFrame.new(1430.34, 127.57, -2354.59),
    CFrame.new(1506.50, 126.98, -2319.62),
    CFrame.new(1680.11, 123.27, -2299.75),
    CFrame.new(1739.54, 120.96, -2270.24),
    CFrame.new(1739.66, 117.53, -2229.83),
    CFrame.new(1614.60, 108.10, -2148.41),
    CFrame.new(1591.13, 105.36, -2094.55),
    CFrame.new(1636.75, 104.89, -2054.22),
    CFrame.new(1784.33, 104.60, -2085.86),
    CFrame.new(1814.42, 104.53, -2068.38),
    CFrame.new(1813.04, 104.79, -2012.91),
    CFrame.new(1785.35, 104.93, -1944.59),
    CFrame.new(1802.88, 104.50, -1865.07),
    CFrame.new(1848.97, 104.49, -1764.60),
    CFrame.new(1848.88, 105.07, -1719.10),
    CFrame.new(1759.41, 104.65, -1667.58),
    CFrame.new(1756.52, 105.45, -1564.33),
    CFrame.new(1758.37, 105.57, -1468.50),
    CFrame.new(1760.25, 104.97, -1371.02),
    CFrame.new(1770.53, 104.74, -1281.02),
    CFrame.new(1793.05, 104.73, -1194.58),
    CFrame.new(1815.51, 104.94, -1117.57),
    CFrame.new(1829.00, 105.06, -1045.70),
    CFrame.new(1810.27, 104.93, -986.44),
    CFrame.new(1762.70, 105.42, -953.88),
    CFrame.new(1717.62, 105.36, -984.19),
    CFrame.new(1717.17, 104.81, -1057.36),
    CFrame.new(1713.92, 104.97, -1151.04),
    CFrame.new(1674.85, 104.73, -1210.65),
    CFrame.new(1608.03, 104.98, -1215.27),
    CFrame.new(1556.93, 105.75, -1150.32),
    CFrame.new(1573.19, 106.84, -1036.31),
    CFrame.new(1581.28, 105.17, -963.04),
    CFrame.new(1589.40, 99.38, -886.73),
    CFrame.new(1595.16, 93.20, -826.03),
    CFrame.new(1600.02, 84.40, -739.25),
    CFrame.new(1606.54, 75.67, -653.20),
    CFrame.new(1614.50, 68.67, -568.99),
    CFrame.new(1624.28, 64.92, -480.46),
    CFrame.new(1626.82, 63.60, -403.22),
    CFrame.new(1589.39, 62.81, -367.56),
    CFrame.new(1533.24, 61.10, -398.49),
    CFrame.new(1525.17, 60.57, -551.62),
    CFrame.new(1485.02, 59.15, -629.67),
    CFrame.new(1409.20, 56.98, -648.99),
    CFrame.new(1318.23, 54.24, -579.92),
    CFrame.new(1232.77, 51.69, -529.04),
    CFrame.new(1153.14, 48.83, -549.96),
    CFrame.new(1110.12, 47.37, -602.92),
    CFrame.new(1106.25, 47.22, -679.37),
    CFrame.new(1175.73, 49.40, -754.61),
    CFrame.new(1290.49, 53.18, -799.29),
    CFrame.new(1377.06, 55.95, -857.75),
    CFrame.new(1375.92, 55.82, -925.05),
    CFrame.new(1321.16, 53.89, -1029.72),
    CFrame.new(1268.33, 51.88, -1129.95),
    CFrame.new(1251.36, 51.42, -1243.16),
    CFrame.new(1282.52, 52.49, -1367.69),
    CFrame.new(1317.62, 53.49, -1482.43),
    CFrame.new(1294.11, 52.86, -1570.37),
    CFrame.new(1208.92, 50.18, -1617.91),
    CFrame.new(1115.78, 47.20, -1587.68),
    CFrame.new(1070.09, 46.07, -1486.61),
    CFrame.new(1076.15, 44.99, -1335.11),
    CFrame.new(1040.29, 40.59, -1260.38),
    CFrame.new(946.02, 33.85, -1178.21),
    CFrame.new(860.02, 27.61, -1088.72),
    CFrame.new(827.21, 22.21, -946.16),
    CFrame.new(779.89, 16.21, -833.87),
    CFrame.new(682.57, 15.25, -693.25),
    CFrame.new(707.03, 15.25, -529.57),
    CFrame.new(659.88, 15.25, -383.33),
    CFrame.new(557.91, 15.25, -283.98),
    CFrame.new(486.77, 15.25, -142.90),
    CFrame.new(438.49, 15.25, -41.87),
    CFrame.new(375.02, 15.25, -3.01),
    CFrame.new(260.15, 15.24, 1.08),
    CFrame.new(163.08, 15.25, 0.16),
    CFrame.new(56.00, 15.25, -0.85),
    CFrame.new(-73.58, 15.25, -2.08),
    CFrame.new(-143.49, 15.25, -26.65),
    CFrame.new(-169.73, 15.25, -93.49),
    CFrame.new(-169.37, 15.25, -182.75),
    CFrame.new(-179.20, 15.25, -254.86),
    CFrame.new(-172.25, 15.25, -333.91),
    CFrame.new(-99.12, 15.51, -424.75),
    CFrame.new(-20.25, 22.63, -512.45),
    CFrame.new(48.75, 31.94, -593.17),
    CFrame.new(113.89, 39.23, -665.99)
}

local lapspath = {
    CFrame.new(237.76, 15.25, -315.04),
    CFrame.new(217.57, 15.25, -360.96),
    CFrame.new(177.00, 15.68, -413.13),
    CFrame.new(122.84, 20.50, -471.22),
    CFrame.new(76.08, 25.23, -521.81),
    CFrame.new(47.76, 29.13, -555.05),
    CFrame.new(40.57, 31.55, -589.85),
    CFrame.new(93.33, 38.22, -648.81),
    CFrame.new(155.35, 39.17, -717.84),
    CFrame.new(198.90, 38.64, -773.34),
    CFrame.new(218.98, 38.74, -845.01),
    CFrame.new(199.41, 38.68, -926.73),
    CFrame.new(177.75, 38.68, -1006.68),
    CFrame.new(189.98, 39.16, -1099.49),
    CFrame.new(211.30, 39.54, -1205.34),
    CFrame.new(234.00, 39.54, -1321.79),
    CFrame.new(255.76, 39.54, -1438.58),
    CFrame.new(244.35, 39.54, -1549.86),
    CFrame.new(230.03, 40.40, -1643.11),
    CFrame.new(206.47, 51.76, -1774.91),
    CFrame.new(191.96, 60.23, -1870.70),
    CFrame.new(160.89, 69.05, -1967.41),
    CFrame.new(142.87, 74.04, -2022.03),
    CFrame.new(120.05, 80.07, -2091.47),
    CFrame.new(94.42, 88.09, -2181.49),
    CFrame.new(77.57, 98.08, -2305.63),
    CFrame.new(48.30, 105.96, -2402.89),
    CFrame.new(7.12, 114.00, -2503.65),
    CFrame.new(-44.41, 118.41, -2572.87),
    CFrame.new(-117.90, 119.97, -2623.34),
    CFrame.new(-205.16, 120.48, -2666.85),
    CFrame.new(-292.81, 120.45, -2665.91),
    CFrame.new(-328.97, 124.58, -2704.49),
    CFrame.new(-418.72, 127.51, -2728.08),
    CFrame.new(-502.30, 130.77, -2750.76),
    CFrame.new(-602.78, 134.27, -2778.04),
    CFrame.new(-681.52, 137.26, -2801.96),
    CFrame.new(-743.74, 138.39, -2851.68),
    CFrame.new(-810.05, 138.12, -2942.23),
    CFrame.new(-864.98, 137.56, -3076.14),
    CFrame.new(-903.39, 137.51, -3165.93),
    CFrame.new(-944.51, 137.56, -3253.82),
    CFrame.new(-1011.05, 137.45, -3340.28),
    CFrame.new(-1104.31, 137.34, -3414.61),
    CFrame.new(-1200.11, 137.63, -3481.60),
    CFrame.new(-1274.50, 137.66, -3530.04),
    CFrame.new(-1354.42, 137.66, -3581.86),
    CFrame.new(-1422.08, 137.50, -3623.59),
    CFrame.new(-1494.67, 137.20, -3664.53),
    CFrame.new(-1553.00, 136.31, -3670.47),
    CFrame.new(-1638.09, 138.26, -3622.75),
    CFrame.new(-1664.94, 137.63, -3543.02),
    CFrame.new(-1639.15, 133.18, -3439.46),
    CFrame.new(-1610.05, 129.67, -3345.96),
    CFrame.new(-1574.91, 129.00, -3237.17),
    CFrame.new(-1541.11, 135.28, -3125.18),
    CFrame.new(-1500.60, 143.22, -2996.22),
    CFrame.new(-1462.49, 151.06, -2868.37),
    CFrame.new(-1414.85, 160.79, -2708.80),
    CFrame.new(-1382.65, 161.52, -2602.49),
    CFrame.new(-1348.85, 161.13, -2503.68),
    CFrame.new(-1319.66, 161.26, -2391.94),
    CFrame.new(-1318.80, 161.45, -2316.75),
    CFrame.new(-1356.36, 161.46, -2200.02),
    CFrame.new(-1391.51, 161.15, -2104.94),
    CFrame.new(-1423.18, 161.21, -2013.96),
    CFrame.new(-1443.75, 161.36, -1930.83),
    CFrame.new(-1415.17, 161.06, -1852.68),
    CFrame.new(-1338.22, 161.04, -1780.93),
    CFrame.new(-1257.99, 161.25, -1714.38),
    CFrame.new(-1177.83, 161.24, -1650.30),
    CFrame.new(-1107.98, 161.46, -1570.36),
    CFrame.new(-1104.61, 161.40, -1478.38),
    CFrame.new(-1154.03, 161.57, -1396.58),
    CFrame.new(-1241.22, 161.70, -1359.48),
    CFrame.new(-1348.24, 161.96, -1366.53),
    CFrame.new(-1470.16, 163.06, -1378.48),
    CFrame.new(-1588.14, 165.91, -1389.60),
    CFrame.new(-1729.20, 180.54, -1398.15),
    CFrame.new(-1868.63, 197.70, -1407.43),
    CFrame.new(-1994.23, 213.18, -1417.26),
    CFrame.new(-2128.89, 226.51, -1425.69),
    CFrame.new(-2261.30, 229.39, -1433.93),
    CFrame.new(-2387.33, 227.94, -1442.31),
    CFrame.new(-2508.79, 227.70, -1447.47),
    CFrame.new(-2597.08, 227.47, -1419.52),
    CFrame.new(-2689.28, 227.56, -1352.71),
    CFrame.new(-2749.97, 227.55, -1266.84),
    CFrame.new(-2812.39, 227.74, -1171.89),
    CFrame.new(-2878.49, 227.96, -1075.13),
    CFrame.new(-2930.11, 228.20, -1000.62),
    CFrame.new(-3003.08, 229.55, -945.91),
    CFrame.new(-3092.32, 232.26, -916.92),
    CFrame.new(-3199.59, 234.43, -919.64),
    CFrame.new(-3314.23, 235.10, -969.13),
    CFrame.new(-3396.14, 238.76, -1011.66),
    CFrame.new(-3495.41, 243.60, -1065.05),
    CFrame.new(-3598.17, 248.11, -1121.57),
    CFrame.new(-3712.72, 252.56, -1184.82),
    CFrame.new(-3823.75, 256.88, -1246.50),
    CFrame.new(-3895.54, 260.03, -1306.86),
    CFrame.new(-3952.84, 262.64, -1360.55),
    CFrame.new(-4024.46, 266.18, -1448.49),
    CFrame.new(-4064.87, 268.72, -1525.03),
    CFrame.new(-4091.69, 270.63, -1599.26),
    CFrame.new(-4117.47, 273.62, -1731.18),
    CFrame.new(-4133.27, 280.89, -1875.07),
    CFrame.new(-4144.08, 288.52, -1981.17),
    CFrame.new(-4151.91, 297.37, -2104.75),
    CFrame.new(-4166.75, 305.55, -2218.25),
    CFrame.new(-4178.82, 314.37, -2340.96),
    CFrame.new(-4192.04, 322.40, -2452.45),
    CFrame.new(-4196.85, 325.06, -2497.63),
    CFrame.new(-4208.89, 325.63, -2627.14),
    CFrame.new(-4222.07, 324.59, -2740.08),
    CFrame.new(-4235.35, 324.66, -2826.80),
    CFrame.new(-4280.73, 324.57, -2909.39),
    CFrame.new(-4359.09, 324.65, -2978.46),
    CFrame.new(-4465.26, 324.96, -3017.32),
    CFrame.new(-4592.80, 325.56, -3026.24),
    CFrame.new(-4709.63, 326.71, -3032.92),
    CFrame.new(-4819.54, 326.62, -3038.43),
    CFrame.new(-4930.98, 325.58, -3042.49),
    CFrame.new(-5037.95, 325.12, -3048.76),
    CFrame.new(-5114.78, 325.00, -3087.49),
    CFrame.new(-5154.37, 325.44, -3174.74),
    CFrame.new(-5110.99, 325.75, -3272.60),
    CFrame.new(-5018.91, 325.87, -3321.19),
    CFrame.new(-4909.22, 325.57, -3365.73),
    CFrame.new(-4803.55, 325.46, -3408.13),
    CFrame.new(-4709.39, 325.62, -3417.95),
    CFrame.new(-4585.25, 325.94, -3395.95),
    CFrame.new(-4460.45, 325.55, -3365.83),
    CFrame.new(-4345.85, 325.17, -3336.80),
    CFrame.new(-4231.26, 325.01, -3310.46),
    CFrame.new(-4135.29, 325.32, -3293.39),
    CFrame.new(-4025.33, 325.53, -3300.61),
    CFrame.new(-3924.73, 325.56, -3336.30),
    CFrame.new(-3819.98, 325.78, -3399.47),
    CFrame.new(-3706.07, 325.57, -3471.92),
    CFrame.new(-3610.71, 325.18, -3532.93),
    CFrame.new(-3509.46, 325.20, -3597.34),
    CFrame.new(-3433.21, 325.92, -3632.32),
    CFrame.new(-3332.63, 326.04, -3624.23),
    CFrame.new(-3236.63, 325.82, -3556.07),
    CFrame.new(-3173.47, 326.00, -3445.23),
    CFrame.new(-3114.14, 326.60, -3327.26),
    CFrame.new(-3052.54, 327.47, -3201.59),
    CFrame.new(-2988.55, 326.12, -3071.06),
    CFrame.new(-2928.44, 325.64, -2965.96),
    CFrame.new(-2823.73, 325.67, -2919.77),
    CFrame.new(-2738.32, 325.66, -2947.03),
    CFrame.new(-2683.86, 325.72, -3020.76),
    CFrame.new(-2677.32, 325.90, -3134.61),
    CFrame.new(-2672.27, 326.03, -3256.94),
    CFrame.new(-2667.41, 326.09, -3380.05),
    CFrame.new(-2645.62, 326.13, -3492.55),
    CFrame.new(-2588.28, 326.04, -3581.69),
    CFrame.new(-2506.65, 326.11, -3648.37),
    CFrame.new(-2387.72, 326.19, -3708.51),
    CFrame.new(-2275.73, 326.06, -3763.85),
    CFrame.new(-2184.64, 325.99, -3824.66),
    CFrame.new(-2159.16, 326.19, -3896.61),
    CFrame.new(-2186.30, 326.15, -3967.12),
    CFrame.new(-2256.84, 326.20, -4008.49),
    CFrame.new(-2381.65, 327.04, -4013.78),
    CFrame.new(-2517.56, 336.59, -4020.49),
    CFrame.new(-2636.00, 346.96, -4026.98),
    CFrame.new(-2742.94, 356.33, -4033.66),
    CFrame.new(-2855.01, 366.12, -4039.30),
    CFrame.new(-2947.67, 371.59, -4044.38),
    CFrame.new(-3044.75, 373.50, -4052.38),
    CFrame.new(-3147.15, 372.55, -4057.01),
    CFrame.new(-3248.30, 371.67, -4061.58),
    CFrame.new(-3328.37, 371.84, -4067.47),
    CFrame.new(-3420.52, 371.64, -4125.18),
    CFrame.new(-3473.51, 371.56, -4218.06),
    CFrame.new(-3475.53, 371.63, -4330.40),
    CFrame.new(-3426.29, 371.88, -4428.07),
    CFrame.new(-3355.32, 371.68, -4514.17),
    CFrame.new(-3285.48, 371.49, -4604.33),
    CFrame.new(-3203.04, 371.48, -4715.45),
    CFrame.new(-3154.27, 371.36, -4812.73),
    CFrame.new(-3123.69, 371.50, -4946.04),
    CFrame.new(-3135.40, 371.40, -5078.09),
    CFrame.new(-3157.02, 371.43, -5224.78),
    CFrame.new(-3174.29, 371.58, -5341.75),
    CFrame.new(-3191.98, 371.71, -5452.23),
    CFrame.new(-3209.86, 371.56, -5572.87),
    CFrame.new(-3204.22, 371.27, -5679.36),
    CFrame.new(-3160.53, 371.18, -5758.71),
    CFrame.new(-3082.54, 371.47, -5820.42),
    CFrame.new(-2972.27, 371.48, -5833.70),
    CFrame.new(-2849.61, 371.31, -5766.76),
    CFrame.new(-2795.91, 371.43, -5665.23),
    CFrame.new(-2781.48, 372.64, -5564.21),
    CFrame.new(-2771.36, 381.72, -5437.06),
    CFrame.new(-2761.35, 392.75, -5311.33),
    CFrame.new(-2753.04, 401.90, -5207.11),
    CFrame.new(-2747.25, 406.86, -5134.43),
    CFrame.new(-2739.75, 406.48, -5040.59),
    CFrame.new(-2730.72, 405.36, -4927.56),
    CFrame.new(-2702.34, 405.19, -4829.98),
    CFrame.new(-2631.24, 405.05, -4756.51),
    CFrame.new(-2520.92, 405.20, -4720.93),
    CFrame.new(-2397.04, 405.25, -4744.71),
    CFrame.new(-2269.86, 405.49, -4779.31),
    CFrame.new(-2141.59, 405.58, -4814.20),
    CFrame.new(-2029.64, 405.50, -4818.40),
    CFrame.new(-1934.99, 405.22, -4764.57),
    CFrame.new(-1875.82, 405.35, -4679.78),
    CFrame.new(-1847.69, 405.59, -4569.48),
    CFrame.new(-1822.29, 405.60, -4468.15),
    CFrame.new(-1746.00, 405.75, -4372.21),
    CFrame.new(-1637.59, 405.72, -4335.94),
    CFrame.new(-1545.19, 405.85, -4348.41),
    CFrame.new(-1464.93, 405.81, -4404.24),
    CFrame.new(-1417.34, 405.76, -4489.29),
    CFrame.new(-1415.38, 405.76, -4607.23),
    CFrame.new(-1450.12, 407.05, -4720.03),
    CFrame.new(-1481.56, 405.25, -4820.92),
    CFrame.new(-1512.13, 398.33, -4919.27),
    CFrame.new(-1542.16, 390.81, -5022.18),
    CFrame.new(-1579.76, 383.31, -5144.54),
    CFrame.new(-1612.35, 381.89, -5258.66),
    CFrame.new(-1646.69, 380.77, -5365.97),
    CFrame.new(-1653.66, 380.82, -5447.45),
    CFrame.new(-1630.20, 380.76, -5502.86),
    CFrame.new(-1558.24, 381.09, -5568.67),
    CFrame.new(-1472.00, 380.58, -5568.67),
    CFrame.new(-1390.69, 380.55, -5525.63),
    CFrame.new(-1320.27, 380.82, -5443.17),
    CFrame.new(-1268.93, 381.02, -5373.95),
    CFrame.new(-1205.77, 380.89, -5289.23),
    CFrame.new(-1144.33, 380.91, -5222.63),
    CFrame.new(-1080.74, 380.52, -5180.26),
    CFrame.new(-1015.92, 380.92, -5129.08),
    CFrame.new(-950.19, 380.89, -5081.08),
    CFrame.new(-881.52, 380.78, -5030.11),
    CFrame.new(-817.30, 380.52, -4977.70),
    CFrame.new(-765.99, 380.53, -4917.84),
    CFrame.new(-745.46, 380.42, -4819.73),
    CFrame.new(-779.17, 380.43, -4719.70),
    CFrame.new(-847.11, 380.63, -4650.80),
    CFrame.new(-944.74, 380.92, -4565.50),
    CFrame.new(-1000.84, 380.86, -4491.04),
    CFrame.new(-1011.50, 380.87, -4401.50),
    CFrame.new(-977.29, 380.92, -4319.72),
    CFrame.new(-911.39, 380.83, -4270.20),
    CFrame.new(-784.92, 381.08, -4259.98),
    CFrame.new(-689.21, 382.49, -4279.91),
    CFrame.new(-583.26, 382.49, -4279.88),
    CFrame.new(-507.46, 382.49, -4219.92),
    CFrame.new(-446.53, 381.09, -4145.48),
    CFrame.new(-446.53, 381.09, -4145.48),
    CFrame.new(-446.53, 381.09, -4145.48)
}

-- Function to update stats display
local function updateStatsDisplay()
    if _G.FARM_CONTROL.SafetyEnabled then
        LapsValue.Text = tostring(farmStats.lapsCompleted)
        RacesValue.Text = tostring(farmStats.racesCompleted)
        MoneyValue.Text = "¥" .. formatNumber(farmStats.moneyEarned)
        
        -- Update session time
        if farmStats.startTime > 0 then
            local elapsedTime = tick() - farmStats.startTime
            local hours = math.floor(elapsedTime / 3600)
            local minutes = math.floor((elapsedTime % 3600) / 60)
            local seconds = math.floor(elapsedTime % 60)
            SessionTimer.Text = string.format("Session Time: %02d:%02d:%02d", hours, minutes, seconds)
        end
    end
end

-- Set up timer update loop
spawn(function()
    while _G.FARM_CONTROL.SafetyEnabled do
        updateStatsDisplay()
        wait(1)
    end
end)

-- ====================== 🔥 ENHANCED MOVEMENT FUNCTION 🔥 ======================
local RunService = game:GetService("RunService")

local function safeCarMovement(car, cf, duration, farmType)
    -- ✅ Control check
    if not shouldContinue(farmType) then return false end

    -- ✅ Validate inputs
    if not cf or typeof(cf) ~= "CFrame" then
        warn("⚠️ Invalid target CFrame")
        return false
    end
    if not car or not car:IsA("Model") then
        warn("⚠️ Invalid car model")
        return false
    end

    -- ✅ Setup PrimaryPart
    if not car.PrimaryPart then
        local root = car:FindFirstChildWhichIsA("BasePart")
        if not root then
            warn("⚠️ No valid PrimaryPart found")
            return false
        end
        car.PrimaryPart = root
    end
    
    -- ✅ Calculate velocity
    local startPos = car.PrimaryPart.Position
    local endPos = cf.Position
    local distance = (endPos - startPos).Magnitude
    if distance == 0 then return true end

    local velocity = (endPos - startPos).Unit * (distance / duration)
    local targetLook = CFrame.lookAt(startPos, Vector3.new(endPos.X, startPos.Y, endPos.Z))
    car:SetPrimaryPartCFrame(targetLook)

    -- ✅ Set velocity & orientation
    local part = car.PrimaryPart
    part.AssemblyLinearVelocity = velocity
    part.AssemblyAngularVelocity = Vector3.zero

    -- ✅ Wait for precise duration using delta time
    local elapsed = 0
    while elapsed < duration do
        if not shouldContinue(farmType) then
            part.AssemblyLinearVelocity = Vector3.zero
            warn("🛑 Movement interrupted by control flag")
            return false
        end
        local dt = RunService.Heartbeat:Wait()
        elapsed += dt
    end

    -- ✅ Snap to final position
    local vim = game:GetService("VirtualInputManager")
    vim:SendKeyEvent(true, Enum.KeyCode.W, false, game)

    car:PivotTo(cf)
    part.AssemblyLinearVelocity = Vector3.zero
    part.AssemblyAngularVelocity = Vector3.zero
    return true
end



-- ====================== 🔥 IMPROVED STOP ALL FUNCTION 🔥 ======================
StopAllButton.MouseButton1Click:Connect(function()
    -- 🔥 IMMEDIATE FORCE STOP
    _G.FARM_CONTROL.ForceStop = true
    _G.FARM_CONTROL.RaceLoopRunning = false
    _G.FARM_CONTROL.LapsTestLoop = false
    _G.FARM_CONTROL.CombinedFarmRunning = false
    
    -- Also stop the old global variables for compatibility
    _G.RaceLoopRunning = false
    _G.LapsTestLoop = false
    _G.CombinedFarmRunning = false
    
    -- Reset UI immediately
    resetAllButtons()
    StatusDisplay.Text = "STATUS: FORCE STOPPED"
    StatusDisplay.TextColor3 = Color3.fromRGB(255, 100, 100)
    flashColor(Color3.new(1, 0, 0))
    
    notify("FORCE STOP", "All farms force stopped immediately!", 3)
    
    -- 🔥 RUN CUSTOM CODE
    pcall(runCustomStopCode)
    
    -- Show final stats
    if farmStats.startTime > 0 then
        farmStats.sessionDuration = tick() - farmStats.startTime
        local message = "Session: " .. SessionTimer.Text:gsub("Session Time: ", "")
        
        if farmStats.lapsCompleted > 0 then
            message = message .. " | Laps: " .. farmStats.lapsCompleted
        end
        
        if farmStats.racesCompleted > 0 then
            message = message .. " | Races: " .. farmStats.racesCompleted
        end
        
        if farmStats.moneyEarned > 0 then
            message = message .. " | Money: ¥" .. formatNumber(farmStats.moneyEarned)
        end
        
        notify("Final Stats", message, 8)
    end
    
    -- Reset force stop after a delay
    task.wait(3)
    _G.FARM_CONTROL.ForceStop = false
    StatusDisplay.Text = "STATUS: READY"
    StatusDisplay.TextColor3 = Color3.fromRGB(0, 255, 128)
end)

-- ====================== 🔥 ENHANCED MONEY FARM FUNCTION 🔥 ======================
MoneyFarmButton.MouseButton1Click:Connect(function()
    _G.FARM_CONTROL.RaceLoopRunning = not _G.FARM_CONTROL.RaceLoopRunning
    _G.RaceLoopRunning = _G.FARM_CONTROL.RaceLoopRunning  -- Keep compatibility
    
    if _G.FARM_CONTROL.RaceLoopRunning then
        -- Update UI
        resetAllButtons()
        toggleButtonState(MoneyFarmButton, true)
        StatusDisplay.Text = "STATUS: MONEY FARM ACTIVE"
        StatusDisplay.TextColor3 = Color3.fromRGB(0, 255, 128)
        flashColor(Color3.new(0, 1, 0))
        
        notify("Farm Status", "Money Farm activated", 3)
        farmStats.startTime = tick()
        farmStats.racesCompleted = 0
        resetErrorCount()
        
        task.spawn(function()
            while shouldContinue("money") do
                local success, err = pcall(function()
                    if not shouldContinue("money") then return end
                    
                    local player = game:GetService("Players").LocalPlayer
                    local character = player.Character or player.CharacterAdded:Wait()
                    local humanoid = character:WaitForChild("Humanoid")
                    local guiFolder = player:WaitForChild("PlayerGui")

                    local raceName = "Goliath's Marathon"
                    local raceMode = "Sprint"
                    local trigger = workspace:WaitForChild("Proximity Triggers", 9e9):WaitForChild(raceName, 9e9):WaitForChild("Focus", 9e9)

                    local voteArgs = {
                        raceName,
                        raceMode,
                        trigger,
                        { Trigger = trigger, MaxRacers = 8 },
                        true
                    }
                    local startArgs = {
                        raceName,
                        raceMode,
                        true,
                        { Trigger = trigger, MaxRacers = 8 },
                        trigger
                    }

                    if not shouldContinue("money") then return end

                    -- Start race
                    pcall(function()
                        game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions", 9e9)
                            :WaitForChild("RaceEvents", 9e9):WaitForChild("Entry", 9e9)
                            :InvokeServer(unpack(startArgs))
                    end)

                    task.wait(0.01)
                    if not shouldContinue("money") then return end

                    -- Vote to start
                    pcall(function()
                        game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions", 9e9)
                            :WaitForChild("RaceEvents", 9e9):WaitForChild("VoteToStart", 9e9)
                            :InvokeServer(unpack(voteArgs))
                    end)
                    notify("Race Status", "Race starting...", 2)
                    
                    if not shouldContinue("money") then return end
                    
                    -- Wait for race GUI
                    local timeScoreLabel = guiFolder:WaitForChild("ProgressGui"):WaitForChild("Header"):WaitForChild("TimeScore")
                    
                    local timeoutStart = tick()
                    repeat 
                        if not shouldContinue("money") then return end
                        task.wait(0.05) 
                    until timeScoreLabel.Visible or tick() - timeoutStart > 10
                    
                    if not timeScoreLabel.Visible then
                        return handleError("Race GUI didn't appear in time", false)
                    end

                    local originalText = timeScoreLabel.Text
                    
                    -- Wait for race to start
                    local raceStartTimeout = tick()
                    while task.wait(0.05) do
                        if not shouldContinue("money") then return end
                        
                        if timeScoreLabel.Text ~= originalText then
                            break
                        end
                        
                        if tick() - raceStartTimeout > 15 then
                            return handleError("Race didn't start properly", false)
                        end
                    end
                    
                    if not shouldContinue("money") then return end
                    
                    notify("Race Status", "Race in progress", 2)
                    
                    -- Get car and prepare for path following
                    local VehiclesFolder = workspace:FindFirstChild("VehiclesFolder") or workspace
                    local car = VehiclesFolder:FindFirstChild(player.Name)
                    car = car and car:FindFirstChildOfClass("Model")

                    if not car or not car:IsA("Model") then
                        return handleError("Car model not found", false)
                    end

                    local driveSeat = car:FindFirstChildWhichIsA("VehicleSeat")
                    if not driveSeat then
                        return handleError("Drive seat missing", false)
                    end

                    -- Car stabilization function
                    local function lockCarUpright()
                        if shouldContinue("money") then
                            local bg = Instance.new("BodyGyro")
                            bg.MaxTorque = Vector3.new(1e5, 0, 1e5)
                            bg.P = 1e5
                            bg.CFrame = CFrame.new()
                            bg.Parent = car.PrimaryPart
                        end
                    end

                    -- Enhanced path following with safety checks
                    local function followPath()
                        for i, cf in ipairs(path) do
                            if not shouldContinue("money") then return false end
                            local success = safeCarMovement(car, cf, 0.082, "money")
                            if not success then return false end
                        end
                        return true
                    end

                    -- Prepare car physics
                    if shouldContinue("money") then
                        for _, part in ipairs(car:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.Anchored = false
                                part.Massless = false
                            end
                        end

                        local wheels = car:FindFirstChild("Wheels")
                        if wheels then
                            for _, part in ipairs(wheels:GetDescendants()) do
                                if part:IsA("BasePart") then
                                    part.CanCollide = false
                                    part.Massless = true
                                end
                            end
                        end
                    end
                    local vim = game:GetService("VirtualInputManager")
                    if not shouldContinue("money") then return end
                    vim:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                    task.wait(0.1)
                    vim:SendKeyEvent(false, Enum.KeyCode.E, false, game)
                    -- Execute path following
                    lockCarUpright()
                    task.wait(0.001)
                    
                    local pathSuccess = followPath()
                    if not pathSuccess then return end
                    
                    if not shouldContinue("money") then return end
                    
                

                    if not shouldContinue("money") then return end
                    vim:SendKeyEvent(false, Enum.KeyCode.W, false, game)
                    -- Clean up after race
                    task.wait(0.01)
                    if shouldContinue("money") then
                        for _, part in ipairs(car:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.Anchored = true
                                part.CanCollide = false
                                part.Massless = true
                            end
                        end

                        -- wait for gui
                        
                        repeat
                            task.wait(0.01)
                            local playerGui = player:FindFirstChild("PlayerGui")
                            if playerGui then
                                guiFolder = playerGui:FindFirstChild("ProgressGui")
                            end
                        until guiFolder.Results.Visible == true

                        -- Now ProgressGui has been found
                        print("✅ ProgressGui has been created!")
                        task.wait(1)
                        -- Clean up GUI
                        local guiFolder = player:WaitForChild("PlayerGui")
                        for _, gui in ipairs(guiFolder:GetChildren()) do
                            if gui:IsA("ScreenGui") and gui.Name == "ProgressGui" then
                                gui:Destroy()
                            end
                        end
                        
                        -- Update statistics
                        farmStats.racesCompleted += 1
                        farmStats.moneyEarned += 570000
                        farmStats.sessionDuration = tick() - farmStats.startTime
                        
                        notify("Race Status", "Race completed successfully", 2)
                        resetErrorCount()
                    end
                end)

                if not success then
                    if handleError(err, false) then
                        -- Critical error, reset the farm
                        _G.FARM_CONTROL.RaceLoopRunning = false
                        _G.RaceLoopRunning = false
                        task.wait(5)
                        if shouldContinue("money") then
                            _G.FARM_CONTROL.RaceLoopRunning = true
                            _G.RaceLoopRunning = true
                        end
                    end
                end

                if not shouldContinue("money") then break end
                task.wait(0.5)
            end
        end)
    else
        -- Stop money farm
        task.wait(0.1)
        toggleButtonState(MoneyFarmButton, false)
        StatusDisplay.Text = "STATUS: READY"
        StatusDisplay.TextColor3 = Color3.fromRGB(0, 255, 128)
        flashColor(Color3.new(1, 0, 0))
        
        notify("Farm Status", "Money Farm deactivated", 3)
        if farmStats.startTime > 0 then
            farmStats.sessionDuration = tick() - farmStats.startTime
            notify("Farm Stats", "Completed: " .. farmStats.racesCompleted .. " races", 5)
        end
    end
end)

-- ====================== 🔥 ENHANCED LAPS FARM FUNCTION 🔥 ======================
LapsFarmButton.MouseButton1Click:Connect(function()
    _G.FARM_CONTROL.LapsTestLoop = not _G.FARM_CONTROL.LapsTestLoop
    _G.LapsTestLoop = _G.FARM_CONTROL.LapsTestLoop  -- Keep compatibility
    
    if _G.FARM_CONTROL.LapsTestLoop then
        -- Update UI
        resetAllButtons()
        toggleButtonState(LapsFarmButton, true)
        StatusDisplay.Text = "STATUS: LAPS FARM ACTIVE"
        StatusDisplay.TextColor3 = Color3.fromRGB(0, 255, 128)
        flashColor(Color3.new(0, 1, 0))
        
        notify("Farm Status", "Laps Farm activated", 3)
        farmStats.startTime = tick()
        farmStats.lapsCompleted = 0
        resetErrorCount()
        
        task.spawn(function()
            while shouldContinue("laps") do
                local success, err = pcall(function()
                    if not shouldContinue("laps") then return end
                    
                    local player = game:GetService("Players").LocalPlayer
                    local character = player.Character or player.CharacterAdded:Wait()
                    local humanoid = character:WaitForChild("Humanoid")
                    local hrp = character:WaitForChild("HumanoidRootPart")
                    local VehiclesFolder = workspace:FindFirstChild("VehiclesFolder") or workspace
                    local guiFolder = player:WaitForChild("PlayerGui")
                    
                    -- First-time setup
                    if _G.LapsFarmFirstTime == false then
                        notify("Setup", "Initializing vehicle...", 3)
                        
                        task.wait(0.05)
                        if not shouldContinue("laps") then return end
                        
                        -- Start race
                        game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions", 9e9):WaitForChild(
                                "RaceEvents",
                                9e9
                            ):WaitForChild("Entry", 9e9):InvokeServer(unpack(proxstartargs))
                        task.wait(0.01)
                        
                        if not shouldContinue("laps") then return end
                        
                        -- Vote to start
                        game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions", 9e9):WaitForChild(
                                "RaceEvents",
                                9e9
                            ):WaitForChild("VoteToStart", 9e9):InvokeServer(unpack(proxvoteargs))
                        
                        -- Wait for car to spawn
                        local carWaitStart = tick()
                        repeat
                            if not shouldContinue("laps") then return end
                            
                            local playerVehicle = VehiclesFolder:FindFirstChild(player.Name)
                            if playerVehicle then
                                carModel = playerVehicle:FindFirstChildOfClass("Model")
                            end
                            task.wait(0.05)
                            
                            if tick() - carWaitStart > 15 then
                                return handleError("Vehicle didn't spawn in time", false)
                            end
                        until carModel
                        
                        if not shouldContinue("laps") then return end
                        
                        -- Wait for race GUI
                        local timeScoreLabel = player:WaitForChild("PlayerGui"):WaitForChild("ProgressGui"):WaitForChild("Header"):WaitForChild("TimeScore")
                        
                        local guiWaitStart = tick()
                        repeat
                            if not shouldContinue("laps") then return end
                            task.wait(0.05)
                            if tick() - guiWaitStart > 15 then
                                return handleError("Race GUI didn't appear in time", false)
                            end
                        until timeScoreLabel.Visible == true

                        notify("Setup", "Vehicle initialized: " .. carModel.Name, 3)
                        
                        local originalText = timeScoreLabel.Text
                        
                        -- Wait for race to start
                        local raceStartTimeout = tick()
                        repeat 
                            if not shouldContinue("laps") then return end
                            task.wait(0.05) 
                            if tick() - raceStartTimeout > 15 then
                                return handleError("Race didn't start properly", false)
                            end
                        until timeScoreLabel.Text ~= originalText
                        
                        if not shouldContinue("laps") then return end
                        
                        task.wait(0.05)   
                        local vim = game:GetService("VirtualInputManager")
                        vim:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                        task.wait(0.1)
                        vim:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                        task.wait(1)
                        
                        if not shouldContinue("laps") then return end
                        repeat
                            task.wait(0.01)
                            local playerGui = player:FindFirstChild("PlayerGui")
                            if playerGui then
                                guiFolder = playerGui:FindFirstChild("ProgressGui")
                            end
                        until guiFolder

                        -- Now ProgressGui has been found
                        print("✅ ProgressGui has been created!")
                        task.wait(1)
                        -- Clean up GUI
                        local guiFolder = player:WaitForChild("PlayerGui")
                        for _, gui in ipairs(guiFolder:GetChildren()) do
                            if gui:IsA("ScreenGui") and gui.Name == "ProgressGui" then
                                gui:Destroy()
                            end
                        end

                        _G.LapsFarmFirstTime = true
                    else
                        -- Regular lap farming
                        task.wait(0.05)
                        if not shouldContinue("laps") then return end
                        
                        hrp.CFrame = CFrame.new(260.512756 + 10, 10.2480259, 6.16564608)
                        
                        -- Remove existing vehicle
                        local deletecarargs = {[1] = "RemoveVehicle";}
                        game:GetService("ReplicatedStorage"):WaitForChild("FrameworkEvent", 9e9):FireServer(unpack(deletecarargs))
                        task.wait(0.05)
                        
                        if not shouldContinue("laps") then return end
                        
                        -- Spawn new vehicle
                        game:GetService("ReplicatedStorage"):WaitForChild("FrameworkEvent", 9e9):FireServer("SpawnVehicle",carModel.Name,CFrame.new(260.512756 + math.random(2,10), 10.2480259, 6.16564608 + math.random(2,10), 0.124603003, -3.01075032e-09, 0.992206693, 4.84657292e-09, 1, 2.42575759e-09, -0.992206693, 4.50654536e-09, 0.12))
                        notify("Lap Progress", "Vehicle spawned", 1)
                        
                        -- Wait for car to spawn
                        task.wait(5)
                        if not shouldContinue("laps") then return end
                        
                        local playerVehicle = VehiclesFolder:FindFirstChild(player.Name)
                        local car = playerVehicle and playerVehicle:FindFirstChildOfClass("Model")
                        
                        if not car then
                            return handleError("Vehicle not found after spawn", false)
                        else
                            -- Teleport to car
                            local DriveSeat = car:WaitForChild("DriveSeat")
                            hrp.CFrame = DriveSeat.CFrame
                            
                            -- Adjust camera
                            local camera = workspace.CurrentCamera
                            camera.CameraType = Enum.CameraType.Custom
                            local abovePosition = hrp.Position + Vector3.new(0, 20, 0)
                            local lookAt = hrp.Position
                            camera.CFrame = CFrame.new(abovePosition, lookAt)
                            player.CameraMaxZoomDistance = 4
                            player.CameraMinZoomDistance = 4
                        end
                        
                        task.wait(0.3)
                        if not shouldContinue("laps") then return end
                        
                        -- Simulate Enter key press to enter vehicle
                        local vim = game:GetService("VirtualInputManager")
                        vim:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                        task.wait(1.1)
                        vim:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                        task.wait(0.05)
                        
                        
                        if not shouldContinue("laps") then return end
                        
                        -- Reset camera
                        local camera = workspace.CurrentCamera
                        camera.CameraType = Enum.CameraType.Custom
                        player.CameraMaxZoomDistance = 1000
                        player.CameraMinZoomDistance = 0
                        
                        -- Car movement setup
                        local function lockCarUpright()
                            if shouldContinue("laps") then
                                local bodyGyro = Instance.new("BodyGyro")
                                bodyGyro.MaxTorque = Vector3.new(1e5, 0, 1e5)
                                bodyGyro.P = 1e5
                                bodyGyro.CFrame = CFrame.new()
                                bodyGyro.Parent = car.PrimaryPart
                            end
                        end

                        if not car or not car:IsA("Model") then
                            return handleError("Car model invalid", false)
                        end

                        local driveSeat = car:FindFirstChildWhichIsA("VehicleSeat")
                        if not driveSeat then
                            return handleError("Drive seat missing", false)
                        end

                        -- Enhanced path following function
                        local function followPath()
                            for i = 1, #newlapspath do
                                if not shouldContinue("laps") then return false end
                                local success = safeCarMovement(car, newlapspath[i], 0.125, "laps")
                                if not success then return false end
                            end
                            return true
                        end

                        -- Prepare car physics
                        task.wait(0.001)
                        if car and shouldContinue("laps") then
                            for _, part in ipairs(car:GetDescendants()) do
                                if part:IsA("BasePart") then
                                    part.Anchored = false
                                    part.Massless = false
                                end
                            end
                            
                            task.wait(0.001)
                            for _, part in ipairs(car.Wheels:GetDescendants()) do
                                if part:IsA("BasePart") then
                                    part.CanCollide = false
                                    part.Massless = true
                                end
                            end
                        end
                        
                        if not shouldContinue("laps") then return end
                        
                        task.wait(0.001)
                        lockCarUpright()
                        task.wait(0.5)
                        local vim = game:GetService("VirtualInputManager")
                        vim:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                        task.wait(0.1)
                        vim:SendKeyEvent(false, Enum.KeyCode.E, false, game)
                        task.wait(0.1)
                        
                        -- Execute path following
                        notify("Lap Progress", "Following path...", 1)
                        local pathSuccess = followPath()
                        if not pathSuccess then return end
                        
                        if not shouldContinue("laps") then return end
                        wait(0.1)
                        vim:SendKeyEvent(false, Enum.KeyCode.W, false, game)
                        
                        task.wait(1)
                        local vim = game:GetService("VirtualInputManager")
                        vim:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                        task.wait(0.1)
                        vim:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                        
                        -- Update statistics
                        farmStats.lapsCompleted += 1
                        farmStats.sessionDuration = tick() - farmStats.startTime
                        
                        notify("Lap Progress", "Lap completed successfully", 2)
                        resetErrorCount()
                    end
                end)
                
                if not success then
                    if handleError(err, false) then
                        -- Critical error, reset the farm
                        _G.FARM_CONTROL.LapsTestLoop = false
                        _G.LapsTestLoop = false
                        _G.LapsFarmFirstTime = false
                        task.wait(5)
                        if shouldContinue("laps") then
                            _G.FARM_CONTROL.LapsTestLoop = true
                            _G.LapsTestLoop = true
                        end
                    end
                end
                
                if not shouldContinue("laps") then break end
                task.wait(0.5)
            end
        end)
    else
        -- Stop laps farm
        toggleButtonState(LapsFarmButton, false)
        StatusDisplay.Text = "STATUS: READY"
        StatusDisplay.TextColor3 = Color3.fromRGB(0, 255, 128)
        flashColor(Color3.new(1, 0, 0))
        
        notify("Farm Status", "Laps Farm deactivated", 3)
        if farmStats.startTime > 0 then
            farmStats.sessionDuration = tick() - farmStats.startTime
            notify("Farm Stats", "Completed: " .. farmStats.lapsCompleted .. " laps", 5)
        end
    end
end)

-- ====================== 🔥 ENHANCED COMBINED FARM FUNCTION 🔥 ======================
CombinedFarmButton.MouseButton1Click:Connect(function()
    _G.FARM_CONTROL.CombinedFarmRunning = not _G.FARM_CONTROL.CombinedFarmRunning
    _G.CombinedFarmRunning = _G.FARM_CONTROL.CombinedFarmRunning  -- Keep compatibility
    
    -- Function to get laps from leaderstats
    local function getLapsFromLeaderboard()
        local player = game:GetService("Players").LocalPlayer
        
        -- Check if leaderstats and Laps exist
        if player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Laps") then
            return player.leaderstats.Laps.Value
        end
        
        return 0 -- Default if we can't find laps
    end
    
    if _G.FARM_CONTROL.CombinedFarmRunning then
        -- Update UI
        resetAllButtons()
        toggleButtonState(CombinedFarmButton, true)
        flashColor(Color3.new(0, 1, 0))
        
        -- Starting the farm
        farmStats.startTime = tick()
        farmStats.lapsCompleted = 0
        farmStats.racesCompleted = 0
        farmStats.moneyEarned = 0
        resetErrorCount()
        
        -- Initial laps check when button is pressed - ONLY CHECK ONCE HERE
        local initialLapsCount = getLapsFromLeaderboard()
        local shouldFarmLaps = initialLapsCount <= 105
        
        if shouldFarmLaps then
            StatusDisplay.Text = "STATUS: LAPS FARM ACTIVE (AUTO)"
            notify("Farm Status", "Starting Laps Farm (Current: " .. initialLapsCount .. "/105)", 3)
        else
            StatusDisplay.Text = "STATUS: MONEY FARM ACTIVE (AUTO)"
            notify("Farm Status", "Starting Money Farm (Laps > 105)", 3)
        end
        
        task.spawn(function()
            -- This is the main control loop
            while shouldContinue("combined") do
                local success, err = pcall(function()
                    if not shouldContinue("combined") then return end
                    
                    if shouldFarmLaps then
                        -- Stop money farm if running
                        if _G.FARM_CONTROL.RaceLoopRunning then
                            _G.FARM_CONTROL.RaceLoopRunning = false
                            _G.RaceLoopRunning = false
                            task.wait(1) -- Wait for money farm to stop
                        end
                        
                        -- Start laps farm if not running
                        if not _G.FARM_CONTROL.LapsTestLoop then
                            _G.FARM_CONTROL.LapsTestLoop = true
                            _G.LapsTestLoop = true
                            
                            -- Reset first time flag if needed
                            if getLapsFromLeaderboard() == 0 then
                                _G.LapsFarmFirstTime = false
                            end
                            
                            -- Laps farm loop
                            while _G.FARM_CONTROL.LapsTestLoop and shouldContinue("combined") do
                                if not shouldContinue("combined") then return end
                                
                                -- First-time setup
                                if _G.LapsFarmFirstTime == false then
                                    notify("Setup", "Initializing vehicle...", 3)
                                    
                                    task.wait(0.05)
                                    if not shouldContinue("combined") then return end
                                    
                                    -- Start race
                                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions", 9e9):WaitForChild(
                                            "RaceEvents",
                                            9e9
                                        ):WaitForChild("Entry", 9e9):InvokeServer(unpack(proxstartargs))
                                    task.wait(0.01)
                                    
                                    if not shouldContinue("combined") then return end
                                    
                                    -- Vote to start
                                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions", 9e9):WaitForChild(
                                            "RaceEvents",
                                            9e9
                                        ):WaitForChild("VoteToStart", 9e9):InvokeServer(unpack(proxvoteargs))
                                    
                                    local player = game:GetService("Players").LocalPlayer
                                    local VehiclesFolder = workspace:FindFirstChild("VehiclesFolder") or workspace
                                    
                                    -- Wait for car to spawn
                                    local carWaitStart = tick()
                                    repeat
                                        if not shouldContinue("combined") then return end
                                        
                                        local playerVehicle = VehiclesFolder:FindFirstChild(player.Name)
                                        if playerVehicle then
                                            carModel = playerVehicle:FindFirstChildOfClass("Model")
                                        end
                                        task.wait(0.05)
                                        
                                        if tick() - carWaitStart > 15 then
                                            return handleError("Vehicle didn't spawn in time", false)
                                        end
                                    until carModel
                                    
                                    if not shouldContinue("combined") then return end
                                    
                                    -- Wait for race GUI
                                    local timeScoreLabel = player:WaitForChild("PlayerGui"):WaitForChild("ProgressGui"):WaitForChild("Header"):WaitForChild("TimeScore")
                                    
                                    local guiWaitStart = tick()
                                    repeat
                                        if not shouldContinue("combined") then return end
                                        task.wait(0.05)
                                        if tick() - guiWaitStart > 15 then
                                            return handleError("Race GUI didn't appear in time", false)
                                        end
                                    until timeScoreLabel.Visible == true

                                    notify("Setup", "Vehicle initialized: " .. carModel.Name, 3)
                                    
                                    local originalText = timeScoreLabel.Text
                                    
                                    -- Wait for race to start
                                    local raceStartTimeout = tick()
                                    repeat 
                                        if not shouldContinue("combined") then return end
                                        task.wait(0.05) 
                                        if tick() - raceStartTimeout > 15 then
                                            return handleError("Race didn't start properly", false)
                                        end
                                    until timeScoreLabel.Text ~= originalText
                                    
                                    if not shouldContinue("combined") then return end
                                    
                                    task.wait(0.05)   
                                    local humanoid = player.Character:WaitForChild("Humanoid")
                                    local vim = game:GetService("VirtualInputManager")
                                    vim:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                                    task.wait(0.1)
                                    vim:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                                    task.wait(1)
                                    
                                    if not shouldContinue("combined") then return end
                                    -- wait for gui
                                    
                                    repeat
                                        task.wait(0.01)
                                        local playerGui = player:FindFirstChild("PlayerGui")
                                        if playerGui then
                                            guiFolder = playerGui:FindFirstChild("ProgressGui")
                                        end
                                    until guiFolder

                                    -- Now ProgressGui has been found
                                    print("✅ ProgressGui has been created!")
                                    task.wait(1)
                                    -- Clean up GUI
                                    local guiFolder = player:WaitForChild("PlayerGui")
                                    for _, gui in ipairs(guiFolder:GetChildren()) do
                                        if gui:IsA("ScreenGui") and gui.Name == "ProgressGui" then
                                            gui:Destroy()
                                        end
                                    end

                                    _G.LapsFarmFirstTime = true
                                else
                                    -- Regular lap farming
                                    local player = game:GetService("Players").LocalPlayer
                                    local character = player.Character or player.CharacterAdded:Wait()
                                    local humanoid = character:WaitForChild("Humanoid")
                                    local hrp = character:WaitForChild("HumanoidRootPart")
                                    local VehiclesFolder = workspace:FindFirstChild("VehiclesFolder") or workspace
                                    local guiFolder = player:WaitForChild("PlayerGui")
                                    
                                    task.wait(0.05)
                                    if not shouldContinue("combined") then return end
                                    
                                    hrp.CFrame = CFrame.new(260.512756 + 10, 10.2480259, 6.16564608)
                                    
                                    -- Remove existing vehicle
                                    local deletecarargs = {[1] = "RemoveVehicle";}
                                    game:GetService("ReplicatedStorage"):WaitForChild("FrameworkEvent", 9e9):FireServer(unpack(deletecarargs))
                                    task.wait(0.05)
                                    
                                    if not shouldContinue("combined") then return end
                                    
                                    -- Spawn new vehicle
                                    game:GetService("ReplicatedStorage"):WaitForChild("FrameworkEvent", 9e9):FireServer("SpawnVehicle",carModel.Name,CFrame.new(260.512756 + math.random(2,10), 10.2480259, 6.16564608 + math.random(2,10), 0.124603003, -3.01075032e-09, 0.992206693, 4.84657292e-09, 1, 2.42575759e-09, -0.992206693, 4.50654536e-09, 0.12))
                                    notify("Lap Progress", "Vehicle spawned", 1)
                                    
                                    -- Wait for car to spawn
                                    task.wait(5)
                                    if not shouldContinue("combined") then return end
                                    
                                    local playerVehicle = VehiclesFolder:FindFirstChild(player.Name)
                                    local car = playerVehicle and playerVehicle:FindFirstChildOfClass("Model")
                                    
                                    if not car then
                                        return handleError("Vehicle not found after spawn", false)
                                    else
                                        -- Teleport to car
                                        local DriveSeat = car:WaitForChild("DriveSeat")
                                        hrp.CFrame = DriveSeat.CFrame
                                        
                                        -- Adjust camera
                                        local camera = workspace.CurrentCamera
                                        camera.CameraType = Enum.CameraType.Custom
                                        local abovePosition = hrp.Position + Vector3.new(0, 20, 0)
                                        local lookAt = hrp.Position
                                        camera.CFrame = CFrame.new(abovePosition, lookAt)
                                        player.CameraMaxZoomDistance = 4
                                        player.CameraMinZoomDistance = 4
                                    end
                                    
                                    task.wait(0.3)
                                    if not shouldContinue("combined") then return end
                                    
                                    -- Simulate Enter key press to enter vehicle
                                    local vim = game:GetService("VirtualInputManager")
                                    vim:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                                    task.wait(1.1)
                                    vim:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                                    task.wait(0.05)
                                    
                                    if not shouldContinue("combined") then return end
                                    
                                    -- Reset camera
                                    local camera = workspace.CurrentCamera
                                    camera.CameraType = Enum.CameraType.Custom
                                    player.CameraMaxZoomDistance = 1000
                                    player.CameraMinZoomDistance = 0
                                    
                                    -- Car movement setup
                                    local function lockCarUpright()
                                        if shouldContinue("combined") then
                                            local bodyGyro = Instance.new("BodyGyro")
                                            bodyGyro.MaxTorque = Vector3.new(1e5, 0, 1e5)
                                            bodyGyro.P = 1e5
                                            bodyGyro.CFrame = CFrame.new()
                                            bodyGyro.Parent = car.PrimaryPart
                                        end
                                    end

                                    if not car or not car:IsA("Model") then
                                        return handleError("Car model invalid", false)
                                    end

                                    local driveSeat = car:FindFirstChildWhichIsA("VehicleSeat")
                                    if not driveSeat then
                                        return handleError("Drive seat missing", false)
                                    end

                                    -- Enhanced path following function
                                    local function followPath()
                                        for i = 1, #newlapspath do
                                            if not shouldContinue("combined") then return false end
                                            local success = safeCarMovement(car, newlapspath[i], 0.125, "combined")
                                            if not success then return false end
                                        end
                                        return true
                                    end

                                    -- Prepare car physics
                                    task.wait(0.001)
                                    if car and shouldContinue("combined") then
                                        for _, part in ipairs(car:GetDescendants()) do
                                            if part:IsA("BasePart") then
                                                part.Anchored = false
                                                part.Massless = false
                                            end
                                        end
                                        
                                        task.wait(0.001)
                                        for _, part in ipairs(car.Wheels:GetDescendants()) do
                                            if part:IsA("BasePart") then
                                                part.CanCollide = false
                                                part.Massless = true
                                            end
                                        end
                                    end
                                    
                                    if not shouldContinue("combined") then return end
                                    
                                    task.wait(0.001)
                                    lockCarUpright()
                                    task.wait(0.5)
                                    local vim = game:GetService("VirtualInputManager")
                                    vim:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                                    task.wait(0.1)
                                    vim:SendKeyEvent(false, Enum.KeyCode.E, false, game)

                                    -- Execute path following
                                    notify("Lap Progress", "Following path...", 1)
                                    local pathSuccess = followPath()
                                    if not pathSuccess then return end
                                    
                                    if not shouldContinue("combined") then return end
                                    
                                    task.wait(0.05)
                                    local vim = game:GetService("VirtualInputManager")
                                    vim:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                                    task.wait(0.1)
                                    vim:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                                    
                                    -- Check laps after completing a lap - ONLY CHECK HERE
                                    task.wait(1) -- Wait a moment for the lap to register
                                    
                                    if not shouldContinue("combined") then return end
                                    
                                    local currentLaps = getLapsFromLeaderboard()
                                    
                                    -- Update statistics
                                    farmStats.lapsCompleted += 1
                                    farmStats.sessionDuration = tick() - farmStats.startTime
                                    
                                    notify("Lap Progress", "Lap completed: " .. currentLaps .. "/105", 2)
                                    
                                    -- Check if we should switch to money farm
                                    if currentLaps >= 105 then
                                        shouldFarmLaps = false
                                        _G.FARM_CONTROL.LapsTestLoop = false
                                        _G.LapsTestLoop = false
                                        StatusDisplay.Text = "STATUS: MONEY FARM ACTIVE (AUTO)"
                                        notify("Farm Status", "Reached 105+ laps, switching to money farm", 3)
                                        break -- Exit the laps farm loop
                                    end
                                    
                                    resetErrorCount() -- Reset error counter after successful run
                                end
                                
                                -- Check if the combined farm was stopped
                                if not shouldContinue("combined") then
                                    break
                                end
                                
                                task.wait(0.01)
                            end
                        end
                    else
                        -- Farm money
                        -- Stop laps farm if running
                        if _G.FARM_CONTROL.LapsTestLoop then
                            _G.FARM_CONTROL.LapsTestLoop = false
                            _G.LapsTestLoop = false
                            task.wait(1) -- Wait for laps farm to stop
                        end
                        
                        -- Start money farm if not running
                        if not _G.FARM_CONTROL.RaceLoopRunning then
                            _G.FARM_CONTROL.RaceLoopRunning = true
                            _G.RaceLoopRunning = true
                            
                            -- Money farm loop
                            while _G.FARM_CONTROL.RaceLoopRunning and shouldContinue("combined") do
                                local innerSuccess, innerErr = pcall(function()
                                    if not shouldContinue("combined") then return end
                                    
                                    local player = game:GetService("Players").LocalPlayer
                                    local character = player.Character or player.CharacterAdded:Wait()
                                    local humanoid = character:WaitForChild("Humanoid")
                                    local guiFolder = player:WaitForChild("PlayerGui")

                                    local raceName = "Goliath's Marathon"
                                    local raceMode = "Sprint"
                                    local trigger = workspace:WaitForChild("Proximity Triggers", 9e9):WaitForChild(raceName, 9e9):WaitForChild("Focus", 9e9)

                                    local voteArgs = {
                                        raceName,
                                        raceMode,
                                        trigger,
                                        { Trigger = trigger, MaxRacers = 8 },
                                        true
                                    }
                                    local startArgs = {
                                        raceName,
                                        raceMode,
                                        true,
                                        { Trigger = trigger, MaxRacers = 8 },
                                        trigger
                                    }

                                    if not shouldContinue("combined") then return end
                                    
                                    -- Start race
                                    pcall(function()
                                        game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions", 9e9)
                                            :WaitForChild("RaceEvents", 9e9):WaitForChild("Entry", 9e9)
                                            :InvokeServer(unpack(startArgs))
                                    end)

                                    task.wait(0.01)
                                    if not shouldContinue("combined") then return end

                                    -- Vote to start
                                    pcall(function()
                                        game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions", 9e9)
                                            :WaitForChild("RaceEvents", 9e9):WaitForChild("VoteToStart", 9e9)
                                            :InvokeServer(unpack(voteArgs))
                                    end)
                                    notify("Race Status", "Race starting...", 2)
                                    
                                    if not shouldContinue("combined") then return end
                                    
                                    -- Wait for race GUI
                                    local timeScoreLabel = guiFolder:WaitForChild("ProgressGui"):WaitForChild("Header"):WaitForChild("TimeScore")
                                    
                                    local timeoutStart = tick()
                                    repeat 
                                        if not shouldContinue("combined") then return end
                                        task.wait(0.05) 
                                    until timeScoreLabel.Visible or tick() - timeoutStart > 10
                                    
                                    if not shouldContinue("combined") then return end
                                    
                                    if not timeScoreLabel.Visible then
                                        return handleError("Race GUI didn't appear in time", false)
                                    end

                                    local originalText = timeScoreLabel.Text
                                    
                                    -- Wait for race to start
                                    local raceStartTimeout = tick()
                                    while task.wait(0.05) do
                                        if not shouldContinue("combined") then return end
                                        
                                        if timeScoreLabel.Text ~= originalText then
                                            break
                                        end
                                        
                                        if tick() - raceStartTimeout > 15 then
                                            return handleError("Race didn't start properly", false)
                                        end
                                    end
                                    
                                    if not shouldContinue("combined") then return end
                                    
                                    notify("Race Status", "Race in progress", 2)
                                    
                                    -- Get car and prepare for path following
                                    local VehiclesFolder = workspace:FindFirstChild("VehiclesFolder") or workspace
                                    local car = VehiclesFolder:FindFirstChild(player.Name)
                                    car = car and car:FindFirstChildOfClass("Model")

                                    if not car or not car:IsA("Model") then
                                        return handleError("Car model not found", false)
                                    end

                                    local driveSeat = car:FindFirstChildWhichIsA("VehicleSeat")
                                    if not driveSeat then
                                        return handleError("Drive seat missing", false)
                                    end

                                    -- Car stabilization function
                                    local function lockCarUpright()
                                        if shouldContinue("combined") then
                                            local bg = Instance.new("BodyGyro")
                                            bg.MaxTorque = Vector3.new(1e5, 0, 1e5)
                                            bg.P = 1e5
                                            bg.CFrame = CFrame.new()
                                            bg.Parent = car.PrimaryPart
                                        end
                                    end

                                    -- Enhanced path following function
                                    local function followPath()
                                        for _, cf in ipairs(path) do
                                            if not shouldContinue("combined") then return false end
                                            local success = safeCarMovement(car, cf, 0.082, "combined")
                                            if not success then return false end
                                        end
                                        return true
                                    end

                                    -- Prepare car physics
                                    if shouldContinue("combined") then
                                        for _, part in ipairs(car:GetDescendants()) do
                                            if part:IsA("BasePart") then
                                                part.Anchored = false
                                                part.Massless = false
                                            end
                                        end

                                        local wheels = car:FindFirstChild("Wheels")
                                        if wheels then
                                            for _, part in ipairs(wheels:GetDescendants()) do
                                                if part:IsA("BasePart") then
                                                    part.CanCollide = false
                                                    part.Massless = true
                                                end
                                            end
                                        end
                                    end

                                    if not shouldContinue("combined") then return end
                                    
                                    -- Execute path following
                                    lockCarUpright()
                                    task.wait(0.001)
                                    
                                    local pathSuccess = followPath()
                                    if not pathSuccess then return end
                                    
                                    if not shouldContinue("combined") then return end
                                    
                                    task.wait(0.1)
                                    local vim = game:GetService("VirtualInputManager")
                                    vim:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                                    task.wait(0.1)
                                    vim:SendKeyEvent(false, Enum.KeyCode.Return, false, game)

                                    if not shouldContinue("combined") then return end
                                    
                                    -- Clean up after race
                                    task.wait(0.01)
                                    if shouldContinue("combined") then
                                        for _, part in ipairs(car:GetDescendants()) do
                                            if part:IsA("BasePart") then
                                                part.Anchored = true
                                                part.CanCollide = false
                                                part.Massless = true
                                            end
                                        end

                                        -- wait for gui
                                    
                                        repeat
                                            task.wait(0.01)
                                            local playerGui = player:FindFirstChild("PlayerGui")
                                            if playerGui then
                                                guiFolder = playerGui:FindFirstChild("ProgressGui")
                                            end
                                        until guiFolder

                                        -- Now ProgressGui has been found
                                        print("✅ ProgressGui has been created!")
                                        task.wait(1)
                                        -- Clean up GUI
                                        local guiFolder = player:WaitForChild("PlayerGui")
                                        for _, gui in ipairs(guiFolder:GetChildren()) do
                                            if gui:IsA("ScreenGui") and gui.Name == "ProgressGui" then
                                                gui:Destroy()
                                            end
                                        end
                                        
                                        -- Update statistics
                                        farmStats.racesCompleted += 1
                                        farmStats.moneyEarned += 570000 -- Estimated money per race
                                        farmStats.sessionDuration = tick() - farmStats.startTime
                                        
                                        notify("Race Status", "Race completed successfully", 2)
                                        resetErrorCount() -- Reset error counter after successful run
                                    end
                                end)

                                if not innerSuccess then
                                    if handleError(innerErr, false) then
                                        -- Critical error, reset the farm
                                        _G.FARM_CONTROL.RaceLoopRunning = false
                                        _G.RaceLoopRunning = false
                                        task.wait(5)
                                        if shouldContinue("combined") then
                                            _G.FARM_CONTROL.RaceLoopRunning = true
                                            _G.RaceLoopRunning = true
                                        end
                                    end
                                end

                                if not shouldContinue("combined") then break end
                                task.wait(0.5)
                            end
                        end
                    end
                end)
                
                if not success then
                    if handleError(err, false) then
                        -- Critical error, reset the farm
                        _G.FARM_CONTROL.CombinedFarmRunning = false
                        _G.CombinedFarmRunning = false
                        task.wait(5)
                        if shouldContinue("combined") then
                            _G.FARM_CONTROL.CombinedFarmRunning = true
                            _G.CombinedFarmRunning = true
                        end
                    end
                end
                
                if not shouldContinue("combined") then break end
                task.wait(0.5)
            end
        end)
    else
        -- Stop combined farm
        _G.FARM_CONTROL.LapsTestLoop = false
        _G.FARM_CONTROL.RaceLoopRunning = false
        _G.FARM_CONTROL.CombinedFarmRunning = false
        
        -- Also stop the old global variables for compatibility
        _G.LapsTestLoop = false
        _G.RaceLoopRunning = false
        _G.CombinedFarmRunning = false
        
        toggleButtonState(CombinedFarmButton, false)
        StatusDisplay.Text = "STATUS: READY"
        StatusDisplay.TextColor3 = Color3.fromRGB(0, 255, 128)
        flashColor(Color3.new(1, 0, 0))
        
        notify("Farm Status", "Combined Farm deactivated", 3)
        if farmStats.startTime > 0 then
            farmStats.sessionDuration = tick() - farmStats.startTime
            notify("Farm Stats", "Laps: " .. farmStats.lapsCompleted .. " | Races: " .. farmStats.racesCompleted, 5)
        end
    end
end)

-- Close button functionality
CloseButton.MouseButton1Click:Connect(function()
    -- 🔥 FORCE STOP ALL FARMS
    _G.FARM_CONTROL.ForceStop = true
    _G.FARM_CONTROL.RaceLoopRunning = false
    _G.FARM_CONTROL.LapsTestLoop = false
    _G.FARM_CONTROL.CombinedFarmRunning = false
    _G.FARM_CONTROL.SafetyEnabled = false
    
    -- Also stop the old global variables for compatibility
    _G.RaceLoopRunning = false
    _G.LapsTestLoop = false
    _G.CombinedFarmRunning = false
    
    -- 🔥 RUN CUSTOM CODE
    pcall(runCustomStopCode)
    
    -- Destroy GUI
    GUI:Destroy()
    
    -- Clean up global variables
    _G.IchikawaAutoFarmRunning = false
    
    notify("Script Status", "Auto Farm GUI closed safely", 3)
end)

-- Make GUI draggable
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TitleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Initial notification
notify("Ichikawa Auto Farm", "24/7 Safe version loaded successfully", 5)
notify("Custom Code", "Edit runCustomStopCode() function for custom stop behavior", 3)
