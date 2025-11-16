-- main.lua
print("[main.lua] Carregado!")

pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "M-TODO-RUAN",
        Text = "Script iniciado sem KEY!",
        Duration = 5
    })
end)

local player = game.Players.LocalPlayer
if player and player.Character then
    for _, part in pairs(player.Character:GetChildren()) do
        if part:IsA("BasePart") then
            part.BrickColor = BrickColor.Random()
        end
    end
end
