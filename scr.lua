
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

local function resetCarVelocity(car)
	if car and car.PrimaryPart then
		car.PrimaryPart.AssemblyLinearVelocity = Vector3.zero
		car.PrimaryPart.AssemblyAngularVelocity = Vector3.zero
	end
end


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
    task.wait(0.5)
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
local path = {
    CFrame.new(237.76, 15.25, -315.04),

}

local lapspath = {
    CFrame.new(237.76, 15.25, -315.04),

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
local function safeCarMovement(car, cf, duration, farmType)
    -- 🔥 SAFETY CHECK BEFORE MOVEMENT
    if not shouldContinue(farmType) then return false end
    
    if not cf or typeof(cf) ~= "CFrame" then
        warn("⚠️ Invalid CFrame.")
        return false
    end

    if not car or not car.PrimaryPart then
        local root = car and car:FindFirstChildWhichIsA("BasePart")
        if not root then
            warn("⚠️ No root part found for car")
            return false
        end
        car.PrimaryPart = root
    end

    local startPos = car.PrimaryPart.Position
    local endPos = cf.Position
    local distance = (endPos - startPos).Magnitude
    if distance == 0 then return true end

    local velocity = (endPos - startPos).Unit * (distance / duration)
    local lookAtCF = CFrame.lookAt(startPos, Vector3.new(endPos.X, startPos.Y, endPos.Z))
    
    car:SetPrimaryPartCFrame(lookAtCF)
    car.PrimaryPart.AssemblyLinearVelocity = Vector3.zero
    car.PrimaryPart.AssemblyAngularVelocity = Vector3.zero
    car.PrimaryPart.AssemblyLinearVelocity = velocity

    -- 🔥 WAIT WITH SAFETY CHECKS
    local elapsed = 0
    local RunService = game:GetService("RunService")
    while elapsed < duration do
        -- 🔥 CHECK FOR FORCE STOP DURING MOVEMENT
        if not shouldContinue(farmType) then 
            car.PrimaryPart.AssemblyLinearVelocity = Vector3.zero
            return false 
        end
        local dt = RunService.Heartbeat:Wait()
        elapsed += dt
    end

    car:PivotTo(cf)
    car.PrimaryPart.AssemblyLinearVelocity = Vector3.zero
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
                            local success = safeCarMovement(car, cf, 0.081, "money")
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

                    if not shouldContinue("money") then return end

                    -- Execute path following
                    lockCarUpright()
                    task.wait(0.001)
                    
                    local pathSuccess = followPath()
                    if not pathSuccess then return end
                    
                    if not shouldContinue("money") then return end
                    
                    

                    if not shouldContinue("money") then return end

                    -- Clean up after race
                    task.wait(0.01)
                    
                    resetCarVelocity(car)
                    task.wait(0.1)
                    if shouldContinue("money") then
                        for _, part in ipairs(car:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.Anchored = true
                                part.CanCollide = false
                                --part.Massless = false
                            end
                        end

                        task.wait(1)
                        for _, gui in ipairs(guiFolder:GetChildren()) do
                            if gui:IsA("ScreenGui") and gui.Name == "ProgressGui" then
                                gui:Destroy()
                            end
                        end
                        task.wait(0.1)
                        local vim = game:GetService("VirtualInputManager")
                        vim:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                        task.wait(0.1)
                        vim:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                            
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
                        
                        -- Clean up GUI
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
                        
                        hrp.CFrame = CFrame.new(237.76, 15.25, -315.04)
                        
                        -- Remove existing vehicle
                        local deletecarargs = {[1] = "RemoveVehicle";}
                        game:GetService("ReplicatedStorage"):WaitForChild("FrameworkEvent", 9e9):FireServer(unpack(deletecarargs))
                        task.wait(0.05)
                        
                        if not shouldContinue("laps") then return end
                        
                        -- Spawn new vehicle
                        game:GetService("ReplicatedStorage"):WaitForChild("FrameworkEvent", 9e9):FireServer("SpawnVehicle",carModel.Name,CFrame.new(245.459839 + math.random(-4, 4) * 5, 10.2480288, -283.624268 + math.random(-6, 6) * 5,0.970329344, -1.79303346e-08, 0.241787121,-3.26522054e-09, 1, 8.72613626e-08,-0.241787121, -8.54617497e-08, 0.970329344))
                        notify("Lap Progress", "Vehicle spawned", 1)
                        
                        -- Wait for car to spawn
                        task.wait(3)
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
                            for i = 1, #lapspath do
                                if not shouldContinue("laps") then return false end
                                local success = safeCarMovement(car, lapspath[i], 0.183, "laps")
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
                        task.wait(0.001)

                        -- Execute path following
                        notify("Lap Progress", "Following path...", 1)
                        local pathSuccess = followPath()
                        if not pathSuccess then return end
                        
                        if not shouldContinue("laps") then return end
                        task.wait(0.1)
                        resetCarVelocity(car)
                        task.wait(0.1)
                        
                        for _, part in ipairs(car:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.Anchored = true
                                part.CanCollide = false
                                --part.Massless = false
                            end
                        end
                        
                        task.wait(0.5)
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
                                    
                                    hrp.CFrame = CFrame.new(237.76, 15.25, -315.04)
                                    
                                    -- Remove existing vehicle
                                    local deletecarargs = {[1] = "RemoveVehicle";}
                                    game:GetService("ReplicatedStorage"):WaitForChild("FrameworkEvent", 9e9):FireServer(unpack(deletecarargs))
                                    task.wait(0.05)
                                    
                                    if not shouldContinue("combined") then return end
                                    
                                    -- Spawn new vehicle
                                    game:GetService("ReplicatedStorage"):WaitForChild("FrameworkEvent", 9e9):FireServer("SpawnVehicle",carModel.Name,CFrame.new(245.459839 + math.random(-4, 4) * 5, 10.2480288, -283.624268 + math.random(-6, 6) * 5,0.970329344, -1.79303346e-08, 0.241787121,-3.26522054e-09, 1, 8.72613626e-08,-0.241787121, -8.54617497e-08, 0.970329344))
                                    notify("Lap Progress", "Vehicle spawned", 1)
                                    
                                    -- Wait for car to spawn
                                    task.wait(3)
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
                                        for i = 1, #lapspath do
                                            if not shouldContinue("combined") then return false end
                                            local success = safeCarMovement(car, lapspath[i], 0.183, "combined")
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
                                    task.wait(0.001)

                                    -- Execute path following
                                    notify("Lap Progress", "Following path...", 1)
                                    local pathSuccess = followPath()
                                    if not pathSuccess then return end
                                    
                                    if not shouldContinue("combined") then return end
                                    
                                    task.wait(0.1)
                                    resetCarVelocity(car)
                                    task.wait(0.1)
                                    for _, part in ipairs(car:GetDescendants()) do
                                        if part:IsA("BasePart") then
                                            part.Anchored = true
                                            part.CanCollide = false
                                            --part.Massless = false
                                        end
                                    end
                                    task.wait(0.2)
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
                                    if currentLaps >= 104 then
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
                                            local success = safeCarMovement(car, cf, 0.081, "combined")
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
                                    
                                    

                                    if not shouldContinue("combined") then return end
                                    
                                    -- Clean up after race
                                    task.wait(0.01)
                                    if shouldContinue("combined") then
                                        task.wait(0.1)
                                        resetCarVelocity(car)
                                        for _, part in ipairs(car:GetDescendants()) do
                                            if part:IsA("BasePart") then
                                                part.Anchored = true
                                                part.CanCollide = false
                                                --part.Massless = false
                                            end
                                        end

                                        task.wait(0.5)
                                        for _, gui in ipairs(guiFolder:GetChildren()) do
                                            if gui:IsA("ScreenGui") and gui.Name == "ProgressGui" then
                                                gui:Destroy()
                                            end
                                        end
                                        task.wait(0.1)
                                        local vim = game:GetService("VirtualInputManager")
                                        vim:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                                        task.wait(0.1)
                                        vim:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                                        
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
