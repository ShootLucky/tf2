local function createWatermark()
    -- Cria o ScreenGui para o watermark
    local watermark = Instance.new("ScreenGui", game.CoreGui)
    watermark.Name = "Watermark"
    watermark.ResetOnSpawn = false

    -- Cria o Frame que contém o texto do watermark
    local watermarkFrame = Instance.new("Frame", watermark)
    watermarkFrame.Name = "WatermarkFrame"
    watermarkFrame.Size = UDim2.new(0, 200, 0, 30) -- Ajuste o tamanho conforme necessário
    watermarkFrame.Position = UDim2.new(1, -200, 0, -60) -- Posiciona no canto superior direito
    watermarkFrame.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15) -- Cor de fundo escura
    watermarkFrame.BackgroundTransparency = 0 -- Sem transparência
    watermarkFrame.BorderSizePixel = 0 -- Remove a borda padrão

    -- Adiciona uma borda colorida ao Frame
    local border = Instance.new("UIStroke", watermarkFrame)
    border.Color = Color3.fromRGB(132, 108, 188) -- Cor da borda (132, 108, 188)
    border.Thickness = 1.5 -- Espessura da borda
    border.Transparency = 0 -- Sem transparência

    -- Cria o TextLabel para o texto do watermark
    local watermarkText = Instance.new("TextLabel", watermarkFrame)
    watermarkText.Name = "WatermarkText"
    watermarkText.Size = UDim2.new(1, 0, 1, 0)
    watermarkText.BackgroundTransparency = 1 -- Fundo transparente
    watermarkText.TextColor3 = Color3.new(1, 1, 1) -- Cor do texto (branco)
    watermarkText.Font = Enum.Font.SourceSans -- Fonte do texto
    watermarkText.TextSize = 18 -- Tamanho do texto
    watermarkText.TextStrokeTransparency = 0.5 -- Contorno do texto
    watermarkText.TextXAlignment = Enum.TextXAlignment.Center -- Alinhamento horizontal
    watermarkText.TextYAlignment = Enum.TextYAlignment.Center -- Alinhamento vertical
    watermarkText.RichText = true -- Habilita RichText para aplicar cores diferentes

    -- Função para atualizar o FPS
    local function updateFPS()
        local fps = math.floor(1 / game:GetService("RunService").RenderStepped:Wait())
        return fps
    end

    -- Função para atualizar o texto do watermark
    local function updateWatermark()
        while true do
            local fps = updateFPS()
            local playerName = game.Players.LocalPlayer.Name
            -- Aplica a cor roxa ao ".vip", ao FPS e ao nome do jogador
            watermarkText.Text = string.format(
                "Luna<font color='rgb(132, 108, 188)'>.vip</font> | <font color='rgb(132, 108, 188)'>FPS: %d</font> | <font color='rgb(132, 108, 188)'>%s</font>",
                fps,
                playerName
            )
            wait(1) -- Atualiza a cada segundo
        end
    end

    -- Inicia a atualização do watermark
    spawn(updateWatermark)
end

-- Executa a função para criar o watermark
createWatermark()
