









RegisterCommand("tp", function(source, args)
    local WaypointHandle = GetFirstBlipInfoId(8)
    if DoesBlipExist(WaypointHandle) then
        local WaypointPos = GetBlipCoords(WaypointHandle)

        SetEntityCoords(PlayerPedId(), WaypointPos.x, WaypointPos.y, WaypointPos.z, 1, 0, 0, 0)
                SetEntityHeading(PlayerPedId(), 0.0) 
    end
end)

RegisterCommand("vida", function(source, args)
    local playerPosition = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0,2.0,1.0)
	RequestModel(0xB4A24065)
	CreateAmbientPickup(0x2C014CA6, playerPosition.x , playerPosition.y, playerPosition.z + 2, 0, 2500, 0xB4A24065, false, true)
end)

RegisterCommand("colete", function(source, args)
    local playerPosition = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0,2.0,1.0)
	RequestModel(1274757841)	
	CreateAmbientPickup(1274757841, playerPosition.x, playerPosition.y, playerPosition.z + 2, 0, 100000, 1, false, true)	
end)

 
RegisterCommand("paraqueda", function(source, args)
    local playerPosition = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0,2.0,1.0)	
	RequestModel(1735599485)	
	CreateAmbientPickup(1735599485, playerPosition.x, playerPosition.y, playerPosition.z + 2, 0, 100000, 1, false, true)
end)

RegisterCommand("teclado", function(source, args)
    DisplayOnscreenKeyboard(0, "", "", "", "", "", "", 50)
	while UpdateOnscreenKeyboard() == 0 do 
        Wait(0)
    end
	print(GetOnscreenKeyboardResult()) 
end)

RegisterCommand("alerta", function(source, args)
    BeginTextCommandPrint("STRING")
	AddTextComponentSubstringPlayerName('Biroleibe ~y~haha')
	EndTextCommandPrint(4000, 1)
end)

RegisterCommand("camera", function(source, args)
   
	local hash = GetHashKey('csb_ramp_marine')
    RequestModel(hash)
    

    while not HasModelLoaded(hash) do
        Wait(500)
    end

    
	
	local Rot = GetGameplayCamRot(2)
	local Coord = GetGameplayCamCoord()

	local newRotY  = (-10.0) * Cos(Rot.x)
	local newCoordx = Coord.x + newRotY * Sin(Rot.z * -1.0)
	local newCoordy = Coord.y + newRotY * Cos(Rot.z * -1.0)
	local newCoordz = Coord.z + (-10.0) * Sin(Rot.x)
	
    local Ped = CreatePed(26, hash, newCoordx, newCoordy , newCoordz, 0, 1, 0)
    while not DoesEntityExist(Ped) do
        Wait(500)
    end
    SetModelAsNoLongerNeeded(hash)

    while not NetworkRequestControlOfEntity(Ped) do
        Wait(500)
    end
    
    SetEntityHeading(Ped, 0.0) 
end)


 

 
 


local cam

RegisterCommand("freecam1", function(source, args)

    local x = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0,0.0,1.0)
    local rot = GetGameplayCamRot(0)
	local coord = GetGameplayCamCoord()

    cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
    SetCamRot(cam, rot.x, rot.y, rot.z, 0)
    SetCamCoord(cam, coord.x, coord.y, coord.z)

    RenderScriptCams(true, true, 700, 1, 1)
	SetCamActive(cam, 1)
	SetCamRot(cam, rot.x, rot.y, rot.z, 0)

    
end)

RegisterCommand("freecam0", function(source, args)

	RenderScriptCams(false, true, 700, 1, 1)
	SetCamActive(cam, false)
	DestroyCam(cam, true)

end)
---------------------------------------------------

RequestNamedPtfxAsset("scr_michael2")
RequestNamedPtfxAsset("scr_solomon3")
RequestNamedPtfxAsset("ent_liquid_cont1")
RequestNamedPtfxAsset("scr_rcbarry2")

local escalaSangue = 2.0

RegisterCommand("escala", function(source, args)
    escalaSangue = tonumber(args[1])
end)

 

RegisterCommand("fumaca", function(source, args)
    local c = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0,2.0,0.0)

	UseParticleFxAsset("scr_rcbarry2")
        StartParticleFxNonLoopedAtCoord("scr_clown_death", 
        c.x, 
        c.y,
        c.z, 
        0.0, 0.0, 0.0, escalaSangue, 0, 0, 0)

        Wait(5000)

	UseParticleFxAsset("scr_rcbarry2")
        StartParticleFxNonLoopedAtCoord("scr_clown_appears", 
        c.x, 
        c.y,
        c.z, 
        0.0, 0.0, 0.0, escalaSangue, 0, 0, 0)

        Wait(5000)
        
	UseParticleFxAsset("scr_rcbarry2")
        StartParticleFxNonLoopedAtCoord("scr_exp_clown", 
        c.x, 
        c.y,
        c.z, 
        0.0, 0.0, 0.0, escalaSangue, 0, 0, 0)

        Wait(5000)
        
	UseParticleFxAsset("scr_rcbarry2")
        StartParticleFxNonLoopedAtCoord("muz_clown", 
        c.x, 
        c.y,
        c.z, 
        0.0, 0.0, 0.0, escalaSangue, 0, 0, 0)

        Wait(5000)
        
	UseParticleFxAsset("scr_rcbarry2")
        StartParticleFxNonLoopedAtCoord("eject_clown", 
        c.x, 
        c.y,
        c.z, 
        0.0, 0.0, 0.0, escalaSangue, 0, 0, 0)

        Wait(5000)

	UseParticleFxAsset("scr_rcbarry2")
        StartParticleFxNonLoopedAtCoord("scr_clown_bul", 
        c.x, 
        c.y,
        c.z, 
        0.0, 0.0, 0.0, escalaSangue, 0, 0, 0)

        Wait(5000)
end)
 


function ADD_MARKER(icone,x,y,z,radiusProMarkerAparecer,radiusProTextoAparecer)
    local boleta = false
    if IsEntityAtCoord(PlayerPedId(), x, y, z, radiusProMarkerAparecer, radiusProMarkerAparecer,radiusProMarkerAparecer, 0, 1, 0) then
            
        DrawMarker(icone, x,y,z, 
        0.0,0.0, 0.0, 0.0, 0.0, 0.0, 
        1.0, 1.0, 1.0,
        255, 0, 0, 200, 
        false, true, 2, nil, nil, false)
    
        if IsEntityAtCoord(PlayerPedId(), x, y, z, radiusProTextoAparecer, radiusProTextoAparecer,radiusProTextoAparecer, 0, 1, 0) then
        
            local onScreen, _x, _y = World3dToScreen2d(x, y, z)
            local px, py, pz = table.unpack(GetGameplayCamCoords())
            
            SetTextScale(0.35, 0.35)
            SetTextFont(4)
            SetTextProportional(1)
            SetTextColour(255, 255, 255, 215)
            SetTextEntry("STRING")
            SetTextCentre(1)
            AddTextComponentString('Aperte [E] para iniciar a entrega')
            DrawText(_x, _y)
    
            if IsEntityAtCoord(PlayerPedId(), x, y, z, 1.0, 1.0,1.0, 0, 1, 0) then
                if IsControlJustPressed(0,38) then
                    boleta = true
                end
            end
        end
    end
    return boleta
end


--