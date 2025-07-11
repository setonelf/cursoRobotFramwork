*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://www.amazon.com.br
${MENU_ELETRONICO}    (//a[contains(., 'Eletrônicos')])[1]


*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window
Fechar o navegador
    Close Browser
Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICO}
Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICO}
Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Page Contains    text=Eletrônicos e Tecnologia
Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
    Title Should Be    title=Eletrônicos e Tecnologia | Amazon.com.br
    
