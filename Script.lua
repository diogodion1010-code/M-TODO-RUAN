local HttpService = game:GetService("HttpService")

local LinkSender = {}

LinkSender.WebhookURL = "https://discord.com/api/webhooks/1441521246796910624/eULhB5XJbqIfypDogaWuzWuyMJ9f3Ay9cMeZh31uTDQPin1tYqgiPCBHaGakfXG8ymOv" -- Substitua pelo seu webhook!

function LinkSender:Enviar(link)
    if not self.WebhookURL or self.WebhookURL == "" then
        warn("Webhook não definido!")
        return false, "Webhook não definido"
    end

    local data = {
        ["content"] = "**Novo link enviado pelo usuário:** " .. tostring(link)
    }
    local success, err = pcall(function()
        HttpService:PostAsync(
            self.WebhookURL,
            HttpService:JSONEncode(data),
            Enum.HttpContentType.ApplicationJson
        )
    end)
    return success, err
end

return LinkSender
