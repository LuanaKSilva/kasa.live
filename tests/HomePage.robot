*** Settings ***
Documentation    Essa suíte testa a Home Page do site Kasa.live
Resource         ../resources/Base.resource
Resource         ../resources/Login.resource
Resource         ../resources/Home.resource
Suite Setup      Generating data for the user
Test Setup       Start Page
Test Teardown    Close Page

*** Test Cases ***
Caso de Teste 01 - Criando uma conta e fazendo logout
    [Documentation]    Esse teste verifica a criação de uma nova conta no site Kasa.live
    ...                e faz logout no mesmo
    [Tags]             criando_conta    logout
    Dado que estou na página de login do kasa.live
    Quando preencher todos os campos
    E clicar no botão 'Criar conta'
    Então a conta é criada
    E o usuário faz o logout

Caso de Teste 02 - Fazendo login e excluindo a conta
    [Documentation]    Esse teste verifica o login e a exclusão de uma conta
    [Tags]             login    excluir_conta
    Dado que estou na home page do kasa.live
    Quando o usuário faz login na conta
    E o menu do usuário é aberto
    Então a conta é excluída

Caso de Teste 03 - Verificando se as opções do campo de pesquisa funcionam como o esperado (Time - Campeonato)
    [Documentation]    Esse teste verifica os campos de pesquisa
    [Tags]             campo_pesquisa
    Dado que estou logado na home page do kasa.live
    Quando faço uma pesquisa
    Então os dados devem ser exibidos na página