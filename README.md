# Desafio QA - Automatizando cenários de teste do site kasa.live com Robot Framework

Este repositório utiliza o Robot Framework para automatizar a execução de cenários de teste no site kasa.live.

## Pré-requisitos
Garanta que os seguintes sistemas estejam instalados em seu computador.
- [git](https://git-scm.com/)
- [Node.js](https://nodejs.org/en/) & npm
- [Google Chrome](https://www.google.com/intl/pt_br/chrome/)
- [Robot Framework](https://robotframework.org/)
- [ChromeDriver](https://googlechromelabs.github.io/chrome-for-testing/)

> **Obs. 1:** Ao instalar o Node.js o npm é instalado junto. 🎉
>
> **Obs. 2:** Deixei links para os instaladores na lista de requisitos acima, caso não os tenha instalados ainda.
>
> **Obs. 3:** Para verificar as versões do git, Node.js e npm instaladas em seu computador, execute o comando `git --version && node --version && npm --version` no seu terminal de linha de comando.
>
> **Obs. 4:** Instale a biblioteca Browser do robot framework `pip install robotframework-browser`
>
> **Obs. 5:** Para instalar o ChromeDriver: Role a tela para baixo. Procure pela versão do seu Chrome, por exemplo, se o seu Chrome atual for 117, procure tabela de URLs da versão 117. Procure a linha relativa ao "chromedriver" e ao Sistema Operacional da sua máquina. Pegue a URL e cole no navegador para fazer o download.

___

Legal, os pré-requisitos estão prontos. ☑️

## Executando os testes

Entre no diretório dos testes para executá-los.

1. Para executar todos os testes do diretório: `robot kasalive_testes.robot`
2. Para executar apenas um teste, adicione uma tag específica do mesmo: `robot -i nome-da-tag nome-do-arquivo.robot`
3. Para salvar todos os logs em um diretório específico: `robot -d resultados HomePage.robot`
