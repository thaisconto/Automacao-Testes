*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}                     https://front.serverest.dev/login
${cadastreseLink}         //a[@data-testid='cadastrar'][contains(.,'Cadastre-se')]
${nomeInput}              //input[contains(@name,'nome')]
${emailInput}             //input[contains(@name,'email')]
${senhaInput}             //input[contains(@name,'password')]
${administradorCheckbox}  //input[contains(@name,'administrador')]
${cadastrarButton}        //button[@data-testid='cadastrar'][contains(.,'Cadastrar')]

*** Keywords ***
Abrir navegador
  Open Browser  browser=firefox
  Maximize Browser Window

Fechar navegador
  Close Browser

Passo 1 - Acessar página de Login
  Go To    url=${URL}
  Sleep    2s

Passo 2 - Clicar em cadastre-se
  Wait Until Element Is Visible    locator=${cadastreseLink}
  Click Element                    locator=${cadastreseLink}

Passo 3 - Inserir nome
  Wait Until Element Is Visible    locator=${nomeInput}
  Input Text                       locator=${nomeInput}    text=Nome Teste

Passp 4 - Inseir e-mail
  Wait Until Element Is Visible    locator=${emailInput}
  Input Text                       locator=${emailInput}    text=teste.teste@teste.com
    
Passo 5 - Inserir senha
  Wait Until Element Is Visible    locator=${senhaInput}
  Input Password                   locator=${senhaInput}    password=Teste1234
  
Passo 6 - Escolher opção de usuário como adm
  Wait Until Element Is Visible    locator=${administradorCheckbox}
  Select Checkbox                  locator=${administradorCheckbox}
  
Passo 7 - Clicar em cadastrar
  Wait Until Element Is Visible    locator=${cadastrarButton}
  Click Button                     locator=${cadastrarButton}
  Sleep  2s
  