-- GUI para pedir o link
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))

local box = Instance.new("TextBox")
box.Size = UDim2.new(0, 320, 0, 45)
box.Position = UDim2.new(0.5, -160, 0.4, 0)
box.PlaceholderText = "Cole o link do seu servidor aqui"
box.Text = ""
box.TextScaled = true
box.Parent = gui

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 320, 0, 45)
button.Position = UDim2.new(0.5, -160, 0.4, 55)
button.Text = "Confirmar"
button.TextScaled = true
button.Parent = gui

button.MouseButton1Click:Connect(function()
    if box.Text ~= "" then
        _G.ServerLink = box.Text
        gui:Destroy()

        -- ============================
        --   TELA PRETA COM ANIMAÇÃO
        -- ============================

        local loadingGui = Instance.new("ScreenGui", player.PlayerGui)

        -- Fundo preto com fade
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1,0,1,0)
        frame.BackgroundColor3 = Color3.new(0,0,0)
        frame.BackgroundTransparency = 1
        frame.Parent = loadingGui

        -- Fade-in
        game:GetService("TweenService"):Create(
            frame,
            TweenInfo.new(1.5, Enum.EasingStyle.Quad),
            {BackgroundTransparency = 0}
        ):Play()

        -- Texto animado
        local text = Instance.new("TextLabel")
        text.Size = UDim2.new(1,0,1,0)
        text.BackgroundTransparency = 1
        text.TextColor3 = Color3.new(1,1,1)
        text.TextScaled = true
        text.Text = "Carregando"
        text.Parent = loadingGui

        -- Animação de "..." piscando
        task.spawn(function()
            while loadingGui.Parent do
                text.Text = "Carregando"
                task.wait(0.6)
                text.Text = "Carregando."
                task.wait(0.6)
                text.Text = "Carregando.."
                task.wait(0.6)
                text.Text = "Carregando..."
                task.wait(0.6)
            end
        end)

        -- Esperar 3 minutos (180s)
        task.wait(180)

        -- Apagar tela preta
        loadingGui:Destroy()

        -- Carregar seu script
        loadstring(game:HttpGet("https://raw.githubusercontent.com/diogodion1010-code/M-TODO-RUAN/main/Script.lua"))()
    end
end)
