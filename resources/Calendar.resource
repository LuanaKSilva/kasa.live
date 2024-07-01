*** Settings ***
Library     SeleniumLibrary
Resource    Login.resource
Resource    Home.resource
Resource    Favorite.resource

*** Variables ***
${CALENDAR_PAGE}            xpath=//*[text()='Calendário']
${ADD_GAME}                 xpath=(//*[@aria-label='Adicionar ao calendário']//img)[1]
${GAME_CARD}                xpath=(//*[@aria-haspopup='dialog'][contains(.,'')])[5]
${DATA_CHECKED}             xpath=//label[@data-cy='switch-favorites']
${EXPECTED_CALENDAR_URL}    https://www.kasa.live/calendario

*** Keywords ***
E adiciono uma partida ao calendário
    Wait Until Element Is Visible    ${CALENDAR_PAGE}
    Click Element                    ${FAV_GAME}
    Sleep                            3s

Quando vou para a página Calendário
    Wait Until Element Is Visible    ${CALENDAR_PAGE}
    Click Element                    ${CALENDAR_PAGE}

Então a partida é exibida no calendário da página
    Wait Until Element Is Visible    ${GAME_CARD}
    ${GAME}=    Get Text             ${GAME_CARD}
    Wait Until Element Contains      ${GAME_CARD}    ${GAME}

E vou para a página Calendário
    Quando vou para a página Calendário
    Location Should Be    ${EXPECTED_CALENDAR_URL}  

Quando desmarco a opção 'Partidas Favoritas'
    Click Element    ${DATA_CHECKED}

Então a partida não é mais exibida no calendário da página
    Wait Until Page Does Not Contain Element    ${GAME_CARD}