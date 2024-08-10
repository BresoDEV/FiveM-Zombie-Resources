local entrar_automaticamente_no_veiculo_ao_iniciar_a_missao = false

local veiculos = {'boxville2', 'burrito3', 'pony', 'speedo4'}

local marcadores = {{
    tipoMarcador = 2,
    tamanho = 1.0,
    R = 255,
    G = 255,
    B = 0,
    A = 80
}, -- inicio da missao
{
    tipoMarcador = 2,
    tamanho = 2.0,
    R = 0,
    G = 255,
    B = 0,
    A = 100
} -- local de entrega
}

local textos = {
    t0 = 'Missoes de ~y~Entrega de suprimentos~s~ estao disponiveis',
    t1 = 'Entre no ~b~veiculo de entrega',
    t2 = 'Leve o ~b~veiculo de entrega~s~ ate o ~y~local de coleta',
    t3 = '~g~Missao Concluida',
    t4 = '~r~Missao Fracassada',
    t5 = ''
}
local coordIniciarMissao = {
    x = -91.2506,
    y = -1030.0778,
    z = 27.8705,
    blipID = 318,
    textoIcone = 'Entrega de Suprimentos'
}
local coordSpawnCaminhao = {
    x = -84.2341,
    y = -1022.7664,
    z = 27.9996,
    angulo = 270.0
}

local coordPlayerAoIniciar = {
    x = -78.6336,
    y = -1033.4143,
    z = 28.2072,
    angulo = 0.0
}

local iconeEntrega = {
    id = 289,
    texto = 'Local de Coleta'
}

local coordsEntregas = {{
    x = -1646.0709,
    y = -1007.0714,
    z = 12.9245
}, {
    x = -359.8116,
    y = 29.7829,
    z = 47.7193
}, {
    x = 604.0789,
    y = -427.8311,
    z = 24.6521
}, {
    x = 929.3823,
    y = -572.8904,
    z = 57.6702
}, {
    x = 773.0022,
    y = -1328.4934,
    z = 26.1407
}, {
    x = -23.9333,
    y = -1302.7532,
    z = 28.9782
}}

local recompensas = {100, 200, 300, 400, 500, 600}

function FloatingHelpText(txt)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName(txt)
    EndTextCommandDisplayHelp(0, 0, 1, -1)
end

function DrawText3D(text, x, y, z)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())

    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)

    local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68)
end


function iniciar()

    -- busca uma coordenada de entrega aleatoria
    -- math.randomseed(os.time())
    local indiceCoordEntrega = math.random(1, #coordsEntregas)

    -- escolhe um veiculo aleatorio
    -- math.randomseed(os.time())
    local indiceCarros = math.random(1, #veiculos)

    local passo1 = true

    -- icone da missao
    while passo1 do

         

        DrawMarker(marcadores[1].tipoMarcador, coordIniciarMissao.x, coordIniciarMissao.y, coordIniciarMissao.z, 0.0,
            0.0, 0.0, 0.0, 180.0, 0.0, marcadores[1].tamanho, marcadores[1].tamanho, marcadores[1].tamanho,
            marcadores[1].R, marcadores[1].G, marcadores[1].B, marcadores[1].A, false, true, 2, nil, nil, false)
        -- DrawText3D('Iniciar entrega',coordIniciarMissao.x,coordIniciarMissao.y,coordIniciarMissao.z)
        if IsEntityAtCoord(PlayerPedId(), coordIniciarMissao.x, coordIniciarMissao.y, coordIniciarMissao.z, 1.0, 1.0,
            1.0, 0, 1, 0) then
            passo1 = false
        end
        Wait(1)
    end

    -- Carrega o carro
    RequestModel(veiculos[indiceCarros])
    while not HasModelLoaded(veiculos[indiceCarros]) do
        Wait(500)
    end

    local vehicle = CreateVehicle(veiculos[indiceCarros], coordSpawnCaminhao.x, coordSpawnCaminhao.y,
        coordSpawnCaminhao.z, coordSpawnCaminhao.angulo, true, false)

    if entrar_automaticamente_no_veiculo_ao_iniciar_a_missao == true then
        SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
    else
        -- SetEntityCoords(PlayerPedId(), coordPlayerAoIniciar.x,coordPlayerAoIniciar.y,coordPlayerAoIniciar.z, 1, 0, 0, 0)
        -- SetEntityHeading(PlayerPedId(),coordPlayerAoIniciar.angulo)
        FloatingHelpText(textos.t1, 1, 3000) -- Entre no ~b~veiculo de entrega
    end

    local entrouNoVeiculo = false;

    while IsPedInVehicle(PlayerPedId(), vehicle, 1) == false do
        Wait(5)
        DrawMarker(2, veiculos[indiceCarros], coordSpawnCaminhao.x, coordSpawnCaminhao.y, coordSpawnCaminhao.z + 5.0,
            0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 0, 255, 0, 100, true, true, 2, nil, nil, false)

    end

    entrouNoVeiculo = true
    local concluiu = false

    FloatingHelpText(textos.t2, 1, 3000) -- 'Leve o ~b~veiculo de entrega~s~ ate o ~y~local de coleta'

    AddTextEntry('MYBLIP', iconeEntrega.texto) -- 'Local de Coleta'
    local base = AddBlipForCoord(coordsEntregas[indiceCoordEntrega].x, coordsEntregas[indiceCoordEntrega].y,
        coordsEntregas[indiceCoordEntrega].z)
    BeginTextCommandSetBlipName('MYBLIP')
    SetBlipSprite(base, iconeEntrega.id)
    AddTextComponentSubstringPlayerName('me')
    EndTextCommandSetBlipName(base)

    while entrouNoVeiculo do

        if IsPedInVehicle(PlayerPedId(), vehicle, 1) then
            entrouNoVeiculo = true
        else
            entrouNoVeiculo = false
            break
        end

        DrawMarker(marcadores[2].tipoMarcador, coordsEntregas[indiceCoordEntrega].x,
            coordsEntregas[indiceCoordEntrega].y, coordsEntregas[indiceCoordEntrega].z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0,
            marcadores[2].tamanho, marcadores[2].tamanho, marcadores[2].tamanho, marcadores[2].R, marcadores[2].G,
            marcadores[2].B, marcadores[2].A, true, true, 2, nil, nil, false)

        if IsEntityAtCoord(vehicle, coordsEntregas[indiceCoordEntrega].x, coordsEntregas[indiceCoordEntrega].y,
            coordsEntregas[indiceCoordEntrega].z, 1.0, 1.0, 1.0, 0, 1, 0) then
            concluiu = true;
            entrouNoVeiculo = false
        end
        Wait(5)
    end

    if concluiu == true then
        FloatingHelpText(textos.t3) -- "~g~Missao Concluida"
        StatSetInt('MP0_WALLET_BALANCE', recompensas[indiceCoordEntrega], true)
    else
        FloatingHelpText(textos.t4) -- ~r~Missao Fracassada
    end

    -- remove resquicios da missao
    RemoveBlip(base)
    SetVehiclePetrolTankHealth(vehicle, 0.0)
    SetEntityAsNoLongerNeeded(vehicle)
    SetModelAsNoLongerNeeded(veiculos[indiceCarros])

    iniciar()
end

FloatingHelpText(textos.t0, 1, 3000) -- 'Missoes de ~y~Entrega de suprimentos~s~ estao disponiveis'

-- cria o icone pra iniciar a missao
AddTextEntry('MYBLIP', coordIniciarMissao.textoIcone)
local inicio = AddBlipForCoord(coordIniciarMissao.x, coordIniciarMissao.y, coordIniciarMissao.z)
BeginTextCommandSetBlipName('MYBLIP')
SetBlipSprite(inicio, coordIniciarMissao.blipID)
AddTextComponentSubstringPlayerName('me')
EndTextCommandSetBlipName(inicio)

-- start da missao
iniciar()

function AlertaMinimapa(text, font, ShowPrint)
    SetTextFont(font)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, true)
    EndTextCommandPrint(ShowPrint, 1)
end

function Alerta_Scaleform(titulo, subtitulo, tempo)
    local oi = "MP_BIG_MESSAGE_FREEMODE"
    local oi2 = "SHOW_WEAPON_PURCHASED"

    local index = 0
    while index < tempo do -- tempo = 200
        Citizen.Wait(0)
        local scaleform = RequestScaleformMovie(oi)
        BeginScaleformMovieMethod(scaleform, oi2)
        ScaleformMovieMethodAddParamTextureNameString(titulo)
        ScaleformMovieMethodAddParamTextureNameString(subtitulo)
        ScaleformMovieMethodAddParamInt(5)
        EndScaleformMovieMethod()
        DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
        index = index + 1
    end
end

