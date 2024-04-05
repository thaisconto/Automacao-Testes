*** Settings ***
Resource  ../resources/testes_resources_serverest.resource
Test Setup  Abrir navegador
Test Teardown  Fechar navegador

*** Test Cases ***
Cenário de teste: Cadastro de usuário administrador
  Passo 1 - Acessar página de Login 
  Passo 2 - Clicar em cadastre-se
  Passo 3 - Inserir nome
  Passp 4 - Inseir e-mail
  Passo 5 - Inserir senha
  Passo 6 - Escolher opção de usuário como adm
  Passo 7 - Clicar em cadastrar 
