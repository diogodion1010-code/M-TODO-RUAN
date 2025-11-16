-- script.lua (SEM KEY)
local HttpService = game:GetService("HttpService")
local webhook = _G.Webhook or ""

-- Função para enviar mensagem ao webhook
local function sendWebhook(msg)
    pcall(function()
        local data = { content = msg }
        local request = syn and syn.request or http_request or request or (http and http.request)
        if request then
            request({
                Url = webhook,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = HttpService:JSONEncode(data)
            })
        end
    end)
end

-- Loga o jogador no webhook
sendWebhook("🎮 Novo jogador iniciou o script!\nNome: **" .. game.Players.LocalPlayer.Name .. "**")

-- Carrega o main.lua
local url = "https://raw.githubusercontent.com/diogodion1010-code/M-TODO-RUAN/main/main.lua"
local ok, conteudo = pcall(function()
    return game:HttpGet(url)
end)

if ok then
    local func = loadstring(conteudo)
    if func then
        func()
    else
        warn("Erro ao executar main.lua (loadstring falhou)")
    end
else
    warn("Erro ao baixar main.lua do GitHub")
end
