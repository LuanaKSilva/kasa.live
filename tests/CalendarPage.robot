*** Settings ***
Documentation    Essa suíte testa a página Calendário do site Kasa.live
Resource         ../resources/Base.resource
Resource         ../resources/Login.resource
Resource         ../resources/Home.resource
Resource         ../resources/BestMoments.resource
Resource         ../resources/Calendar.resource
Suite Setup      Generating data for the user
Test Setup       Start Page
Test Teardown    Close Page

*** Test Cases ***
Caso de Teste 01 - Exibir partida na página
    [Documentation]    Esse teste verifica se ao favoritar uma partida, a mesma é exibida na página Calendário
    [Tags]             calendario_page
    Dado que estou logado na home page do kasa.live
    E adiciono uma partida ao calendário
    Quando vou para a página Calendário
    Então a partida é exibida no calendário da página

Caso de Teste 02 - Desmarcando a opção 'Partidas Favoritas'
    [Documentation]    Esse teste verifica se ao desmarcar a opção 'Partidas Favoritas'
    ...                o calendário não exibe mais a partida favoritada
    [Tags]             partidas_favoritas    desmarcar_partida
    Dado que estou logado na home page do kasa.live
    E adiciono uma partida ao calendário
    E vou para a página Calendário
    Quando desmarco a opção 'Partidas Favoritas'
    Então a partida não é mais exibida no calendário da página
