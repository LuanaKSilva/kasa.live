*** Settings ***
Library     SeleniumLibrary
Resource    Login.resource

*** Variables ***
${siteName}             https://www.kasa.live/
${siteNameExpected}     Kasa.Live - Encontre o Jogo

*** Keywords ***
Start Page
    Open Browser       ${siteName}    googlechrome
    Title Should Be    ${siteNameExpected}
    Maximize Browser Window
    
Close Page
    Capture Page Screenshot
    Close Browser

Exclude account
    Click Element                       ${AVATAR_PROFILE}
    Click Button                        ${BTN_DEL_ACCOUNT}
    Click Button                        ${DELETE_ACCOUNT}
    Wait Until Page Contains Element    ${ALERT}