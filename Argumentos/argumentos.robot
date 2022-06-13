*** Test Cases ***
Relembrando argumentos posicionais x nomeados
    Teste de Argumentos Básico    1    2    3    4
    Teste de Argumentos Básico    arg4=1    arg3=2    arg2=3    arg1=4

Teste de Argumentos Opcionais
    Passando argumentos opcionais como paramêtro    nome=Elielson    ultimo_nome=Silva
    Passando argumentos opcionais como paramêtro    nome=Elielson    nome_do_meio=Francisco    ultimo_nome=Silva

Criando lista e dicionário via paramêtro
    [Documentation]    No Python é conhecido como "'kwargs"
    Teste Criando um dicionário    cwd=/home/user    shell=True    env=False
    Teste criando uma lista    elielson    francisco    silva
    Teste criando os dois        elielson    francisco    silva    shell=True    env=False        


*** Keywords ***

Teste de Argumentos Básico
    [Arguments]    ${arg1}    ${arg2}    ${arg3}    ${arg4}
    Log    ${arg1} - ${arg2} - ${arg3} - ${arg4}

Passando argumentos opcionais como paramêtro
    ### Paramêtro OPCIONAIS ficam por último
    ### o Robot é case-sensitive, se o paramêtro está minúsculo, lá na keyword tem que estar tambem!
    [Arguments]    ${nome}    ${ultimo_nome}    ${nome_do_meio}=silva
    Log    Nome completo: ${nome} ${nome_do_meio} ${ultimo_nome}
Teste Criando um dicionário
    ### REGRA: Somente um dicionário pode ser criado
    [Arguments]    &{meu_dicionario}
    Log    ${meu_dicionario}
Teste criando uma lista
    ### REGRA: Somente uma lista pode ser criada
    [Arguments]    @{minha_lista}
    Log    ${minha_lista}
Teste criando os dois  
    ### REGRA: a lista vem primeiro
    [Arguments]    @{minha_lista}    &{meu_dicionario}
    Log    ${minha_lista}\n${meu_dicionario}