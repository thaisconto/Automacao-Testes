*** Settings ***
Resource  ../resources/serverest_testes_recursos.resource

*** Variables ***

*** Test Cases ***
Cenário com PUT: Atualizar os dados de um usuário
  Criar um novo usuário
  Cadastrar o novo usuário criado
  Consultar os dados do usuário
  Alterar perfil de acesso administrador de true para false
  Consultar os dados do usuário