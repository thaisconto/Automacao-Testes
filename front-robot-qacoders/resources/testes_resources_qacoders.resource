*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}                    https://automacao.qacoders-academy.com.br/login             
${emailInput}             //input[contains(@type,'text')]
${senhaInput}             //input[contains(@type,'password')]
${entrarButton}           //button[@class='MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedOrange MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-root MuiButton-contained MuiButton-containedOrange MuiButton-sizeMedium MuiButton-containedSizeMedium css-ojf4v2'][contains(.,'Entrar')]
${URLhome}                https://automacao.qacoders-academy.com.br/home
${msgEmailObrigatorio}    //p[@class='css-18xtib3'][contains(.,'O email é obrigatório')]
${msgSenhaObrigatorio}    //p[@class='css-18xtib3'][contains(.,'A senha é obrigatória')]
${msgE}                   //div[@class='MuiFormControl-root MuiTextField-root css-i44wyl'][contains(.,'Email')]

*** Keywords ***
Abrir navegador
  Open Browser  browser=firefox
  Maximize Browser Window

Fechar navegador
  Close Browser

Acessar página de Login
  Go To    url=${URL}
  Sleep    2s

Inserir e-mail
  Wait Until Element Is Visible    locator=${emailInput}
  Input Text                       locator=${emailInput}    text=sysadmin@qacoders.com
    
Inserir senha
  Wait Until Element Is Visible    locator=${senhaInput}
  Input Password                   locator=${senhaInput}    password=1234@Test
  
Clicar em entrar
  Wait Until Element Is Visible    locator=${entrarButton}
  Click Button                     locator=${entrarButton}

Validar login - URL/home
   Sleep    2s

Inserir e-mail vazio
  Wait Until Element Is Visible    locator=${emailInput}
  Input Text                       locator=${emailInput}    text=

Validar mensagem: O email é obrigatório
  Wait Until Element Is Visible    locator=${msgEmailObrigatorio}
  ${message_text}=  Get text       locator=${msgEmailObrigatorio}
  Should Be Equal  ${message_text}  O email é obrigatório

Inserir senha vazia
  Wait Until Element Is Visible    locator=${senhaInput}
  Input Text                       locator=${senhaInput}    text=

Validar mensagem: A senha é obrigatória
  Wait Until Element Is Visible    locator=${msgSenhaObrigatorio}
  ${message_text}=  Get text       locator=${msgSenhaObrigatorio}
  Should Be Equal  ${message_text}  A senha é obrigatória

Inserir e-mail iválido
  Wait Until Element Is Visible    locator=${emailInput}
  Input Text                       locator=${emailInput}    text=teste@teste.com

Validar mensagem: E
  Wait Until Element Is Visible    locator=${msgE}
  ${message_text}=  Get text       locator=${msgE}
  Should Be Equal  ${message_text}  E