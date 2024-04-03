*** Settings ***
Resource  ../resources/serverest_testes_recursos.resource

*** Variables ***

*** Test Cases ***
Cenário com POST: Cadastrar um novo usuário com sucesso
  Criar um novo usuário
  Cadastrar o novo usuário criado
  Conferir se este novo usuário foi cadastrado corretamente