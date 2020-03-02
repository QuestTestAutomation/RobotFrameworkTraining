*** Setting ***
Resource    ../../Commons/Global Setup.robot

*** Variable ***
${search_frame}    id:searchFrame
${result_frame}    id:resultsFrame
${search_input}    //input[@name='lksrch']
${go_button}       //input[@title="Go!"]


*** Keyword ***
Lookup for '${value}'
    Select Window    NEW
    Wait Until Page Contains Element    ${search_frame}    
    sleep    1
    Select Frame    ${search_frame}
    Wait Until Page Contains Element    ${search_input}
    Input Text    ${search_input}    ${value}
    Click Element    ${go_button}
    Unselect Frame
    Select Frame    ${result_frame}
    Wait Until Page Contains Element    //a[text() = "${value}"]    
    Click Element    //a[text() = "${value}"]
    Select Window    MAIN
    