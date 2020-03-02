*** Settings ***
Library    SeleniumLibrary    

*** Variables ***
${app launcher title}        //div[contains(@class, 'appLauncherModalHeader')]//h2[.="App Launcher"]
${app launcher button}       //div[@class="bBottom"]//nav[@role="navigation"]//button[.="App Launcher"]


*** Keywords ***
Loc for App in Launcher
    [Arguments]    ${app name}
    ${loc}    Catenate    SEPARATOR=     //section[@id="cards"]//a[@id="appTile"][.="${app name}"]
    [Return]    ${loc}
    
Loc for Loaded App Name
    [Arguments]       ${app name}
    ${loc}    Catenate    SEPARATOR=    //one-appnav//span[contains(@class, "appName")]//span[.="${app name}"]
    [Return]    ${loc}


Open App
    [Arguments]    ${app name}
    Wait Until Page Contains Element                ${app launcher button}
    Click Element                                   ${app launcher button}
    Wait Until Page Contains Element                ${app launcher title} 
    ${app locator}                                  Loc for App in Launcher       ${app name}   
    Wait Until Page Contains Element                ${app locator}
    ${loaded app locator}                           Loc for Loaded App Name       ${app name}
    Click Element                                   ${app locator}
    Wait Until Page Contains Element                ${loaded app locator}
    sleep    2
                    

