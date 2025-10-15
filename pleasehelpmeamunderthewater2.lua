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
    CFrame.new(4057.21, 644.49, -2998.56),
    CFrame.new(4095.05, 644.48, -2992.43),
    CFrame.new(4133.17, 644.48, -2985.39),
    CFrame.new(4172.60, 644.48, -2978.66),
    CFrame.new(4207.49, 644.51, -2972.65),
    CFrame.new(4245.25, 644.50, -2966.11),
    CFrame.new(4283.44, 644.50, -2959.67),
    CFrame.new(4320.40, 644.50, -2953.28),
    CFrame.new(4357.66, 644.49, -2946.21),
    CFrame.new(4394.90, 644.49, -2939.11),
    CFrame.new(4432.64, 644.12, -2932.40),
    CFrame.new(4470.01, 643.60, -2925.92),
    CFrame.new(4508.19, 643.19, -2919.29),
    CFrame.new(4545.83, 642.87, -2912.03),
    CFrame.new(4581.97, 642.55, -2900.76),
    CFrame.new(4615.38, 642.52, -2883.25),
    CFrame.new(4641.46, 642.49, -2856.42),
    CFrame.new(4659.80, 642.59, -2822.43),
    CFrame.new(4662.83, 642.38, -2784.84),
    CFrame.new(4655.87, 642.33, -2747.19),
    CFrame.new(4642.81, 642.60, -2711.18),
    CFrame.new(4628.23, 642.65, -2676.63),
    CFrame.new(4614.49, 642.91, -2643.98),
    CFrame.new(4598.37, 642.81, -2605.56),
    CFrame.new(4586.02, 642.72, -2571.05),
    CFrame.new(4577.22, 642.74, -2533.37),
    CFrame.new(4573.34, 642.79, -2496.51),
    CFrame.new(4574.95, 642.80, -2459.93),
    CFrame.new(4582.56, 642.81, -2421.20),
    CFrame.new(4597.52, 642.98, -2386.84),
    CFrame.new(4623.55, 643.12, -2358.99),
    CFrame.new(4658.29, 642.97, -2343.16),
    CFrame.new(4698.96, 643.25, -2332.50),
    CFrame.new(4731.71, 643.16, -2330.76),
    CFrame.new(4770.02, 643.06, -2331.94),
    CFrame.new(4807.05, 642.79, -2330.36),
    CFrame.new(4844.88, 642.74, -2325.18),
    CFrame.new(4879.89, 642.65, -2310.72),
    CFrame.new(4911.93, 642.72, -2289.11),
    CFrame.new(4936.51, 642.80, -2261.47),
    CFrame.new(4954.89, 642.94, -2228.38),
    CFrame.new(4962.14, 642.92, -2190.89),
    CFrame.new(4962.04, 643.07, -2148.46),
    CFrame.new(4955.62, 643.47, -2114.56),
    CFrame.new(4945.47, 644.13, -2078.47),
    CFrame.new(4934.39, 644.56, -2041.34),
    CFrame.new(4924.77, 643.46, -2008.14),
    CFrame.new(4913.86, 640.07, -1970.23),
    CFrame.new(4903.63, 636.89, -1935.17),
    CFrame.new(4892.24, 634.42, -1896.49),
    CFrame.new(4881.88, 634.05, -1861.32),
    CFrame.new(4871.60, 633.48, -1826.57),
    CFrame.new(4859.26, 632.85, -1789.85),
    CFrame.new(4843.16, 632.34, -1756.01),
    CFrame.new(4820.02, 631.98, -1723.45),
    CFrame.new(4793.82, 631.80, -1701.81),
    CFrame.new(4755.77, 631.63, -1687.54),
    CFrame.new(4718.54, 631.72, -1683.77),
    CFrame.new(4675.54, 632.23, -1688.49),
    CFrame.new(4644.93, 632.83, -1696.47),
    CFrame.new(4609.19, 633.93, -1707.73),
    CFrame.new(4571.88, 634.07, -1719.65),
    CFrame.new(4536.67, 632.78, -1731.18),
    CFrame.new(4501.34, 632.19, -1742.42),
    CFrame.new(4474.23, 632.20, -1750.67),
    CFrame.new(4450.30, 632.21, -1756.21),
    CFrame.new(4414.69, 632.21, -1759.50),
    CFrame.new(4377.63, 632.21, -1759.84),
    CFrame.new(4340.97, 632.21, -1760.00),
    CFrame.new(4302.24, 632.21, -1759.35),
    CFrame.new(4264.75, 632.21, -1758.46),
    CFrame.new(4226.02, 632.21, -1757.47),
    CFrame.new(4187.70, 632.21, -1756.49),
    CFrame.new(4148.74, 632.28, -1759.42),
    CFrame.new(4115.48, 632.81, -1773.07),
    CFrame.new(4091.96, 633.93, -1800.18),
    CFrame.new(4079.31, 635.68, -1836.20),
    CFrame.new(4076.97, 637.52, -1874.77),
    CFrame.new(4076.75, 639.04, -1913.49),
    CFrame.new(4078.00, 640.78, -1950.51),
    CFrame.new(4071.80, 642.06, -1989.25),
    CFrame.new(4050.01, 642.48, -2018.71),
    CFrame.new(4008.95, 640.83, -2031.28),
    CFrame.new(3976.21, 639.15, -2026.41),
    CFrame.new(3945.46, 637.04, -2010.77),
    CFrame.new(3908.26, 633.69, -1990.50),
    CFrame.new(3878.90, 632.17, -1969.46),
    CFrame.new(3851.17, 632.78, -1945.50),
    CFrame.new(3822.45, 633.18, -1920.14),
    CFrame.new(3796.30, 629.04, -1894.21),
    CFrame.new(3770.22, 621.30, -1866.70),
    CFrame.new(3747.17, 616.50, -1837.53),
    CFrame.new(3721.72, 615.80, -1809.51),
    CFrame.new(3686.90, 613.91, -1799.44),
    CFrame.new(3654.89, 617.18, -1817.58),
    CFrame.new(3641.95, 615.48, -1848.47),
    CFrame.new(3655.95, 613.81, -1880.54),
    CFrame.new(3667.90, 614.97, -1910.36),
    CFrame.new(3660.63, 616.17, -1939.77),
    CFrame.new(3628.44, 616.10, -1963.28),
    CFrame.new(3590.06, 616.15, -1970.56),
    CFrame.new(3556.10, 615.08, -1952.20),
    CFrame.new(3539.50, 613.69, -1924.61),
    CFrame.new(3524.88, 612.69, -1890.56),
    CFrame.new(3509.01, 611.32, -1857.08),
    CFrame.new(3490.29, 609.15, -1823.30),
    CFrame.new(3460.83, 606.93, -1793.04),
    CFrame.new(3431.86, 604.78, -1782.85),
    CFrame.new(3392.35, 603.49, -1782.12),
    CFrame.new(3355.31, 603.71, -1783.94),
    CFrame.new(3316.99, 603.80, -1785.20),
    CFrame.new(3279.52, 603.57, -1785.14),
    CFrame.new(3246.50, 603.77, -1777.44),
    CFrame.new(3220.76, 603.67, -1749.95),
    CFrame.new(3211.68, 603.46, -1713.78),
    CFrame.new(3211.90, 603.72, -1676.01),
    CFrame.new(3224.69, 604.08, -1639.96),
    CFrame.new(3238.67, 605.00, -1605.63),
    CFrame.new(3247.60, 604.28, -1566.95),
    CFrame.new(3245.74, 603.35, -1534.56),
    CFrame.new(3227.16, 602.07, -1500.41),
    CFrame.new(3199.27, 600.85, -1481.78),
    CFrame.new(3158.65, 600.09, -1472.21),
    CFrame.new(3121.22, 599.71, -1482.78),
    CFrame.new(3087.41, 598.82, -1498.97),
    CFrame.new(3053.50, 596.21, -1516.64),
    CFrame.new(3023.00, 592.38, -1533.37),
    CFrame.new(2988.35, 587.51, -1552.75),
    CFrame.new(2956.72, 582.97, -1570.74),
    CFrame.new(2925.09, 578.38, -1589.51),
    CFrame.new(2892.50, 573.71, -1609.14),
    CFrame.new(2859.93, 569.11, -1628.01),
    CFrame.new(2824.49, 564.42, -1646.86),
    CFrame.new(2791.15, 560.23, -1663.48),
    CFrame.new(2755.67, 556.73, -1677.49),
    CFrame.new(2719.66, 554.78, -1685.71),
    CFrame.new(2682.84, 553.21, -1683.86),
    CFrame.new(2643.09, 552.19, -1670.62),
    CFrame.new(2612.22, 551.15, -1650.87),
    CFrame.new(2581.17, 549.97, -1629.90),
    CFrame.new(2551.26, 548.65, -1611.80),
    CFrame.new(2513.92, 547.39, -1599.14),
    CFrame.new(2476.77, 546.49, -1594.17),
    CFrame.new(2437.74, 545.62, -1591.36),
    CFrame.new(2401.53, 544.50, -1590.21),
    CFrame.new(2362.43, 542.27, -1589.21),
    CFrame.new(2323.03, 538.62, -1588.38),
    CFrame.new(2285.84, 533.84, -1588.78),
    CFrame.new(2249.09, 528.88, -1589.05),
    CFrame.new(2209.76, 524.61, -1589.51),
    CFrame.new(2171.53, 522.30, -1590.79),
    CFrame.new(2135.29, 521.72, -1591.37),
    CFrame.new(2095.82, 521.18, -1589.18),
    CFrame.new(2058.74, 520.54, -1577.15),
    CFrame.new(2031.36, 520.57, -1551.02),
    CFrame.new(2026.76, 520.40, -1514.59),
    CFrame.new(2041.10, 520.47, -1481.62),
    CFrame.new(2071.94, 520.72, -1460.33),
    CFrame.new(2110.54, 521.20, -1454.67),
    CFrame.new(2148.21, 521.94, -1450.49),
    CFrame.new(2185.53, 520.73, -1447.07),
    CFrame.new(2223.65, 517.41, -1444.67),
    CFrame.new(2261.15, 512.17, -1442.66),
    CFrame.new(2299.84, 506.30, -1441.26),
    CFrame.new(2338.71, 502.20, -1442.88),
    CFrame.new(2376.27, 498.38, -1446.38),
    CFrame.new(2413.06, 494.64, -1449.19),
    CFrame.new(2450.31, 490.84, -1451.11),
    CFrame.new(2488.45, 486.93, -1451.00),
    CFrame.new(2526.66, 483.81, -1451.19),
    CFrame.new(2564.91, 481.62, -1450.53),
    CFrame.new(2602.98, 479.79, -1445.06),
    CFrame.new(2635.29, 477.32, -1424.40),
    CFrame.new(2641.68, 477.25, -1395.04),
    CFrame.new(2618.45, 478.16, -1374.79),
    CFrame.new(2580.53, 478.36, -1370.09),
    CFrame.new(2542.91, 478.80, -1365.33),
    CFrame.new(2506.64, 479.16, -1360.02),
    CFrame.new(2467.62, 478.48, -1353.45),
    CFrame.new(2429.39, 476.20, -1347.51),
    CFrame.new(2391.61, 472.38, -1342.24),
    CFrame.new(2355.48, 467.36, -1338.47),
    CFrame.new(2318.80, 460.82, -1334.09),
    CFrame.new(2282.38, 455.27, -1330.08),
    CFrame.new(2243.94, 452.43, -1326.18),
    CFrame.new(2204.20, 451.72, -1321.74),
    CFrame.new(2165.74, 451.67, -1314.55),
    CFrame.new(2130.12, 451.78, -1301.77),
    CFrame.new(2101.83, 451.75, -1275.84),
    CFrame.new(2086.71, 451.59, -1244.03),
    CFrame.new(2085.66, 451.64, -1206.76),
    CFrame.new(2105.27, 451.70, -1173.82),
    CFrame.new(2136.51, 451.84, -1153.72),
    CFrame.new(2169.51, 451.98, -1138.72),
    CFrame.new(2205.02, 452.07, -1124.30),
    CFrame.new(2241.87, 451.97, -1112.35),
    CFrame.new(2281.04, 451.56, -1107.90),
    CFrame.new(2316.00, 451.33, -1118.23),
    CFrame.new(2342.59, 451.36, -1146.10),
    CFrame.new(2359.43, 451.65, -1180.51),
    CFrame.new(2376.88, 451.34, -1212.69),
    CFrame.new(2406.37, 451.50, -1237.58),
    CFrame.new(2444.65, 451.55, -1238.32),
    CFrame.new(2478.08, 451.63, -1222.46),
    CFrame.new(2513.20, 451.50, -1208.23),
    CFrame.new(2550.74, 451.45, -1204.02),
    CFrame.new(2588.71, 451.54, -1211.34),
    CFrame.new(2626.77, 451.48, -1215.10),
    CFrame.new(2663.43, 451.53, -1205.68),
    CFrame.new(2686.82, 451.43, -1176.88),
    CFrame.new(2692.04, 451.44, -1139.47),
    CFrame.new(2686.19, 451.80, -1101.17),
    CFrame.new(2680.21, 452.40, -1061.63),
    CFrame.new(2675.04, 452.33, -1026.17),
    CFrame.new(2669.46, 452.21, -987.82),
    CFrame.new(2664.15, 452.09, -951.54),
    CFrame.new(2658.57, 452.05, -914.45),
    CFrame.new(2652.87, 451.87, -875.28),
    CFrame.new(2648.46, 451.70, -844.34),
    CFrame.new(2645.57, 451.67, -823.29),
    CFrame.new(2640.00, 451.56, -786.63),
    CFrame.new(2633.89, 451.58, -748.36),
    CFrame.new(2627.80, 451.58, -710.10),
    CFrame.new(2623.34, 451.43, -673.72),
    CFrame.new(2620.69, 451.16, -633.81),
    CFrame.new(2626.47, 451.20, -597.05),
    CFrame.new(2641.15, 451.58, -562.58),
    CFrame.new(2658.39, 452.21, -526.04),
    CFrame.new(2669.26, 452.40, -490.76),
    CFrame.new(2664.77, 452.40, -453.18),
    CFrame.new(2642.65, 452.40, -423.87),
    CFrame.new(2613.01, 452.40, -396.40),
    CFrame.new(2589.77, 452.40, -369.19),
    CFrame.new(2572.66, 452.57, -333.24),
    CFrame.new(2569.38, 453.47, -294.64),
    CFrame.new(2579.32, 454.46, -258.98),
    CFrame.new(2598.28, 455.79, -225.82),
    CFrame.new(2621.24, 457.40, -198.37),
    CFrame.new(2650.08, 459.44, -170.14),
    CFrame.new(2676.14, 461.38, -144.41),
    CFrame.new(2704.20, 463.38, -118.37),
    CFrame.new(2732.92, 465.42, -91.82),
    CFrame.new(2759.52, 467.34, -66.65),
    CFrame.new(2787.80, 469.42, -38.44),
    CFrame.new(2814.86, 470.40, -15.75),
    CFrame.new(2851.55, 470.23, -2.83),
    CFrame.new(2885.68, 470.13, -16.19),
    CFrame.new(2900.67, 470.86, -51.21),
    CFrame.new(2887.50, 473.83, -86.38),
    CFrame.new(2858.45, 476.83, -109.87),
    CFrame.new(2827.48, 480.20, -134.28),
    CFrame.new(2798.24, 483.40, -155.43),
    CFrame.new(2763.47, 486.68, -179.59),
    CFrame.new(2743.59, 487.43, -206.86),
    CFrame.new(2741.86, 487.59, -231.05),
    CFrame.new(2758.99, 488.01, -257.42),
    CFrame.new(2794.88, 489.18, -262.96),
    CFrame.new(2829.90, 490.35, -248.67),
    CFrame.new(2864.48, 491.81, -232.22),
    CFrame.new(2899.03, 492.57, -216.66),
    CFrame.new(2934.97, 493.05, -206.30),
    CFrame.new(2974.38, 493.68, -207.75),
    CFrame.new(3011.43, 494.59, -213.45),
    CFrame.new(3049.26, 495.66, -219.56),
    CFrame.new(3087.55, 496.15, -225.49),
    CFrame.new(3124.56, 495.90, -227.33),
    CFrame.new(3162.44, 495.80, -225.84),
    CFrame.new(3201.96, 495.84, -219.90),
    CFrame.new(3237.77, 495.93, -208.95),
    CFrame.new(3272.67, 496.02, -194.14),
    CFrame.new(3306.34, 495.48, -177.67),
    CFrame.new(3340.58, 494.54, -160.47),
    CFrame.new(3376.24, 493.93, -145.38),
    CFrame.new(3412.69, 493.84, -137.30),
    CFrame.new(3449.91, 493.74, -145.47),
    CFrame.new(3482.76, 493.92, -163.34),
    CFrame.new(3512.38, 494.31, -187.64),
    CFrame.new(3540.12, 494.82, -214.09),
    CFrame.new(3567.93, 494.82, -241.67),
    CFrame.new(3593.24, 494.40, -267.03),
    CFrame.new(3620.96, 493.82, -295.85),
    CFrame.new(3647.45, 493.31, -322.96),
    CFrame.new(3674.87, 493.17, -349.75),
    CFrame.new(3700.84, 492.83, -376.78),
    CFrame.new(3726.36, 492.81, -407.03),
    CFrame.new(3747.81, 493.04, -437.23),
    CFrame.new(3763.14, 492.64, -471.88),
    CFrame.new(3775.17, 492.27, -507.35),
    CFrame.new(3780.15, 491.32, -545.30),
    CFrame.new(3778.05, 489.86, -586.82),
    CFrame.new(3770.65, 488.56, -622.22),
    CFrame.new(3757.77, 487.29, -657.79),
    CFrame.new(3734.43, 485.44, -687.95),
    CFrame.new(3703.52, 483.24, -710.34),
    CFrame.new(3670.39, 481.30, -730.35),
    CFrame.new(3638.38, 479.41, -749.78),
    CFrame.new(3604.44, 477.57, -770.86),
    CFrame.new(3573.02, 476.00, -789.67),
    CFrame.new(3539.19, 474.60, -806.72),
    CFrame.new(3505.63, 473.30, -823.40),
    CFrame.new(3470.31, 471.32, -844.47),
    CFrame.new(3449.91, 468.36, -872.74),
    CFrame.new(3443.42, 466.04, -909.84),
    CFrame.new(3446.40, 465.06, -947.13),
    CFrame.new(3454.44, 463.17, -985.41),
    CFrame.new(3463.89, 460.80, -1022.05),
    CFrame.new(3473.84, 458.99, -1059.45),
    CFrame.new(3485.68, 458.93, -1094.59),
    CFrame.new(3495.37, 460.30, -1131.20),
    CFrame.new(3492.25, 462.93, -1173.19),
    CFrame.new(3476.43, 464.96, -1201.61),
    CFrame.new(3440.84, 466.49, -1219.68),
    CFrame.new(3405.22, 467.06, -1218.99),
    CFrame.new(3374.18, 466.07, -1199.47),
    CFrame.new(3352.89, 463.87, -1165.72),
    CFrame.new(3334.65, 460.43, -1133.61),
    CFrame.new(3317.93, 453.92, -1097.87),
    CFrame.new(3306.83, 446.99, -1064.09),
    CFrame.new(3294.10, 441.59, -1026.57),
    CFrame.new(3284.35, 438.59, -989.21),
    CFrame.new(3281.38, 437.36, -953.64),
    CFrame.new(3286.67, 436.66, -914.46),
    CFrame.new(3304.39, 435.37, -882.89),
    CFrame.new(3332.18, 432.76, -856.03),
    CFrame.new(3361.03, 430.39, -830.28),
    CFrame.new(3389.34, 427.85, -805.82),
    CFrame.new(3418.40, 424.67, -783.01),
    CFrame.new(3447.77, 421.36, -758.60),
    CFrame.new(3477.07, 418.01, -733.46),
    CFrame.new(3505.38, 415.02, -708.42),
    CFrame.new(3534.24, 413.24, -683.26),
    CFrame.new(3563.15, 411.71, -657.50),
    CFrame.new(3591.06, 410.21, -631.27),
    CFrame.new(3617.61, 408.79, -604.25),
    CFrame.new(3637.48, 407.00, -571.83),
    CFrame.new(3640.97, 405.68, -535.00),
    CFrame.new(3621.96, 405.00, -502.71),
    CFrame.new(3588.70, 404.62, -486.48),
    CFrame.new(3550.24, 403.22, -496.09),
    CFrame.new(3523.43, 401.76, -519.71),
    CFrame.new(3498.44, 400.10, -549.27),
    CFrame.new(3474.56, 398.11, -579.20),
    CFrame.new(3451.21, 395.53, -609.48),
    CFrame.new(3429.14, 392.58, -640.18),
    CFrame.new(3403.60, 388.59, -677.01),
    CFrame.new(3395.05, 387.50, -689.27),
    CFrame.new(3373.75, 384.72, -719.49),
    CFrame.new(3351.21, 382.51, -750.42),
    CFrame.new(3320.86, 380.94, -775.53),
    CFrame.new(3283.06, 380.59, -778.16),
    CFrame.new(3255.77, 379.81, -756.29),
    CFrame.new(3251.27, 377.60, -720.18),
    CFrame.new(3269.87, 375.27, -687.57),
    CFrame.new(3291.65, 373.75, -656.08),
    CFrame.new(3311.47, 371.21, -625.34),
    CFrame.new(3329.91, 368.47, -590.42),
    CFrame.new(3346.60, 365.83, -556.48),
    CFrame.new(3363.60, 362.61, -521.82),
    CFrame.new(3381.79, 359.47, -488.70),
    CFrame.new(3399.73, 356.83, -455.40),
    CFrame.new(3414.38, 353.58, -417.53),
    CFrame.new(3410.51, 351.81, -384.44),
    CFrame.new(3378.33, 349.94, -364.24),
    CFrame.new(3344.90, 347.65, -378.40),
    CFrame.new(3317.91, 344.82, -402.44),
    CFrame.new(3290.70, 342.18, -426.87),
    CFrame.new(3263.45, 338.97, -454.79),
    CFrame.new(3239.76, 335.66, -483.10),
    CFrame.new(3217.28, 331.92, -516.47),
    CFrame.new(3201.14, 328.52, -548.24),
    CFrame.new(3185.61, 324.89, -582.64),
    CFrame.new(3171.49, 321.09, -619.42),
    CFrame.new(3159.87, 317.23, -654.86),
    CFrame.new(3149.29, 312.89, -691.01),
    CFrame.new(3137.73, 308.88, -727.76),
    CFrame.new(3125.82, 305.77, -762.27),
    CFrame.new(3106.96, 304.74, -795.55),
    CFrame.new(3080.56, 304.41, -824.33),
    CFrame.new(3047.56, 304.11, -841.94),
    CFrame.new(3008.67, 304.22, -852.32),
    CFrame.new(2971.56, 305.24, -857.52),
    CFrame.new(2935.77, 306.92, -862.99),
    CFrame.new(2897.81, 308.32, -868.15),
    CFrame.new(2859.89, 309.54, -873.58),
    CFrame.new(2822.11, 307.99, -879.87),
    CFrame.new(2784.99, 305.85, -887.24),
    CFrame.new(2748.26, 304.73, -894.70),
    CFrame.new(2709.50, 304.25, -902.71),
    CFrame.new(2673.61, 304.41, -910.16),
    CFrame.new(2633.77, 303.64, -919.06),
    CFrame.new(2597.75, 301.98, -927.70),
    CFrame.new(2559.11, 300.09, -936.03),
    CFrame.new(2525.32, 298.15, -943.15),
    CFrame.new(2487.30, 296.41, -950.37),
    CFrame.new(2450.81, 294.96, -956.76),
    CFrame.new(2410.16, 295.63, -959.48),
    CFrame.new(2373.97, 295.71, -950.12),
    CFrame.new(2342.38, 295.05, -933.35),
    CFrame.new(2315.20, 292.92, -905.13),
    CFrame.new(2298.03, 289.59, -871.59),
    CFrame.new(2284.65, 285.95, -835.85),
    CFrame.new(2273.48, 282.53, -800.66),
    CFrame.new(2261.96, 278.92, -762.96),
    CFrame.new(2251.34, 275.56, -727.16),
    CFrame.new(2240.62, 272.08, -690.96),
    CFrame.new(2229.75, 269.54, -654.29),
    CFrame.new(2219.51, 267.71, -619.13),
    CFrame.new(2208.35, 266.46, -582.04),
    CFrame.new(2197.06, 265.89, -545.42),
    CFrame.new(2186.51, 265.93, -509.00),
    CFrame.new(2175.98, 266.54, -472.58),
    CFrame.new(2166.37, 267.63, -439.38),
    CFrame.new(2156.19, 268.70, -404.17),
    CFrame.new(2145.50, 268.09, -367.37),
    CFrame.new(2134.64, 265.63, -331.56),
    CFrame.new(2123.54, 261.87, -293.75),
    CFrame.new(2112.90, 258.29, -258.84),
    CFrame.new(2101.79, 254.64, -223.21),
    CFrame.new(2090.09, 251.04, -187.33),
    CFrame.new(2077.87, 248.54, -149.77),
    CFrame.new(2065.99, 247.51, -113.78),
    CFrame.new(2053.70, 246.85, -78.36),
    CFrame.new(2041.43, 246.19, -42.49),
    CFrame.new(2030.05, 245.40, -4.59),
    CFrame.new(2018.35, 244.24, 32.77),
    CFrame.new(2007.01, 242.83, 67.61),
    CFrame.new(1994.95, 241.00, 104.39),
    CFrame.new(1982.93, 238.89, 139.85),
    CFrame.new(1970.59, 236.38, 176.06),
    CFrame.new(1957.62, 233.47, 212.90),
    CFrame.new(1945.32, 230.32, 248.63),
    CFrame.new(1934.30, 227.12, 283.45),
    CFrame.new(1923.16, 223.75, 320.41),
    CFrame.new(1912.94, 220.42, 357.20),
    CFrame.new(1899.63, 217.13, 392.35),
    CFrame.new(1872.02, 214.18, 418.30),
    CFrame.new(1837.51, 212.08, 431.19),
    CFrame.new(1800.98, 211.96, 421.84),
    CFrame.new(1764.15, 213.72, 411.52),
    CFrame.new(1727.54, 214.06, 403.39),
    CFrame.new(1689.03, 214.06, 396.40),
    CFrame.new(1649.14, 214.06, 394.84),
    CFrame.new(1613.46, 214.06, 401.17),
    CFrame.new(1577.03, 213.17, 408.04),
    CFrame.new(1540.04, 210.85, 416.01),
    CFrame.new(1502.12, 208.15, 423.46),
    CFrame.new(1464.59, 205.91, 432.85),
    CFrame.new(1427.89, 204.85, 442.30),
    CFrame.new(1391.68, 204.70, 452.03),
    CFrame.new(1351.35, 204.70, 457.23),
    CFrame.new(1325.12, 204.70, 438.09),
    CFrame.new(1323.72, 204.92, 402.40),
    CFrame.new(1334.79, 206.67, 364.52),
    CFrame.new(1341.70, 209.79, 327.37),
    CFrame.new(1348.51, 212.98, 291.49),
    CFrame.new(1354.65, 216.39, 252.95),
    CFrame.new(1360.96, 219.59, 216.98),
    CFrame.new(1369.54, 222.99, 178.92),
    CFrame.new(1377.28, 226.21, 142.80),
    CFrame.new(1380.83, 228.20, 120.25),
    CFrame.new(1376.13, 229.95, 88.90),
    CFrame.new(1347.69, 229.95, 67.49),
    CFrame.new(1310.22, 229.95, 59.94),
    CFrame.new(1274.08, 229.95, 53.92),
    CFrame.new(1235.25, 229.95, 44.55),
    CFrame.new(1197.23, 229.95, 39.84),
    CFrame.new(1160.17, 229.95, 38.58),
    CFrame.new(1123.34, 229.25, 48.86),
    CFrame.new(1100.22, 227.50, 79.37),
    CFrame.new(1096.76, 225.23, 116.57),
    CFrame.new(1093.74, 222.22, 154.25),
    CFrame.new(1090.11, 218.97, 191.85),
    CFrame.new(1084.61, 215.56, 230.90),
    CFrame.new(1078.75, 212.42, 266.53),
    CFrame.new(1071.62, 209.02, 304.89),
    CFrame.new(1062.24, 206.50, 341.52),
    CFrame.new(1052.03, 205.04, 378.00),
    CFrame.new(1040.53, 204.70, 415.44),
    CFrame.new(1030.25, 204.70, 450.63),
    CFrame.new(1021.75, 204.70, 488.41),
    CFrame.new(1015.64, 204.70, 526.67),
    CFrame.new(1012.51, 204.70, 565.71),
    CFrame.new(1010.94, 204.70, 601.51),
    CFrame.new(1002.64, 204.70, 640.22),
    CFrame.new(975.62, 204.70, 663.08),
    CFrame.new(936.84, 204.70, 669.04),
    CFrame.new(898.93, 204.67, 667.96),
    CFrame.new(861.03, 204.35, 667.11),
    CFrame.new(823.96, 204.14, 666.35),
    CFrame.new(785.26, 203.91, 664.44),
    CFrame.new(746.80, 203.87, 659.90),
    CFrame.new(709.26, 203.85, 649.13),
    CFrame.new(676.49, 203.80, 632.70),
    CFrame.new(643.56, 203.84, 610.84),
    CFrame.new(618.36, 203.85, 586.02),
    CFrame.new(595.39, 203.89, 555.43),
    CFrame.new(580.05, 203.81, 519.01),
    CFrame.new(571.13, 203.75, 480.95),
    CFrame.new(569.42, 203.68, 443.93),
    CFrame.new(570.68, 203.74, 407.29),
    CFrame.new(573.83, 204.00, 368.69),
    CFrame.new(578.69, 203.84, 329.83),
    CFrame.new(580.13, 203.65, 291.62),
    CFrame.new(569.29, 203.73, 255.95),
    CFrame.new(543.11, 203.92, 228.67),
    CFrame.new(507.22, 204.02, 218.72),
    CFrame.new(470.68, 204.05, 227.62),
    CFrame.new(440.43, 204.12, 252.72),
    CFrame.new(423.97, 204.18, 285.38),
    CFrame.new(414.49, 203.78, 322.07),
    CFrame.new(395.39, 203.83, 355.86),
    CFrame.new(363.09, 203.86, 372.88),
    CFrame.new(323.54, 203.82, 370.54),
    CFrame.new(291.84, 203.78, 350.02),
    CFrame.new(265.18, 204.04, 325.46),
    CFrame.new(235.90, 203.78, 300.79),
    CFrame.new(199.15, 203.90, 288.75),
    CFrame.new(162.98, 203.85, 298.89),
    CFrame.new(135.83, 203.78, 326.01),
    CFrame.new(123.26, 203.81, 361.08),
    CFrame.new(127.68, 203.96, 399.85),
    CFrame.new(149.83, 204.00, 429.05),
    CFrame.new(185.97, 204.06, 446.26),
    CFrame.new(221.24, 204.12, 447.20),
    CFrame.new(260.34, 204.01, 441.11),
    CFrame.new(297.72, 204.02, 438.19),
    CFrame.new(334.57, 204.15, 443.52),
    CFrame.new(363.05, 204.12, 468.16),
    CFrame.new(377.72, 203.98, 506.88),
    CFrame.new(373.12, 203.85, 540.73),
    CFrame.new(353.55, 203.84, 574.42),
    CFrame.new(323.22, 204.03, 597.21),
    CFrame.new(286.41, 204.40, 608.97),
    CFrame.new(250.65, 204.77, 618.78),
    CFrame.new(214.58, 204.77, 630.42),
    CFrame.new(179.15, 204.77, 645.03),
    CFrame.new(145.09, 204.77, 661.67),
    CFrame.new(111.87, 204.77, 680.81),
    CFrame.new(78.46, 204.77, 698.68),
    CFrame.new(41.87, 204.77, 713.76),
    CFrame.new(6.77, 204.45, 725.62),
    CFrame.new(-31.11, 204.01, 730.97),
    CFrame.new(-67.81, 203.75, 722.44),
    CFrame.new(-98.12, 203.70, 700.52),
    CFrame.new(-113.64, 203.62, 664.86),
    CFrame.new(-116.65, 203.90, 625.92),
    CFrame.new(-113.24, 203.97, 589.41),
    CFrame.new(-109.46, 203.60, 550.01),
    CFrame.new(-108.01, 203.62, 513.81),
    CFrame.new(-110.75, 203.67, 476.01),
    CFrame.new(-120.25, 203.66, 438.47),
    CFrame.new(-134.90, 203.62, 404.20),
    CFrame.new(-153.48, 203.94, 370.21),
    CFrame.new(-170.95, 204.21, 333.35),
    CFrame.new(-177.65, 203.94, 297.48),
    CFrame.new(-170.50, 203.77, 258.92),
    CFrame.new(-150.92, 203.82, 228.16),
    CFrame.new(-119.59, 203.93, 209.14),
    CFrame.new(-82.09, 204.05, 204.88),
    CFrame.new(-43.78, 203.93, 203.76),
    CFrame.new(-4.21, 203.76, 199.05),
    CFrame.new(25.15, 203.75, 177.79),
    CFrame.new(38.80, 203.60, 142.00),
    CFrame.new(38.36, 203.72, 104.24),
    CFrame.new(22.11, 204.01, 69.48),
    CFrame.new(-10.11, 204.07, 51.17),
    CFrame.new(-46.90, 204.08, 47.04),
    CFrame.new(-85.18, 203.90, 44.96),
    CFrame.new(-105.82, 203.87, 42.21),
    CFrame.new(-133.95, 203.62, 32.54),
    CFrame.new(-164.09, 203.61, 9.96),
    CFrame.new(-177.99, 203.56, -25.80),
    CFrame.new(-172.30, 203.68, -68.97),
    CFrame.new(-167.43, 203.76, -79.55),
    CFrame.new(-144.31, 204.09, -107.14),
    CFrame.new(-103.98, 204.15, -116.60),
    CFrame.new(-70.74, 204.11, -106.99),
    CFrame.new(-36.82, 204.28, -82.94),
    CFrame.new(-13.14, 203.81, -57.19),
    CFrame.new(12.36, 203.18, -28.02),
    CFrame.new(37.76, 203.27, 1.24),
    CFrame.new(65.60, 203.46, 27.54),
    CFrame.new(96.02, 203.56, 47.15),
    CFrame.new(133.97, 203.58, 63.29),
    CFrame.new(166.79, 203.73, 75.43),
    CFrame.new(205.07, 203.77, 81.12),
    CFrame.new(244.62, 203.82, 82.26),
    CFrame.new(281.93, 203.76, 75.93),
    CFrame.new(317.91, 203.64, 60.86),
    CFrame.new(343.16, 203.73, 36.56),
    CFrame.new(351.79, 203.70, 0.34),
    CFrame.new(339.07, 203.60, -36.95),
    CFrame.new(314.93, 203.79, -65.86),
    CFrame.new(282.63, 204.08, -85.58),
    CFrame.new(249.59, 203.83, -103.31),
    CFrame.new(215.87, 203.51, -121.54),
    CFrame.new(183.45, 203.51, -141.81),
    CFrame.new(154.04, 203.47, -167.04),
    CFrame.new(127.89, 203.54, -193.27),
    CFrame.new(104.29, 203.64, -223.47),
    CFrame.new(78.31, 204.10, -257.62),
    CFrame.new(60.46, 203.84, -288.20),
    CFrame.new(39.45, 203.90, -318.72),
    CFrame.new(11.99, 203.85, -346.02),
    CFrame.new(-17.89, 203.85, -370.00),
    CFrame.new(-51.15, 203.84, -389.79),
    CFrame.new(-86.13, 203.76, -403.26),
    CFrame.new(-122.23, 203.74, -413.39),
    CFrame.new(-159.35, 203.83, -420.98),
    CFrame.new(-198.48, 203.84, -421.99),
    CFrame.new(-235.55, 204.04, -421.25),
    CFrame.new(-273.12, 203.89, -416.62),
    CFrame.new(-312.26, 203.81, -410.79),
    CFrame.new(-350.02, 203.82, -407.54),
    CFrame.new(-387.08, 203.88, -408.53),
    CFrame.new(-424.87, 203.94, -414.79),
    CFrame.new(-461.50, 203.99, -425.93),
    CFrame.new(-495.88, 203.95, -443.72),
    CFrame.new(-527.11, 203.94, -464.42),
    CFrame.new(-556.19, 203.92, -489.98),
    CFrame.new(-581.11, 203.91, -517.90),
    CFrame.new(-603.86, 204.04, -549.23),
    CFrame.new(-624.06, 204.54, -580.82),
    CFrame.new(-646.32, 204.77, -611.50),
    CFrame.new(-670.79, 204.77, -641.00),
    CFrame.new(-697.62, 204.77, -668.94),
    CFrame.new(-725.90, 204.77, -694.19),
    CFrame.new(-755.50, 204.77, -718.55),
    CFrame.new(-783.95, 204.77, -743.60),
    CFrame.new(-812.71, 204.77, -768.95),
    CFrame.new(-841.23, 204.77, -795.18),
    CFrame.new(-867.32, 204.77, -821.53),
    CFrame.new(-891.69, 204.77, -852.16),
    CFrame.new(-914.32, 204.77, -883.09),
    CFrame.new(-933.91, 204.77, -914.57),
    CFrame.new(-951.39, 204.77, -949.60),
    CFrame.new(-964.80, 204.77, -985.50),
    CFrame.new(-974.97, 204.77, -1021.15),
    CFrame.new(-980.89, 204.77, -1059.01),
    CFrame.new(-984.87, 204.77, -1097.13),
    CFrame.new(-987.43, 204.77, -1134.95),
    CFrame.new(-988.35, 204.86, -1171.61),
    CFrame.new(-989.38, 205.18, -1208.26),
    CFrame.new(-990.58, 205.58, -1246.99),
    CFrame.new(-991.57, 206.27, -1282.38),
    CFrame.new(-992.63, 207.37, -1321.10),
    CFrame.new(-993.37, 208.84, -1359.40),
    CFrame.new(-993.50, 210.63, -1396.02),
    CFrame.new(-993.35, 212.55, -1432.64),
    CFrame.new(-993.01, 214.60, -1471.76),
    CFrame.new(-992.65, 216.43, -1506.71),
    CFrame.new(-992.54, 218.45, -1545.41),
    CFrame.new(-992.66, 220.44, -1583.28),
    CFrame.new(-992.52, 222.59, -1624.47),
    CFrame.new(-992.58, 224.27, -1658.18),
    CFrame.new(-992.68, 225.81, -1696.07),
    CFrame.new(-992.85, 226.70, -1734.39),
    CFrame.new(-993.26, 226.83, -1769.39),
    CFrame.new(-993.88, 226.82, -1808.14),
    CFrame.new(-993.91, 226.51, -1847.72),
    CFrame.new(-993.57, 226.31, -1881.46),
    CFrame.new(-990.53, 226.23, -1919.66),
    CFrame.new(-980.07, 226.21, -1956.82),
    CFrame.new(-964.39, 226.22, -1988.98),
    CFrame.new(-940.10, 226.12, -2017.45),
    CFrame.new(-911.30, 226.11, -2042.06),
    CFrame.new(-880.63, 226.08, -2058.83),
    CFrame.new(-843.78, 226.12, -2071.96),
    CFrame.new(-805.04, 226.15, -2076.70),
    CFrame.new(-770.48, 226.21, -2075.31),
    CFrame.new(-733.98, 226.33, -2067.04),
    CFrame.new(-701.95, 226.26, -2048.65),
    CFrame.new(-674.88, 226.25, -2027.14),
    CFrame.new(-647.08, 226.03, -2005.20),
    CFrame.new(-616.79, 225.66, -1979.09),
    CFrame.new(-583.10, 225.56, -1954.60),
    CFrame.new(-556.34, 225.69, -1943.61),
    CFrame.new(-518.37, 225.76, -1942.49),
    CFrame.new(-481.59, 225.70, -1956.75),
    CFrame.new(-453.76, 225.75, -1977.66),
    CFrame.new(-430.54, 226.01, -2005.88),
    CFrame.new(-410.92, 226.10, -2037.83),
    CFrame.new(-388.00, 226.10, -2066.34),
    CFrame.new(-353.40, 225.97, -2084.68),
    CFrame.new(-315.70, 225.86, -2091.21),
    CFrame.new(-280.57, 225.86, -2088.48),
    CFrame.new(-243.35, 225.84, -2071.99),
    CFrame.new(-213.75, 225.89, -2045.44),
    CFrame.new(-197.57, 225.87, -2014.14),
    CFrame.new(-190.04, 225.91, -1979.57),
    CFrame.new(-186.10, 225.91, -1938.94),
    CFrame.new(-182.60, 225.69, -1905.37),
    CFrame.new(-168.91, 225.69, -1871.28),
    CFrame.new(-158.96, 225.66, -1857.92),
    CFrame.new(-139.92, 225.70, -1838.13),
    CFrame.new(-109.05, 225.80, -1819.48),
    CFrame.new(-69.95, 225.82, -1813.42),
    CFrame.new(-34.94, 225.86, -1818.24),
    CFrame.new(-0.50, 225.89, -1836.21),
    CFrame.new(27.77, 226.08, -1860.06),
    CFrame.new(49.81, 225.94, -1893.33),
    CFrame.new(72.55, 225.78, -1922.30),
    CFrame.new(107.73, 225.73, -1939.70),
    CFrame.new(143.19, 225.51, -1936.40),
    CFrame.new(180.38, 225.54, -1919.43),
    CFrame.new(201.80, 225.54, -1891.10),
    CFrame.new(209.84, 225.59, -1853.96),
    CFrame.new(201.97, 225.75, -1815.30),
    CFrame.new(180.60, 225.93, -1785.68),
    CFrame.new(154.02, 225.84, -1759.86),
    CFrame.new(124.79, 225.49, -1736.38),
    CFrame.new(95.51, 225.65, -1710.49),
    CFrame.new(76.49, 225.70, -1680.23),
    CFrame.new(63.63, 225.75, -1644.21),
    CFrame.new(60.71, 225.72, -1605.68),
    CFrame.new(64.61, 225.75, -1566.73),
    CFrame.new(76.49, 225.79, -1531.34),
    CFrame.new(95.03, 225.91, -1501.68),
    CFrame.new(123.95, 226.80, -1471.27),
    CFrame.new(157.78, 228.35, -1454.72),
    CFrame.new(190.65, 230.42, -1445.73),
    CFrame.new(232.43, 232.96, -1442.04),
    CFrame.new(265.30, 234.71, -1446.62),
    CFrame.new(301.95, 236.68, -1454.27),
    CFrame.new(338.54, 238.53, -1462.28),
    CFrame.new(373.20, 239.92, -1472.68),
    CFrame.new(410.17, 241.62, -1486.72),
    CFrame.new(445.38, 243.21, -1500.70),
    CFrame.new(478.64, 244.57, -1513.97),
    CFrame.new(515.11, 245.93, -1526.86),
    CFrame.new(550.68, 247.21, -1535.65),
    CFrame.new(588.56, 248.56, -1543.64),
    CFrame.new(627.29, 249.91, -1549.33),
    CFrame.new(667.18, 251.11, -1550.65),
    CFrame.new(699.66, 251.98, -1546.06),
    CFrame.new(732.33, 253.11, -1527.52),
    CFrame.new(754.78, 254.12, -1497.23),
    CFrame.new(764.65, 254.99, -1462.81),
    CFrame.new(756.68, 255.31, -1424.85),
    CFrame.new(736.43, 255.24, -1394.01),
    CFrame.new(703.87, 255.54, -1371.98),
    CFrame.new(668.57, 257.44, -1362.72),
    CFrame.new(630.69, 260.04, -1357.68),
    CFrame.new(595.76, 261.93, -1357.61),
    CFrame.new(556.67, 263.91, -1359.08),
    CFrame.new(518.43, 266.21, -1360.44),
    CFrame.new(483.94, 268.23, -1361.80),
    CFrame.new(444.46, 270.40, -1363.69),
    CFrame.new(407.44, 271.41, -1365.74),
    CFrame.new(369.56, 272.20, -1366.92),
    CFrame.new(330.98, 272.49, -1361.41),
    CFrame.new(299.56, 272.38, -1343.91),
    CFrame.new(279.38, 272.41, -1314.58),
    CFrame.new(273.36, 272.67, -1276.70),
    CFrame.new(291.62, 272.81, -1241.84),
    CFrame.new(321.52, 272.80, -1225.29),
    CFrame.new(360.37, 273.17, -1226.21),
    CFrame.new(396.42, 274.94, -1232.66),
    CFrame.new(433.42, 276.86, -1238.48),
    CFrame.new(474.57, 278.95, -1244.64),
    CFrame.new(511.11, 280.83, -1246.33),
    CFrame.new(547.71, 282.69, -1245.19),
    CFrame.new(587.11, 284.66, -1242.04),
    CFrame.new(622.75, 286.41, -1235.77),
    CFrame.new(659.68, 288.18, -1225.66),
    CFrame.new(696.45, 289.93, -1213.63),
    CFrame.new(730.43, 291.31, -1199.90),
    CFrame.new(766.83, 292.77, -1185.55),
    CFrame.new(803.98, 294.04, -1176.56),
    CFrame.new(840.56, 295.43, -1184.41),
    CFrame.new(872.54, 296.89, -1206.86),
    CFrame.new(893.29, 298.28, -1237.59),
    CFrame.new(899.62, 299.24, -1274.72),
    CFrame.new(894.68, 299.96, -1312.25),
    CFrame.new(885.19, 300.49, -1350.25),
    CFrame.new(876.53, 300.97, -1385.02),
    CFrame.new(867.96, 301.47, -1420.67),
    CFrame.new(859.51, 302.23, -1458.47),
    CFrame.new(851.21, 302.69, -1494.61),
    CFrame.new(841.46, 302.93, -1532.55),
    CFrame.new(832.47, 302.78, -1568.95),
    CFrame.new(823.17, 302.82, -1605.28),
    CFrame.new(808.43, 302.67, -1641.88),
    CFrame.new(785.93, 302.58, -1670.66),
    CFrame.new(755.42, 302.63, -1694.34),
    CFrame.new(720.42, 302.67, -1706.14),
    CFrame.new(679.28, 302.96, -1707.99),
    CFrame.new(644.10, 303.88, -1704.10),
    CFrame.new(609.03, 305.20, -1699.35),
    CFrame.new(570.49, 307.67, -1692.86),
    CFrame.new(533.58, 310.73, -1687.02),
    CFrame.new(496.54, 312.35, -1681.32),
    CFrame.new(457.89, 312.14, -1675.04),
    CFrame.new(421.25, 311.77, -1669.33),
    CFrame.new(382.22, 311.55, -1668.22),
    CFrame.new(348.11, 311.63, -1683.30),
    CFrame.new(326.34, 311.60, -1714.50),
    CFrame.new(324.41, 311.44, -1751.37),
    CFrame.new(341.83, 311.20, -1783.39),
    CFrame.new(368.92, 311.34, -1811.66),
    CFrame.new(394.42, 311.17, -1836.82),
    CFrame.new(405.96, 310.92, -1851.59),
    CFrame.new(419.77, 310.81, -1884.84),
    CFrame.new(412.89, 310.74, -1921.83),
    CFrame.new(390.52, 310.78, -1949.40),
    CFrame.new(366.78, 310.96, -1978.36),
    CFrame.new(354.84, 310.78, -2012.60),
    CFrame.new(360.52, 310.57, -2048.84),
    CFrame.new(385.78, 310.48, -2075.45),
    CFrame.new(420.85, 311.90, -2089.96),
    CFrame.new(456.09, 315.14, -2086.70),
    CFrame.new(485.84, 318.74, -2062.82),
    CFrame.new(505.94, 321.31, -2030.78),
    CFrame.new(526.86, 323.89, -1999.26),
    CFrame.new(547.95, 327.19, -1967.93),
    CFrame.new(566.40, 329.56, -1937.79),
    CFrame.new(587.70, 331.50, -1904.50),
    CFrame.new(609.71, 333.22, -1874.22),
    CFrame.new(638.30, 335.18, -1847.92),
    CFrame.new(673.47, 336.64, -1837.31),
    CFrame.new(710.88, 337.29, -1845.83),
    CFrame.new(741.38, 338.20, -1866.57),
    CFrame.new(763.11, 339.60, -1898.18),
    CFrame.new(764.96, 340.50, -1936.05),
    CFrame.new(751.57, 341.20, -1970.11),
    CFrame.new(730.75, 342.28, -2003.13),
    CFrame.new(707.60, 343.20, -2033.66),
    CFrame.new(684.49, 345.10, -2063.65),
    CFrame.new(660.66, 347.55, -2094.10),
    CFrame.new(638.17, 349.89, -2123.47),
    CFrame.new(614.55, 352.50, -2157.18),
    CFrame.new(593.35, 354.72, -2184.94),
    CFrame.new(570.55, 357.09, -2214.61),
    CFrame.new(548.63, 359.46, -2244.95),
    CFrame.new(525.62, 361.21, -2275.03),
    CFrame.new(501.88, 361.76, -2305.12),
    CFrame.new(481.33, 362.42, -2332.40),
    CFrame.new(464.97, 362.30, -2368.46),
    CFrame.new(472.68, 361.94, -2405.83),
    CFrame.new(500.87, 361.71, -2432.12),
    CFrame.new(537.64, 361.64, -2434.55),
    CFrame.new(566.55, 361.61, -2410.65),
    CFrame.new(588.28, 361.91, -2386.49),
    CFrame.new(614.69, 363.40, -2356.49),
    CFrame.new(639.45, 365.98, -2328.46),
    CFrame.new(666.05, 368.81, -2298.16),
    CFrame.new(689.57, 371.34, -2270.70),
    CFrame.new(713.12, 373.93, -2242.17),
    CFrame.new(736.55, 376.57, -2212.47),
    CFrame.new(758.20, 379.01, -2185.08),
    CFrame.new(784.73, 381.98, -2152.01),
    CFrame.new(806.93, 384.37, -2126.15),
    CFrame.new(833.26, 387.19, -2095.61),
    CFrame.new(855.69, 389.60, -2069.41),
    CFrame.new(879.48, 392.26, -2039.48),
    CFrame.new(902.94, 394.74, -2009.79),
    CFrame.new(929.45, 397.49, -1977.76),
    CFrame.new(952.25, 399.81, -1951.31),
    CFrame.new(982.35, 402.01, -1926.97),
    CFrame.new(1017.81, 403.44, -1925.89),
    CFrame.new(1045.79, 404.22, -1949.53),
    CFrame.new(1060.35, 405.55, -1981.26),
    CFrame.new(1053.59, 407.00, -2018.58),
    CFrame.new(1039.24, 408.09, -2054.55),
    CFrame.new(1023.71, 409.24, -2087.75),
    CFrame.new(1007.54, 410.99, -2121.98),
    CFrame.new(990.17, 413.22, -2156.08),
    CFrame.new(973.04, 415.43, -2189.83),
    CFrame.new(956.70, 417.62, -2223.51),
    CFrame.new(939.46, 419.92, -2259.07),
    CFrame.new(923.30, 422.08, -2292.38),
    CFrame.new(907.20, 424.27, -2326.17),
    CFrame.new(891.51, 426.48, -2360.61),
    CFrame.new(875.12, 428.74, -2395.65),
    CFrame.new(858.42, 430.46, -2430.58),
    CFrame.new(842.41, 430.94, -2464.02),
    CFrame.new(826.85, 431.55, -2498.58),
    CFrame.new(824.47, 431.14, -2536.81),
    CFrame.new(846.38, 430.60, -2566.11),
    CFrame.new(882.60, 430.45, -2576.99),
    CFrame.new(916.96, 430.60, -2557.93),
    CFrame.new(935.53, 430.92, -2527.32),
    CFrame.new(953.70, 432.24, -2494.08),
    CFrame.new(966.77, 433.63, -2470.88),
    CFrame.new(987.25, 435.80, -2434.67),
    CFrame.new(1005.04, 437.79, -2400.78),
    CFrame.new(1023.27, 439.90, -2364.77),
    CFrame.new(1039.15, 441.76, -2332.70),
    CFrame.new(1056.11, 443.73, -2298.85),
    CFrame.new(1074.56, 445.79, -2263.89),
    CFrame.new(1094.55, 447.83, -2230.30),
    CFrame.new(1113.73, 449.59, -2202.58),
    CFrame.new(1136.00, 451.58, -2171.45),
    CFrame.new(1160.91, 453.62, -2140.75),
    CFrame.new(1186.16, 455.68, -2109.79),
    CFrame.new(1208.78, 457.53, -2082.05),
    CFrame.new(1232.74, 459.43, -2052.72),
    CFrame.new(1255.42, 460.32, -2024.99),
    CFrame.new(1280.49, 460.30, -1994.35),
    CFrame.new(1305.11, 460.27, -1963.37),
    CFrame.new(1326.33, 460.26, -1935.02),
    CFrame.new(1351.41, 459.76, -1906.08),
    CFrame.new(1381.01, 459.38, -1881.15),
    CFrame.new(1414.48, 459.15, -1865.51),
    CFrame.new(1450.90, 458.94, -1859.20),
    CFrame.new(1489.55, 458.67, -1864.55),
    CFrame.new(1523.17, 458.35, -1881.66),
    CFrame.new(1550.19, 458.05, -1908.05),
    CFrame.new(1567.51, 457.75, -1942.49),
    CFrame.new(1573.29, 457.54, -1978.86),
    CFrame.new(1569.09, 457.45, -2016.02),
    CFrame.new(1553.71, 457.48, -2051.90),
    CFrame.new(1531.66, 457.71, -2081.12),
    CFrame.new(1507.13, 458.05, -2110.02),
    CFrame.new(1483.01, 458.44, -2139.28),
    CFrame.new(1458.81, 459.92, -2168.96),
    CFrame.new(1434.82, 462.57, -2198.74),
    CFrame.new(1408.47, 465.56, -2231.95),
    CFrame.new(1387.81, 467.91, -2258.00),
    CFrame.new(1364.06, 470.61, -2287.97),
    CFrame.new(1340.31, 473.31, -2317.93),
    CFrame.new(1316.87, 475.98, -2347.61),
    CFrame.new(1292.39, 478.77, -2378.58),
    CFrame.new(1268.37, 481.50, -2408.87),
    CFrame.new(1245.88, 483.83, -2437.20),
    CFrame.new(1222.39, 485.04, -2465.87),
    CFrame.new(1198.25, 485.16, -2495.65),
    CFrame.new(1174.03, 485.19, -2524.82),
    CFrame.new(1149.38, 485.16, -2554.17),
    CFrame.new(1125.13, 484.91, -2584.93),
    CFrame.new(1102.98, 484.63, -2616.69),
    CFrame.new(1089.15, 484.54, -2651.48),
    CFrame.new(1083.85, 484.67, -2687.90),
    CFrame.new(1091.00, 484.84, -2725.92),
    CFrame.new(1103.93, 485.24, -2761.09),
    CFrame.new(1119.02, 485.19, -2795.87),
    CFrame.new(1130.86, 485.21, -2833.15),
    CFrame.new(1133.21, 485.40, -2870.46),
    CFrame.new(1124.09, 485.50, -2905.85),
    CFrame.new(1103.99, 485.61, -2941.26),
    CFrame.new(1076.02, 485.50, -2964.12),
    CFrame.new(1042.71, 485.41, -2982.20),
    CFrame.new(1009.56, 485.37, -2999.73),
    CFrame.new(976.68, 485.21, -3020.87),
    CFrame.new(954.20, 485.21, -3051.06),
    CFrame.new(948.98, 485.11, -3088.62),
    CFrame.new(957.70, 485.06, -3125.33),
    CFrame.new(978.07, 485.09, -3155.56),
    CFrame.new(990.19, 485.13, -3166.36),
    CFrame.new(1023.35, 485.19, -3181.23),
    CFrame.new(1060.29, 485.17, -3179.25),
    CFrame.new(1095.44, 485.13, -3161.34),
    CFrame.new(1122.39, 486.13, -3134.84),
    CFrame.new(1146.06, 488.83, -3105.90),
    CFrame.new(1170.28, 491.65, -3076.86),
    CFrame.new(1194.22, 494.46, -3047.58),
    CFrame.new(1218.41, 497.11, -3018.50),
    CFrame.new(1243.41, 499.88, -2987.40),
    CFrame.new(1265.41, 502.39, -2958.70),
    CFrame.new(1286.50, 505.00, -2927.81),
    CFrame.new(1303.38, 507.74, -2891.38),
    CFrame.new(1313.54, 510.16, -2855.80),
    CFrame.new(1320.23, 512.41, -2820.68),
    CFrame.new(1327.08, 514.83, -2782.20),
    CFrame.new(1331.15, 516.86, -2746.23),
    CFrame.new(1334.94, 518.94, -2707.73),
    CFrame.new(1338.57, 521.07, -2670.88),
    CFrame.new(1343.31, 523.39, -2631.23),
    CFrame.new(1350.99, 525.56, -2594.21),
    CFrame.new(1370.83, 527.77, -2561.28),
    CFrame.new(1400.82, 529.30, -2541.24),
    CFrame.new(1438.22, 531.03, -2534.33),
    CFrame.new(1475.40, 533.96, -2542.51),
    CFrame.new(1504.18, 536.27, -2567.88),
    CFrame.new(1515.82, 536.96, -2602.79),
    CFrame.new(1515.87, 535.86, -2641.08),
    CFrame.new(1513.34, 534.35, -2680.11),
    CFrame.new(1509.51, 533.66, -2716.57),
    CFrame.new(1505.69, 533.64, -2754.29),
    CFrame.new(1500.74, 534.01, -2791.88),
    CFrame.new(1496.19, 535.09, -2829.51),
    CFrame.new(1492.75, 536.70, -2867.22),
    CFrame.new(1489.73, 539.38, -2905.34),
    CFrame.new(1486.51, 542.33, -2943.00),
    CFrame.new(1483.90, 545.53, -2979.85),
    CFrame.new(1480.58, 549.21, -3018.27),
    CFrame.new(1476.97, 553.21, -3056.23),
    CFrame.new(1473.30, 557.31, -3095.02),
    CFrame.new(1470.57, 561.23, -3132.21),
    CFrame.new(1468.25, 565.15, -3169.43),
    CFrame.new(1465.44, 569.24, -3208.28),
    CFrame.new(1461.91, 573.64, -3249.98),
    CFrame.new(1459.10, 577.17, -3283.43),
    CFrame.new(1456.43, 581.09, -3320.63),
    CFrame.new(1453.82, 585.14, -3359.07),
    CFrame.new(1451.37, 588.86, -3396.72),
    CFrame.new(1448.93, 591.96, -3434.85),
    CFrame.new(1446.08, 594.50, -3473.83),
    CFrame.new(1442.93, 596.24, -3509.47),
    CFrame.new(1439.51, 597.44, -3547.64),
    CFrame.new(1435.99, 597.98, -3585.81),
    CFrame.new(1432.36, 597.89, -3623.12),
    CFrame.new(1429.15, 597.63, -3660.90),
    CFrame.new(1428.54, 597.32, -3697.55),
    CFrame.new(1435.88, 597.00, -3736.04),
    CFrame.new(1455.09, 596.82, -3766.63),
    CFrame.new(1487.40, 596.67, -3788.43),
    CFrame.new(1524.36, 596.43, -3791.15),
    CFrame.new(1560.37, 596.25, -3777.10),
    CFrame.new(1587.32, 596.37, -3754.99),
    CFrame.new(1607.70, 596.86, -3720.36),
    CFrame.new(1622.40, 597.28, -3685.86),
    CFrame.new(1636.54, 597.81, -3646.68),
    CFrame.new(1647.72, 598.09, -3614.83),
    CFrame.new(1659.83, 598.74, -3579.35),
    CFrame.new(1671.88, 599.87, -3542.98),
    CFrame.new(1682.35, 601.38, -3506.14),
    CFrame.new(1693.11, 603.40, -3468.97),
    CFrame.new(1704.57, 605.95, -3432.92),
    CFrame.new(1715.14, 608.08, -3399.63),
    CFrame.new(1726.73, 610.10, -3361.84),
    CFrame.new(1736.83, 611.37, -3327.05),
    CFrame.new(1747.95, 612.36, -3289.07),
    CFrame.new(1757.93, 612.93, -3254.23),
    CFrame.new(1768.71, 612.94, -3217.02),
    CFrame.new(1779.52, 612.86, -3181.12),
    CFrame.new(1790.16, 612.51, -3144.29),
    CFrame.new(1800.33, 612.39, -3109.06),
    CFrame.new(1812.27, 612.20, -3071.77),
    CFrame.new(1828.53, 612.22, -3037.20),
    CFrame.new(1853.07, 612.17, -3011.72),
    CFrame.new(1885.54, 612.17, -2991.71),
    CFrame.new(1921.52, 612.11, -2983.73),
    CFrame.new(1961.47, 612.14, -2984.05),
    CFrame.new(2001.46, 612.42, -2991.76),
    CFrame.new(2032.36, 612.68, -3001.85),
    CFrame.new(2067.50, 613.00, -3013.69),
    CFrame.new(2104.11, 613.12, -3026.37),
    CFrame.new(2139.68, 613.12, -3039.50),
    CFrame.new(2175.64, 613.12, -3052.77),
    CFrame.new(2210.16, 613.12, -3065.14),
    CFrame.new(2230.90, 613.12, -3072.71),
    CFrame.new(2265.81, 613.12, -3088.51),
    CFrame.new(2299.87, 613.12, -3106.06),
    CFrame.new(2332.34, 613.12, -3126.42),
    CFrame.new(2361.65, 613.12, -3151.73),
    CFrame.new(2390.12, 613.12, -3177.40),
    CFrame.new(2419.43, 613.12, -3201.43),
    CFrame.new(2451.72, 613.12, -3222.83),
    CFrame.new(2486.17, 613.12, -3239.58),
    CFrame.new(2520.46, 613.12, -3252.52),
    CFrame.new(2557.62, 613.12, -3261.89),
    CFrame.new(2595.35, 613.12, -3268.52),
    CFrame.new(2633.19, 613.12, -3270.37),
    CFrame.new(2671.42, 613.12, -3268.04),
    CFrame.new(2708.92, 613.12, -3262.48),
    CFrame.new(2746.27, 613.12, -3256.03),
    CFrame.new(2783.92, 613.12, -3248.84),
    CFrame.new(2819.92, 613.12, -3241.89),
    CFrame.new(2857.95, 613.12, -3234.42),
    CFrame.new(2895.17, 613.12, -3227.11),
    CFrame.new(2933.20, 613.12, -3219.64),
    CFrame.new(2970.41, 613.12, -3212.33),
    CFrame.new(3008.43, 613.40, -3204.86),
    CFrame.new(3045.62, 614.32, -3197.55),
    CFrame.new(3081.98, 615.82, -3190.41),
    CFrame.new(3119.13, 617.80, -3183.12),
    CFrame.new(3159.87, 619.99, -3174.66),
    CFrame.new(3194.11, 621.82, -3167.60),
    CFrame.new(3231.33, 623.80, -3160.70),
    CFrame.new(3268.18, 625.77, -3154.03),
    CFrame.new(3306.61, 627.82, -3146.75),
    CFrame.new(3329.49, 629.04, -3142.38),
    CFrame.new(3365.87, 630.98, -3135.42),
    CFrame.new(3402.22, 632.92, -3128.39),
    CFrame.new(3438.52, 634.86, -3121.01),
    CFrame.new(3476.49, 636.89, -3113.58),
    CFrame.new(3513.28, 638.86, -3106.59),
    CFrame.new(3551.28, 640.89, -3099.29),
    CFrame.new(3588.47, 642.71, -3092.13),
    CFrame.new(3625.76, 643.92, -3085.40),
    CFrame.new(3663.45, 644.54, -3078.46),
    CFrame.new(3701.11, 644.54, -3071.36),
    CFrame.new(3737.55, 644.54, -3064.50),
    CFrame.new(3774.78, 644.54, -3057.33),
    CFrame.new(3811.09, 644.53, -3049.80),
    CFrame.new(3849.49, 644.53, -3042.11),
    CFrame.new(3886.68, 644.52, -3034.81),
    CFrame.new(3924.40, 644.52, -3027.89),
    CFrame.new(3962.50, 644.51, -3020.83),
    CFrame.new(4004.70, 644.51, -3012.93),

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
    local velocity = direction * (distance / duration) * 0.02  -- Reduced velocity by 50%
    
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
                    local success = safeCarMovement(car, deathTrialPath[i], 0.008, "death")
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
