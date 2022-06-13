*** Settings ***
Suite Teardown    Controlando o teardown da suite
Test Teardown     Controlando o teardown do teste   

*** Test Cases ***
#### SUCESSO ###
Exemplo 01: Teste lidando com Suite e Test Teardowns
    Essa keyword fará o teste passar, não executando as keywords abaixo!
    Essa Keyword vai passar sozinha!
    Essa keyword fará o teste falhar, não executando as keywords abaixo!

Exemplo 02: Teste lidando com Suite e Test Teardowns
    Essa keyword vai passar sozinha!
    Essa keyword vai passar sozinha!
    Essa aqui também vai passar com uma condição e vai parar de executar as keywords abaixo!
    Essa keyword vai passar sozinha!
    Essa keyword vai passar sozinha!

### FALHAS ###
Exemplo 03: Teste lidando com Suite e Test Teardowns
    Essa Keyword vai passar sozinha!
    Essa keyword fará o teste falhar, não executando as keywords abaixo!
    Essa keyword vai passar sozinha!
    Essa keyword vai falhar sozinha!

Exemplo 04: Teste lidando com Suite e Test Teardowns    
    Essa keyword vai falhar sozinha! 

    
       
*** Keyword***
### SUITE TEARDOWNS
Controlando o teardown da suite
    Run Keyword If All Tests Passed    Log    Todos os testes passaram, posso enviar um e-mail, por exemplo!

### TEST TEARDOWNS
Controlando o teardown do teste
    Run Keyword If Test Failed    Log    Alguns testes falharam, posso enviar um e-mail, por exemplo!

### Controlando o STATUS
Essa keyword fará o teste passar, não executando as keywords abaixo!    
    Pass Execution    message=Estou forçando meu teste a passar com sucesso!

Essa keyword fará o teste falhar, não executando as keywords abaixo!
    Fail                message= Estou forçando meu teste a falhar!
Essa aqui também vai passar com uma condição e vai parar de executar as keywords abaixo!
    ${STATUS}    Run Keyword And Return Status  Should Be True    "May" == "May"
    Log    ${STATUS}
    Pass Execution If    ${STATUS}    message=May é igual a May, então passou!!

Essa Keyword vai passar sozinha!
    Should Be True    "May" == "May"

Essa keyword vai falhar sozinha!   
    Should Be True    "May" == "João" 