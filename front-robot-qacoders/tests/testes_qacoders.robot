*** Settings ***
Resource  ../resources/testes_resources_qacoders.resource
Test Setup  Abrir navegador
Test Teardown  Fechar navegador

*** Test Cases ***
Cenário de teste: Login com sucesso
  Acessar página de Login 
  Inserir e-mail
  Inserir senha
  Clicar em entrar
#  Validar login - URL/home

Cenário de teste: Login com email vazio
  Acessar página de Login 
  Inserir e-mail vazio
  Inserir senha
  Clicar em entrar
  Validar mensagem: O email é obrigatório

Cenário de teste: Login com senha vazia
  Acessar página de Login 
  Inserir e-mail
  Inserir senha vazia
  Clicar em entrar
  Validar mensagem: A senha é obrigatória

Cenário de teste: Login com email iválido
  Acessar página de Login 
  Inserir e-mail iválido
  Inserir senha
  Clicar em entrar
  Validar mensagem: E