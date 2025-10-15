--fps
-- Made by RIP#6666
_G.Settings = {
    Players = {
        ["Ignore Me"] = true, -- Ignore your Character
        ["Ignore Others"] = true -- Ignore other Characters
    },
    Meshes = {
        Destroy = false, -- Destroy Meshes
        LowDetail = true -- Low detail meshes (NOT SURE IT DOES ANYTHING)
    },
    Images = {
        Invisible = true, -- Invisible Images
        LowDetail = false, -- Low detail images (NOT SURE IT DOES ANYTHING)
        Destroy = false, -- Destroy Images
    },
    ["No Particles"] = true, -- Disables all ParticleEmitter, Trail, Smoke, Fire and Sparkles
    ["No Camera Effects"] = true, -- Disables all PostEffect's (Camera/Lighting Effects)
    ["No Explosions"] = true, -- Makes Explosion's invisible
    ["No Clothes"] = true, -- Removes Clothing from the game
    ["Low Water Graphics"] = true, -- Removes Water Quality
    ["No Shadows"] = true, -- Remove Shadows
    ["Low Rendering"] = true, -- Lower Rendering
    ["Low Quality Parts"] = true -- Lower quality parts
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/FPSBooster.lua"))()







-- Death Trial Auto Farm - Simplified Single Button Version
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local TweenService = game:GetService("TweenService") -- Still needed for GUI animations
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager") -- Cache for performance
local ReplicatedStorage = game:GetService("ReplicatedStorage") -- Cache for performance

-- Remove any existing GUI
if Player.PlayerGui:FindFirstChild("DeathTrialAutoFarmGUI") then
    Player.PlayerGui:FindFirstChild("DeathTrialAutoFarmGUI"):Destroy()
end

-- Create main GUI
local GUI = Instance.new("ScreenGui")
GUI.Name = "DeathTrialAutoFarmGUI"
GUI.ResetOnSpawn = false
GUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
GUI.Parent = Player.PlayerGui

-- Create main frame with dark background
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 350, 0, 250)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -125)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = GUI

-- Add border glow effect
local BorderGlow = Instance.new("UIStroke")
BorderGlow.Color = Color3.fromRGB(255, 0, 0)
BorderGlow.Thickness = 2
BorderGlow.Parent = MainFrame

-- Add corner radius
local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 8)
Corner.Parent = MainFrame

-- Create title bar
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 35)
TitleBar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

-- Add corner radius to title bar
local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = TitleBar

-- Create title
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -40, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.TextColor3 = Color3.fromRGB(255, 50, 50)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Text = "DEATH TRIAL AUTO FARM"
Title.Parent = TitleBar

-- Create close button
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.Position = UDim2.new(1, -30, 0, 5)
CloseButton.BackgroundTransparency = 1
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 18
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Text = "×"
CloseButton.Parent = TitleBar

CloseButton.MouseButton1Click:Connect(function()
    GUI:Destroy()
end)

-- Create status display
local StatusDisplay = Instance.new("TextLabel")
StatusDisplay.Name = "StatusDisplay"
StatusDisplay.Size = UDim2.new(1, -40, 0, 25)
StatusDisplay.Position = UDim2.new(0, 20, 0, 50)
StatusDisplay.BackgroundTransparency = 1
StatusDisplay.Font = Enum.Font.GothamBold
StatusDisplay.TextSize = 14
StatusDisplay.TextColor3 = Color3.fromRGB(0, 255, 128)
StatusDisplay.Text = "STATUS: READY"
StatusDisplay.Parent = MainFrame

-- Create stats container
local StatsContainer = Instance.new("Frame")
StatsContainer.Name = "StatsContainer"
StatsContainer.Size = UDim2.new(1, -40, 0, 60)
StatsContainer.Position = UDim2.new(0, 20, 0, 82)
StatsContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
StatsContainer.BorderSizePixel = 0
StatsContainer.Parent = MainFrame

-- Add corner radius to stats container
local StatsCorner = Instance.new("UICorner")
StatsCorner.CornerRadius = UDim.new(0, 6)
StatsCorner.Parent = StatsContainer

-- Create laps stat
local LapsLabel = Instance.new("TextLabel")
LapsLabel.Size = UDim2.new(1, -10, 0, 20)
LapsLabel.Position = UDim2.new(0, 5, 0, 5)
LapsLabel.BackgroundTransparency = 1
LapsLabel.Font = Enum.Font.Gotham
LapsLabel.TextSize = 12
LapsLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
LapsLabel.TextXAlignment = Enum.TextXAlignment.Left
LapsLabel.Text = "Laps Completed: 0"
LapsLabel.Parent = StatsContainer

-- Create races stat
local RacesLabel = Instance.new("TextLabel")
RacesLabel.Size = UDim2.new(1, -10, 0, 20)
RacesLabel.Position = UDim2.new(0, 5, 0, 25)
RacesLabel.BackgroundTransparency = 1
RacesLabel.Font = Enum.Font.Gotham
RacesLabel.TextSize = 12
RacesLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
RacesLabel.TextXAlignment = Enum.TextXAlignment.Left
RacesLabel.Text = "Races Completed: 0"
RacesLabel.Parent = StatsContainer

-- Create farm button
local FarmButton = Instance.new("TextButton")
FarmButton.Name = "FarmButton"
FarmButton.Size = UDim2.new(1, -40, 0, 40)
FarmButton.Position = UDim2.new(0, 20, 0, 155)
FarmButton.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
FarmButton.BorderSizePixel = 0
FarmButton.Font = Enum.Font.GothamBold
FarmButton.TextSize = 14
FarmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FarmButton.Text = "START DEATH TRIAL FARM"
FarmButton.Parent = MainFrame

local FarmButtonCorner = Instance.new("UICorner")
FarmButtonCorner.CornerRadius = UDim.new(0, 6)
FarmButtonCorner.Parent = FarmButton

-- Create stop button
local StopButton = Instance.new("TextButton")
StopButton.Name = "StopButton"
StopButton.Size = UDim2.new(1, -40, 0, 40)
StopButton.Position = UDim2.new(0, 20, 0, 203)
StopButton.BackgroundColor3 = Color3.fromRGB(180, 30, 30)
StopButton.BorderSizePixel = 0
StopButton.Font = Enum.Font.GothamBold
StopButton.TextSize = 14
StopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StopButton.Text = "STOP FARM"
StopButton.Parent = MainFrame

local StopButtonCorner = Instance.new("UICorner")
StopButtonCorner.CornerRadius = UDim.new(0, 6)
StopButtonCorner.Parent = StopButton

-- Button hover effects
FarmButton.MouseEnter:Connect(function()
    TweenService:Create(FarmButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 170, 60)}):Play()
end)
FarmButton.MouseLeave:Connect(function()
    TweenService:Create(FarmButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 150, 50)}):Play()
end)

StopButton.MouseEnter:Connect(function()
    TweenService:Create(StopButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(200, 40, 40)}):Play()
end)
StopButton.MouseLeave:Connect(function()
    TweenService:Create(StopButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(180, 30, 30)}):Play()
end)

-- ====================== FARM CONTROL SYSTEM ======================
_G.FARM_CONTROL = _G.FARM_CONTROL or {
    DeathTrialRunning = false,
    SafetyEnabled = true,
    ForceStop = false
}

-- Statistics tracking
local farmStats = {
    lapsCompleted = 0,
    racesCompleted = 0,
    startTime = 0
}

-- Notification system
local function notify(title, text, duration)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = duration or 5
        })
    end)
end

-- Safety check function
local function shouldContinue(farmType)
    -- farmType parameter is optional, kept for compatibility
    return _G.FARM_CONTROL.DeathTrialRunning and _G.FARM_CONTROL.SafetyEnabled and not _G.FARM_CONTROL.ForceStop
end

-- Velocity reset function (for car and player)
local function resetVelocities(car, player)
    pcall(function()
        -- Reset car velocity
        if car and car.PrimaryPart then
            car.PrimaryPart.AssemblyLinearVelocity = Vector3.zero
            car.PrimaryPart.AssemblyAngularVelocity = Vector3.zero
        end
        
        -- Reset player character velocity
        if player and player.Character then
            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.AssemblyLinearVelocity = Vector3.zero
                hrp.AssemblyAngularVelocity = Vector3.zero
            end
        end
    end)
end

-- Death Trial CFrame Path
local deathTrialPath = {
    CFrame.new(4025.40, 644.49, -3003.55),
    CFrame.new(4095.05, 644.48, -2992.43),
    CFrame.new(4172.60, 644.48, -2978.66),
    CFrame.new(4245.25, 644.50, -2966.11),
    CFrame.new(4320.40, 644.50, -2953.28),
    CFrame.new(4394.90, 644.49, -2939.11),
    CFrame.new(4470.01, 643.60, -2925.92),
    CFrame.new(4545.83, 642.87, -2912.03),
    CFrame.new(4615.38, 642.52, -2883.25),
    CFrame.new(4659.80, 642.59, -2822.43),
    CFrame.new(4655.87, 642.33, -2747.19),
    CFrame.new(4628.23, 642.65, -2676.63),
    CFrame.new(4598.37, 642.81, -2605.56),
    CFrame.new(4577.22, 642.74, -2533.37),
    CFrame.new(4574.95, 642.80, -2459.93),
    CFrame.new(4597.52, 642.98, -2386.84),
    CFrame.new(4658.29, 642.97, -2343.16),
    CFrame.new(4731.71, 643.16, -2330.76),
    CFrame.new(4807.05, 642.79, -2330.36),
    CFrame.new(4879.89, 642.65, -2310.72),
    CFrame.new(4936.51, 642.80, -2261.47),
    CFrame.new(4962.14, 642.92, -2190.89),
    CFrame.new(4955.62, 643.47, -2114.56),
    CFrame.new(4934.39, 644.56, -2041.34),
    CFrame.new(4913.86, 640.07, -1970.23),
    CFrame.new(4892.24, 634.42, -1896.49),
    CFrame.new(4871.60, 633.48, -1826.57),
    CFrame.new(4843.16, 632.34, -1756.01),
    CFrame.new(4793.82, 631.80, -1701.81),
    CFrame.new(4718.54, 631.72, -1683.77),
    CFrame.new(4644.93, 632.83, -1696.47),
    CFrame.new(4571.88, 634.07, -1719.65),
    CFrame.new(4501.34, 632.19, -1742.42),
    CFrame.new(4450.30, 632.21, -1756.21),
    CFrame.new(4377.63, 632.21, -1759.84),
    CFrame.new(4302.24, 632.21, -1759.35),
    CFrame.new(4226.02, 632.21, -1757.47),
    CFrame.new(4148.74, 632.28, -1759.42),
    CFrame.new(4091.96, 633.93, -1800.18),
    CFrame.new(4076.97, 637.52, -1874.77),
    CFrame.new(4078.00, 640.78, -1950.51),
    CFrame.new(4050.01, 642.48, -2018.71),
    CFrame.new(3976.21, 639.15, -2026.41),
    CFrame.new(3908.26, 633.69, -1990.50),
    CFrame.new(3851.17, 632.78, -1945.50),
    CFrame.new(3796.30, 629.04, -1894.21),
    CFrame.new(3747.17, 616.50, -1837.53),
    CFrame.new(3686.90, 613.91, -1799.44),
    CFrame.new(3641.95, 615.48, -1848.47),
    CFrame.new(3667.90, 614.97, -1910.36),
    CFrame.new(3628.44, 616.10, -1963.28),
    CFrame.new(3556.10, 615.08, -1952.20),
    CFrame.new(3524.88, 612.69, -1890.56),
    CFrame.new(3490.29, 609.15, -1823.30),
    CFrame.new(3431.86, 604.78, -1782.85),
    CFrame.new(3355.31, 603.71, -1783.94),
    CFrame.new(3279.52, 603.57, -1785.14),
    CFrame.new(3220.76, 603.67, -1749.95),
    CFrame.new(3211.90, 603.72, -1676.01),
    CFrame.new(3238.67, 605.00, -1605.63),
    CFrame.new(3245.74, 603.35, -1534.56),
    CFrame.new(3199.27, 600.85, -1481.78),
    CFrame.new(3121.22, 599.71, -1482.78),
    CFrame.new(3053.50, 596.21, -1516.64),
    CFrame.new(2988.35, 587.51, -1552.75),
    CFrame.new(2925.09, 578.38, -1589.51),
    CFrame.new(2859.93, 569.11, -1628.01),
    CFrame.new(2791.15, 560.23, -1663.48),
    CFrame.new(2719.66, 554.78, -1685.71),
    CFrame.new(2643.09, 552.19, -1670.62),
    CFrame.new(2581.17, 549.97, -1629.90),
    CFrame.new(2513.92, 547.39, -1599.14),
    CFrame.new(2437.74, 545.62, -1591.36),
    CFrame.new(2362.43, 542.27, -1589.21),
    CFrame.new(2285.84, 533.84, -1588.78),
    CFrame.new(2209.76, 524.61, -1589.51),
    CFrame.new(2135.29, 521.72, -1591.37),
    CFrame.new(2058.74, 520.54, -1577.15),
    CFrame.new(2026.76, 520.40, -1514.59),
    CFrame.new(2071.94, 520.72, -1460.33),
    CFrame.new(2148.21, 521.94, -1450.49),
    CFrame.new(2223.65, 517.41, -1444.67),
    CFrame.new(2299.84, 506.30, -1441.26),
    CFrame.new(2376.27, 498.38, -1446.38),
    CFrame.new(2450.31, 490.84, -1451.11),
    CFrame.new(2526.66, 483.81, -1451.19),
    CFrame.new(2602.98, 479.79, -1445.06),
    CFrame.new(2641.68, 477.25, -1395.04),
    CFrame.new(2580.53, 478.36, -1370.09),
    CFrame.new(2506.64, 479.16, -1360.02),
    CFrame.new(2429.39, 476.20, -1347.51),
    CFrame.new(2355.48, 467.36, -1338.47),
    CFrame.new(2282.38, 455.27, -1330.08),
    CFrame.new(2204.20, 451.72, -1321.74),
    CFrame.new(2130.12, 451.78, -1301.77),
    CFrame.new(2086.71, 451.59, -1244.03),
    CFrame.new(2105.27, 451.70, -1173.82),
    CFrame.new(2169.51, 451.98, -1138.72),
    CFrame.new(2241.87, 451.97, -1112.35),
    CFrame.new(2316.00, 451.33, -1118.23),
    CFrame.new(2359.43, 451.65, -1180.51),
    CFrame.new(2406.37, 451.50, -1237.58),
    CFrame.new(2478.08, 451.63, -1222.46),
    CFrame.new(2550.74, 451.45, -1204.02),
    CFrame.new(2626.77, 451.48, -1215.10),
    CFrame.new(2686.82, 451.43, -1176.88),
    CFrame.new(2686.19, 451.80, -1101.17),
    CFrame.new(2675.04, 452.33, -1026.17),
    CFrame.new(2664.15, 452.09, -951.54),
    CFrame.new(2652.87, 451.87, -875.28),
    CFrame.new(2645.57, 451.67, -823.29),
    CFrame.new(2633.89, 451.58, -748.36),
    CFrame.new(2623.34, 451.43, -673.72),
    CFrame.new(2626.47, 451.20, -597.05),
    CFrame.new(2658.39, 452.21, -526.04),
    CFrame.new(2664.77, 452.40, -453.18),
    CFrame.new(2613.01, 452.40, -396.40),
    CFrame.new(2572.66, 452.57, -333.24),
    CFrame.new(2579.32, 454.46, -258.98),
    CFrame.new(2621.24, 457.40, -198.37),
    CFrame.new(2676.14, 461.38, -144.41),
    CFrame.new(2732.92, 465.42, -91.82),
    CFrame.new(2787.80, 469.42, -38.44),
    CFrame.new(2851.55, 470.23, -2.83),
    CFrame.new(2900.67, 470.86, -51.21),
    CFrame.new(2858.45, 476.83, -109.87),
    CFrame.new(2798.24, 483.40, -155.43),
    CFrame.new(2743.59, 487.43, -206.86),
    CFrame.new(2758.99, 488.01, -257.42),
    CFrame.new(2829.90, 490.35, -248.67),
    CFrame.new(2899.03, 492.57, -216.66),
    CFrame.new(2974.38, 493.68, -207.75),
    CFrame.new(3049.26, 495.66, -219.56),
    CFrame.new(3124.56, 495.90, -227.33),
    CFrame.new(3201.96, 495.84, -219.90),
    CFrame.new(3272.67, 496.02, -194.14),
    CFrame.new(3340.58, 494.54, -160.47),
    CFrame.new(3412.69, 493.84, -137.30),
    CFrame.new(3482.76, 493.92, -163.34),
    CFrame.new(3540.12, 494.82, -214.09),
    CFrame.new(3593.24, 494.40, -267.03),
    CFrame.new(3647.45, 493.31, -322.96),
    CFrame.new(3700.84, 492.83, -376.78),
    CFrame.new(3747.81, 493.04, -437.23),
    CFrame.new(3775.17, 492.27, -507.35),
    CFrame.new(3778.05, 489.86, -586.82),
    CFrame.new(3757.77, 487.29, -657.79),
    CFrame.new(3703.52, 483.24, -710.34),
    CFrame.new(3638.38, 479.41, -749.78),
    CFrame.new(3573.02, 476.00, -789.67),
    CFrame.new(3505.63, 473.30, -823.40),
    CFrame.new(3449.91, 468.36, -872.74),
    CFrame.new(3446.40, 465.06, -947.13),
    CFrame.new(3463.89, 460.80, -1022.05),
    CFrame.new(3485.68, 458.93, -1094.59),
    CFrame.new(3492.25, 462.93, -1173.19),
    CFrame.new(3440.84, 466.49, -1219.68),
    CFrame.new(3374.18, 466.07, -1199.47),
    CFrame.new(3334.65, 460.43, -1133.61),
    CFrame.new(3306.83, 446.99, -1064.09),
    CFrame.new(3284.35, 438.59, -989.21),
    CFrame.new(3286.67, 436.66, -914.46),
    CFrame.new(3332.18, 432.76, -856.03),
    CFrame.new(3389.34, 427.85, -805.82),
    CFrame.new(3447.77, 421.36, -758.60),
    CFrame.new(3505.38, 415.02, -708.42),
    CFrame.new(3563.15, 411.71, -657.50),
    CFrame.new(3617.61, 408.79, -604.25),
    CFrame.new(3640.97, 405.68, -535.00),
    CFrame.new(3588.70, 404.62, -486.48),
    CFrame.new(3523.43, 401.76, -519.71),
    CFrame.new(3474.56, 398.11, -579.20),
    CFrame.new(3429.14, 392.58, -640.18),
    CFrame.new(3395.05, 387.50, -689.27),
    CFrame.new(3351.21, 382.51, -750.42),
    CFrame.new(3283.06, 380.59, -778.16),
    CFrame.new(3251.27, 377.60, -720.18),
    CFrame.new(3291.65, 373.75, -656.08),
    CFrame.new(3329.91, 368.47, -590.42),
    CFrame.new(3363.60, 362.61, -521.82),
    CFrame.new(3399.73, 356.83, -455.40),
    CFrame.new(3410.51, 351.81, -384.44),
    CFrame.new(3344.90, 347.65, -378.40),
    CFrame.new(3290.70, 342.18, -426.87),
    CFrame.new(3239.76, 335.66, -483.10),
    CFrame.new(3201.14, 328.52, -548.24),
    CFrame.new(3171.49, 321.09, -619.42),
    CFrame.new(3149.29, 312.89, -691.01),
    CFrame.new(3125.82, 305.77, -762.27),
    CFrame.new(3080.56, 304.41, -824.33),
    CFrame.new(3008.67, 304.22, -852.32),
    CFrame.new(2935.77, 306.92, -862.99),
    CFrame.new(2859.89, 309.54, -873.58),
    CFrame.new(2784.99, 305.85, -887.24),
    CFrame.new(2709.50, 304.25, -902.71),
    CFrame.new(2633.77, 303.64, -919.06),
    CFrame.new(2559.11, 300.09, -936.03),
    CFrame.new(2487.30, 296.41, -950.37),
    CFrame.new(2410.16, 295.63, -959.48),
    CFrame.new(2342.38, 295.05, -933.35),
    CFrame.new(2298.03, 289.59, -871.59),
    CFrame.new(2273.48, 282.53, -800.66),
    CFrame.new(2251.34, 275.56, -727.16),
    CFrame.new(2229.75, 269.54, -654.29),
    CFrame.new(2208.35, 266.46, -582.04),
    CFrame.new(2186.51, 265.93, -509.00),
    CFrame.new(2166.37, 267.63, -439.38),
    CFrame.new(2145.50, 268.09, -367.37),
    CFrame.new(2123.54, 261.87, -293.75),
    CFrame.new(2101.79, 254.64, -223.21),
    CFrame.new(2077.87, 248.54, -149.77),
    CFrame.new(2053.70, 246.85, -78.36),
    CFrame.new(2030.05, 245.40, -4.59),
    CFrame.new(2007.01, 242.83, 67.61),
    CFrame.new(1982.93, 238.89, 139.85),
    CFrame.new(1957.62, 233.47, 212.90),
    CFrame.new(1934.30, 227.12, 283.45),
    CFrame.new(1912.94, 220.42, 357.20),
    CFrame.new(1872.02, 214.18, 418.30),
    CFrame.new(1800.98, 211.96, 421.84),
    CFrame.new(1727.54, 214.06, 403.39),
    CFrame.new(1649.14, 214.06, 394.84),
    CFrame.new(1577.03, 213.17, 408.04),
    CFrame.new(1502.12, 208.15, 423.46),
    CFrame.new(1427.89, 204.85, 442.30),
    CFrame.new(1351.35, 204.70, 457.23),
    CFrame.new(1323.72, 204.92, 402.40),
    CFrame.new(1341.70, 209.79, 327.37),
    CFrame.new(1354.65, 216.39, 252.95),
    CFrame.new(1369.54, 222.99, 178.92),
    CFrame.new(1380.83, 228.20, 120.25),
    CFrame.new(1347.69, 229.95, 67.49),
    CFrame.new(1274.08, 229.95, 53.92),
    CFrame.new(1197.23, 229.95, 39.84),
    CFrame.new(1123.34, 229.25, 48.86),
    CFrame.new(1096.76, 225.23, 116.57),
    CFrame.new(1090.11, 218.97, 191.85),
    CFrame.new(1078.75, 212.42, 266.53),
    CFrame.new(1062.24, 206.50, 341.52),
    CFrame.new(1040.53, 204.70, 415.44),
    CFrame.new(1021.75, 204.70, 488.41),
    CFrame.new(1012.51, 204.70, 565.71),
    CFrame.new(1002.64, 204.70, 640.22),
    CFrame.new(936.84, 204.70, 669.04),
    CFrame.new(861.03, 204.35, 667.11),
    CFrame.new(785.26, 203.91, 664.44),
    CFrame.new(709.26, 203.85, 649.13),
    CFrame.new(643.56, 203.84, 610.84),
    CFrame.new(595.39, 203.89, 555.43),
    CFrame.new(571.13, 203.75, 480.95),
    CFrame.new(570.68, 203.74, 407.29),
    CFrame.new(578.69, 203.84, 329.83),
    CFrame.new(569.29, 203.73, 255.95),
    CFrame.new(507.22, 204.02, 218.72),
    CFrame.new(440.43, 204.12, 252.72),
    CFrame.new(414.49, 203.78, 322.07),
    CFrame.new(363.09, 203.86, 372.88),
    CFrame.new(291.84, 203.78, 350.02),
    CFrame.new(235.90, 203.78, 300.79),
    CFrame.new(162.98, 203.85, 298.89),
    CFrame.new(123.26, 203.81, 361.08),
    CFrame.new(149.83, 204.00, 429.05),
    CFrame.new(221.24, 204.12, 447.20),
    CFrame.new(297.72, 204.02, 438.19),
    CFrame.new(363.05, 204.12, 468.16),
    CFrame.new(373.12, 203.85, 540.73),
    CFrame.new(323.22, 204.03, 597.21),
    CFrame.new(250.65, 204.77, 618.78),
    CFrame.new(179.15, 204.77, 645.03),
    CFrame.new(111.87, 204.77, 680.81),
    CFrame.new(41.87, 204.77, 713.76),
    CFrame.new(-31.11, 204.01, 730.97),
    CFrame.new(-98.12, 203.70, 700.52),
    CFrame.new(-116.65, 203.90, 625.92),
    CFrame.new(-109.46, 203.60, 550.01),
    CFrame.new(-110.75, 203.67, 476.01),
    CFrame.new(-134.90, 203.62, 404.20),
    CFrame.new(-170.95, 204.21, 333.35),
    CFrame.new(-170.50, 203.77, 258.92),
    CFrame.new(-119.59, 203.93, 209.14),
    CFrame.new(-43.78, 203.93, 203.76),
    CFrame.new(25.15, 203.75, 177.79),
    CFrame.new(38.36, 203.72, 104.24),
    CFrame.new(-10.11, 204.07, 51.17),
    CFrame.new(-85.18, 203.90, 44.96),
    CFrame.new(-133.95, 203.62, 32.54),
    CFrame.new(-177.99, 203.56, -25.80),
    CFrame.new(-167.43, 203.76, -79.55),
    CFrame.new(-103.98, 204.15, -116.60),
    CFrame.new(-36.82, 204.28, -82.94),
    CFrame.new(12.36, 203.18, -28.02),
    CFrame.new(65.60, 203.46, 27.54),
    CFrame.new(133.97, 203.58, 63.29),
    CFrame.new(205.07, 203.77, 81.12),
    CFrame.new(281.93, 203.76, 75.93),
    CFrame.new(343.16, 203.73, 36.56),
    CFrame.new(339.07, 203.60, -36.95),
    CFrame.new(282.63, 204.08, -85.58),
    CFrame.new(215.87, 203.51, -121.54),
    CFrame.new(154.04, 203.47, -167.04),
    CFrame.new(104.29, 203.64, -223.47),
    CFrame.new(60.46, 203.84, -288.20),
    CFrame.new(11.99, 203.85, -346.02),
    CFrame.new(-51.15, 203.84, -389.79),
    CFrame.new(-122.23, 203.74, -413.39),
    CFrame.new(-198.48, 203.84, -421.99),
    CFrame.new(-273.12, 203.89, -416.62),
    CFrame.new(-350.02, 203.82, -407.54),
    CFrame.new(-424.87, 203.94, -414.79),
    CFrame.new(-495.88, 203.95, -443.72),
    CFrame.new(-556.19, 203.92, -489.98),
    CFrame.new(-603.86, 204.04, -549.23),
    CFrame.new(-646.32, 204.77, -611.50),
    CFrame.new(-697.62, 204.77, -668.94),
    CFrame.new(-755.50, 204.77, -718.55),
    CFrame.new(-812.71, 204.77, -768.95),
    CFrame.new(-867.32, 204.77, -821.53),
    CFrame.new(-914.32, 204.77, -883.09),
    CFrame.new(-951.39, 204.77, -949.60),
    CFrame.new(-974.97, 204.77, -1021.15),
    CFrame.new(-984.87, 204.77, -1097.13),
    CFrame.new(-988.35, 204.86, -1171.61),
    CFrame.new(-990.58, 205.58, -1246.99),
    CFrame.new(-992.63, 207.37, -1321.10),
    CFrame.new(-993.50, 210.63, -1396.02),
    CFrame.new(-993.01, 214.60, -1471.76),
    CFrame.new(-992.54, 218.45, -1545.41),
    CFrame.new(-992.52, 222.59, -1624.47),
    CFrame.new(-992.68, 225.81, -1696.07),
    CFrame.new(-993.26, 226.83, -1769.39),
    CFrame.new(-993.91, 226.51, -1847.72),
    CFrame.new(-990.53, 226.23, -1919.66),
    CFrame.new(-964.39, 226.22, -1988.98),
    CFrame.new(-911.30, 226.11, -2042.06),
    CFrame.new(-843.78, 226.12, -2071.96),
    CFrame.new(-770.48, 226.21, -2075.31),
    CFrame.new(-701.95, 226.26, -2048.65),
    CFrame.new(-647.08, 226.03, -2005.20),
    CFrame.new(-583.10, 225.56, -1954.60),
    CFrame.new(-518.37, 225.76, -1942.49),
    CFrame.new(-453.76, 225.75, -1977.66),
    CFrame.new(-410.92, 226.10, -2037.83),
    CFrame.new(-353.40, 225.97, -2084.68),
    CFrame.new(-280.57, 225.86, -2088.48),
    CFrame.new(-213.75, 225.89, -2045.44),
    CFrame.new(-190.04, 225.91, -1979.57),
    CFrame.new(-182.60, 225.69, -1905.37),
    CFrame.new(-158.96, 225.66, -1857.92),
    CFrame.new(-109.05, 225.80, -1819.48),
    CFrame.new(-34.94, 225.86, -1818.24),
    CFrame.new(27.77, 226.08, -1860.06),
    CFrame.new(72.55, 225.78, -1922.30),
    CFrame.new(143.19, 225.51, -1936.40),
    CFrame.new(201.80, 225.54, -1891.10),
    CFrame.new(201.97, 225.75, -1815.30),
    CFrame.new(154.02, 225.84, -1759.86),
    CFrame.new(95.51, 225.65, -1710.49),
    CFrame.new(63.63, 225.75, -1644.21),
    CFrame.new(64.61, 225.75, -1566.73),
    CFrame.new(95.03, 225.91, -1501.68),
    CFrame.new(157.78, 228.35, -1454.72),
    CFrame.new(232.43, 232.96, -1442.04),
    CFrame.new(301.95, 236.68, -1454.27),
    CFrame.new(373.20, 239.92, -1472.68),
    CFrame.new(445.38, 243.21, -1500.70),
    CFrame.new(515.11, 245.93, -1526.86),
    CFrame.new(588.56, 248.56, -1543.64),
    CFrame.new(667.18, 251.11, -1550.65),
    CFrame.new(732.33, 253.11, -1527.52),
    CFrame.new(764.65, 254.99, -1462.81),
    CFrame.new(736.43, 255.24, -1394.01),
    CFrame.new(668.57, 257.44, -1362.72),
    CFrame.new(595.76, 261.93, -1357.61),
    CFrame.new(518.43, 266.21, -1360.44),
    CFrame.new(444.46, 270.40, -1363.69),
    CFrame.new(369.56, 272.20, -1366.92),
    CFrame.new(299.56, 272.38, -1343.91),
    CFrame.new(273.36, 272.67, -1276.70),
    CFrame.new(321.52, 272.80, -1225.29),
    CFrame.new(396.42, 274.94, -1232.66),
    CFrame.new(474.57, 278.95, -1244.64),
    CFrame.new(547.71, 282.69, -1245.19),
    CFrame.new(622.75, 286.41, -1235.77),
    CFrame.new(696.45, 289.93, -1213.63),
    CFrame.new(766.83, 292.77, -1185.55),
    CFrame.new(840.56, 295.43, -1184.41),
    CFrame.new(893.29, 298.28, -1237.59),
    CFrame.new(894.68, 299.96, -1312.25),
    CFrame.new(876.53, 300.97, -1385.02),
    CFrame.new(859.51, 302.23, -1458.47),
    CFrame.new(841.46, 302.93, -1532.55),
    CFrame.new(823.17, 302.82, -1605.28),
    CFrame.new(785.93, 302.58, -1670.66),
    CFrame.new(720.42, 302.67, -1706.14),
    CFrame.new(644.10, 303.88, -1704.10),
    CFrame.new(570.49, 307.67, -1692.86),
    CFrame.new(496.54, 312.35, -1681.32),
    CFrame.new(421.25, 311.77, -1669.33),
    CFrame.new(348.11, 311.63, -1683.30),
    CFrame.new(324.41, 311.44, -1751.37),
    CFrame.new(368.92, 311.34, -1811.66),
    CFrame.new(405.96, 310.92, -1851.59),
    CFrame.new(412.89, 310.74, -1921.83),
    CFrame.new(366.78, 310.96, -1978.36),
    CFrame.new(360.52, 310.57, -2048.84),
    CFrame.new(420.85, 311.90, -2089.96),
    CFrame.new(485.84, 318.74, -2062.82),
    CFrame.new(526.86, 323.89, -1999.26),
    CFrame.new(566.40, 329.56, -1937.79),
    CFrame.new(609.71, 333.22, -1874.22),
    CFrame.new(673.47, 336.64, -1837.31),
    CFrame.new(741.38, 338.20, -1866.57),
    CFrame.new(764.96, 340.50, -1936.05),
    CFrame.new(730.75, 342.28, -2003.13),
    CFrame.new(684.49, 345.10, -2063.65),
    CFrame.new(638.17, 349.89, -2123.47),
    CFrame.new(593.35, 354.72, -2184.94),
    CFrame.new(548.63, 359.46, -2244.95),
    CFrame.new(501.88, 361.76, -2305.12),
    CFrame.new(464.97, 362.30, -2368.46),
    CFrame.new(500.87, 361.71, -2432.12),
    CFrame.new(566.55, 361.61, -2410.65),
    CFrame.new(614.69, 363.40, -2356.49),
    CFrame.new(666.05, 368.81, -2298.16),
    CFrame.new(713.12, 373.93, -2242.17),
    CFrame.new(758.20, 379.01, -2185.08),
    CFrame.new(806.93, 384.37, -2126.15),
    CFrame.new(855.69, 389.60, -2069.41),
    CFrame.new(902.94, 394.74, -2009.79),
    CFrame.new(952.25, 399.81, -1951.31),
    CFrame.new(1017.81, 403.44, -1925.89),
    CFrame.new(1060.35, 405.55, -1981.26),
    CFrame.new(1039.24, 408.09, -2054.55),
    CFrame.new(1007.54, 410.99, -2121.98),
    CFrame.new(973.04, 415.43, -2189.83),
    CFrame.new(939.46, 419.92, -2259.07),
    CFrame.new(907.20, 424.27, -2326.17),
    CFrame.new(875.12, 428.74, -2395.65),
    CFrame.new(842.41, 430.94, -2464.02),
    CFrame.new(824.47, 431.14, -2536.81),
    CFrame.new(882.60, 430.45, -2576.99),
    CFrame.new(935.53, 430.92, -2527.32),
    CFrame.new(966.77, 433.63, -2470.88),
    CFrame.new(1005.04, 437.79, -2400.78),
    CFrame.new(1039.15, 441.76, -2332.70),
    CFrame.new(1074.56, 445.79, -2263.89),
    CFrame.new(1113.73, 449.59, -2202.58),
    CFrame.new(1160.91, 453.62, -2140.75),
    CFrame.new(1208.78, 457.53, -2082.05),
    CFrame.new(1255.42, 460.32, -2024.99),
    CFrame.new(1305.11, 460.27, -1963.37),
    CFrame.new(1351.41, 459.76, -1906.08),
    CFrame.new(1414.48, 459.15, -1865.51),
    CFrame.new(1489.55, 458.67, -1864.55),
    CFrame.new(1550.19, 458.05, -1908.05),
    CFrame.new(1573.29, 457.54, -1978.86),
    CFrame.new(1553.71, 457.48, -2051.90),
    CFrame.new(1507.13, 458.05, -2110.02),
    CFrame.new(1458.81, 459.92, -2168.96),
    CFrame.new(1408.47, 465.56, -2231.95),
    CFrame.new(1364.06, 470.61, -2287.97),
    CFrame.new(1316.87, 475.98, -2347.61),
    CFrame.new(1268.37, 481.50, -2408.87),
    CFrame.new(1222.39, 485.04, -2465.87),
    CFrame.new(1174.03, 485.19, -2524.82),
    CFrame.new(1125.13, 484.91, -2584.93),
    CFrame.new(1089.15, 484.54, -2651.48),
    CFrame.new(1091.00, 484.84, -2725.92),
    CFrame.new(1119.02, 485.19, -2795.87),
    CFrame.new(1133.21, 485.40, -2870.46),
    CFrame.new(1103.99, 485.61, -2941.26),
    CFrame.new(1042.71, 485.41, -2982.20),
    CFrame.new(976.68, 485.21, -3020.87),
    CFrame.new(948.98, 485.11, -3088.62),
    CFrame.new(978.07, 485.09, -3155.56),
    CFrame.new(1023.35, 485.19, -3181.23),
    CFrame.new(1095.44, 485.13, -3161.34),
    CFrame.new(1146.06, 488.83, -3105.90),
    CFrame.new(1194.22, 494.46, -3047.58),
    CFrame.new(1243.41, 499.88, -2987.40),
    CFrame.new(1286.50, 505.00, -2927.81),
    CFrame.new(1313.54, 510.16, -2855.80),
    CFrame.new(1327.08, 514.83, -2782.20),
    CFrame.new(1334.94, 518.94, -2707.73),
    CFrame.new(1343.31, 523.39, -2631.23),
    CFrame.new(1370.83, 527.77, -2561.28),
    CFrame.new(1438.22, 531.03, -2534.33),
    CFrame.new(1504.18, 536.27, -2567.88),
    CFrame.new(1515.87, 535.86, -2641.08),
    CFrame.new(1509.51, 533.66, -2716.57),
    CFrame.new(1500.74, 534.01, -2791.88),
    CFrame.new(1492.75, 536.70, -2867.22),
    CFrame.new(1486.51, 542.33, -2943.00),
    CFrame.new(1480.58, 549.21, -3018.27),
    CFrame.new(1473.30, 557.31, -3095.02),
    CFrame.new(1468.25, 565.15, -3169.43),
    CFrame.new(1461.91, 573.64, -3249.98),
    CFrame.new(1456.43, 581.09, -3320.63),
    CFrame.new(1451.37, 588.86, -3396.72),
    CFrame.new(1446.08, 594.50, -3473.83),
    CFrame.new(1439.51, 597.44, -3547.64),
    CFrame.new(1432.36, 597.89, -3623.12),
    CFrame.new(1428.54, 597.32, -3697.55),
    CFrame.new(1455.09, 596.82, -3766.63),
    CFrame.new(1524.36, 596.43, -3791.15),
    CFrame.new(1587.32, 596.37, -3754.99),
    CFrame.new(1622.40, 597.28, -3685.86),
    CFrame.new(1647.72, 598.09, -3614.83),
    CFrame.new(1671.88, 599.87, -3542.98),
    CFrame.new(1693.11, 603.40, -3468.97),
    CFrame.new(1715.14, 608.08, -3399.63),
    CFrame.new(1736.83, 611.37, -3327.05),
    CFrame.new(1757.93, 612.93, -3254.23),
    CFrame.new(1779.52, 612.86, -3181.12),
    CFrame.new(1800.33, 612.39, -3109.06),
    CFrame.new(1828.53, 612.22, -3037.20),
    CFrame.new(1885.54, 612.17, -2991.71),
    CFrame.new(1961.47, 612.14, -2984.05),
    CFrame.new(2032.36, 612.68, -3001.85),
    CFrame.new(2104.11, 613.12, -3026.37),
    CFrame.new(2175.64, 613.12, -3052.77),
    CFrame.new(2230.90, 613.12, -3072.71),
    CFrame.new(2299.87, 613.12, -3106.06),
    CFrame.new(2361.65, 613.12, -3151.73),
    CFrame.new(2419.43, 613.12, -3201.43),
    CFrame.new(2486.17, 613.12, -3239.58),
    CFrame.new(2557.62, 613.12, -3261.89),
    CFrame.new(2633.19, 613.12, -3270.37),
    CFrame.new(2708.92, 613.12, -3262.48),
    CFrame.new(2783.92, 613.12, -3248.84),
    CFrame.new(2857.95, 613.12, -3234.42),
    CFrame.new(2933.20, 613.12, -3219.64),
    CFrame.new(3008.43, 613.40, -3204.86),
    CFrame.new(3081.98, 615.82, -3190.41),
    CFrame.new(3159.87, 619.99, -3174.66),
    CFrame.new(3231.33, 623.80, -3160.70),
    CFrame.new(3306.61, 627.82, -3146.75),
    CFrame.new(3365.87, 630.98, -3135.42),
    CFrame.new(3438.52, 634.86, -3121.01),
    CFrame.new(3513.28, 638.86, -3106.59),
    CFrame.new(3588.47, 642.71, -3092.13),
    CFrame.new(3663.45, 644.54, -3078.46),
    CFrame.new(3737.55, 644.54, -3064.50),
    CFrame.new(3811.09, 644.53, -3049.80),
    CFrame.new(3886.68, 644.52, -3034.81),
    CFrame.new(3962.50, 644.51, -3020.83),
    CFrame.new(4037.88, 644.50, -3006.72),
    CFrame.new(4112.03, 644.49, -2992.82),
}

-- Car movement function with smooth interpolation + velocity (safer from detection)
local function safeCarMovement(car, targetCF, duration, farmType)
    if not shouldContinue(farmType) then return false end

    local primaryPart = car.PrimaryPart
    if not primaryPart then
        local root = car:FindFirstChildWhichIsA("BasePart")
        if not root then return false end
        car.PrimaryPart = root
        primaryPart = root
    end

    local startPos = primaryPart.Position
    local targetPos = targetCF.Position
    local distance = (targetPos - startPos).Magnitude
    
    if distance == 0 then
        car:PivotTo(targetCF)
        return true
    end    local direction = (targetPos - startPos).Unit
    local velocity = direction * (distance / duration) * 0.2  -- Reduced velocity by 50%
    
    -- Make car face target (keep upright)
    local lookVector = Vector3.new(direction.X, 0, direction.Z).Unit
    local targetLook = CFrame.lookAt(startPos, startPos + lookVector)
    car:PivotTo(targetLook)
    
    -- Apply velocity
    primaryPart.AssemblyLinearVelocity = velocity
    primaryPart.AssemblyAngularVelocity = Vector3.zero
    
    -- Wait for movement to complete
    task.wait(duration)
    
    if not shouldContinue(farmType) then
        primaryPart.AssemblyLinearVelocity = Vector3.zero
        primaryPart.AssemblyAngularVelocity = Vector3.zero
        return false
    end
    
    -- Snap to final position
    car:PivotTo(CFrame.lookAt(targetPos, targetPos + lookVector))
    primaryPart.AssemblyLinearVelocity = Vector3.zero
    primaryPart.AssemblyAngularVelocity = Vector3.zero
    
    return true
end

-- Removed BodyGyro functions to avoid detection

-- Anti-AFK
local antiAFK = game:service("VirtualUser")
game:service("Players").LocalPlayer.Idled:connect(function()
    if _G.FARM_CONTROL.SafetyEnabled then
        antiAFK:CaptureController()
        antiAFK:ClickButton2(Vector2.new())
    end
end)

-- ====================== MAIN FARM FUNCTION ======================
FarmButton.MouseButton1Click:Connect(function()
    _G.FARM_CONTROL.DeathTrialRunning = true
    _G.FARM_CONTROL.ForceStop = false
    
    FarmButton.BackgroundColor3 = Color3.fromRGB(200, 200, 0)
    FarmButton.Text = "FARMING..."
    StatusDisplay.Text = "STATUS: FARMING"
    StatusDisplay.TextColor3 = Color3.fromRGB(255, 255, 0)
    
    farmStats.startTime = tick()
    farmStats.lapsCompleted = 0
    farmStats.racesCompleted = 0
      notify("Death Trial", "Starting farm...", 3)
    
    task.spawn(function()
        local consecutiveErrors = 0
        local maxConsecutiveErrors = 3
        
        while shouldContinue() do
            local success, err = pcall(function()
                if not shouldContinue() then return end
                
                -- Use cached Player reference
                local character = Player.Character or Player.CharacterAdded:Wait()
                local hrp = character:WaitForChild("HumanoidRootPart")
                local VehiclesFolder = workspace:FindFirstChild("VehiclesFolder") or workspace
                
                -- Enter race (using cached ReplicatedStorage)
                ReplicatedStorage.RemoteFunctions.RaceEvents.Entry:InvokeServer(
                    "Otsuki Death Trial",
                    "Circuit",
                    true,
                    {
                        ["Trigger"] = workspace["Proximity Triggers"]["Otsuki Death Trial"].Focus,
                        ["MaxRacers"] = 6
                    },
                    workspace["Proximity Triggers"]["Otsuki Death Trial"].Focus
                )
                  task.wait(0.3)
                if not shouldContinue() then return end
                
                -- Vote to start (using cached ReplicatedStorage)
                ReplicatedStorage.RemoteFunctions.RaceEvents.VoteToStart:InvokeServer(
                    "Otsuki Death Trial",
                    "Circuit",
                    workspace["Proximity Triggers"]["Otsuki Death Trial"].Focus,
                    {
                        ["Trigger"] = workspace["Proximity Triggers"]["Otsuki Death Trial"].Focus,
                        ["MaxRacers"] = 6
                    },
                    true
                )                notify("Race", "Joined Death Trial", 2)
                  -- Wait for race GUI to appear (reduced wait)
                task.wait(0.1)
                if not shouldContinue() then return end
                
                local timeScoreLabel = Player:WaitForChild("PlayerGui"):WaitForChild("ProgressGui"):WaitForChild("Header"):WaitForChild("TimeScore")                local guiWaitStart = tick()
                repeat
                    if not shouldContinue() then return end
                    task.wait(0.03)
                    if tick() - guiWaitStart > 15 then
                        error("Race GUI didn't appear within timeout")
                    end
                until timeScoreLabel.Visible == true
                
                local originalText = timeScoreLabel.Text                -- Wait for race timer to start (number changes)
                notify("Race Status", "Waiting for race to start...", 2)
                local raceStartTimeout = tick()
                
                while task.wait(0.03) do
                    if not shouldContinue() then return end
                    
                    if timeScoreLabel.Text ~= originalText then
                        break
                    end
                    
                    if tick() - raceStartTimeout > 15 then
                        error("Race didn't start properly within timeout")
                    end
                end
                
                if not shouldContinue() then return end
                
                notify("Race Status", "Race started - finding car", 2)
                  -- Car spawns immediately when race starts, no wait needed
                if not shouldContinue() then return end
                
                local car = nil
                local carWaitStart = tick()
                repeat                    if not shouldContinue() then return end
                    local playerVehicle = VehiclesFolder:FindFirstChild(Player.Name)
                    if playerVehicle then
                        car = playerVehicle:FindFirstChildOfClass("Model")
                    end                    task.wait(0.1)
                    
                    if tick() - carWaitStart > 10 then
                        error("Car not found after race start within timeout")
                    end
                until car                notify("Race Status", "Car found - preparing", 2)                -- Set car primary part (minimal setup)
                if not car.PrimaryPart then
                    local driveSeat = car:FindFirstChild("DriveSeat") or car:FindFirstChildWhichIsA("VehicleSeat")
                    if driveSeat then
                        car.PrimaryPart = driveSeat
                    end
                end
                
                -- Start path following immediately (no delay)
                if not shouldContinue() then return end
                notify("Race", "Following path...", 2)
                  -- Follow path with smooth interpolation (safer from detection)
                -- 0.022s per waypoint with 3-step interpolation = ~24 seconds total
                -- Smooth movement prevents anti-cheat detection
                local dnfDetected = false
                local totalWaypoints = #deathTrialPath
                local lastWaypoints = totalWaypoints - 40
                
                for i = 1, totalWaypoints do
                    if not shouldContinue("death") then return end
                    local success = safeCarMovement(car, deathTrialPath[i], 0.005, "death")
                    if not success then break end
                      -- Check for DNF every 100 waypoints (but not in last 40 waypoints)
                    if i < lastWaypoints and (i % 100 == 0) then
                        local pg = Player.PlayerGui:FindFirstChild("ProgressGui")
                        if pg then
                            local results = pg:FindFirstChild("Results")
                            if results and results.Visible then
                                dnfDetected = true
                                notify("DNF Detected", "Did not finish - rejoining race...", 3)
                                break
                            end
                        end
                    end
                end-- Handle DNF - cleanup and skip this race
                if dnfDetected then
                    notify("DNF Handler", "Cleaning up and rejoining...", 2)                    -- Reset velocities before cleanup
                    resetVelocities(car, player)
                    
                    -- Exit car (using cached VirtualInputManager)
                    pcall(function()
                        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                        task.wait(0.1)
                        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                    end)
                      -- Wait 2 seconds after results appear
                    notify("DNF Handler", "Waiting before cleanup...", 2)
                    task.wait(2)
                      -- Destroy all race-related GUIs
                    notify("DNF Handler", "Destroying Results GUI...", 2)
                    pcall(function()
                        -- Destroy ProgressGui
                        local progressGui = Player.PlayerGui:FindFirstChild("ProgressGui")
                        if progressGui then
                            progressGui:Destroy()
                            print("[DNF] ProgressGui destroyed")
                        end
                        
                        -- Destroy any other race GUIs
                        for _, gui in pairs(Player.PlayerGui:GetChildren()) do
                            if gui:IsA("ScreenGui") and (gui.Name:find("Race") or gui.Name:find("Progress") or gui.Name:find("Result")) then
                                gui:Destroy()
                                print("[DNF] Destroyed GUI: " .. gui.Name)
                            end
                        end
                    end)
                    
                    -- Wait 2 seconds then verify everything is gone
                    task.wait(2)
                    pcall(function()
                        local progressGui = Player.PlayerGui:FindFirstChild("ProgressGui")
                        if progressGui then
                            progressGui:Destroy()
                            print("[DNF] ProgressGui still existed, destroyed again")
                        else
                            print("[DNF] ProgressGui confirmed destroyed")
                        end
                        
                        -- Final cleanup pass
                        for _, gui in pairs(Player.PlayerGui:GetChildren()) do
                            if gui:IsA("ScreenGui") and (gui.Name:find("Race") or gui.Name:find("Progress") or gui.Name:find("Result")) then
                                gui:Destroy()
                                print("[DNF] Final cleanup destroyed: " .. gui.Name)
                            end
                        end
                    end)
                    
                    return -- Skip to next race iteration (don't count as completed)
                end
                
                if not shouldContinue() then return end
                
                notify("Race", "Path complete - waiting for results...", 2)
                
                -- Wait for Results screen to appear with retry logic
                local resultsFound = false
                local retryCount = 0
                local maxRetries = 1
                
                while not resultsFound and retryCount < maxRetries do
                    local waitStart = tick()
                    local timeout = false
                      while true do
                        if not shouldContinue("death") then return end
                        task.wait(1)
                        local pg = Player.PlayerGui:FindFirstChild("ProgressGui")
                        if pg then
                            local results = pg:FindFirstChild("Results")
                            if results and results.Visible then
                                resultsFound = true
                                break
                            end
                        end
                        if tick() - waitStart > 10 then
                            timeout = true
                            break
                        end
                    end
                    
                    if not resultsFound and timeout then
                        retryCount = retryCount + 1
                        notify("Race", "Results not found - retrying (" .. retryCount .. "/" .. maxRetries .. ")", 2)
                        
                        -- Go back 20 waypoints and re-do them
                        local totalWaypoints = #deathTrialPath
                        local backtrackCount = 20
                        local startIndex = math.max(1, totalWaypoints - backtrackCount)
                          -- Pivot back to 20 waypoints before the end
                        if car and car.PrimaryPart then
                            notify("Race", "Going back 20 waypoints...", 2)
                            car:PivotTo(deathTrialPath[startIndex])
                            task.wait(0.2)
                        end                        -- Re-do the last 20 waypoints (same smooth timing)
                        notify("Race", "Re-doing final waypoints...", 2)
                        for i = startIndex + 1, totalWaypoints do
                            if not shouldContinue("death") then return end
                            local success = safeCarMovement(car, deathTrialPath[i], 0.022, "death")
                            if not success then break end
                        end
                    end
                end                -- Handle max retries reached - exit race and restart
                if not resultsFound then
                    notify("Max Retries", "Results never appeared - exiting race...", 3)                    -- Reset velocities before exit
                    resetVelocities(car, player)
                    
                    -- Send Enter key to exit race (using cached VirtualInputManager)
                    pcall(function()
                        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                        task.wait(0.1)
                        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                    end)
                      -- Wait 2 seconds after exit
                    notify("Max Retries", "Waiting before cleanup...", 2)
                    task.wait(2)
                      -- Destroy all race-related GUIs
                    notify("Max Retries", "Destroying Results GUI...", 2)
                    pcall(function()
                        -- Destroy ProgressGui
                        local progressGui = Player.PlayerGui:FindFirstChild("ProgressGui")
                        if progressGui then
                            progressGui:Destroy()
                            print("[MaxRetry] ProgressGui destroyed")
                        end
                        
                        -- Destroy any other race GUIs
                        for _, gui in pairs(Player.PlayerGui:GetChildren()) do
                            if gui:IsA("ScreenGui") and (gui.Name:find("Race") or gui.Name:find("Progress") or gui.Name:find("Result")) then
                                gui:Destroy()
                                print("[MaxRetry] Destroyed GUI: " .. gui.Name)
                            end
                        end
                    end)
                    
                    -- Wait 2 seconds then verify everything is gone
                    task.wait(2)
                    pcall(function()
                        local progressGui = Player.PlayerGui:FindFirstChild("ProgressGui")
                        if progressGui then
                            progressGui:Destroy()
                            print("[MaxRetry] ProgressGui still existed, destroyed again")
                        else
                            print("[MaxRetry] ProgressGui confirmed destroyed")
                        end
                        
                        -- Final cleanup pass
                        for _, gui in pairs(Player.PlayerGui:GetChildren()) do
                            if gui:IsA("ScreenGui") and (gui.Name:find("Race") or gui.Name:find("Progress") or gui.Name:find("Result")) then
                                gui:Destroy()
                                print("[MaxRetry] Final cleanup destroyed: " .. gui.Name)
                            end
                        end
                    end)
                      notify("Restart", "Restarting race...", 2)
                    task.wait(0.5)
                    return -- Return to restart the farm loop
                end
                
                -- Now ProgressGui has been found or timed out                print("[RACE] ProgressGui check finished!")
                  -- Reset velocities after race completion
                --resetVelocities(car, player)
                  -- Jump out of the car (Enter key - using cached VirtualInputManager)
                notify("Race", "Exiting car...", 2)
                pcall(function()
                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                    task.wait(0.1)
                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                end)
                  -- Wait 2 seconds after results appear
                notify("Race", "Waiting before cleanup...", 2)
                task.wait(2)
                  -- Destroy all race-related GUIs
                notify("Race", "Destroying Results GUI...", 2)
                pcall(function()
                    -- Destroy ProgressGui
                    local progressGui = Player.PlayerGui:FindFirstChild("ProgressGui")
                    if progressGui then
                        progressGui:Destroy()
                        print("[RACE] ProgressGui destroyed")
                    end
                    
                    -- Destroy any other race GUIs that might exist
                    for _, gui in pairs(Player.PlayerGui:GetChildren()) do
                        if gui:IsA("ScreenGui") and (gui.Name:find("Race") or gui.Name:find("Progress") or gui.Name:find("Result")) then
                            gui:Destroy()
                            print("[RACE] Destroyed GUI: " .. gui.Name)
                        end
                    end
                end)
                
                -- Wait 2 seconds then verify everything is gone
                task.wait(2)
                pcall(function()
                    local progressGui = Player.PlayerGui:FindFirstChild("ProgressGui")
                    if progressGui then
                        progressGui:Destroy()
                        print("[RACE] ProgressGui still existed, destroyed again")
                    else
                        print("[RACE] ProgressGui confirmed destroyed")
                    end
                    
                    -- Final cleanup pass
                    for _, gui in pairs(Player.PlayerGui:GetChildren()) do
                        if gui:IsA("ScreenGui") and (gui.Name:find("Race") or gui.Name:find("Progress") or gui.Name:find("Result")) then
                            gui:Destroy()
                            print("[RACE] Final cleanup destroyed: " .. gui.Name)
                        end
                    end
                end)
                
                -- Update stats
                farmStats.lapsCompleted = farmStats.lapsCompleted + 1
                farmStats.racesCompleted = farmStats.racesCompleted + 1
                
                LapsLabel.Text = "Laps Completed: " .. farmStats.lapsCompleted
                RacesLabel.Text = "Races Completed: " .. farmStats.racesCompleted
                  notify("Progress", "Lap completed! Total: " .. farmStats.lapsCompleted, 2)
                
                -- Wait before next race (minimal delay)
                task.wait(0.2)            end)
            
            if not success then
                consecutiveErrors = consecutiveErrors + 1
                warn("Error in farm loop: " .. tostring(err))
                notify("Error", "Error occurred (" .. consecutiveErrors .. "/" .. maxConsecutiveErrors .. "), retrying...", 3)
                
                if consecutiveErrors >= maxConsecutiveErrors then
                    notify("Critical Error", "Too many errors. Stopping farm.", 5)
                    _G.FARM_CONTROL.DeathTrialRunning = false
                    break
                end
                
                task.wait(2)  -- Wait longer after error
            else
                consecutiveErrors = 0  -- Reset on success
            end
            
            task.wait(0.2)
        end
        
        -- Farm stopped
        FarmButton.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
        FarmButton.Text = "START DEATH TRIAL FARM"
        StatusDisplay.Text = "STATUS: STOPPED"
        StatusDisplay.TextColor3 = Color3.fromRGB(255, 100, 100)
        notify("Farm", "Farm stopped", 3)
    end)
end)

-- Stop button
StopButton.MouseButton1Click:Connect(function()
    _G.FARM_CONTROL.DeathTrialRunning = false
    _G.FARM_CONTROL.ForceStop = true
    
    FarmButton.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
    FarmButton.Text = "START DEATH TRIAL FARM"
    StatusDisplay.Text = "STATUS: STOPPING..."
    StatusDisplay.TextColor3 = Color3.fromRGB(255, 100, 100)
      notify("Farm", "Stopping farm - leaving car...", 3)
    
    -- Leave the car by pressing Enter
    task.spawn(function()
        -- Use cached services for better performance
        pcall(function()
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
            task.wait(0.1)
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
        end)
          task.wait(0.1)
          -- Wait for Results screen to appear (using cached Player)
        --[[local waitStart = tick()
        while true do
            task.wait(0.1)
            local playerGui = Player.PlayerGui
            local pg = playerGui:FindFirstChild("ProgressGui")
            if pg then
                local results = pg:FindFirstChild("Results")
                if results and results.Visible then
                    break
                end
            end
            if tick() - waitStart > 30 then
                warn("Timeout waiting for race results after stop")
                break
            end
        end
        
        print("[STOP] Results GUI check finished!")
        
        -- Wait 2 seconds after results appear
        notify("Stop", "Waiting before cleanup...", 2)
        task.wait(2)
          -- Destroy ProgressGui
        notify("Stop", "Destroying Results GUI...", 2)
        pcall(function()
            local progressGui = Player.PlayerGui:FindFirstChild("ProgressGui")
            if progressGui then
                progressGui:Destroy()
                print("[STOP] ProgressGui destroyed")
            end
        end)
        
        -- Wait 2 seconds then verify it's gone
        task.wait(2)
        pcall(function()
            local progressGui = player.PlayerGui:FindFirstChild("ProgressGui")
            if progressGui then
                progressGui:Destroy()
                print("[STOP] ProgressGui still existed, destroyed again")
            else
                print("[STOP] ProgressGui confirmed destroyed")
            end
        end)]]
        
        StatusDisplay.Text = "STATUS: STOPPED"
        notify("Farm", "Farm stopped and cleaned up", 3)
    end)
end)

notify("Death Trial", "Auto Farm loaded! Press START to begin", 5)
