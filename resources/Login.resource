*** Settings ***
Library     Collections
Library     String
Library     SeleniumLibrary
Resource    Home.resource
Resource    Favorite.resource

*** Variables ***
${NAME}                  None
${EMAIL}                 None
${PASSWORD}              None
${BTN_CREATE_ACCOUNT}    xpath=//*[contains(@data-cy,'login-createAccount')]

*** Keywords ***
Generating data for the user
    # Gerar um nome aleatório
    ${USER_NAME}    Generate Random String    length=8    chars=lowercase
    ${NAME}         Set Variable    ${USER_NAME}

    # Gerar um email aleatório usando o nome gerado
    ${USER_EMAIL}    Catenate        ${USER_NAME}@testqa.com
    ${EMAIL}         Set Variable    ${USER_EMAIL}
    
    # Gerar uma senha aleatória
    ${USER_PASSWORD}    Generate Random String    length=12    chars=ascii_letters+digits+punctuation
    ${PASSWORD}         Set Variable    ${USER_PASSWORD}

    # Tornar as variáveis globais
    Set Suite Variable    ${NAME}    ${NAME}
    Set Suite Variable    ${EMAIL}    ${EMAIL}
    Set Suite Variable    ${PASSWORD}    ${PASSWORD}

    Log    Gerado nome: ${NAME}
    Log    Gerado e-mail: ${EMAIL}
    Log    Gerado senha: ${PASSWORD}

Create account
    Click Button    ${BTN_CREATE_ACCOUNT}
    
    Input Text    id=name               ${NAME}
    Input Text    id=email              ${EMAIL}
    Input Text    id=password           ${PASSWORD}
    Input Text    id=confirmPassword    ${PASSWORD}

Login user
    Log    ${EMAIL}
    Log    ${PASSWORD}

    Input Text    id=email              ${EMAIL}
    Input Text    id=password           ${PASSWORD}

Delete account
    Click Button                        ${BTN_ENTER}
    Login user
    Click Button                        ${BTN_LOGIN}
    Wait Until Page Contains Element    ${FAVORITE_PAGE}
    Click Element                       ${AVATAR_PROFILE}
    Click Button                        ${BTN_DEL_ACCOUNT}
    Click Button                        ${DELETE_ACCOUNT}
    Wait Until Element Is Visible       ${CLOSE_ALERT}    5s
    Click Element                       ${CLOSE_ALERT}