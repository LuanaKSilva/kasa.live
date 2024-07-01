*** Settings ***
Documentation    Essa suíte testa a página Favoritos do site Kasa.live
Resource         ../resources/Base.resource
Resource         ../resources/Login.resource
Resource         ../resources/Home.resource
Resource         ../resources/Favorite.resource
Suite Setup      Generating data for the user
Test Setup       Start Page
Test Teardown    Close Page

*** Test Cases ***
Caso de Teste 01 - Favoritando uma partida
    [Documentation]    Esse teste favorita um jogo e verifica se o mesmo é exibido na página 'Favoritos'
    [Tags]             favoritar_jogo
    Dado que estou logado na home page do kasa.live
    Quando eu favorito um jogo
    E vou para a página Favoritos
    Então esse jogo deve ser exibido na página

Caso de Teste 02 - Desfavoritando uma partida
    [Documentation]    Esse teste desfavorita um jogo e verifica se o mesmo não é exibido na página 'Favoritos'
    [Tags]             desfavoritar_jogo
    Dado que estou logado na home page do kasa.live
    Quando vou para a página Favoritos
    E desfavorito um jogo
    Então esse jogo não deve ser exibido na página

Caso de Teste 03 - Favoritando um time
    [Documentation]    Esse teste favorita um time e verifica se as partidas do time são exibidas na página
    [Tags]             favoritar_time
    Dado que estou na página Favoritos do kasa.live
    Quando favorito um time
    Então vários jogos do time é exibido na página
