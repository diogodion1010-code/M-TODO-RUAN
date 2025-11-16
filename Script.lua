-- LocalScript — Seguro e editável
local player = game.Players.LocalPlayer
local HttpService = game:GetService("HttpService")

--------------------------------------------------------------------
-- 🔹🔹 ÁREA PARA COLOCAR SEU WEBHOOK "https://discord.com/api/webhooks/1439674890151006320/Fo0GDFPJFbWYI3i1jGxIjtQupf1jjoB4YV6Af6Td_kfRubi28ZsNeSDtlB36LglHca8n"
--------------------------------------------------------------------
local MY_WEBHOOK = ""  
-- COLOQUE SEU WEBHOOK ENTRE ASPAS ACIMA
-- Exemplo: local MY_WEBHOOK = "https://discord.com/api/webhooks/..."
--------------------------------------------------------------------

-- 🔹 Função segura: envia APENAS uma mensagem fixa
local function sendWebhookNotification()
    if MY_WEBHOOK == nil or MY_WEBHOOK == "" then
        warn("Webhook não definido!")
        return
    end

    local data = {
        username = "Script-Notifier",
        content = "**O jogador " .. player.Name .. " confirmou o script.**"
    }

    local success, err = pcall(function()
        HttpService:PostAsync(
            MY_WEBHOOK,
            HttpService:JSONEncode(data),
            Enum.HttpContentType.ApplicationJson
        )
    end)

    if not success then
        warn("Erro ao enviar webhook:", err)
    end
end

--------------------------------------------------------------------
-- 🔹 GUI SIMPLES (VOCÊ PODE EDITAR À VONTADE)
--------------------------------------------------------------------

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.fromScale(0.5, 0.5)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Parent = screenGui

local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 0.3, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = "Coloque o link do servidor:"
textLabel.TextScaled = true
textLabel.Parent = frame

local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(1, -20, 0.3, 0)
textBox.Position = UDim2.new(0, 10, 0.35, 0)
textBox.PlaceholderText = "Digite aqui"
textBox.Text = ""
textBox.TextScaled = true
textBox.Parent = frame

local button = Instance.new("TextButton")
button.Size = UDim2.new(0.6, 0, 0.25, 0)
button.Position = UDim2.new(0.2, 0, 0.7, 0)
button.Text = "Confirmar"
button.TextScaled = true
button.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
button.Parent = frame

-- QUANDO O JOGADOR CLICA:
button.MouseButton1Click:Connect(function()
    print("Jogador digitou:", textBox.Text)  -- Apenas print, não envia nada.
    
    -- Envia mensagem fixa para seu webhook
    sendWebhookNotification()

    -- Aqui você pode adicionar outras funções que quiser
end)
