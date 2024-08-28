







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
 