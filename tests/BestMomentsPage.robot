*** Settings ***
Documentation    Essa suíte testa a página Melhores Momentos do site Kasa.live
Resource         ../resources/Base.resource
Resource         ../resources/Login.resource
Resource         ../resources/Home.resource
Resource         ../resources/BestMoments.resource
Suite Setup      Generating data for the user
Test Setup       Start Page
Test Teardown    Close Page

*** Test Cases ***
Caso de Teste 01 - Filtrar time
    [Documentation]    Esse teste filtra um time e verifica se os vídeos do mesmo é exibido na página
    [Tags]             filtrar_videos    melhores_momentos
    Dado que estou logado na home page do kasa.live
    E vou para a página Melhores Momentos
    Quando filtro um time
    Então os vídeos do time é exibido na página

Caso de Teste 02 - Não filtrar time
    [Documentation]    Esse teste verifica se o usuário desmarcar o filtro do time
    ...                os vídos do time não é mais exibidos na página
    [Tags]             desfriltrar_videos
    Dado que estou logado na home page do kasa.live
    E vou para a página Melhores Momentos
    E filtro um time
    Quando desfiltrar um time
    Então o mesmo não é mais exibido na página