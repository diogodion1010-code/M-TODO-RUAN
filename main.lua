local Players = game:GetService("Players")
local player = Players.LocalPlayer

local LinkSender = require(script:WaitForChild("LinkSender"))

-- Criação da Interface
local function criarGUI()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "LinkServerGui"
    ScreenGui.Parent = player:WaitForChild("PlayerGui")

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 350, 0, 150)
    Frame.Position = UDim2.new(0.5, -175, 0.5, -75)
    Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Frame.Parent = ScreenGui

    local Title = Instance.new("TextLabel")
    Title.Text = "COLOQUE O LINK DO SERVIDOR"
    Title.TextSize = 20
    Title.Font = Enum.Font.SourceSansBold
    Title.Size = UDim2.new(1, 0, 0, 40)
    Title.BackgroundTransparency = 1
    Title.TextColor3 = Color3.fromRGB(255,255,255)
    Title.Parent = Frame

    local TextBox = Instance.new("TextBox")
    TextBox.PlaceholderText = "Digite o link aqui..."
    TextBox.Size = UDim2.new(1, -40, 0, 40)
    TextBox.Position = UDim2.new(0, 20, 0, 50)
    TextBox.Text = ""
    TextBox.TextSize = 16
    TextBox.TextColor3 = Color3.fromRGB(0,0,0)
    TextBox.BackgroundColor3 = Color3.fromRGB(245,245,245)
    TextBox.Parent = Frame

    local Button = Instance.new("TextButton")
    Button.Text = "Enviar"
    Button.Size = UDim2.new(0.6, 0, 0, 35)
    Button.Position = UDim2.new(0.2, 0, 1, -45)
    Button.TextSize = 16
    Button.BackgroundColor3 = Color3.fromRGB(30, 144, 255)
    Button.TextColor3 = Color3.new(1,1,1)
    Button.Parent = Frame

    return ScreenGui, TextBox, Button
end

-- Lógica principal
local gui, textbox, btn = criarGUI()

btn.MouseButton1Click:Connect(function()
    local link = textbox.Text
    if link ~= "" then
        btn.Text = "Enviando..."
        local sucesso, erro = LinkSender:Enviar(link)
        if sucesso then
            btn.Text = "Enviado!"
        else
            btn.Text = "Erro!"
            warn("Erro ao enviar webhook: " .. tostring(erro))
        end
        wait(1.2)
        gui:Destroy()
    else
        textbox.PlaceholderText = "Por favor, preencha o link!"
    end
end)
