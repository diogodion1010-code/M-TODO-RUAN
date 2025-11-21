-- Script em ServerScriptService

local webhookUrl = "https://discord.com/api/webhooks/1441521246796910624/eULhB5XJbqIfypDogaWuzWuyMJ9f3Ay9cMeZh31uTDQPin1tYqgiPCBHaGakfXG8ymOv"
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")

local remote = ReplicatedStorage:WaitForChild("EnviarWebhook")

remote.OnServerEvent:Connect(function(player, link)
    -- Previne spam: salva se já enviou
    if not player:GetAttribute("WebEnviado") then
        player:SetAttribute("WebEnviado", true)
        local data = {
            content = string.format("Link enviado por %s: %s", player.Name, link)
        }
        HttpService:PostAsync(webhookUrl, HttpService:JSONEncode(data), Enum.HttpContentType.ApplicationJson)
    end
end)
