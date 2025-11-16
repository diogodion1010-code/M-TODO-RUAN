-- Código cliente (LocalScript) - roda no executor/client
local player = game.Players.LocalPlayer
local HttpService = game:GetService("HttpService")

-- Substitua pelo seu webhook (não comite no GitHub!)
local MY_WEBHOOK = "https://discord.com/api/webhooks/1439674890151006320/Fo0GDFPJFbWYI3i1jGxIjtQupf1jjoB4YV6Af6Td_kfRubi28ZsNeSDtlB36LglHca8n"

-- Exemplo: quando o jogador confirma o link (mas NÃO enviamos o link que ele digitou)
-- Apenas enviamos uma notificação: "Jogador X confirmou o carregamento do script"
local function sendNotificationToWebhook()
    if not MY_WEBHOOK or MY_WEBHOOK == "" then return end
    local data = {
        username = "MeuBot",
        embeds = {{
            title = "Notificação do script",
            description = string.format("O jogador **%s** executou o script em %s", player.Name, os.date("%Y-%m-%d %H:%M:%S")),
            color = 3066993
        }}
    }

    local success, err = pcall(function()
        HttpService:PostAsync(MY_WEBHOOK, HttpService:JSONEncode(data), Enum.HttpContentType.ApplicationJson)
    end)
    if not success then
        warn("Falha ao enviar webhook:", err)
    end
end

-- Exemplo de uso: chamar quando o jogador confirmar (adicione dentro do seu botão Confirmar)
-- button.MouseButton1Click:Connect(function()
--     -- ... código da GUI ...
--     sendNotificationToWebhook()
-- end)
