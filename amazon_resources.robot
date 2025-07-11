*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://www.amazon.com.br
${MENU_ELETRONICO}    (//a[contains(., 'Eletrônicos')])[1]
${PAGINA_ELETRONICO_TECNOLOGIA}    (//span[contains(.,"Eletrônicos e Tecnologia")])[1]
${CATEGORIA_COMPUTADORES_ELETRONICA}    (//span[contains(.,"Computadores e Informática")])[1]
${CAMPO_DE_BUSCA}    //*[@id="twotabsearchtextbox"]
${BOTAO_PESQUISAR}    //*[@id="nav-search-submit-button"]
${RESULTADO_PESQUISA}    (//div/h2/span[contains(.,"Xbox Series S")])


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
Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    locator=${PAGINA_ELETRONICO_TECNOLOGIA}
Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}
Verificar se aparece a categoria "${FRASE}"
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    locator=${CATEGORIA_COMPUTADORES_ELETRONICA}
Digitar o nome de produto "${BUSCA}" no campo de pesquisa
    Input Text    locator=${CAMPO_DE_BUSCA}    text=${BUSCA}
Clicar no botão de pesquisa
    Click Element    locator=${BOTAO_PESQUISAR}
Verificar o resultado da pesquisa se está listando o produto especificado
    Wait Until Element Is Visible    locator=${RESULTADO_PESQUISA}
    
