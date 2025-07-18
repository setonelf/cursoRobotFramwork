*** Settings ***
Resource  ../resources/api_testing_usuarios.resource

*** Variables *** 

*** Test Cases ***
Cenário 01: Cadastrar um novo usuário com sucesso na ServeRest
    Criar um usuario novo
    Cadastrar o usuario criado na ServeRest    email=${EMAIL_TESTE}    status_code_desejado=201
    Conferir se o usuario foi cadastrado corretamente

Cenário 2: Cadastrar um usuário já existente
    Criar um usuario novo
    Cadastrar o usuario criado na ServeRest    email=${EMAIL_TESTE}    status_code_desejado=201
    Vou repetir o cadastro do usuário
    Vou verificar se a API não permitiu o cadastro repetido
Cenário 3: Consultar os dados de um novo usuário
    Criar um usuario novo
    Cadastrar o usuario criado na ServeRest    email=${EMAIL_TESTE}    status_code_desejado=201
    Consultar os dados do novo usuário
    Conferir os dados retornados
Cenário 04: Logar com o novo usuário criado
    Criar um usuario novo
    Cadastrar o usuario criado na ServeRest    email=${EMAIL_TESTE}    status_code_desejado=201
    Realizar Login com o usuário
    Conferir se o Login ocorreu com sucesso