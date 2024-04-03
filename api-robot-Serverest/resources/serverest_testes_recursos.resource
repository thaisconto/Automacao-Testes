*** Settings ***
Documentation  O objetivo deste aquivo é armazenar os recursos para os testes 
Library  RequestsLibrary
Library  String
Library  Collections

*** Keywords ***
Criar sessão
  ${headers}  Create Dictionary  accept=application/json  Content-Type=application/json
  Create Session    alias=APIServerRest    url=https://serverest.dev  headers=${headers}

Criar um novo usuário
  ${palavra_randomica}  Generate Random String  length=8  chars=[LETTERS]
  ${palavra_randomica}  Convert To Lower Case   ${palavra_randomica}
  Set Test Variable     ${EMAIL_TEST}           ${palavra_randomica}@qacoders.com.br
  Log                   ${EMAIL_TEST}
  
Cadastrar o novo usuário criado
  ${body}  Create Dictionary  nome=Fulano da Silva  email=${EMAIL_TEST}  password=teste  administrador=true
  Log  ${body}
  Criar sessão
  ${resposta}  POST On Session  alias=APIServerRest  url=/usuarios  json=${body}
  Log  ${resposta.json()}
  Set Task Variable    ${ID_USUARIO}  ${resposta.json()["_id"]}
  Set Test Variable    ${RESPOSTA}    ${resposta.json()}

Conferir se este novo usuário foi cadastrado corretamente
  Log  ${RESPOSTA}
  Dictionary Should Contain Item    ${RESPOSTA}  message  Cadastro realizado com sucesso
  Dictionary Should Contain Key     ${RESPOSTA}  _id

Consultar os dados do usuário
  ${resposta_consulta}  GET On Session  alias=APIServerRest  url=/usuarios/${ID_USUARIO}  expected_status=200
  Set Test Variable    ${RESPOSTA_CONSULTA}                  ${resposta_consulta.json()}

Conferir os dados retornados do novo usuário
  Log  ${RESPOSTA_CONSULTA}
  Dictionary Should Contain Item    ${RESPOSTA_CONSULTA}    nome           Fulano da Silva
  Dictionary Should Contain Item    ${RESPOSTA_CONSULTA}    email          ${EMAIL_TEST}
  Dictionary Should Contain Item    ${RESPOSTA_CONSULTA}    password       teste
  Dictionary Should Contain Item    ${RESPOSTA_CONSULTA}    administrador  true
  Dictionary Should Contain Item    ${RESPOSTA_CONSULTA}    _id           ${ID_USUARIO}

Alterar perfil de acesso administrador de true para false
  ${alterar_perfil_usuario}  PUT On Session  alias=APIServerRest  url=/usuarios/${ID_USUARIO}  expected_status=200  data={"nome":"Fulano da Silva", "email":"${EMAIL_TEST}", "password":"teste", "administrador":"false"}