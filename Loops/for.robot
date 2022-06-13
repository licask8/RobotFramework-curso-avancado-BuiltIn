*** Settings ***
Library    String
*** Test Cases ***

Teste do novo formato do FOR
    Novo formato do FOR em listas


 ## Teste de FOR aninhado #####
Teste de FOR aninhado
    Criar cadastro de produtos (FOR aninhado)

## Teste FOR usando varias variaveis
Teste FOR usando várias váriaveis
    Criar dicionário de traduções    


## Teste FOR usando numeração
Teste FOR com numeração
    FOR com numeração

## Teste mais opções IN RANGE ###
Teste mais opções IN RANGE
    Tradicional
    Apenas quantidade de laços informada (limite superior)
    Aritmético
    Intervalos específicos





*** Keywords ***

### NOVO FORMATO
Novo formato do FOR em listas
    FOR    ${animal}    IN    gato    cachorro    cavalo
        Log    O animal desse laço é:${animal}!
        Log    O próximo animal da lista...
    END    

### FOR ANINHADO ###
Criar cadastro de produtos (FOR aninhado)
    FOR    ${produto}    IN    baby look    camiseta    blusa
            Imprime tamanhos para o produto    ${produto}
    END  
Imprime tamanhos para o produto
    [Arguments]    ${produto}
    FOR    ${tamanho}    IN    P    M    G    
        Log    Produto: ${produto} - Tam: ${tamanho}   
    END

### FOR USANDO VARIAS VARIAVEIS ###
Criar dicionário de traduções  
    FOR    ${index}    ${english}    ${finnish}    ${portugues}    IN    
    ...    1            cat            kissa        gato 
    ...    2            dog            koira        cachorro
    ...    3            horse          hevonen      cavalo
        Log    Animal ${index}:\nEm inglês: ${english}\nEm finlandês: ${finnish}\nEm português: ${portugues}   
    END
 ### FOR USANDO ENUMERAÇÃO ###       
 FOR com numeração 
     FOR    ${index}    ${item}    IN ENUMERATE    P    M    G    GG    XG    XXG
         Log    Item da lista: ${item} - Posição do item na lista: ${index}
         
     END
###  TESTE FOR IN RANGE ###
Tradicional
    [Documentation]    Percorre de 1 até 10
    FOR    ${index}    IN RANGE    1    11    
        Log    ${index}
    END    
Apenas quantidade de laços informada (limite superior)
    [Documentation]    Percorre de 0 até 9
    FOR    ${index}    IN RANGE    10  
        Log    ${index} 
    END
Aritmético
    [Documentation]    Percorre de 0 até 5
    ${var}    Set Variable    ${5}
    FOR    ${index}    IN RANGE    ${var} + 1
        Log    ${index}      
    END
Intervalos específicos
    [Documentation]    Percorre de 0 até 30, pulando de 5 em 5
    FOR    ${index}    IN RANGE    0    31    5
        Log    ${index}
        
    END