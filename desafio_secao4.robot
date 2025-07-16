*** Settings ***
Library    .venv/lib/python3.13/site-packages/robot/libraries/String.py

*** Test Cases ***
Caso de Teste 1
    Nome e sobrenome

*** Keywords ***
Nome e sobrenome
    Resposta    Thiago    Freitas

Resposta
    [Arguments]    ${NOME}    ${SOBRENOME}
    ${RESPOSTA}    Gerador aleatorio
    Log To Console    ${NOME} ${SOBRENOME} ${RESPOSTA}@testrobot.com

Gerador aleatorio
    ${name}=    Generate Random String    10
    [Return]    ${name}