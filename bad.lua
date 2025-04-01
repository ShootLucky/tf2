local function createWatermark()
    -- Cria o ScreenGui para o watermark
    local watermark = Instance.new("ScreenGui", game.CoreGui)
    watermark.Name = "Watermark"
    watermark.ResetOnSpawn = false

    -- Cria o Frame que contém o texto do watermark
    local watermarkFrame = Instance.new("Frame", watermark)
    watermarkFrame.Name = "WatermarkFrame"
    watermarkFrame.Size = UDim2.new(0, 200, 0, 30) -- Tamanho inicial
    watermarkFrame.Position = UDim2.new(1, -210, 0, 10) -- Posiciona no canto superior direito com margem
    watermarkFrame.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15) -- Cor de fundo escura
    watermarkFrame.BackgroundTransparency = 0.2 -- Leve transparência
    watermarkFrame.BorderSizePixel = 0 -- Remove a borda padrão

    -- Adiciona uma borda colorida ao Frame
    local border = Instance.new("UIStroke", watermarkFrame)
    border.Color = Color3.fromRGB(132, 108, 188) -- Cor da borda roxa
    border.Thickness = 2 -- Espessura da borda
    border.Transparency = 0 -- Sem transparência

    -- Cria o TextLabel para o texto do watermark
    local watermarkText = Instance.new("TextLabel", watermarkFrame)
    watermarkText.Name = "WatermarkText"
    watermarkText.Size = UDim2.new(1, -10, 1, 0) -- Margem interna
    watermarkText.Position = UDim2.new(0, 5, 0, 0) -- Centraliza com padding
    watermarkText.BackgroundTransparency = 1 -- Fundo transparente
    watermarkText.TextColor3 = Color3.new(1, 1, 1) -- Cor do texto (branco)
    watermarkText.Font = Enum.Font.SourceSansBold -- Fonte mais destacada
    watermarkText.TextSize = 18 -- Tamanho do texto
    watermarkText.TextStrokeTransparency = 0.7 -- Contorno sutil
    watermarkText.TextXAlignment = Enum.TextXAlignment.Center -- Alinhamento horizontal
    watermarkText.TextYAlignment = Enum.TextYAlignment.Center -- Alinhamento vertical
    watermarkText.RichText = true -- Habilita RichText
    watermarkText.ClipsDescendants = true -- Evita texto saindo do frame

    -- Função para calcular o FPS
    local function updateFPS()
        local fps = math.floor(1 / game:GetService("RunService").RenderStepped:Wait())
        return fps
    end

    -- Função para adicionar efeito de glow simulado com RichText
    local function applyGlowEffect(text)
        return "<font color='rgb(132, 108, 188)'><b>" .. text .. "</b></font>"
    end

    -- Função para ajustar o tamanho do Frame dinamicamente
    local function adjustFrameSize(playerName)
        local textLength = #playerName + 15 -- Aproximação com base no nome + extras
        local newWidth = math.max(200, textLength * 10) -- Largura mínima de 200
        watermarkFrame.Size = UDim2.new(0, newWidth, 0, 30)
        watermarkFrame.Position = UDim2.new(1, -newWidth - 10, 0, 10) -- Ajusta posição
    end

    -- Função para atualizar o texto do watermark
    local function updateWatermark()
        while true do
            local fps = updateFPS()
            local playerName = game.Players.LocalPlayer.Name
            adjustFrameSize(playerName) -- Ajusta o tamanho do frame

            -- Aplica o efeito de glow nas partes roxas
            watermarkText.Text = string.format(
                "Luna%s | %s | %s",
                applyGlowEffect(".vip"),
                applyGlowEffect("FPS: " .. fps),
                applyGlowEffect(playerName)
            )
            wait(1) -- Atualiza a cada segundo
        end
    end

    -- Adiciona um gradiente sutil para dar profundidade
    local gradient = Instance.new("UIGradient", watermarkFrame)
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 40)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 20))
    })
    gradient.Rotation = 45 -- Ângulo do gradiente

    -- Inicia a atualização do watermark
    spawn(updateWatermark)
end

-- Executa a função para criar o watermark
createWatermark()
