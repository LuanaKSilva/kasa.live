*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    Base.resource
Resource    Login.resource
Resource    Favorite.resource

*** Variables ***
${BTN_ENTER}                    xpath=//*[contains(@data-cy,'btn-trigger-profile') and contains(text(), 'Entrar')]
${BTN_LOGIN}                    xpath=//*[@type='submit'][contains(.,'Entrar')]
${BTN_CREATE_ACCOUNT}           xpath=//*[contains(@data-cy,'login-createAccount')]
${BTN_SUBMIT_CREATE_ACCOUNT}    xpath=//*[@type='submit'][contains(.,'Criar conta')]
${ALERT}                        xpath=//*[@class='Toastify']/child::div
${CLOSE_ALERT}                  xpath=//*[contains(@class, 'Toastify__close-button')]                           
${AVATAR_PROFILE}               xpath=//div[contains(@data-cy,'btn-trigger-profile')][contains(.,'')]
${BTN_CLOSE}                    xpath=//*[@type='button'][contains(.,'Sair')]
${BTN_DEL_ACCOUNT}              xpath=//*[@type='button'][contains(.,'Excluir conta')]
${DELETE_ACCOUNT}               xpath=//*[@data-cy='alert-dialog-submit']
${TXT_SEARCH}                   xpath=(//*[contains(@class, 'chakra-input')])[1]
${OPTION}                       xpath=(//p[@class='chakra-text css-15fzge'][contains(.,'Real Madrid')])[1]
${TEAM}                         xpath=//*[text()='Real Madrid']

*** Keywords ***
Dado que estou na página de login do kasa.live
    Wait Until Page Contains Element    ${BTN_ENTER}
    Click Button                        ${BTN_ENTER}

Quando preencher todos os campos
    Create account

E clicar no botão 'Criar conta'
    Click Button                     ${BTN_SUBMIT_CREATE_ACCOUNT}   

Então a conta é criada
    Wait Until Element Is Visible    ${CLOSE_ALERT}    5s
    Click Element                    ${CLOSE_ALERT}
    Wait Until Element Is Visible    ${AVATAR_PROFILE}
    Click Element                    ${AVATAR_PROFILE} 

E o usuário faz o logout
    Click Button                     ${BTN_CLOSE}
    Wait Until Element Is Visible    ${BTN_ENTER}

Dado que estou na home page do kasa.live
    Dado que estou na página de login do kasa.live
    Quando preencher todos os campos
    E clicar no botão 'Criar conta'
    Então a conta é criada
    E o usuário faz o logout

Quando o usuário faz login na conta
    Click Button    ${BTN_ENTER}
    Login user
    Click Button    ${BTN_LOGIN}

E o menu do usuário é aberto
    Wait Until Page Contains Element    ${FAVORITE_PAGE}
    Click Element                       ${AVATAR_PROFILE}

Então a conta é excluída
    Click Button                        ${BTN_DEL_ACCOUNT}
    Click Button                        ${DELETE_ACCOUNT}
    Wait Until Page Contains Element    ${ALERT}

Dado que estou logado na home page do kasa.live
    Dado que estou na home page do kasa.live
    Quando o usuário faz login na conta
    Wait Until Element Is Visible    ${AVATAR_PROFILE}

Quando faço uma pesquisa
    Wait Until Page Contains Element    ${FAVORITE_PAGE}
    Click Element                       ${TXT_SEARCH}
    Input Text                          ${TXT_SEARCH}    Real Madrid
    Wait Until Element Is Visible       ${OPTION}
    Click Element                       ${OPTION}

Então os dados devem ser exibidos na página
    Wait Until Element Is Visible    ${TEAM}
    Exclude account