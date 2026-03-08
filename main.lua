-- LeakBlox Executer
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("LeakBlox Executer", "DarkTheme")

local ExecuterTab = Window:NewTab("Executor")
local ExecuterSection = ExecuterTab:NewSection("Script Runner")

local ScriptBox = ExecuterSection:NewTextBox("Script", "Paste your script here", function(t) end)
ScriptBox.TextBox.Size = UDim2.new(1, 0, 0, 300)
ScriptBox.TextBox.TextWrapped = true
ScriptBox.TextBox.MultiLine = true

ExecuterSection:NewButton("Execute Script", "Runs the script", function()
    loadstring(ScriptBox.TextBox.Text)()
end)

ExecuterSection:NewButton("Clear", "Clears the script box", function()
    ScriptBox.TextBox.Text = ""
end)

local HubTab = Window:NewTab("Script Hub")
local HubSection = HubTab:NewSection("30 OP Scripts")

local ScriptList = {
    {name = "Infinite Yield", url = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", detected = false},
    {name = "Dex Explorer", url = "https://raw.githubusercontent.com/infyiff/backup/main/dex.lua", detected = false},
    {name = "CMD-X", url = "https://raw.githubusercontent.com/CMD-X/CMD-X/master/source", detected = false},
    {name = "Kavo UI", url = "https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua", detected = false},
    {name = "Orion Library", url = "https://raw.githubusercontent.com/shlexware/Orion/main/source", detected = false},
    {name = "Remote Spy", url = "https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/master/simpleSpy.lua", detected = true},
    {name = "Dark Dex", url = "https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/DarkDexV3.lua", detected = false},
    {name = "Chat Bypasser", url = "https://raw.githubusercontent.com/ic3w0lf22/Unnamed-Script/master/Unnamed", detected = true},
    {name = "Rejoin Game", url = "https://raw.githubusercontent.com/ic3w0lf22/Unnamed-Script/master/Rejoin", detected = false},
    {name = "Server Hopper", url = "https://raw.githubusercontent.com/ic3w0lf22/Unnamed-Script/master/Serverhop", detected = false},
    {name = "FE Fake Kick", url = "https://raw.githubusercontent.com/ic3w0lf22/Roblox/main/FE%20Fake%20Kick", detected = true},
    {name = "FE Gun", url = "https://raw.githubusercontent.com/ic3w0lf22/Roblox/main/FE%20Gun", detected = true},
    {name = "Infinite Jump", url = "https://raw.githubusercontent.com/ic3w0lf22/Roblox/main/Infinite%20Jump", detected = false},
    {name = "Fly GUI", url = "https://raw.githubusercontent.com/ic3w0lf22/Roblox/main/Fly%20GUI", detected = false},
    {name = "ESP", url = "https://raw.githubusercontent.com/ic3w0lf22/Roblox/main/ESP", detected = true},
    {name = "Aimbot", url = "https://raw.githubusercontent.com/ic3w0lf22/Roblox/main/Aimbot", detected = true},
    {name = "Universal TP", url = "https://raw.githubusercontent.com/ic3w0lf22/Roblox/main/Universal%20TP", detected = false},
    {name = "Btools", url = "https://raw.githubusercontent.com/ic3w0lf22/Roblox/main/Btools", detected = false},
    {name = "Walkspeed", url = "https://raw.githubusercontent.com/ic3w0lf22/Roblox/main/Walkspeed", detected = false},
    {name = "Jumppower", url = "https://raw.githubusercontent.com/ic3w0lf22/Roblox/main/Jumppower", detected = false},
    {name = "Nameless Admin", url = "https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source", detected = false},
    {name = "HD Admin", url = "https://raw.githubusercontent.com/synchronicities/HD-Admin/main/Main.lua", detected = false},
    {name = "Solara Executor", url = "https://raw.githubusercontent.com/solaraexec/exec/main/executor", detected = true},
    {name = "Delta Executor", url = "https://raw.githubusercontent.com/deltaexecutor/exec/main/main.lua", detected = true},
    {name = "Arceus X", url = "https://raw.githubusercontent.com/arceusx/exec/main/script", detected = true},
    {name = "Fluxus", url = "https://raw.githubusercontent.com/fluxus/exec/main/loader", detected = true},
    {name = "Krnl", url = "https://raw.githubusercontent.com/krnl/exec/main/bootstrapper", detected = true},
    {name = "Synapse", url = "https://raw.githubusercontent.com/synapse/exec/main/loader", detected = true},
    {name = "Script-Ware", url = "https://raw.githubusercontent.com/scriptware/exec/main/main.lua", detected = true},
    {name = "Comet", url = "https://raw.githubusercontent.com/comet/exec/main/loader", detected = true}
}

local SearchBox = HubSection:NewTextBox("Search Scripts", "Type to search", function(t) end)

local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Size = UDim2.new(1, 0, 0, 400)
ScrollFrame.Position = UDim2.new(0, 0, 0, 50)
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.ScrollBarThickness = 8
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, #ScriptList * 30)
ScrollFrame.Parent = HubTab:GetMain()

local function LoadScripts(search)
    for i, v in pairs(ScrollFrame:GetChildren()) do
        if v:IsA("TextButton") then v:Destroy() end
    end
    
    local yPos = 0
    for _, script in ipairs(ScriptList) do
        if search == "" or script.name:lower():find(search:lower()) then
            local Button = Instance.new("TextButton")
            Button.Size = UDim2.new(1, -10, 0, 25)
            Button.Position = UDim2.new(0, 5, 0, yPos)
            Button.Text = script.name
            Button.BackgroundColor3 = script.detected and Color3.new(0.8, 0.2, 0.2) or Color3.new(0.2, 0.2, 0.2)
            Button.TextColor3 = Color3.new(1, 1, 1)
            Button.BorderSizePixel = 0
            Button.Parent = ScrollFrame
            
            Button.MouseButton1Click:Connect(function()
                local success, result = pcall(function()
                    return game:HttpGet(script.url)
                end)
                if success then
                    ScriptBox.TextBox.Text = result
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "LeakBlox";
                        Text = "Loaded " .. script.name;
                        Icon = "https://qu.ax/rR0bn";
                        Duration = 3;
                    })
                else
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "LeakBlox";
                        Text = "Failed to load " .. script.name;
                        Icon = "https://qu.ax/rR0bn";
                        Duration = 3;
                    })
                end
            end)
            
            yPos = yPos + 30
        end
    end
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, yPos)
end

SearchBox.TextBox.Changed:Connect(function()
    LoadScripts(SearchBox.TextBox.Text)
end)

LoadScripts("")

local RemoteTab = Window:NewTab("Remote Scanner")
local RemoteSection = RemoteTab:NewSection("Remote Event Scanner")

RemoteSection:NewButton("Scan Remotes", "Scans for remote events", function()
    local remotes = {}
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
            table.insert(remotes, v)
        end
    end
    
    for i, remote in ipairs(remotes) do
        local RemoteButton = RemoteSection:NewButton(remote.Name, "Click to execute", function()
            ScriptBox.TextBox.Text = ScriptBox.TextBox.Text .. "\n\n-- Remote: " .. remote.Parent.Name .. "." .. remote.Name .. "\n" .. remote:GetFullName()
        end)
        if i > 20 then break end
    end
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "LeakBlox";
        Text = "Found " .. #remotes .. " remotes";
        Icon = "https://qu.ax/rR0bn";
        Duration = 3;
    })
end)

local SettingsTab = Window:NewTab("Settings")
local SettingsSection = SettingsTab:NewSection("Configuration")

SettingsSection:NewButton("Drag GUI", "Enable dragging", function()
    local gui = script.Parent.Parent
    gui.Draggable = true
end)

SettingsSection:NewButton("Check Detection", "Check if current script is detected", function()
    local scriptText = ScriptBox.TextBox.Text:lower()
    local detected = false
    local keywords = {"spy", "bypass", "kick", "ban", "exploit", "crash", "lag", "freeze", "delete"}
    
    for _, word in ipairs(keywords) do
        if scriptText:find(word) then
            detected = true
            break
        end
    end
    
    if detected then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "LeakBlox";
            Text = "⚠️ This script may be detected!";
            Icon = "https://qu.ax/rR0bn";
            Duration = 5;
        })
    else
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "LeakBlox";
            Text = "✅ Script appears safe";
            Icon = "https://qu.ax/rR0bn";
            Duration = 5;
        })
    end
end)

local logo = Instance.new("ImageLabel")
logo.Image = "https://qu.ax/rR0bn"
logo.Size = UDim2.new(0, 50, 0, 50)
logo.Position = UDim2.new(0, 10, 0, 10)
logo.BackgroundTransparency = 1
logo.Parent = Window:GetMain()

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "LeakBlox";
    Text = "Executor loaded successfully!";
    Icon = "https://qu.ax/rR0bn";
    Duration = 3;
})
