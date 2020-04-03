*** Settings ***
Resource    ../Resources/Commons/Global Setup.robot
Resource    ../Resources/SFDC POM/Login/Login.robot

*** Variables ***
${RUN_AS_USER}                Default


*** Keywords ***
Lightning Suite Setup
    Suite Setup
    Login To SFDC sandbox    experience=Lightning
    Run Keyword If    '${RUN_AS_USER}' is not 'Default'  Wait Until Keyword Succeeds	5x   2s   Lightning Login As    ${RUN_AS_USER}

    
Lightning Suite Teardown
    Close Browser
    Log    == TEST VARIABLES ==
    Log Variables
    