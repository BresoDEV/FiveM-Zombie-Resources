-- topo
local corFundoTopoR = {
    valor = 0
}
local corFundoTopoG = {
    valor = 0
}
local corFundoTopoB = {
    valor = 0
}
local corFundoTopoA = {
    valor = 200
}
local FundoTopoAltura = {
    valor = 0.0500
}

local corFonteTopoR = {
    valor = 255
}
local corFonteTopoG = {
    valor = 255
}
local corFonteTopoB = {
    valor = 255
}
local corFonteTopoA = {
    valor = 180
}
local FonteTopo = {
    valor = 1
}
local FonteTopoEscala = {
    valor = 0.9000
}
local FonteTopoX = {
    valor = 0.055
}
local FonteTopoY = {
    valor = 0.0250
}

-- scroll
local corFundoSelecaoR = {
    valor = 0
}
local corFundoSelecaoG = {
    valor = 0
}
local corFundoSelecaoB = {
    valor = 0
}
local corFundoSelecaoA = {
    valor = 200
}
local FundoSelecaoAltura = {
    valor = 0.0500
}

-- corpo do menu
local MenuR = {
    valor = 0
}
local MenuG = {
    valor = 0
}
local MenuB = {
    valor = 0
}
local MenuA = {
    valor = 100
}
local MenuX = {
    valor = 0.1500
}
local MenuY = {
    valor = 0.0500
}
local MenuLargura = {
    valor = 0.2000
}

-- opcoes
local FonteOpcoesR = {
    valor = 255
}
local FonteOpcoesG = {
    valor = 255
}
local FonteOpcoesB = {
    valor = 255
}
local FonteOpcoesA = {
    valor = 255
}
local FonteOpcoesID = {
    valor = 6
}
local FonteOpcoesEscala = {
    valor = 0.5500
}
local FonteOpcoesX = {
    valor = 0.055
}
local FonteOpcoesY = {
    valor = 0.080
}

-- nao modificar esses valores
local optionIndex = 1;
local menuIndex = 0;
local menuAnterior = 0;
local numOpcoes = 0;
local espacamento = MenuY.valor
local optionY = FonteOpcoesY.valor
----------------------------

local TECLAS = {
    F1 = 288,
    F2 = 289,
    F3 = 170,
    F5 = 327, -- OU 318
    F6 = 167,
    F7 = 168,
    F9 = 56,
    F10 = 57,
    F11 = 344,
    ENTER = 215,
    BACKSPACE = 194,
    NUMPAD_0 = 0,
    NUMPAD_1 = 0,
    NUMPAD_2 = 0,
    NUMPAD_3 = 0,
    NUMPAD_4 = 0,
    NUMPAD_5 = 0,
    NUMPAD_6 = 0,
    NUMPAD_7 = 0,
    NUMPAD_8 = 0,
    NUMPAD_9 = 0,
    SETA_CIMA = 0,
    SETA_BAIXO = 0,
    SETA_DIR = 0,
    SETA_ESQ = 0
}

function keyPressed(key)
    return IsDisabledControlJustPressed(2, key)
end

function addOption(txt)
    numOpcoes = numOpcoes + 1
    if numOpcoes == optionIndex then
        DrawRect(MenuX.valor, espacamento, MenuLargura.valor, FundoSelecaoAltura.valor, corFundoSelecaoR.valor,
            corFundoSelecaoG.valor, corFundoSelecaoB.valor, corFundoSelecaoA.valor)
        drawOption(txt, FonteOpcoesX.valor, optionY)
    else
        DrawRect(MenuX.valor, espacamento, MenuLargura.valor, FundoSelecaoAltura.valor, MenuR.valor, MenuG.valor,
            MenuB.valor, MenuA.valor)
        drawOption(txt, FonteOpcoesX.valor, optionY)
    end

    if keyPressed(TECLAS.ENTER) then
        if numOpcoes == optionIndex then
            return true
        end
    end

    espacamento = espacamento + FundoSelecaoAltura.valor
    optionY = optionY + FundoSelecaoAltura.valor
    return false
end

local minhaTabelaInt = {
    valor = 5
}
local minhaTabelaFloat = {
    valor = 2.000
}
local minhaTabelaBool = {
    valor = false
}

function addFloatOption(txt, variavel, incremento, min, max)
    numOpcoes = numOpcoes + 1

    if numOpcoes == optionIndex then
        DrawRect(MenuX.valor, espacamento, MenuLargura.valor, FundoSelecaoAltura.valor, corFundoSelecaoR.valor,
            corFundoSelecaoG.valor, corFundoSelecaoB.valor, corFundoSelecaoA.valor)
        drawOption(txt, FonteOpcoesX.valor, optionY)
        drawOption('- ' .. string.format("%.4f", variavel.valor) .. ' -', 0.200, optionY)
    else
        DrawRect(MenuX.valor, espacamento, MenuLargura.valor, FundoSelecaoAltura.valor, MenuR.valor, MenuG.valor,
            MenuB.valor, MenuA.valor)
        drawOption(txt, FonteOpcoesX.valor, optionY)
        drawOption('- ' .. string.format("%.4f", variavel.valor) .. ' -', 0.200, optionY)
    end

    if keyPressed(TECLAS.ENTER) then
        if numOpcoes == optionIndex then
            return true
        end
    end

    -- 6
    if IsDisabledControlJustPressed(2, 109) or IsDisabledControlJustPressed(2, 175) then -- 6 addint
        if numOpcoes == optionIndex then
            if (variavel.valor + incremento) <= max then
                variavel.valor = variavel.valor + incremento
                return true
            else
                variavel.valor = min
            end

        end
    end
    -- 4
    if IsDisabledControlJustPressed(2, 108) or IsDisabledControlJustPressed(2, 174) then -- 4 removeint
        if numOpcoes == optionIndex then
            if (variavel.valor - incremento) >= min then
                variavel.valor = variavel.valor - incremento
                return true
            else
                variavel.valor = max
            end
        end
    end

    espacamento = espacamento + FundoSelecaoAltura.valor
    optionY = optionY + FundoSelecaoAltura.valor
    return false
end

function addIntOption(txt, variavel, incremento, min, max)
    numOpcoes = numOpcoes + 1

    if numOpcoes == optionIndex then
        DrawRect(MenuX.valor, espacamento, MenuLargura.valor, FundoSelecaoAltura.valor, corFundoSelecaoR.valor,
            corFundoSelecaoG.valor, corFundoSelecaoB.valor, corFundoSelecaoA.valor)
        drawOption(txt, FonteOpcoesX.valor, optionY)
        drawOption('- ' .. variavel.valor .. ' -', 0.215, optionY)
    else
        DrawRect(MenuX.valor, espacamento, MenuLargura.valor, FundoSelecaoAltura.valor, MenuR.valor, MenuG.valor,
            MenuB.valor, MenuA.valor)
        drawOption(txt, FonteOpcoesX.valor, optionY)
        drawOption('- ' .. variavel.valor .. ' -', 0.215, optionY)
    end

    if keyPressed(TECLAS.ENTER) then
        if numOpcoes == optionIndex then
            return true
        end
    end

    -- 6
    if IsDisabledControlJustPressed(2, 109) or IsDisabledControlJustPressed(2, 175) then -- 6 addint
        if numOpcoes == optionIndex then
            if (variavel.valor + incremento) <= max then
                variavel.valor = variavel.valor + incremento
                return true
            else
                variavel.valor = min
            end

        end
    end
    -- 4
    if IsDisabledControlJustPressed(2, 108) or IsDisabledControlJustPressed(2, 174) then -- 4 removeint
        if numOpcoes == optionIndex then
            if (variavel.valor - incremento) >= min then
                variavel.valor = variavel.valor - incremento
                return true
            else
                variavel.valor = max
            end
        end
    end

    espacamento = espacamento + FundoSelecaoAltura.valor
    optionY = optionY + FundoSelecaoAltura.valor
    return false
end

function addBoolOption(txt, variavel)
    numOpcoes = numOpcoes + 1

    if numOpcoes == optionIndex then
        DrawRect(MenuX.valor, espacamento, MenuLargura.valor, FundoSelecaoAltura.valor, corFundoSelecaoR.valor,
            corFundoSelecaoG.valor, corFundoSelecaoB.valor, corFundoSelecaoA.valor)
        drawOption(txt, FonteOpcoesX.valor, optionY)
        if variavel.valor == true then
            drawOption('~g~ON~s~/OFF', 0.210, optionY)
        else
            drawOption('ON/~r~OFF~s~', 0.210, optionY)
        end

    else
        DrawRect(MenuX.valor, espacamento, MenuLargura.valor, FundoSelecaoAltura.valor, MenuR.valor, MenuG.valor,
            MenuB.valor, MenuA.valor)
        drawOption(txt, FonteOpcoesX.valor, optionY)
        if variavel.valor == true then
            drawOption('~g~ON~s~/OFF', 0.210, optionY)
        else
            drawOption('ON/~r~OFF~s~', 0.210, optionY)
        end
    end

    if keyPressed(TECLAS.ENTER) then
        if numOpcoes == optionIndex then
            variavel.valor = not variavel.valor
            return true
        end
    end

    espacamento = espacamento + FundoSelecaoAltura.valor
    optionY = optionY + FundoSelecaoAltura.valor
    return false
end

function Topo(titulo, menuatual, menuVoltar)

    DrawRect(MenuX.valor, MenuY.valor, MenuLargura.valor, FundoTopoAltura.valor, corFundoTopoR.valor,
        corFundoTopoG.valor, corFundoTopoB.valor, corFundoTopoA.valor)

    SetTextCentre(false);
    SetTextRightJustify(false);
    SetTextColour(corFonteTopoR.valor, corFonteTopoG.valor, corFonteTopoB.valor, corFonteTopoA.valor);
    SetTextFont(FonteTopo.valor);
    SetTextScale(FonteTopoEscala.valor, FonteTopoEscala.valor);
    BeginTextCommandDisplayText("STRING");
    AddTextComponentSubstringPlayerName(titulo);
    EndTextCommandDisplayText(FonteTopoX.valor, FonteTopoY.valor);

    espacamento = espacamento + FundoTopoAltura.valor

    menuAnterior = menuVoltar

    -- backspace
    if keyPressed(TECLAS.BACKSPACE) then -- backspace
        Citizen.Wait(50)
        menuIndex = menuAnterior
        optionIndex = 1
    end
end

function buttonMonitor()
    -- 8
    if IsDisabledControlJustPressed(2, 111) or IsDisabledControlJustPressed(2, 172) then -- 8
        if optionIndex == 1 then
            optionIndex = numOpcoes
        else
            optionIndex = optionIndex - 1
        end
    end
    -- 5
    if IsDisabledControlJustPressed(2, 110) or IsDisabledControlJustPressed(2, 173) then -- 5
        if optionIndex == numOpcoes then
            optionIndex = 1
        else
            optionIndex = optionIndex + 1
        end
    end

    -- zerando as variaveis
    numOpcoes = 0
    espacamento = MenuY.valor
    optionY = FonteOpcoesY.valor
end

function drawOption(texto, x, y)
    SetTextCentre(false);
    SetTextRightJustify(false);
    SetTextColour(FonteOpcoesR.valor, FonteOpcoesG.valor, FonteOpcoesB.valor, FonteOpcoesA.valor);
    SetTextFont(FonteOpcoesID.valor);
    SetTextScale(FonteOpcoesEscala.valor, FonteOpcoesEscala.valor);
    BeginTextCommandDisplayText("STRING");
    AddTextComponentSubstringPlayerName(texto);
    EndTextCommandDisplayText(x, y);
end

local graficos = false;

local propX = {
    valor = 1.0
}
local propY = {
    valor = 1.0
}
local propZ = {
    valor = 1.0
}
local propA = {
    valor = 1.0
}
local propB = {
    valor = 1.0
}


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

function drawLineProps()
    local pedPool = GetGamePool("CObject")
    local coords = GetEntityCoords(PlayerPedId())
    local closestPed = -1
    local closestDist = -1
    for _, ped in pairs(pedPool) do
        -- if not IsPedAPlayer(ped) and not IsPedDeadOrDying(ped) then

        local bool = false

        if (GetEntityModel(ped) == GetHashKey('prop_dumpster_02a')) then
            bool = true
        end
        if (GetEntityModel(ped) == GetHashKey('prop_dumpster_3a')) then
            bool = true
        end
        if (GetEntityModel(ped) == GetHashKey('prop_dumpster_4a')) then
            bool = true
        end
        if (GetEntityModel(ped) == GetHashKey('prop_dumpster_4b')) then
            bool = true
        end
        if (GetEntityModel(ped) == GetHashKey('prop_dumpster_01a')) then
            bool = true
        end

        if bool == true then
            if GetEntityAlpha(ped) == 255 then
                local myCor = GetEntityCoords(PlayerPedId())
                local pedCor = GetOffsetFromEntityInWorldCoords(ped, 0.0, -1.0, 1.0)
                DrawLine(myCor.x, myCor.y, myCor.z, pedCor.x, pedCor.y, pedCor.z, 0, 255, 0, 255)

                DrawMarker(2, pedCor.x, pedCor.y, pedCor.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0,
                    200, false, true, 2, nil, nil, false)

                if IsEntityAtCoord(PlayerPedId(), pedCor.x, pedCor.y, pedCor.z, 10.0, 10.0, 10.0, 0, 1, 0) then
                    
                    DrawText3D('Se aproxime para coletar',pedCor.x, pedCor.y, pedCor.z)

                    if IsPedOnFoot(PlayerPedId()) and IsEntityAtCoord(PlayerPedId(), pedCor.x, pedCor.y, pedCor.z, 1.0, 1.0, 1.0, 0, 1, 0) then
                        SetEntityAlpha(ped, 254, false)
                        SetTextFont(0)
                        SetNotificationTextEntry("STRING")
                        AddTextComponentString('Recursos Coletados')
                        DrawNotification(false, true)
                    end
                end

            end

        end
    end
end


local propR = {
    valor = 1
}
local propG = {
    valor = 1
}
local propB = {
    valor = 1
}

function DevMenu()
    Topo('Dev Menu', 1, 0)

    addFloatOption('X', propX, 5.0, -100.0, 100.0)
    addFloatOption('Y', propY, 5.0, -100.0, 100.0)
    addIntOption('R',propR,1,0,255) 
    addIntOption('G',propG,1,0,255) 
    addIntOption('B',propB,1,0,255) 


    local myCor = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.0, 0.0)
    --local myCor2 = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.0, 1.0)

    DrawLightWithRange(myCor.x,myCor.y,myCor.z, propR.valor,propG.valor,propB.valor, propX.valor, propY.valor)

     


    if addOption('mesa') then

        local cord2 = GetEntityCoords(PlayerPedId())
        local Objeto_spawn = CreateObject(GetHashKey("prop_tool_bench02"), cord2.x, cord2.y, cord2.z - 1,
            GetEntityHeading(PlayerPedId()), true, 1);
        SetEntityCoords(Objeto_spawn, cord2.x, cord2.y, cord2.z - 1, 0, 0, 0, 1);
        FreezeEntityPosition(Objeto_spawn, true);

    end

    if addOption('Teleport para Base') then
        local i = PlayerPedId()
        if IsPedInAnyVehicle(PlayerPedId(), 0) then
            i = GetVehiclePedIsIn(PlayerPedId(), 0)
        end
        SetEntityCoords(i, -118.53456115723, -964.60687255859, 114.136655771484, 1, 0, 0, 0)

    end
    if addOption('Mascara de Gas') then
        -- 6, 3, 0, 2
        SetPedComponentVariation(PlayerPedId(), 6, 3, 0, 2)
    end
    if addOption('Armas') then
        GiveWeaponToPed(PlayerPedId(), 1432025498, 9999, 0, 1)
        GiveWeaponToPed(PlayerPedId(), 984333226, 9999, 0, 1)
        GiveWeaponToPed(PlayerPedId(), 961495388, 9999, 0, 1)
        GiveWeaponToPed(PlayerPedId(), 100416529, 9999, 0, 1) -- sniperrifle
        GiveWeaponToPed(PlayerPedId(), 1834241177, 9999, 0, 1) -- rail
        GiveWeaponToPed(PlayerPedId(), 1119849093, 9999, 0, 1) -- minigun
        GiveWeaponToPed(PlayerPedId(), 615608432, 9999, 0, 1) -- molotov
        GiveWeaponToPed(PlayerPedId(), 1233104067, 1, 0, 1) -- flare
        GiveWeaponToPed(PlayerPedId(), 883325847, 1, 0, 1) -- galao
        GiveWeaponToPed(PlayerPedId(), 2067956739, 1, 0, 1) -- pe de cabra
        GiveWeaponToPed(PlayerPedId(), -1951375401, 1, 0, 1) -- lanterna
        GiveWeaponToPed(PlayerPedId(), -102973651, 1, 0, 1) -- machado
        GiveWeaponToPed(PlayerPedId(), 453432689, 9999, 0, 1) -- pistola

    end

    buttonMonitor();
end

----------------------------------------

function CarMenu()
    Topo('Vehicles', 2, 0)
    if addOption('Motos') then
        Citizen.Wait(500)
        optionIndex = 1
        menuIndex = 3
    end
    if addOption('Militares') then
        Citizen.Wait(500)
        optionIndex = 1
        menuIndex = 4
    end
    if addOption('Basicos') then
        Citizen.Wait(500)
        optionIndex = 1
        menuIndex = 5
    end
    if addOption('Voadores') then
        Citizen.Wait(500)
        optionIndex = 1
        menuIndex = 6
    end

    buttonMonitor();
end

local vehicleName = ''

function CarMenu_Motos()
    Topo('Motos', 3, 2)
    if addOption('Deathbike') then

        vehicleName = 'deathbike'
    end
    if addOption('Enduro') then
        vehicleName = 'enduro'
    end
    if addOption('Gargoyle') then
        vehicleName = 'gargoyle'
    end
    if addOption('Rat Bike') then
        vehicleName = 'ratbike'
    end

    if vehicleName ~= '' then
        RequestModel(vehicleName)
        while not HasModelLoaded(vehicleName) do
            Wait(500)
        end
        local vehicle = CreateVehicle(vehicleName, GetEntityCoords(PlayerPedId()).x, GetEntityCoords(PlayerPedId()).y,
            GetEntityCoords(PlayerPedId()).z, GetEntityHeading(PlayerPedId()), true, false)
        SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
        SetEntityAsNoLongerNeeded(vehicle)
        SetModelAsNoLongerNeeded(vehicleName)

        SetVehicleModKit(GetVehiclePedIsIn(PlayerPedId(), 0), 0)
        for i = 0, 50 do
            SetVehicleMod(GetVehiclePedIsIn(PlayerPedId(), 0), i,
                GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(), 0), i) - 1, false)
        end
        SetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), 0), GetPlayerName(GetPlayerIndex()))

        vehicleName = ''
    end

    buttonMonitor();
end

function CarMenu_Militar()
    Topo('Militar', 4, 2)
    if addOption('APC') then
        vehicleName = 'apc'
    end
    if addOption('Barrage') then
        vehicleName = 'barrage'
    end
    if addOption('Dune') then
        vehicleName = 'dune3'
    end
    if addOption('Insurgent') then
        vehicleName = 'insurgent'
    end
    if addOption('Technical') then
        vehicleName = 'technical2'
    end

    if vehicleName ~= '' then
        RequestModel(vehicleName)
        while not HasModelLoaded(vehicleName) do
            Wait(500)
        end
        local vehicle = CreateVehicle(vehicleName, GetEntityCoords(PlayerPedId()).x, GetEntityCoords(PlayerPedId()).y,
            GetEntityCoords(PlayerPedId()).z, GetEntityHeading(PlayerPedId()), true, false)
        SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
        SetEntityAsNoLongerNeeded(vehicle)
        SetModelAsNoLongerNeeded(vehicleName)

        SetVehicleModKit(GetVehiclePedIsIn(PlayerPedId(), 0), 0)
        for i = 0, 50 do
            SetVehicleMod(GetVehiclePedIsIn(PlayerPedId(), 0), i,
                GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(), 0), i) - 1, false)
        end
        SetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), 0), GetPlayerName(GetPlayerIndex()))

        vehicleName = ''
    end

    buttonMonitor();
end

function CarMenu_Basicos()
    Topo('Basicos', 5, 2)

    if addOption('Caminhao da Morte') then
        vehicleName = 'cerberus'
    end
    if addOption('Caminhao Rampa') then
        vehicleName = 'phantom2'
    end
    if addOption('Issi') then
        vehicleName = 'issi4'
    end

    if addOption('Dukes') then
        vehicleName = 'dukes2'
    end

    if addOption('ZR 380') then
        vehicleName = 'zr3802'
    end

    if addOption('Carrinho de Golf') then
        vehicleName = 'caddy3'
    end

    if vehicleName ~= '' then
        RequestModel(vehicleName)
        while not HasModelLoaded(vehicleName) do
            Wait(500)
        end
        local vehicle = CreateVehicle(vehicleName, GetEntityCoords(PlayerPedId()).x, GetEntityCoords(PlayerPedId()).y,
            GetEntityCoords(PlayerPedId()).z, GetEntityHeading(PlayerPedId()), true, false)
        SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
        SetEntityAsNoLongerNeeded(vehicle)
        SetModelAsNoLongerNeeded(vehicleName)

        SetVehicleModKit(GetVehiclePedIsIn(PlayerPedId(), 0), 0)
        for i = 0, 50 do
            SetVehicleMod(GetVehiclePedIsIn(PlayerPedId(), 0), i,
                GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(), 0), i) - 1, false)
        end
        SetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), 0), GetPlayerName(GetPlayerIndex()))

        vehicleName = ''
    end

    buttonMonitor();
end

function CarMenu_Voadores()
    Topo('Voadores', 6, 2)

    if addOption('Helicoptero') then
        vehicleName = 'havok'
    end

    if addOption('Jetpack') then
        vehicleName = 'thruster'
    end

    if vehicleName ~= '' then
        RequestModel(vehicleName)
        while not HasModelLoaded(vehicleName) do
            Wait(500)
        end
        local vehicle = CreateVehicle(vehicleName, GetEntityCoords(PlayerPedId()).x, GetEntityCoords(PlayerPedId()).y,
            GetEntityCoords(PlayerPedId()).z, GetEntityHeading(PlayerPedId()), true, false)
        SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
        SetEntityAsNoLongerNeeded(vehicle)
        SetModelAsNoLongerNeeded(vehicleName)

        SetVehicleModKit(GetVehiclePedIsIn(PlayerPedId(), 0), 0)
        for i = 0, 50 do
            SetVehicleMod(GetVehiclePedIsIn(PlayerPedId(), 0), i,
                GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(), 0), i) - 1, false)
        end
        SetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), 0), GetPlayerName(GetPlayerIndex()))

        vehicleName = ''
    end

    buttonMonitor();
end

-----------------------------------------------

function Armas()
    Topo('Armas', 7, 0)

    if addOption('Armas Pesadas') then
        Citizen.Wait(500)
        optionIndex = 1
        menuIndex = 8
    end

    if addOption('Armas Leves') then
        Citizen.Wait(500)
        optionIndex = 1
        menuIndex = 9
    end
    if addOption('Armas Simples') then
        Citizen.Wait(500)
        optionIndex = 1
        menuIndex = 11
    end
    if addOption('Explosivos') then
        Citizen.Wait(500)
        optionIndex = 1
        menuIndex = 10
    end
    -----------------
    buttonMonitor();
end

function Armas_pesadas()
    Topo('Pesadas', 8, 7)
    if addOption('Railgun') then
        GiveWeaponToPed(PlayerPedId(), 1834241177, 9999, 0, 1)
    end
    if addOption('Minigun') then
        GiveWeaponToPed(PlayerPedId(), 1119849093, 9999, 0, 1)
    end
    if addOption('Heavy Shotgun') then
        GiveWeaponToPed(PlayerPedId(), 984333226, 9999, 0, 1)
    end

    buttonMonitor();
end

function Armas_Leves()
    Topo('Leves', 9, 7)
    if addOption('Machado') then
        GiveWeaponToPed(PlayerPedId(), -102973651, 1, 0, 1)
    end
    if addOption('Pe de Cabra') then
        GiveWeaponToPed(PlayerPedId(), 2067956739, 1, 0, 1)
    end
    if addOption('Flare') then
        GiveWeaponToPed(PlayerPedId(), 1233104067, 1, 0, 1)
    end
    if addOption('Galao') then
        GiveWeaponToPed(PlayerPedId(), 883325847, 1, 0, 1)
    end
    if addOption('Lanterna') then
        GiveWeaponToPed(PlayerPedId(), -1951375401, 1, 0, 1)
    end
    buttonMonitor();
end

function Armas_Explosivas()
    Topo('Explosivas', 10, 7)
    if addOption('Molotov') then
        GiveWeaponToPed(PlayerPedId(), 615608432, 9999, 0, 1)
    end

    buttonMonitor();
end

function Armas_Simples()
    Topo('Simples', 11, 7)
    if addOption('Pistola') then
        GiveWeaponToPed(PlayerPedId(), 453432689, 9999, 0, 1)
    end
    if addOption('Shotgun') then
        GiveWeaponToPed(PlayerPedId(), 1432025498, 9999, 0, 1)
    end
    if addOption('AK47') then
        GiveWeaponToPed(PlayerPedId(), 961495388, 9999, 0, 1)
    end
    if addOption('Sniper Rifle') then
        GiveWeaponToPed(PlayerPedId(), 100416529, 9999, 0, 1)
    end
    buttonMonitor();
end

------------------------------------

function Config()
    Topo('Configs', 1020, 0)

    if addOption('Topo') then
        Citizen.Wait(500)
        optionIndex = 1
        menuIndex = 1021
    end
    if addOption('Scrool') then
        Citizen.Wait(500)
        optionIndex = 1
        menuIndex = 1022
    end
    if addOption('Menu') then
        Citizen.Wait(500)
        optionIndex = 1
        menuIndex = 1023
    end

    if addOption('Opcoes') then
        Citizen.Wait(500)
        optionIndex = 1
        menuIndex = 1024
    end

    buttonMonitor();
end

function Configs_Fonte()
    Topo('Fonte', 1024, 1020)

    addIntOption('Fonte R', FonteOpcoesR, 1, 0, 255)
    addIntOption('Fonte G', FonteOpcoesG, 1, 0, 255)
    addIntOption('Fonte B', FonteOpcoesB, 1, 0, 255)
    addIntOption('Fonte A', FonteOpcoesA, 1, 0, 255)

    addFloatOption('Escala', FonteOpcoesEscala, 0.0005, 0, 10)

    addFloatOption('X', FonteOpcoesX, 0.0005, 0, 10)
    addFloatOption('Y', FonteOpcoesY, 0.0005, 0, 10)

    addIntOption('Fonte Id', FonteOpcoesID, 1, 0, 10)

    buttonMonitor();
end

function Configs_Menu()
    Topo('Menu', 1023, 1020)

    addIntOption('Menu R', MenuR, 1, 0, 255)
    addIntOption('Menu G', MenuG, 1, 0, 255)
    addIntOption('Menu B', MenuB, 1, 0, 255)
    addIntOption('Menu A', MenuA, 1, 0, 255)

    addFloatOption('Largura', MenuLargura, 0.0005, 0, 10)
    addFloatOption('X', MenuX, 0.0005, 0, 10)
    addFloatOption('Y', MenuY, 0.0005, 0, 10)

    buttonMonitor();
end

function Configs_Scrool()
    Topo('Scrool', 1022, 1020)

    addIntOption('Scrool R', corFundoSelecaoR, 1, 0, 255)
    addIntOption('Scrool G', corFundoSelecaoG, 1, 0, 255)
    addIntOption('Scrool B', corFundoSelecaoB, 1, 0, 255)
    addIntOption('Scrool A', corFundoSelecaoA, 1, 0, 255)

    addFloatOption('Scrool Altura', FundoSelecaoAltura, 0.0005, 0, 10)

    buttonMonitor();
end

function Configs_Topo()
    Topo('Topo', 1021, 1020)

    addIntOption('Fundo R', corFundoTopoR, 1, 0, 255)
    addIntOption('Fundo G', corFundoTopoG, 1, 0, 255)
    addIntOption('Fundo B', corFundoTopoB, 1, 0, 255)
    addIntOption('Fundo A', corFundoTopoA, 1, 0, 255)

    -- addIntOption('Fonte R',corFonteTopoR,1,0,255)
    -- addIntOption('Fonte G',corFonteTopoG,1,0,255)
    -- addIntOption('Fonte B',corFonteTopoB,1,0,255)
    -- addIntOption('Fonte A',corFonteTopoA,1,0,255)

    addIntOption('Fonte Id', FonteTopo, 1, 0, 10)

    addFloatOption('Fonte Escala', FonteTopoEscala, 0.0025, 0, 10)
    addFloatOption('Fonte X', FonteTopoX, 0.0005, 0, 10)
    addFloatOption('Fonte Y', FonteTopoY, 0.0005, 0, 10)
    addFloatOption('Fundo Altura', FundoTopoAltura, 0.0005, 0, 10)

    buttonMonitor();
end

function menuEmBranco()
    Topo('bla bla bla', 12, 0)

    buttonMonitor();
end

-- Hook
while true do

    -- enter

    if keyPressed(TECLAS.F1) then
        menuIndex = 1020 -- configs
    end

    -----------------------------
    if keyPressed(TECLAS.F9) then
        menuIndex = 1 -- menu dev
    end
    if keyPressed(TECLAS.F10) then
        menuIndex = 2 -- menu carros
    end

    if keyPressed(TECLAS.F11) then
        menuIndex = 7 -- menu armas
    end
    if keyPressed(TECLAS.F7) then
        menuIndex = 12 -- player menu
    end

    ------------------------------------
    if menuIndex == 1 then
        DevMenu()
    end

    ------------------------------------

    if menuIndex == 2 then
        CarMenu()
    end
    if menuIndex == 3 then
        CarMenu_Motos()
    end
    if menuIndex == 4 then
        CarMenu_Militar()
    end
    if menuIndex == 5 then
        CarMenu_Basicos()
    end
    if menuIndex == 6 then
        CarMenu_Voadores()
    end

    ----------------------------------

    if menuIndex == 7 then
        Armas()
    end

    if menuIndex == 8 then
        Armas_pesadas()
    end
    if menuIndex == 9 then
        Armas_Leves()
    end
    if menuIndex == 10 then
        Armas_Explosivas()
    end
    if menuIndex == 11 then
        Armas_Simples()
    end

    -------------------------------

    if menuIndex == 1020 then
        Config()
    end
    if menuIndex == 1024 then
        Configs_Fonte()
    end
    if menuIndex == 1023 then
        Configs_Menu()
    end
    if menuIndex == 1022 then
        Configs_Scrool()
    end
    if menuIndex == 1021 then
        Configs_Topo()
    end

    Citizen.Wait(1)
end

