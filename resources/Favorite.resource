*** Settings ***
Library     SeleniumLibrary
Resource    Login.resource
Resource    Home.resource

*** Variables ***
${FAVORITE_PAGE}     xpath=//*[text()='Favoritos']
${PAGE_TITLE}        xpath=//h2[contains(text(),'Partidas favoritas')]
${BTN_FAV_TEAM}      xpath=//*[contains(@data-cy,'favorite-team')]
${SEARCH_BAR}        xpath=//*[contains(@placeholder,'Pesquisar')]
${BTN_ADD}           xpath=(//*[@type='button'][contains(.,'Add')])[1]
${BTN_CONCLUIR}      xpath=//*[@type='button'][contains(.,'Concluir')]
${FAV_GAME}          xpath=(//*[@aria-label='Favoritar Partida']//img)[1]
${TEAM_GAME_CARD}    xpath=(//*[@class="css-5prxxc"]//p[contains(.,'')]/following::p)[1]
${NO_FAV}            xpath=(//*[@aria-label='Favoritar Partida']//img)[1]
${ANY_TEXT}          xpath=//*[contains(.,'')]
${CARD_XPATH}        xpath=(//*[@class='css-5prxxc'][contains(.,'Real Madrid')])

*** Keywords ***
Quando eu favorito um jogo
    Wait Until Page Contains Element    ${FAV_GAME} 
    Click Element                       ${FAV_GAME}

E vou para a página Favoritos
    Click Element                    ${FAVORITE_PAGE}
    Wait Until Element Is Visible    ${PAGE_TITLE}

Então esse jogo deve ser exibido na página
    ${GAME}    Get Text    ${TEAM_GAME_CARD}
    Log    ${GAME}
    Wait Until Element Is Visible    xpath=(//p[@title='${GAME}'])[1]

Quando vou para a página Favoritos
    Quando eu favorito um jogo
    E vou para a página Favoritos
    Então esse jogo deve ser exibido na página

E desfavorito um jogo
    Click Element                               ${NO_FAV}

Então esse jogo não deve ser exibido na página
    Wait Until Page Does Not Contain Element    ${TEAM_GAME_CARD}
    Wait Until Element Contains    ${ANY_TEXT}    Sem resultados de busca para partidas ao vivo, seleção de melhores partidas, próximas partidas e partidas finalizadas.

Dado que estou na página Favoritos do kasa.live
    Dado que estou logado na home page do kasa.live
    Wait Until Element Is Visible    ${FAVORITE_PAGE}
    E vou para a página Favoritos

Quando favorito um time
    Click Button                      ${BTN_FAV_TEAM}
    Input Text                        ${SEARCH_BAR}    Real Madrid
    Sleep                             3s
    Click Button                      ${BTN_ADD}
    Click Button                      ${BTN_CONCLUIR}

Então vários jogos do time é exibido na página
    Wait Until Page Contains Element    ${CARD_XPATH}
