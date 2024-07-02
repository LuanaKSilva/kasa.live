*** Settings ***
Library     SeleniumLibrary
Resource    Login.resource
Resource    Home.resource
Resource    Favorite.resource

*** Variables ***
${BEST_MOMENTS_PAGE}    xpath=//*[text()='Melhores momentos']
${TITLE}           xpath=//*[contains(text(),'Melhores momentos das Partidas Finalizadas')]
${ICON}                 xpath=(//*[contains(@class, 'chakra-icon')])[3]
${CHECKBOX}             xpath=(//*[contains(@class, 'chakra-checkbox')])[1]
${VIDEO_CARD}           xpath=//*[@class='chakra-text css-1xfi7k7'][contains(.,'Real Madrid')]

*** Keywords ***
E vou para a página Melhores Momentos
    Wait Until Element Is Visible       ${FAVORITE_PAGE}
    Click Element                       ${BEST_MOMENTS_PAGE}
    Wait Until Page Contains Element    ${TITLE}

Quando filtro um time
    Click Element    ${ICON}
    Input Text       ${SEARCH_BAR}    Real Madrid
    Sleep            3s
    Click Element    ${CHECKBOX}

Então os vídeos do time é exibido na página
    Wait Until Page Contains Element    ${VIDEO_CARD}

E filtro um time
    Quando filtro um time

Quando desfiltrar um time
    Click Element    ${CHECKBOX}

Então o mesmo não é mais exibido na página
    Wait Until Page Does Not Contain Element    ${VIDEO_CARD}