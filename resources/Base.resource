*** Settings ***
Library     SeleniumLibrary

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