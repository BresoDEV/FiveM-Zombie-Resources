RegisterNetEvent('kickPlayer')
AddEventHandler('kickPlayer', function()
    local source = source
    if source then
        -- Kicka o jogador que chamou o evento
        DropPlayer(source, "Você foi banido do servidor por algum ADM")
    end
end)