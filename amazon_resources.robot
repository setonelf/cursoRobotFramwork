*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://www.amazon.com.br
${MENU_ELETRONICO}    (//a[contains(., 'Eletrônicos')])[1]
${PAGINA_ELETRONICO_TECNOLOGIA}    (//span[contains(.,"Eletrônicos e Tecnologia")])[1]
${CATEGORIA_COMPUTADORES_INFORMATICA}    (//span[contains(.,"Computadores e Informática")])[1]
${CAMPO_DE_BUSCA}    //*[@id="twotabsearchtextbox"]
${BOTAO_PESQUISAR}    //*[@id="nav-search-submit-button"]
${RESULTADO_PESQUISA}    (//div/h2/span[contains(.,"Xbox Series S")])
${PRODUTO_XBOX}    //h2/span[contains(.,"Console Xbox Series S")]
${BOTAO_ADICIONAR_AO_CARRINHO}    //*[@id="add-to-cart-button"]
${BOTAO_CARRINHO}    //*[@id="nav-cart"]
${CARRINHO_XBOX}    (//span/span[contains(.,"Console Xbox Series S")])[2]
${EXCLUIR}                 //input[contains(@value,'Excluir')]
${REMOVIDO_DO_CARRINHO}    //h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]


*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome    options=add_experimental_option("detach", True)
    Maximize Browser Window
Fechar o navegador
    Capture Page Screenshot
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
    Wait Until Element Is Visible    locator=${CATEGORIA_COMPUTADORES_INFORMATICA}
Digitar o nome de produto "${BUSCA}" no campo de pesquisa
    Input Text    locator=${CAMPO_DE_BUSCA}    text=${BUSCA}
Clicar no botão de pesquisa
    Click Element    locator=${BOTAO_PESQUISAR}
Verificar o resultado da pesquisa se está listando o produto especificado
    Wait Until Element Is Visible    locator=${RESULTADO_PESQUISA}
Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Page Contains    text=${PRODUTO}
    Wait Until Element Is Visible    locator=${PRODUTO_XBOX}
Adicionar o produto "Console Xbox Series S" no carrinho
    Click Element    locator=${PRODUTO_XBOX}
    Click Element    locator=${BOTAO_ADICIONAR_AO_CARRINHO}
Verificar se o produto "${PRODUTO}" foi adicionado com sucesso
    Wait Until Element Is Visible    locator=${BOTAO_CARRINHO}
    Click Element    locator=${BOTAO_CARRINHO}
    Wait Until Page Contains    text=${PRODUTO}
    Wait Until Element Is Visible    locator=//span[@class='a-truncate-cut'][contains(.,'${PRODUTO}')]
Remover o produto "Console Xbox Series S" do carrinho
    Click Element   locator=${EXCLUIR}

Verificar se o carrinho fica vazio
    Wait Until Element Is Visible    locator=${REMOVIDO_DO_CARRINHO}
    
#BDD STEPS
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"
Então o título da página deve ficar "${TITULO}"
    Verificar se o título da página fica "${TITULO}"
E o texto "${FRASE}" deve ser exibido na página
    Verificar se aparece a frase "${FRASE}"
E a categoria "${FRASE}" deve ser exibida na página
    Verificar se aparece a categoria "${FRASE}"
Quando pesquisar pelo produto "${BUSCA}"
    Digitar o nome de produto "${BUSCA}" no campo de pesquisa
    Clicar no botão de pesquisa
E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produto especificado
Quando adicionar o produto "Console Xbox Series S" no carrinho
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho

Então o produto "Console Xbox Series S" deve ser mostrado no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

E existe o produto "Console Xbox Series S" no carrinho
    Quando adicionar o produto "Console Xbox Series S" no carrinho
    Então o produto "Console Xbox Series S" deve ser mostrado no carrinho

Quando remover o produto "Console Xbox Series S" do carrinho
    Remover o produto "Console Xbox Series S" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio