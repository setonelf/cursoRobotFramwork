*** Variables ***

&{MESESDIAS}    Jan=31    Fev=28    Mar=31    Abr=30    Mai=31    Jun=30    Jul=31    Ago=31    Set=30    Out=31    Nov=30    Dez=31

*** Test Cases ***
Meses e quantidade de dias
    Log To Console   O mes de Janeiro possui ${MESESDIAS.Jan} dias
    Log To Console   O mes de Fevereiro possui ${MESESDIAS.Fev} dias
    Log To Console   O mes de Março possui ${MESESDIAS.Mar} dias
    Log To Console   O mes de Abril possui ${MESESDIAS.Abr} dias
    Log To Console   O mes de Maio possui ${MESESDIAS.Mai} dias
    Log To Console   O mes de Junho possui ${MESESDIAS.Jun} dias
    Log To Console   O mes de Julho possui ${MESESDIAS.Jul} dias
    Log To Console   O mes de Agosto possui ${MESESDIAS.Ago} dias
    Log To Console   O mes de Setembro possui ${MESESDIAS.Set} dias
    Log To Console   O mes de Outubro possui ${MESESDIAS.Out} dias
    Log To Console   O mes de Novembro possui ${MESESDIAS.Nov} dias
    Log To Console   O mes de Dezembro possui ${MESESDIAS.Dez} dias