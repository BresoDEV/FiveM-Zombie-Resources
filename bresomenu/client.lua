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

--------------
local tempoWait = {
    valor = 250
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

function addTitle(titulo, menuatual, menuVoltar)

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




function DevMenu()

    addTitle('Dev Menu', 1, 0)

    --addFloatOption('x', teste, 0.1, -10.1, 10.0)
    --addFloatOption('y', teste2, 0.1, -10.1, 10.0)
    --addFloatOption('z', teste3, 0.1, -10.1, 10.0)
    --addIntOption('marker', marker, 1, 0, 43)

     
    if addOption('Config Menu') then
        Citizen.Wait(tempoWait.valor)
        optionIndex = 1
        menuIndex = 1020
    end
     
    if addOption('Workstation') then

        local cord2 = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,0.6,-1.0)
        local Objeto_spawn = CreateObject(GetHashKey("prop_tool_bench02"), cord2.x, cord2.y, cord2.z,
            GetEntityHeading(PlayerPedId()), true, true);
        
            SetEntityHeading(Objeto_spawn,GetEntityHeading(PlayerPedId())+90.0)
        FreezeEntityPosition(Objeto_spawn, true);

    end

    if addOption('grade') then

        local cord2 = GetOffsetFromEntityInWorldCoords(PlayerPedId(),-2.0,0.6,0.0)
        local Objeto_spawn = CreateObject(GetHashKey("prop_fnclink_02gate5"), cord2.x, cord2.y, cord2.z - 1,
            GetEntityHeading(PlayerPedId()), true, true);
       
        SetEntityHeading(Objeto_spawn,GetEntityHeading(PlayerPedId()))

        FreezeEntityPosition(Objeto_spawn, true);

    end
    

    if addOption('Teleport para Base') then
        local i = PlayerPedId()
        if IsPedInAnyVehicle(PlayerPedId(), 0) then
            i = GetVehiclePedIsIn(PlayerPedId(), 0)
        end
        SetEntityCoords(i, -118.53456115723, -964.60687255859, 114.136655771484, 1, 0, 0, 0)

    end
    

    buttonMonitor();
end

 
------------------------------------

function Config()
    addTitle('Configs', 1020, 1)

    if addOption('Topo') then
        Citizen.Wait(tempoWait.valor)
        optionIndex = 1
        menuIndex = 1021
    end
    if addOption('Scrool') then
        Citizen.Wait(tempoWait.valor)
        optionIndex = 1
        menuIndex = 1022
    end
    if addOption('Menu') then
        Citizen.Wait(tempoWait.valor)
        optionIndex = 1
        menuIndex = 1023
    end

    if addOption('Opcoes') then
        Citizen.Wait(tempoWait.valor)
        optionIndex = 1
        menuIndex = 1024
    end

    buttonMonitor();
end

function Configs_Fonte()
    addTitle('Fonte', 1024, 1020)

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
    addTitle('Menu', 1023, 1020)

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
    addTitle('Scrool', 1022, 1020)

    addIntOption('Scrool R', corFundoSelecaoR, 1, 0, 255)
    addIntOption('Scrool G', corFundoSelecaoG, 1, 0, 255)
    addIntOption('Scrool B', corFundoSelecaoB, 1, 0, 255)
    addIntOption('Scrool A', corFundoSelecaoA, 1, 0, 255)

    addFloatOption('Scrool Altura', FundoSelecaoAltura, 0.0005, 0, 10)

    buttonMonitor();
end

function Configs_Topo()
    addTitle('Topo', 1021, 1020)

    addIntOption('Fundo R', corFundoTopoR, 1, 0, 255)
    addIntOption('Fundo G', corFundoTopoG, 1, 0, 255)
    addIntOption('Fundo B', corFundoTopoB, 1, 0, 255)
    addIntOption('Fundo A', corFundoTopoA, 1, 0, 255)
 
    addIntOption('Fonte Id', FonteTopo, 1, 0, 10)

    addFloatOption('Fonte Escala', FonteTopoEscala, 0.0025, 0, 10)
    addFloatOption('Fonte X', FonteTopoX, 0.0005, 0, 10)
    addFloatOption('Fonte Y', FonteTopoY, 0.0005, 0, 10)
    addFloatOption('Fundo Altura', FundoTopoAltura, 0.0005, 0, 10)

    buttonMonitor();
end

function menuEmBranco()
    addTitle('bla bla bla', 12, 0)

    buttonMonitor();
end

function Hook()
    --looop functions
end


-- Hook
Citizen.CreateThread(function()
    while true do
        Hook()
        -----------------------------
        if keyPressed(TECLAS.F9) then
            menuIndex = 1 -- abre o menu
        end
    

    ------------------------------------
        if menuIndex == 1 then
            DevMenu()
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
end)



