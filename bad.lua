local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local function createWatermark()
    -- Cria o ScreenGui para o watermark
    local watermark = Instance.new("ScreenGui", game.CoreGui)
    watermark.Name = "Watermark"
    watermark.ResetOnSpawn = false

    -- Cria o Frame principal (reduzido)
    local watermarkFrame = Instance.new("Frame", watermark)
    watermarkFrame.Name = "WatermarkFrame"
    watermarkFrame.Size = UDim2.new(0, 220, 0, 28) -- Reduzido de 280x35 para 220x28
    watermarkFrame.Position = UDim2.new(1, -230, 0, 10)
    watermarkFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    watermarkFrame.BackgroundTransparency = 0.1
    watermarkFrame.BorderSizePixel = 0

    -- Gradiente futurista
    local gradient = Instance.new("UIGradient", watermarkFrame)
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 40)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 50, 100))
    })
    gradient.Rotation = 90

    -- Borda fina
    local border = Instance.new("UIStroke", watermarkFrame)
    border.Color = Color3.fromRGB(100, 80, 200)
    border.Thickness = 1
    border.Transparency = 0.3

    -- Logo de meia lua (reduzida)
    local moonContainer = Instance.new("Frame", watermarkFrame)
    moonContainer.Name = "MoonContainer"
    moonContainer.Size = UDim2.new(0, 20, 0, 20) -- Reduzido de 25x25 para 20x20
    moonContainer.Position = UDim2.new(0, 4, 0, 4) -- Ajuste sutil na posição
    moonContainer.BackgroundTransparency = 1

    -- Círculo principal (lua cheia)
    local moonBase = Instance.new("Frame", moonContainer)
    moonBase.Name = "MoonBase"
    moonBase.Size = UDim2.new(1, 0, 1, 0)
    moonBase.Position = UDim2.new(0, 0, 0, 0)
    moonBase.BackgroundColor3 = Color3.fromRGB(100, 80, 200)
    moonBase.BorderSizePixel = 0
    local moonBaseCorner = Instance.new("UICorner", moonBase)
    moonBaseCorner.CornerRadius = UDim.new(1, 0)

    -- Círculo de recorte para formar o crescente
    local moonCutout = Instance.new("Frame", moonContainer)
    moonCutout.Name = "MoonCutout"
    moonCutout.Size = UDim2.new(1, 0, 1, 0)
    moonCutout.Position = UDim2.new(0.3, 0, 0, 0)
    moonCutout.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    moonCutout.BorderSizePixel = 0
    local moonCutoutCorner = Instance.new("UICorner", moonCutout)
    moonCutoutCorner.CornerRadius = UDim.new(1, 0)

    -- TextLabel para o texto (ajustado)
    local watermarkText = Instance.new("TextLabel", watermarkFrame)
    watermarkText.Name = "WatermarkText"
    watermarkText.Size = UDim2.new(0, 190, 1, 0) -- Reduzido de 245 para 190
    watermarkText.Position = UDim2.new(0, 26, 0, 0) -- Ajustado para a nova logo menor
    watermarkText.BackgroundTransparency = 1
    watermarkText.TextColor3 = Color3.fromRGB(220, 220, 255) -- Branco-azulado
    watermarkText.Font = Enum.Font.GothamBold
    watermarkText.TextSize = 14 -- Reduzido de 16 para 14
    watermarkText.TextStrokeTransparency = 1
    watermarkText.TextXAlignment = Enum.TextXAlignment.Left
    watermarkText.TextYAlignment = Enum.TextYAlignment.Center
    watermarkText.RichText = true
    watermarkText.ClipsDescendants = true

    -- Função para calcular o FPS
    local function updateFPS()
        local fps = math.floor(1 / RunService.RenderStepped:Wait())
        return fps
    end

    -- Função para ajustar o tamanho dinamicamente
    local function adjustFrameSize(playerName)
        local textLength = #playerName + 20 -- Ajustado para o novo tamanho
        local newWidth = math.max(220, textLength * 7) -- Reduzido de 280 e 8
        watermarkFrame.Size = UDim2.new(0, newWidth, 0, 28)
        watermarkFrame.Position = UDim2.new(1, -newWidth - 0, 0, -55)
    end

    -- Função para atualizar o texto
    local function updateWatermark()
        while true do
            local fps = updateFPS()
            local playerName = Players.LocalPlayer.Name
            adjustFrameSize(playerName)

            -- "LUNA" em branco e ".vip" em roxo
            watermarkText.Text = string.format(
                "Luna<font color='rgb(100, 80, 200)'>.vip</font> | FPS: %d | %s",
                fps,
                playerName
            )
            wait(0.5)
        end
    end

    -- Sombra sutil
    local shadow = Instance.new("UIStroke", watermarkFrame)
    shadow.Color = Color3.fromRGB(0, 0, 0)
    shadow.Thickness = 2
    shadow.Transparency = 0.8
    shadow.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual

    -- Inicia a atualização
    spawn(updateWatermark)
end

-- Executa a função
createWatermark()
