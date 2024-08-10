local display = true

function SetDisplay(bool)
    display = bool
    -- SetNuiFocus(bool, bool)

end

SetDisplay(display)

Citizen.CreateThread(function()

    while display do
        Citizen.Wait(1000)
        local playerX = GetEntityCoords(PlayerPedId()).x
        local playerY = GetEntityCoords(PlayerPedId()).y
        local playerZ = GetEntityCoords(PlayerPedId()).z
        local playerAngle = GetEntityHeading(PlayerPedId())

        SendNUIMessage({
            type = "ui",
            status = true,
            playerX = GetEntityCoords(PlayerPedId(),1).x,
            playerY = GetEntityCoords(PlayerPedId(),1).y,
            playerZ = GetEntityCoords(PlayerPedId(),1).z,
            playerAngle = GetEntityHeading(PlayerPedId())
        
        })
    end
end)

