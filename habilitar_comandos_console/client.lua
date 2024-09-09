 
RegisterCommand('ensure', function(source, args, rawCommand) 
    TriggerServerEvent('meuComando:ensure', args[1])
end, false)
RegisterCommand('stop', function(source, args, rawCommand) 
    TriggerServerEvent('meuComando:stop', args[1])
end, false)
RegisterCommand('start', function(source, args, rawCommand) 
    TriggerServerEvent('meuComando:start', args[1])
end, false)
 
----------------------------------------------------

RegisterNetEvent('meuComando:ensure')
RegisterNetEvent('meuComando:stop')
RegisterNetEvent('meuComando:start')

AddEventHandler('meuComando:ensure', function(nome) 
    print('Recurso '..nome..' reiniciado') 
end)

AddEventHandler('meuComando:stop', function(nome) 
    print('Recurso '..nome..' parado') 
end)

AddEventHandler('meuComando:start', function(nome) 
    print('Recurso '..nome..' iniciado') 
end)






