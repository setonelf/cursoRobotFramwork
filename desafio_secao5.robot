*** Variables ***

@{NUMEROS}    1    2    3    4    5    6    7    8    9    10

*** Keywords ***
Percorre Lista
    Log To Console    ${\n}
    FOR   ${INDICE}   ${VALORES}   IN ENUMERATE   @{NUMEROS}
        IF     ${VALORES} == 5
            Log To Console    Eu sou o numero 5
        ELSE IF     ${VALORES} == 10
            Log To Console    EU sou o numero 10
        ELSE
            Log To Console    Eu nao sou o numero 5 nem o numero 10
        END
    END

*** Test Cases ***

Verifica Valores
    Percorre Lista