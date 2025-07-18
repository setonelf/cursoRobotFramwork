*** Settings ***
Library    RequestsLibrary
Library    String
Library    ../../.venv/lib/python3.13/site-packages/SeleniumLibrary/__init__.py
Library    ../../.venv/lib/python3.13/site-packages/robot/libraries/Collections.py

*** Keywords ***

Criar um usuario novo
    ${palavra_aleatoria}    Generate Random String    length=4    chars=[LETTERS]
    ${palavra_aleatoria}    Convert To Lower Case    ${palavra_aleatoria}
    Set Test Variable    ${EMAIL_TESTE}    ${palavra_aleatoria}@emailtest.com
    Log To Console    ${EMAIL_TESTE}

Cadastrar o usuario criado na ServeRest
    Log To Console    Iniciando cadastro do Usuario
    [Arguments]    ${email}    ${status_code_desejado}
    ${body}    Create Dictionary    
    ...    nome=Fulano da Silva    
    ...    email=${EMAIL_TESTE}    
    ...    password=1234    
    ...    administrador=true
    
    Criar Sessao na ServeRest

    Log To Console    Iniciando Post

    #${reposta2}    POST    
    
    ${resposta}    POST On Session    
    ...    alias=ServeRest
    ...    url=/usuarios
    ...    json=${body}
    ...    expected_status=${status_code_desejado}
    
    IF    ${resposta.status_code} ==201
        Set Test Variable    ${ID_USUARIO}    ${resposta.json()["_id"]}
    END

    Set Test Variable    ${RESPOSTA_CRIACAO_USUARIO}    ${resposta.json()}

Criar Sessao na ServeRest
    ${headers}    Create Dictionary
    ...    accept=application/json
    ...    Content-Type=application/json
    Create Session    alias=ServeRest    url=https://serverest.dev    headers=${headers}
    Log To Console    Sessao criada

Conferir se o usuario foi cadastrado corretamente
    Log To Console    ${RESPOSTA_CRIACAO_USUARIO}
    Dictionary Should Contain Item    ${RESPOSTA_CRIACAO_USUARIO}    message    Cadastro realizado com sucesso
    Dictionary Should Contain Key    ${RESPOSTA_CRIACAO_USUARIO}    _id
Vou repetir o cadastro do usuário
    Log To Console    Repetindo a criação do usuário
    Cadastrar o usuario criado na ServeRest    email=${EMAIL_TESTE}    status_code_desejado=400
Vou verificar se a API não permitiu o cadastro repetido
    Log To Console    Verificando se a API recusa a criacao do usuario com o mesmo email
    Dictionary Should Contain Item    ${RESPOSTA_CRIACAO_USUARIO}    message    Este email já está sendo usado
Consultar os dados do novo usuário
    ${resposta_consulta}    GET On Session    ServeRest    url=/usuarios/${ID_USUARIO}    expected_status=200
    Set Test Variable    ${RESP_CONSULTA}    ${resposta_consulta.json()}
Conferir os dados retornados
    Log To Console    Conferindo os dados da Resposta
    Log To Console    ${RESP_CONSULTA}
    Dictionary Should Contain Item    ${RESP_CONSULTA}    nome    Fulano da Silva
    Dictionary Should Contain Item    ${RESP_CONSULTA}    email    ${EMAIL_TESTE}
    Dictionary Should Contain Item    ${RESP_CONSULTA}    password    1234
    Dictionary Should Contain Item    ${RESP_CONSULTA}    administrador    true
    Dictionary Should Contain Item    ${RESP_CONSULTA}    _id    ${ID_USUARIO}
Realizar Login com o usuário
    Log To Console    Realizando Login do Usuário
    ${body}    Create Dictionary       
    ...    email=${EMAIL_TESTE}    
    ...    password=1234

    ${reposta_login}    POST On Session
    ...    alias=ServeRest
    ...    url=/login
    ...    json=${body}
    Set Test Variable    ${DADOS_LOGIN}    ${reposta_login.json()}
Conferir se o Login ocorreu com sucesso
    Log To Console    Verificando se o usuario foi logado com sucesso
    Dictionary Should Contain Item    ${DADOS_LOGIN}    message    Login realizado com sucesso
    Dictionary Should Contain Key    ${DADOS_LOGIN}    authorization