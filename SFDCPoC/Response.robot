*** Settings ***
Library     SeleniumLibrary    
Resource    ../Q2CAAT/Resources/SFDC POM/Lightning POM/Common Elements.robot
Resource        ../Q2CAAT/Resources/Commons/Global Setup.robot
Resource        ../Q2CAAT/Resources/SFDC POM/Login/Login.robot
Resource        ../Q2CAAT/Resources/SFDC POM/SFDC Navigation/Search and Open SFDC Objects.robot
Resource        ../Q2CAAT/Resources/SFDC POM/Lightning POM/App Launcher.robot
Resource        ../Q2CAAT/Resources/SFDC POM/Lightning POM/Navigation Bar.robot
Resource        ../Q2CAAT/Resources/SFDC POM/Lightning POM/Common Elements.robot
Resource        ../Q2CAAT/Resources/SFDC POM/Lightning POM/New Record Dialog.robot
Resource        ../Q2CAAT/Lightning Tests/Lightning Suite Commons.robot
Library         ../Q2CAAT/PythonLibs/Utillib.py  WITH NAME  utillib
Library         ../Q2CAAT/PythonLibs/SelUtil.py  WITH NAME  utillib1

Suite Setup       Lightning Suite Setup
#Suite Teardown    Lightning Suite Teardown




*** Test Cases ***
ITQTC-5024
    [Tags]  C1259812
    
    Simple Create Response  MQL
    #GoTo Object Tab    Responses
    #Open SFDC object by ID    a0x7A0000013TzQQA
    #Open SFDC object by ID    ${ResponseObjectId}
   
*** Keywords ***

Simple Create Response
    [Arguments]    ${type}=MQL    ${contact}=${EMPTY}     
    Go To Responses Tab
    Go To Create New Record Dialog    Response    ${type}  
    Run Keyword If    '${contact}' is not '${EMPTY}'   Select Value in LookUp   Contact    ${contact}
    Click Save Button
    Wait for New Object of type      Response 
    ${created object url}            Get Location
    Set Test Message                 Response created. URL: ${created object url} 