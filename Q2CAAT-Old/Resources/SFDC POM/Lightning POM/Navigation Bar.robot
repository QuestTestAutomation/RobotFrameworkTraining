*** Settings ***
Library     SeleniumLibrary
Resource    ../../Commons/Global Setup.robot
Resource    POM Workarounds.robot    

*** Variables ***
${nav bar loc}        //one-app-nav-bar//nav[@role="navigation"]



*** Keywords ***

Loc for Nav Bar Item
    [Arguments]     ${nav bar item name}
    ${loc}     Catenate   SEPARATOR=    //*[@one-appnavbar_appnavbar]//a[@title="${nav bar item name}"]
    [Return]    ${loc}


Select Nav Bar Item
    [Arguments]    ${nav bar item name}
    ${loc}                              Loc for Nav Bar Item    ${nav bar item name}
    Wait Until Page Contains Element    ${loc}    error=Nav bar item '${nav bar item name}' was not found
    Async JS Click    ${loc}
    Wait Until Page Contains Element    //div[@id="brandBand_1"]//*[.="${nav bar item name}"]   error='${nav bar item name}' page was not loaded

 