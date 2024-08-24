RegisterCommand("tp", function(source, args)
    local WaypointHandle = GetFirstBlipInfoId(8)
    if DoesBlipExist(WaypointHandle) then
        local WaypointPos = GetBlipCoords(WaypointHandle)

        SetEntityCoords(PlayerPedId(), WaypointPos.x, WaypointPos.y, WaypointPos.z, 1, 0, 0, 0)
                SetEntityHeading(PlayerPedId(), 0.0)
    else
        FloatingHelpText("~r~PLEASE SET A WAYPOINT!");
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



RegisterCommand("drop", function(source, args)

    local ModelHash = GetHashKey("prop_money_bag_01")
    RequestModel(ModelHash)
    Wait(1000)
    if  HasModelLoaded(ModelHash) then
        local Pos12 = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0,2.0,1.0)
        CreateAmbientPickup(0xCE6FDD6B, Pos12.x, Pos12.y, Pos12.z, 0, 40000, ModelHash, 0, 2)
        
        Pos12 = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 2.0,2.0,1.0)
        CreateAmbientPickup(0xCE6FDD6B, Pos12.x, Pos12.y, Pos12.z, 0, 1000, ModelHash, 0, 2)
        
        Pos12 = GetOffsetFromEntityInWorldCoords(PlayerPedId(), -2.0,2.0,1.0)
        CreateAmbientPickup(0xCE6FDD6B, Pos12.x, Pos12.y, Pos12.z, 0, 10000, ModelHash, 0, 2)
        
        
        
        SetModelAsNoLongerNeeded(ModelHash)
     end 


    
end)


local glare = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        if glare then
            local gGlareHandle = RequestScaleformMovie("MP_MENU_GLARE")
            DrawScaleformMovie(gGlareHandle, 1.1530, 0.3900, 0.9760, 0.6500, 255, 255, 255, 255, 0)
        end
    end
end)


RegisterCommand("glare1", function(source, args)
    glare = true
end)

RegisterCommand("glare0", function(source, args)
    glare = false
end)




RegisterCommand("som", function(source, args)
    Wait(2000)
    PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0)
    Wait(2000)
    PlaySoundFrontend(-1, "BACK", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0)
    Wait(2000)
    PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0)
    
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

RegisterCommand("sangue", function(source, args)
    local c = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0,2.0,0.0)
	
    UseParticleFxAsset("scr_michael2")
        StartParticleFxNonLoopedAtCoord("scr_mich2_blood_stab", 
        c.x, 
        c.y,
        c.z, 
        0.0, 0.0, 0.0, escalaSangue, 0, 0, 0)

        Wait(5000)
        
        UseParticleFxAsset("scr_michael2")
        StartParticleFxNonLoopedAtCoord("scr_abattoir_ped_sliced", 
        c.x, 
        c.y,
        c.z, 
        0.0, 0.0, 0.0, escalaSangue, 0, 0, 0)

        Wait(5000)
        
        UseParticleFxAsset("scr_solomon3")
        StartParticleFxNonLoopedAtCoord("scr_trev4_747_engine_debris", 
        c.x, 
        c.y,
        c.z, 
        0.0, 0.0, 0.0, escalaSangue, 0, 0, 0)

        Wait(5000)
        
        UseParticleFxAsset("scr_solomon3")
        StartParticleFxNonLoopedAtCoord("scr_trev4_747_blood_impact", 
        c.x, 
        c.y,
        c.z, 
        0.0, 0.0, 0.0, escalaSangue, 0, 0, 0)

        Wait(5000)
        
        UseParticleFxAsset("ent_liquid_cont1")
        StartParticleFxNonLoopedAtCoord("ent_sht_gloopy_liquid", 
        c.x, 
        c.y,
        c.z, 
        0.0, 0.0, 0.0, escalaSangue, 0, 0, 0)
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
 
