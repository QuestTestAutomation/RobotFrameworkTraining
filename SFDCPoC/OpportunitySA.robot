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
Resource        ../SFDCPoC/Create Account Contact.robot


Suite Setup       Lightning Suite Setup
#Suite Teardown    Lightning Suite Teardown

*** Test Cases ***
ITQTC-XXXX - Create An Opportunity
    

*** Keywords ***
Create Contact Opportunity
    [Arguments]  ${ContactObjectId}
    