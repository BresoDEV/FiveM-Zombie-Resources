function joaat(str)
    local hash = 0
    for i = 1, #str do
        local char = str:byte(i)
        hash = ((hash + char) * 0x01000193) % 2 ^ 32
    end
    return string.format("%X", hash)
end

function toUpper(str)
    return string.upper(str)
end
function toLower(str)
    return string.lower(str)
end

function GET_HASH_KEY(str)
    -- str = string.lower(str)
    local h = 0
    for i = 1, #str do
        h = h + string.byte(str, i)
        h = h & 0xFFFFFFFF
        h = h + (h << 10)
        h = h & 0xFFFFFFFF
        h = h ~ (h >> 6)
        h = h & 0xFFFFFFFF
    end
    h = h + (h << 3)
    h = h & 0xFFFFFFFF
    h = h ~ (h >> 11)
    h = h & 0xFFFFFFFF
    h = h + (h << 15)
    h = h & 0xFFFFFFFF
    return string.upper(string.format("%08x", h))
end

function arquivoExiste(arq)
    local arquivo = io.open(arq, "r")
    if arquivo then
        arquivo:close()
        return true
    else
        return false
    end
end

function lerArquivo(arq)
    local arquivo = io.open(arq, "r")
    if arquivo then
        local conteudo = arquivo:read("*a")
        local backup = conteudo
        arquivo:close()
        return conteudo
    else
        os.execute("color 0c")
        print("Nao foi possivel abrir o arquivo.")
    end
end

function gravarArquivo(arq, texto)

    local arquivo = io.open(arq, "w")

    if arquivo then
        arquivo:write(texto)
        arquivo:close()
    else
        os.execute("color 0c")
        print("Nao foi possivel abrir o arquivo.")
    end
end

function gravarArquivoAppend(arq, texto)

    local arquivo = io.open(arq, "a")

    if arquivo then
        arquivo:write(texto .. '\n')
        arquivo:close()
    else
        os.execute("color 0c")
        print("Não foi possível abrir o arquivo")
    end
end

function Sleep(seg)
    os.execute("ping -n " .. seg .. " localhost > NUL")
end

function getMac() -- inutil,pois pega sempre o mac do servidor
    local h = io.popen("getmac")
    local m = h:read('*a')
    h:close()
    return m
end

function renomearArquivo(arquivo, newname)
    local status, err = os.rename(arquivo, newname)
    if not status then
        os.execute("color 0c")
        print('Erro ao renomear: ' .. err)
    end
end

function substituirPalavra(texto, palavraAntiga, palavraNova)
    local novo = string.gsub(texto, '%f[%a]' .. palavraAntiga .. '%f[%A]', palavraNova)
    return novo
end
------------------------------------------------------------
local function criarPasta(caminho)
    os.execute("mkdir " .. caminho)
end

-- Função para criar um arquivo de texto
local function criarArquivo(caminho, nomeArquivo)
    local arquivo = io.open(caminho .. "/" .. nomeArquivo, "w")
    if arquivo then
        arquivo:write("") -- Escreve algum conteúdo no arquivo
        arquivo:close()
    else
        print("Erro ao criar o arquivo " .. nomeArquivo)
    end
end

function criarUser(nome)

    local pastaA = "banco_de_dados_Zombie"

    -- Cria a pasta A
    criarPasta(pastaA)

    -- Cria o arquivo usuarios.dll dentro da pasta A
    criarArquivo(pastaA, "usuarios.dll")

    -- Verifica se a pasta B existe dentro da pasta A
    local pastaB = pastaA .. "\\" .. GET_HASH_KEY(nome)
    local pastaExiste = os.execute("cd " .. pastaB)

    if pastaExiste then
        print("A pasta B já existe. O código será interrompido.")
    else
        -- Cria a pasta B
        criarPasta(pastaB)

        -- Cria dois arquivos de texto dentro da pasta B
        criarArquivo(pastaB, GET_HASH_KEY(nome) .. ".dll")
        criarArquivo(pastaB, "log.dll")

        gravarArquivoAppend(pastaA .. '\\usuarios.dll', nome .. ' - ' .. GET_HASH_KEY(nome))

        local itens = {'Dinheiro', 'ZumbisMortos', 'VezesQueMorreu'}

        log(nome, 'Realizou o cadastro')

        local resultado = ''
        for _, valor in ipairs(itens) do
            resultado = resultado .. '\n' .. valor .. ' = 0'
        end
        gravarArquivo(pastaB .. '\\' .. GET_HASH_KEY(nome) .. ".dll", resultado)

    end

    -- local itens = {'Dinheiro', 'ZumbisMortos', 'VezesQueMorreu'}
    --
    -- local PastaPrincipal = 'banco_de_dados_Zombie'
    -- criarPasta(PastaPrincipal)
    --
    -- local pastaUsuario = PastaPrincipal .. '/' .. GET_HASH_KEY(nome)
    -- criarPasta(pastaUsuario)
    --
    -- local arquivo = pastaUsuario .. '/' .. GET_HASH_KEY(nome) .. '.dll'
    --
    ---------------------------------
    --
    ---- criarPasta(pasta)
    -- if not arquivoExiste(arquivo) then
    --
    --    -- salva o user na lista de usuarioos
    --    criarArquivo(PastaPrincipal .. '/usuarios.dll')
    --    gravarArquivoAppend(PastaPrincipal .. '/usuarios.dll', nome .. ' - ' .. GET_HASH_KEY(nome))
    --
    --    -- cria o log
    --    criarArquivo(pastaUsuario .. '/log.dll')
    --
    --    -- log(nome,'Realizou o cadastro')
    --
    --    local resultado = ''
    --    for _, valor in ipairs(itens) do
    --        resultado = resultado .. '\n' .. valor .. ' = 0'
    --    end
    --    gravarArquivo(arquivo, resultado)
    --
    -- else
    --    os.execute("color 0c")
    --    print('User ja existe')
    -- end
end

RegisterCommand('rid', function(source, args, rawCommand)
    -- Verifica se o comando foi executado por um jogador (e não pelo console do servidor)
    if source == 0 then
        print("Este comando deve ser executado por um jogador.")
        return
    end

    -- Obtém os identificadores do jogador
    local identifiers = GetPlayerIdentifiers(source)

    -- Procura e exibe a Rockstar License
    for _, id in ipairs(identifiers) do
        if string.find(id, "license:") then

            local novoID = string.gsub(id, 'license:', '')

            print(novoID)
            criarUser(novoID)
            break
        end
    end
end, false)

RegisterCommand('info', function(source, args, rawCommand)

    TriggerClientEvent('chat:addMessage', -1, {
        color = {255, 0, 0},
        multiline = true,
        args = {"Sistema", "Essa mensagem é pra todos da sessao "}
    })
    TriggerClientEvent('chat:addMessage', source, {
        color = {255, 0, 0},
        multiline = true,
        args = {"Sistema", "Essa é só pra mim"}
    })
    TriggerClientEvent('chat:addMessage', 2, {
        color = {255, 0, 0},
        multiline = true,
        args = {"Sistema", "Essa é pra algum cliente especifico"}
    })
end, false)

---------------------------------------------------------------------
local pedJaFoiCriado = false

RegisterNetEvent('spawnarPed')

AddEventHandler('spawnarPed', function()
    if not pedJaFoiCriado then
        local hash = GetHashKey('mp_f_meth_01')
        local Ped = CreatePed(26, hash, 50.2941, -381.1460, 63.8009, 0, 1, 0)
        while not DoesEntityExist(Ped) do
            Wait(500)
        end 
        SetEntityHeading(Ped, 325.0)
        FreezeEntityPosition(Ped, true)
        local vehNetId = NetworkGetNetworkIdFromEntity(Ped)
        pedJaFoiCriado = true 
        local source = source 
        local scenario = 'WORLD_HUMAN_SMOKING'
        TriggerClientEvent('aplicarScenarioPed',source,  vehNetId,scenario)
    end
end)

----------------------------------------------

function log(user, txt)
    local pasta = 'banco_de_dados_Zombie\\' .. GET_HASH_KEY(user) .. '\\log.dll'
    local hora = os.date('[%d/%m/%Y - %H:%M:%S] - ')
    gravarArquivoAppend(pasta, hora .. txt)
end

function arrayToString(array, separador)
    local resultado = ''
    for _, valor in ipairs(array) do
        resultado = resultado .. separador .. valor
    end
    return resultado
end

function stringToArray(string, separador)
    local resultado = {}
    for e in string.gmatch(string, "([^" .. separador .. "]+)") do
        table.insert(resultado, e)
    end
    return resultado
end

function lerArquivoLinhaALinha(arq)

    -- Exemplo:

    -- local b = lerArquivoLinhaALinha('usuarios.dll')
    -- for _, valor in ipairs(b) do
    --    print(valor)
    -- end

    local linhas = {}
    local arquivo = io.open(arq, "r")
    if arquivo then
        for valor in arquivo:lines() do
            table.insert(linhas, valor)
        end
        arquivo:close()
        return linhas
    else
        os.execute("color 0c")
        print("Nao foi possivel abrir o arquivo.")
    end
end

----------------------------------

-- while true do
--    print('ping')
-- end
