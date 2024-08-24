RegisterNetEvent('meuComando:executar')
AddEventHandler('meuComando:executar', function(nome, sobrenome)
    -- Código que você quer executar quando o comando é chamado
    --print('O comando "oi" foi executado no cliente!')
    --print('Nome recebido:', nome)
    --print('Sobrenome recebido:', sobrenome)

	StopResource("coordenadasUI")
    -- Enviar uma resposta para o cliente confirmando a execução e enviando de volta as informações
    TriggerClientEvent('meuComando:confirmacao', source, nome, sobrenome)
end)





RegisterNetEvent('meuComando:ensure')
AddEventHandler('meuComando:ensure', function(nome) 
	StopResource(nome)
	StartResource(nome) 
    TriggerClientEvent('meuComando:ensure', source, nome)
end)

RegisterNetEvent('meuComando:start')
AddEventHandler('meuComando:start', function(nome) 
	StartResource(nome) 
    TriggerClientEvent('meuComando:start', source, nome)
end)



RegisterNetEvent('meuComando:stop')
AddEventHandler('meuComando:stop', function(nome) 
	StopResource(nome) 
    TriggerClientEvent('meuComando:stop', source, nome)
end)














function arrayParaStringSemDelimitador(array)
    local resultado = ""
    for _, valor in ipairs(array) do
        resultado = resultado ..' '.. valor
    end
    return resultado
end

 


RegisterCommand("criar", function(source, args)
if not io then
    print("A biblioteca 'io' não está disponível neste ambiente.")
else 
    local arquivo = io.open("meuarquivo.txt", "w")
    if arquivo then
        arquivo:write(arrayParaStringSemDelimitador(args))
        arquivo:close()
        print("Arquivo criado e escrito com sucesso.SV")
    else
        print("Não foi possível abrir o arquivo. SV")
    end
end
end)

 
 


RegisterCommand("ler", function(source, args)
local arquivo = io.open("meuarquivo.txt", "r")
 
if arquivo then 
    local conteudo = arquivo:read("*a") 
    print(conteudo) 
    arquivo:close()
else
    print("Não foi possível abrir o arquivo.")
end
end)
 