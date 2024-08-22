RegisterCommand("m0", function(source, args)
    local playerPosition = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0,2.0,1.0)	
	RequestModel(0x9CA6F755)
	CreateAmbientPickup(0xDE78F17E, playerPosition.x, playerPosition.y, playerPosition.z + 2, 0, 2500, 0x9CA6F755, false, true)
end)


RegisterCommand("m1", function(source, args)
    local playerPosition = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0,2.0,1.0)
	RequestModel(0xB4A24065)
	CreateAmbientPickup(0x2C014CA6, playerPosition.x , playerPosition.y, playerPosition.z + 2, 0, 2500, 0xB4A24065, false, true)
end)

RegisterCommand("m2", function(source, args)
    local playerPosition = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0,2.0,1.0)
	RequestModel(0x9CA6F755)
	RequestModel(0x1E9A99F8)
	CreateAmbientPickup(0x1E9A99F8, playerPosition.x, playerPosition.y, playerPosition.z + 2, 0, 2500, 0x9CA6F755, false, true)
end)


RegisterCommand("m3", function(source, args)
    local playerPosition = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0,2.0,1.0)
	RequestModel(1274757841)	
	CreateAmbientPickup(1274757841, playerPosition.x, playerPosition.y, playerPosition.z + 2, 0, 100000, 1, false, true)	
end)


RegisterCommand("m4", function(source, args)
    local playerPosition = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0,2.0,1.0)	
	RequestModel(483577702)	
	CreateAmbientPickup(483577702, playerPosition.x, playerPosition.y, playerPosition.z + 2, 0, 100000, 1, false, true)	 
end)

RegisterCommand("m5", function(source, args)
    local playerPosition = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0,2.0,1.0)	
	RequestModel(1735599485)	
	CreateAmbientPickup(1735599485, playerPosition.x, playerPosition.y, playerPosition.z + 2, 0, 100000, 1, false, true)
end)

RegisterCommand("m6", function(source, args)
    local playerPosition = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0,2.0,1.0)	
	RequestModel(0x1E9A99F8)
	RequestModel(-1666779307)
	CreateAmbientPickup(0x1E9A99F8, playerPosition.x, playerPosition.y, playerPosition.z + 2, 0, 2500, -1666779307, false, true)
end)

RegisterCommand("m7", function(source, args)
    local playerPosition = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0,2.0,1.0)
	RequestModel(0xB4A24065)
	CreateAmbientPickup(0x2C014CA6, playerPosition.x , playerPosition.y, playerPosition.z + 2, 0, 2500, 0xB4A24065, false,false)
end)

RegisterCommand("m8", function(source, args)
    local playerPosition = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0,2.0,1.0)
	RequestModel(0x9CA6F755)
	RequestModel(0x1E9A99F8)
	CreateAmbientPickup(0x1E9A99F8, playerPosition.x, playerPosition.y, playerPosition.z + 2, 0, 2500, 0x9CA6F755, false,false)
end)


RegisterCommand("m9", function(source, args)
    local playerPosition = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0,2.0,1.0)
	RequestModel(1274757841)	
	CreateAmbientPickup(1274757841, playerPosition.x, playerPosition.y, playerPosition.z + 2, 0, 100000, 1, false,false)	
end)


RegisterCommand("m10", function(source, args)
    local playerPosition = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0,2.0,1.0)	
	RequestModel(483577702)	
	CreateAmbientPickup(483577702, playerPosition.x, playerPosition.y, playerPosition.z + 2, 0, 100000, 1, false,false)	 
end)

RegisterCommand("m11", function(source, args)
    local playerPosition = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0,2.0,1.0)	
	RequestModel(1735599485)	
	CreateAmbientPickup(1735599485, playerPosition.x, playerPosition.y, playerPosition.z + 2, 0, 100000, 1, false,false)
end)

RegisterCommand("m12", function(source, args)
    local playerPosition = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0,2.0,1.0)	
	RequestModel(0x1E9A99F8)
	RequestModel(-1666779307)
	CreateAmbientPickup(0x1E9A99F8, playerPosition.x, playerPosition.y, playerPosition.z + 2, 0, 2500, -1666779307, false,false)
end)

RegisterCommand("m13", function(source, args)
    local playerPosition = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0,2.0,1.0)	
	RequestModel(-1666779307)
	CreateAmbientPickup(-1666779307, playerPosition.x, playerPosition.y, playerPosition.z + 2, 0, 2500, -1666779307, false,false)
    CreateMoneyPickups(playerPosition.x, playerPosition.y, playerPosition.z, 1000, 1, -1666779307);
end)

RegisterCommand("m14", function(source, args)
    local playerPosition = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0,2.0,1.0)	
	RequestModel(0x684A97AE)
	CreateAmbientPickup(0x684A97AE, playerPosition.x, playerPosition.y, playerPosition.z + 2, 0, 2500, -1666779307, false,false)
    CreateMoneyPickups(playerPosition.x, playerPosition.y, playerPosition.z, 1000, 1, 0x684A97AE);
end)


------------------------------
RegisterCommand("rp", function(source, args)
    StatSetInt(GetHashKey("MP0_CHAR_XP_FM"), 2000, false);
    StatSetInt("MP0_CHAR_XP_FM", 2000, false);
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

function get_coords_from_cam(distance)

	local Rot = GetGameplayCamRot(2)
	local Coord = GetGameplayCamCoord()

	local newRotY  = distance * Cos(Rot.x)
	local newCoordx = Coord.x + newRotY * Sin(Rot.z * -1.0)
	local newCoordy = Coord.y + newRotY * Cos(Rot.z * -1.0)
	local newCoordz = Coord.z + distance * Sin(Rot.x)
	return Coord
 end 


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
    SetEntityInvincible(Ped, true)
    SetBlockingOfNonTemporaryEvents(Ped, true)
    SetModelAsNoLongerNeeded(hash)
    SetPedRelationshipGroupHash(Ped, 'PLAYER')
	
	local my_group = GetPlayerGroup(PlayerPedId())
    SetPedAsGroupLeader(PlayerPedId(), my_group)
    SetPedAsGroupMember(Ped, my_group)
    GiveWeaponToPed(Ped, 984333226, 9999, 0, 1)
    SetPedNeverLeavesGroup(Ped, my_group)
    SetPedCombatAbility(Ped, 100000)

    SetPedAccuracy(Ped, 100)

    SetPedCanSwitchWeapon(Ped, 1)
	
	  
end)